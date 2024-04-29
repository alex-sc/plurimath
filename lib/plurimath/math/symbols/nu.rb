module Plurimath
  module Math
    module Symbols
      class Nu < Symbol
        INPUT = {
          unicodemath: [["nu", "&#x3bd;"], parsing_wrapper(["upnu"])],
          asciimath: [["nu", "&#x3bd;"], parsing_wrapper(["upnu"])],
          mathml: ["&#x3bd;"],
          latex: [["upnu", "nu", "&#x3bd;"]],
          omml: ["&#x3bd;"],
          html: ["&#x3bd;"],
        }.freeze

        # output methods
        def to_latex
          "\\nu"
        end

        def to_asciimath
          "nu"
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x3bd;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x3bd;"
        end

        def to_omml_without_math_tag(_)
          "&#x3bd;"
        end

        def to_html
          "&#x3bd;"
        end
      end
    end
  end
end
