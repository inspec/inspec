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

require_relative 'base'
require_relative 'cmd'
require_relative 'power_shell'

module WinRM
  module Shells
    # Factory for creating concrete shell instances
    class ShellFactory
      # Creates a new ShellFactory instance
      # @param connection_opts [ConnectionOpts] The WinRM connection options
      # @param transport [HttpTransport] The WinRM SOAP transport for sending messages
      # @param logger [Logger] The logger to log messages to
      def initialize(connection_opts, transport, logger)
        @connection_opts = connection_opts
        @transport = transport
        @logger = logger
      end

      # Creates a new shell instance based off the shell_type
      # @param shell_type [Symbol] The shell type :cmd or :powershell
      # @param shell_opts [Hash] Options targeted for the created shell
      # @return The ready to use shell instance
      def create_shell(shell_type, shell_opts = {})
        type = shell_type.to_s.capitalize.to_sym
        args = [
          @connection_opts,
          @transport,
          @logger
        ]
        # winrm-elevated has an initializer with no shell_opts so don't break it
        args << shell_opts unless shell_opts.nil? || shell_opts.empty?
        if Shells.constants.include?(type)
          WinRM::Shells.const_get(type).new(*args)
        else
          message = "#{type} is not a valid WinRM shell type. " \
            'Expected either :cmd, :powershell or pluggable shell.'
          raise WinRM::InvalidShellError, message
        end
      end
    end
  end
end
