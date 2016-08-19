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
require 'inspec/secrets'
# spec requirements

module Inspec
  class Runner # rubocop:disable Metrics/ClassLength
    extend Forwardable
    attr_reader :backend, :rules, :attributes
    def initialize(conf = {})
      @rules = {}
      @conf = conf.dup
      @conf[:logger] ||= Logger.new(nil)

      @test_collector = @conf.delete(:test_collector) || begin
        require 'inspec/runner_rspec'
        RunnerRspec.new(@conf)
      end

      # list of profile attributes
      @attributes = []

      load_attributes(@conf)
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
      @test_collector.backend = @backend
    end

    # determine all attributes before the execution, fetch data from secrets backend
    def load_attributes(options)
      attributes = {}
      # read endpoints for secrets eg. yml file
      secrets_targets = options['attrs']
      unless secrets_targets.nil?
        secrets_targets.each do |target|
          secrets = Inspec::SecretsBackend.resolve(target)
          # merge hash values
          attributes = attributes.merge(secrets.attributes) unless secrets.nil? || secrets.attributes.nil?
        end
      end
      options['attributes'] = attributes
    end

    # Returns the profile context used the profile at this target.
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
        os_info = @backend.os[:name].to_s
        fail "This OS/platform (#{os_info}) is not supported by this profile."
      end

      true
    end

    # Returns the profile context used to initialize this profile.
    def add_profile(profile, options = {})
      return if !options[:ignore_supports] && !supports_profile?(profile)

      @test_collector.add_profile(profile)
      options[:metadata] = profile.metadata
      options[:profile] = profile

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
      meta = options[:metadata]
      profile_id = nil
      profile_id = meta.params[:name] unless meta.nil?
      Inspec::ProfileContext.new(profile_id, @backend, @conf.merge(options))
    end

    # Returns the profile context used to evaluate the given content.
    # Calling this method again will use a different context each time.
    def add_content(tests, libs, options = {})
      return if tests.nil? || tests.empty?

      # load all libraries
      ctx = create_context(options)
      ctx.load_libraries(libs.map { |x| [x[:content], x[:ref], x[:line]] })

      # hand the context to the profile for further evaluation
      unless (profile = options[:profile]).nil?
        profile.runner_context = ctx
      end

      append_content(ctx, tests, libs, options)
    end

    # Returns the profile context used to evaluate the given content.
    def append_content(ctx, tests, _libs, options = {})
      # evaluate the test content
      tests = [tests] unless tests.is_a? Array
      tests.each { |t| add_test_to_context(t, ctx) }

      # merge and collect all attributes
      @attributes |= ctx.attributes

      # process the resulting rules
      filter_controls(ctx.rules, options[:controls]).each do |rule_id, rule|
        register_rule(rule_id, rule)
      end

      ctx
    end

    def_delegator :@test_collector, :run
    def_delegator :@test_collector, :report
    def_delegator :@test_collector, :reset

    private

    def add_test_to_context(test, ctx)
      content = test[:content]
      return if content.nil? || content.empty?
      ctx.load(content, test[:ref], test[:line])
    end

    def filter_controls(controls_map, include_list)
      return controls_map if include_list.nil? || include_list.empty?
      controls_map.select do |_, c|
        id = ::Inspec::Rule.rule_id(c)
        include_list.include?(id)
      end
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
        @test_collector.add_test(example, rule)
      end
    end
  end
end
