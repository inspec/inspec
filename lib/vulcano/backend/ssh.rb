# encoding: utf-8

module Vulcano::Backends
  class SSH < Vulcano.backend(1)
    name 'ssh'

    def initialize(conf)
      @conf = conf
      @files = {}
      @conf['host'] ||
        fail("You must specify a SSH host.")
      @ssh = start_ssh
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    def run_command(cmd)
      stdout = @ssh.exec!(cmd)
      CommandResult.new(stdout, '', 0)
    end

    private

    def start_ssh
      host = @conf['host']
      ssh_config = Net::SSH.configuration_for(host)

      user = @conf['user'] || ssh_config[:user]
      keys = [ @conf['key_file'], ssh_config[:keys] ].flatten.compact
      options = {
        port: @conf['port'] || ssh_config[:port] || 22,
        auth_methods: ['none'],
        user_known_hosts_file: '/dev/null',
        global_known_hosts_file: '/dev/null',
        number_of_password_prompts: 0,
        password: @conf['password'] || ssh_config[:password],
        keys: keys,
      }

      unless options[:keys].empty?
        options[:auth_methods].push('publickey')
        options[:keys_only] = true if options[:password].nil?
      end

      unless options[:password].nil?
        options[:auth_methods].push('password')
      end

      if options[:keys].empty? and options[:password].nil?
        fail('You must configure at least one authentication method for SSH:' +
          ' Password or key.')
      end

      Net::SSH.start( host, user, options )
    end
  end
end
