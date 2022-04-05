# frozen_string_literal: true

require_relative "math"
module Plurimath
  class Asciimath
    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def to_formula
      @text = Plurimath::Asciimath::Parser.new(text).parse
    end
  end
end
