require 'middleman-core/configuration'

module Middleman
  module Sprockets
    class Interface
      include Contracts

      attr_reader :options,
                  :environment,
                  :extensions

      Contract ::Middleman::Configuration::ConfigurationManager, ::Sprockets::Environment => Any
      def initialize options, environment
        @options     = options
        @environment = environment
        setup!
      end

      module Sprockets4
        include Contracts

        def setup!
          acceptable_mimes = options[:supported_output_extensions].map do |ext|
            environment.config[:mime_exts][ext]
          end
          @extensions = environment.transformers.map { |k, v| [k, v.keys] }.select do |row|
                          acceptable_mimes.include?(row.first) ||
                            row.last.include?(acceptable_mimes.first) ||
                            row.last.include?(acceptable_mimes.last)
                        end.flat_map do |row|
                          mime = row.first
                          environment.mime_exts.map { |k, v| v == mime ? k : nil }.compact
                        end
        end

        Contract String => Bool
        def processible? filename
          file_ext, _mime = ::Sprockets::PathUtils.match_path_extname(filename, environment.config[:mime_exts])
          *template_exts, target_ext = Middleman::Util.collect_extensions(filename)
          options[:supported_output_extensions].include?(target_ext) && extensions.include?(file_ext)
        end
      end

      module Sprockets3
        include Contracts

        def setup!
          @extensions = environment.engines.keys
        end

        Contract String => Bool
        def processible? filename
          *template_exts, target_ext = Middleman::Util.collect_extensions(filename)
          options[:supported_output_extensions].include?(target_ext) && (template_exts - extensions).empty?
        end
      end

      if ::Sprockets::VERSION >= '4.0'
        include Sprockets4
      else
        include Sprockets3
      end
    end
  end
end
