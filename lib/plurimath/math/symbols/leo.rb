module Plurimath
  module Math
    module Symbols
      class Leo < Symbol
        INPUT = {
          unicodemath: [["&#x264c;"], parsing_wrapper(["leo", "Leo"])],
          asciimath: [["&#x264c;"], parsing_wrapper(["leo", "Leo"])],
          mathml: ["&#x264c;"],
          latex: [["leo", "Leo", "&#x264c;"]],
          omml: ["&#x264c;"],
          html: ["&#x264c;"],
        }.freeze

        # output methods
        def to_latex
          "\\leo"
        end

        def to_asciimath
          parsing_wrapper("Leo")
        end

        def to_unicodemath
          Utility.html_entity_to_unicode("&#x264c;")
        end

        def to_mathml_without_math_tag
          ox_element("mi") << "&#x264c;"
        end

        def to_omml_without_math_tag(_)
          "&#x264c;"
        end

        def to_html
          "&#x264c;"
        end
      end
    end
  end
end
