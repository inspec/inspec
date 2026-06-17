require_relative "base"
require_relative "../../../../../inspec/cli"
require "stringio" unless defined?(StringIO)
require "json" unless defined?(JSON)

module InspecPlugins::Suggest
  class Checker::Check
    class LoadAsJSON < Base
      name "load-as-json"

      def run(file)
        old_stdout = $stdout
        captured_stdout = $stdout = StringIO.new
        begin
          Inspec::InspecCLI.start(["export", "--format", "json", file[:full_path]])
        rescue Exception => e
          # Could be anything - a missing method in the file, who knows.
          $stdout = old_stdout
          file[:errors] << "Failed to export as JSON: #{e}"
          return false
        end
        $stdout = old_stdout

        begin
          file[:as_json] = JSON.parse(captured_stdout.string)
          return true
        rescue JSON::ParserError => e
          file[:errors] << "Failed to export as JSON: #{e}"
          return false
        end

        false
      end
    end
  end
end
