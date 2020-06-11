$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/..")
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

require "rubygems"
require "benchmark"
require "yajl"
begin
  require "json"
rescue LoadError
end

# JSON section
filename = "benchmark/subjects/ohai.json"
marshal_filename = "benchmark/subjects/ohai.marshal_dump"
json = File.new(filename, "r")
marshal_file = File.new(marshal_filename, "r")

hash = {}

times = ARGV[0] ? ARGV[0].to_i : 1000
puts "Starting benchmark parsing #{File.size(filename)} bytes of JSON data #{times} times\n\n"
Benchmark.bmbm do |x|
  x.report do
    puts "Yajl::Parser#parse"
    yajl = Yajl::Parser.new
    yajl.on_parse_complete = ->(obj) {} if times > 1
    times.times do
      json.rewind
      hash = yajl.parse(json)
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
  x.report do
    puts "Marshal.load"
    times.times do
      marshal_file.rewind
      Marshal.load(marshal_file)
    end
  end
end
json.close
marshal_file.close
