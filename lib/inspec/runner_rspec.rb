# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'
require 'rspec/its'
require 'inspec/rspec_json_formatter'

# There be dragons!! Or borgs, or something...
# This file and all its contents cannot be unit-tested. both test-suits
# collide and disable all unit tests that have been added.

module Inspec
  class RunnerRspec
    def initialize(conf)
      @conf = conf
      reset_tests
      configure_output
    end

    # Create a new RSpec example group from arguments and block.
    #
    # @param [Type] *args list of arguments for this example
    # @param [Type] &block the block associated with this example group
    # @return [RSpecExampleGroup]
    def example_group(*args, &block)
      RSpec::Core::ExampleGroup.describe(*args, &block)
    end

    # Add a full profile to the runner. Only pulls in metadata
    #
    # @param [Inspec::Profile] profile
    # @return [nil]
    def add_profile(profile)
      RSpec.configuration.formatters
           .find_all { |c| c.is_a? InspecRspecFormatter }
           .each do |fmt|
        fmt.add_profile(profile)
      end
    end

    # Add an example group to the list of registered tests.
    #
    # @param [RSpecExampleGroup] example test
    # @param [String] rule_id the ID associated with this check
    # @return [nil]
    def add_test(example, rule_id, rule)
      set_rspec_ids(example, rule_id, rule)
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
      with.run_specs(tests)
    end

    def report
      reporter = RSpec.configuration.formatters.find { |f| f.is_a? Inspec::RSpecReporter }
      reporter.output_hash
    end

    private

    # Empty the list of registered tests.
    #
    # @return [nil]
    def reset_tests
      @tests = RSpec::Core::World.new
      # resets "pending examples" in reporter
      RSpec.configuration.reset
    end

    # Configure the output formatter and stream to be used with RSpec.
    #
    # @return [nil]
    def configure_output
      if !@conf['output'] || @conf['output'] == '-'
        RSpec.configuration.output_stream = $stdout
      else
        RSpec.configuration.output_stream = @conf['output']
      end

      format = @conf['format'] || 'progress'
      format = 'InspecRspecFormatter' if format == 'fulljson'
      RSpec.configuration.add_formatter(format)
      RSpec.configuration.color = @conf['color']

      setup_reporting if @conf['report']
    end

    def setup_reporting
      RSpec.configuration.add_formatter(Inspec::RSpecReporter)
    end

    # Make sure that all RSpec example groups use the provided ID.
    # At the time of creation, we didn't yet have full ID support in RSpec,
    # which is why they were added to metadata directly. This is evaluated
    # by the InSpec adjusted json formatter (rspec_json_formatter).
    #
    # @param [RSpecExampleGroup] example object which contains a check
    # @param [Type] id describe id
    # @return [Type] description of returned object
    def set_rspec_ids(example, id, rule)
      example.metadata[:id] = id
      example.metadata[:impact] = rule.impact
      example.metadata[:title] = rule.title
      example.metadata[:desc] = rule.desc
      example.metadata[:code] = rule.instance_variable_get(:@__code)
      example.metadata[:source_location] = rule.instance_variable_get(:@__source_location)
      example.filtered_examples.each do |e|
        e.metadata[:id] = id
        e.metadata[:impact] = rule.impact
        e.metadata[:title] = rule.title
        e.metadata[:desc] = rule.desc
        e.metadata[:code] = rule.instance_variable_get(:@__code)
        e.metadata[:source_location] = rule.instance_variable_get(:@__source_location)
      end
      example.children.each do |child|
        set_rspec_ids(child, id, rule)
      end
    end
  end

  class RSpecReporter < RSpec::Core::Formatters::JsonFormatter
    RSpec::Core::Formatters.register Inspec::RSpecReporter

    def initialize(*)
      super(StringIO.new)
    end
  end
end
