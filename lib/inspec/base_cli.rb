# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'thor'
require 'inspec/log'
require 'inspec/profile_vendor'

module Inspec
  class BaseCLI < Thor # rubocop:disable Metrics/ClassLength
    def self.target_options
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
      option :password, type: :string,
        desc: 'Login password for a remote scan, if required.'
      option :key_files, aliases: :i, type: :array,
        desc: 'Login key or certificate file for a remote scan.'
      option :path, type: :string,
        desc: 'Login path to use when connecting to the target (WinRM).'
      option :sudo, type: :boolean,
        desc: 'Run scans with sudo. Only activates on Unix and non-root user.'
      option :sudo_password, type: :string,
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
    end

    def self.profile_options
      option :profiles_path, type: :string,
        desc: 'Folder which contains referenced profiles.'
    end

    def self.exec_options
      target_options
      profile_options
      option :controls, type: :array,
        desc: 'A list of controls to run. Ignore all other tests.'
      option :format, type: :string,
        desc: 'Which formatter to use: cli, progress, documentation, json, json-min, junit'
      option :color, type: :boolean, default: true,
        desc: 'Use colors in output.'
      option :attrs, type: :array,
        desc: 'Load attributes file (experimental)'
      option :cache, type: :string,
        desc: 'Use the given path for caching dependencies. (default: ~/.inspec/cache)'
      option :create_lockfile, type: :boolean, default: true,
        desc: 'Write out a lockfile based on this execution (unless one already exists)'
    end

    private

    # helper method to run tests
    def run_tests(targets, opts)
      o = opts.dup
      log_device = opts['format'] == 'json' ? nil : STDOUT
      o[:logger] = Logger.new(log_device)
      o[:logger].level = get_log_level(o.log_level)

      runner = Inspec::Runner.new(o)
      targets.each { |target| runner.add_target(target) }
      exit runner.run
    rescue ArgumentError, RuntimeError, Train::UserError => e
      $stderr.puts e.message
      exit 1
    end

    def diagnose
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

    def opts
      # argv overrides json
      Thor::CoreExt::HashWithIndifferentAccess.new(options_json.merge(options))
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

      JSON.load(config)
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
            elsif %w{json json-min}.include?(o['format'])
              STDERR
            else
              STDOUT
            end

      Inspec::Log.init(loc)
      Inspec::Log.level = get_log_level(o.log_level)

      o[:logger] = Logger.new(STDOUT)
      # output json if we have activated the json formatter
      if opts['log-format'] == 'json'
        o[:logger].formatter = Logger::JSONFormatter.new
      end
      o[:logger].level = get_log_level(o.log_level)
    end

    def mark_text(text)
      "\e[0;36m#{text}\e[0m"
    end

    def headline(title)
      puts "\n== #{title}\n\n"
    end

    def li(entry)
      puts " #{mark_text('*')} #{entry}"
    end
  end
end
