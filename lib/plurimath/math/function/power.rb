# frozen_string_literal: true

require_relative "binary_function"

module Plurimath
  module Math
    module Function
      class Power < BinaryFunction
        def to_asciimath
          first_value  = parameter_one.to_asciimath if parameter_one
          second_value = "^#{wrapped(parameter_two)}" if parameter_two
          "#{first_value}#{second_value}"
        end

        def to_mathml_without_math_tag
          sup_tag      = Utility.ox_element("msup")
          first_value  = parameter_one.to_mathml_without_math_tag
          second_value = parameter_two.to_mathml_without_math_tag
          Utility.update_nodes(
            sup_tag,
            [
              first_value,
              second_value,
            ],
          )
        end

        def to_latex
          first_value = parameter_one.to_latex if parameter_one
          first_value  = "{#{first_value}}" if parameter_one.is_a?(Formula)
          second_value = parameter_two.to_latex
          "#{first_value}^{#{second_value}}"
        end

        def to_html
          first_value  = "<i>#{parameter_one.to_html}</i>" if parameter_one
          second_value = "<sup>#{parameter_two.to_html}</sup>" if parameter_two
          "#{first_value}#{second_value}"
        end

        def to_omml_without_math_tag
          ssup_element  = Utility.ox_element("sSup", namespace: "m")
          suppr_element = Utility.ox_element("sSupPr", namespace: "m")
          e_element     = Utility.ox_element("e", namespace: "m")
          sup_element   = Utility.ox_element("sup", namespace: "m")
          Utility.update_nodes(
            ssup_element,
            [
              suppr_element << Utility.pr_element("ctrl", true, namespace: "m"),
              e_element << parameter_one.to_omml_without_math_tag,
              sup_element << parameter_two.to_omml_without_math_tag,
            ],
          )
          ssup_element
        end
      end
    end
  end
end
