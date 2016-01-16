# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/rule'
require 'inspec/dsl'
require 'securerandom'

module Inspec
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
      @backend = backend

      reload_dsl
    end

    def reload_dsl
      resources_dsl = Inspec::Resource.create_dsl(@backend)
      ctx = create_context(resources_dsl, rule_context(resources_dsl))
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

    # Create the context for controls. This includes all components of the DSL,
    # including matchers and resources.
    #
    # @param [ResourcesDSL] resources_dsl which has all resources to attach
    # @return [RuleContext] the inner context of rules
    def rule_context(resources_dsl)
      require 'rspec/core/dsl'
      Class.new(Inspec::Rule) do
        include RSpec::Core::DSL
        include resources_dsl
      end
    end

    # Creates the heart of the profile context:
    # An instantiated object which has all resources registered to it
    # and exposes them to the a test file. The profile context serves as a
    # container for all profiles which are registered. Within the context
    # profiles get access to all DSL calls for creating tests and controls.
    #
    # @param outer_dsl [OuterDSLClass]
    # @return [ProfileContextClass]
    def create_context(resources_dsl, rule_class)
      profile_context_owner = self

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new do
        include Inspec::DSL
        include resources_dsl

        define_method :title do |arg|
          profile_context_owner.set_header(:title, arg)
        end

        def to_s
          'Profile Context Run'
        end

        define_method :control do |*args, &block|
          id = args[0]
          opts = args[1] || {}

          # Skip the control if the resource triggered a skip;
          # However: when this is run on a mock backend, do not skip it.
          # This is e.g. relevant for JSON generation, where we need all
          # controls.
          return if @skip_profile && os[:family] != 'unknown'

          profile_context_owner.register_rule(rule_class.new(id, opts, &block))
        end

        alias_method :rule, :control

        define_method :describe do |*args, &block|
          path = block.source_location[0]
          line = block.source_location[1]
          id = "(generated from #{File.basename(path)}:#{line} #{SecureRandom.hex})"
          rule = rule_class.new(id, {}) do
            describe(*args, &block)
          end
          profile_context_owner.register_rule(rule, &block)
        end

        # TODO: mock method for attributes; import attribute handling
        define_method :attributes do |_name, _options|
          nil
        end

        def skip_control(id)
          profile_context_owner.unregister_rule(id)
        end

        alias_method :skip_rule, :skip_control

        def only_if
          return unless block_given?
          @skip_profile = !yield
        end
      end
      # rubocop:enable all
    end
  end
end
