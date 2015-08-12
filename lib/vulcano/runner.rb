# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

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
    def initialize(profile_id)
      @rules = []
      @profile_id = profile_id
      # RSpec.configuration.output_stream = $stdout
      # RSpec.configuration.error_stream = $stderr
      RSpec.configuration.add_formatter(:json)

      # specinfra
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)
      Specinfra.configuration.backend = :exec
      Specinfra.configuration.os = nil
    end

    def add_file(path)
      ctx = Vulcano::ProfileContext.new(@profile_id, {}, [])

      # read the test file
      apath = File::expand_path(path)
      raw = File::read(apath)

      # evaluate all tests
      ctx.instance_eval(raw, apath, 0)

      # process the resulting rules
      rules = ctx.instance_variable_get(:@rules)
      rules.each do |rule_id, rule|
        #::Vulcano::DSL.execute_rule(rule, profile_id)
        checks = rule.instance_variable_get(:@checks)
        checks.each do |m,a,b|
          example = RSpec::Core::ExampleGroup.describe(*a, &b)
          set_rspec_ids(example, rule_id)
          RSpec.world.register(example)
        end
      end

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
