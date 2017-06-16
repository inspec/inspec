# encoding: utf-8
# copyright: 2015, Dominik Richter
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/log'

module Inspec::DSL
  def require_controls(id, &block)
    opts = { profile_id: id, include_all: false, backend: @backend, conf: @conf, dependencies: @dependencies }
    ::Inspec::DSL.load_spec_files_for_profile(self, opts, &block)
  end

  def include_controls(id, &block)
    opts = { profile_id: id, include_all: true, backend: @backend, conf: @conf, dependencies: @dependencies }
    ::Inspec::DSL.load_spec_files_for_profile(self, opts, &block)
  end

  alias require_rules require_controls
  alias include_rules include_controls

  def require_resource(options = {})
    raise 'You must specify a specific resource name when calling require_resource()' if options[:resource].nil?

    from_profile = options[:profile] || profile_name
    target_name = options[:as] || options[:resource]
    res = resource_class(from_profile, options[:resource])
    add_resource(target_name, res)
  end

  def self.load_spec_files_for_profile(bind_context, opts, &block)
    dependencies = opts[:dependencies]
    profile_id = opts[:profile_id]

    dep_entry = dependencies.list[profile_id]
    if dep_entry.nil?
      raise <<EOF
Cannot load #{profile_id} since it is not listed as a dependency of #{bind_context.profile_name}.

Dependencies available from this context are:
    #{dependencies.list.keys.join("\n    ")}
EOF
    end

    context = dep_entry.profile.runner_context
    # if we don't want all the rules, then just make 1 pass to get all rule_IDs
    # that we want to keep from the original
    filter_included_controls(context, dep_entry.profile, &block) if !opts[:include_all]
    # interpret the block and skip/modify as required
    context.load(block) if block_given?
    bind_context.add_subcontext(context)
  end

  def self.filter_included_controls(context, profile, &block)
    mock = Inspec::Backend.create({ backend: 'mock' })
    include_ctx = Inspec::ProfileContext.for_profile(profile, mock, {})
    include_ctx.load(block) if block_given?
    # remove all rules that were not registered
    context.all_rules.each do |r|
      id = Inspec::Rule.rule_id(r)
      fid = Inspec::Rule.profile_id(r) + '/' + id
      unless include_ctx.rules[id] || include_ctx.rules[fid]
        context.remove_rule(fid)
      end
    end
  end
end
