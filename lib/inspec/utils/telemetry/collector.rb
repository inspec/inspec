require 'inspec/utils/telemetry/data_series'
require 'singleton'

module Inspec::Telemetry
  # A Singleton collection of data series objects.
  class Collector
    include Singleton

    def initialize
      @data_series = []
      @enabled = true
    end

    # Add a data series to the collection.
    # @return [True]
    def add_data_series(data_series)
      @data_series << data_series
    end

    # Is the Telemetry system enabled or disabled?
    # Always true until we add configuration parsing.
    # @return [True, False]
    def telemetry_enabled?
      @enabled
    end

    # A way to disable the telemetry system.
    # @return [True]
    def disable_telemetry
      @enabled = false
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
    # @return [True]
    def reset
      @data_series = []
    end
  end
end
