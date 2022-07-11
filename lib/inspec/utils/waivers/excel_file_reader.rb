require "roo"
require "roo-xls"

module Waivers
  class ExcelFileReader
    def self.resolve(path)
      return nil unless File.file?(path)

      fetch_data(path)
    end

    def self.fetch_data(path)
      input_hash = {}
      file_extension = File.extname(path) == ".xlsx" ? :xlsx : :xls
      excel_file = Roo::Spreadsheet.open(path, extension: file_extension)
      excel_file.sheet(0).parse(headers: true).each_with_index do |row, index|
        next if index == 0

        row_hash = row
        input_name = row_hash["control_id"]
        # delete keys and values not required in final hash
        row_hash.delete("control_id")
        row_hash.delete_if { |k, v| k.nil? || v.nil? }

        input_hash[input_name] = row_hash if input_name && !row_hash.blank?
      end
      input_hash
    rescue Exception => e
      raise "Error reading InSpec waivers in Excel: #{e}"
    end
  end
end