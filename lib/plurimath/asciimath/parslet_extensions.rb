require "parslet"

class Parslet::Atoms::Base
  def min_length
    puts "min_length must be implemented in #{self.class}"
    exit!
  end
end

class Parslet::Atoms::Alternative < Parslet::Atoms::Base

  def initialize(*alternatives)
    super()

    # Order alternatives by min_length desc
    # TODO: safe?
    alternatives.sort_by! { |alt| -alt.min_length }
    @min_len = alternatives.last.min_length
    @alternatives = alternatives
  end

  def min_length
    @min_len
  end

  def try(source, context, consume_all)
    errors = alternatives.map { |a|
      next if source.chars_left < a.min_length

      success, value = result = a.apply(source, context, consume_all)
      return result if success

      # Aggregate all errors
      value
    }

    # If we reach this point, all alternatives have failed.
    context.err(self, source, error_msg, errors)
  end
end

class Parslet::Atoms::Sequence < Parslet::Atoms::Base
  def initialize(*parslets)
    super()

    @parslets = parslets
    @min_len = parslets.map(&:min_length).sum
  end

  def min_length
    @min_len
  end
end

class Parslet::Atoms::Str < Parslet::Atoms::Base
  def min_length
    @len
  end
end

class Parslet::Atoms::Named < Parslet::Atoms::Base
  def min_length
    @parslet.min_length
  end
end

class Parslet::Atoms::Repetition < Parslet::Atoms::Base
  def min_length
    return 0 if @min == 0
    @parslet.min_length * @min
  end
end

class Parslet::Atoms::Re < Parslet::Atoms::Base
  def min_length
    # TODO: is zero possible?
    # TODO?: we could try to detect if an expression requires > 1 symbol, but it's too much effort
    1
  end
end

class Parslet::Atoms::Dynamic < Parslet::Atoms::Base
  def min_length
    0
  end
end

class Parslet::Atoms::Capture < Parslet::Atoms::Base
  def min_length
    0
  end
end
