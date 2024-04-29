module Plurimath
  module Math
    module Symbols
      class Hyphenbullet < Symbol
        INPUT = {
          unicodemath: [["&#x2043;"], parsing_wrapper(["hyphenbullet"])],
          asciimath: [["&#x2043;"], parsing_wrapper(["hyphenbullet"])],
          mathml: ["&#x2043;"],
          latex: [["hyphenbullet", "&#x2043;"]],
          omml: ["&#x2043;"],
          html: ["&#x2043;"],
        }.freeze

        # output methods
        def to_latex
          "\\hyphenbullet"
        end

        def to_asciimath
          parsing_wrapper("hyphenbullet")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x2043;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x2043;"
        end

        def to_omml_without_math_tag(_)
          "&#x2043;"
        end

        def to_html
          "&#x2043;"
        end
      end
    end
  end
end
