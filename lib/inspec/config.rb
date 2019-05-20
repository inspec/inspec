# Represents InSpec configuration.  Merges defaults, config file options,
# and CLI arguments.

require 'pp'
require 'stringio'
require 'forwardable'

module Inspec
  class Config
    # These are options that apply to any transport
    GENERIC_CREDENTIALS = %w{
      backend
      logger
      sudo
      sudo_password
      sudo_command
      sudo_options
      shell
      shell_options
      shell_command
    }.freeze

    extend Forwardable

    # Many parts of InSpec expect to treat the Config as a Hash
    def_delegators :@final_options, :each, :delete, :[], :[]=, :key?
    attr_reader :final_options

    # This makes it easy to make a config with a mock backend.
    def self.mock(opts = {})
      Inspec::Config.new({ backend: :mock }.merge(opts), StringIO.new('{}'))
    end

    # Use this to get a cached version of the config.  This prevents you from
    # being required to pass it around everywhere.
    def self.cached
      @cached_config
    end

    def self.cached=(cfg)
      @cached_config ||= cfg
    end

    # This gets called when the first config is created.
    def initialize(cli_opts = {}, cfg_io = nil, command_name = nil)
      @command_name = command_name || (ARGV.empty? ? nil : ARGV[0].to_sym)
      @defaults = Defaults.for_command(@command_name)

      @cli_opts = cli_opts.dup
      cfg_io = resolve_cfg_io(@cli_opts, cfg_io)
      @cfg_file_contents = read_cfg_file_io(cfg_io)

      @merged_options = merge_options
      @final_options = finalize_options
      self.class.cached = self
    end

    def diagnose
      return unless self[:diagnose]
      puts "InSpec version: #{Inspec::VERSION}"
      puts "Train version: #{Train::VERSION}"
      puts 'Command line configuration:'
      pp @cli_opts
      puts 'JSON configuration file:'
      pp @cfg_file_contents
      puts 'Merged configuration:'
      pp @merged_options
      puts
    end

    # return all telemetry options from config
    # @return [Hash]
    def telemetry_options
      final_options.select { |key, _| key.include?('telemetry') }
    end

    #-----------------------------------------------------------------------#
    #                      Train Credential Handling
    #-----------------------------------------------------------------------#

    # Returns a Hash with Symbol keys as follows:
    #   backend: machine name of the Train transport needed
    #   If present, any of the GENERIC_CREDENTIALS.
    #   All other keys are specific to the backend.
    #
    # The credentials are gleaned from:
    #  * the Train transport defaults. Train handles this on transport creation,
    #      so this method doesn't load defaults.
    #  * individual InSpec CLI options (which in many cases may have the
    #      transport name prefixed, which is stripped before being added
    #      to the creds hash)
    #  * the --target CLI option, which is interpreted:
    #     - as a transport://credset format, which looks up the creds in
    #       the config file in the credentials section
    #     - as an arbitrary URI, which is parsed by Train.unpack_target_from_uri

    def unpack_train_credentials
      # Internally, use indifferent access while we build the creds
      credentials = Thor::CoreExt::HashWithIndifferentAccess.new({})

      # Helper methods prefixed with _utc_ (Unpack Train Credentials)

      credentials.merge!(_utc_generic_credentials)

      _utc_determine_backend(credentials)
      transport_name = credentials[:backend].to_s

      _utc_merge_credset(credentials, transport_name)
      _utc_merge_transport_options(credentials, transport_name)

      # Convert to all-Symbol keys
      credentials.each_with_object({}) do |(option, value), creds|
        creds[option.to_sym] = value
        creds
      end
    end

    private

    def _utc_merge_transport_options(credentials, transport_name)
      # Ask Train for the names of the transport options
      transport_options = Train.options(transport_name).keys.map(&:to_s)

      # If there are any options with those (unprefixed) names, merge them in.
      unprefixed_transport_options = final_options.select do |option_name, _value|
        transport_options.include? option_name # e.g., 'host'
      end
      credentials.merge!(unprefixed_transport_options)

      # If there are any prefixed options, merge them in, stripping the prefix.
      transport_prefix = transport_name.downcase.tr('-', '_') + '_'
      transport_options.each do |bare_option_name|
        prefixed_option_name = transport_prefix + bare_option_name.to_s
        if final_options.key?(prefixed_option_name)
          credentials[bare_option_name.to_s] = final_options[prefixed_option_name]
        end
      end
    end

    # fetch any info that applies to all transports (like sudo information)
    def _utc_generic_credentials
      @final_options.select { |option, _value| GENERIC_CREDENTIALS.include?(option) }
    end

    def _utc_determine_backend(credentials)
      return if credentials.key?(:backend)

      # Default to local
      unless @final_options.key?(:target)
        credentials[:backend] = 'local'
        return
      end

      # Look into target
      %r{^(?<transport_name>[a-z_\-0-9]+)://.*$} =~ final_options[:target]
      unless transport_name
        raise ArgumentError, "Could not recognize a backend from the target #{final_options[:target]} - use a URI format with the backend name as the URI schema.  Example: 'ssh://somehost.com' or 'transport://credset' or 'transport://' if credentials are provided outside of InSpec."
      end
      credentials[:backend] = transport_name.to_s # these are indeed stored in Train as Strings.
    end

    def _utc_merge_credset(credentials, transport_name)
      # Look for Config File credentials/transport_name/credset
      credset_name = _utc_find_credset_name(credentials, transport_name)

      if credset_name
        credset = @cfg_file_contents.dig('credentials', transport_name, credset_name)
        if credset
          credentials.merge!(credset)
        else
          # OK, we had a target that looked like transport://something
          # But we don't know what that something is - there was no
          # matching credset with it.  Let train parse it.
          credentials.merge!(Train.unpack_target_from_uri(final_options[:target]))
        end
      elsif final_options.key?(:target)
        # Not sure what target looked like at all!
        # Let train parse it.
        credentials.merge!(Train.unpack_target_from_uri(final_options[:target]))
      end
    end

    def _utc_find_credset_name(_credentials, transport_name)
      return nil unless final_options[:target]
      match = final_options[:target].match(%r{^#{transport_name}://(?<credset_name>[\w\d\-]+)$})
      match ? match[:credset_name] : nil
    end

    #-----------------------------------------------------------------------#
    #                         Reading Config Files
    #-----------------------------------------------------------------------#

    # Regardless of our situation, end up with a readable IO object
    def resolve_cfg_io(cli_opts, cfg_io)
      raise(ArgumentError, 'Inspec::Config must use an IO to read from') if cfg_io && !cfg_io.respond_to?(:read)
      cfg_io ||= check_for_piped_config(cli_opts)
      return cfg_io if cfg_io

      path = determine_cfg_path(cli_opts)

      cfg_io = File.open(path) if path
      cfg_io || StringIO.new('{ "version": "1.1" }')
    end

    def check_for_piped_config(cli_opts)
      cli_opt = cli_opts[:config] || cli_opts[:json_config]
      Inspec.deprecate(:cli_option_json_config) if cli_opts.key?(:json_config)

      return nil unless cli_opt
      return nil unless cli_opt == '-'
      # This warning is here so that if a user invokes inspec with --config=-,
      # they will have an explanation for why it appears to hang.
      Inspec::Log.warn 'Reading JSON config from standard input' if STDIN.tty?
      STDIN
    end

    def determine_cfg_path(cli_opts)
      path = cli_opts[:config] || cli_opts[:json_config]
      Inspec.deprecate(:cli_option_json_config) if cli_opts.key?(:json_config)

      if path.nil?
        default_path = File.join(Inspec.config_dir, 'config.json')
        path = default_path if File.exist?(default_path)
      elsif !File.exist?(path)
        raise ArgumentError, "Could not read configuration file at #{path}"
      end
      path
    end

    # When reading STDIN, read it once into a class variable and cache it.
    # Don't cache other IO objects though, as we use several different StringIOs
    # during unit testing. Refs #3792
    def self.stdin_contents # rubocop: disable Lint/IneffectiveAccessModifier
      @stdin_content ||= STDIN.read
    end

    def read_cfg_file_io(cfg_io)
      contents = cfg_io == STDIN ? self.class.stdin_contents : cfg_io.read
      begin
        @cfg_file_contents = JSON.parse(contents)
        validate_config_file_contents!
      rescue JSON::ParserError => e
        raise Inspec::ConfigError::MalformedJson, "Failed to load JSON configuration: #{e}\nConfig was: #{contents}"
      end
      @cfg_file_contents
    end

    def file_version
      @cfg_file_contents['version'] || :legacy
    end

    def legacy_file?
      file_version == :legacy
    end

    def config_file_cli_options
      if legacy_file?
        # Assume everything in the file is a CLI option
        @cfg_file_contents
      else
        @cfg_file_contents['cli_options'] || {}
      end
    end

    def config_file_reporter_options
      # This is assumed to be top-level in both legacy and 1.1.
      # Technically, you could sneak it in the 1.1 cli opts area.
      @cfg_file_contents.key?('reporter') ? { 'reporter' => @cfg_file_contents['reporter'] } : {}
    end

    #-----------------------------------------------------------------------#
    #                            Validation
    #-----------------------------------------------------------------------#
    def validate_config_file_contents!
      version = @cfg_file_contents['version']

      # Assume legacy format, which is unconstrained
      return unless version

      unless version == '1.1'
        raise Inspec::ConfigError::Invalid, "Unsupported config file version '#{version}' - currently supported versions: 1.1"
      end

      valid_fields = %w{version cli_options credentials compliance reporter}.sort
      @cfg_file_contents.keys.each do |seen_field|
        unless valid_fields.include?(seen_field)
          raise Inspec::ConfigError::Invalid, "Unrecognized top-level configuration field #{seen_field}.  Recognized fields: #{valid_fields.join(', ')}"
        end
      end
    end

    def validate_reporters!(reporters)
      return if reporters.nil?
      # TODO: move this into a reporter plugin type system
      valid_types = [
        'automate',
        'cli',
        'documentation',
        'html',
        'json',
        'json-automate',
        'json-min',
        'json-rspec',
        'junit',
        'progress',
        'yaml',
      ]

      reporters.each do |reporter_name, reporter_config|
        raise NotImplementedError, "'#{reporter_name}' is not a valid reporter type." unless valid_types.include?(reporter_name)

        next unless reporter_name == 'automate'
        %w{token url}.each do |option|
          raise Inspec::ReporterError, "You must specify a automate #{option} via the config file." if reporter_config[option].nil?
        end
      end

      # check to make sure we are only reporting one type to stdout
      stdout_reporters = 0
      reporters.each_value do |reporter_config|
        stdout_reporters += 1 if reporter_config['stdout'] == true
      end

      raise ArgumentError, 'The option --reporter can only have a single report outputting to stdout.' if stdout_reporters > 1
    end

    #-----------------------------------------------------------------------#
    #                         Merging Options
    #-----------------------------------------------------------------------#
    def merge_options
      options = Thor::CoreExt::HashWithIndifferentAccess.new({})

      # Lowest precedence: default, which may vary by command
      options.merge!(@defaults)

      # Middle precedence: merge in any CLI options defined from the config file
      options.merge!(config_file_cli_options)
      # Reporter options may be defined top-level.
      options.merge!(config_file_reporter_options)

      # Highest precedence: merge in any options defined via the CLI
      options.merge!(@cli_opts)

      options
    end

    #-----------------------------------------------------------------------#
    #                          Finalization
    #-----------------------------------------------------------------------#
    def finalize_options
      options = @merged_options.dup

      finalize_set_top_level_command(options)
      finalize_parse_reporters(options)
      finalize_handle_sudo(options)
      finalize_compliance_login(options)

      Thor::CoreExt::HashWithIndifferentAccess.new(options)
    end

    def finalize_set_top_level_command(options)
      options[:type] = @command_name
      Inspec::BaseCLI.inspec_cli_command = @command_name # TODO: move to a more relevant location
    end

    def finalize_parse_reporters(options) # rubocop:disable Metrics/AbcSize
      # default to cli report for ad-hoc runners
      options['reporter'] = ['cli'] if options['reporter'].nil?

      # parse out cli to proper report format
      if options['reporter'].is_a?(Array)
        reports = {}
        options['reporter'].each do |report|
          reporter_name, destination = report.split(':', 2)
          if destination.nil? || destination.strip == '-'
            reports[reporter_name] = { 'stdout' => true }
          else
            reports[reporter_name] = {
              'file' => destination,
              'stdout' => false,
            }
            reports[reporter_name]['target_id'] = options['target_id'] if options['target_id']
          end
        end
        options['reporter'] = reports
      end

      # add in stdout if not specified
      if options['reporter'].is_a?(Hash)
        options['reporter'].each do |reporter_name, config|
          options['reporter'][reporter_name] = {} if config.nil?
          options['reporter'][reporter_name]['stdout'] = true if options['reporter'][reporter_name].empty?
          options['reporter'][reporter_name]['target_id'] = options['target_id'] if options['target_id']
        end
      end

      validate_reporters!(options['reporter'])
      options
    end

    def finalize_handle_sudo(options)
      # Due to limitations in Thor it is not possible to set an argument to be
      # both optional and its value to be mandatory. E.g. the user supplying
      # the --password argument is optional and not always required, but
      # whenever it is used, it requires a value. Handle options that were
      # defined in such a way and require a value here:
      %w{password sudo-password}.each do |option_name|
        snake_case_option_name = option_name.tr('-', '_').to_s
        next unless options[snake_case_option_name] == -1 # Thor sets -1 for missing value - see #1918
        raise ArgumentError, "Please provide a value for --#{option_name}. For example: --#{option_name}=hello."
      end

      # Infer `--sudo` if using `--sudo-password` without `--sudo`
      if options['sudo_password'] && !options['sudo']
        options['sudo'] = true
        Inspec::Log.warn '`--sudo-password` used without `--sudo`. Adding `--sudo`.'
      end
    end

    def finalize_compliance_login(options)
      # check for compliance settings
      # This is always a hash, comes from config file, not CLI opts
      if options.key?('compliance')
        require 'plugins/inspec-compliance/lib/inspec-compliance/api'
        InspecPlugins::Compliance::API.login(options['compliance'])
      end
    end

    class Defaults
      DEFAULTS = {
        exec: {
          'reporter' => ['cli'],
          'show_progress' => false,
          'color' => true,
          'create_lockfile' => true,
          'backend_cache' => true,
        },
        shell: {
          'reporter' => ['cli'],
        },
      }.freeze

      def self.for_command(command_name)
        DEFAULTS[command_name] || {}
      end
    end
  end
end
