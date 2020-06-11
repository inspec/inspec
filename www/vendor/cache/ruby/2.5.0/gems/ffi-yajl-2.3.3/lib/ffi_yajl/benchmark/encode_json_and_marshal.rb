$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/..")
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

require "rubygems"
require "benchmark"
require "yajl"
require "stringio"
begin
  require "json"
rescue LoadError
end

times = ARGV[0] ? ARGV[0].to_i : 1000
filename = "benchmark/subjects/ohai.json"
json = File.new(filename, "r")
hash = Yajl::Parser.new.parse(json)
json.close

puts "Starting benchmark encoding #{filename} #{times} times\n\n"
Benchmark.bmbm do |x|
  encoder = Yajl::Encoder.new
  x.report do
    puts "Yajl::Encoder#encode"
    times.times do
      encoder.encode(hash, StringIO.new)
    end
  end
  if defined?(JSON)
    x.report do
      puts "JSON's #to_json"
      times.times do
        JSON.generate(hash)
      end
    end
  end
  x.report do
    puts "Marshal.dump"
    times.times do
      Marshal.dump(hash)
    end
  end
end
