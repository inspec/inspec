require 'json'

# Generate a Telemetry Report from a collection of DataSeries objects.
module Inspec::Telemetry
  class Report
    # Initialize a new report with a data series collection
    # @param [Array] of [Inspec::Telemetry::DataSeries]
    def initialize(data_series_collection)
      @data_series_collection = data_series_collection.clone
    end

    # Generate a report.
    # @return [Hash]
    def generate
      inspec
      platform
      profiles
      controls
      tests
      tests_resources
      report
    end

    # Generate a report in JSON format.
    # @return [JSON]
    def generate_json
      generate.to_json
    end

    private

    # Determine how many of a type of item exists in our collection.
    # @param [String] collection_type, the item you'd like counted, eg profile, control, test
    # @return [Integer]
    def count_collection_type(collection_type)
      data_series_collection.select {|ds| ds.type.eql?(collection_type)}.count
    end

    # Adds details about the number of controls in our collection to the report.
    # @return [TrueClass]
    def controls
      report[:controls] = {
        count: count_collection_type('control')
      }
    end

    # Memoized accessor for our collection
    # @return [Array]
    def data_series_collection
      @dsc ||= @data_series_collection
    end

    # Adds details about InSpec to our report.
    # @return [TrueClass]
    def inspec
      report[:inspec] = {
        version: Inspec::VERSION
      }
    end

    # Adds details about the Ruby enivronment to our report.
    # @return [TrueClass]
    def platform
      report[:platform] = {
        ruby_version: RUBY_VERSION,
        ruby_platform: RUBY_PLATFORM
      }
    end

    # Adds details about the number of profiles in our collection to the report.
    # @return [TrueClass]
    def profiles
      report[:profiles] = {
        count: count_collection_type('profile')
      }
    end

    # Accessor for report, ensures Hash structure.
    # @return [Hash]
    def report
      @report ||= {}
    end

    # Adds details about the number of tests in our collection to the report.
    # Also include the average run time of all the tests.
    # @return [TrueClass]
    def tests
      report[:tests] = {
        count: count_collection_type('test'),
        average_run_time: all_tests_average_run_time
      }
    end

    # Adds details about the number and types of tests in our collection the report.
    # Determine the different types of resources in use, eg File, Host, User
    # Determine the average run time of each type of resource.
    # @return [TrueClass]
    def tests_resources
      unique_resources = data_series_collection.map { |ds| ds.resource }.compact.uniq
      unique_resources.each do |res|

        resources = data_series_collection.select {|r| r.resource.eql?(res)}
        resource_count = resources.count
        resource_run_times = resources.map { |r| r.run_time }

        report[:tests][res] = {
          count: resource_count,
          average_run_time: average_run_time(resource_count, resource_run_times)
        }
      end
    end

    # Determine the average run time for all tests in our collection.
    # @return [Float]
    def all_tests_average_run_time
      run_times = data_series_collection.map {|ds| ds.run_time}.compact
      average_run_time(run_times.count, run_times)
    end

    # Used to determine the average run time for items in the report.
    # @param [Integer] run_count, total number of items
    # @param [Array] run_times, Array of Floats; the run_time of each item being averaged.
    # @return [Float]
    def average_run_time(run_count, run_times)
      run_time_sum = 0.0
      run_times.each {|rt| run_time_sum += rt}
      run_time_sum / run_count
    end
  end
end
