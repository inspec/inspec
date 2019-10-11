require "inspec/config"
require "inspec/utils/telemetry/data_series"
require "singleton"

module Inspec::Telemetry
  # A Singleton collection of data series objects.
  class Collector
    include Singleton

    attr_reader :config

    def initialize
      @data_series = []
      @telemetry_toggled_off = false
      load_config
    end

    # Allow loading a configuration, useful when testing.
    def load_config(config = Inspec::Config.cached)
      @config = config
    end

    # Add a data series to the collection.
    # @return [True]
    def add_data_series(data_series)
      @data_series << data_series
    end

    # The loaded configuration should have a option to configure
    # telemetry, if not default to false.
    # @return [True, False]
    def telemetry_enabled?
      if @telemetry_toggled_off
        false
      else
        config_telemetry_options.fetch("enable_telemetry", false)
      end
    end

    # A way to disable the telemetry system.
    def disable_telemetry
      @telemetry_toggled_off = true
    end

    # The entire data series collection.
    # @return [Array]
    def list_data_series
      @data_series
    end

    # Finds the data series object with the specified name and returns it.
    # If it does not exist then creates a new data series with that name
    # and returns it.
    # @return [Inspec::Telemetry::DataSeries]
    def find_or_create_data_series(name)
      ds = @data_series.select { |data_series| data_series.name.eql?(name) }
      if ds.empty?
        new_data_series = Inspec::Telemetry::DataSeries.new(name)
        @data_series << new_data_series
        new_data_series
      else
        ds.first
      end
    end

    # Blanks the contents of the data series collection.
    # Reset telemetry toggle
    # @return [True]
    def reset!
      @data_series = []
      @telemetry_toggled_off = false
    end

    private

    # Minimize exposure of Inspec::Config interface
    def config_telemetry_options
      config.telemetry_options
    end
  end
end
