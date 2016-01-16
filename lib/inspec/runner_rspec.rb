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

    def reset_tests
      @tests = RSpec::Core::World.new
      # resets "pending examples" in reporter
      RSpec.configuration.reset
    end

    def configure_output
      RSpec.configuration.add_formatter(@conf['format'] || 'progress')
    end

    def example_group(*args, &block)
      RSpec::Core::ExampleGroup.describe(*args, &block)
    end

    def add_test(example, rule_id)
      set_rspec_ids(example, rule_id)
      @tests.register(example)
    end

    def tests
      @tests.ordered_example_groups
    end

    def run(with = nil)
      with ||= RSpec::Core::Runner.new(nil)
      with.run_specs(@test_collector.tests)
    end

    private

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
