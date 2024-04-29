module Plurimath
  module Math
    module Symbols
      class Oiint < Symbol
        INPUT = {
          unicodemath: [["&#x222f;"], parsing_wrapper(["dbloint", "oiint"])],
          asciimath: [["&#x222f;"], parsing_wrapper(["dbloint", "oiint"])],
          mathml: ["&#x222f;"],
          latex: [["dbloint", "oiint", "&#x222f;"]],
          omml: ["&#x222f;"],
          html: ["&#x222f;"],
        }.freeze

        # output methods
        def to_latex
          "\\dbloint"
        end

        def to_asciimath
          parsing_wrapper("oiint")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x222f;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x222f;"
        end

        def to_omml_without_math_tag(_)
          "&#x222f;"
        end

        def to_html
          "&#x222f;"
        end

        def is_nary_symbol?
          true
        end
      end
    end
  end
end
