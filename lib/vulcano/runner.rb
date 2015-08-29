# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'uri'
require 'vulcano/backend'
require 'vulcano/targets'
require 'vulcano/profile_context'
# spec requirements
require 'rspec'
require 'rspec/its'
require 'specinfra'
require 'specinfra/helper'
require 'specinfra/helper/set'
require 'serverspec/helper'
require 'serverspec/matcher'
require 'serverspec/subject'
require 'vulcano/rspec_json_formatter'

module Vulcano

  class Runner

    def initialize(profile_id, conf)
      @rules = []
      @profile_id = profile_id
      @conf = Vulcano::Backend.target_config(conf)

      # RSpec.configuration.output_stream = $stdout
      # RSpec.configuration.error_stream = $stderr
      RSpec.configuration.add_formatter(:json)

      # specinfra
      backend_name = @conf[:backend] || 'exec'
      backend_class = Vulcano::Backend.registry[backend_name]
      if backend_class.nil?
        puts "Can't find command backend '#{backend_name}'."
        return
      end

      # create the backend based on the config
      @backend = backend_class.new(@conf.dup)
    end

    def select_backend( conf )

    end

    def add_tests(tests)
      items = tests.map do |test|
        Vulcano::Targets.resolve(test)
      end
      items.flatten.each do |item|
        add_content(item[:content], item[:ref], item[:line])
      end
    end

    def add_content(content, source, line = nil)
      ctx = Vulcano::ProfileContext.new(@profile_id, @backend)

      # evaluate all tests
      ctx.load(content, source, line || 1)

      # process the resulting rules
      ctx.rules.each do |rule_id, rule|
        #::Vulcano::DSL.execute_rule(rule, profile_id)
        checks = rule.instance_variable_get(:@checks)
        checks.each do |m,a,b|
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
          RSpec.world.register(example)
        end
      end
    end

    def run
      rspec_runner = RSpec::Core::Runner.new(nil)
      rspec_runner.run_specs(RSpec.world.ordered_example_groups)
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
