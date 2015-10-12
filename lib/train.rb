# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)

require 'train/version'
require 'train/plugins'
require 'train/errors'

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
end
