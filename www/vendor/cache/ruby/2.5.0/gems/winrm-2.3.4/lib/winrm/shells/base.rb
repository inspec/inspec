# Copyright 2016 Shawn Neal <sneal@sneal.net>
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

require_relative 'retryable'
require_relative '../http/transport'
require_relative '../wsmv/cleanup_command'
require_relative '../wsmv/close_shell'
require_relative '../wsmv/command'
require_relative '../wsmv/command_output'
require_relative '../wsmv/receive_response_reader'
require_relative '../wsmv/create_shell'
require_relative '../wsmv/soap'

module WinRM
  module Shells
    # Base class for remote shell
    class Base
      TOO_MANY_COMMANDS = '2150859174'.freeze
      ERROR_OPERATION_ABORTED = '995'.freeze
      SHELL_NOT_FOUND = '2150858843'.freeze

      FAULTS_FOR_RESET = [
        '2150858843', # Shell has been closed
        '2147943418', # Error reading registry key
        TOO_MANY_COMMANDS, # Maximum commands per user exceeded
      ].freeze

      include Retryable

      # Create a new Cmd shell
      # @param connection_opts [ConnectionOpts] The WinRM connection options
      # @param transport [HttpTransport] The WinRM SOAP transport
      # @param logger [Logger] The logger to log diagnostic messages to
      # @param shell_opts [Hash] Options targeted for the created shell
      def initialize(connection_opts, transport, logger, shell_opts = {})
        @connection_opts = connection_opts
        @transport = transport
        @logger = logger
        @shell_opts = shell_opts
      end

      # @return [String] shell id of the currently opn shell or nil if shell is closed
      attr_reader :shell_id

      # @return [String] uri that SOAP calls use to identify shell type
      attr_reader :shell_uri

      # @return [ConnectionOpts] connection options of the shell
      attr_reader :connection_opts

      # @return [WinRM::HTTP::HttpTransport] transport used to talk with endpoint
      attr_reader :transport

      # @return [Logger] logger used for diagnostic messages
      attr_reader :logger

      # @return [Hash] Options targeted for the created shell
      attr_reader :shell_opts

      # Runs the specified command with optional arguments
      # @param command [String] The command or executable to run
      # @param arguments [Array] The optional command arguments
      # @param block [&block] The optional callback for any realtime output
      # @yieldparam [string] standard out response text
      # @yieldparam [string] standard error response text
      # @yieldreturn [WinRM::Output] The command output
      def run(command, arguments = [], &block)
        with_command_shell(command, arguments) do |shell, cmd|
          response_reader.read_output(command_output_message(shell, cmd), &block)
        end
      end

      # Closes the shell if one is open
      def close
        return unless shell_id

        begin
          self.class.close_shell(connection_opts, transport, shell_id)
        rescue WinRMWSManFault => e
          raise unless [ERROR_OPERATION_ABORTED, SHELL_NOT_FOUND].include?(e.fault_code)
        end
        remove_finalizer
        @shell_id = nil
      end

      protected

      def send_command(_command, _arguments)
        raise NotImplementedError
      end

      def response_reader
        raise NotImplementedError
      end

      def open_shell
        raise NotImplementedError
      end

      def out_streams
        raise NotImplementedError
      end

      def command_output_message(shell_id, command_id)
        cmd_out_opts = {
          shell_id: shell_id,
          command_id: command_id,
          shell_uri: shell_uri,
          out_streams: out_streams
        }
        WinRM::WSMV::CommandOutput.new(connection_opts, cmd_out_opts)
      end

      def with_command_shell(command, arguments = [])
        tries ||= 2

        open unless shell_id
        command_id = send_command(command, arguments)
        logger.debug("[WinRM] creating command_id: #{command_id} on shell_id #{shell_id}")
        yield shell_id, command_id
      rescue WinRMWSManFault => e
        raise unless FAULTS_FOR_RESET.include?(e.fault_code) && (tries -= 1) > 0

        reset_on_error(e)
        retry
      ensure
        cleanup_command(command_id) if command_id
      end

      private

      def reset_on_error(error)
        close if error.fault_code == TOO_MANY_COMMANDS
        logger.debug('[WinRM] opening new shell since the current one was deleted')
        @shell_id = nil
      end

      def cleanup_command(command_id)
        logger.debug("[WinRM] cleaning up command_id: #{command_id} on shell_id #{shell_id}")
        cleanup_msg = WinRM::WSMV::CleanupCommand.new(
          connection_opts,
          shell_uri: shell_uri,
          shell_id: shell_id,
          command_id: command_id
        )
        transport.send_request(cleanup_msg.build)
      rescue WinRMWSManFault => e
        raise unless [ERROR_OPERATION_ABORTED, SHELL_NOT_FOUND].include?(e.fault_code)
      rescue WinRMHTTPTransportError => t
        # dont let the cleanup raise so we dont lose any errors from the command
        logger.info("[WinRM] #{t.status_code} returned in cleanup with error: #{t.message}")
      end

      def open
        close
        retryable(connection_opts[:retry_limit], connection_opts[:retry_delay]) do
          logger.debug("[WinRM] opening remote shell on #{connection_opts[:endpoint]}")
          @shell_id = open_shell
        end
        logger.debug("[WinRM] remote shell created with shell_id: #{shell_id}")
        add_finalizer
      end

      def add_finalizer
        ObjectSpace.define_finalizer(
          self,
          self.class.finalize(connection_opts, transport, shell_id)
        )
      end

      def remove_finalizer
        ObjectSpace.undefine_finalizer(self)
      end
    end
  end
end
