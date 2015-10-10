# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)

require 'logger'
require 'train/errors'
require 'train/plugins/common'

class Train::Plugins
  class Transport
    include Train::Plugins::Common

    autoload :Connection, 'train/plugins/connection'

    # @return [Hash] options, which created this Transport
    attr_reader :options

    # Initialize a new Transport object
    #
    # @param [Hash] config = nil the configuration for this transport
    # @return [Transport] the transport object
    def initialize(options = nil)
      @options = (options || {}).dup
      @log = @options[:logger] || Logger.new(STDOUT)
    end

    # Create a connection to the target. Options may be provided
    # for additional configuration.
    #
    # @param [Hash] _options = nil provide optional configuration params
    # @return [Connection] the connection for this configuration
    def connect(_options = nil)
      fail Train::ClientError, "#{self.class} does not implement #connect()"
    end

    # Register the inheriting class with as a train plugin using the
    # provided name.
    #
    # @param [String] name of the plugin, by which it will be found
    def self.name(name)
      Train::Plugins.registry[name] = self
    end

    private

    # @return [Logger] logger for reporting information
    attr_reader :log
  end
end
