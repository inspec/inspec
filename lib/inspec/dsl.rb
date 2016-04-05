# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::DSL
  def require_controls(id, &block)
    opts = { profile_id: id, include_all: false, backend: @backend, conf: @conf }
    ::Inspec::DSL.load_spec_files_for_profile(self, opts, &block)
  end

  def include_controls(id, &block)
    opts = { profile_id: id, include_all: true, backend: @backend, conf: @conf }
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

  # Register a given rule with RSpec and
  # let it run. This happens after everything
  # else is merged in.
  def self.execute_rule(r, profile_id)
    checks = ::Inspec::Rule.prepare_checks(r)
    fid = InspecBaseRule.full_id(r, profile_id)
    checks.each do |m, a, b|
      # check if the resource is skippable and skipped
      cres = rule_from_check(m, a, b)
      set_rspec_ids(cres, fid) if m == 'describe'
    end
  end

  # merge two rules completely; all defined
  # fields from src will be overwritten in dst
  def self.merge_rules(dst, src)
    InspecBaseRule.merge dst, src
  end

  # Attach an ID attribute to the
  # metadata of all examples
  # TODO: remove this once IDs are in rspec-core
  def self.set_rspec_ids(obj, id)
    obj.examples.each {|ex|
      ex.metadata[:id] = id
    }
    obj.children.each {|c|
      set_rspec_ids(c, id)
    }
  end

  def self.load_spec_files_for_profile(bind_context, opts, &block)
    # get all spec files
    target = get_reference_profile(opts[:profile_id], opts[:conf])
    profile = Inspec::Profile.for_target(target, opts)
    context = load_profile_context(opts[:profile_id], profile, opts)

    # if we don't want all the rules, then just make 1 pass to get all rule_IDs
    # that we want to keep from the original
    filter_included_controls(context, opts, &block) if !opts[:include_all]

    # interpret the block and skip/modify as required
    context.load(block) if block_given?

    # finally register all combined rules
    context.rules.values.each do |control|
      bind_context.register_control(control)
    end
  end

  def self.filter_included_controls(context, opts, &block)
    mock = Inspec::Backend.create({ backend: 'mock' })
    include_ctx = Inspec::ProfileContext.new(opts[:profile_id], mock, opts[:conf])
    include_ctx.load(block) if block_given?
    # remove all rules that were not registered
    context.rules.keys.each do |id|
      unless include_ctx.rules[id]
        context.rules[id] = nil
      end
    end
  end

  def self.get_reference_profile(id, opts)
    profiles_path = opts['profiles_path'] ||
                    fail('You must supply a --profiles-path to inherit from other profiles.')
    abs_path = File.expand_path(profiles_path.to_s)
    unless File.directory? abs_path
      fail("Cannot find profiles path #{abs_path}")
    end

    id_path = File.join(abs_path, id)
    unless File.directory? id_path
      fail("Cannot find referenced profile #{id} in #{id_path}")
    end

    id_path
  end

  def self.load_profile_context(id, profile, opts)
    ctx = Inspec::ProfileContext.new(id, opts[:backend], opts[:conf])
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

module Inspec::GlobalDSL
  def __register_rule(r)
    # make sure the profile id is attached to the rule
    ::Inspec::DSL.execute_rule(r, __profile_id)
  end

  def __unregister_rule(_id)
  end
end

module Inspec::DSLHelper
  def self.bind_dsl(scope)
    (class << scope; self; end).class_exec do
      include Inspec::DSL
      include Inspec::GlobalDSL
    end
  end
end

::Inspec::DSLHelper.bind_dsl(self)
