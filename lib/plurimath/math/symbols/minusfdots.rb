module Plurimath
  module Math
    module Symbols
      class Minusfdots < Symbol
        INPUT = {
          unicodemath: [["&#x2a2b;"], parsing_wrapper(["minusfdots"])],
          asciimath: [["&#x2a2b;"], parsing_wrapper(["minusfdots"])],
          mathml: ["&#x2a2b;"],
          latex: [["minusfdots", "&#x2a2b;"]],
          omml: ["&#x2a2b;"],
          html: ["&#x2a2b;"],
        }.freeze

        # output methods
        def to_latex
          "\\minusfdots"
        end

        def to_asciimath
          parsing_wrapper("minusfdots")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2a2b;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x2a2b;"
        end

        def to_omml_without_math_tag(_)
          "&#x2a2b;"
        end

        def to_html
          "&#x2a2b;"
        end
      end
    end
  end
end
