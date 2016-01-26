# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'
require 'rspec/its'
require 'inspec/rspec_json_formatter'

# There be dragons!! Or borgs, or something...
# This file and all its contents cannot yet be tested. Once it is included
# in our unit test suite, it deactivates all other checks completely.
# To circumvent this, we need functional tests which tackle the RSpec runner
# or a separate suite of unit tests to which get along with this.

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

    # Add an example group to the list of registered tests.
    #
    # @param [RSpecExampleGroup] example test
    # @param [String] rule_id the ID associated with this check
    # @return [nil]
    def add_test(example, rule_id)
      set_rspec_ids(example, rule_id)
      @tests.register(example)
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
      # FIXME(sr): formatters.first?! really?
      # there should be only ONE, but this should still be fixed
      RSpec.configuration.formatters.first.output_hash
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
      RSpec.configuration.add_formatter(@conf['format'] || 'progress')
    end

    # Make sure that all RSpec example groups use the provided ID.
    # At the time of creation, we didn't yet have full ID support in RSpec,
    # which is why they were added to metadata directly. This is evaluated
    # by the InSpec adjusted json formatter (rspec_json_formatter).
    #
    # @param [RSpecExampleGroup] example object which contains a check
    # @param [Type] id describe id
    # @return [Type] description of returned object
    def set_rspec_ids(example, id)
      example.metadata[:id] = id
      example.filtered_examples.each do |e|
        e.metadata[:id] = id
      end
      example.children.each do |child|
        set_rspec_ids(child, id)
      end
    end
  end
end
