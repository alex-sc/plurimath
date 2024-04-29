module Plurimath
  module Math
    module Symbols
      class Urarc < Symbol
        INPUT = {
          unicodemath: [["&#x25dd;"], parsing_wrapper(["urarc"])],
          asciimath: [["&#x25dd;"], parsing_wrapper(["urarc"])],
          mathml: ["&#x25dd;"],
          latex: [["urarc", "&#x25dd;"]],
          omml: ["&#x25dd;"],
          html: ["&#x25dd;"],
        }.freeze

        # output methods
        def to_latex
          "\\urarc"
        end

        def to_asciimath
          parsing_wrapper("urarc")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x25dd;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x25dd;"
        end

        def to_omml_without_math_tag(_)
          "&#x25dd;"
        end

        def to_html
          "&#x25dd;"
        end
      end
    end
  end
end
