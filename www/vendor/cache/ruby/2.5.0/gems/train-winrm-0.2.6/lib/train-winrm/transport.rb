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

require "rbconfig"
require "uri"
require "train"
require "train/errors"
require "train/plugins"

# Train Plugins v1 are usually declared under the TrainPlugins namespace.
# Each plugin has three components: Transport, Connection, and (optionally) Platform.
# We'll only define the Transport here, but we'll refer to the others.

module TrainPlugins
  module WinRM
    # Wrapped exception for any internally raised WinRM-related errors.
    #
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class WinRMFailed < Train::TransportError; end

    # A Transport which uses WinRM to execute commands and transfer files.
    #
    # @author Matt Wrock <matt@mattwrock.com>
    # @author Salim Afiune <salim@afiunemaya.com.mx>
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class Transport < Train.plugin(1) # rubocop:disable Metrics/ClassLength
      name "winrm"

      require_relative "connection"

      # ref: https://github.com/winrb/winrm#transports
      SUPPORTED_WINRM_TRANSPORTS = %i{negotiate ssl plaintext kerberos}.freeze

      # common target configuration
      option :host, required: true
      option :port
      option :user, default: "administrator", required: true
      option :password, nil
      option :winrm_transport, default: :negotiate
      option :winrm_disable_sspi, default: false
      option :winrm_basic_auth_only, default: false
      option :path, default: "/wsman"
      option :ssl, default: false
      option :self_signed, default: false

      # additional winrm options
      option :rdp_port, default: 3389
      option :connection_retries, default: 5
      option :connection_retry_sleep, default: 1
      option :max_wait_until_ready, default: 600
      option :ssl_peer_fingerprint, default: nil
      option :kerberos_realm, default: nil
      option :kerberos_service, default: nil
      option :ca_trust_file, default: nil
      # The amount of time in SECONDS for which each operation must get an ack
      # from the winrm endpoint. Does not mean that the command has
      # completed in this time, only that the server has ack'd the request.
      option :operation_timeout, default: nil

      def initialize(opts)
        super(opts)
        load_needed_dependencies!
      end

      # (see Base#connection)
      def connection(state = nil, &block)
        opts = merge_options(options, state || {})
        validate_options(opts)
        conn_opts = connection_options(opts)

        if @connection && @connection_options == conn_opts
          reuse_connection(&block)
        else
          create_new_connection(conn_opts, &block)
        end
      end

      private

      def validate_options(opts)
        super(opts)

        # set scheme and port based on ssl activation
        scheme = opts[:ssl] ? "https" : "http"
        port = opts[:port]
        port = (opts[:ssl] ? 5986 : 5985) if port.nil?
        winrm_transport = opts[:winrm_transport].to_sym
        unless SUPPORTED_WINRM_TRANSPORTS.include?(winrm_transport)
          raise Train::ClientError, "Unsupported transport type: #{winrm_transport.inspect}"
        end

        # remove leading '/'
        path = (opts[:path] || "").sub(%r{^/+}, "")

        opts[:endpoint] = "#{scheme}://#{opts[:host]}:#{port}/#{path}"
      end

      WINRM_FS_SPEC_VERSION = "~> 1.0".freeze

      # Builds the hash of options needed by the Connection object on
      # construction.
      #
      # @param data [Hash] merged configuration and mutable state data
      # @return [Hash] hash of connection options
      # @api private
      def connection_options(opts)
        {
          logger: logger,
          transport: opts[:winrm_transport].to_sym,
          disable_sspi: opts[:winrm_disable_sspi],
          basic_auth_only: opts[:winrm_basic_auth_only],
          hostname: opts[:host],
          endpoint: opts[:endpoint],
          user: opts[:user],
          password: opts[:password],
          rdp_port: opts[:rdp_port],
          connection_retries: opts[:connection_retries],
          connection_retry_sleep: opts[:connection_retry_sleep],
          max_wait_until_ready: opts[:max_wait_until_ready],
          no_ssl_peer_verification: opts[:self_signed],
          realm: opts[:kerberos_realm],
          service: opts[:kerberos_service],
          ca_trust_file: opts[:ca_trust_file],
          ssl_peer_fingerprint: opts[:ssl_peer_fingerprint],
        }
      end

      # Creates a new WinRM Connection instance and save it for potential
      # future reuse.
      #
      # @param options [Hash] conneciton options
      # @return [WinRM::Connection] a WinRM Connection instance
      # @api private
      def create_new_connection(options, &block)
        if @connection
          logger.debug("[WinRM] shutting previous connection #{@connection}")
          @connection.close
        end

        @connection_options = options
        @connection = Connection.new(options, &block)
      end

      # (see Base#load_needed_dependencies!)
      def load_needed_dependencies!
        spec_version = WINRM_FS_SPEC_VERSION.dup
        logger.debug("winrm-fs requested," \
          " loading WinRM::FS gem (#{spec_version})")
        gem "winrm-fs", spec_version
        first_load = require "winrm-fs"
        load_winrm_transport!

        if first_load
          logger.debug("WinRM::FS library loaded")
        else
          logger.debug("WinRM::FS previously loaded")
        end
      rescue LoadError => e
        logger.fatal(
          "The `winrm-fs' gem is missing and must" \
          " be installed or cannot be properly activated. Run" \
          " `gem install winrm-fs --version '#{spec_version}'`" \
          " or add the following to your Gemfile if you are using Bundler:" \
          " `gem 'winrm-fs', '#{spec_version}'`."
        )
        raise Train::UserError,
          "Could not load or activate WinRM::FS (#{e.message})"
      end

      # Load WinRM::Transport code.
      #
      # @api private
      def load_winrm_transport!
        silence_warnings { require "winrm-fs" }
      end

      # Return the last saved WinRM connection instance.
      #
      # @return [Winrm::Connection] a WinRM Connection instance
      # @api private
      def reuse_connection
        logger.debug("[WinRM] reusing existing connection #{@connection}")
        yield @connection if block_given?
        @connection
      end

      def silence_warnings
        old_verbose = $VERBOSE
        $VERBOSE = nil
        yield
      ensure
        $VERBOSE = old_verbose
      end
    end
  end
end
