# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'vulcano/plugins'
require 'vulcano/resource'

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
      unless uri.host.nil? and uri.scheme.nil?
        conf['backend']  ||= uri.scheme
        conf['host']     ||= uri.host
        conf['port']     ||= uri.port
        conf['user']     ||= uri.user
        conf['password'] ||= uri.password
        conf['path']     ||= uri.path
      end

      # ensure path is nil, if its empty; e.g. required to reset defaults for winrm
      conf['path'] = nil if !conf['path'].nil? && conf['path'].to_s.empty?

      # return the updated config
      conf
    end

    def self.create(name, conf)
      backend_class = @registry[name]
      return nil if backend_class.nil?
      backend_instance = backend_class.new(conf)

      # Create wrapper class with all resources
      cls = Class.new do
        define_method :backend do
          backend_instance
        end
        Vulcano::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(self, *args)
          end
        end
      end

      cls.new
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
