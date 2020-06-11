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

require_relative 'connection_opts'
require_relative 'http/transport_factory'
require_relative 'shells/shell_factory'
require_relative 'wsmv/wql_query'
require_relative 'wsmv/wql_pull'

module WinRM
  # WinRM connection used to establish a session with the remote WinRM service.
  class Connection
    # Creates a new WinRM connection
    # See the ConnectionOpts class for connection options.
    def initialize(connection_opts)
      configure_connection_opts(connection_opts)
      configure_logger
    end

    attr_accessor :logger

    # Creates a new shell on the remote Windows server associated with
    # this connection.
    # @param shell_type [Symbol] The shell type :cmd or :powershell
    # @param shell_opts [Hash] Options targeted for the created shell
    # @return [Shell] PowerShell or Cmd shell instance.
    def shell(shell_type, shell_opts = {})
      shell = shell_factory.create_shell(shell_type, shell_opts)
      if block_given?
        begin
          yield shell
        ensure
          shell.close
        end
      else
        shell
      end
    end

    # Executes a WQL query against the WinRM connection
    # @param wql [String] The wql query
    # @param namespace [String] namespace for query - default is root/cimv2/*
    # @return [Hash] Hash representation of wql query response (Hash is empty if a block is given)
    # @yeild [type, item] Yields the time name and item for every item
    def run_wql(wql, namespace = 'root/cimv2/*', &block)
      query = WinRM::WSMV::WqlQuery.new(transport, @connection_opts, wql, namespace)
      query.process_response(transport.send_request(query.build), &block)
    end

    private

    def configure_connection_opts(connection_opts)
      @connection_opts = ConnectionOpts.create_with_defaults(connection_opts)
    end

    def configure_logger
      @logger = Logging.logger[self]
      logger.level = :warn
      logger.add_appenders(Logging.appenders.stdout)
    end

    def shell_factory
      @shell_factory ||= WinRM::Shells::ShellFactory.new(@connection_opts, transport, logger)
    end

    def transport
      @transport ||= begin
        transport_factory = WinRM::HTTP::TransportFactory.new
        transport_factory.create_transport(@connection_opts)
      end
    end
  end
end
