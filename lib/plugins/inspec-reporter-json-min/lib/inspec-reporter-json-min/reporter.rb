require "json" unless defined?(JSON)

module InspecPlugins::JsonMinReporter
  class Reporter < Inspec.plugin(2, :reporter)
    def self.run_data_schema_constraints
      "~> 0.0"
    end

    def render
      output(report.to_json, false)
    end

    def report # rubocop:disable Metrics/AbcSize
      report = {
        controls: [],
        statistics: { duration: run_data.statistics.duration },
        version: run_data.version,
      }

      # collect all test results and add them to the report
      run_data.profiles.each do |profile|
        profile_id = profile.name

        profile.controls.each do |control|
          control_id = control.id

          control.results.each do |result|
            result_for_report = {
              id: control_id,
              profile_id: profile_id,
              profile_sha256: profile.sha256,
              status: result.status,
              code_desc: result.code_desc,
            }

            result_for_report[:skip_message] = result.skip_message if result.non_nil?(:skip_message)
            result_for_report[:resource] = result.resource if result.non_nil?(:resource)
            result_for_report[:message] = result.message if result.non_nil?(:message)
            result_for_report[:exception] = result.exception if result.non_nil?(:exception)
            result_for_report[:backtrace] = result.backtrace if result.non_nil?(:backtrace)

            report[:controls] << result_for_report
          end
        end
      end

      report
    end
  end
end
