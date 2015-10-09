# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)

require 'logger'

class Train::Plugins
  class Transport
    # @return [Hash] configuration, which created this Transport
    attr_reader :config

    # Initialize a new Transport object
    #
    # @param [Hash] config = nil the configuration for this transport
    # @return [Transport] the transport object
    def initialize(config = nil)
      @config = (config || {}).dup
      @logger = @config.delete(:logger) || Logger.new(STDOUT)
    end

    # Create a connection to the target. Options may be provided
    # for additional configuration.
    #
    # @param [Hash] _options = nil provide optional configuration params
    # @return [Connection] the connection for this configuration
    def connect(_options = nil)
      fail ClientError, "#{self.class} does not implement #connect()"
    end

    autoload :Connection, 'train/plugins/connection'
    autoload :FileCommon, 'train/plugins/file_common'
    autoload :LinuxFile,  'train/plugins/linux_file'
    autoload :OSCommon,   'train/plugins/os_common'

    CommandResult = Struct.new(:stdout, :stderr, :exit_status)

    # Register the inheriting class with as a train plugin using the
    # provided name.
    #
    # @param [String] name of the plugin, by which it will be found
    def self.name(name)
      Train::Plugins.registry[name] = self
    end
  end
end
