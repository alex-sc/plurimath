module Plurimath
  module Math
    module Symbols
      class Zwnj < Symbol
        INPUT = {
          unicodemath: [["zwnj", "&#x200c;"]],
          asciimath: [["&#x200c;"], parsing_wrapper(["zwnj"])],
          mathml: ["&#x200c;"],
          latex: [["&#x200c;"], parsing_wrapper(["zwnj"])],
          omml: ["&#x200c;"],
          html: ["&#x200c;"],
        }.freeze

        # output methods
        def to_latex
          parsing_wrapper("zwnj")
        end

        def to_asciimath
          parsing_wrapper("zwnj")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x200c;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x200c;"
        end

        def to_omml_without_math_tag(_)
          "&#x200c;"
        end

        def to_html
          "&#x200c;"
        end
      end
    end
  end
end
