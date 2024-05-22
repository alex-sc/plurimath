module Plurimath
  module Math
    module Symbols
      class Egsdot < Symbol
        INPUT = {
          unicodemath: [["&#x2a98;"], parsing_wrapper(["egsdot"])],
          asciimath: [["&#x2a98;"], parsing_wrapper(["egsdot"])],
          mathml: ["&#x2a98;"],
          latex: [["egsdot", "&#x2a98;"]],
          omml: ["&#x2a98;"],
          html: ["&#x2a98;"],
        }.freeze

        # output methods
        def to_latex
          "\\egsdot"
        end

        def to_asciimath
          parsing_wrapper("egsdot")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2a98;")
        end

        def to_mathml_without_math_tag(_)
          ox_element("mi") << "&#x2a98;"
        end

        def to_omml_without_math_tag(_)
          "&#x2a98;"
        end

        def to_html
          "&#x2a98;"
        end
      end
    end
  end
end
