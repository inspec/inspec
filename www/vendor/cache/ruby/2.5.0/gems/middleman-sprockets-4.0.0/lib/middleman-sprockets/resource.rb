require 'middleman-core/sitemap/store'

module Middleman
  module Sprockets
    class Resource < ::Middleman::Sitemap::Resource
      Contract ::Middleman::Sitemap::Store, String, String, String, ::Sprockets::Environment => Any
      def initialize store, path, source_file, sprockets_path, environment
        @app  = store.app
        @path = path
        @sprockets_path = sprockets_path
        @environment    = environment
        @errored        = false

        super(store, path, source_file)
      end

      Contract Bool
      def errored?
        @errored
      end

      Contract Bool
      def template?
        true
      end

      Contract Any, Any => String
      def render *_args
        ::Middleman::Util.instrument 'sprockets.render', asset: self do
          sprockets_asset.source
        end
      end

      Contract Or[::Sprockets::Asset, IsA['Middleman::Sprockets::Resource::Error']]
      def sprockets_asset
        ::Middleman::Util.instrument 'sprockets.asset_lookup', asset: self do
          @environment[@sprockets_path] || raise(::Sprockets::FileNotFound, @sprockets_path)
        end
      rescue StandardError => e
        raise e if @app.build?

        @errored = true
        Error.new(e, ext)
      end

      Contract Bool
      def binary?
        false
      end

      class Error
        include Contracts

        def initialize error, ext
          @error = error
          @ext   = ext
        end

        Contract Set
        def links
          Set.new
        end

        Contract String
        def source
          case @ext
          when '.css' then css_response
          when '.js' then js_response
          else
            default_response
          end
        end
        alias to_s source

        private

          def default_response
            @error.to_s
          end

          def js_response
            file, line = @error.backtrace[0].split(':')
            err = "#{@error.class.name}: #{@error.message}\n" \
                  "  on line #{line} of #{file})"

            "throw Error(#{err.inspect})"
          end

          def css_response
            ::Sass::SyntaxError.exception_to_css(@error)
          end

      end

    end
  end
end
