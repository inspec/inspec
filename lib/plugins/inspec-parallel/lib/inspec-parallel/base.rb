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
            default_options = fetch_default_options(str.split(" ")).lstrip
            if str.start_with?("-")
              opts << "#{default_profile} #{str} #{default_options}"
            else
              opts << "#{str} #{default_options}"
            end
          end
        end
        opts
      end

      # this must return empty string or default option string which are not part of option file
      def fetch_default_options(option_line)
        option_line = option_line.select { |word| word.start_with?("-") }

        # remove prefixes from the options to compare with default options
        option_line.map! do |option_key|
          option_key.gsub(options_prefix(option_key), "").gsub("-", "_")
        end

        default_opts = ""
        # iterate through the parallel cli default options and append the option and value which are not present in option file
        parallel_cmd_default_cli_options.each do |cmd|
          if cmd.is_a? String
            append_default_value(default_opts, cmd) unless option_line.include?(cmd)
          elsif cmd.is_a? Array
            if !option_line.include?(cmd[0]) && !option_line.include?(cmd[1])
              append_default_value(default_opts, cmd[0])
            end
          end
        end
        default_opts
      end

      # returns array of default options of the subcommand
      def parallel_cmd_default_cli_options
        sub_cmd_opts = Inspec::InspecCLI.commands[sub_cmd].options
        parallel_cmd_default_opts = options.keys & sub_cmd_opts.keys.map(&:to_s)
        options_to_append = parallel_cmd_default_opts

        if options["dry_run"]
          # to not show thor default options of inspec commands in dry run
          sub_cmd_opts_with_defaults = fetch_sub_cmd_default_options(sub_cmd_opts)
          options_to_append -= sub_cmd_opts_with_defaults
        end

        default_opts_to_append = []

        # append the options and its aliases if available.
        options_to_append.each do |option_name|
          opt_alias = sub_cmd_opts[option_name.to_sym].aliases
          if opt_alias.empty?
            default_opts_to_append << option_name
          else
            default_opts_to_append << [option_name, opt_alias[0].to_s]
          end
        end
        default_opts_to_append
      end

      def append_default_value(default_opts, command_name)
        default_value = options[command_name.to_sym]
        default_value = default_value.join(" ") if default_value.is_a? Array
        default_opts << " --#{command_name.gsub("_", "-")} #{default_value}"
      end

      def options_prefix(option_name)
        if option_name.start_with?("--")
          option_name.start_with?("--no-") ? "--no-" : "--"
        else
          "-"
        end
      end

      def fetch_sub_cmd_default_options(sub_cmd_opts)
        default_options_to_remove = []
        sub_cmd_opts_with_defaults = sub_cmd_opts.select { |_, c| !c.default.nil? }.keys.map(&:to_s)
        sub_cmd_opts_with_defaults.each do |default_opt_name|
          if sub_cmd_opts[default_opt_name.to_sym].default == options[default_opt_name]
            default_options_to_remove << default_opt_name
          end
        end
        default_options_to_remove
      end
    end
  end
end