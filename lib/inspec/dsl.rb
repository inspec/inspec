# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::DSL
  def require_rules(id, &block)
    ::Inspec::DSL.load_spec_files_for_profile self, id, false, &block
  end

  def include_rules(id, &block)
    ::Inspec::DSL.load_spec_files_for_profile self, id, true, &block
  end

  # Register a given rule with RSpec and
  # let it run. This happens after everything
  # else is merged in.
  def self.execute_rule(r, profile_id)
    checks = r.instance_variable_get(:@checks)
    fid = InspecBaseRule.full_id(r, profile_id)
    checks.each do |m, a, b|
      # check if the resource is skippable and skipped
      if a.is_a?(Array) && !a.empty? &&
         a[0].respond_to?(:resource_skipped) &&
         !a[0].resource_skipped.nil?
        cres = ::Inspec::Rule.__send__(m, *a) do
          it a[0].resource_skipped
        end
      else
        # execute the method
        cres = ::Inspec::Rule.__send__(m, *a, &b)
      end
      if m == 'describe'
        set_rspec_ids(cres, fid)
      end
    end
  end

  private

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

  def self.load_spec_file_for_profile(profile_id, file, rule_registry, only_ifs)
    raw = File.read(file)
    # TODO: error-handling

    ctx = Inspec::ProfileContext.new(profile_id, rule_registry, only_ifs)
    ctx.instance_eval(raw, file, 1)
  end

  def self.load_spec_files_for_profile(bind_context, profile_id, include_all, &block)
    # get all spec files
    files = get_spec_files_for_profile profile_id
    # load all rules from spec files
    rule_registry = {}
    # TODO: handling of only_ifs
    only_ifs = []
    files.each do |file|
      load_spec_file_for_profile(profile_id, file, rule_registry, only_ifs)
    end

    # interpret the block and create a set of rules from it
    block_registry = {}
    if block_given?
      ctx = Inspec::ProfileContext.new(profile_id, block_registry, only_ifs)
      ctx.instance_eval(&block)
    end

    # if all rules are not included, select only the ones
    # that were defined in the block
    unless include_all
      remove = rule_registry.keys - block_registry.keys
      remove.each { |key| rule_registry.delete(key) }
    end

    # merge the rules in the block_registry (adjustments) with
    # the rules in the rule_registry (included)
    block_registry.each do |id, r|
      org = rule_registry[id]
      if org.nil?
        # TODO: print error because we write alter a rule that doesn't exist
      elsif r.nil?
        rule_registry.delete(id)
      else
        merge_rules(org, r)
      end
    end

    # finally register all combined rules
    rule_registry.each do |_id, rule|
      bind_context.__register_rule rule
    end
  end

  def self.get_spec_files_for_profile(id)
    base_path = '/etc/inspec/tests'
    path = File.join(base_path, id)
    # find all files to be included
    files = []
    if File.directory? path
      # include all library paths, if they exist
      libdir = File.join(path, 'lib')
      if File.directory? libdir and !$LOAD_PATH.include?(libdir)
        $LOAD_PATH.unshift(libdir)
      end
      files = Dir[File.join(path, 'spec', '*_spec.rb')]
    end
    files
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
    # rubocop:disable Lint/NestedMethodDefinition
    (class << scope; self; end).class_exec do
      include Inspec::DSL
      include Inspec::GlobalDSL
    end
    # rubocop:enable all
  end
end

::Inspec::DSLHelper.bind_dsl(self)
