require "rubygems"
require "benchmark"
require "yajl"
require_relative "../../ffi_yajl"
if !defined?(RUBY_ENGINE) || RUBY_ENGINE !~ /jruby/
  begin
    require "yajl"
  rescue LoadError
    puts "INFO: yajl-ruby not installed"
  end
else
  puts "INFO: skipping yajl-ruby on jruby"
end
begin
  require "json"
rescue LoadError
end
begin
  require "oj"
rescue LoadError
end

module FFI_Yajl
  class Benchmark
    class Parse
      def run
        filename = File.expand_path(File.join(File.dirname(__FILE__), "subjects", "item.json"))
        json = File.new(filename, "r")
        json_str = json.read

        times = ARGV[1] ? ARGV[1].to_i : 10_000
        puts "Starting benchmark parsing #{File.size(filename)} bytes of JSON data #{times} times\n\n"
        ::Benchmark.bmbm do |x|
          x.report do
            puts "FFI_Yajl::Parser.parse (from a String)"
            times.times { FFI_Yajl::Parser.parse(json_str) }
          end
          #      ffi_parser = FFI_Yajl::Parser.new
          #      x.report {
          #        puts "FFI_Yajl::Parser#parse (from a String)"
          #        times.times {
          #          json.rewind
          #          ffi_parser.parse(json.read)
          #        }
          #      }
          if defined?(Yajl::Parser)
            x.report do
              puts "Yajl::Parser.parse (from a String)"
              times.times { Yajl::Parser.parse(json_str) }
            end
            io_parser = Yajl::Parser.new
            io_parser.on_parse_complete = ->(obj) {} if times > 1
            x.report do
              puts "Yajl::Parser#parse (from an IO)"
              times.times do
                json.rewind
                io_parser.parse(json)
              end
            end
            string_parser = Yajl::Parser.new
            string_parser.on_parse_complete = ->(obj) {} if times > 1
            x.report do
              puts "Yajl::Parser#parse (from a String)"
              times.times do
                json.rewind
                string_parser.parse(json_str)
              end
            end
          end
          if defined?(Oj)
            x.report do
              puts "Oj.load"
              times.times do
                json.rewind
                Oj.load(json.read)
              end
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
      end
    end
  end
end
