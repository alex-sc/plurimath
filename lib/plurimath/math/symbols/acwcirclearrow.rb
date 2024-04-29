module Plurimath
  module Math
    module Symbols
      class Acwcirclearrow < Symbol
        INPUT = {
          unicodemath: [["&#x2940;"], parsing_wrapper(["acwcirclearrow"])],
          asciimath: [["&#x2940;"], parsing_wrapper(["acwcirclearrow"])],
          mathml: ["&#x2940;"],
          latex: [["acwcirclearrow", "&#x2940;"]],
          omml: ["&#x2940;"],
          html: ["&#x2940;"],
        }.freeze

        # output methods
        def to_latex
          "\\acwcirclearrow"
        end

        def to_asciimath
          parsing_wrapper("acwcirclearrow")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2940;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x2940;"
        end

        def to_omml_without_math_tag(_)
          "&#x2940;"
        end

        def to_html
          "&#x2940;"
        end
      end
    end
  end
end
