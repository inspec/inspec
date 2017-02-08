# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/dsl'
require 'inspec/dsl_shared'

module Inspec
  #
  # ControlEvalContext constructs an anonymous class that control
  # files will be instance_exec'd against.
  #
  # The anonymous class includes the given passed resource_dsl as well
  # as the basic DSL of the control files (describe, control, title,
  # etc).
  #
  class ControlEvalContext
    # Create the context for controls. This includes all components of the DSL,
    # including matchers and resources.
    #
    # @param [ResourcesDSL] resources_dsl which has all resources to attach
    # @return [RuleContext] the inner context of rules
    def self.rule_context(resources_dsl)
      require 'rspec/core/dsl'
      Class.new(Inspec::Rule) do
        include RSpec::Core::DSL
        with_resource_dsl resources_dsl
      end
    end

    # Creates the heart of the control eval context:
    #
    # An instantiated object which has all resources registered to it
    # and exposes them to the a test file.
    #
    # @param profile_context [Inspec::ProfileContext]
    # @param outer_dsl [OuterDSLClass]
    # @return [ProfileContextClass]
    def self.create(profile_context, resources_dsl) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      rule_class = rule_context(resources_dsl)
      profile_context_owner = profile_context
      profile_id = profile_context.profile_id

      Class.new do
        include Inspec::DSL
        include Inspec::DSL::RequireOverride
        include resources_dsl

        def initialize(backend, conf, dependencies, require_loader)
          @backend = backend
          @conf = conf
          @dependencies = dependencies
          @require_loader = require_loader
          @skip_profile = false
        end

        define_method :title do |arg|
          profile_context_owner.set_header(:title, arg)
        end

        def to_s
          "Control Evaluation Context (#{profile_name})"
        end

        define_method :profile_name do
          profile_id
        end

        define_method :control do |*args, &block|
          id = args[0]
          opts = args[1] || {}
          register_control(rule_class.new(id, profile_id, opts, &block))
        end

        #
        # Describe allows users to write rspec-like bare describe
        # blocks without declaring an inclosing control. Here, we
        # generate a control for them automatically and then execute
        # the describe block in the context of that control.
        #
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

        define_method :add_resource do |name, new_res|
          resources_dsl.module_exec do
            define_method name.to_sym do |*args|
              new_res.new(@backend, name.to_s, *args)
            end
          end
        end

        define_method :add_resources do |context|
          self.class.class_eval do
            include context.to_resources_dsl
          end

          rule_class.class_eval do
            include context.to_resources_dsl
          end
        end

        define_method :add_subcontext do |context|
          profile_context_owner.add_subcontext(context)
        end

        define_method :register_control do |control, &block|
          if @skip_profile || !profile_context_owner.profile_supports_os?
            ::Inspec::Rule.set_skip_rule(control, true)
          end

          profile_context_owner.register_rule(control, &block) unless control.nil?
        end

        # method for attributes; import attribute handling
        define_method :attribute do |name, options|
          profile_context_owner.register_attribute(name, options)
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
    end
  end
end
