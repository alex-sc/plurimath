module Plurimath
  module Math
    module Symbols
      class Veeonvee < Symbol
        INPUT = {
          unicodemath: [["&#x2a56;"], parsing_wrapper(["veeonvee"])],
          asciimath: [["&#x2a56;"], parsing_wrapper(["veeonvee"])],
          mathml: ["&#x2a56;"],
          latex: [["veeonvee", "&#x2a56;"]],
          omml: ["&#x2a56;"],
          html: ["&#x2a56;"],
        }.freeze

        # output methods
        def to_latex
          "\\veeonvee"
        end

        def to_asciimath
          parsing_wrapper("veeonvee")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2a56;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x2a56;"
        end

        def to_omml_without_math_tag(_)
          "&#x2a56;"
        end

        def to_html
          "&#x2a56;"
        end
      end
    end
  end
end
