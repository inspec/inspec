require_relative "base"
require "mixlib/shellout" unless defined?(Mixlib::ShellOut)

module InspecPlugins::Suggest
  class Checker::Check
    class Syntax < Base
      name "syntax"

      def run(file)
        file[:basename] = File.basename(file[:rel_path])

        ruby_dash_c = Mixlib::ShellOut.new("#{Gem.ruby} -c #{file[:full_path]}")
        ruby_dash_c.run_command

        if ruby_dash_c.error?
          file[:errors] << "Syntax check failed: " + ruby_dash_c.stderr
          return false
        end

        true
      end
    end
  end
end
