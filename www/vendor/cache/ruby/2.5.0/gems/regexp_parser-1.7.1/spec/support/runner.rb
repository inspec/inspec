require 'pathname'
require 'rspec'

module RegexpParserSpec
  class Runner
    def initialize(arguments, warning_whitelist)
      @arguments = arguments
      @warning_whitelist = warning_whitelist
    end

    def run
      spec_status = nil

      Warning::Filter.new(warning_whitelist).assert_expected_warnings_only do
        setup
        spec_status = run_rspec
      end

      spec_status
    end

    private

    def setup
      $VERBOSE = true

      spec_files.each(&method(:require))
    end

    def run_rspec
      RSpec::Core::Runner.run([])
    end

    def spec_files
      arguments
        .map { |path| Pathname.new(path).expand_path.freeze }
        .select(&:file?)
    end

    attr_reader :arguments, :warning_whitelist
  end
end
