require "inspec/secrets/yaml"
require "inspec/utils/waivers/csv_file_reader"
require "inspec/utils/waivers/json_file_reader"
require "inspec/utils/waivers/excel_file_reader"

module Inspec
  class AttestationFileReader < WaiverFileReader

    def self.fetch_attestation_by_profile(profile_id, files)
      read_attestation_from_file(profile_id, files) if @attestation_data.nil? || @attestation_data[profile_id].nil?
      @attestation_data[profile_id]
    end

    def self.read_attestation_from_file(profile_id, files)
      @attestation_data ||= {}
      output = {}

      files.each do |file_path|
        data = read_from_file(file_path)
        output.merge!(data) if !data.nil? && data.is_a?(Hash)

        if data.nil?
          raise Inspec::Exceptions::AttestationFileNotReadable,
              "Cannot find parser for attestation file '#{file_path}'. " \
              "Check to make sure file has the appropriate extension."
        end
      end

      @attestation_data[profile_id] = output
    end

    def self.all_fields
      %w{control_id justification expiration_date evidence_url status explanation frequency updated}
    end
  end
end