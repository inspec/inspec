require 'singleton'
require 'inspec/utils/telemetry/config'
require 'inspec/utils/telemetry/data_series'
require 'inspec/utils/telemetry/global_method'
require 'inspec/utils/telemetry/report'

# Inspec Telemetry!
# This is a Singleton and acts as a collector for incoming data.
module Inspec::Telemetry
  class Collector
    include Singleton

    def initialize
      @data_series_collection = []
    end

    # A collection of Inspec::Telemetry::DataSeries objects
    # @return [Array]
    attr_reader :data_series_collection

    #
    # @return [TrueClass]
    def report_add(report)
      parse_report(report)
    end

    # TBD
    def deprecation_add(deprecation)
    end

    private

    # Parse a Hash 'formatted report' from rspec and generate a Telemetry Report.
    # @return [Inspec::Telemetry::Report]
    def parse_report(report)
      parse_profiles(report[:profiles])
      generate_report
    end

    # Parses profiles, and if they include controls parse them too.
    # Adds all profiles to our data collection.
    # @return [TrueClass]
    def parse_profiles(profiles)
      profiles.each do |profile|
        data = data_series
        data.type = "profile"
        data.controls = profile[:controls].count
        profile[:controls].nil? ? next : parse_controls(profile[:controls])
        add_data_series(data)
      end
    end

    # Parses controls, and if they include tests parse them too.
    # Adds all controls to our data collection.
    # @return [TrueClass]
    def parse_controls(controls)
      controls.each do |control|
        data = data_series
        data.type = "control"
        data.tests = control[:results].count
        control[:results].nil? ? next : parse_tests(control[:results])
        add_data_series(data)
      end
    end

    # Parses tests and adds them to our data collection.
    # @return [TrueClass]
    def parse_tests(tests)
      tests.each do |test|
        data = data_series
        data.type = "test"
        data.resource = test[:resource_title].to_s.split.first
        data.run_time = test[:run_time]
        add_data_series(data)
      end
    end

    # @return [TrueClass]
    def generate_report
      Inspec::Telemetry::Report.new(data_series_collection)
    end

    # Interface to DataSeries
    # @return [Inspec::Telemetry::Dataseries]
    def data_series
      Inspec::Telemetry::DataSeries.new
    end

    # @return [TrueClass]
    def add_data_series(data)
      @data_series_collection << data
    end
  end
end
