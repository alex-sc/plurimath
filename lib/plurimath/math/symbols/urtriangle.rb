module Plurimath
  module Math
    module Symbols
      class Urtriangle < Symbol
        INPUT = {
          unicodemath: [["&#x25f9;"], parsing_wrapper(["urtriangle"])],
          asciimath: [["&#x25f9;"], parsing_wrapper(["urtriangle"])],
          mathml: ["&#x25f9;"],
          latex: [["urtriangle", "&#x25f9;"]],
          omml: ["&#x25f9;"],
          html: ["&#x25f9;"],
        }.freeze

        # output methods
        def to_latex
          "\\urtriangle"
        end

        def to_asciimath
          parsing_wrapper("urtriangle")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x25f9;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x25f9;"
        end

        def to_omml_without_math_tag(_)
          "&#x25f9;"
        end

        def to_html
          "&#x25f9;"
        end
      end
    end
  end
end
