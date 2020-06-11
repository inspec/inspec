# encoding: utf-8

require_relative "../errors"
require_relative "../extras"
require_relative "../file"
require "logger"

class Train::Plugins::Transport
  # A Connection instance can be generated and re-generated, given new
  # connection details such as connection port, hostname, credentials, etc.
  # This object is responsible for carrying out the actions on the remote
  # host such as executing commands, transferring files, etc.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class BaseConnection
    include Train::Extras

    # Create a new Connection instance.
    #
    # @param options [Hash] connection options
    # @yield [self] yields itself for block-style invocation
    def initialize(options = nil)
      @options = options || {}
      @logger = @options.delete(:logger) || Logger.new($stdout, level: :fatal)
      Train::Platforms::Detect::Specifications::OS.load
      Train::Platforms::Detect::Specifications::Api.load

      # default caching options
      @cache_enabled = {
        file: true,
        command: false,
        api_call: false,
      }

      @cache = {}
      @cache_enabled.each_key do |type|
        clear_cache(type)
      end
    end

    def with_sudo_pty
      yield
    end

    # Returns cached client if caching enabled. Otherwise returns whatever is
    # given in the block.
    #
    # @example
    #
    #   def demo_client
    #     cached_client(:api_call, :demo_connection) do
    #       DemoClient.new(args)
    #     end
    #   end
    #
    # @param [symbol] type one of [:api_call, :file, :command]
    # @param [symbol] key for your cached connection
    def cached_client(type, key)
      return yield unless cache_enabled?(type)

      @cache[type][key] ||= yield
    end

    def cache_enabled?(type)
      @cache_enabled[type.to_sym]
    end

    # Enable caching types for Train. Currently we support
    # :api_call, :file and :command types
    def enable_cache(type)
      raise Train::UnknownCacheType, "#{type} is not a valid cache type" unless @cache_enabled.keys.include?(type.to_sym)

      @cache_enabled[type.to_sym] = true
    end

    def disable_cache(type)
      raise Train::UnknownCacheType, "#{type} is not a valid cache type" unless @cache_enabled.keys.include?(type.to_sym)

      @cache_enabled[type.to_sym] = false
      clear_cache(type.to_sym)
    end

    # Closes the session connection, if it is still active.
    def close
      # this method may be left unimplemented if that is applicable
    end

    def to_json
      {
        "files" => Hash[@cache[:file].map { |x, y| [x, y.to_json] }],
      }
    end

    def load_json(j)
      require_relative "../transports/mock"
      j["files"].each do |path, jf|
        @cache[:file][path] = Train::Transports::Mock::Connection::File.from_json(jf)
      end
    end

    def force_platform!(name, platform_details = nil)
      plat = Train::Platforms.name(name)
      plat.backend = self
      plat.platform = platform_details unless platform_details.nil?
      plat.find_family_hierarchy
      plat.add_platform_methods
      plat
    end

    def backend_type
      @options[:backend] || "unknown"
    end

    def inspect
      "%s[%s]" % [self.class, backend_type]
    end

    alias direct_platform force_platform!

    # Get information on the operating system which this transport connects to.
    #
    # @return [Platform] system information
    def platform
      @platform ||= Train::Platforms::Detect.scan(self)
    end
    # we need to keep os as a method for backwards compatibility with inspec
    alias os platform

    # This is the main command call for all connections. This will call the private
    # run_command_via_connection on the connection with optional caching
    #
    # This command accepts an optional data handler block. When provided,
    # inbound data will be published vi `data_handler.call(data)`. This can allow
    # callers to receive and render updates from remote command execution.
    def run_command(cmd, &data_handler)
      return run_command_via_connection(cmd, &data_handler) unless cache_enabled?(:command)

      @cache[:command][cmd] ||= run_command_via_connection(cmd, &data_handler)
    end

    # This is the main file call for all connections. This will call the private
    # file_via_connection on the connection with optional caching
    def file(path, *args)
      return file_via_connection(path, *args) unless cache_enabled?(:file)

      @cache[:file][path] ||= file_via_connection(path, *args)
    end

    # Builds a LoginCommand which can be used to open an interactive
    # session on the remote host.
    #
    # @return [LoginCommand] array of command line tokens
    def login_command
      raise NotImplementedError, "#{self.class} does not implement #login_command()"
    end

    # Block and return only when the remote host is prepared and ready to
    # execute command and upload files. The semantics and details will
    # vary by implementation, but a round trip through the hosted
    # service is preferred to simply waiting on a socket to become
    # available.
    def wait_until_ready
      # this method may be left unimplemented if that is applicablelog
    end

    private

    # Execute a command using this connection.
    #
    # @param command [String] command string to execute
    # @param &data_handler(data) [Proc] proc that is called when data arrives from
    # the connection.  This block is optional. Individual transports will need
    # to explicitly invoke the block in their implementation of run_command_via_connection;
    # if they do not, the block is ignored and will not be used to report data back to the caller.
    #
    # @return [CommandResult] contains the result of running the command
    def run_command_via_connection(_command, &_data_handler)
      raise NotImplementedError, "#{self.class} does not implement #run_command_via_connection()"
    end

    # Interact with files on the target. Read, write, and get metadata
    # from files via the transport.
    #
    # @param [String] path which is being inspected
    # @return [FileCommon] file object that allows for interaction
    def file_via_connection(_path, *_args)
      raise NotImplementedError, "#{self.class} does not implement #file_via_connection(...)"
    end

    def clear_cache(type)
      @cache[type.to_sym] = {}
    end

    # @return [Logger] logger for reporting information
    # @api private
    attr_reader :logger

    # @return [Hash] connection options
    # @api private
    attr_reader :options
  end
end
