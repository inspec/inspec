# copyright: 2015, Dominik Richter
require "inspec/log"
require "inspec/plugin/v2"

module Inspec::DSL
  attr_accessor :backend

  def require_controls(id, version = nil, &block)
    opts = { profile_id: id, include_all: false, backend: @backend, conf: @conf, dependencies: @dependencies, profile_version: version }
    ::Inspec::DSL.load_spec_files_for_profile(self, opts, &block)
  end

  def include_controls(id, version = nil, &block)
    opts = { profile_id: id, include_all: true, backend: @backend, conf: @conf, dependencies: @dependencies, profile_version: version }
    ::Inspec::DSL.load_spec_files_for_profile(self, opts, &block)
  end

  alias require_rules require_controls
  alias include_rules include_controls

  def require_resource(options = {})
    raise "You must specify a specific resource name when calling require_resource()" if options[:resource].nil?

    from_profile = options[:profile] || profile_name
    target_name = options[:as] || options[:resource]
    res = resource_class(from_profile, options[:resource])
    add_resource(target_name, res)
  end

  ##
  # Try to load and instantiate a missing resource or raise LoadError
  # if unable. Requiring the resource registers it and generates a
  # method for it so you should only hit this once per missing
  # resource.

  def self.method_missing_resource(backend, id, *arguments)
    return unless backend

    begin
      require "inspec/resources/#{id}"
    rescue LoadError
      require "resources/aws/#{id}"
    end

    klass = Inspec::Resource.registry[id.to_s]
    klass.new(backend, id, *arguments)
  end

  # Support for Outer Profile DSL plugins
  # This is called when an unknown method is encountered
  # "bare" in a control file - outside of a control or describe block.
  def method_missing(method_name, *arguments, &block)
    # Check to see if there is a outer_profile_dsl plugin activator hook with the method name
    registry = Inspec::Plugin::V2::Registry.instance
    hook = registry.find_activators(plugin_type: :outer_profile_dsl, activator_name: method_name).first
    if hook
      # OK, load the hook if it hasn't been already.  We'll then know a module,
      # which we can then inject into the context
      hook.activate
      # Inject the module's methods into the context
      # implementation_class is the field name, but this is actually a module.
      self.class.include(hook.implementation_class)
      # Now that the module is loaded, it defined one or more methods
      # (presumably the one we were looking for.)
      # We still haven't called it, so do so now.
      send(method_name, *arguments, &block)
    else
      begin
        Inspec::DSL.method_missing_resource(backend, method_name, *arguments)
      rescue LoadError
        super
      end
    end
  end

  def self.load_spec_files_for_profile(bind_context, opts, &block)
    dependencies = opts[:dependencies]
    profile_id = opts[:profile_id]
    profile_version = opts[:profile_version]

    new_profile_id = nil
    if profile_version
      new_profile_id = "#{profile_id}-#{profile_version}"
    else
      dependencies.list.each do |key, value|
        # 1. Fetching VERSION from a profile dependency name which is in a format NAME-VERSION.
        # 2. Matching original profile dependency name with profile name used with include or require control DSL.
        source_version = value.source_version
        unless source_version.blank?
          profile_id_key = key.split("-#{source_version}")[0]
          new_profile_id = key if profile_id_key == profile_id
        end
      end
    end
    dep_entry = new_profile_id ? dependencies.list[new_profile_id] : dependencies.list[profile_id]

    if dep_entry.nil?
      raise <<~EOF
        Cannot load '#{profile_id}' since it is not listed as a dependency of #{bind_context.profile_name}.

        Dependencies available from this context are:
            #{dependencies.list.keys.join("\n    ")}
      EOF
    end

    # Do not load any controls if the profile is not supported
    return unless dep_entry.profile.supports_platform?

    context = dep_entry.profile.runner_context
    # if we don't want all the rules, then just make 1 pass to get all rule_IDs
    # that we want to keep from the original
    if !opts[:include_all] || !(opts[:conf]["profile"].include_tags_list.empty?) || !opts[:conf]["profile"].include_controls_list.empty?
      filter_included_controls(context, dep_entry.profile, opts, &block)
    end
    # interpret the block and skip/modify as required
    context.load(block) if block_given?
    bind_context.add_subcontext(context)
  end

  def self.filter_included_controls(context, profile, opts, &block)
    mock = Inspec::Backend.create(Inspec::Config.mock)
    include_ctx = Inspec::ProfileContext.for_profile(profile, mock)
    include_ctx.load(block) if block_given?
    include_ctx.control_eval_context.conf = opts[:conf]
    control_eval_ctx = include_ctx.control_eval_context
    # remove all rules that were not registered
    context.all_rules.each do |r|
      id = Inspec::Rule.rule_id(r)
      fid = Inspec::Rule.profile_id(r) + "/" + id
      if !opts[:include_all] && !(include_ctx.rules[id] || include_ctx.rules[fid])
        context.remove_rule(fid)
      end

      unless control_eval_ctx.controls_list_empty?
        # filter the dependent profile controls which are not in the --controls options list
        context.remove_rule(fid) unless control_eval_ctx.control_exist_in_controls_list?(id)
      end

      unless control_eval_ctx.tags_list_empty?
        # filter included controls using --tags
        tag_ids = control_eval_ctx.control_tags(r)
        context.remove_rule(fid) unless control_eval_ctx.tag_exist_in_control_tags?(tag_ids)
      end
    end
  end
end
