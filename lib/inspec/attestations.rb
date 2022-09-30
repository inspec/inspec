module Inspec
  module Attestations

    # Invoked from reporters base classes & run_data.rb to modify run data
    def self.attest(run_data)
      run_data[:profiles].each do |profile|
        profile[:controls].each do |control|
          # logic for attestation applied for N/R controls here.
          if control[:status] == "not_reviewed" && !control[:attestation_data].empty?
            expiry = determine_expiry(control[:attestation_data], control[:id])
            # if expiration date parsing was successful
            if expiry
              control[:attestation_data]["message"] = validate_attestation_expiry(expiry, control[:id])
              attestation_result = attestation_check(control[:attestation_data]["message"], control[:attestation_data], control[:id])
              if attestation_result
                status, attestation_msg = attestation_result

                control[:status] =  status # N/R status -> to passed/failed based on attestation logic

                # replicated test result hash to invoke pass/fail test
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

    # Invoked from streaming reporter base class
    def self.attest_streaming_data(attestation_data, status, control_id)
      # logic check for N/R controls here for streaming reporters
      if status == "not_reviewed" && !attestation_data.blank?
        expiry = determine_expiry(attestation_data, control_id)

        # if expiration date parsing was successful
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
        begin
          calculate_expiry(attestation_data["updated"], attestation_data["frequency"], control_id)
        rescue => e
          ui = Inspec::UI.new
          ui.error("Unable to parse attestation updated date '#{attestation_data["updated"]}' for control #{control_id}. Error: #{e.message}")
          ui.exit(:usage_error)
        end
      end
    end

    def self.calculate_expiry(updated_date, frequency, control_id)
      # logic to find expiration date using frequency and updated date.
      if updated_date.is_a?(Date) || (updated_date.is_a?(String) && Date.parse(updated_date).year != 0)
        updated_date = Date.parse(updated_date) if updated_date.is_a? String
        if updated_date < Time.now.to_date
          case frequency
          when "annually"
            updated_date.to_date.next_year(1)
          when "semiannually"
            updated_date.next_month(6)
          when "quarterly"
            updated_date.next_month(3)
          when "monthly"
            updated_date.next_month(1)
          when "every2weeks"
            updated_date.next_day(14)
          when "weekly"
            updated_date.next_day(7)
          when "every3days"
            updated_date.next_day(3)
          when "daily"
            updated_date.next_day(1)
          else
            Inspec::Log.warn "Invalid frequency value '#{frequency}' for control #{control_id}."
            updated_date
          end
        else
          updated_date
        end
      else
        ui = Inspec::UI.new
        ui.error("Unable to parse attestation updated date '#{updated_date}' for control #{control_id}")
        ui.exit(:usage_error)
      end
    end
  end
end