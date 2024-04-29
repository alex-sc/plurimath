module Plurimath
  module Math
    module Symbols
      class Curlywedge < Symbol
        INPUT = {
          unicodemath: [["curlywedge", "&#x22cf;"]],
          asciimath: [["&#x22cf;"], parsing_wrapper(["curlywedge"])],
          mathml: ["&#x22cf;"],
          latex: [["curlywedge", "&#x22cf;"]],
          omml: ["&#x22cf;"],
          html: ["&#x22cf;"],
        }.freeze

        # output methods
        def to_latex
          "\\curlywedge"
        end

        def to_asciimath
          parsing_wrapper("curlywedge")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x22cf;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x22cf;"
        end

        def to_omml_without_math_tag(_)
          "&#x22cf;"
        end

        def to_html
          "&#x22cf;"
        end
      end
    end
  end
end
