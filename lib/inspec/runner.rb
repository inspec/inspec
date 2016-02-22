# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'
require 'uri'
require 'inspec/backend'
require 'inspec/profile_context'
require 'inspec/metadata'
# spec requirements

module Inspec
  class Runner # rubocop:disable Metrics/ClassLength
    extend Forwardable
    attr_reader :backend, :rules
    def initialize(conf = {})
      @rules = {}
      @profile_id = conf[:id]
      @conf = conf.dup
      @conf[:logger] ||= Logger.new(nil)

      @test_collector = @conf.delete(:test_collector) || begin
        require 'inspec/runner_rspec'
        RunnerRspec.new(@conf)
      end

      configure_transport
    end

    def tests
      @test_collector.tests
    end

    def normalize_map(hm)
      res = {}
      hm.each {|k, v|
        res[k.to_s] = v
      }
      res
    end

    def configure_transport
      @backend = Inspec::Backend.create(@conf)
    end

    def add_profile(profile, options = {})
      return unless options[:ignore_supports] ||
                    profile.metadata.supports_transport?(@backend)

      libs = profile.libraries.map do |k, v|
        { ref: k, content: v }
      end

      profile.tests.each do |ref, content|
        r = profile.source_reader.target.abs_path(ref)
        test = { ref: r, content: content }
        add_content(test, libs)
      end
    end

    def create_context
      Inspec::ProfileContext.new(@profile_id, @backend)
    end

    def add_content(test, libs)
      content = test[:content]
      return if content.nil? || content.empty?

      # load all libraries
      ctx = create_context
      libs.each do |lib|
        ctx.load(lib[:content].to_s, lib[:ref], lib[:line] || 1)
        ctx.reload_dsl
      end

      # evaluate the test content
      ctx.load(content, test[:ref], test[:line] || 1)

      # process the resulting rules
      ctx.rules.each do |rule_id, rule|
        register_rule(rule_id, rule)
      end
    end

    def_delegator :@test_collector, :run
    def_delegator :@test_collector, :report

    private

    def get_check_example(method_name, arg, block)
      opts = {}
      if !block.nil? && block.respond_to?(:source_location)
        file_path, line = block.source_location
        opts['file_path'] = file_path
        opts['line_number'] = line
      end

      if !arg.empty? &&
         arg[0].respond_to?(:resource_skipped) &&
         !arg[0].resource_skipped.nil?
        return @test_collector.example_group(*arg, opts) do
          it arg[0].resource_skipped
        end
      else
        # add the resource
        case method_name
        when 'describe'
          return @test_collector.example_group(*arg, opts, &block)
        when 'expect'
          return block.example_group
        else
          fail "A rule was registered with #{method_name.inspect}, "\
               "which isn't understood and cannot be processed."
        end
      end
      nil
    end

    def register_rule(rule_id, rule)
      @rules[rule_id] = rule
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
        dsl = Inspec::Resource.create_dsl(backend)
        example.send(:include, dsl)

        @test_collector.add_test(example, rule_id)
      end
    end
  end
end
