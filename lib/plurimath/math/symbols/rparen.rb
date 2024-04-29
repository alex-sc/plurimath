module Plurimath
  module Math
    module Symbols
      class Rparen < Symbol
        INPUT = {
          unicodemath: [["&#x29;"], parsing_wrapper(["rparen"])],
          asciimath: [["&#x29;"], parsing_wrapper(["rparen"])],
          mathml: ["&#x29;"],
          latex: [["rparen", "&#x29;"]],
          omml: ["&#x29;"],
          html: ["&#x29;"],
        }.freeze

        # output methods
        def to_latex
          "\\rparen"
        end

        def to_asciimath
          parsing_wrapper("rparen")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x29;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x29;"
        end

        def to_omml_without_math_tag(_)
          "&#x29;"
        end

        def to_html
          "&#x29;"
        end
      end
    end
  end
end
