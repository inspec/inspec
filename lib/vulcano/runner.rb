# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'vulcano/backend'
require 'vulcano/profile_context'
require 'vulcano/targets'
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
      @conf = conf.dup
      @tests = RSpec::Core::World.new

      configure_output
      configure_transport
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

    def configure_transport
      @backend = Vulcano::Backend.create(@conf)
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
        register_rule(ctx, rule_id, rule)
      end
    end

    def run
      run_with(RSpec::Core::Runner.new(nil))
    end

    def run_with(rspec_runner)
      rspec_runner.run_specs(@tests.ordered_example_groups)
    end

    private

    def get_check_example(method_name, arg, block)
      if !arg.empty? &&
         arg[0].respond_to?(:resource_skipped) &&
         !arg[0].resource_skipped.nil?
        return RSpec::Core::ExampleGroup.describe(*arg) do
          it arg[0].resource_skipped
        end
      else
        # add the resource
        case method_name
        when 'describe'
          return RSpec::Core::ExampleGroup.describe(*arg, &block)
        when 'expect'
          return block.example_group
        else
          fail "A rule was registered with #{method_name.inspect}, "\
               "which isn't understood and cannot be processed."
        end
      end
      nil
    end

    def register_rule(ctx, rule_id, rule)
      checks = rule.instance_variable_get(:@checks)
      checks.each do |m, a, b|
        # resource skipping
        example = get_check_example(m, a, b)

        # TODO: Remove this!! It is very dangerous to do this here.
        # The goal of this is to make the audit DSL available to all
        # describe blocks. Right now, these blocks are executed outside
        # the scope of this run, thus not gaining ony of the DSL pieces.
        # To circumvent this, the full DSL is attached to the example's
        # scope.
        dsl = ctx.method(:create_inner_dsl).call(backend)
        example.send(:include, dsl)

        set_rspec_ids(example, rule_id)
        @tests.register(example)
      end
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
