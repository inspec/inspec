# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)

require 'train/errors'

module Train
  class Plugins
    autoload :Transport, 'train/plugins/transport'

    class << self
      # Retrieve the current plugin registry, containing all plugin names
      # and their transport handlers.
      #
      # @return [Hash] map with plugin names and plugins
      def registry
        @registry ||= {}
      end
    end
  end

  # Create a new plugin by inheriting from the class returned by this method.
  # Create a versioned plugin by providing the transport layer plugin version
  # to this method. It will then select the correct class to inherit from.
  #
  # The plugin version determins what methods will be available to your plugin.
  #
  # @param [Int] version = 1 the plugin version to use
  # @return [Transport] the versioned transport base class
  def self.plugin(version = 1)
    if version != 1
      fail ClientError,
           'Only understand train plugin version 1. You are trying to '\
           "initialize a train plugin #{version}, which is not supported "\
           'in the current release of train.'
    end
    ::Train::Plugins::Transport
  end
end
