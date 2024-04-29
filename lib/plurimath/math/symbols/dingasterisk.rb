module Plurimath
  module Math
    module Symbols
      class Dingasterisk < Symbol
        INPUT = {
          unicodemath: [["&#x273d;"], parsing_wrapper(["dingasterisk"])],
          asciimath: [["&#x273d;"], parsing_wrapper(["dingasterisk"])],
          mathml: ["&#x273d;"],
          latex: [["dingasterisk", "&#x273d;"]],
          omml: ["&#x273d;"],
          html: ["&#x273d;"],
        }.freeze

        # output methods
        def to_latex
          "\\dingasterisk"
        end

        def to_asciimath
          parsing_wrapper("dingasterisk")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x273d;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x273d;"
        end

        def to_omml_without_math_tag(_)
          "&#x273d;"
        end

        def to_html
          "&#x273d;"
        end
      end
    end
  end
end
