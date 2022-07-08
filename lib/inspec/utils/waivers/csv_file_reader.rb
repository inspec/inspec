require "csv" unless defined?(CSV)

module Waivers
  class CSVFileReader
    def self.resolve(path)
      return nil unless File.file?(path)

      fetch_data(path)
    end

    def self.fetch_data(path)
      input_hash = {}
      CSV.foreach(path, headers: true) do |row|
        row_hash = row.to_hash
        input_name = row_hash["control_id"]
        row_hash.delete("control_id")
        input_hash[input_name] = row_hash
      end
      input_hash
    rescue => e
      raise "Error reading InSpec inputs: #{e}"
    end
  end
end