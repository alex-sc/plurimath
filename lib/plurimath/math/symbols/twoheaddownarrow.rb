module Plurimath
  module Math
    module Symbols
      class Twoheaddownarrow < Symbol
        INPUT = {
          unicodemath: [["&#x21a1;"], parsing_wrapper(["twoheaddownarrow"])],
          asciimath: [["&#x21a1;"], parsing_wrapper(["twoheaddownarrow"])],
          mathml: ["&#x21a1;"],
          latex: [["twoheaddownarrow", "&#x21a1;"]],
          omml: ["&#x21a1;"],
          html: ["&#x21a1;"],
        }.freeze

        # output methods
        def to_latex
          "\\twoheaddownarrow"
        end

        def to_asciimath
          parsing_wrapper("twoheaddownarrow")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x21a1;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x21a1;"
        end

        def to_omml_without_math_tag(_)
          "&#x21a1;"
        end

        def to_html
          "&#x21a1;"
        end
      end
    end
  end
end
