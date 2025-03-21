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
        next unless valid_waiver_file?(file_path)

        data = parse_waiver_file(file_path)
        output.merge!(data) if data.is_a?(Hash)
      end

      @waivers_data[profile_id] = output
    end

    def self.valid_waiver_file?(file_path)
      # Check if the file is readable
      file_extension = File.extname(file_path).downcase
      unless SUPPORTED_FILE_EXTENSION.include?(file_extension)
        raise Inspec::Exceptions::WaiversFileNotReadable,
              "Unsupported file extension for '#{file_path}'. Allowed waiver file extensions: #{SUPPORTED_FILE_EXTENSION.join(", ")}"
      end

      # Check if the file is empty
      if File.zero?(file_path)
        Inspec::Log.warn "Waivers file '#{file_path}' is empty. Skipping waivers."
        return false
      end

      true
    end

    def self.parse_waiver_file(file_path)
      file_extension = File.extname(file_path).downcase

      case file_extension
      when ".yaml", ".yml"
        data = Secrets::YAML.resolve(file_path)&.inputs
        validate_json_yaml(data)
      when ".csv"
        data = Waivers::CSVFileReader.resolve(file_path)
        validate_headers(Waivers::CSVFileReader.headers)
      when ".json"
        data = Waivers::JSONFileReader.resolve(file_path)
        validate_json_yaml(data)
      end

      data
    end

    def self.validate_headers(headers, json_yaml = false)
      required_fields = json_yaml ? %w{justification} : %w{control_id justification}
      all_fields = %w{control_id justification expiration_date run}

      Inspec::Log.warn "Missing column headers: #{(required_fields - headers)}" unless (required_fields - headers).empty?
      Inspec::Log.warn "Invalid column header: Column can't be nil" if headers.include? nil
      Inspec::Log.warn "Extra column headers: #{(headers - all_fields)}" unless (headers - all_fields).empty?
    end

    def self.validate_json_yaml(data)
      return if data.nil?

      headers = []
      data.each_value do |value|
        headers.push value.keys
      end
      validate_headers(headers.flatten.uniq, true)
    end
  end
end