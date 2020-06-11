require 'rouge'
require 'middleman-syntax/highlighter'
require 'middleman-syntax/redcarpet_code_renderer'
require 'middleman-syntax/haml_monkey_patch'
require 'middleman-syntax/language_parameter_parser.rb'

module Middleman
  module Syntax
    class SyntaxExtension < Extension
      option :css_class, 'highlight', 'Class name applied to the syntax-highlighted output.'
      option :line_numbers, false, 'Generate line numbers.'
      option :start_line, 1, 'Start the line numbering (if enabled) at the desired integer'
      option :inline_theme, nil, 'A Rouge::CSSTheme that will be used to highlight the output with inline styles instead of using CSS classes.'
      option :wrap, true, 'Wrap the highlighted content in a container (<pre> or <div>, depending on whether :line_numbers is on).'
      option :lexer_options, {}, 'Options for the Rouge lexers.'

      def after_configuration
        Middleman::Syntax::Highlighter.options = options
        if app.config[:markdown_engine] == :redcarpet
          require 'middleman-core/renderers/redcarpet'
          Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, RedcarpetCodeRenderer
        elsif app.config[:markdown_engine] == :kramdown
          require 'kramdown'
          Kramdown::Converter::Html.class_eval do
            def convert_codeblock(el, indent)
              attr = el.attr.dup
              language = extract_code_language!(attr)
              Middleman::Syntax::Highlighter.highlight(el.value, language)
            end
          end
        end
      end

      helpers do
        # Output highlighted code. Use like:
        #
        #    <% code('ruby', :line_numbers => true, :start_line => 7) do %>
        #      my code
        #    <% end %>
        #
        # To produce the following structure:
        #
        #    <pre class="highlight ruby">
        #      <code>#{your code}</code>
        #    </pre>
        #
        # If no language is provided, then the language name is `plaintext`.
        #
        # @param [String] language that the Rouge lexer should use
        # @param [Hash] Options to pass to the Rouge formatter & lexer, overriding global options set by :highlighter_options.
        def code(language=nil, options={}, &block)
          raise 'The code helper requires a block to be provided.' unless block_given?

          # Save current buffer for later
          @_out_buf, _buf_was = "", @_out_buf

          begin
            content = capture_html(&block)
          ensure
            # Reset stored buffer
            @_out_buf = _buf_was
          end
          content = content.encode(Encoding::UTF_8)

          concat_content Middleman::Syntax::Highlighter.highlight(content, language, options).html_safe
        end
      end
    end
  end
end
