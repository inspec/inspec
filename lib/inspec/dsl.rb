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

  def self.rule_from_check(m, a, b)
    if a.is_a?(Array) && !a.empty? &&
       a[0].respond_to?(:resource_skipped) &&
       !a[0].resource_skipped.nil?
      ::Inspec::Rule.__send__(m, *a) do
        it a[0].resource_skipped
      end
    else
      # execute the method
      ::Inspec::Rule.__send__(m, *a, &b)
    end
  end

  def self.load_spec_files_for_profile(bind_context, opts, &block)
    dependencies = opts[:dependencies]
    profile_id = opts[:profile_id]

    dep_entry = dependencies.list[profile_id]
    if dep_entry.nil?
      fail <<EOF
Cannot load #{profile_id} since it is not listed as a dependency
of #{bind_context.profile_name}.

Dependencies available from this context are:

     #{dependencies.list.keys.join("\n    ")}
EOF
    end

    context = load_profile_context(dep_entry.profile, opts[:backend])

    # if we don't want all the rules, then just make 1 pass to get all rule_IDs
    # that we want to keep from the original
    filter_included_controls(context, dep_entry.profile, &block) if !opts[:include_all]

    # interpret the block and skip/modify as required
    context.load(block) if block_given?

    bind_context.add_subcontext(context)
  end

  def self.filter_included_controls(context, profile, &block)
    mock = Inspec::Backend.create({ backend: 'mock' })
    include_ctx = Inspec::ProfileContext.for_profile(profile, mock)
    include_ctx.load(block) if block_given?
    # remove all rules that were not registered
    context.rules.keys.each do |id|
      unless include_ctx.rules[id]
        context.rules[id] = nil
      end
    end
  end

  def self.load_profile_context(profile, backend)
    ctx = Inspec::ProfileContext.for_profile(profile, backend)
    profile.libraries.each do |path, content|
      ctx.load(content.to_s, path, 1)
      ctx.reload_dsl
    end
    profile.tests.each do |path, content|
      ctx.load(content.to_s, path, 1)
    end
    ctx
  end
end
