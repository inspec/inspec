$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/..")
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

require "rubygems"
require "benchmark"
require "yajl"
begin
  require "json"
rescue LoadError
end
begin
  require "active_support"
rescue LoadError
end

filename = "benchmark/subjects/twitter_stream.json"
json = File.new(filename, "r")

times = ARGV[0] ? ARGV[0].to_i : 100
puts "Starting benchmark parsing JSON stream (#{File.size(filename)} bytes of JSON data with 430 JSON separate strings) #{times} times\n\n"
Benchmark.bmbm do |x|
  parser = Yajl::Parser.new
  parser.on_parse_complete = ->(obj) {}
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
        while ( chunk = json.gets )
          JSON.parse(chunk, max_nesting: false)
        end
      end
    end
  end
  if defined?(ActiveSupport::JSON)
    x.report do
      puts "ActiveSupport::JSON.decode"
      times.times do
        json.rewind
        while ( chunk = json.gets )
          ActiveSupport::JSON.decode(chunk)
        end
      end
    end
  end
end
json.close
