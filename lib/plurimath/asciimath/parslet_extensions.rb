require "parslet"

module Parslet
  class Source
    def lookahead?(pattern)
      # puts "Check #{pattern} vs #{@orig_str[@str.rest_size..]}"
      @str.match?(pattern)
    end
  end
end

class Parslet::Atoms::Base
  def lookahead?(source)
    puts "lookahead must be implemented in #{self.class}"
    exit!
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
      #puts "Trying out of #{alternatives.length}, min=#{a.min_length}"

      success, _ = result = a.apply(source, context, consume_all)
      return result if success
    }

    # If we reach this point, all alternatives have failed.
    context.err(self, source, error_msg)
  end

  precedence ALTERNATE
  def to_s_inner(prec)
    # Don't dump all the alnernatives, it takes too much time
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
end

class Parslet::Atoms::Str < Parslet::Atoms::Base
  def lookahead?(source)
    source.lookahead?(@pat)
  end
end

class Parslet::Atoms::Named < Parslet::Atoms::Base
  def lookahead?(source)
    parslet.lookahead?(source)
  end
end

class Parslet::Atoms::Repetition < Parslet::Atoms::Base
  def lookahead?(source)
    true if @min == 0
    # TODO: contains latex equation #171
    # parslet.lookahead?(source)
    true
  end
end

class Parslet::Atoms::Re < Parslet::Atoms::Base
  def lookahead?(source)
    # TODO: regression on "jcgm example #4"
    #source.lookahead(@re)
    true
  end
end

class Parslet::Atoms::Dynamic < Parslet::Atoms::Base
  def lookahead?(source)
    # TODO?
    true
  end
end

class Parslet::Atoms::Capture < Parslet::Atoms::Base
  def lookahead?(source)
    # TODO?
    true
  end
end

class Parslet::Atoms::Entity < Parslet::Atoms::Base
  def lookahead?(source)
    # TODO: contains latex equation #171
    # ret = parslet.lookahead(source)
    # ret if ret != nil
    true
  end
end

class Parslet::Atoms::Lookahead < Parslet::Atoms::Base
  def lookahead?(source)
    true
  end
end
