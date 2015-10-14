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
    cls = load_transport(name)
    cls.new(*args) unless cls.nil?
  end

  # Retrieve the configuration options of a transport plugin.
  #
  # @param [String] name of the plugin
  # @return [Hash] map of default options
  def self.options(name)
    cls = load_transport(name)
    cls.default_options unless cls.nil?
  end

  # Load the transport plugin indicated by name. If the plugin is not
  # yet found in the plugin registry, it will be attempted to load from
  # `train/transports/plugin_name`.
  #
  # @param [String] name of the plugin
  # @return [Train::Transport] the transport plugin
  def self.load_transport(name)
    res = Train::Plugins.registry[name.to_s]
    return res unless res.nil?

    # if the plugin wasnt loaded yet:
    require 'train/transports/' + name.to_s
    Train::Plugins.registry[name.to_s]
  rescue LoadError => _
    raise Train::UserError,
          "Can't find train plugin #{name.inspect}. Please install it first."
  end

  # Resolve target configuration in URI-scheme into
  # all respective fields and merge with existing configuration.
  # e.g. ssh://bob@remote  =>  backend: ssh, user: bob, host: remote
  def self.target_config(config = nil) # rubocop:disable Metrics/AbcSize
    conf = config.nil? ? {} : config.dup

    # symbolize keys
    conf = conf.each_with_object({}) do |(k, v), acc|
      acc[k.to_sym] = v
      acc
    end

    group_keys_and_keyfiles(conf)

    return conf if conf[:target].to_s.empty?

    uri = URI.parse(conf[:target].to_s)
    unless uri.host.nil? and uri.scheme.nil?
      conf[:backend]  ||= uri.scheme
      conf[:host]     ||= uri.host
      conf[:port]     ||= uri.port
      conf[:user]     ||= uri.user
      conf[:password] ||= uri.password
      conf[:path]     ||= uri.path
    end

    # ensure path is nil, if its empty; e.g. required to reset defaults for winrm
    conf[:path] = nil if !conf[:path].nil? && conf[:path].to_s.empty?

    # return the updated config
    conf
  end

  private

  def self.group_keys_and_keyfiles(conf)
    # in case the user specified a key-file, register it that way
    # we will clear the list of keys and put keys and key_files separately
    keys_mixed = conf[:keys]
    return if keys_mixed.nil?

    conf[:key_files] = []
    conf[:keys] = []
    keys_mixed.each do |key|
      if !key.nil? and File.file?(key)
        conf[:key_files].push(key)
      else
        conf[:keys].push(key)
      end
    end
  end
end
