# frozen_string_literal: true

require_relative "unary_function"

module Plurimath
  module Math
    module Function
      class Vec < UnaryFunction
        attr_accessor :attributes

        def initialize(parameter_one = nil, attributes = {})
          super(parameter_one)
          @attributes = attributes
        end

        def to_mathml_without_math_tag
          mover = Utility.ox_element("mover")
          first_value = parameter_one&.to_mathml_without_math_tag
          mover.attributes.merge!({ accent: attributes[:accent] }) if attributes && attributes[:accent]
          Utility.update_nodes(
            mover,
            [
              first_value,
              Utility.ox_element("mo") << "&#x2192;",
            ],
          )
        end

        def to_omml_without_math_tag(display_style)
          return r_element("&#x2192;", rpr_tag: false) unless parameter_one

          if attributes && attributes[:accent]
            acc_tag(display_style)
          else
            symbol = Symbol.new("→")
            Overset.new(parameter_one, symbol).to_omml_without_math_tag(true)
          end
        end

        protected

        def acc_tag(display_style)
          acc_tag    = Utility.ox_element("acc", namespace: "m")
          acc_pr_tag = Utility.ox_element("accPr", namespace: "m")
          acc_pr_tag << (Utility.ox_element("chr", namespace: "m", attributes: { "m:val": "→" }))
          Utility.update_nodes(
            acc_tag,
            [
              acc_pr_tag,
              omml_parameter(parameter_one, display_style, tag_name: "e"),
            ],
          )
          [acc_tag]
        end
      end
    end
  end
end
