# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'uri'
require 'rspec'
require 'rspec/its'
require 'specinfra'
require 'specinfra/helper'
require 'specinfra/helper/set'
require 'serverspec/helper'
require 'serverspec/matcher'
require 'serverspec/subject'
require 'vulcano/rspec_json_formatter'

module Vulcano

  class Runner
    def initialize(profile_id, conf)
      @rules = []
      @profile_id = profile_id
      @conf = conf.dup
      resolve_target_options

      # RSpec.configuration.output_stream = $stdout
      # RSpec.configuration.error_stream = $stderr
      RSpec.configuration.add_formatter(:json)

      # specinfra
      configure_shared_options
      configure_target
    end

    def resolve_target_options
      return if @conf[:target].to_s.empty?
      uri = URI::parse(@conf[:target].to_s)
      @conf[:backend]  = @conf[:backend]  || uri.scheme
      @conf[:host]     = @conf[:host]     || uri.host
      @conf[:port]     = @conf[:port]     || uri.port
      @conf[:user]     = @conf[:user]     || uri.user
      @conf[:password] = @conf[:password] || uri.password
    end

    def configure_shared_options
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)
      conf = Specinfra.configuration
      conf.os = nil
      if @conf['disable_sudo']
        conf.disable_sudo = true
      else
        conf.sudo_password = @conf['sudo_password']
        conf.sudo_options = @conf['sudo_options']
      end
    end

    def configure_target
      t = @conf[:backend] || 'exec'
      m = BACKEND_CONFIGS[t]
      raise "Don't understand backend '#{t}'" if m.nil?
      f = method(m)
      raise "Couldn't find internal backend method '#{m}'" if f.nil?
      f.call
    end

    BACKEND_CONFIGS = {
      'exec' => :configure_localhost,
      'ssh' => :configure_ssh,
      'winrm' => :configure_winrm,
    }

    def configure_localhost
      Specinfra.configuration.backend = :exec
    end

    def configure_ssh
      conf = Specinfra.configuration
      conf.backend = :ssh
      conf.request_pty = true
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
      conf.ssh_options = ssh_opts
    end

    def configure_winrm
      conf = Specinfra.configuration
      conf.backend = :winrm
      conf.os = { family: 'windows'}
      host = @conf['host'].to_s
      port = @conf['port']
      user = @conf['user'].to_s
      pass = @conf['pass'].tp_s

      # SSL configuration
      if @conf['winrm_ssl']
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
        no_ssl_peer_verification: @conf['winrm_self_signed'],
      )
      conf.winrm = winrm
    end

    def add_file(path)
      ctx = Vulcano::ProfileContext.new(@profile_id, {}, [])

      # read the test file
      apath = File::expand_path(path)
      raw = File::read(apath)

      # evaluate all tests
      ctx.instance_eval(raw, apath, 0)

      # process the resulting rules
      rules = ctx.instance_variable_get(:@rules)
      rules.each do |rule_id, rule|
        #::Vulcano::DSL.execute_rule(rule, profile_id)
        checks = rule.instance_variable_get(:@checks)
        checks.each do |m,a,b|
          example = RSpec::Core::ExampleGroup.describe(*a, &b)
          set_rspec_ids(example, rule_id)
          RSpec.world.register(example)
        end
      end
    end

    def run
      rspec_runner = RSpec::Core::Runner.new(nil)
      rspec_runner.run_specs(RSpec.world.ordered_example_groups)
    end

    def set_rspec_ids(example, id)
      example.metadata[:id] = id
      example.filtered_examples.each do |e|
        e.metadata[:id] = id
      end
      example.children.each do |child|
        set_rspec_ids(child, id)
      end
    end
  end

end
