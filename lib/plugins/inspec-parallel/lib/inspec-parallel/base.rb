module InspecPlugins
  module Parallel
    class Base
      attr_accessor :options

      def initialize(options)
        @options = options
        @option_file = options[:option_file]
      end

      def run_scan(default_profile)
        @parsed_option_strings = parse_option_file
        validate_option_strings
        execute_option_strings
      end

      private

      def validate_option_strings
        # TBD
      end

      def parse_option_file
        # TBD
        []
      end

      def execute_option_strings
        # TBD
      end

    end
  end
end