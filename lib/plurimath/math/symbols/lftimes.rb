module Plurimath
  module Math
    module Symbols
      class Lftimes < Symbol
        INPUT = {
          unicodemath: [["&#x29d4;"], parsing_wrapper(["lftimes"])],
          asciimath: [["&#x29d4;"], parsing_wrapper(["lftimes"])],
          mathml: ["&#x29d4;"],
          latex: [["lftimes", "&#x29d4;"]],
          omml: ["&#x29d4;"],
          html: ["&#x29d4;"],
        }.freeze

        # output methods
        def to_latex
          "\\lftimes"
        end

        def to_asciimath
          parsing_wrapper("lftimes")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x29d4;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x29d4;"
        end

        def to_omml_without_math_tag(_)
          "&#x29d4;"
        end

        def to_html
          "&#x29d4;"
        end
      end
    end
  end
end
