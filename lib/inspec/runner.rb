# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'
require 'uri'
require 'inspec/backend'
require 'inspec/profile_context'
require 'inspec/profile'
require 'inspec/metadata'
# spec requirements

module Inspec
  class Runner # rubocop:disable Metrics/ClassLength
    extend Forwardable
    attr_reader :backend, :rules
    def initialize(conf = {})
      @rules = {}
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

    def add_target(target, options = {})
      profile = Inspec::Profile.for_target(target, options)
      fail "Could not resolve #{target} to valid input." if profile.nil?
      add_profile(profile, options)
    end

    def supports_profile?(profile)
      return true if profile.metadata.nil?

      if !profile.metadata.supports_runtime?
        fail 'This profile requires InSpec version '\
             "#{profile.metadata.inspec_requirement}. You are running "\
             "InSpec v#{Inspec::VERSION}.\n"
      end

      if !profile.metadata.supports_transport?(@backend)
        os_info = @backend.os[:family].to_s
        fail "This OS/platform (#{os_info}) is not supported by this profile."
      end

      true
    end

    def add_profile(profile, options = {})
      return if !options[:ignore_supports] && !supports_profile?(profile)

      @test_collector.add_profile(profile)
      options[:metadata] = profile.metadata

      libs = profile.libraries.map do |k, v|
        { ref: k, content: v }
      end

      tests = profile.tests.map do |ref, content|
        r = profile.source_reader.target.abs_path(ref)
        { ref: r, content: content }
      end

      add_content(tests, libs, options)
    end

    def create_context(options = {})
      meta = options['metadata']
      profile_id = nil
      profile_id = meta.params[:name] unless meta.nil?
      Inspec::ProfileContext.new(profile_id, @backend, @conf.merge(options))
    end

    def add_content(tests, libs, options = {})
      return if tests.nil? || tests.empty?

      # load all libraries
      ctx = create_context(options)
      libs.each do |lib|
        ctx.load(lib[:content].to_s, lib[:ref], lib[:line] || 1)
        ctx.reload_dsl
      end

      # evaluate the test content
      tests = [tests] unless tests.is_a? Array
      tests.each { |t| add_test_to_context(t, ctx) }

      # process the resulting rules
      filter_controls(ctx.rules, options[:controls]).each do |rule_id, rule|
        register_rule(rule_id, rule)
      end
    end

    def_delegator :@test_collector, :run
    def_delegator :@test_collector, :report

    private

    def add_test_to_context(test, ctx)
      content = test[:content]
      return if content.nil? || content.empty?
      ctx.load(content, test[:ref], test[:line])
    end

    def filter_controls(controls_map, include_list)
      return controls_map if include_list.nil? || include_list.empty?
      controls_map.select { |k, _| include_list.include?(k) }
    end

    def block_source_info(block)
      return {} if block.nil? || !block.respond_to?(:source_location)
      opts = {}
      file_path, line = block.source_location
      opts['file_path'] = file_path
      opts['line_number'] = line
      opts
    end

    def get_check_example(method_name, arg, block)
      opts = block_source_info(block)

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
        when 'describe.one'
          tests = arg.map do |x|
            @test_collector.example_group(x[1][0], block_source_info(x[2]), &x[2])
          end
          return nil if tests.empty?
          ok_tests = tests.find_all(&:run)
          # return all tests if none succeeds; we will just report full failure
          return tests if ok_tests.empty?
          # otherwise return all working tests
          return ok_tests
        else
          fail "A rule was registered with #{method_name.inspect}, "\
               "which isn't understood and cannot be processed."
        end
      end
      nil
    end

    def register_rule(rule_id, rule)
      @rules[rule_id] = rule
      checks = ::Inspec::Rule.prepare_checks(rule)
      examples = checks.map do |m, a, b|
        get_check_example(m, a, b)
      end.flatten.compact

      examples.each do |example|
        # TODO: Remove this!! It is very dangerous to do this here.
        # The goal of this is to make the audit DSL available to all
        # describe blocks. Right now, these blocks are executed outside
        # the scope of this run, thus not gaining ony of the DSL pieces.
        # To circumvent this, the full DSL is attached to the example's
        # scope.
        dsl = Inspec::Resource.create_dsl(backend)
        example.send(:include, dsl)
        @test_collector.add_test(example, rule_id, rule)
      end
    end
  end
end
