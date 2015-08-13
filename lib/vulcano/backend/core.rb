# encoding: utf-8
require 'utils/modulator'

module Vulcano
  class Backend
    extend Modulator

    def initialize(conf)
      @conf = conf
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
      si = Specinfra.configuration
      si.os = nil
      if @conf['disable_sudo']
        si.disable_sudo = true
      else
        si.sudo_password = @conf['sudo_password']
        si.sudo_options = @conf['sudo_options']
      end
    end

    def configure_target
      t = @conf[:backend] || 'exec'
      m = Vulcano::Backend.modules[t]
      raise "Don't understand backend '#{t}'" if m.nil?
      m.configure(@conf)
    end

  end
end
