module Inspec
  module EnhancedOutcomes

    def self.determine_status(results, impact)
      if results.any? { |r| !r[:exception].nil? && !r[:backtrace].nil? }
        "error"
      elsif !impact.nil? && impact.to_f == 0.0
        "not_applicable"
      elsif results.all? { |r| r[:status] == "skipped" }
        "not_reviewed"
      elsif results.any? { |r| r[:status] == "failed" }
        "failed"
      else
        "passed"
      end
    end
  end
end
