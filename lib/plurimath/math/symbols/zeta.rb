module Plurimath
  module Math
    module Symbols
      class Zeta < Symbol
        INPUT = {
          unicodemath: [["zeta", "&#x3b6;"], parsing_wrapper(["upzeta"])],
          asciimath: [["zeta", "&#x3b6;"], parsing_wrapper(["upzeta"])],
          mathml: ["&#x3b6;"],
          latex: [["upzeta", "zeta", "&#x3b6;"]],
          omml: ["&#x3b6;"],
          html: ["&#x3b6;"],
        }.freeze

        # output methods
        def to_latex
          "\\zeta"
        end

        def to_asciimath
          "zeta"
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x3b6;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x3b6;"
        end

        def to_omml_without_math_tag(_)
          "&#x3b6;"
        end

        def to_html
          "&#x3b6;"
        end
      end
    end
  end
end
