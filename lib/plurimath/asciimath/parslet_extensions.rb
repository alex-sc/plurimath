require "parslet"

module Parslet
  class Source
    def lookahead?(pattern)
      @str.match?(pattern)
    end
  end
end

class Parslet::Atoms::Base
  def lookahead?(source)
    # Assume lookup is successful by default
    # Override in child classes by need
    true
  end
end

class Parslet::Atoms::Alternative < Parslet::Atoms::Base
  def lookahead?(source)
    # We need to stop the recursive lookahead at some point, otherwise it might go too deep
    true
  end

  def try(source, context, consume_all)
    alternatives.map { |a|
      # Instead of entering the more expensive apply() method,
      # we attempt to look ahead and continue to the next alternative if there's no match
      # The `Constants.precompile_constants` alternative has over 3k options
      next unless a.lookahead?(source)

      success, _ = result = a.apply(source, context, consume_all)
      return result if success
    }

    # If we reach this point, all alternatives have failed.
    context.err(self, source, error_msg)
  end

  precedence ALTERNATE
  def to_s_inner(prec)
    # Don't dump all the alternatives, it takes too much time
    limit = 5
    items = alternatives.first(limit)
                        .map { |a| "#{a.class}[#{a.to_s(prec).gsub("\n", " ")}]" }
                        .join(' / ')

    if alternatives.size > limit
      items += " and (#{alternatives.size - limit}) more"
    end

    items
  end
end

class Parslet::Atoms::Sequence < Parslet::Atoms::Base
  def lookahead?(source)
    parslets[0].lookahead?(source)
  end

  def try(source, context, consume_all)
    # Lazy init array
    result = nil

    parslets.each_with_index do |p, idx|
      unless p.lookahead?(source)
        return context.err(self, source, error_msgs[:failed])
      end

      child_consume_all = consume_all && (idx == parslets.size-1)
      success, value = p.apply(source, context, child_consume_all)

      unless success
        return context.err(self, source, error_msgs[:failed])
      end

      if result.nil?
        result = Array.new(parslets.size + 1)
        result[0] = :sequence
      end
      result[idx+1] = value
    end

    succ(result)
  end
end

class Parslet::Atoms::Str < Parslet::Atoms::Base
  def lookahead?(source)
    source.lookahead?(@pat)
  end
end

class Parslet::Atoms::Named < Parslet::Atoms::Base
  def lookahead?(source)
    @parslet.lookahead?(source)
  end
end

class Parslet::Atoms::Lookahead < Parslet::Atoms::Base
  def lookahead?(source)
    return @bound_parslet.lookahead?(source) if @positive
    # negative case covered below
    true
  end

  def try(source, context, consume_all)
    rewind_pos  = source.bytepos
    error_pos   = source.pos

    # Exit early for non-match
    if not positive and not bound_parslet.lookahead?(source)
      return succ(nil)
    end

    success, _ = bound_parslet.apply(source, context, consume_all)

    if positive
      return succ(nil) if success
      return context.err_at(self, source, error_msgs[:positive], error_pos)
    else
      return succ(nil) unless success
      return context.err_at(self, source, error_msgs[:negative], error_pos)
    end

    # This is probably the only parslet that rewinds its input in #try.
    # Lookaheads NEVER consume their input, even on success, that's why.
  ensure
    source.bytepos = rewind_pos
  end
end

class Parslet::Atoms::Entity < Parslet::Atoms::Base
  def lookahead?(source)
    @parslet.lookahead?(source) if @parslet
    true
  end
end

class Parslet::Atoms::Re < Parslet::Atoms::Base
  def lookahead?(source)
    source.lookahead?(@re)
  end
end

class Parslet::Atoms::Repetition < Parslet::Atoms::Base
  def lookahead?(source)
    return true if @min == 0
    @parslet.lookahead?(source)
  end
end
