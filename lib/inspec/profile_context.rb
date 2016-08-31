# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/log'
require 'inspec/rule'
require 'inspec/dsl'
require 'inspec/resource'
require 'inspec/require_loader'
require 'securerandom'
require 'inspec/objects/attribute'

module Inspec
  class ProfileContext # rubocop:disable Metrics/ClassLength
    def self.for_profile(profile, backend)
      new(profile.name, backend, { 'profile' => profile })
    end

    attr_reader :attributes, :rules, :profile_id, :resource_registry
    attr_reader :profile_execution_context
    def initialize(profile_id, backend, conf)
      if backend.nil?
        fail 'ProfileContext is initiated with a backend == nil. ' \
             'This is a backend error which must be fixed upstream.'
      end
      @profile_id = profile_id
      @backend = backend
      @conf = conf.dup
      @rules = {}
      @subcontexts = []
      @require_loader = ::Inspec::RequireLoader.new
      @attributes = []
      # A local resource registry that only contains resources defined
      # in the transitive dependency tree of the loaded profile.
      @resource_registry = Inspec::Resource.new_registry
    end

    def dependencies
      if @conf['profile'].nil?
        {}
      else
        @conf['profile'].locked_dependencies
      end
    end

    def to_resources_dsl
      Inspec::Resource.create_dsl(@backend, @resource_registry)
    end

    def profile_execution_context
      @profile_execution_context ||= begin
                                       resources_dsl = to_resources_dsl
                                       ctx = create_context(resources_dsl)
                                       ctx.new(@backend, @conf, dependencies, @require_loader)
                                     end
    end

    def reload_dsl
      @profile_execution_context = nil
    end

    def all_rules
      ret = @rules.values
      ret += @subcontexts.map(&:all_rules).flatten
      ret
    end

    def add_resources(context)
      @resource_registry.merge!(context.resource_registry)
      profile_execution_context.add_resources(context)
      reload_dsl
    end

    def add_subcontext(context)
      @subcontexts << context
    end

    def load_libraries(libs)
      lib_prefix = 'libraries' + File::SEPARATOR
      autoloads = []

      libs.each do |content, source, line|
        path = source
        if source.start_with?(lib_prefix)
          path = source.sub(lib_prefix, '')
          autoloads.push(path) if File.dirname(path) == '.'
        end

        @require_loader.add(path, content, source, line)
      end

      # load all files directly that are flat inside the libraries folder
      Inspec::Resource.with_local_registry(@resource_registry) do
        autoloads.each do |path|
          next unless path.end_with?('.rb')
          load(*@require_loader.load(path)) unless @require_loader.loaded?(path)
        end
      end
      reload_dsl
    end

    def load(content, source = nil, line = nil)
      Inspec::Log.debug("Loading #{source || '<anonymous content>'} into #{self}")
      @current_load = { file: source }
      if content.is_a? Proc
        profile_execution_context.instance_eval(&content)
      elsif source.nil? && line.nil?
        profile_execution_context.instance_eval(content)
      else
        profile_execution_context.instance_eval(content, source || 'unknown', line || 1)
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

    def register_attribute(name, options = {})
      # we need to return an attribute object, to allow dermination of default values
      attr = Attribute.new(name, options)
      # read value from given gived values
      attr.value(@conf['attributes'][attr.name]) unless @conf['attributes'].nil?
      @attributes.push(attr)
      attr.value
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
    def create_context(resources_dsl) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      rule_class = rule_context(resources_dsl)
      profile_context_owner = self
      profile_id = @profile_id

      # rubocop:disable Lint/NestedMethodDefinition
      Class.new do
        include Inspec::DSL
        include resources_dsl

        def initialize(backend, conf, dependencies, require_loader) # rubocop:disable Lint/NestedMethodDefinition, Lint/DuplicateMethods
          @backend = backend
          @conf = conf
          @dependencies = dependencies
          @require_loader = require_loader
          @skip_profile = false
        end

        # Save the toplevel require method to load all ruby dependencies.
        # It is used whenever the `require 'lib'` is not in libraries.
        alias_method :__ruby_require, :require

        def require(path)
          rbpath = path + '.rb'
          return __ruby_require(path) if !@require_loader.exists?(rbpath)
          return false if @require_loader.loaded?(rbpath)

          # This is equivalent to calling `require 'lib'` with lib on disk.
          # We cannot rely on libraries residing on disk however.
          # TODO: Sandboxing.
          content, path, line = @require_loader.load(rbpath)
          eval(content, TOPLEVEL_BINDING, path, line) # rubocop:disable Lint/Eval
        end

        define_method :title do |arg|
          profile_context_owner.set_header(:title, arg)
        end

        def to_s
          "Profile Context Run #{profile_name}"
        end

        define_method :profile_name do
          profile_id
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
          ::Inspec::Rule.set_skip_rule(control, true) if @skip_profile

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
      # rubocop:enable all
    end
  end
end
