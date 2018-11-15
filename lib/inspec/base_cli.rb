# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'thor'
require 'inspec/log'
require 'inspec/profile_vendor'
require 'inspec/ui'

# Allow end of options during array type parsing
# https://github.com/erikhuda/thor/issues/631
class Thor::Arguments
  def parse_array(_name)
    return shift if peek.is_a?(Array)
    array = []
    while current_is_value?
      break unless @parsing_options
      array << shift
    end
    array
  end
end

module Inspec
  class BaseCLI < Thor
    class << self
      attr_accessor :inspec_cli_command
    end

    # https://github.com/erikhuda/thor/issues/244
    def self.exit_on_failure?
      true
    end

    def self.target_options # rubocop:disable MethodLength
      option :target, aliases: :t, type: :string,
        desc: 'Simple targeting option using URIs, e.g. ssh://user:pass@host:port'
      option :backend, aliases: :b, type: :string,
        desc: 'Choose a backend: local, ssh, winrm, docker.'
      option :host, type: :string,
        desc: 'Specify a remote host which is tested.'
      option :port, aliases: :p, type: :numeric,
        desc: 'Specify the login port for a remote scan.'
      option :user, type: :string,
        desc: 'The login user for a remote scan.'
      option :password, type: :string, lazy_default: -1,
        desc: 'Login password for a remote scan, if required.'
      option :enable_password, type: :string, lazy_default: -1,
        desc: 'Password for enable mode on Cisco IOS devices.'
      option :key_files, aliases: :i, type: :array,
        desc: 'Login key or certificate file for a remote scan.'
      option :path, type: :string,
        desc: 'Login path to use when connecting to the target (WinRM).'
      option :sudo, type: :boolean,
        desc: 'Run scans with sudo. Only activates on Unix and non-root user.'
      option :sudo_password, type: :string, lazy_default: -1,
        desc: 'Specify a sudo password, if it is required.'
      option :sudo_options, type: :string,
        desc: 'Additional sudo options for a remote scan.'
      option :sudo_command, type: :string,
        desc: 'Alternate command for sudo.'
      option :shell, type: :boolean,
        desc: 'Run scans in a subshell. Only activates on Unix.'
      option :shell_options, type: :string,
        desc: 'Additional shell options.'
      option :shell_command, type: :string,
        desc: 'Specify a particular shell to use.'
      option :ssl, type: :boolean,
        desc: 'Use SSL for transport layer encryption (WinRM).'
      option :self_signed, type: :boolean,
        desc: 'Allow remote scans with self-signed certificates (WinRM).'
      option :json_config, type: :string,
        desc: 'Read configuration from JSON file (`-` reads from stdin).'
      option :proxy_command, type: :string,
        desc: 'Specifies the command to use to connect to the server'
      option :bastion_host, type: :string,
        desc: 'Specifies the bastion host if applicable'
      option :bastion_user, type: :string,
        desc: 'Specifies the bastion user if applicable'
      option :bastion_port, type: :string,
        desc: 'Specifies the bastion port if applicable'
      option :insecure, type: :boolean, default: false,
        desc: 'Disable SSL verification on select targets'
      option :target_id, type: :string,
        desc: 'Provide a ID which will be included on reports'
    end

    def self.profile_options
      option :profiles_path, type: :string,
        desc: 'Folder which contains referenced profiles.'
      option :vendor_cache, type: :string,
        desc: 'Use the given path for caching dependencies. (default: ~/.inspec/cache)'
    end

    def self.exec_options
      target_options
      profile_options
      option :controls, type: :array,
        desc: 'A list of control names to run, or a list of /regexes/ to match against control names. Ignore all other tests.'
      option :reporter, type: :array,
        banner: 'one two:/output/file/path',
        desc: 'Enable one or more output reporters: cli, documentation, html, progress, json, json-min, json-rspec, junit, yaml'
      option :attrs, type: :array,
        desc: 'Load attributes file (experimental)'
      option :create_lockfile, type: :boolean,
        desc: 'Write out a lockfile based on this execution (unless one already exists)'
      option :backend_cache, type: :boolean,
        desc: 'Allow caching for backend command output. (default: true)'
      option :show_progress, type: :boolean,
        desc: 'Show progress while executing tests.'
      option :distinct_exit, type: :boolean, default: true,
        desc: 'Exit with code 101 if any tests fail, and 100 if any are skipped (default).  If disabled, exit 0 on skips and 1 for failures.'
    end

    def self.default_options
      {
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
      }
    end

    def self.parse_reporters(opts) # rubocop:disable Metrics/AbcSize
      # default to cli report for ad-hoc runners
      opts['reporter'] = ['cli'] if opts['reporter'].nil?

      # parse out cli to proper report format
      if opts['reporter'].is_a?(Array)
        reports = {}
        opts['reporter'].each do |report|
          reporter_name, target = report.split(':', 2)
          if target.nil? || target.strip == '-'
            reports[reporter_name] = { 'stdout' => true }
          else
            reports[reporter_name] = {
              'file' => target,
              'stdout' => false,
            }
            reports[reporter_name]['target_id'] = opts['target_id'] if opts['target_id']
          end
        end
        opts['reporter'] = reports
      end

      # add in stdout if not specified
      if opts['reporter'].is_a?(Hash)
        opts['reporter'].each do |reporter_name, config|
          opts['reporter'][reporter_name] = {} if config.nil?
          opts['reporter'][reporter_name]['stdout'] = true if opts['reporter'][reporter_name].empty?
          opts['reporter'][reporter_name]['target_id'] = opts['target_id'] if opts['target_id']
        end
      end

      validate_reporters(opts['reporter'])
      opts
    end

    def self.validate_reporters(reporters)
      return if reporters.nil?

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

      reporters.each do |k, v|
        raise NotImplementedError, "'#{k}' is not a valid reporter type." unless valid_types.include?(k)

        next unless k == 'automate'
        %w{token url}.each do |option|
          raise Inspec::ReporterError, "You must specify a automate #{option} via the json-config." if v[option].nil?
        end
      end

      # check to make sure we are only reporting one type to stdout
      stdout = 0
      reporters.each_value do |v|
        stdout += 1 if v['stdout'] == true
      end

      raise ArgumentError, 'The option --reporter can only have a single report outputting to stdout.' if stdout > 1
    end

    def self.detect(params: {}, indent: 0, color: 39)
      str = ''
      params.each { |item, info|
        data = info

        # Format Array for better output if applicable
        data = data.join(', ') if data.is_a?(Array)

        # Do not output fields of data is missing ('unknown' is fine)
        next if data.nil?

        data = "\e[1m\e[#{color}m#{data}\e[0m"
        str << format("#{' ' * indent}%-10s %s\n", item.to_s.capitalize + ':', data)
      }
      str
    end

    # These need to be public methods on any BaseCLI instance,
    # but Thor interprets all methods as subcommands.  The no_commands block
    # treats them as regular methods.
    no_commands do
      def ui
        return @ui if defined?(@ui)

        # Make a new UI object, respecting context
        if options[:color].nil?
          enable_color = true # If the command does not support the color option, default to on
        else
          enable_color = options[:color]
        end

        # UI will probe for TTY if nil - just send the raw option value
        enable_interactivity = options[:interactive]

        @ui = Inspec::UI.new(color: enable_color, interactive: enable_interactivity)
      end

      attr_writer :ui

      def mark_text(text)
        # TODO: - deprecate, call cli.ui directly
        ui.emphasis(text)
      end

      def headline(title)
        # TODO: - deprecate, call cli.ui directly
        ui.headline(title)
      end

      def li(entry)
        # TODO: - deprecate, call cli.ui directly
        ui.list_item(entry)
      end

      def plain_text(msg)
        # TODO: - deprecate, call cli.ui directly
        ui.plain(msg + "\n")
      end

      def exit(code)
        # TODO: - deprecate, call cli.ui directly
        ui.exit code
      end
    end

    private

    def suppress_log_output?(opts)
      return false if opts['reporter'].nil?
      match = %w{json json-min json-rspec json-automate junit html yaml documentation progress} & opts['reporter'].keys
      unless match.empty?
        match.each do |m|
          # check to see if we are outputting to stdout
          return true if opts['reporter'][m]['stdout'] == true
        end
      end
      false
    end

    def diagnose(opts)
      return unless opts['diagnose']
      puts "InSpec version: #{Inspec::VERSION}"
      puts "Train version: #{Train::VERSION}"
      puts 'Command line configuration:'
      pp options
      puts 'JSON configuration file:'
      pp options_json
      puts 'Merged configuration:'
      pp opts
      puts
    end

    def opts(type = nil)
      o = merged_opts(type)

      # Due to limitations in Thor it is not possible to set an argument to be
      # both optional and its value to be mandatory. E.g. the user supplying
      # the --password argument is optional and not always required, but
      # whenever it is used, it requires a value. Handle options that were
      # defined above and require a value here:
      %w{password sudo-password}.each do |v|
        id = v.tr('-', '_').to_sym
        next unless o[id] == -1
        raise ArgumentError, "Please provide a value for --#{v}. For example: --#{v}=hello."
      end

      # Infer `--sudo` if using `--sudo-password` without `--sudo`
      if o[:sudo_password] && !o[:sudo]
        o[:sudo] = true
        warn 'WARN: `--sudo-password` used without `--sudo`. Adding `--sudo`.'
      end

      # check for compliance settings
      if o['compliance']
        require 'plugins/inspec-compliance/lib/inspec-compliance/api'
        InspecPlugins::Compliance::API.login(o['compliance'])
      end

      o
    end

    def merged_opts(type = nil)
      opts = {}

      # start with default options if we have any
      opts = BaseCLI.default_options[type] unless type.nil? || BaseCLI.default_options[type].nil?
      opts['type'] = type unless type.nil?
      Inspec::BaseCLI.inspec_cli_command = type

      # merge in any options from json-config
      json_config = options_json
      opts.merge!(json_config)

      # merge in any options defined via thor
      opts.merge!(options)

      # parse reporter options
      opts = BaseCLI.parse_reporters(opts) if %i(exec shell).include?(type)

      Thor::CoreExt::HashWithIndifferentAccess.new(opts)
    end

    def options_json
      conffile = options['json_config']
      @json ||= conffile ? read_config(conffile) : {}
    end

    def read_config(file)
      if file == '-'
        puts 'WARN: reading JSON config from standard input' if STDIN.tty?
        config = STDIN.read
      else
        config = File.read(file)
      end

      JSON.parse(config)
    rescue JSON::ParserError => e
      puts "Failed to load JSON configuration: #{e}\nConfig was: #{config.inspect}"
      exit 1
    end

    # get the log level
    # DEBUG < INFO < WARN < ERROR < FATAL < UNKNOWN
    def get_log_level(level)
      valid = %w{debug info warn error fatal}

      if valid.include?(level)
        l = level
      else
        l = 'info'
      end

      Logger.const_get(l.upcase)
    end

    def pretty_handle_exception(exception)
      case exception
      when Inspec::Error
        $stderr.puts exception.message
        exit(1)
      else
        raise exception
      end
    end

    def vendor_deps(path, opts)
      profile_path = path || Dir.pwd
      profile_vendor = Inspec::ProfileVendor.new(profile_path)

      if (profile_vendor.cache_path.exist? || profile_vendor.lockfile.exist?) && !opts[:overwrite]
        puts 'Profile is already vendored. Use --overwrite.'
        return false
      end

      profile_vendor.vendor!
      puts "Dependencies for profile #{profile_path} successfully vendored to #{profile_vendor.cache_path}"
    rescue StandardError => e
      pretty_handle_exception(e)
    end

    def configure_logger(o)
      #
      # TODO(ssd): This is a big gross, but this configures the
      # logging singleton Inspec::Log. Eventually it would be nice to
      # move internal debug logging to use this logging singleton.
      #
      loc = if o.log_location
              o.log_location
            elsif suppress_log_output?(o)
              STDERR
            else
              STDOUT
            end

      Inspec::Log.init(loc)
      Inspec::Log.level = get_log_level(o.log_level)

      o[:logger] = Logger.new(loc)
      # output json if we have activated the json formatter
      if o['log-format'] == 'json'
        o[:logger].formatter = Logger::JSONFormatter.new
      end
      o[:logger].level = get_log_level(o.log_level)
    end
  end
end
