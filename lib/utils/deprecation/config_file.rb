require 'stringio'
require 'json'
require 'inspec/globals'

module Inspec
  module Deprecation
    class ConfigFile

      def initialize(io = nil)
        io ||= open_default_config_io
        begin
          @raw_data = JSON.parse(io)
        rescue JSON::ParseError => e
          raise Inspec::Deprecation::MalformedConfigError.new("Could not parse deprecation config file: #{e.message}")
        end
        validate!
      end

      def output_io
        # TODO
      end

      private

      def open_default_config_io
        default_path = File.join(Inspec.src_root, 'etc', 'deprecations.json')
        unless File.exist?(default_path)
          raise Inspec::Deprecation::MalformedConfigError.new( "Missing deprecation config file: #{default_path}")
        end
        File.open(default_path)
      end

      def validate!
        # TODO
      end

    end
  end
end
