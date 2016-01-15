# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/rule'
require 'inspec/dsl'
require 'rspec/core/dsl'
require 'securerandom'

module Inspec
  class ProfileContext # rubocop:disable Metrics/ClassLength
    attr_reader :rules, :only_ifs
    def initialize(profile_id, backend, profile_registry = {}, only_ifs = [])
      if backend.nil?
        fail 'ProfileContext is initiated with a backend == nil. ' \
             'This is a backend error which must be fixed upstream.'
      end

      @profile_id = profile_id
      @rules = profile_registry
      @only_ifs = only_ifs
      @backend = backend

      reload_dsl
    end

    def reload_dsl
      dsl = create_inner_dsl(@backend)
      outer_dsl = create_outer_dsl(dsl)
      ctx = create_context(outer_dsl)
      @profile_context = ctx.new
    end

    def load(content, source = nil, line = nil)
      @current_load = { file: source }
      @profile_context.instance_eval(content, source || 'unknown', line || 1)
    end

    def unregister_rule(id)
      full_id = Inspec::Rule.full_id(@profile_id, id)
      @rules[full_id] = nil
    end

    def register_rule(r)
      # get the full ID
      r.instance_variable_set(:@__file, @current_load[:file])
      r.instance_variable_set(:@__group_title, @current_load[:title])
      full_id = Inspec::Rule.full_id(@profile_id, r)
      if full_id.nil?
        # TODO: error
        return
      end

      # add the rule to the registry
      existing = @rules[full_id]
      if existing.nil?
        @rules[full_id] = r
      else
        Inspec::Rule.merge(existing, r)
      end
    end

    def set_header(field, val)
      @current_load[field] = val
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
        Inspec::Resource.registry.each do |id, r|
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
      rule_class = Class.new(Inspec::Rule) do
        include RSpec::Core::DSL
        include dsl
      end

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new do
        include dsl

        define_method :control do |*args, &block|
          id = args[0]
          opts = args[1] || {}

          # Skip the control if the resource triggered a skip;
          # However: when this is run on a mock backend, do not skip it.
          # This is e.g. relevant for JSON generation, where we need all
          # controls.
          return if @skip_profile && os[:family] != 'unknown'

          __register_rule rule_class.new(id, opts, &block)
        end

        alias_method :rule, :control

        define_method :describe do |*args, &block|
          path = block.source_location[0]
          line = block.source_location[1]
          id = "(generated from #{File.basename(path)}:#{line} #{SecureRandom.hex})"
          rule = rule_class.new(id, {}) do
            describe(*args, &block)
          end
          __register_rule rule, &block
        end

        # TODO: mock method for attributes; import attribute handling
        define_method :attributes do |_name, _options|
          nil
        end

        def skip_control(id)
          __unregister_rule id
        end

        alias_method :skip_rule, :skip_control

        def only_if
          return unless block_given?
          @skip_profile = !yield
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
        include Inspec::DSL

        define_method :title do |arg|
          profile_context_owner.set_header(:title, arg)
        end

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
