# encoding: utf-8

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

# Most of the work of a Train plugin happens in this file.
# Connections derive from Train::Plugins::Transport::BaseConnection,
# and provide a variety of services.  Later generations of the plugin
# API will likely separate out these responsibilities, but for now,
# some of the responsibilities include:
# * authentication to the target
# * platform / release /family detection
# * caching
# * API execution
# * marshalling to / from JSON
# You don't have to worry about most of this.

require "train"
require "train/plugins"

module TrainPlugins
  module WinRM
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class Connection < Train::Plugins::Transport::BaseConnection # rubocop:disable Metrics/ClassLength
      attr_reader :hostname
      def initialize(options)
        super(options)
        @hostname               = @options.delete(:hostname)
        @rdp_port               = @options.delete(:rdp_port)
        @connection_retries     = @options.delete(:connection_retries)
        @connection_retry_sleep = @options.delete(:connection_retry_sleep)
        @max_wait_until_ready   = @options.delete(:max_wait_until_ready)
        @operation_timeout      = @options.delete(:operation_timeout)
      end

      # (see Base::Connection#close)
      def close
        return if @session.nil?

        session.close
      ensure
        @session = nil
      end

      # (see Base::Connection#login_command)
      def login_command
        case RbConfig::CONFIG["host_os"]
        when /darwin/
          login_command_for_mac
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          login_command_for_windows
        when /linux/
          login_command_for_linux
        else
          raise ActionFailed,
            "Remote login not supported in #{self.class} " \
            "from host OS '#{RbConfig::CONFIG["host_os"]}'."
        end
      end

      # (see Base::Connection#upload)
      def upload(locals, remote)
        file_manager.upload(locals, remote)
      end

      def download(remotes, local)
        Array(remotes).each do |remote|
          file_manager.download(remote, local)
        end
      end

      # (see Base::Connection#wait_until_ready)
      def wait_until_ready
        delay = 3
        session(
          retry_limit: @max_wait_until_ready / delay,
          retry_delay: delay
        )
        run_command_via_connection(PING_COMMAND.dup)
      end

      def uri
        "winrm://#{options[:user]}@#{options[:endpoint]}:#{@rdp_port}"
      end

      private

      PING_COMMAND = "Write-Host '[WinRM] Established\n'".freeze

      def file_via_connection(path)
        Train::File::Remote::Windows.new(self, path)
      end

      def run_command_via_connection(command, &data_handler)
        return if command.nil?

        logger.debug("[WinRM] #{self} (#{command})")
        out = ""

        response = session.run(command) do |stdout, _|
          yield(stdout) if data_handler && stdout
          out << stdout if stdout
        end

        CommandResult.new(out, response.stderr, response.exitcode)
      end

      # Create a local RDP document and return it
      #
      # @param opts [Hash] configuration options
      # @option opts [true,false] :mac whether or not the document is for a
      #   Mac system
      # @api private
      def rdp_doc(opts = {})
        host = URI.parse(options[:endpoint]).host
        content = [
          "full address:s:#{host}:#{@rdp_port}",
          "prompt for credentials:i:1",
          "username:s:#{options[:user]}",
        ].join("\n")

        content.prepend("drivestoredirect:s:*\n") if opts[:mac]

        content
      end

      # @return [Winrm::FileManager] a file transporter
      # @api private
      def file_manager
        @file_manager ||= begin
          # Ensure @service is available:
          wait_until_ready
          ::WinRM::FS::FileManager.new(@service)
        end
      end

      # Builds a `LoginCommand` for use by Linux-based platforms.
      #
      # TODO: determine whether or not `desktop` exists
      #
      # @return [LoginCommand] a login command
      # @api private
      def login_command_for_linux
        args  = %W{-u #{options[:user]}}
        args += %W{-p #{options[:pass]}} if options.key?(:pass)
        args += %W{#{URI.parse(options[:endpoint]).host}:#{@rdp_port}}
        LoginCommand.new("rdesktop", args)
      end

      # Builds a `LoginCommand` for use by Mac-based platforms.
      #
      # @return [LoginCommand] a login command
      # @api private
      def login_command_for_mac
        LoginCommand.new("open", rdp_doc(mac: true))
      end

      # Builds a `LoginCommand` for use by Windows-based platforms.
      #
      # @return [LoginCommand] a login command
      # @api private
      def login_command_for_windows
        LoginCommand.new("mstsc", rdp_doc)
      end

      # Establishes a remote shell session, or establishes one when invoked
      # the first time.
      #
      # @param retry_options [Hash] retry options for the initial connection
      # @return [Winrm::CommandExecutor] the command executor session
      # @api private
      def session(retry_options = {})
        @session ||= begin
          opts = {
            retry_limit: @connection_retries.to_i,
            retry_delay: @connection_retry_sleep.to_i,
          }.merge(retry_options)

          opts[:operation_timeout] = @operation_timeout unless @operation_timeout.nil?
          @service = ::WinRM::Connection.new(options.merge(opts))
          @service.logger = logger
          @service.shell(:powershell)
        end
      end

      # String representation of object, reporting its connection details and
      # configuration.
      #
      # @api private
      def to_s
        options_to_print = @options.clone
        options_to_print[:password] = "<hidden>" if options_to_print.key?(:password)
        "#{@username}@#{@hostname}<#{options_to_print.inspect}>"
      end
    end
  end
end
