# frozen_string_literal: true

require "ox"
require_relative "unicode"
require_relative "asciimath"
require_relative "omml"
require_relative "mathml"
require_relative "html"
require_relative "latex"
require_relative "unitsml"
require_relative "math/formula"
require_relative "math/function"
require_relative "math/number"
require_relative "math/symbol"
require_relative "asciimath/parser"
require_relative "mathml/parser"
require_relative "latex/parser"
require_relative "html/parser"
require_relative "omml/parser"
require_relative "utility"
module Plurimath
  module Math
    class Error < StandardError; end

    VALID_TYPES = {
      omml: Omml,
      html: Html,
      latex: Latex,
      mathml: Mathml,
      unitsml: Unitsml,
      unicode: Unicode,
      asciimath: Asciimath,
    }.freeze

    def parse(text, type)
      raise_error! unless valid_type?(type)

      klass = VALID_TYPES[type.to_sym]
      klass.new(text).to_formula
    end

    private

    def raise_error!
      raise Plurimath::Math::Error, Error.new("Type is not valid, "\
                                              "please enter string or symbol")
    end

    def valid_type?(type)
      (type.is_a?(Symbol) || type.is_a?(String)) &&
        VALID_TYPES.key?(type.to_sym)
    end

    module_function :parse, :raise_error!, :valid_type?
  end
end
