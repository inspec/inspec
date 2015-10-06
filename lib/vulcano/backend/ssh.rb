# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano::Backends
  class SSH < Vulcano.backend(1)
    name 'ssh'

    attr_reader :os
    def initialize(conf)
      @conf = conf
      @files = {}
      @conf['host'] ||
        fail('You must specify a SSH host.')
      @ssh = start_ssh
      @os = OS.new(self)
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    def run_command(cmd)
      stdout = stderr = ''
      exit_status = nil
      cmd.force_encoding('binary') if cmd.respond_to?(:force_encoding)

      @ssh.open_channel do |channel|
        channel.exec(cmd) do |_, success|
          unless success
            abort 'Couldn\'t execute command on SSH.'
          end

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
      @ssh.loop

      CommandResult.new(stdout, stderr, exit_status)
    end

    private

    def validate_options(options)
      if options[:keys].empty? and options[:password].nil?
        fail 'You must configure at least one authentication method for SSH:'\
             ' Password or key.'
      end

      unless options[:keys].empty?
        options[:auth_methods].push('publickey')
        options[:keys_only] = true if options[:password].nil?
      end

      # rubocop:disable Style/GuardClause
      unless options[:password].nil?
        options[:auth_methods].push('password')
      end
      # rubocop:enable Style/GuardClause
    end

    def start_ssh
      host = @conf['host']
      ssh_config = Net::SSH.configuration_for(host)

      user = @conf['user'] || ssh_config[:user]
      keys = [@conf['key_file'], ssh_config[:keys]].flatten.compact
      options = {
        port: @conf['port'] || ssh_config[:port] || 22,
        auth_methods: ['none'],
        user_known_hosts_file: '/dev/null',
        global_known_hosts_file: '/dev/null',
        number_of_password_prompts: 0,
        keepalive: true,
        keepalive_interval: 60,
        compression: true,
        compression_level: 6,
        password: @conf['password'] || ssh_config[:password],
        keys: keys,
      }

      validate_options(options)
      Net::SSH.start(host, user, options)
    end

    class OS < OSCommon
      def initialize(backend)
        super(backend, { family: 'unix' })
      end
    end
  end
end
