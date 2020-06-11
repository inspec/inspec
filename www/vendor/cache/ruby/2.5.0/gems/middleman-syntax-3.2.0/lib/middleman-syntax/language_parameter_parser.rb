module Middleman
  module Syntax
    module LanguageParameterParser
      def self.parse_parameter_from_language(language = "")
        language, params = language.to_s.split("?", 2)
        if params and params.to_s.include? "="
          attribute, value = params.to_s.split("=")
          # if there are more arguments, refactor this
          if attribute == "line_numbers" and value == "false"
            return { line_numbers: false }
          end
        end
        {}
      end
    end
  end
end
