# Portions Originally Copyright (c) 2008-2011 Brian Lopez - http://github.com/brianmario
# See MIT-LICENSE

require "rubygems"
require_relative "../../ffi_yajl"

module FFI_Yajl
  class Benchmark
    class ParseProfileRubyProf
      def run
        begin
          require "ruby-prof"
        rescue LoadError
          puts "INFO: perftools.rb gem not installed"
        end

        return if defined?(RubyProf)

        filename = File.expand_path(File.join(File.dirname(__FILE__), "subjects", "ohai.json"))
        json = File.new(filename, "r").read

        times = 1000
        puts "Starting profiling encoding #{filename} #{times} times\n\n"

        result = RubyProf.profile do
          times.times { FFI_Yajl::Parser.parse(json) }
        end

        printer = RubyProf::GraphPrinter.new(result)
        printer.print(STDOUT, {})
      end
    end
  end
end
