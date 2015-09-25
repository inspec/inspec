# encoding: utf-8

require 'shellwords'
require 'specinfra'
require 'specinfra/helper'
require 'specinfra/helper/set'
require 'winrm'

module Specinfra
  module Helper
    module Os
      def os
        property[:os] = {} if !property[:os]
        if !property[:os].include?(:family)
          property[:os] = detect_os
        end
        property[:os]
      end

      private

      def detect_os
        backend = Specinfra.configuration.backend
        if backend == :cmd || backend == :winrm
          return { family: 'windows', release: nil, arch: nil }
        end

        Specinfra::Helper::DetectOs.subclasses.each do |c|
          res = c.detect
          if res
            res[:arch] ||= Specinfra.backend.run_command('uname -m').stdout.strip
            return res
          end
        end
        fail NotImplementedError, 'Specinfra failed os detection.'
      end
    end
  end
end

module Vulcano::Backends
  class SpecinfraHelper < Vulcano.backend(1)
    name 'specinfra'

    def initialize(conf)
      @conf = conf
      @files = {}
      type = @conf['backend'].to_s

      reset_backend(type)
      configure_shared_options

      # configure the given backend, if we can handle it
      # e.g. backend = exec   ==>  try to call configure_exec
      # if we don't support it, error out
      m = "configure_#{type}"
      if self.respond_to?(m.to_sym)
        send(m)
      else
        fail "Cannot configure Specinfra backend #{type}: it isn't supported yet."
      end
    end

    def os
      Specinfra::Helper::Os.os
    end

    def file(path)
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      Specinfra::Runner.run_command(cmd)
    end

    def to_s
      'SpecInfra Backend Runner'
    end

    def reset_backend(type)
      # may be less nice, but avoid eval...
      case type
      when 'exec'
        Specinfra::Backend::Exec.instance_variable_set(:@instance, nil)
      when 'docker'
        Specinfra::Backend::Docker.instance_variable_set(:@instance, nil)
      when 'ssh'
        Specinfra::Backend::Ssh.instance_variable_set(:@instance, nil)
      when 'winrm'
        Specinfra::Backend::Winrm.instance_variable_set(:@instance, nil)
      end
    end

    def configure_shared_options
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)

      # Force specinfra to disregard any locally detected backend and instead
      # retry backend detection.
      Specinfra::Properties.instance.properties({})

      si = Specinfra.configuration
      if @conf['disable_sudo']
        si.disable_sudo = true
      else
        si.sudo_password = @conf['sudo_password']
        si.sudo_options = @conf['sudo_options']
      end
    end

    def configure_docker
      host = @conf['host'].to_s
      Specinfra.configuration.backend = :docker
      Specinfra.configuration.docker_container = host
    end

    def configure_exec
      Specinfra.configuration.backend = :exec
    end

    def validate_ssh_options(ssh_opts)
      unless ssh_opts[:port] > 0
        fail "Port must be > 0 (not #{ssh_opts[:port]})"
      end

      if ssh_opts[:user].to_s.empty?
        fail 'User must not be empty.'
      end

      unless ssh_opts[:keys].empty?
        ssh_opts[:auth_methods].push('publickey')
        ssh_opts[:keys_only] = true if ssh_opts[:password].nil?
      end

      unless ssh_opts[:password].nil?
        ssh_opts[:auth_methods].push('password')
      end

      # rubocop:disable Style/GuardClause
      if ssh_opts[:keys].empty? and ssh_opts[:password].nil?
        fail 'You must configure at least one authentication method' \
          ': Password or key.'
      end
      # rubocop:enable Style/GuardClause
    end

    def configure_ssh
      si = Specinfra.configuration
      si.backend = :ssh
      si.request_pty = true

      host = @conf['host'].to_s
      fail 'You must configure a target host.' if host.empty?
      si.host = host

      ssh_opts = {
        port: @conf['port'] || 22,
        auth_methods: ['none'],
        user_known_hosts_file: '/dev/null',
        global_known_hosts_file: '/dev/null',
        number_of_password_prompts: 0,
        user: @conf['user'] || 'root',
        password: @conf['password'],
        keys: [@conf['key_file']].compact,
      }

      validate_ssh_options(ssh_opts)
      si.ssh_options = ssh_opts
    end

    def winrm_url(conf)
      host = conf['host'].to_s
      port = conf['port']
      fail 'You must configure a target host.' if host.empty?

      # SSL configuration
      if conf['winrm_ssl']
        scheme = 'https'
        port ||= 5986
      else
        scheme = 'http'
        port ||= 5985
      end

      "#{scheme}://#{host}:#{port}/wsman"
    end

    def configure_winrm
      si = Specinfra.configuration
      si.backend = :winrm
      si.os = { family: 'windows' }

      # validation
      user = @conf['user'].to_s
      pass = @conf['password'].to_s

      if user.empty?
        warn "We use default 'Administrator' as WinRM user for login."
        user = 'Administrator'
      end
      fail 'You must configure a WinRM password.' if pass.empty?

      # create the connection
      endpoint = winrm_url(@conf)
      winrm = ::WinRM::WinRMWebService.new(
        endpoint,
        :ssl,
        user: user,
        pass: pass,
        basic_auth_only: true,
        no_ssl_peer_verification: @conf['winrm_self_signed'],
      )
      si.winrm = winrm
    end
  end

  class SpecinfraHelper
    class File < LinuxFile
      def initialize(backend, path)
        super(backend, path)
      end

      def exist?
        Specinfra::Runner.check_file_exists(@path)
      end

      def mode
        return bsd_stat[:mode] unless bsd_stat.nil?
        m = Specinfra::Runner.get_file_mode(@path).stdout.strip
        return nil if m.empty? || m.include?('cannot stat')
        m.to_i(8)
      end

      def owner
        return bsd_stat[:owner] unless bsd_stat.nil?
        o = Specinfra::Runner.get_file_owner_user(@path).stdout.strip
        return nil if o.empty? || o.include?('cannot stat')
        o
      end

      def group
        return bsd_stat[:group] unless bsd_stat.nil?
        g = Specinfra::Runner.get_file_owner_group(@path).stdout.strip
        return nil if g.empty? || g.include?('cannot stat')
        g
      end

      def link_path
        return nil unless symlink?
        path = Shellwords.escape(@path)
        Specinfra::Runner.run_command("readlink #{path}").stdout.strip
      end

      def content
        s = Specinfra::Runner.get_file_content(@path).stdout
        # if we get some content, return it
        return s unless s.empty?

        # if we didn't get any content, we have to decide if this is
        # really an empty file (i.e. where content == empty string)
        # or if something else is going on.

        # in case it is a folder or the path doesn't exist, always
        # return nil instead of empty content
        return nil if directory? or !exist?

        # in case we can't get the size, something is wrong, so return nil
        # in case the size is non-zero, we couldn't read the file, so
        # return nil to indicate that
        i = size
        return nil if i.nil? or i > 0

        # return the empty string, as the file doesn't contain anything
        s
      end

      def md5sum
        s = Specinfra::Runner.get_file_md5sum(@path).stdout.strip
        return nil if s.empty? or s.include?(' ')
        s
      end

      def sha256sum
        s = Specinfra::Runner.get_file_sha256sum(@path).stdout.strip
        return nil if s.empty? or s.include?(' ')
        s
      end

      def mtime
        mt = Specinfra::Runner.get_file_mtime(@path).stdout.strip
        return nil if mt.empty? || mt.include?(' ')
        mt.to_i
      end

      def size
        s = Specinfra::Runner.get_file_size(@path).stdout.strip
        return nil if s.empty? || s.include?(' ')
        s.to_i
      end

      def selinux_label
        res = Specinfra::Runner.get_file_selinuxlabel(@path).stdout.strip
        return nil if res.empty? or res == '?' or
                      res.include?('failed to get security context') or
                      res.include?('cannot stat')
        res
      rescue NotImplementedError => _
        nil
      end

      def mounted?(opts = {}, only_with = nil)
        Specinfra::Runner.check_file_is_mounted(@path, opts, only_with)
      end

      def immutable?
        Specinfra::Runner.get_file_immutable(@path)
      end

      def product_version
        return nil unless @backend.os[:family] == 'windows'
        res = Specinfra::Runner.
              run_command("(Get-Command '#{@path}').FileVersionInfo.ProductVersion").
              stdout.strip
        res.empty? ? nil : res
      end

      def file_version
        return nil unless @backend.os[:family] == 'windows'
        res = Specinfra::Runner.
              run_command("(Get-Command '#{@path}').FileVersionInfo.FileVersion").
              stdout.strip
        res.empty? ? nil : res
      end
    end
  end
end
