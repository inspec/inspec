module InspecPlugins
  module Parallel
    class Base
      attr_accessor :options, :default_profile, :sub_cmd

      def initialize(options, default_profile, sub_cmd = "exec")
        @default_profile = default_profile
        @options = options
        @sub_cmd = sub_cmd
      end

      def run
        execute_pre_run_process
        run_commands
      end

      def dry_run
        execute_pre_run_process
        dry_run_commands
      end

      def execute_pre_run_process
        @parsed_options = parse_options_file
        validate_option_strings
      end

      private

      def validate_option_strings
        # TBD
      end

      def parse_options_file
        opts = []
        content = File.read(options[:option_file])
        content.split("\n").each do |str|
          if str.start_with?("-")
            opts << "#{default_profile} #{str}"
          else
            opts << "#{str}"
          end
        end
        opts
      end

      def run_commands
        # TBD
      end

      def dry_run_commands
        @parsed_options.each do |opts|
          puts "inspec #{sub_cmd} #{opts}"
        end
      end
    end
  end
end