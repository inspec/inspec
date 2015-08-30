# encoding: utf-8

module Vulcano::Backends

  class SpecinfraHelper < Vulcano.backend(1)
    name 'specinfra'

    def initialize(conf)
      @conf = conf
      @files = {}
      type = @conf[:backend]
      configure_shared_options
      m = "configure_#{type}"
      if self.respond_to?(m.to_sym)
        self.send(m)
      else
        raise "Cannot configure Specinfra backend #{type}: it isn't supported yet."
      end
    end

    def file(path)
      @files[path] ||= File.new(path)
    end

    def run_command(cmd)
      Specinfra::Runner.run_command(cmd)
    end

    def to_s
      'SpecInfra Backend Runner'
    end

    def configure_shared_options
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)
      si = Specinfra.configuration
      si.os = nil
      if @conf['disable_sudo']
        si.disable_sudo = true
      else
        si.sudo_password = @conf['sudo_password']
        si.sudo_options = @conf['sudo_options']
      end
    end

    def configure_docker
      host = conf['host'].to_s
      Specinfra.configuration.backend = :docker
      Specinfra.configuration.docker_container = host
    end

    def configure_exec
      Specinfra.configuration.backend = :exec
    end

    def configure_ssh
      si = Specinfra.configuration
      si.backend = :ssh
      si.request_pty = true

      host = @conf['host'].to_s
      RSpec.configuration.host = host

      ssh_opts = {
        port: @conf['port'] || 22,
        auth_methods: ['none'],
        user_known_hosts_file: "/dev/null",
        global_known_hosts_file: "/dev/null",
        number_of_password_prompts: 0,
        user: @conf['user'],
        password: @conf['password'],
        keys: [@conf['key_file']].compact,
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

    def configure_winrm
      si = Specinfra.configuration
      si.backend = :winrm
      si.os = { family: 'windows'}

      # common options
      host = conf['host'].to_s
      port = conf['port']
      user = conf['user'].to_s
      pass = conf['password'].to_s

      # SSL configuration
      if conf['winrm_ssl']
        scheme = 'https'
        port = port || 5986
      else
        scheme = 'http'
        port = port || 5985
      end

      # validation
      if host.empty?
        raise "You must configure a target host."
      end
      unless port > 0
        raise "Port must be > 0 (not #{port})"
      end
      if user.empty?
        raise "You must configure a WinRM user for login."
      end
      if pass.empty?
        raise "You must configure a WinRM password."
      end

      # create the connection
      endpoint = "#{scheme}://#{host}:#{port}/wsman"
      winrm = ::WinRM::WinRMWebService.new(
        endpoint,
        :ssl,
        user: user,
        pass: pass,
        basic_auth_only: true,
        no_ssl_peer_verification: conf['winrm_self_signed'],
      )
      si.winrm = winrm
    end

  end

  class SpecinfraHelper

    class File
      def initialize(path)
        @path = path
      end

      def file?
        Specinfra::Runner.check_file_is_file(@path)
      end

      def content
        Specinfra::Runner.get_file_content(@path).stdout
      end

      def size
        Specinfra::Runner.get_file_size(@path).stdout.strip.to_i
      end
    end

  end
end
