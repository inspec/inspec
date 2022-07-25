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
            if expiry
              control[:attestation_data]["message"] = validate_attestation_expiry(expiry, control[:id])
              status, attestation_msg = attestation_check(control[:attestation_data]["message"], control[:attestation_data])

              control[:status] =  status
              control[:results].push({
                status: control[:status],
                code_desc: attestation_msg,
                expectation_message: attestation_msg,
              })
            end
          end
        end
      end
    end

    def self.attest_streaming_data(attestation_data, status, control_id)
      if status == "not_reviewed" && !attestation_data.blank?
        expiry = attestation_data["expiration_date"]

        if expiry
          expiry_message = validate_attestation_expiry(expiry, control_id)
          attestation_check(expiry_message, attestation_data)
        end
      end
    end

    def self.validate_attestation_expiry(expiry, control_id)
      # logic to check for expiry

      if [Date, Time].include?(expiry.class) || (expiry.is_a?(String) && Time.parse(expiry).year != 0)
        expiry = expiry.to_time if expiry.is_a? Date
        expiry = Time.parse(expiry) if expiry.is_a? String
        if expiry < Time.now # If the attestation expired, return - no attestation done
          expiry_message = "Attestation expired on #{expiry}"
          expiry_message
        end
      else
        ui = Inspec::UI.new
        ui.error("Unable to parse attestation expiration date '#{expiry}' for control #{control_id}")
        ui.exit(:usage_error)
      end
    rescue => e
      ui = Inspec::UI.new
      ui.error("Unable to parse attestation expiration date '#{expiry}' for control #{control_id}. Error: #{e.message}")
      ui.exit(:usage_error)
    end

    def self.attestation_check(expiry_message, attestation_data)
      # logic to update enhanced outcome status
      status, msg = nil
      if %w{passed failed}.include? attestation_data["status"]
        if expiry_message
          status = "failed"
          msg = "Control not attested : #{expiry_message}"
        else
          # use justification and evidence url to show information in msg
          attestation_message =  attestation_data["justification"]
          attestation_message += " | Evidence URL: #{attestation_data["evidence_url"]}" unless attestation_data["evidence_url"].blank?

          status = attestation_data["status"]
          msg = "Control Attested : #{attestation_message}"
        end
      end
      [status, msg]
    end
  end
end
