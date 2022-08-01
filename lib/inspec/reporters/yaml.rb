require "yaml"

module Inspec::Reporters
  class Yaml < Base
    def render
      json_reporter_obj = Inspec::Reporters::Json.new({ run_data: run_data })
      json_reporter_obj.enhanced_outcomes = enhanced_outcomes
      output(json_reporter_obj.report.to_yaml, false)
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
