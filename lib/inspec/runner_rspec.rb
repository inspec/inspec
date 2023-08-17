require "rspec/core"
require "rspec/its"
require "inspec/formatters"
require "matchers/matchers"
require "inspec/rspec_extensions"

# There be dragons!! Or borgs, or something...
# This file and all its contents cannot be unit-tested. both test-suites
# collide and disable all unit tests that have been added.

module Inspec
  class RunnerRspec
    attr_accessor :formatter

    def initialize(conf)
      @conf = conf
      @formatter = nil
      reset
    end

    # Create a new RSpec example group from arguments and block.
    #
    # @param [Type] *args list of arguments for this example
    # @param [Type] &block the block associated with this example group
    # @return [RSpecExampleGroup]
    def example_group(*args, &block)
      # NOTE: this RUNS immediately
      RSpec::Core::ExampleGroup.describe(*args, &block)
    end

    def formatters
      RSpec.configuration.formatters.grep(Inspec::Formatters::Base)
    end

    # Add a full profile to the runner. Only pulls in metadata
    #
    # @param [Inspec::Profile] profile
    # @return [nil]
    def add_profile(profile)
      formatters.each do |fmt|
        fmt.add_profile(profile)
      end
    end

    # These control count related methods are called from load logic of runner library of inspec
    ######### Start of control count related methods
    def set_controls_count(controls_count)
      formatters.each do |fmt|
        fmt.set_controls_count(controls_count)
      end
    end

    def set_control_checks_count_map(mapping)
      formatters.each do |fmt|
        fmt.set_control_checks_count_map(mapping)
      end
    end
    ######### end of control count related methods

    def backend
      formatters.first.backend
    end

    # Configure the backend of the runner.
    #
    # @param [Inspec::Backend] backend
    # @return [nil]
    def backend=(backend)
      formatters.each do |fmt|
        fmt.backend = backend
      end
    end

    # Add an example group to the list of registered tests.
    #
    # @param [RSpecExampleGroup] example test
    # @param [String] rule_id the ID associated with this check
    # @return [nil]
    def add_test(example, rule)
      set_rspec_ids(example, rule)
      @tests.example_groups.push(example)
    end

    # Retrieve the list of tests that have been added.
    #
    # @return [Array] full list of tests
    def tests
      @tests.ordered_example_groups
    end

    # Run all registered tests with an optional test runner.
    #
    # @param [RSpecRunner] with is an optional RSpecRunner
    # @return [int] 0 if all went well; otherwise nonzero
    def run(with = nil)
      with ||= RSpec::Core::Runner.new(nil)
      @rspec_exit_code = with.run_specs(tests)
      @formatter.results
    end

    # Return a proper exit code to the runner
    #
    # @return [int] exit code
    def exit_code
      return @rspec_exit_code if @formatter.results.empty?

      stats = @formatter.results[:statistics][:controls]
      load_failures = @formatter.results[:profiles]&.select { |p| p[:status] == "failed" }&.any?
      skipped = @formatter.results.dig(:profiles, 0, :status) == "skipped"
      if stats[:failed][:total] == 0 && stats[:skipped][:total] == 0 && !skipped && !load_failures && (stats[:error] && stats[:error][:total] == 0) # placed error count condition because of enhanced outcomes
        0
      elsif load_failures
        @conf["distinct_exit"] ? 102 : 1
      elsif stats[:failed][:total] > 0 || (stats[:error] && stats[:error][:total] > 0)
        @conf["distinct_exit"] ? 100 : 1
      elsif stats[:skipped][:total] > 0 || skipped
        @conf["distinct_exit"] ? 101 : 0
      else
        @rspec_exit_code
      end
    end

    # Empty the list of registered tests.
    #
    # @return [nil]
    def reset
      @tests = RSpec::Core::World.new
      # resets "pending examples" in reporter
      RSpec.configuration.reset
      configure_output
    end

    private

    # Set optional formatters and output
    #
    #
    def set_optional_formatters
      return if @conf["reporter"].nil?

      # This is a slightly modified version of the default RSpec JSON formatter
      # No one in their right mind should be using this because we have a much better JSON reporter - named "json"
      if @conf["reporter"].key?("json-rspec")
        # We cannot pass in a nil output path. Rspec only accepts a valid string or a IO object.
        if @conf["reporter"]["json-rspec"]&.[]("file").nil?
          RSpec.configuration.add_formatter(Inspec::Formatters::RspecJson)
        else
          RSpec.configuration.add_formatter(Inspec::Formatters::RspecJson, @conf["reporter"]["json-rspec"]["file"])
        end
        @conf["reporter"].delete("json-rspec")
      end

      # These are built-in to rspec
      formats = @conf["reporter"].select { |k, _v| %w{documentation progress html}.include?(k) }
      formats.each do |k, v|
        # We cannot pass in a nil output path. Rspec only accepts a valid string or a IO object.
        if v&.[]("file").nil?
          RSpec.configuration.add_formatter(k.to_sym)
        else
          RSpec.configuration.add_formatter(k.to_sym, v["file"])
        end
        @conf["reporter"].delete(k)
      end

      # Here we need to look for reporter names in the reporter option that
      # are names of streaming reporter plugins. We load them, then tell RSpec to add them as formatters.
      # They will have already been detected at this point (see v2_loader.load_all in cli.rb)
      # but they will not be activated activated at this point.
      # then list all plugins by type by name
      reg = Inspec::Plugin::V2::Registry.instance
      streaming_reporters = reg\
        .find_activators(plugin_type: :streaming_reporter)\
        .map(&:activator_name).map(&:to_s)

      @conf["reporter"].each do |streaming_reporter_name, file_target|
        # It could be a non-streaming reporter
        next unless streaming_reporters.include? streaming_reporter_name

        # Activate the plugin so the formatter ID gets registered with RSpec, presumably

        Inspec.with_feature("inspec-reporter-#{streaming_reporter_name}") {
          activator = reg.find_activator(plugin_type: :streaming_reporter, activator_name: streaming_reporter_name.to_sym)
          activator.activate!
          # We cannot pass in a nil output path. Rspec only accepts a valid string or a IO object.
          if file_target&.[]("file").nil?
            RSpec.configuration.add_formatter(activator.implementation_class)
          else
            RSpec.configuration.add_formatter(activator.implementation_class, file_target["file"])
          end
          @conf["reporter"].delete(streaming_reporter_name)
        }
      end
    end

    # Configure the output formatter and stream to be used with RSpec.
    #
    # @return [nil]
    def configure_output
      RSpec.configuration.output_stream = $stdout
      @formatter = RSpec.configuration.add_formatter(Inspec::Formatters::Base)

      @formatter.enhanced_outcomes = @conf.final_options["enhanced_outcomes"]
      RSpec.configuration.add_formatter(Inspec::Formatters::ShowProgress, $stderr) if @conf[:show_progress]
      set_optional_formatters
      RSpec.configuration.color = @conf["color"]
    end

    # Make sure that all RSpec example groups use the provided ID.
    # At the time of creation, we didn't yet have full ID support in RSpec,
    # which is why they were added to metadata directly. This is evaluated
    # by the InSpec adjusted json formatter (rspec_json_formatter).
    #
    # @param [RSpecExampleGroup] example object which contains a check
    # @return [Type] description of returned object
    def set_rspec_ids(example, rule)
      assign_rspec_ids(example.metadata, rule)
      example.filtered_examples.each do |e|
        assign_rspec_ids(e.metadata, rule)
      end
      example.children.each do |child|
        set_rspec_ids(child, rule)
      end
    end

    def assign_rspec_ids(metadata, rule)
      metadata[:id] = ::Inspec::Rule.rule_id(rule)
      metadata[:profile_id] = ::Inspec::Rule.profile_id(rule)
      metadata[:impact] = rule.impact
      metadata[:title] = rule.title
      metadata[:descriptions] = rule.descriptions
      metadata[:code] = rule.instance_variable_get(:@__code)
      metadata[:source_location] = rule.instance_variable_get(:@__source_location)
      metadata[:waiver_data] = rule.__waiver_data
    end
  end
end
