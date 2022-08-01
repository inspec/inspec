module Inspec
  module Attestations
    def self.attest(run_data)
      run_data[:profiles].each do |profile|
        profile[:controls].each do |control|
          if control[:status] == "not_reviewed" && !control[:attestation_data].empty?
            expiry = determine_expiry(control[:attestation_data], control[:id])
            if expiry
              control[:attestation_data]["message"] = validate_attestation_expiry(expiry, control[:id])
              attestation_result = attestation_check(control[:attestation_data]["message"], control[:attestation_data], control[:id])
              if attestation_result
                status, attestation_msg = attestation_result

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
    end

    def self.attest_streaming_data(attestation_data, status, control_id)
      if status == "not_reviewed" && !attestation_data.blank?
        expiry = determine_expiry(attestation_data, control_id)

        if expiry
          expiry_message = validate_attestation_expiry(expiry, control_id)
          attestation_check(expiry_message, attestation_data, control_id)
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

    def self.attestation_check(expiry_message, attestation_data, control_id)
      # logic to update enhanced outcome status
      status, msg = nil
      if %w{passed failed}.include? attestation_data["status"]
        if expiry_message
          status = "failed"
          msg = "Control not attested : #{expiry_message}"
        else
          # use justification and evidence url to show information in msg
          attestation_message = attestation_data["justification"] || attestation_data["explanation"] || ""

          unless attestation_data["evidence_url"].blank?
            if attestation_message.blank?
              attestation_message = "Evidence URL: #{attestation_data["evidence_url"]}"
            else
              attestation_message += " | Evidence URL: #{attestation_data["evidence_url"]}"
            end
          end

          status = attestation_data["status"]
          if attestation_message.blank?
            msg = "Control Attested : No justification provided."
          else
            msg = "Control Attested : #{attestation_message}"
          end
        end
      else
        if attestation_data["status"].blank?
          Inspec::Log.warn "No attestation status for control #{control_id}. Use 'passed' or 'failed'."
        else
          Inspec::Log.warn "Invalid attestation status '#{attestation_data["status"]}' for control #{control_id}. Use 'passed' or 'failed'."
        end
        return nil
      end
      [status, msg]
    end

    def self.determine_expiry(attestation_data, control_id)
      if attestation_data["expiration_date"]
        attestation_data["expiration_date"]
      elsif !attestation_data["updated"].blank? && !attestation_data["frequency"].blank?
        updated_last = attestation_data["updated"]
        begin
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
                Inspec::Log.warn "Invalid frequency value '#{attestation_data["frequency"]}' for control #{control_id}."
                updated_last
              end
            else
              updated_last
            end
          else
            ui = Inspec::UI.new
            ui.error("Unable to parse attestation updated date '#{updated_last}' for control #{control_id}")
            ui.exit(:usage_error)
          end
        rescue => e
          ui = Inspec::UI.new
          ui.error("Unable to parse attestation updated date '#{updated_last}' for control #{control_id}. Error: #{e.message}")
          ui.exit(:usage_error)
        end
      end
    end
  end
end