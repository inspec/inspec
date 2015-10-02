# encoding: utf-8
require 'uri'
require 'vulcano/plugins'

module Vulcano
  class Backend
    # Expose all registered backends
    def self.registry
      @registry ||= {}
    end

    # Resolve target configuration in URI-scheme into
    # all respective fields and merge with existing configuration.
    # e.g. ssh://bob@remote  =>  backend: ssh, user: bob, host: remote
    def self.target_config(config = nil) # rubocop:disable Metrics/AbcSize
      conf = config.nil? ? {} : config.dup

      # in case the user specified a key-file, register it that way
      key = conf['key']
      if !key.nil? and File.file?(key)
        conf['key_file'] = key
      end

      return conf if conf['target'].to_s.empty?

      uri = URI.parse(conf['target'].to_s)
      conf['backend']  = conf['backend']  || uri.scheme
      conf['host']     = conf['host']     || uri.host
      conf['port']     = conf['port']     || uri.port
      conf['user']     = conf['user']     || uri.user
      conf['password'] = conf['password'] || uri.password

      # return the updated config
      conf
    end
  end

  def self.backend(version = 1)
    if version != 1
      fail 'Only backend version 1 is supported!'
    end
    Vulcano::Plugins::Backend
  end
end

require 'vulcano/backend/docker'
require 'vulcano/backend/local'
require 'vulcano/backend/mock'
require 'vulcano/backend/specinfra'
require 'vulcano/backend/ssh'
