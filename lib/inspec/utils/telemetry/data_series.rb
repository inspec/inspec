#  - data series / attributes = [ run timing, profiles, tests, os details, deprecation ]
#  -- name
#  -- data type
#  -- on/off switch
module Inspec::Telemetry
  class DataSeries
    def initialize
      @enable = true
    end

    attr_accessor :resource, :type, :run_time, :controls, :tests

    def enable
      @enable = true
    end

    def disable
      @enable = false
    end

    def enabled?
      @enable
    end
  end
end
