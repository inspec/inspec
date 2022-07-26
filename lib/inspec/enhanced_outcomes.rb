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
            expiry = determine_expiry(control[:attestation_data], control[:id])
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
        expiry = determine_expiry(attestation_data, control_id)

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
          attestation_message =  attestation_data["justification"] || attestation_data["explanation"]
          attestation_message += " | Evidence URL: #{attestation_data["evidence_url"]}" unless attestation_data["evidence_url"].blank?

          status = attestation_data["status"]
          msg = "Control Attested : #{attestation_message}"
        end
      end
      [status, msg]
    end

    def self.determine_expiry(attestation_data, control_id)
      if attestation_data["expiration_date"]
        attestation_data["expiration_date"]
      elsif !attestation_data["updated"].blank? && !attestation_data["frequency"].blank?
        updated_last = attestation_data["updated"]
        if updated_last.is_a?(Date) || (updated_last.is_a?(String) && Date.parse(updated_last).year != 0)
          updated_last = Date.parse(updated_last) if updated_last.is_a? String
          if updated_last < Time.now.to_date
            case attestation_data["frequency"]
            when "annually"
              updated_last.to_date.next_year(1)
            when "semiannually"
              updated_last.next_month(6)
            when "quarterly"
              updated_last.next_month(3)
            when "monthly"
              updated_last.next_month(1)
            when "every2weeks"
              updated_last.next_day(14)
            when "weekly"
              updated_last.next_day(7)
            when "every3days"
              updated_last.next_day(3)
            when "daily"
              updated_last.next_day(1)
            else
              updated_last
            end
          else
            updated_last
          end
        else
          ui = Inspec::UI.new
          ui.error("Unable to parse attestation updated date '#{updated}' for control #{control_id}")
          ui.exit(:usage_error)
        end
      end
    end
  end
end
