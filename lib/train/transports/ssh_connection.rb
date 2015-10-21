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

class Train::Transports::SSH
  # A Connection instance can be generated and re-generated, given new
  # connection details such as connection port, hostname, credentials, etc.
  # This object is responsible for carrying out the actions on the remote
  # host such as executing commands, transferring files, etc.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class Connection < BaseConnection # rubocop:disable Metrics/ClassLength
    def initialize(options)
      super(options)
      @username               = @options.delete(:username)
      @hostname               = @options.delete(:hostname)
      @port                   = @options[:port] # don't delete from options
      @connection_retries     = @options.delete(:connection_retries)
      @connection_retry_sleep = @options.delete(:connection_retry_sleep)
      @max_wait_until_ready   = @options.delete(:max_wait_until_ready)
      @files                  = {}
      @session                = nil
      @transport_options      = @options.delete(:transport_options)
      @cmd_wrapper            = nil
      @cmd_wrapper            = CommandWrapper.load(self, @transport_options)
    end

    # (see Base::Connection#close)
    def close
      return if @session.nil?
      logger.debug("[SSH] closing connection to #{self}")
      session.close
    ensure
      @session = nil
    end

    def os
      @os ||= OS.new(self)
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    # (see Base::Connection#run_command)
    def run_command(cmd)
      stdout = stderr = ''
      exit_status = nil
      cmd.force_encoding('binary') if cmd.respond_to?(:force_encoding)
      logger.debug("[SSH] #{self} (#{cmd})")

      session.open_channel do |channel|
        # wrap commands if that is configured
        cmd = @cmd_wrapper.run(cmd) unless @cmd_wrapper.nil?

        channel.exec(cmd) do |_, success|
          abort 'Couldn\'t execute command on SSH.' unless success

          channel.on_data do |_, data|
            stdout += data
          end

          channel.on_extended_data do |_, _type, data|
            stderr += data
          end

          channel.on_request('exit-status') do |_, data|
            exit_status = data.read_long
          end

          channel.on_request('exit-signal') do |_, data|
            exit_status = data.read_long
          end
        end
      end
      @session.loop

      CommandResult.new(stdout, stderr, exit_status)
    rescue Net::SSH::Exception => ex
      raise SSHFailed, "SSH command failed (#{ex.message})"
    end

    # (see Base::Connection#login_command)
    def login_command
      level = logger.debug? ? 'VERBOSE' : 'ERROR'
      fwd_agent = options[:forward_agent] ? 'yes' : 'no'

      args  = %w{ -o UserKnownHostsFile=/dev/null }
      args += %w{ -o StrictHostKeyChecking=no }
      args += %w{ -o IdentitiesOnly=yes } if options[:keys]
      args += %W( -o LogLevel=#{level} )
      args += %W( -o ForwardAgent=#{fwd_agent} ) if options.key?(:forward_agent)
      Array(options[:keys]).each do |ssh_key|
        args += %W( -i #{ssh_key} )
      end
      args += %W( -p #{@port} )
      args += %W( #{@username}@#{@hostname} )

      LoginCommand.new('ssh', args)
    end

    # (see Base::Connection#upload)
    def upload(locals, remote)
      Array(locals).each do |local|
        opts = File.directory?(local) ? { recursive: true } : {}

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
        retries: @max_wait_until_ready / delay,
        delay:   delay,
        message: "Waiting for SSH service on #{@hostname}:#{@port}, " \
                 "retrying in #{delay} seconds",
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
      Net::SSH.start(@hostname, @username, @options)
    rescue *RESCUE_EXCEPTIONS_ON_ESTABLISH => e
      if (opts[:retries] -= 1) <= 0
        logger.warn("[SSH] connection failed, terminating (#{e.inspect})")
        raise SSHFailed, 'SSH session could not be established'
      end

      if opts[:message]
        logger.debug("[SSH] connection failed (#{e.inspect})")
        message = opts[:message]
      else
        message = "[SSH] connection failed, retrying in #{opts[:delay]}"\
                  " seconds (#{e.inspect})"
      end
      logger.info(message)

      sleep(opts[:delay])
      retry
    end

    # Returns a connection session, or establishes one when invoked the
    # first time.
    #
    # @param retry_options [Hash] retry options for the initial connection
    # @return [Net::SSH::Connection::Session] the SSH connection session
    # @api private
    def session(retry_options = {})
      @session ||= establish_connection({
        retries: @connection_retries.to_i,
        delay:   @connection_retry_sleep.to_i,
      }.merge(retry_options))
    end

    # String representation of object, reporting its connection details and
    # configuration.
    #
    # @api private
    def to_s
      "#{@username}@#{@hostname}<#{@options.inspect}>"
    end

    class OS < OSCommon
      def initialize(backend)
        super(backend, { family: 'unix' })
      end
    end
  end
end
