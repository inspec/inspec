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
            # fetch default options passed in the cli to append
            default_options = fetch_default_options(str.split(" "))
            if str.start_with?("-")
              opts << "#{default_profile} #{str} #{default_options}"
            else
              opts << "#{str} #{default_options}"
            end
          end
        end
        opts
      end

      # this must return "" or string of default options which are not part of option file
      def fetch_default_options(option_line)
        # select words from the line which starts with - i.e. the options
        option_line = option_line.select { |word| word.start_with?("-") }

        # remove hyphens from the words to compare with default options
        option_line.map! { |word| word.gsub("-", "") }

        default_opts = ""

        # iterate through the default options and append the option and value which are not present in option file
        default_subcmd_options.each do |cmd|
          if cmd.is_a? String
            unless option_line.include?(cmd)
              default_value = options[cmd.to_sym]
              default_value = default_value.join(" ") if default_value.is_a? Array
              default_opts << " --#{cmd.gsub("_", "-")} #{default_value}"
            end
          elsif !option_line.include?(cmd[0]) && !option_line.include?(cmd[1])
            default_value = options[cmd[0].to_sym]
            default_value = default_value.join(" ") if default_value.is_a? Array
            default_opts << " --#{cmd[0].gsub("_", "-")} #{default_value}"
          end
        end
        default_opts
      end

      # returns array of default options of the subcommand
      def default_subcmd_options
        sub_cmd_opts = Inspec::InspecCLI.commands[sub_cmd].options
        all_default_opts = options.keys & sub_cmd_opts.keys.map(&:to_s)
        opts_with_nil_default = sub_cmd_opts.select { |_, c| !c.default.nil? }.keys.map(&:to_s)
        required_default_opts = all_default_opts - opts_with_nil_default

        default_opts_to_append = []

        # append the options and its aliases if available.
        required_default_opts.each do |opt_to_append|
          opt_alias = sub_cmd_opts[opt_to_append.to_sym].aliases
          if opt_alias.empty?
            default_opts_to_append << opt_to_append
          else
            default_opts_to_append << [opt_to_append, opt_alias[0].to_s]
          end
        end
        default_opts_to_append
      end
    end
  end
end