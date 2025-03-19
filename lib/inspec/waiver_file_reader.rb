require "inspec/secrets/yaml"
require "inspec/utils/waivers/csv_file_reader"
require "inspec/utils/waivers/json_file_reader"

module Inspec
  class WaiverFileReader

    SUPPORTED_FILE_EXTENSION = %w{.yaml .yml .csv .json}.freeze

    def self.fetch_waivers_by_profile(profile_id, files)
      read_waivers_from_file(profile_id, files) if @waivers_data.nil? || @waivers_data[profile_id].nil?
      @waivers_data[profile_id]
    end

    def self.read_waivers_from_file(profile_id, files)
      @waivers_data ||= {}
      output = {}

      files.each do |file_path|
        file_extension = File.extname(file_path)

        unless SUPPORTED_FILE_EXTENSION.include?(file_extension)
          raise Inspec::Exceptions::WaiversFileNotReadable,
          "Cannot find parser for waivers file '#{file_path}'. " \
          "Check to make sure file has the appropriate extension. Supported file extensions are: #{SUPPORTED_FILE_EXTENSION.join(", ")}"
        end

        data = nil
        if [".yaml", ".yml"].include? file_extension
          data = Secrets::YAML.resolve(file_path)
          unless data.nil?
            data = data.inputs
            validate_json_yaml(data)
          end
        elsif file_extension == ".csv"
          data = Waivers::CSVFileReader.resolve(file_path)
          headers = Waivers::CSVFileReader.headers
          validate_headers(headers)
        elsif file_extension == ".json"
          data = Waivers::JSONFileReader.resolve(file_path)
          validate_json_yaml(data) unless data.nil?
        end
        output.merge!(data) if !data.nil? && data.is_a?(Hash)
      end

      @waivers_data[profile_id] = output
    end

    def self.validate_headers(headers, json_yaml = false)
      required_fields = json_yaml ? %w{justification} : %w{control_id justification}
      all_fields = %w{control_id justification expiration_date run}

      Inspec::Log.warn "Missing column headers: #{(required_fields - headers)}" unless (required_fields - headers).empty?
      Inspec::Log.warn "Invalid column header: Column can't be nil" if headers.include? nil
      Inspec::Log.warn "Extra column headers: #{(headers - all_fields)}" unless (headers - all_fields).empty?
    end

    def self.validate_json_yaml(data)
      headers = []
      data.each_value do |value|
        headers.push value.keys
      end
      validate_headers(headers.flatten.uniq, true)
    end
  end
end