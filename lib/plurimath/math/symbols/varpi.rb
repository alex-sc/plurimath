module Plurimath
  module Math
    module Symbols
      class Varpi < Symbol
        INPUT = {
          unicodemath: [["varpi", "&#x3d6;"], parsing_wrapper(["upvarpi"])],
          asciimath: [["&#x3d6;"], parsing_wrapper(["varpi", "upvarpi"])],
          mathml: ["&#x3d6;"],
          latex: [["upvarpi", "varpi", "&#x3d6;"]],
          omml: ["&#x3d6;"],
          html: ["&#x3d6;"],
        }.freeze

        # output methods
        def to_latex
          "\\upvarpi"
        end

        def to_asciimath
          parsing_wrapper("varpi")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x3d6;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x3d6;"
        end

        def to_omml_without_math_tag(_)
          "&#x3d6;"
        end

        def to_html
          "&#x3d6;"
        end
      end
    end
  end
end
