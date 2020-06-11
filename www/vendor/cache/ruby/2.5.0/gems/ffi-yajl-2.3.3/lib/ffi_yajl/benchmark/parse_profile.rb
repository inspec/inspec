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
    class ParseProfile
      def run
        return if defined?(PerfTools)

        filename = File.expand_path(File.join(File.dirname(__FILE__), "subjects", "ohai.json"))
        json = File.new(filename, "r").read

        times = 1000
        puts "Starting profiling encoding #{filename} #{times} times\n\n"

        PerfTools::CpuProfiler.start("/tmp/ffi_yajl_encode_profile.out") do
          times.times { FFI_Yajl::Parser.parse(json) }
        end
        system("pprof.rb --text /tmp/ffi_yajl_encode_profile.out")
      end
    end
  end
end
