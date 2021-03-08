require "inspec/log"
require "inspec/rule"
require "inspec/resource"
require "inspec/library_eval_context"
require "inspec/control_eval_context"
require "inspec/require_loader"
require "securerandom" unless defined?(SecureRandom)
require "inspec/input_registry"

module Inspec
  class ProfileContext
    def self.for_profile(profile, backend)
      new(profile.name, backend, { "profile" => profile, "check_mode" => profile.check_mode })
    end

    attr_reader :library_eval_context
    attr_reader :backend, :profile_name, :profile_id, :resource_registry
    attr_accessor :rules
    def initialize(profile_id, backend, conf)
      if backend.nil?
        raise "ProfileContext is initiated with a backend == nil. " \
             "This is a backend error which must be fixed upstream."
      end
      @profile_id = profile_id
      @backend = backend
      @conf = conf.dup
      @profile_name = @conf.key?("profile") ? @conf["profile"].profile_name : @profile_id
      @skip_only_if_eval = @conf["check_mode"]
      @rules = {}
      @control_subcontexts = []
      @lib_subcontexts = []
      @require_loader = ::Inspec::RequireLoader.new
      Inspec::InputRegistry.register_profile_alias(@profile_id, @profile_name) if @profile_id != @profile_name
      # TODO: consider polling input source plugins; this is a bulk fetch opportunity

      # A local resource registry that only contains resources defined
      # in the transitive dependency tree of the loaded profile.
      @resource_registry = Inspec::Resource.new_registry
      @library_eval_context = Inspec::LibraryEvalContext.create(@resource_registry, @require_loader)
      @current_load = nil
    end

    def attributes
      Inspec::AttributeRegistry.list_attributes_for_profile(@profile_id)
    end

    def dependencies
      if @conf["profile"].nil?
        {}
      else
        @conf["profile"].locked_dependencies
      end
    end

    def to_resources_dsl
      DomainSpecificLunacy.create_dsl(self)
    end

    def control_eval_context
      @control_eval_context ||=
        Inspec::ControlEvalContext.new(self,
                                       to_resources_dsl,
                                       @backend,
                                       @conf,
                                       dependencies,
                                       @require_loader,
                                       @skip_only_if_eval)
    end

    def reload_dsl
      @control_eval_context = nil
    end

    def profile_supports_platform?
      return true if @conf["profile"].nil?

      @conf["profile"].supports_platform?
    end

    def profile_supports_inspec_version?
      return true if @conf["profile"].nil?

      @conf["profile"].supports_runtime?
    end

    def remove_rule(id)
      @rules[id] = nil if @rules.key?(id)
      @control_subcontexts.each do |c|
        c.remove_rule(id)
      end
    end

    def all_controls
      ret = @rules.values
      ret += @control_subcontexts.map(&:all_rules).flatten
      ret
    end
    alias all_rules all_controls

    def subcontext_by_name(name)
      found = @lib_subcontexts.find { |c| c.profile_id == name }
      unless found
        @lib_subcontexts.each do |c|
          found = c.subcontext_by_name(name)
          break if found
        end
      end

      found
    end

    def add_resources(context)
      @resource_registry.merge!(context.resource_registry)
      control_eval_context.add_resources(context)
      @lib_subcontexts << context
      reload_dsl
    end

    def add_subcontext(context)
      @control_subcontexts << context
    end

    def load_libraries(libs)
      lib_prefix = "libraries" + File::SEPARATOR
      autoloads = []

      libs.sort_by! { |l| l[1] } # Sort on source path so load order is deterministic
      libs.each do |content, source, line|
        next unless source.end_with?(".rb")

        path = source
        if source.start_with?(lib_prefix)
          path = source.sub(lib_prefix, "")
          no_subdir = File.dirname(path) == "."

          autoloads.push(path) if no_subdir
        end

        @require_loader.add(path, content, source, line)
      end

      # load all files directly that are flat inside the libraries folder
      autoloads.each do |path|
        load_library_file(*@require_loader.load(path)) unless
          @require_loader.loaded?(path)
      end

      reload_dsl
    end

    def load_control_file(*args)
      # Set `skip_file` to `false` between file loads to prevent skips from spanning multiple control files
      control_eval_context.skip_file = false
      load_with_context(control_eval_context, *args)
    end
    alias load load_control_file

    def load_library_file(*args)
      load_with_context(@library_eval_context, *args)
    end

    def load_with_context(context, content, source = nil, line = nil)
      Inspec::Log.debug("Loading #{source || "<anonymous content>"} into #{self}")
      @current_load = { file: source }
      if content.is_a? Proc
        context.instance_eval(&content)
      elsif source.nil? && line.nil?
        context.instance_eval(content)
      else
        context.instance_eval(content, source || "unknown", line || 1)
      end
    end

    def unregister_rule(id)
      @rules.delete(full_id(@profile_id, id))
      @control_subcontexts.each do |c|
        c.unregister_rule(id)
      end
    end

    attr_reader :current_load

    def register_rule(r)
      # get the full ID
      file = if @current_load.nil?
               "unknown"
             else
               @current_load[:file] || "unknown"
             end
      r.instance_variable_set(:@__file, file)
      r.instance_variable_set(:@__group_title, current_load[:title])

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

      pid.to_s + "/" + rid.to_s
    end

    module DomainSpecificLunacy
      def self.create_dsl(profile_context)
        Module.new do
          include DomainSpecificLunacy
          add_methods(profile_context)
        end
      end

      def self.included(mod)
        mod.extend ClassMethods
      end

      def resource_class(profile_name, resource_name)
        inner_context = if profile_name == profile_context.profile_id
                          profile_context
                        else
                          profile_context.subcontext_by_name(profile_name)
                        end

        raise ProfileNotFound, "Cannot find profile named: #{profile_name}" if inner_context.nil?

        inner_context.resource_registry[resource_name]
      end

      module ClassMethods
        def add_methods(profile_context)
          backend = profile_context.backend

          define_method(:profile_context) { profile_context }
          define_method(:inspec) { backend }

          add_registry_methods(profile_context)
        end

        def add_registry_methods(profile_context)
          be = profile_context.backend
          bec = be.class

          registry = profile_context.resource_registry
          registry.each do |id, r|
            define_method(id) { |*args| r.new(be, id.to_s, *args) }

            next if be.respond_to?(id)

            bec.define_method(id) { |*args| r.new(be, id.to_s, *args) }
          end
        end # add_resource_methods
      end # ClassMethods
    end # DomainSpecificLunacy
  end # ProfileContext
end

if RUBY_VERSION < "2.5"
  class Module
    public :define_method
  end
end
