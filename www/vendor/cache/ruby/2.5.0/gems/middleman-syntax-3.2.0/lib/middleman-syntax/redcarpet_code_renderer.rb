require 'middleman-syntax/language_parameter_parser.rb'

module Middleman
  module Syntax
    # A mixin for the Redcarpet Markdown renderer that will highlight
    # code.
    module RedcarpetCodeRenderer
      def block_code(code, language)
        opts = Middleman::Syntax::LanguageParameterParser.parse_parameter_from_language(language)
        Middleman::Syntax::Highlighter.highlight(code, language, opts)
      end
    end
  end
end
