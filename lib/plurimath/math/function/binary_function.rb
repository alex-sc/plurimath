# frozen_string_literal: true

module Plurimath
  module Math
    module Function
      class BinaryFunction < Core
        attr_accessor :parameter_one, :parameter_two

        def initialize(parameter_one = nil, parameter_two = nil)
          @parameter_one = parameter_one
          @parameter_two = parameter_two
          Utility.validate_left_right([parameter_one, parameter_two])
        end

        def to_asciimath
          "#{class_name}#{wrapped(parameter_one)}#{wrapped(parameter_two)}"
        end

        def ==(object)
          object.class == self.class &&
            object.parameter_one == parameter_one &&
            object.parameter_two == parameter_two
        end

        def to_mathml_without_math_tag
          mrow_tag = Utility.ox_element("mrow")
          mo_tag = Utility.ox_element("mo") << invert_unicode_symbols.to_s
          first_value = parameter_one&.to_mathml_without_math_tag if parameter_one
          second_value = parameter_two&.to_mathml_without_math_tag if parameter_two
          Utility.update_nodes(
            mrow_tag,
            [
              first_value,
              mo_tag,
              second_value,
            ],
          )
        end

        def to_latex
          first_value = latex_wrapped(parameter_one) if parameter_one
          second_value = latex_wrapped(parameter_two) if parameter_two
          "\\#{class_name}#{first_value}#{second_value}"
        end

        def to_html
          first_value = "<i>#{parameter_one.to_html}</i>" if parameter_one
          second_value = "<i>#{parameter_two.to_html}</i>" if parameter_two
          "#{first_value}#{second_value}"
        end

        def to_omml_without_math_tag(display_style)
          r_tag = Utility.ox_element("r", namespace: "m")
          Utility.update_nodes(r_tag, [parameter_one.insert_t_tag(display_style)]) if parameter_one
          Utility.update_nodes(r_tag, [parameter_two.insert_t_tag(display_style)]) if parameter_two
          [r_tag]
        end

        def any_value_exist?
          !(parameter_one.nil? || parameter_two.nil?)
        end

        def all_values_exist?
          !(parameter_one.nil? && parameter_two.nil?)
        end

        protected

        def latex_wrapped(field)
          if field.validate_function_formula
            "{ \\left ( #{field.to_latex} \\right ) }"
          else
            "{#{field.to_latex}}"
          end
        end

        def wrapped(field)
          return "" unless field

          "(#{field.to_asciimath})"
        end

        def invert_unicode_symbols
          Mathml::Constants::UNICODE_SYMBOLS.invert[class_name] || class_name
        end

        def empty_tag(wrapper_tag)
          r_tag = Utility.ox_element("r", namespace: "m")
          r_tag << (Utility.ox_element("t", namespace: "m") << "&#8203;")
          wrapper_tag << r_tag
        end

        def underover(display_style)
          return r_element(class_name, rpr_tag: false) unless all_values_exist?

          first_value = Symbol.new(class_name)
          if !display_style
            power_base = PowerBase.new(first_value, parameter_one, parameter_two)
            return power_base.to_omml_without_math_tag(display_style)
          end

          overset = Overset.new(first_value, parameter_two)
          return Array(overset.to_omml_without_math_tag(display_style)) unless parameter_one

          underset = Underset.new(overset, parameter_one)
          Array(underset.to_omml_without_math_tag(display_style))
        end
      end
    end
  end
end
