module Plurimath
  module Math
    module Symbols
      class Eqvparsl < Symbol
        INPUT = {
          unicodemath: [["&#x29e5;"], parsing_wrapper(["eqvparsl"])],
          asciimath: [["&#x29e5;"], parsing_wrapper(["eqvparsl"])],
          mathml: ["&#x29e5;"],
          latex: [["eqvparsl", "&#x29e5;"]],
          omml: ["&#x29e5;"],
          html: ["&#x29e5;"],
        }.freeze

        # output methods
        def to_latex
          "\\eqvparsl"
        end

        def to_asciimath
          parsing_wrapper("eqvparsl")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x29e5;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x29e5;"
        end

        def to_omml_without_math_tag(_)
          "&#x29e5;"
        end

        def to_html
          "&#x29e5;"
        end
      end
    end
  end
end
