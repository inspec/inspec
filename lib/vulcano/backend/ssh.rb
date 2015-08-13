# encoding: utf-8

module Vulcano
  module Backend

    def configure_ssh(conf)
      si = Specinfra.configuration
      si.backend = :ssh
      si.request_pty = true
      host = conf['host'].to_s
      RSpec.configuration.host = host
      ssh_opts = {
        port: conf['port'] || 22,
        auth_methods: ['none'],
        user_known_hosts_file: "/dev/null",
        global_known_hosts_file: "/dev/null",
        number_of_password_prompts: 0,
        user: conf['user'],
        password: conf['password'],
        keys: [conf['key_file']].compact,
      }
      if host.empty?
        raise "You must configure a target host."
      end
      unless ssh_opts[:port] > 0
        raise "Port must be > 0 (not #{ssh_opts[:port]})"
      end
      if ssh_opts[:user].to_s.empty?
        raise "User must not be empty."
      end
      unless ssh_opts[:keys].empty?
        ssh_opts[:auth_methods].push('publickey')
        ssh_opts[:keys_only] = true if ssh_opts[:password].nil?
      end
      unless ssh_opts[:password].nil?
        ssh_opts[:auth_methods].push('password')
      end
      if ssh_opts[:keys].empty? and ssh_opts[:password].nil?
        raise "You must configure at least one authentication method" +
          ": Password or key."
      end
      si.ssh_options = ssh_opts
    end

  end
end
