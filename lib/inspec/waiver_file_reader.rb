require "inspec/secrets/yaml"
require "inspec/utils/waivers/csv_file_reader"
require "inspec/utils/waivers/json_file_reader"

module Inspec
  class WaiverFileReader

    def self.fetch_waivers_by_profile(profile_id, files)
      read_waivers_from_file(profile_id, files) if @waivers_data.nil? || @waivers_data[profile_id].nil?
      @waivers_data[profile_id]
    end

    def self.read_waivers_from_file(profile_id, files)
      @waivers_data ||= {}
      output = {}

      files.each do |file_path|
        data = read_from_file(file_path)
        output.merge!(data) if !data.nil? && data.is_a?(Hash)

        if data.nil?
          raise Inspec::Exceptions::WaiversFileNotReadable,
              "Cannot find parser for waivers file." \
              "Check to make sure file has the appropriate extension."
        end
      rescue Inspec::Exceptions::WaiversFileNotReadable, Inspec::Exceptions::WaiversFileInvalidFormatting => e
        Inspec::Log.error "Error reading waivers file #{file_path}. #{e.message}"
        Inspec::UI.new.exit(:usage_error)
      end

      @waivers_data[profile_id] = output
    end

    def self.read_from_file(file_path)
      data = nil
      file_extension = File.extname(file_path)
      if [".yaml", ".yml"].include? file_extension
        data = Secrets::YAML.resolve(file_path)
        data = data.inputs unless data.nil?
        validate_json_yaml(data)
      elsif file_extension == ".csv"
        data = Waivers::CSVFileReader.resolve(file_path)
        headers = Waivers::CSVFileReader.headers
        validate_csv_headers(headers)
      elsif file_extension == ".json"
        data = Waivers::JSONFileReader.resolve(file_path)
        validate_json_yaml(data) unless data.nil?
      end
      data
    end

    def self.all_fields
      %w{control_id justification expiration_date run}
    end

    def self.validate_csv_headers(headers)
      invalid_headers_info = fetch_invalid_headers_info(headers)
      # Warn if blank column found in csv file
      Inspec::Log.warn "Invalid column headers: Column can't be nil" if invalid_headers_info[:blank_column]
      # Warn if extra header found in csv file
      Inspec::Log.warn "Extra header/s #{invalid_headers_info[:extra_headers]}" unless invalid_headers_info[:extra_headers].empty?
      unless invalid_headers_info[:missing_required_fields].empty?
        raise Inspec::Exceptions::WaiversFileInvalidFormatting,
        "Missing required header/s #{invalid_headers_info[:missing_required_fields]}. Fix headers in file to proceed."
      end
    end

    def self.fetch_invalid_headers_info(headers, json_yaml = false)
      required_fields = json_yaml ? %w{justification} : %w{control_id justification}
      data = {}
      data[:missing_required_fields] = []
      # Finds missing required fields
      unless (required_fields - headers).empty?
        data[:missing_required_fields] = required_fields - headers
      end
      # If column with no header found set the blank_column flag. Only applicable for csv
      data[:blank_column] = headers.include?(nil) ? true : false
      # Find extra headers/parameters
      data[:extra_headers] = (headers - all_fields)
      data
    end

    def self.validate_json_yaml(data)
      missing_required_field = false
      data.each do |key, value|
        # In case of yaml or json we need to validate headers/parametes for each value
        invalid_headers_info = fetch_invalid_headers_info(value.keys, true)
        # WARN in case of extra parameters found in each waived control
        Inspec::Log.warn "Control ID #{key}: extra parameter/s #{invalid_headers_info[:extra_headers]}" unless invalid_headers_info[:extra_headers].empty?
        unless invalid_headers_info[:missing_required_fields].empty?
          missing_required_field = true
          # Log error for each waived control
          Inspec::Log.error "Control ID #{key}: missing required parameter/s #{invalid_headers_info[:missing_required_fields]}"
        end
      end

      # Raise error if any of the waived control has missing required filed
      if missing_required_field
        raise Inspec::Exceptions::WaiversFileInvalidFormatting,
             "Missing required parameter [justification]. Fix parameters in file to proceed."
      end
    end
  end
end