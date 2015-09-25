# encoding: utf-8
require 'vulcano/backend'
require 'vulcano/rule'
require 'vulcano/dsl'

module Vulcano
  class ProfileContext
    attr_reader :rules, :only_ifs
    def initialize(profile_id, backend, profile_registry: {}, only_ifs: [])
      if backend.nil?
        fail 'ProfileContext is initiated with a backend == nil. ' \
              'This is a backend error which must be fixed upstream.'
      end

      @profile_id = profile_id
      @rules = profile_registry
      @only_ifs = only_ifs
      profile_context_owner = self

      dsl = Module.new do
        Vulcano::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(backend, *args)
          end
        end
      end

      rule_class = Class.new(Vulcano::Rule) do
        include RSpec::Core::DSL
        include dsl
      end

      outer_dsl = Class.new do
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

      # This is the heart of the profile context
      # An instantiated object which has all resources registered to it
      # and exposes them to the a test file.
      # rubocop:disable Lint/NestedMethodDefinition
      ctx = Class.new(outer_dsl) do
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
  end
end
