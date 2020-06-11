# Portions Originally Copyright (c) 2008-2011 Brian Lopez - http://github.com/brianmario
# See MIT-LICENSE

require "rubygems"
require_relative "../../ffi_yajl"
begin
  require "perftools"
rescue LoadError
  puts "INFO: perftools.rb gem not installed"
end

ENV["CPUPROFILE_FREQUENCY"] = "4000"

module FFI_Yajl
  class Benchmark
    class EncodeProfile
      def run
        return unless defined?(PerfTools)

        filename = File.expand_path(File.join(File.dirname(__FILE__), "subjects", "ohai.json"))
        hash = File.open(filename, "rb") { |f| FFI_Yajl::Parser.parse(f.read) }

        times = 1000
        puts "Starting profiling encoding #{filename} #{times} times\n\n"

        ffi_string_encoder = FFI_Yajl::Encoder.new
        PerfTools::CpuProfiler.start("/tmp/ffi_yajl_encode_profile.out") do
          times.times { ffi_string_encoder.encode(hash) }
        end
        system("pprof.rb --text /tmp/ffi_yajl_encode_profile.out")
      end
    end
  end
end
