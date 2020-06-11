# Portions Originally Copyright (c) 2008-2011 Brian Lopez - http://github.com/brianmario
# See MIT-LICENSE

require "rubygems"
require "benchmark"
require "stringio"
if !defined?(RUBY_ENGINE) || RUBY_ENGINE !~ /jruby/
  begin
    require "yajl"
  rescue LoadError
    puts "INFO: yajl-ruby not installed"
  end
else
  puts "INFO: skipping yajl-ruby on jruby"
end
require_relative "../../ffi_yajl"
begin
  require "json"
rescue LoadError
  puts "INFO: json gem not installed"
end
begin
  require "oj"
rescue LoadError
  puts "INFO: oj gem not installed"
end

module FFI_Yajl
  class Benchmark
    class Encode
      def run
        # filename = ARGV[0] || 'benchmark/subjects/ohai.json'
        filename = File.expand_path(File.join(File.dirname(__FILE__), "subjects", "ohai.json"))
        hash = File.open(filename, "rb") { |f| FFI_Yajl::Parser.parse(f.read) }

        times = ARGV[1] ? ARGV[1].to_i : 1000
        puts "Starting benchmark encoding #{filename} #{times} times\n\n"
        ::Benchmark.bmbm do |x|
          x.report("FFI_Yajl::Encoder.encode (to a String)") do
            times.times { FFI_Yajl::Encoder.encode(hash) }
          end

          ffi_string_encoder = FFI_Yajl::Encoder.new
          x.report("FFI_Yajl::Encoder#encode (to a String)") do
            times.times { ffi_string_encoder.encode(hash) }
          end

          if defined?(Oj)
            x.report("Oj.dump (to a String)") do
              times.times { Oj.dump(hash) }
            end
          end

          if defined?(Yajl::Encoder)
            x.report("Yajl::Encoder.encode (to a String)") do
              times.times { Yajl::Encoder.encode(hash) }
            end

            io_encoder = Yajl::Encoder.new
            x.report("Yajl::Encoder#encode (to an IO)") do
              times.times { io_encoder.encode(hash, StringIO.new) }
            end

            string_encoder = Yajl::Encoder.new
            x.report("Yajl::Encoder#encode (to a String)") do
              times.times { string_encoder.encode(hash) }
            end
          end

          if defined?(JSON)
            x.report("JSON.generate") do
              times.times { JSON.generate(hash) }
            end
            x.report("JSON.fast_generate") do
              times.times { JSON.fast_generate(hash) }
            end
          end
        end
      end
    end
  end
end
