module Plurimath
  module Math
    module Symbols
      class Smallni < Symbol
        INPUT = {
          unicodemath: [["&#x220d;"], parsing_wrapper(["smallni"])],
          asciimath: [["&#x220d;"], parsing_wrapper(["smallni"])],
          mathml: ["&#x220d;"],
          latex: [["smallni", "&#x220d;"]],
          omml: ["&#x220d;"],
          html: ["&#x220d;"],
        }.freeze

        # output methods
        def to_latex
          "\\smallni"
        end

        def to_asciimath
          parsing_wrapper("smallni")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x220d;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x220d;"
        end

        def to_omml_without_math_tag(_)
          "&#x220d;"
        end

        def to_html
          "&#x220d;"
        end
      end
    end
  end
end
