module Plurimath
  module Math
    module Symbols
      class Concavediamondtickright < Symbol
        INPUT = {
          unicodemath: [["&#x27e3;"], parsing_wrapper(["concavediamondtickright"])],
          asciimath: [["&#x27e3;"], parsing_wrapper(["concavediamondtickright"])],
          mathml: ["&#x27e3;"],
          latex: [["concavediamondtickright", "&#x27e3;"]],
          omml: ["&#x27e3;"],
          html: ["&#x27e3;"],
        }.freeze

        # output methods
        def to_latex
          "\\concavediamondtickright"
        end

        def to_asciimath
          parsing_wrapper("concavediamondtickright")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x27e3;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x27e3;"
        end

        def to_omml_without_math_tag(_)
          "&#x27e3;"
        end

        def to_html
          "&#x27e3;"
        end
      end
    end
  end
end
