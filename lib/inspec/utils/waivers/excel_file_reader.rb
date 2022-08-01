require "roo"
require "roo-xls"

module Waivers
  class ExcelFileReader
    def self.resolve(path)
      return nil unless File.file?(path)

      @headers ||= []
      fetch_data(path)
    end

    def self.fetch_data(path)
      waiver_data_hash = {}
      file_extension = File.extname(path) == ".xlsx" ? :xlsx : :xls
      excel_file = Roo::Spreadsheet.open(path, extension: file_extension)
      excel_file.sheet(0).parse(headers: true).each_with_index do |row, index|
        if index == 0
          @headers = row.keys
        else
          row_hash = row
          control_id = row_hash["control_id"]
          # delete keys and values not required in final hash
          row_hash.delete("control_id")
          row_hash.delete_if { |k, v| k.nil? || v.nil? }
        end

        waiver_data_hash[control_id] = row_hash if control_id && !row_hash.blank?
      end
      waiver_data_hash
    rescue Exception => e
      raise "Error reading InSpec waivers in Excel: #{e}"
    end

    def self.headers
      @headers
    end
  end
end