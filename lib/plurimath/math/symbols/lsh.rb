module Plurimath
  module Math
    module Symbols
      class Lsh < Symbol
        INPUT = {
          unicodemath: [["&#x21b0;"], parsing_wrapper(["Lsh"])],
          asciimath: [["&#x21b0;"], parsing_wrapper(["Lsh"])],
          mathml: ["&#x21b0;"],
          latex: [["Lsh", "&#x21b0;"]],
          omml: ["&#x21b0;"],
          html: ["&#x21b0;"],
        }.freeze

        # output methods
        def to_latex
          "\\Lsh"
        end

        def to_asciimath
          parsing_wrapper("Lsh")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x21b0;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x21b0;"
        end

        def to_omml_without_math_tag(_)
          "&#x21b0;"
        end

        def to_html
          "&#x21b0;"
        end
      end
    end
  end
end
