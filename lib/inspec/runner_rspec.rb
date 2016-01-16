# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'
require 'rspec/its'
require 'inspec/rspec_json_formatter'

module Inspec
  class RunnerRspec
    def initialize
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
