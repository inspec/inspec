require_relative "runner"
require_relative "validator"
require "erb" unless defined?(Erb)

module InspecPlugins
  module Parallelism

    class OptionFileNotReadable < RuntimeError
    end

    class Command
      attr_accessor :cli_options_to_parallel_cmd, :default_profile, :sub_cmd, :invocations, :run_in_background

      def initialize(cli_options_to_parallel_cmd, default_profile, sub_cmd = "exec")
        @default_profile = default_profile
        @cli_options_to_parallel_cmd = cli_options_to_parallel_cmd
        @sub_cmd = sub_cmd
        @logger  = Inspec::Log
        @invocations = read_options_file
        @run_in_background = cli_options_to_parallel_cmd["bg"]
      end

      def run
        validate_thor_options
        validate_invocations!
        runner = Runner.new(invocations, cli_options_to_parallel_cmd, sub_cmd)
        catch_ctl_c_and_exit(runner) unless run_in_background
        runner.run
      end

      def dry_run
        validate_invocations!
        dry_run_commands
      end

      private

      def catch_ctl_c_and_exit(runner)
        puts "Press CTL+C to stop\n"
        trap("SIGINT") do
          puts "\n"
          puts "Shutting down jobs..."
          if Inspec.locally_windows?
            runner.kill_child_processes
            sleep 1
            puts "Renaming error log files..."
            runner.rename_error_log_files
          end
          exit Inspec::UI::EXIT_TERMINATED_BY_CTL_C
        end
      end

      def validate_thor_options
        # only log path validation needed for now
        validate_log_path
      end

      def validate_log_path
        error, message = Validator.new(invocations, cli_options_to_parallel_cmd, sub_cmd).validate_log_path
        if error
          @logger.error message
          Inspec::UI.new.exit(:usage_error)
        end
      end

      def validate_invocations!
        # Validation logic stays in Validator class...
        Validator.new(invocations, cli_options_to_parallel_cmd, sub_cmd).validate
        # UI logic stays in Command class.
        valid = true
        invocations.each do |invocation_data|
          invocation_data[:validation_errors].each do |error_message|
            valid = false
            @logger.error "Line #{invocation_data[:line_no]}: " + error_message
          end
        end
        unless valid
          @logger.error "Please fix the options to proceed further."
          Inspec::UI.new.exit(:usage_error)
        end
      end

      def dry_run_commands
        invocations.each do |invocation_data|
          puts "inspec #{sub_cmd} #{invocation_data[:value]}"
        end
      end

      ## Utility functions

      def read_options_file
        opts = []
        begin
          content = content_from_file(cli_options_to_parallel_cmd[:option_file])
        rescue OptionFileNotReadable => e
          @logger.error "Cannot read options file: #{e.message}"
          Inspec::UI.new.exit(:usage_error)
        end
        content.each.with_index(1) do |str, index|
          data_hash = { line_no: index }
          str = ERB.new(str).result_with_hash(pid: "CHILD_PID").strip
          str_has_comment = str.start_with?("#")
          next if str.empty? || str_has_comment

          default_options = fetch_default_options(str.split(" ")).lstrip
          if str.start_with?("-")
            data_hash[:value] = "#{default_profile} #{str} #{default_options}"
          else
            data_hash[:value] = "#{str} #{default_options}"
          end
          opts << data_hash
        end
        opts
      end

      def content_from_file(option_file)
        if File.exist?(option_file)
          unless [".sh", ".csh", ".ps1"].include? File.extname(option_file)
            File.readlines(option_file)
          else
            if Inspec.locally_windows? && (File.extname(option_file) == ".ps1")
              begin
                output = `powershell -File "#{option_file}"`
                output.split("\n")
              rescue StandardError => e
                raise OptionFileNotReadable.new("Error reading powershell file #{option_file}: #{e.message}")
              end
            elsif [".sh", ".csh"].include? File.extname(option_file)
              begin
                output = `bash "#{option_file}"`
                output.split("\n")
              rescue StandardError => e
                raise OptionFileNotReadable.new("Error reading shell file #{option_file}: #{e.message}")
              end
            else
              raise OptionFileNotReadable.new("Powershell not supported in your system.")
            end
          end
        else
          raise OptionFileNotReadable.new("Option file not found.")
        end
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
        parallel_cmd_default_opts = cli_options_to_parallel_cmd.keys & sub_cmd_opts.keys.map(&:to_s)
        options_to_append = parallel_cmd_default_opts

        if cli_options_to_parallel_cmd["dry_run"] && !cli_options_to_parallel_cmd["verbose"]
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
        default_value = cli_options_to_parallel_cmd[command_name.to_sym]
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
          if sub_cmd_opts[default_opt_name.to_sym].default == cli_options_to_parallel_cmd[default_opt_name]
            default_options_to_remove << default_opt_name
          end
        end
        default_options_to_remove
      end
    end
  end
end
