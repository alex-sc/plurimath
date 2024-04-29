module Plurimath
  module Math
    module Symbols
      class Urblacktriangle < Symbol
        INPUT = {
          unicodemath: [["&#x25e5;"], parsing_wrapper(["urblacktriangle"])],
          asciimath: [["&#x25e5;"], parsing_wrapper(["urblacktriangle"])],
          mathml: ["&#x25e5;"],
          latex: [["urblacktriangle", "&#x25e5;"]],
          omml: ["&#x25e5;"],
          html: ["&#x25e5;"],
        }.freeze

        # output methods
        def to_latex
          "\\urblacktriangle"
        end

        def to_asciimath
          parsing_wrapper("urblacktriangle")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x25e5;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x25e5;"
        end

        def to_omml_without_math_tag(_)
          "&#x25e5;"
        end

        def to_html
          "&#x25e5;"
        end
      end
    end
  end
end
