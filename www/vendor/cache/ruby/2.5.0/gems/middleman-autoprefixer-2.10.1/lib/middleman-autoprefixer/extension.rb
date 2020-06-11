module Middleman
  module Autoprefixer
    class Extension < ::Middleman::Extension
      option :browsers, nil,   'Supported browsers'
      option :add,      true,  'Add new vendor prefixes'
      option :remove,   true,  'Remove outdated CSS prefixes'
      option :cascade,  true,  'Align prefixed properties'
      option :inline,   false, 'Process inline CSS within HTML files'
      option :ignore,   [],    'File patterns to avoid processing'
      option :grid,     true,  'Enable -ms- prefixes for Grid Layout'
      option :supports, false, 'Disable @supports parameters prefixing'
      option :flexbox,  false, 'Disable flexbox properties prefixing'

      def initialize(app, options = {}, &block)
        super

        require 'middleman-core/util'
        require 'autoprefixer-rails/result'
        require 'autoprefixer-rails/processor'
      end

      def after_configuration
        # Setup Rack middleware to apply prefixes
        app.use Rack, config: options, middleman_app: @app
      end

      # Rack middleware to look for CSS and apply prefixes.
      class Rack
        INLINE_CSS_REGEX = /(<style[^>]*>\s*(?:\/\*<!\[CDATA\[\*\/\n)?)(.*?)((?:(?:\n\s*)?\/\*\]\]>\*\/)?\s*<\/style>)/m

        # Init
        # @param [Class] app
        # @param [Hash] options
        def initialize(app, options = {})
          @app = app
          @middleman_app = options.fetch(:middleman_app)
          @config = options.fetch(:config)
          @inline = @config[:inline]
          @ignore = @config[:ignore]

          @processor = ::AutoprefixerRails::Processor.new({
            browsers: @config[:browsers] && Array(@config[:browsers]),
            add:      @config[:add],
            remove:   @config[:remove],
            grid:     @config[:grid],
            supports: @config[:supports],
            flexbox:  @config[:flexbox]
          })
        end

        # Rack interface
        # @param [Rack::Environmemt] env
        # @return [Array]
        def call(env)
          status, headers, response = @app.call(env)

          type = headers.fetch('Content-Type', 'application/octet-stream').split(';').first
          path = env['PATH_INFO']

          prefixed = process(response, type, path)

          if prefixed.is_a?(String)
            headers['Content-Length'] = prefixed.bytesize.to_s
            response = [prefixed]
          end

          [status, headers, response]
        end

        private

        def process(response, type, path)
          if standalone_css_content?(type, path)
            prefix(extract_styles(response), path)
          elsif inline_html_content?(type, path)
            prefix_inline_styles(extract_styles(response))
          else
            nil
          end
        end

        def prefix(content, path = nil)
          @processor.process(content, path ? { from: path } : {}).css
        rescue => e
          @middleman_app.logger.error(e.message)
          raise e
        end

        def prefix_inline_styles(content)
          content.gsub(INLINE_CSS_REGEX) { $1 << prefix($2) << $3 }
        end

        def extract_styles(response)
          ::Middleman::Util.extract_response_text(response)
        end

        def inline_html_content?(type, path)
          type == 'text/html' && @inline
        end

        def standalone_css_content?(type, path)
          type == 'text/css' && @ignore.none? { |ignore| ::Middleman::Util.path_match(ignore, path) }
        end
      end
    end
  end
end
