# encoding: utf-8

module Vulcano
  module Backend

    def resolve_target_options conf
      return if conf[:target].to_s.empty?
      uri = URI::parse(conf[:target].to_s)
      conf[:backend]  = conf[:backend]  || uri.scheme
      conf[:host]     = conf[:host]     || uri.host
      conf[:port]     = conf[:port]     || uri.port
      conf[:user]     = conf[:user]     || uri.user
      conf[:password] = conf[:password] || uri.password
    end

    def configure_shared_options(conf)
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)
      si = Specinfra.configuration
      si.os = nil
      if conf['disable_sudo']
        si.disable_sudo = true
      else
        si.sudo_password = conf['sudo_password']
        si.sudo_options = conf['sudo_options']
      end
    end

    def configure_target(conf)
      t = conf[:backend] || 'exec'
      m = BACKEND_CONFIGS[t]
      raise "Don't understand backend '#{t}'" if m.nil?
      f = method(m)
      raise "Couldn't find internal backend method '#{m}'" if f.nil?
      f.call(conf)
    end

    BACKEND_CONFIGS = {
      'exec' => :configure_localhost,
      'ssh' => :configure_ssh,
      'winrm' => :configure_winrm,
    }

  end
end
