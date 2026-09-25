require "yaml"
require "json" unless defined?(JSON)

class AttributeFileWriter
  def self.write_yaml(file, content)
    writer = AttributeFileWriter.new(file)
    writer.convert_to_yaml(content)
  end

  def self.append(file, content)
    writer = AttributeFileWriter.new(file)
    writer.append(content)
  end

  def initialize(file)
    @file = file
  end

  def convert_to_yaml(content)
    json = JSON.parse(content)
    yaml = {}
    json.each_key do |key|
      yaml[key] = json[key]["value"]
    end
    File.open(@file, "w") { |file| file.puts(yaml.to_yaml) }
  end

  def append(content)
    File.open(@file, "a") { |file| file.puts(content) }
  end
end
