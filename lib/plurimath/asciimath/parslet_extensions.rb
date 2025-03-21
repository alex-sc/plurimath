require "parslet"

module Parslet
  class Source
    def lookahead(pattern)
      # puts "Check #{pattern} vs #{@orig_str[@str.rest_size..]}"
      @str.match?(pattern)
    end
  end
end

class Parslet::Atoms::Base
  def min_length
    puts "min_length must be implemented in #{self.class}"
    exit!
  end

  def lookahead(source)
    puts "lookahead must be implemented in #{self.class}"
    exit!
  end
end

class Parslet::Atoms::Alternative < Parslet::Atoms::Base

  def initialize(*alternatives)
    super()
    if alternatives.size == 3329
      #puts caller
      #exit!
      puts alternatives.size
      alternatives.each_index do |i|
        puts "#{i+1}. #{alternatives[i].class} #{alternatives[i].inspect}"
      end
    end

    @alternatives = alternatives
  end

  def |(parslet)
    self.class.new(*@alternatives + [parslet])
  end

  def min_length
    @min_len if @min_len
    @min_len = @alternatives.map(&:min_length).min
  end

  def lookahead(source)
    true
  end

  def try(source, context, consume_all)
    alternatives.map { |a|
      next if source.chars_left < a.min_length || not a.lookahead(source)
      #puts "Trying out of #{alternatives.length}, min=#{a.min_length}"

      success, _ = result = a.apply(source, context, consume_all)
      return result if success
    }

    # If we reach this point, all alternatives have failed.
    context.err(self, source, error_msg)
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

  def lookahead(source)
    parslets[0].lookahead(source)
  end
end

class Parslet::Atoms::Str < Parslet::Atoms::Base
  def min_length
    @len
  end

  def lookahead(source)
    source.lookahead(@pat)
  end
end

class Parslet::Atoms::Named < Parslet::Atoms::Base
  def min_length
    @parslet.min_length
  end

  def lookahead(source)
    parslet.lookahead(source)
  end
end

class Parslet::Atoms::Repetition < Parslet::Atoms::Base
  def min_length
    return 0 if @min == 0
    @parslet.min_length * @min
  end

  def lookahead(source)
    true if @min == 0
    parslet.lookahead(source)
  end
end

class Parslet::Atoms::Re < Parslet::Atoms::Base
  def min_length
    # TODO: is zero possible?
    # TODO?: we could try to detect if an expression requires > 1 symbol, but it's too much effort
    1
  end

  def lookahead(source)
    source.lookahead(@re)
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

class Parslet::Atoms::Entity < Parslet::Atoms::Base
  def lookahead(source)
    @parslet.lookahead(source) if @parslet
    true
  end
end

class Parslet::Atoms::Lookahead < Parslet::Atoms::Base
  def lookahead(source)
    true
  end
end
