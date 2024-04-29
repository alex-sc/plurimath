module Plurimath
  module Math
    module Symbols
      class Aplboxquestion < Symbol
        INPUT = {
          unicodemath: [["&#x2370;"], parsing_wrapper(["APLboxquestion"])],
          asciimath: [["&#x2370;"], parsing_wrapper(["APLboxquestion"])],
          mathml: ["&#x2370;"],
          latex: [["APLboxquestion", "&#x2370;"]],
          omml: ["&#x2370;"],
          html: ["&#x2370;"],
        }.freeze

        # output methods
        def to_latex
          "\\APLboxquestion"
        end

        def to_asciimath
          parsing_wrapper("APLboxquestion")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2370;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x2370;"
        end

        def to_omml_without_math_tag(_)
          "&#x2370;"
        end

        def to_html
          "&#x2370;"
        end
      end
    end
  end
end
