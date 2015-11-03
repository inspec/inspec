# -*- encoding: utf-8 -*-
#
# Author:: Salim Afiune (<salim@afiunemaya.com.mx>)
# Author:: Matt Wrock (<matt@mattwrock.com>)
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)
#
# Copyright (C) 2014, Salim Afiune
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Train::Transports::WinRM
  # A Connection instance can be generated and re-generated, given new
  # connection details such as connection port, hostname, credentials, etc.
  # This object is responsible for carrying out the actions on the remote
  # host such as executing commands, transferring files, etc.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class Connection < BaseConnection # rubocop:disable Metrics/ClassLength
    def initialize(options)
      super(options)
      @endpoint               = @options.delete(:endpoint)
      @rdp_port               = @options.delete(:rdp_port)
      @winrm_transport        = @options.delete(:winrm_transport)
      @connection_retries     = @options.delete(:connection_retries)
      @connection_retry_sleep = @options.delete(:connection_retry_sleep)
      @max_wait_until_ready   = @options.delete(:max_wait_until_ready)
      @files                  = {}
    end

    # (see Base::Connection#close)
    def close
      return if @session.nil?
      shell_id = session.shell
      logger.debug("[WinRM] closing remote shell #{shell_id} on #{self}")
      session.close
      logger.debug("[WinRM] remote shell #{shell_id} closed")
    ensure
      @session = nil
    end

    def os
      @os ||= OS.new(self)
    end

    def file(path)
      @files[path] ||= WindowsFile.new(self, path)
    end

    def run_command(command)
      return if command.nil?
      logger.debug("[WinRM] #{self} (#{command})")
      out = ''

      response = session.run_powershell_script(command) do |stdout, _|
        out << stdout if stdout
      end

      CommandResult.new(out, response.stderr, response[:exitcode])
    end

    # (see Base::Connection#login_command)
    def login_command
      case RbConfig::CONFIG['host_os']
      when /darwin/
        login_command_for_mac
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        login_command_for_windows
      when /linux/
        login_command_for_linux
      else
        fail ActionFailed,
             "Remote login not supported in #{self.class} " \
             "from host OS '#{RbConfig::CONFIG['host_os']}'."
      end
    end

    # (see Base::Connection#upload)
    def upload(locals, remote)
      file_transporter.upload(locals, remote)
    end

    # (see Base::Connection#wait_until_ready)
    def wait_until_ready
      delay = 3
      session(
        retries: @max_wait_until_ready / delay,
        delay:   delay,
        message: "Waiting for WinRM service on #{endpoint}, "\
                 "retrying in #{delay} seconds",
      )
      execute(PING_COMMAND.dup)
    end

    private

    PING_COMMAND = "Write-Host '[WinRM] Established\n'".freeze

    RESCUE_EXCEPTIONS_ON_ESTABLISH = lambda do
      [
        Errno::EACCES, Errno::EADDRINUSE, Errno::ECONNREFUSED,
        Errno::ECONNRESET, Errno::ENETUNREACH, Errno::EHOSTUNREACH,
        ::WinRM::WinRMHTTPTransportError, ::WinRM::WinRMAuthorizationError,
        HTTPClient::KeepAliveDisconnected,
        HTTPClient::ConnectTimeoutError
      ].freeze
    end

    # Create a local RDP document and return it
    #
    # @param opts [Hash] configuration options
    # @option opts [true,false] :mac whether or not the document is for a
    #   Mac system
    # @api private
    def rdp_doc(opts = {})
      host = URI.parse(@endpoint).host
      content = [
        "full address:s:#{host}:#{@rdp_port}",
        'prompt for credentials:i:1',
        "username:s:#{options[:user]}",
      ].join("\n")

      content.prepend("drivestoredirect:s:*\n") if opts[:mac]

      content
    end

    # Establish a remote shell session on the remote host.
    #
    # @param opts [Hash] retry options
    # @option opts [Integer] :retries the number of times to retry before
    #   failing
    # @option opts [Float] :delay the number of seconds to wait until
    #   attempting a retry
    # @option opts [String] :message an optional message to be logged on
    #   debug (overriding the default) when a rescuable exception is raised
    # @return [Winrm::CommandExecutor] the command executor session
    # @api private
    def establish_shell(opts)
      service_args = [@endpoint, @winrm_transport, options]
      @service = ::WinRM::WinRMWebService.new(*service_args)
      closer = WinRM::Transport::ShellCloser.new("#{self}", false, service_args)

      executor = WinRM::Transport::CommandExecutor.new(@service, logger, closer)
      retryable(opts) do
        logger.debug("[WinRM] opening remote shell on #{self}")
        shell_id = executor.open
        logger.debug("[WinRM] remote shell #{shell_id} is open on #{self}")
      end
      executor
    end

    # @return [Winrm::FileTransporter] a file transporter
    # @api private
    def file_transporter
      @file_transporter ||= WinRM::Transport::FileTransporter.new(session, logger)
    end

    # Builds a `LoginCommand` for use by Linux-based platforms.
    #
    # TODO: determine whether or not `desktop` exists
    #
    # @return [LoginCommand] a login command
    # @api private
    def login_command_for_linux
      args  = %W( -u #{options[:user]} )
      args += %W( -p #{options[:pass]} ) if options.key?(:pass)
      args += %W( #{URI.parse(@endpoint).host}:#{@rdp_port} )
      LoginCommand.new('rdesktop', args)
    end

    # Builds a `LoginCommand` for use by Mac-based platforms.
    #
    # @return [LoginCommand] a login command
    # @api private
    def login_command_for_mac
      LoginCommand.new('open', rdp_doc(mac: true))
    end

    # Builds a `LoginCommand` for use by Windows-based platforms.
    #
    # @return [LoginCommand] a login command
    # @api private
    def login_command_for_windows
      LoginCommand.new('mstsc', rdp_doc)
    end

    # Yields to a block and reties the block if certain rescuable
    # exceptions are raised.
    #
    # @param opts [Hash] retry options
    # @option opts [Integer] :retries the number of times to retry before
    #   failing
    # @option opts [Float] :delay the number of seconds to wait until
    #   attempting a retry
    # @option opts [String] :message an optional message to be logged on
    #   debug (overriding the default) when a rescuable exception is raised
    # @return [Winrm::CommandExecutor] the command executor session
    # @api private
    def retryable(opts)
      yield
    rescue *RESCUE_EXCEPTIONS_ON_ESTABLISH.call => e
      if (opts[:retries] -= 1) <= 0
        logger.warn("[WinRM] connection failed, terminating (#{e.inspect})")
        raise
      end

      if opts[:message]
        logger.debug("[WinRM] connection failed (#{e.inspect})")
        message = opts[:message]
      else
        message = '[WinRM] connection failed, '\
                  "retrying in #{opts[:delay]} seconds (#{e.inspect})"
      end
      logger.info(message)
      sleep(opts[:delay])
      retry
    end

    # Establishes a remote shell session, or establishes one when invoked
    # the first time.
    #
    # @param retry_options [Hash] retry options for the initial connection
    # @return [Winrm::CommandExecutor] the command executor session
    # @api private
    def session(retry_options = {})
      @session ||= establish_shell({
        retries: @connection_retries.to_i,
        delay:   @connection_retry_sleep.to_i,
      }.merge(retry_options))
    end

    # String representation of object, reporting its connection details and
    # configuration.
    #
    # @api private
    def to_s
      "#{@winrm_transport}::#{@endpoint}<#{options.inspect}>"
    end

    class OS < OSCommon
      def initialize(backend)
        super(backend, { family: 'windows' })
      end
    end
  end
end
