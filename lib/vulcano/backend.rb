# encoding: utf-8
require 'vulcano/plugins'

module Vulcano
  class Backend
    def self.registry
      @registry ||= {}
    end

    def self.target_config( conf )
      return conf if conf[:target].to_s.empty?
      uri = URI::parse(conf[:target].to_s)
      conf[:backend]  = conf[:backend]  || uri.scheme
      conf[:host]     = conf[:host]     || uri.host
      conf[:port]     = conf[:port]     || uri.port
      conf[:user]     = conf[:user]     || uri.user
      conf[:password] = conf[:password] || uri.password
      conf
    end
  end

  def self.backend(version)
    if version != 1
      raise "Only backend version 1 is supported!"
    end
    Vulcano::Plugins::Backend
  end
end

require 'vulcano/backend/mock'
#require 'vulcano/backend/exec'
#require 'vulcano/backend/docker'
#require 'vulcano/backend/ssh'
#require 'vulcano/backend/winrm'
