# -*- encoding: utf-8 -*-
#
# Author:: Salim Afiune (<salim@afiunemaya.com.mx>)
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
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

require "kitchen/errors"
require "kitchen/lazy_hash"
require "kitchen/login_command"

module Kitchen

  module Transport

    # Wrapped exception for any internally raised Transport errors.
    #
    # @author Salim Afiune <salim@afiunemaya.com.mx>
    class TransportFailed < TransientFailure; end

    # Base class for a transport.
    #
    # @author Salim Afiune <salim@afiunemaya.com.mx>
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class Base

      include Configurable
      include Logging

      # Create a new transport by providing a configuration hash.
      #
      # @param config [Hash] initial provided configuration
      def initialize(config = {})
        init_config(config)
      end

      # Creates a new Connection, configured by a merging of configuration
      # and state data. Depending on the implementation, the Connection could
      # be saved or cached to speed up multiple calls, given the same state
      # hash as input.
      #
      # @param state [Hash] mutable instance state
      # @return [Connection] a connection for this transport
      # @raise [TransportFailed] if a connection could not be returned
      def connection(state) # rubocop:disable Lint/UnusedMethodArgument
        raise ClientError, "#{self.class}#connection must be implemented"
      end

      # A Connection instance can be generated and re-generated, given new
      # connection details such as connection port, hostname, credentials, etc.
      # This object is responsible for carrying out the actions on the remote
      # host such as executing commands, transferring files, etc.
      #
      # @author Fletcher Nichol <fnichol@nichol.ca>
      class Connection

        include Logging

        # Create a new Connection instance.
        #
        # @param options [Hash] connection options
        # @yield [self] yields itself for block-style invocation
        def initialize(options = {})
          init_options(options)

          if block_given?
            yield self
          end
        end

        # Closes the session connection, if it is still active.
        def close
          # this method may be left unimplemented if that is applicable
        end

        # Execute a command on the remote host.
        #
        # @param command [String] command string to execute
        # @raise [TransportFailed] if the command does not exit successfully,
        #   which may vary by implementation
        def execute(command) # rubocop:disable Lint/UnusedMethodArgument
          raise ClientError, "#{self.class}#execute must be implemented"
        end

        # Builds a LoginCommand which can be used to open an interactive
        # session on the remote host.
        #
        # @return [LoginCommand] an object containing the array of command line
        #   tokens and exec options to be used in a fork/exec
        # @raise [ActionFailed] if the action could not be completed
        def login_command
          raise ActionFailed, "Remote login not supported in #{self.class}."
        end

        # Uploads local files or directories to remote host.
        #
        # @param locals [Array<String>] paths to local files or directories
        # @param remote [String] path to remote destination
        # @raise [TransportFailed] if the files could not all be uploaded
        #   successfully, which may vary by implementation
        def upload(locals, remote) # rubocop:disable Lint/UnusedMethodArgument
          raise ClientError, "#{self.class}#upload must be implemented"
        end

        # Block and return only when the remote host is prepared and ready to
        # execute command and upload files. The semantics and details will
        # vary by implementation, but a round trip through the hosted
        # service is preferred to simply waiting on a socket to become
        # available.
        def wait_until_ready
          # this method may be left unimplemented if that is applicable
        end

        private

        # @return [Kitchen::Logger] a logger
        # @api private
        attr_reader :logger

        # @return [Hash] connection options
        # @api private
        attr_reader :options

        # Initialize incoming options for use by the object.
        #
        # @param options [Hash] configuration options
        def init_options(options)
          @options = options.dup
          @logger = @options.delete(:logger) || Kitchen.logger
        end
      end

      # Sets the API version for this transport. If the transport does not set
      # this value, then `nil` will be used and reported.
      #
      # Sets the API version for this transport
      #
      # @example setting an API version
      #
      #   module Kitchen
      #     module Transport
      #       class NewTransport < Kitchen::Transport::Base
      #
      #         kitchen_transport_api_version 2
      #
      #       end
      #     end
      #   end
      #
      # @param version [Integer,String] a version number
      #
      def self.kitchen_transport_api_version(version)
        @api_version = version
      end
    end
  end
end
