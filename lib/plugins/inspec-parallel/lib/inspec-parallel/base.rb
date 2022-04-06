require_relative "runner"
require_relative "validator"

module InspecPlugins
  module Parallel
    class Base
      attr_accessor :options, :default_profile, :sub_cmd, :parsed_options

      def initialize(options, default_profile, sub_cmd = "exec")
        @default_profile = default_profile
        @options = options
        @sub_cmd = sub_cmd
        @logger  = Inspec::Log
        @validation_passed = true
        @parsed_options = parse_options_file
      end

      def run
        Runner.new(parsed_options, sub_cmd).run
      end

      def dry_run
        validate_option_strings
        dry_run_commands if @validation_passed
      end

      private

      def validate_option_strings
        @validation_passed = Validator.new(parsed_options, sub_cmd).validate!
        @logger.error "Please fix the options file to proceed further." unless @validation_passed
      end

      def dry_run_commands
        parsed_options.each do |opts|
          puts "inspec #{sub_cmd} #{opts}"
        end
      end

      ## Utility functions

      def parse_options_file
        opts = []
        content = File.read(options[:option_file])
        content.split("\n").each do |str|
          str = str.strip
          str_has_comment = str.start_with?("#")
          if !str.empty? && !str_has_comment
            if str.start_with?("-")
              opts << "#{default_profile} #{str}"
            else
              opts << "#{str}"
            end
          end
        end
        opts
      end

      def parallel_exec_options
        options.keys - Inspec::InspecCLI.commands[sub_cmd].options.keys.map(&:to_s)
      end
    end
  end
end