require 'yaml'

module Inspec::Reporters
  class Yaml < Base
    def render
      output(Inspec::Reporters::Json.new({ run_data: run_data }).report.to_yaml, false)
    end

    def report
      {
        platform: platform,
        profiles: profiles,
        statistics: {
          duration: run_data[:statistics][:duration],
        },
        version: run_data[:version],
      }
    end
  end
end
