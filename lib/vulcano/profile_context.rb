# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'vulcano/rule'
require 'vulcano/dsl'
require 'rspec/core/dsl'

module Vulcano
  class ProfileContext
    attr_reader :rules, :only_ifs
    def initialize(profile_id, backend, profile_registry = {}, only_ifs = [])
      if backend.nil?
        fail 'ProfileContext is initiated with a backend == nil. ' \
             'This is a backend error which must be fixed upstream.'
      end

      @profile_id = profile_id
      @rules = profile_registry
      @only_ifs = only_ifs

      dsl = create_inner_dsl(backend)
      outer_dsl = create_outer_dsl(dsl)
      ctx = create_context(outer_dsl)

      @profile_context = ctx.new
    end

    def load(content, source, line)
      @profile_context.instance_eval(content, source, line)
    end

    def unregister_rule(id)
      full_id = Vulcano::Rule.full_id(@profile_id, id)
      @rules[full_id] = nil
    end

    def register_rule(r)
      # get the full ID
      full_id = Vulcano::Rule.full_id(@profile_id, r)
      if full_id.nil?
        # TODO: error
        return
      end
      # add the rule to the registry
      existing = @rules[full_id]
      if existing.nil?
        @rules[full_id] = r
      else
        Vulcano::Rule.merge(existing, r)
      end
    end

    private

    # Creates the inner DSL which includes all resources for
    # creating tests. It is always connected to one target,
    # which is specified via the backend argument.
    #
    # @param backend [BackendRunner] exposing the target to resources
    # @return [InnerDSLModule]
    def create_inner_dsl(backend)
      Module.new do
        Vulcano::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(backend, id.to_s, *args)
          end
        end
      end
    end

    # Creates the outer DSL which includes all methods for creating
    # tests and control structures.
    #
    # @param dsl [InnerDSLModule] which contains all resources
    # @return [OuterDSLClass]
    def create_outer_dsl(dsl)
      rule_class = Class.new(Vulcano::Rule) do
        include RSpec::Core::DSL
        include dsl
      end

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new do
        include dsl

        define_method :rule do |*args, &block|
          id = args[0]
          opts = args[1] || {}
          return if @skip_profile
          __register_rule rule_class.new(id, opts, &block)
        end

        define_method :describe do |*args, &block|
          path = block.source_location[0]
          line = block.source_location[1]
          id = "#{File.basename(path)}:#{line}"
          rule = rule_class.new(id, {}) do
            describe(*args, &block)
          end
          __register_rule rule, &block
        end

        def skip_rule(id)
          __unregister_rule id
        end

        def only_if(&block)
          return unless block_given?
          @skip_profile = !block.call
        end
      end
      # rubocop:enable all
    end

    # Creates the heart of the profile context:
    # An instantiated object which has all resources registered to it
    # and exposes them to the a test file. The profile context serves as a
    # container for all profiles which are registered. Within the context
    # profiles get access to all DSL calls for creating tests and controls.
    #
    # @param outer_dsl [OuterDSLClass]
    # @return [ProfileContextClass]
    def create_context(outer_dsl)
      profile_context_owner = self

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new(outer_dsl) do
        include Vulcano::DSL

        define_method :__register_rule do |*args|
          profile_context_owner.register_rule(*args)
        end
        define_method :__unregister_rule do |*args|
          profile_context_owner.unregister_rule(*args)
        end

        def to_s
          'Profile Context Run'
        end
      end
      # rubocop:enable all
    end
  end
end
