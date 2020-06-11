$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/..")
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

require "rubygems"
require "benchmark"
require "yajl"
begin
  require "json"
rescue LoadError
end
require "yaml"

# JSON section
filename = "benchmark/subjects/ohai.json"
json = File.new(filename, "r")

times = ARGV[0] ? ARGV[0].to_i : 1000
puts "Starting benchmark parsing #{File.size(filename)} bytes of JSON data #{times} times\n\n"
Benchmark.bmbm do |x|
  parser = Yajl::Parser.new
  parser.on_parse_complete = ->(obj) {} if times > 1
  x.report do
    puts "Yajl::Parser#parse"
    times.times do
      json.rewind
      parser.parse(json)
    end
  end
  if defined?(JSON)
    x.report do
      puts "JSON.parse"
      times.times do
        json.rewind
        JSON.parse(json.read, max_nesting: false)
      end
    end
  end
end
json.close

# YAML section
filename = "benchmark/subjects/ohai.yml"
yaml = File.new(filename, "r")

puts "Starting benchmark parsing #{File.size(filename)} bytes of YAML data #{times} times\n\n"
Benchmark.bmbm do |x|
  x.report do
    puts "YAML.load_stream"
    times.times do
      yaml.rewind
      YAML.load(yaml)
    end
  end
end
yaml.close
