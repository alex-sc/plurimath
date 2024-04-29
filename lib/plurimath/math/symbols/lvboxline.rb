module Plurimath
  module Math
    module Symbols
      class Lvboxline < Symbol
        INPUT = {
          unicodemath: [["&#x23b8;"], parsing_wrapper(["lvboxline"])],
          asciimath: [["&#x23b8;"], parsing_wrapper(["lvboxline"])],
          mathml: ["&#x23b8;"],
          latex: [["lvboxline", "&#x23b8;"]],
          omml: ["&#x23b8;"],
          html: ["&#x23b8;"],
        }.freeze

        # output methods
        def to_latex
          "\\lvboxline"
        end

        def to_asciimath
          parsing_wrapper("lvboxline")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x23b8;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x23b8;"
        end

        def to_omml_without_math_tag(_)
          "&#x23b8;"
        end

        def to_html
          "&#x23b8;"
        end
      end
    end
  end
end
