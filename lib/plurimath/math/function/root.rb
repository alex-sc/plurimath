# frozen_string_literal: true

require_relative "binary_function"

module Plurimath
  module Math
    module Function
      class Root < BinaryFunction
        def to_mathml_without_math_tag
          first_value = parameter_one&.to_mathml_without_math_tag
          second_value = parameter_two&.to_mathml_without_math_tag
          Utility.update_nodes(
            Utility.ox_element("mroot"),
            [
              second_value,
              first_value,
            ],
          )
        end

        def to_latex
          first_value = parameter_one&.to_latex
          second_value = parameter_two&.to_latex
          "\\sqrt[#{first_value}]{#{second_value}}"
        end

        def to_omml_without_math_tag
          rad_element = Utility.ox_element("rad", namespace: "m")
          pr_element  = Utility.ox_element("radPr", namespace: "m")
          Utility.update_nodes(
            rad_element,
            [
              (pr_element << Utility.pr_element("ctrl", true, namespace: "m")),
              omml_parameter(parameter_two, tag_name: "deg"),
              omml_parameter(parameter_one, tag_name: "e"),
            ],
          )
          [rad_element]
        end
      end
    end
  end
end
