# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)

require 'train/version'
require 'train/plugins'
require 'train/errors'
require 'uri'

module Train
  # Create a new transport instance, with the plugin indicated by the
  # given name.
  #
  # @param [String] name of the plugin
  # @param [Array] *args list of arguments for the plugin
  # @return [Transport] instance of the new transport or nil
  def self.create(name, *args)
    transport_class = Train::Plugins.registry[name]

    if transport_class.nil?
      load_transport(name)
      transport_class = Train::Plugins.registry[name]
    end

    return nil if transport_class.nil?
    transport_class.new(*args)
  end

  def self.load_transport(name)
    require 'train/transports/' + name.to_s
  rescue LoadError => _
    raise Train::UserError,
          "Can't find train plugin #{name.inspect}. Please install it first."
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
end
