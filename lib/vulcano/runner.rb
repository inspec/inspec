# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'vulcano/backend'
require 'vulcano/targets'
require 'vulcano/profile_context'
# spec requirements
require 'rspec'
require 'rspec/its'
require 'vulcano/rspec_json_formatter'

module Vulcano
  class Runner
    attr_reader :tests, :backend
    def initialize(conf = {})
      @rules = []
      @profile_id = conf[:id]
      @conf = Vulcano::Backend.target_config(normalize_map(conf))
      @tests = RSpec::Core::World.new

      configure_output
      configure_backend
    end

    def normalize_map(hm)
      res = {}
      hm.each {|k, v|
        res[k.to_s] = v
      }
      res
    end

    def configure_output
      RSpec.configuration.add_formatter(@conf['format'] || 'progress')
    end

    def configure_backend
      backend_name = (@conf['backend'] ||= 'local')
      bname, next_backend = backend_name.split('+')
      @conf['backend'] = next_backend if bname == 'specinfra'

      # @TODO all backends except for mock revert to specinfra for now
      @backend = Vulcano::Backend.create(bname, @conf)

      # Return on failure
      if @backend.nil?
        fail "Can't find command backend '#{backend_name}'."
      end
      @backend
    end

    def add_tests(tests)
      # retrieve the raw ruby code of all tests
      items = tests.map do |test|
        Vulcano::Targets.resolve(test)
      end

      # add all tests (raw) to the runtime
      items.flatten.each do |item|
        add_content(item[:content], item[:ref], item[:line])
      end
    end

    def create_context
      Vulcano::ProfileContext.new(@profile_id, @backend)
    end

    def add_content(content, source, line = nil)
      # evaluate all tests
      ctx = create_context
      ctx.load(content, source, line || 1)

      # process the resulting rules
      ctx.rules.each do |rule_id, rule|
        #::Vulcano::DSL.execute_rule(rule, profile_id)
        checks = rule.instance_variable_get(:@checks)
        checks.each do |_, a, b|
          # resource skipping
          if !a.empty? &&
             a[0].respond_to?(:resource_skipped) &&
             !a[0].resource_skipped.nil?
            example = RSpec::Core::ExampleGroup.describe(*a) do
              it a[0].resource_skipped
            end
          else
            # add the resource
            example = RSpec::Core::ExampleGroup.describe(*a, &b)
          end

          set_rspec_ids(example, rule_id)
          @tests.register(example)
        end
      end
    end

    def run
      run_with(RSpec::Core::Runner.new(nil))
    end

    def run_with(rspec_runner)
      rspec_runner.run_specs(@tests.ordered_example_groups)
    end

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
