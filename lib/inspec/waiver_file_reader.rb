require "inspec/secrets/yaml"
require "inspec/utils/waivers/csv_file_reader"
require "inspec/utils/waivers/json_file_reader"
require "inspec/utils/waivers/excel_file_reader"

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
        file_extension = File.extname(file_path)
        data = nil
        headers = []
        if [".yaml", ".yml"].include? file_extension
          data = Secrets::YAML.resolve(file_path)
          data = data.inputs unless data.nil?
        elsif file_extension == ".csv"
          data = Waivers::CSVFileReader.resolve(file_path)
          headers = Waivers::CSVFileReader.headers
          validate_headers(headers)
        elsif file_extension == ".json"
          data = Waivers::JSONFileReader.resolve(file_path)
        elsif [".xls", ".xlsx"].include? file_extension
          data = Waivers::ExcelFileReader.resolve(file_path)
          headers = Waivers::ExcelFileReader.headers
          validate_headers(headers)
        end
        output.merge!(data) if !data.nil? && data.is_a?(Hash)

        if data.nil?
          raise Inspec::Exceptions::WaiversFileNotReadable,
              "Cannot find parser for waivers file '#{file_path}'. " \
              "Check to make sure file has the appropriate extension."
        end
      end

      @waivers_data[profile_id] = output
    end

    def self.validate_headers(headers)
      required_fields = %w(control_id justification)
      all_fields = %w(control_id justification expiration_date run)

      Inspec::Log.warn "Missing column headers: #{(required_fields - headers)}" if !(required_fields - headers).empty?
      Inspec::Log.warn "Invalid column header: Column can't be nil" if headers.include? nil
      Inspec::Log.warn "Invalid column headers: #{(headers - all_fields)}" if !(headers - all_fields).empty?
    end
  end
end