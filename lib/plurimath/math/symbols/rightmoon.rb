module Plurimath
  module Math
    module Symbols
      class Rightmoon < Symbol
        INPUT = {
          unicodemath: [["&#x263d;"], parsing_wrapper(["rightmoon"])],
          asciimath: [["&#x263d;"], parsing_wrapper(["rightmoon"])],
          mathml: ["&#x263d;"],
          latex: [["rightmoon", "&#x263d;"]],
          omml: ["&#x263d;"],
          html: ["&#x263d;"],
        }.freeze

        # output methods
        def to_latex
          "\\rightmoon"
        end

        def to_asciimath
          parsing_wrapper("rightmoon")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x263d;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x263d;"
        end

        def to_omml_without_math_tag(_)
          "&#x263d;"
        end

        def to_html
          "&#x263d;"
        end
      end
    end
  end
end
