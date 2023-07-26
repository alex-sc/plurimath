# frozen_string_literal: true

require_relative "unary_function"

module Plurimath
  module Math
    module Function
      class Sqrt < UnaryFunction
        def to_mathml_without_math_tag
          sqrt_tag = Utility.ox_element("msqrt")
          first_value = parameter_one&.to_mathml_without_math_tag
          sqrt_tag << first_value if first_value
          sqrt_tag
        end

        def to_omml_without_math_tag
          rad_element = Utility.ox_element("rad", namespace: "m")
          pr_element = Utility.ox_element("radPr", namespace: "m")
          pr_element << Utility.ox_element(
            "degHide",
            namespace: "m",
            attributes: { "m:val": "1" },
          )
          Utility.update_nodes(
            rad_element,
            [
              (pr_element << Utility.pr_element("ctrl", true, namespace: "m")),
              Utility.ox_element("deg", namespace: "m"),
              omml_parameter(parameter_one, tag_name: "e"),
            ],
          )
          [rad_element]
        end
      end
    end
  end
end
