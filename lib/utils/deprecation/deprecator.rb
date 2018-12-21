
require 'utils/deprecation/config_file'

module Inspec
  module Deprecation
    class Deprecator

      attr_reader :config, :output

      def initialize(opts = {})
        @config = Inspec::Deprecation::ConfigFile.new(opts[:config_io])
        @output = opts[:output_io] || config.output_io
      end

      def handle_deprecation(group, message, opts = {})
        # TODO
      end

      private
    end
  end
end