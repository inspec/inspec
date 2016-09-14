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
  #
  # Inspec::Runner coordinates the running of tests and is the main
  # entry point to the application.
  #
  # Users are expected to insantiate a runner, add targets to be run,
  # and then call the run method:
  #
  # ```
  # r = Inspec::Runner.new()
  # r.add_target("/path/to/some/profile")
  # r.add_target("http://url/to/some/profile")
  # r.run
  # ```
  #
  class Runner # rubocop:disable Metrics/ClassLength
    extend Forwardable

    def_delegator :@test_collector, :report
    def_delegator :@test_collector, :reset

    attr_reader :backend, :rules, :attributes
    def initialize(conf = {})
      @rules = []
      @conf = conf.dup
      @conf[:logger] ||= Logger.new(nil)
      @target_profiles = []
      @controls = @conf[:controls] || []
      @ignore_supports = @conf[:ignore_supports]

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

    def configure_transport
      @backend = Inspec::Backend.create(@conf)
      @test_collector.backend = @backend
    end

    def run(with = nil)
      Inspec::Log.debug "Starting run with targets: #{@target_profiles.map(&:to_s)}"
      Inspec::Log.debug "Backend is #{@backend}"
      all_controls = []

      @target_profiles.each do |profile|
        @test_collector.add_profile(profile)
        profile.locked_dependencies
        profile.load_libraries
        @attributes |= profile.runner_context.attributes
        all_controls += profile.collect_tests
      end

      all_controls.each do |rule|
        register_rule(rule)
      end

      @test_collector.run(with)
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

    #
    # add_target allows the user to add a target whose tests will be
    # run when the user calls the run method.
    #
    # A target is a path or URL that points to a profile. Using this
    # target we generate a Profile and a ProfileContext. The content
    # (libraries, tests, and attributes) from the Profile are loaded
    # into the ProfileContext.
    #
    # If the profile depends on other profiles, those profiles will be
    # loaded on-demand when include_content or required_content are
    # called using similar code in Inspec::DSL.
    #
    # Once the we've loaded all of the tests files in the profile, we
    # query the profile for the full list of rules. Those rules are
    # registered with the @test_collector which is ultimately
    # responsible for actually running the tests.
    #
    # TODO: Deduplicate/clarify the loading code that exists in here,
    # the ProfileContext, the Profile, and Inspec::DSL
    #
    # @params target [String] A path or URL to a profile or raw test.
    # @params _opts [Hash] Unused, but still here to avoid breaking kitchen-inspec
    #
    # @eturns [Inspec::ProfileContext]
    #
    def add_target(target, _opts = [])
      profile = Inspec::Profile.for_target(target,
                                           backend: @backend,
                                           controls: @controls,
                                           attributes: @conf[:attributes])
      fail "Could not resolve #{target} to valid input." if profile.nil?
      @target_profiles << profile if supports_profile?(profile)
    end

    #
    # This is used by inspec-shell and inspec-detect. This should
    # probably be cleaned up a bit.
    #
    # @params [Hash] Options
    # @returns [Inspec::ProfileContext]
    #
    def create_context(options = {})
      meta = options[:metadata]
      profile_id = nil
      profile_id = meta.params[:name] unless meta.nil?
      Inspec::ProfileContext.new(profile_id, @backend, @conf.merge(options))
    end

    def supports_profile?(profile)
      return true if profile.metadata.nil? || @ignore_supports

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

    # In some places we read the rules off of the runner, in other
    # places we read it off of the profile context. To keep the API's
    # the same, we provide an #all_rules method here as well.
    def all_rules
      @rules
    end

    def register_rules(ctx)
      new_tests = false
      ctx.rules.each do |rule_id, rule|
        next if block_given? && !(yield rule_id, rule)
        new_tests = true
        register_rule(rule)
      end
      new_tests
    end

    private

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

    def register_rule(rule)
      Inspec::Log.debug "Registering rule #{rule}"
      @rules << rule
      checks = ::Inspec::Rule.prepare_checks(rule)
      examples = checks.flat_map do |m, a, b|
        get_check_example(m, a, b)
      end.compact

      examples.each { |e| @test_collector.add_test(e, rule) }
    end
  end
end
