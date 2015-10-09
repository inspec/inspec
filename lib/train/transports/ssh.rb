# -*- encoding: utf-8 -*-
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
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

require "kitchen"

require "net/ssh"
require "net/scp"

module Kitchen

  module Transport

    # Wrapped exception for any internally raised SSH-related errors.
    #
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class SshFailed < TransportFailed; end

    # A Transport which uses the SSH protocol to execute commands and transfer
    # files.
    #
    # @author Fletcher Nichol <fnichol@nichol.ca>
    class Ssh < Kitchen::Transport::Base

      kitchen_transport_api_version 1

      plugin_version Kitchen::VERSION

      default_config :port, 22
      default_config :username, "root"
      default_config :keepalive, true
      default_config :keepalive_interval, 60
      default_config :connection_timeout, 15
      default_config :connection_retries, 5
      default_config :connection_retry_sleep, 1
      default_config :max_wait_until_ready, 600

      default_config :ssh_key, nil
      expand_path_for :ssh_key

      default_config :compression, true
      required_config :compression

      default_config :compression_level do |transport|
        transport[:compression] == false ? 0 : 6
      end

      def finalize_config!(instance)
        super

        # zlib was never a valid value and breaks in net-ssh >= 2.10
        # TODO: remove these backwards compatiable casts in 2.0
        case config[:compression]
        when "zlib"
          config[:compression] = "zlib@openssh.com"
        when "none"
          config[:compression] = false
        end

        self
      end

      # (see Base#connection)
      def connection(state, &block)
        options = connection_options(config.to_hash.merge(state))

        if @connection && @connection_options == options
          reuse_connection(&block)
        else
          create_new_connection(options, &block)
        end
      end

      # A Connection instance can be generated and re-generated, given new
      # connection details such as connection port, hostname, credentials, etc.
      # This object is responsible for carrying out the actions on the remote
      # host such as executing commands, transferring files, etc.
      #
      # @author Fletcher Nichol <fnichol@nichol.ca>
      class Connection < Kitchen::Transport::Base::Connection

        # (see Base::Connection#close)
        def close
          return if @session.nil?

          logger.debug("[SSH] closing connection to #{self}")
          session.close
        ensure
          @session = nil
        end

        # (see Base::Connection#execute)
        def execute(command)
          return if command.nil?
          logger.debug("[SSH] #{self} (#{command})")
          exit_code = execute_with_exit_code(command)

          if exit_code != 0
            raise Transport::SshFailed,
              "SSH exited (#{exit_code}) for command: [#{command}]"
          end
        rescue Net::SSH::Exception => ex
          raise SshFailed, "SSH command failed (#{ex.message})"
        end

        # (see Base::Connection#login_command)
        def login_command
          args  = %W[ -o UserKnownHostsFile=/dev/null ]
          args += %W[ -o StrictHostKeyChecking=no ]
          args += %W[ -o IdentitiesOnly=yes ] if options[:keys]
          args += %W[ -o LogLevel=#{logger.debug? ? "VERBOSE" : "ERROR"} ]
          if options.key?(:forward_agent)
            args += %W[ -o ForwardAgent=#{options[:forward_agent] ? "yes" : "no"} ]
          end
          Array(options[:keys]).each { |ssh_key| args += %W[ -i #{ssh_key} ] }
          args += %W[ -p #{port} ]
          args += %W[ #{username}@#{hostname} ]

          LoginCommand.new("ssh", args)
        end

        # (see Base::Connection#upload)
        def upload(locals, remote)
          Array(locals).each do |local|
            opts = File.directory?(local) ? { :recursive => true } : {}

            session.scp.upload!(local, remote, opts) do |_ch, name, sent, total|
              logger.debug("Uploaded #{name} (#{total} bytes)") if sent == total
            end
          end
        rescue Net::SSH::Exception => ex
          raise SshFailed, "SCP upload failed (#{ex.message})"
        end

        # (see Base::Connection#wait_until_ready)
        def wait_until_ready
          delay = 3
          session(
            :retries  => max_wait_until_ready / delay,
            :delay    => delay,
            :message  => "Waiting for SSH service on #{hostname}:#{port}, " \
              "retrying in #{delay} seconds"
          )
          execute(PING_COMMAND.dup)
        end

        private

        PING_COMMAND = "echo '[SSH] Established'".freeze

        RESCUE_EXCEPTIONS_ON_ESTABLISH = [
          Errno::EACCES, Errno::EADDRINUSE, Errno::ECONNREFUSED, Errno::ETIMEDOUT,
          Errno::ECONNRESET, Errno::ENETUNREACH, Errno::EHOSTUNREACH,
          Net::SSH::Disconnect, Net::SSH::AuthenticationFailed, Timeout::Error
        ].freeze

        # @return [Integer] how many times to retry when failing to execute
        #   a command or transfer files
        # @api private
        attr_reader :connection_retries

        # @return [Float] how many seconds to wait before attempting a retry
        #   when failing to execute a command or transfer files
        # @api private
        attr_reader :connection_retry_sleep

        # @return [String] the hostname or IP address of the remote SSH host
        # @api private
        attr_reader :hostname

        # @return [Integer] how many times to retry when invoking
        #   `#wait_until_ready` before failing
        # @api private
        attr_reader :max_wait_until_ready

        # @return [String] the username to use when connecting to the remote
        #   SSH host
        # @api private
        attr_reader :username

        # @return [Integer] the TCP port number to use when connecting to the
        #   remote SSH host
        # @api private
        attr_reader :port

        # Establish an SSH session on the remote host.
        #
        # @param opts [Hash] retry options
        # @option opts [Integer] :retries the number of times to retry before
        #   failing
        # @option opts [Float] :delay the number of seconds to wait until
        #   attempting a retry
        # @option opts [String] :message an optional message to be logged on
        #   debug (overriding the default) when a rescuable exception is raised
        # @return [Net::SSH::Connection::Session] the SSH connection session
        # @api private
        def establish_connection(opts)
          logger.debug("[SSH] opening connection to #{self}")
          Net::SSH.start(hostname, username, options)
        rescue *RESCUE_EXCEPTIONS_ON_ESTABLISH => e
          if (opts[:retries] -= 1) > 0
            message = if opts[:message]
              logger.debug("[SSH] connection failed (#{e.inspect})")
              opts[:message]
            else
              "[SSH] connection failed, retrying in #{opts[:delay]} seconds " \
                "(#{e.inspect})"
            end
            logger.info(message)
            sleep(opts[:delay])
            retry
          else
            logger.warn("[SSH] connection failed, terminating (#{e.inspect})")
            raise SshFailed, "SSH session could not be established"
          end
        end

        # Execute a remote command over SSH and return the command's exit code.
        #
        # @param command [String] command string to execute
        # @return [Integer] the exit code of the command
        # @api private
        def execute_with_exit_code(command)
          exit_code = nil
          session.open_channel do |channel|

            channel.request_pty

            channel.exec(command) do |_ch, _success|

              channel.on_data do |_ch, data|
                logger << data
              end

              channel.on_extended_data do |_ch, _type, data|
                logger << data
              end

              channel.on_request("exit-status") do |_ch, data|
                exit_code = data.read_long
              end
            end
          end
          session.loop
          exit_code
        end

        # (see Base::Connection#init_options)
        def init_options(options)
          super
          @username               = @options.delete(:username)
          @hostname               = @options.delete(:hostname)
          @port                   = @options[:port] # don't delete from options
          @connection_retries     = @options.delete(:connection_retries)
          @connection_retry_sleep = @options.delete(:connection_retry_sleep)
          @max_wait_until_ready   = @options.delete(:max_wait_until_ready)
        end

        # Returns a connection session, or establishes one when invoked the
        # first time.
        #
        # @param retry_options [Hash] retry options for the initial connection
        # @return [Net::SSH::Connection::Session] the SSH connection session
        # @api private
        def session(retry_options = {})
          @session ||= establish_connection({
            :retries => connection_retries.to_i,
            :delay   => connection_retry_sleep.to_i
          }.merge(retry_options))
        end

        # String representation of object, reporting its connection details and
        # configuration.
        #
        # @api private
        def to_s
          "#{username}@#{hostname}<#{options.inspect}>"
        end
      end

      private

      # Builds the hash of options needed by the Connection object on
      # construction.
      #
      # @param data [Hash] merged configuration and mutable state data
      # @return [Hash] hash of connection options
      # @api private
      def connection_options(data) # rubocop:disable Metrics/MethodLength
        opts = {
          :logger                 => logger,
          :user_known_hosts_file  => "/dev/null",
          :paranoid               => false,
          :hostname               => data[:hostname],
          :port                   => data[:port],
          :username               => data[:username],
          :compression            => data[:compression],
          :compression_level      => data[:compression_level],
          :keepalive              => data[:keepalive],
          :keepalive_interval     => data[:keepalive_interval],
          :timeout                => data[:connection_timeout],
          :connection_retries     => data[:connection_retries],
          :connection_retry_sleep => data[:connection_retry_sleep],
          :max_wait_until_ready   => data[:max_wait_until_ready]
        }

        opts[:keys_only] = true                     if data[:ssh_key]
        opts[:keys] = Array(data[:ssh_key])         if data[:ssh_key]
        opts[:auth_methods] = ["publickey"]         if data[:ssh_key]
        opts[:password] = data[:password]           if data.key?(:password)
        opts[:forward_agent] = data[:forward_agent] if data.key?(:forward_agent)

        opts
      end

      # Creates a new SSH Connection instance and save it for potential future
      # reuse.
      #
      # @param options [Hash] conneciton options
      # @return [Ssh::Connection] an SSH Connection instance
      # @api private
      def create_new_connection(options, &block)
        if @connection
          logger.debug("[SSH] shutting previous connection #{@connection}")
          @connection.close
        end

        @connection_options = options
        @connection = Kitchen::Transport::Ssh::Connection.new(options, &block)
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
end
