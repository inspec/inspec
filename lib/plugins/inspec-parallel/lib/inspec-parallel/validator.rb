require "inspec/cli"
module InspecPlugins
  module Parallelism
    class Validator

      # TODO: make this list dynamic so plugins can self-declare
      PARALLEL_SAFE_REPORTERS = [
        "automate",      # Performs HTTP transactions, silent on STDOUT
        "child-status",  # Writes dedicated protocol to STDOUT, expected by parent
      ].freeze

      attr_accessor :invocations, :sub_cmd, :thor_options_for_sub_cmd, :aliases_mapping, :cli_options, :config_content, :stdin_config

      def initialize(invocations, cli_options, sub_cmd = "exec")
        @invocations = invocations
        @sub_cmd = sub_cmd
        @thor_options_for_sub_cmd = Inspec::InspecCLI.commands[sub_cmd].options
        @aliases_mapping = create_aliases_mapping
        @cli_options = cli_options
        @config_content = nil
        @stdin_config = nil
      end

      def validate
        invocations.each do |invocation_data|
          invocation_data[:validation_errors] = []

          convert_cli_to_thor_options(invocation_data)
          check_for_spurious_options(invocation_data)
          check_for_required_fields(invocation_data)
          check_for_reporter_options(invocation_data)

        end
      end

      def validate_log_path
        return [] unless cli_options["log_path"]

        if File.directory?(cli_options["log_path"])
          []
        else
          [true, "Log path #{cli_options["log_path"]} is not accessible"]
        end
      end

      private

      def create_aliases_mapping
        alias_mapping = {}
        thor_options_for_sub_cmd.each do |_, sub_cmd_option|
          aliases = sub_cmd_option.aliases
          unless aliases.empty?
            alias_mapping[aliases[0]] = sub_cmd_option.name
          end
        end
        alias_mapping
      end

      def check_for_spurious_options(invocation_data)
        # LIMITATION: Assume the first arg is the profile name, and there is exactly one of them.
        invalid_options = invocation_data[:thor_args][1..-1]
        invocation_data[:validation_errors].push "No such option: #{invalid_options}" unless invalid_options.empty?
      end

      def check_for_required_fields(invocation_data)
        required_fields = thor_options_for_sub_cmd.collect { |_, thor_option| thor_option.name if thor_option.required }.compact
        option_keys = invocation_data[:thor_opts].keys
        invocation_data[:thor_opts].keys.map { |key| option_keys.push(aliases_mapping[key.to_sym]) if aliases_mapping[key.to_sym] }
        if !required_fields.empty? && (option_keys & required_fields).empty?
          invocation_data[:validation_errors].push "No value provided for required options: #{required_fields}"
        end
      end

      def check_for_reporter_options(invocation_data)
        # if no reporter option, that's an error
        unless invocation_data[:thor_opts].include?("reporter")
          # Check for config reporter validation only if --reporter option is missing from options file
          return if check_reporter_options_in_config(invocation_data)

          invocation_data[:validation_errors] << "A --reporter option must be specified for each invocation in the options file"
          return
        end

        have_child_status_reporter = false

        # Reporter option is formatted as an array
        invocation_data[:thor_opts]["reporter"].each do |reporter_spec|
          reporter_name, file_output = reporter_spec.split(":")

          have_child_status_reporter = true if reporter_name == "child-status"

          # if there is a reporter option, each entry must either write to a file or
          # else be the special child-status reporter or the automate reporter
          next if PARALLEL_SAFE_REPORTERS.include?(reporter_name)

          unless file_output
            invocation_data[:validation_errors] << "The #{reporter_name} reporter requires being directed to a file, like #{reporter_name}:filename.out"
          end
        end

        # if there is no child-status reporter, add one to the raw value and the parsed array
        unless have_child_status_reporter
          # Eww
          invocation_data[:thor_opts]["reporter"] << "child-status"
          invocation_data[:value].gsub!("--reporter ", "--reporter child-status ")
        end
      end

      def check_reporter_options_in_config(invocation_data)
        config_opts = invocation_data[:thor_opts]["config"] || invocation_data[:thor_opts]["json_config"]
        cfg_io = check_for_piped_config_from_stdin(config_opts)

        if cfg_io == STDIN
          # Scenario of using config from STDIN
          @config_content ||= cfg_io.read
        else
          if config_opts.nil?
            # Scenario of using default config.json file when path not provided
            default_path = File.join(Inspec.config_dir, "config.json")
            config_opts = default_path
            return unless File.exist?(config_opts)
          elsif !File.exist?(config_opts)
            invocation_data[:validation_errors] << "Could not read configuration file at #{config_opts}"
            return
          end
          @config_content = File.open(config_opts).read
        end

        reporter_config = JSON.parse(config_content)["reporter"] unless config_content.nil? || config_content.empty?
        unless reporter_config
          invocation_data[:validation_errors] << "Config should have reporter option specified for each invocation which is not using --reporter option in options file"
        end
        @config_content
      end

      def check_for_piped_config_from_stdin(config_opts)
        return nil unless config_opts
        return nil unless config_opts == "-"

        @stdin_config ||= STDIN
      end

      ## Utility functions

      # Parse the invocation string using Thor into Thor options
      # This approach was reverse engineered from studying
      # https://github.com/rails/thor/blob/ab3b5be455791f4efb79f0efb4f88cc6b59c8ccf/lib/thor/base.rb#L53

      def convert_cli_to_thor_options(invocation_data)
        invocation_words = invocation_data[:value].split(" ")

        # LIMITATION: this approach is limited to having exactly one profile in the invocation
        args = [invocation_words.shift] # That is, the profile path

        # Here we're piggybacking on on a hook used by the start() method, and provides the
        # specifics for the subcommand
        config = { command_options: thor_options_for_sub_cmd }

        # This performs the parse
        thor = Inspec::InspecCLI.new(args, invocation_words, config)

        # A hash (with indifferent access) of option names to option config data
        invocation_data[:thor_opts] = thor.options

        # A list of everything else it could not parse, including the profile
        invocation_data[:thor_args] = thor.args
      end
    end
  end
end
