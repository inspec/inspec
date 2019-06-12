require "json"

module Inspec; end

# A minimal Dataseries Object
# Stores the name of the data series and an array of data.
# Stored data should be a object that supports #to_s
module Inspec::Telemetry
  class DataSeries
    def initialize(name)
      @name = name
      @enabled = true
      @data ||= []
    end

    attr_reader :data, :name

    # This needs to also be set by configuration.
    def enabled?
      @enabled
    end

    def disable
      @enabled = false
    end

    def <<(appending_data)
      data << appending_data
    end

    alias push <<

    def to_h
      {
        name: @name,
        data: @data,
      }
    end

    def to_json
      to_h.to_json
    end
  end
end
