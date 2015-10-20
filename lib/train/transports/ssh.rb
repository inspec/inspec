# -*- encoding: utf-8 -*-
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)
#
# Copyright (C) 2014, Fletcher Nichol
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

require 'net/ssh'
require 'net/scp'
require 'train/errors'

module Train::Transports
  # Wrapped exception for any internally raised SSH-related errors.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class SSHFailed < Train::TransportError; end

  # A Transport which uses the SSH protocol to execute commands and transfer
  # files.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class SSH < Train.plugin(1)
    name 'ssh'

    autoload :Connection, 'train/transports/ssh_connection'

    # add options for submodules
    include_options Train::Extras::CommandWrapper

    # common target configuration
    option :host,      required: true
    option :port,      default: 22, required: true
    option :user,      default: 'root', required: true
    option :key_files, default: nil
    option :password,  default: nil

    # additional ssh options
    option :keepalive, default: true
    option :keepalive_interval, default: 60
    option :connection_timeout, default: 15
    option :connection_retries, default: 5
    option :connection_retry_sleep, default: 1
    option :max_wait_until_ready, default: 600
    option :compression, default: true

    option :compression_level do |opts|
      # on nil or false: set compression level to 0
      opts[:compression] ? 6 : 0
    end

    # (see Base#connection)
    def connection(state = {}, &block)
      opts = merge_options(options, state || {})
      validate_options(opts)
      conn_opts = connection_options(opts)

      if defined?(@connection) && @connection_options == conn_opts
        reuse_connection(&block)
      else
        create_new_connection(conn_opts, &block)
      end
    end

    private

    def validate_options(options)
      super(options)

      key_files = Array(options[:key_files])
      if key_files.empty? and options[:password].nil?
        fail Train::ClientError,
             'You must configure at least one authentication method for SSH:'\
             ' Password or key.'
      end

      options[:auth_methods] ||= ['none']

      unless key_files.empty?
        options[:auth_methods].push('publickey')
        options[:keys_only] = true if options[:password].nil?
        options[:key_files] = key_files
      end

      unless options[:password].nil? # rubocop:disable Style/IfUnlessModifier
        options[:auth_methods].push('password')
      end

      super
      self
    end

    # Builds the hash of options needed by the Connection object on
    # construction.
    #
    # @param opts [Hash] merged configuration and mutable state data
    # @return [Hash] hash of connection options
    # @api private
    def connection_options(opts)
      {
        logger:                 logger,
        user_known_hosts_file:  '/dev/null',
        paranoid:               false,
        hostname:               opts[:host],
        port:                   opts[:port],
        username:               opts[:user],
        compression:            opts[:compression],
        compression_level:      opts[:compression_level],
        keepalive:              opts[:keepalive],
        keepalive_interval:     opts[:keepalive_interval],
        timeout:                opts[:connection_timeout],
        connection_retries:     opts[:connection_retries],
        connection_retry_sleep: opts[:connection_retry_sleep],
        max_wait_until_ready:   opts[:max_wait_until_ready],
        auth_methods:           opts[:auth_methods],
        keys_only:              opts[:keys_only],
        keys:                   opts[:key_files],
        password:               opts[:password],
        forward_agent:          opts[:forward_agent],
        transport_options:      opts,
      }
    end

    # Creates a new SSH Connection instance and save it for potential future
    # reuse.
    #
    # @param options [Hash] conneciton options
    # @return [Ssh::Connection] an SSH Connection instance
    # @api private
    def create_new_connection(options, &block)
      if defined?(@connection)
        logger.debug("[SSH] shutting previous connection #{@connection}")
        @connection.close
      end

      @connection_options = options
      conn = Connection.new(options, &block)
      @connection = conn unless conn.nil?
    end

    # Return the last saved SSH connection instance.
    #
    # @return [Ssh::Connection] an SSH Connection instance
    # @api private
    def reuse_connection
      logger.debug("[SSH] reusing existing connection #{@connection}")
      yield @connection if block_given?
      @connection
    end
  end
end
