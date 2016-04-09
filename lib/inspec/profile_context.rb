# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/rule'
require 'inspec/dsl'
require 'securerandom'

module Inspec
  class ProfileContext # rubocop:disable Metrics/ClassLength
    attr_reader :rules
    def initialize(profile_id, backend, conf)
      if backend.nil?
        fail 'ProfileContext is initiated with a backend == nil. ' \
             'This is a backend error which must be fixed upstream.'
      end

      @profile_id = profile_id
      @backend = backend
      @conf = conf.dup
      @rules = {}

      reload_dsl
    end

    def reload_dsl
      resources_dsl = Inspec::Resource.create_dsl(@backend)
      ctx = create_context(resources_dsl, rule_context(resources_dsl))
      @profile_context = ctx.new(@backend, @conf)
    end

    def load(content, source = nil, line = nil)
      @current_load = { file: source }
      if content.is_a? Proc
        @profile_context.instance_eval(&content)
      elsif source.nil? && line.nil?
        @profile_context.instance_eval(content)
      else
        @profile_context.instance_eval(content, source || 'unknown', line || 1)
      end
    end

    def unregister_rule(id)
      @rules.delete(full_id(@profile_id, id))
    end

    def register_rule(r)
      # get the full ID
      r.instance_variable_set(:@__file, @current_load[:file])
      r.instance_variable_set(:@__group_title, @current_load[:title])

      # add the rule to the registry
      fid = full_id(Inspec::Rule.profile_id(r), Inspec::Rule.rule_id(r))
      existing = @rules[fid]
      if existing.nil?
        @rules[fid] = r
      else
        Inspec::Rule.merge(existing, r)
      end
    end

    def set_header(field, val)
      @current_load[field] = val
    end

    private

    def full_id(pid, rid)
      return rid.to_s if pid.to_s.empty?
      pid.to_s + '/' + rid.to_s
    end

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
    def create_context(resources_dsl, rule_class) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      profile_context_owner = self
      profile_id = @profile_id

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new do
        include Inspec::DSL
        include resources_dsl

        def initialize(backend, conf) # rubocop:disable Lint/NestedMethodDefinition, Lint/DuplicateMethods
          @backend = backend
          @conf = conf
          @skip_profile = false
        end

        define_method :title do |arg|
          profile_context_owner.set_header(:title, arg)
        end

        def to_s
          'Profile Context Run'
        end

        define_method :control do |*args, &block|
          id = args[0]
          opts = args[1] || {}
          register_control(rule_class.new(id, profile_id, opts, &block))
        end

        define_method :describe do |*args, &block|
          loc = block_location(block, caller[0])
          id = "(generated from #{loc} #{SecureRandom.hex})"

          res = nil
          rule = rule_class.new(id, profile_id, {}) do
            res = describe(*args, &block)
          end
          register_control(rule, &block)
          res
        end

        define_method :register_control do |control, &block|
          ::Inspec::Rule.set_skip_rule(control, true) if @skip_profile

          profile_context_owner.register_rule(control, &block) unless control.nil?
        end

        # TODO: mock method for attributes; import attribute handling
        define_method :attributes do |_name, _options|
          nil
        end

        define_method :skip_control do |id|
          profile_context_owner.unregister_rule(id)
        end

        def only_if
          return unless block_given?
          @skip_profile ||= !yield
        end

        alias_method :rule, :control
        alias_method :skip_rule, :skip_control

        private

        def block_location(block, alternate_caller)
          if block.nil?
            alternate_caller[/^(.+:\d+):in .+$/, 1] || 'unknown'
          else
            path, line = block.source_location
            "#{File.basename(path)}:#{line}"
          end
        end
      end
      # rubocop:enable all
    end
  end
end
