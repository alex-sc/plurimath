# frozen_string_literal: true

require_relative "ternary_function"

module Plurimath
  module Math
    module Function
      class Sum < TernaryFunction
        FUNCTION = {
          name: "summation",
          first_value: "subscript",
          second_value: "supscript",
          third_value: "term",
        }.freeze

        def to_asciimath
          first_value = "_#{wrapped(parameter_one)}" if parameter_one
          second_value = "^#{wrapped(parameter_two)}" if parameter_two
          "sum#{first_value}#{second_value} #{parameter_three&.to_asciimath}".strip
        end

        def to_latex
          first_value = "_{#{parameter_one.to_latex}}" if parameter_one
          second_value = "^{#{parameter_two.to_latex}}" if parameter_two
          "\\sum#{first_value}#{second_value} #{parameter_three&.to_latex}".strip
        end

        def to_mathml_without_math_tag
          first_value = Utility.ox_element("mo") << invert_unicode_symbols.to_s
          return first_value unless parameter_one || parameter_two

          value_array = [parameter_one&.to_mathml_without_math_tag]
          value_array << parameter_two&.to_mathml_without_math_tag
          tag_name = if parameter_two && parameter_one
                       "underover"
                     else
                       parameter_one ? "under" : "over"
                     end
          munderover_tag = Utility.ox_element("m#{tag_name}")
          Utility.update_nodes(munderover_tag, value_array.insert(0, first_value))
          return munderover_tag if parameter_three.nil?

          Utility.update_nodes(
            Utility.ox_element("mrow"),
            [
              munderover_tag,
              parameter_three&.to_mathml_without_math_tag,
            ].flatten.compact,
          )
        end

        def to_html
          first_value = "<sub>#{parameter_one.to_html}</sub>" if parameter_one
          second_value = "<sup>#{parameter_two.to_html}</sup>" if parameter_two
          "<i>&sum;</i>#{first_value}#{second_value}"
        end

        def to_omml_without_math_tag(display_style)
          return r_element("&#x2211;", rpr_tag: false) unless all_values_exist?

          nary = Utility.ox_element("nary", namespace: "m")
          Utility.update_nodes(
            nary,
            [
              narypr("∑"),
              omml_parameter(parameter_one, display_style, tag_name: "sub"),
              omml_parameter(parameter_two, display_style, tag_name: "sup"),
              omml_parameter(parameter_three, display_style, tag_name: "e"),
            ],
          )
          [nary]
        end

        def omml_tag_name
          "undOvr"
        end

        def nary_attr_value
          "∑"
        end
      end
    end
  end
end
