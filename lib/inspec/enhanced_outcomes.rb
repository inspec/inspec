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

    def self.attest(run_data)
      run_data[:profiles].each do |profile|
        profile[:controls].each do |control|
          if control[:status] == "not_reviewed" && !control[:attestation_data].empty?
            expiry = control[:attestation_data]["expiration_date"]
            expiry_message = nil

            # logic to check for expiry
            if expiry
              begin
                if [Date, Time].include?(expiry.class) || (expiry.is_a?(String) && Time.parse(expiry).year != 0)
                  expiry = expiry.to_time if expiry.is_a? Date
                  expiry = Time.parse(expiry) if expiry.is_a? String
                  if expiry < Time.now # If the waiver expired, return - no skip applied
                    expiry_message = "Attestation expired on #{expiry}"
                    control[:attestation_data]["message"] = expiry_message
                  end
                else
                  ui = Inspec::UI.new
                  ui.error("Unable to parse attestation expiration date '#{expiry}' for control #{control[:id]}")
                  ui.exit(:usage_error)
                end
              rescue => e
                ui = Inspec::UI.new
                ui.error("Unable to parse attestation expiration date '#{expiry}' for control #{control[:id]}. Error: #{e.message}")
                ui.exit(:usage_error)
              end

              # logic to update enhanced outcome status
              if %w{passed failed}.include? control[:attestation_data]["status"]

                if expiry_message
                  control[:status] = "failed"
                  control[:results].push({
                    status: "failed",
                    code_desc: "Control not attested : #{expiry_message}",
                    expectation_message: "Control not attested : #{expiry_message}" })
                else
                  control[:status] = control[:attestation_data]["status"]
                  attestation_message =  control[:attestation_data]["justification"]
                  attestation_message += " | Evidence URL: #{control[:attestation_data]["evidence_url"]}" unless control[:attestation_data]["evidence_url"].blank?

                  # use justification and evidence url to show data
                  # passing this hash into results for showing additional results
                  # require "byebug"; byebug
                  control[:results].push({
                    status: control[:status],
                    code_desc: "Control Attested : #{attestation_message}",
                    expectation_message: "Control Attested : #{attestation_message}" })
                end
              end
            end
          end
        end
      end
    end
  end
end
