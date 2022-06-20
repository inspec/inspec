module InspecPlugins::Suggest
  module Reporter
    class Base < Inspec.plugin(2, :reporter)
      def self.run_data_schema_constraints
        "~> 0.0"
      end

      # Assumes --no-enhanced-outcomes
      def match?(ctl)
        return false if ctl.results.any? { |r| r.status == "failed" } # control outcome failed
        return false if ctl.results.all? { |r| r.status == "skipped" } # control outcome skipped
        return true # passed
      end

    end
  end
end
