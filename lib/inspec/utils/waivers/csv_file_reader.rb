require "csv" unless defined?(CSV)

module Waivers
  class CSVFileReader
    def self.resolve(path)
      return nil unless File.file?(path)

      fetch_data(path)
    end

    def self.fetch_data(path)
      waiver_data_hash = {}
      CSV.foreach(path, headers: true) do |row|
        row_hash = row.to_hash
        control_id = row_hash["control_id"]
        # delete keys and values not required in final hash
        row_hash.delete("control_id")
        row_hash.delete_if { |k, v| k.nil? || v.nil? }

        waiver_data_hash[control_id] = row_hash if control_id && !row_hash.blank?
      end

      waiver_data_hash
    rescue Exception => e
      raise "Error reading InSpec waivers in CSV: #{e}"
    end
  end
end