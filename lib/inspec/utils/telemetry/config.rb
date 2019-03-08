require 'inspec/config'

# - configuration
# -- opt in/out
# -- endpoint
# -- filter list for on/off

module Inspec::Telemetry
  class Config
    def initialize
      @config = Inspec::Config.cached
    end
  end
end
