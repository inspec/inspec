require "rspec/core"
require "rspec/core/formatters/base_formatter"
require "set" unless defined?(Set)

module Inspec::Formatters
  class Base < RSpec::Core::Formatters::BaseFormatter
    RSpec::Core::Formatters.register self, :close, :dump_summary, :stop

    attr_accessor :backend, :run_data, :enhanced_outcomes

    def initialize(output)
      super(output)

      @run_data = {}
      @profiles = []
      @profiles_info = nil
      @backend = nil
      @all_controls_count = nil
      @control_checks_count_map = {}
      @enhanced_outcomes = nil
    end

    # RSpec Override: #dump_summary
    #
    # Supply run summary data, such as the InSpec version and the total duration.
    def dump_summary(summary)
      run_data[:version] = Inspec::VERSION
      run_data[:statistics] = {
        duration: summary.duration,
        controls: statistics,
      }
    end

    # RSpec Override: #stop
    #
    # Called at the end of a complete RSpec run.
    # We use this to map tests to controls and flesh out the rest of the run_data
    # hash to include details about the run, the platform, etc.
    def stop(notification)
      # This might be a bit confusing. The results are not actually organized
      # by control. It is organized by test. So if a control has 3 tests, the
      # output will have 3 control entries, each one with the same control id
      # and different test results. An rspec example maps to an inspec test.
      run_data[:controls] = notification.examples.map do |example|
        format_example(example).tap do |hash|
          e = example.exception
          next unless e

          if example.metadata[:sensitive]
            hash[:message] = "*** sensitive output suppressed ***"
          else
            hash[:message] = exception_message(e)
          end
          next if e.is_a? RSpec::Expectations::ExpectationNotMetError

          hash[:exception] = e.class.name
          hash[:backtrace] = e.backtrace
        end
      end

      # include any tests that were run that were not part of a control
      run_data[:other_checks] = examples_without_controls
      examples_with_controls.each do |example|
        control = example2control(example)
        move_example_into_control(example, control)
      end

      # flesh out the profiles key with additional profile information
      run_data[:profiles] = profiles_info

      add_enhanced_outcomes_to_controls if enhanced_outcomes

      # add the platform information for this particular target
      run_data[:platform] = {
        name: platform(:name),
        release: platform(:release),
        target: backend_target,
        target_id: platform(:uuid),
      }
    end

    # Add the current profile to the list of executed profiles.
    # Called by the runner during example collection.
    def add_profile(profile)
      @profiles.push(profile)
    end

    # These control count related methods are called via runner rspec library of inspec
    # And these are used within streaming plugins to determine end of control
    ######### Start of control count related methods
    def set_controls_count(controls_count)
      @all_controls_count = controls_count
    end

    def set_control_checks_count_map(mapping)
      @control_checks_count_map = mapping
    end

    def get_controls_count
      @all_controls_count
    end

    def get_control_checks_count_map
      @control_checks_count_map
    end
    ######### end of control count related methods

    # Return all the collected output to the caller
    def results
      run_data
    end

    private

    def add_enhanced_outcomes_to_controls
      all_unique_controls.each do |control|
        control[:status] = determine_control_enhanced_outcome(control)
      end
    end

    def determine_control_enhanced_outcome(control)
      if control_has_error(control)
        { name: "Error", abbrev: "ERR" }
      elsif control[:impact].to_f == 0.0
        { name: "Not Applicable", abbrev: "N/A" }
      elsif control_has_all_tests_skipped(control)
        { name: "Not Reviewed", abbrev: "N/R" }
      elsif control[:results] && control[:results].any? { |r| r[:status] == "failed" }
        { name: "Failed", abbrev: "fail"}
      else
        { name: "Passed", abbrev: "pass" }
      end
    end

    def control_has_all_tests_skipped(control)
      control[:results] && control[:results].all? { |r| r[:status] == "skipped" }
    end

    def control_has_error(control)
      control[:results] && (control[:results].any? { |r| !r[:exception].nil? && !r[:backtrace].nil? })
    end

    def all_unique_controls
      unique_controls = Set.new
      run_data[:profiles].each do |profile|
        profile[:controls].map { |control| unique_controls.add(control) }
      end

      unique_controls
    end

    def statistics
      failed = 0
      skipped = 0
      passed = 0

      all_unique_controls.each do |control|
        next unless control[:results]

        if control[:results].any? { |r| r[:status] == "failed" }
          failed += 1
        elsif control[:results].any? { |r| r[:status] == "skipped" }
          skipped += 1
        else
          passed += 1
        end
      end

      total = failed + passed + skipped

      {
        total: total,
        passed: {
          total: passed,
        },
        skipped: {
          total: skipped,
        },
        failed: {
          total: failed,
        },
      }
    end

    def exception_message(exception)
      if exception.is_a?(RSpec::Core::MultipleExceptionError)
        exception.all_exceptions.map(&:message).uniq.join("\n\n")
      else
        exception.message
      end
    end

    # RSpec Override: #format_example
    #
    # Called after test execution, this allows us to populate our own hash with data
    # for this test that is necessary for the rest of our reports.
    def format_example(example) # rubocop:disable Metrics/AbcSize
      if !example.metadata[:description_args].empty? && example.metadata[:skip]
        # For skipped profiles, rspec returns in full_description the skip_message as well. We don't want
        # to mix the two, so we pick the full_description from the example.metadata[:example_group] hash.
        code_description = example.metadata[:example_group][:description]
      else
        code_description = example.metadata[:full_description]
      end

      res = {
        id: example.metadata[:id],
        profile_id: example.metadata[:profile_id],
        status: example.execution_result.status.to_s,
        code_desc: code_description,
        run_time: example.execution_result.run_time,
        start_time: example.execution_result.started_at.to_datetime.rfc3339.to_s,
        resource_title: example.metadata[:described_class] || example.metadata[:example_group][:description],
        expectation_message: format_expectation_message(example),
        waiver_data: example.metadata[:waiver_data],
        # This enforces the resource name as expected based off of the class
        # name. However, if we wanted the `name` attribute against the class
        # to be canonical for this case (consider edge cases!) we would use
        # example.metadata[:described_class].instance_variable_get(:@__resource_name__)&.to_s
        resource_class: example.metadata[:described_class].class.superclass.name,
        # This is a raw grep of the text passed to the resource in any format,
        # and is used to enforce near-uniqueness against the resource.
        resource_params: find_resource_params(example.metadata[:described_class]),
      }

      unless (pid = example.metadata[:profile_id]).nil?
        res[:profile_id] = pid
      end

      if res[:status] == "pending"
        res[:status] = "skipped"
        res[:skip_message] = example.metadata[:description]
        res[:resource] = example.metadata[:described_class].to_s
      end

      res
    end

    def find_resource_params(example)
      if example.class.ancestors.include?(Inspec::Resource)
        example.instance_variable_get(:@resource_params)
      else
        []
      end
    end

    def format_expectation_message(example)
      if (example.metadata[:example_group][:description_args].first == example.metadata[:example_group][:described_class]) ||
          example.metadata[:example_group][:described_class].nil?
        example.metadata[:description]
      else
        "#{example.metadata[:example_group][:description]} #{example.metadata[:description]}"
      end
    end

    # This formatter runs for all reports and we cannot error on missing fields.
    # Return nil if not found or Train error. If needed, we will raise an error inside
    # the proper report.
    def platform(field)
      return nil if @backend.nil?

      @backend.platform[field]
    rescue Train::PlatformUuidDetectionFailed
      Inspec::Log.warn("Could not find platform target_id.")
      nil
    rescue Train::Error => e
      Inspec::Log.warn(e.message)
      nil
    end

    def backend_target
      return nil if @backend.nil?

      connection = @backend.backend
      connection.respond_to?(:uri) ? connection.uri : nil
    end

    def examples
      run_data[:controls]
    end

    def examples_without_controls
      examples.find_all { |example| example2control(example).nil? }
    end

    def examples_with_controls
      examples.find_all { |example| !example2control(example).nil? }
    end

    def profiles_info
      @profiles_info ||= @profiles.map(&:info!).map(&:dup)
    end

    def example2control(example)
      profile = profile_from_example(example)
      return nil unless profile&.[](:controls)

      profile[:controls].find { |x| x[:id] == example[:id] }
    end

    def profile_from_example(example)
      profiles_info.find { |p| profile_contains_example?(p, example) }
    end

    def profile_contains_example?(profile, example)
      profile_name = profile[:name]
      example_profile_id = example[:profile_id]

      # if either the profile name is nil or the profile in the given example
      # is nil, assume the profile doesn't contain the example and default
      # to creating a new profile. Otherwise, for profiles that have no
      # metadata, this may incorrectly match a profile that does not contain
      # this example, leading to Ruby exceptions.
      return false if profile_name.nil? || example_profile_id.nil?

      # The correct profile is one where the name of the profile, and the profile
      # name in the example match. Additionally, the list of controls in the
      # profile must contain the example in question (which we match by ID).
      #
      # While the profile name match is usually good enough, we must also match by
      # the control ID in the case where an InSpec runner has multiple profiles of
      # the same name (i.e. when Test Kitchen is running concurrently using a
      # single test suite that uses the Flat source reader, in which case InSpec
      # creates a fake profile with a name like "tests from /path/to/tests")
      profile_name == example_profile_id && profile[:controls].any? { |control| control[:id] == example[:id] }
    end

    def move_example_into_control(example, control)
      control[:results] ||= []
      example.delete(:id)
      example.delete(:profile_id)
      control[:results].push(example)

      # Waiver data, if available, is internally stored on a per-result
      # (that is, per-describe-block) basis, because that is the only granularity
      # available to us in the RSpec report data structure which we use as a vehicle.
      control[:waiver_data] ||= example[:waiver_data] || {}
    end
  end
end
