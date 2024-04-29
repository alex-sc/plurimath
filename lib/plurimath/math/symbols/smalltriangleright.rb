module Plurimath
  module Math
    module Symbols
      class Smalltriangleright < Symbol
        INPUT = {
          unicodemath: [["&#x25b9;"], parsing_wrapper(["smalltriangleright"])],
          asciimath: [["&#x25b9;"], parsing_wrapper(["smalltriangleright"])],
          mathml: ["&#x25b9;"],
          latex: [["smalltriangleright", "&#x25b9;"]],
          omml: ["&#x25b9;"],
          html: ["&#x25b9;"],
        }.freeze

        # output methods
        def to_latex
          "\\smalltriangleright"
        end

        def to_asciimath
          parsing_wrapper("smalltriangleright")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x25b9;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x25b9;"
        end

        def to_omml_without_math_tag(_)
          "&#x25b9;"
        end

        def to_html
          "&#x25b9;"
        end
      end
    end
  end
end
