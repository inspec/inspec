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
      rescue Inspec::Exceptions::WaiversFileNotReadable, Inspec::Exceptions::WaiversFileInvalidFormatting => e
        Inspec::Log.error "Error reading waivers file #{file_path}. #{e.message}"
        Inspec::UI.new.exit(:usage_error)
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
        validate_csv_headers(Waivers::CSVFileReader.headers)
      when ".json"
        data = Waivers::JSONFileReader.resolve(file_path)
        validate_json_yaml(data)
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
      return if data.nil?

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