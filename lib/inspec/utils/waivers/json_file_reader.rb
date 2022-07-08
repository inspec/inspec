module Waivers
  class JSONFileReader
    def self.resolve(path)
      return nil unless File.file?(path)

      fetch_data(path)
    end

    def self.fetch_data(path)
      JSON.parse(File.read(path))
    rescue Exception => e
      raise "Error reading InSpec waivers in JSON: #{e}"
    end
  end
end