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

    autoload :BaseConnection, 'train/plugins/base_connection'

    # @return [Hash] options, which created this Transport
    attr_reader :options

    # Initialize a new Transport object
    #
    # @param [Hash] config = nil the configuration for this transport
    # @return [Transport] the transport object
    def initialize(options = {})
      @options = merge_options({}, options || {})
      @log = @options[:logger] || Logger.new(STDOUT)
    end

    # Create a connection to the target. Options may be provided
    # for additional configuration.
    #
    # @param [Hash] _options = nil provide optional configuration params
    # @return [Connection] the connection for this configuration
    def connection(_options = nil)
      fail Train::ClientError, "#{self.class} does not implement #connect()"
    end

    # Register the inheriting class with as a train plugin using the
    # provided name.
    #
    # @param [String] name of the plugin, by which it will be found
    def self.name(name)
      Train::Plugins.registry[name] = self
    end

    def self.option(name, conf = nil, &block)
      d = conf || {}
      unless d.is_a? Hash
        fail Train::ClientError,
             "The transport plugin #{self} declared an option #{name} "\
             "and didn't provide a valid configuration hash."
      end

      if !conf.nil? and !conf[:default].nil? and block_given?
        fail Train::ClientError,
             "The transport plugin #{self} declared an option #{name} "\
             'with both a default value and block. Only use one of these.'
      end

      d[:default] = block if block_given?

      @default_options ||= {}
      @default_options[name] = d
    end

    def default_options
      self.class.instance_variable_get(:@default_options) || {}
    end

    def merge_options(base, opts)
      res = base.merge(opts || {})
      default_options.each do |field, hm|
        next if res.key?(field) or !hm.key?(:default)
        default = hm[:default]
        if default.is_a? Proc
          res[field] = default.call(res)
        else
          res[field] = default
        end
      end
      res
    end

    def validate_options(opts)
      default_options.each do |field, hm|
        if opts[field].nil? and hm[:required]
          fail Train::ClientError,
               "You must provide a value for #{field.to_s.inspect}."
        end
      end
      opts
    end

    private

    # @return [Logger] logger for reporting information
    attr_reader :log
  end
end
