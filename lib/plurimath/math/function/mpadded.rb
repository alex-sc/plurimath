# frozen_string_literal: true

require_relative "unary_function"

module Plurimath
  module Math
    module Function
      class Mpadded < UnaryFunction
        attr_accessor :options
        ZERO_TAGS = {
          height: "zeroAsc",
          depth: "zeroDesc",
          width: "zeroWid",
        }

        def initialize(parameter_one = nil, options = {})
          super(parameter_one)
          @options = options unless options.empty?
        end

        def ==(object)
          super(object) &&
            object&.options == options
        end

        def to_asciimath
          asciimath_value
        end

        def to_latex
          latex_value
        end

        def to_mathml_without_math_tag(intent)
          Utility.update_nodes(
            ox_element(class_name, attributes: options),
            Array(mathml_value(intent)),
          )
        end

        def to_omml_without_math_tag(display_style)
          phant   = ox_element("phant", namespace: "m")
          phantpr = ox_element("phantPr", namespace: "m")
          Utility.update_nodes(phantpr, phant_pr)
          phant << phantpr unless phantpr.nodes.empty?

          phant << omml_parameter(parameter_one, display_style, tag_name: "e")
        end

        def to_unicodemath
          if options&.dig(:mpadded)
            "#{mpadded_unicode}#{unicodemath_parens(parameter_one)}"
          elsif options&.key?(:mask)
            "⟡(#{options.dig(:mask)}&#{parameter_one&.to_unicodemath})"
          else
            first_value = "(#{parameter_one.to_unicodemath})" if parameter_one
            "⟡#{first_value}"
          end
        end

        protected

        def phant_pr
          attributes = { "m:val": "on" }
          options.map do |atr, value|
            ox_element(ZERO_TAGS[atr], attributes: attributes) if attr_value_zero?(value)
          end
        end

        def attr_value_zero?(atr)
          !atr.match?(/[1-9]/) && atr.match?(/\d/)
        end

        def mpadded_symbol
          UnicodeMath::Constants::PHANTOM_SYMBOLS.key(options)
        end

        def mpadded_unicode
          UnicodeMath::Constants::UNARY_SYMBOLS[mpadded_symbol]
        end
      end
    end
  end
end
