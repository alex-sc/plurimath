module Plurimath
  module Math
    module Symbols
      class Cdot < Symbol
        INPUT = {
          unicodemath: [["cdot", "&#x22c5;"], parsing_wrapper(["*"])],
          asciimath: [["cdot", "*", "&#x22c5;"]],
          mathml: ["&#x22c5;"],
          latex: [["cdot", "&#x22c5;"], parsing_wrapper(["*"])],
          omml: ["&#x22c5;"],
          html: ["&#x22c5;"],
        }.freeze

        # output methods
        def to_latex
          "\\cdot"
        end

        def to_asciimath
          "*"
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x22c5;")
        end

        def to_mathml_without_math_tag
          ox_element("mo") << "&#x22c5;"
        end

        def to_omml_without_math_tag(_)
          "&#x22c5;"
        end

        def to_html
          "&#x22c5;"
        end
      end
    end
  end
end
