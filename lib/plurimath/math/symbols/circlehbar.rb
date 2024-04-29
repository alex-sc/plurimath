module Plurimath
  module Math
    module Symbols
      class Circlehbar < Symbol
        INPUT = {
          unicodemath: [["&#x29b5;"], parsing_wrapper(["circlehbar"])],
          asciimath: [["&#x29b5;"], parsing_wrapper(["circlehbar"])],
          mathml: ["&#x29b5;"],
          latex: [["circlehbar", "&#x29b5;"]],
          omml: ["&#x29b5;"],
          html: ["&#x29b5;"],
        }.freeze

        # output methods
        def to_latex
          "\\circlehbar"
        end

        def to_asciimath
          parsing_wrapper("circlehbar")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x29b5;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x29b5;"
        end

        def to_omml_without_math_tag(_)
          "&#x29b5;"
        end

        def to_html
          "&#x29b5;"
        end
      end
    end
  end
end
