# If Haml is around, define a :code filter that can be used to more conveniently output highlighted code.
if defined? Haml
  module Haml
    module Filters
      module Code
        include Base

        def render(code)
          code = code.encode(Encoding::UTF_8)

          # Allow language to be specified via a special comment like:
          #  # lang: ruby
          if code.lines.first =~ /\A\s*#\s*lang:\s*(\w+)$/
              language = $1
            code = code.lines.to_a[1..-1].join # Strip first line
          end

          Middleman::Syntax::Highlighter.highlight(code, language)
        end
      end
    end
  end
end
