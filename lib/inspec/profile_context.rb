# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/log'
require 'inspec/rule'
require 'inspec/resource'
require 'inspec/library_eval_context'
require 'inspec/control_eval_context'
require 'inspec/require_loader'
require 'securerandom'
require 'inspec/objects/attribute'

module Inspec
  class ProfileContext # rubocop:disable Metrics/ClassLength
    def self.for_profile(profile, backend, attributes)
      new(profile.name, backend, { 'profile' => profile,
                                   'attributes' => attributes })
    end

    attr_reader :attributes, :profile_id, :resource_registry, :backend
    attr_accessor :rules
    def initialize(profile_id, backend, conf)
      if backend.nil?
        raise 'ProfileContext is initiated with a backend == nil. ' \
             'This is a backend error which must be fixed upstream.'
      end
      @profile_id = profile_id
      @backend = backend
      @conf = conf.dup
      @rules = {}
      @control_subcontexts = []
      @lib_subcontexts = []
      @require_loader = ::Inspec::RequireLoader.new
      @attributes = []
      # A local resource registry that only contains resources defined
      # in the transitive dependency tree of the loaded profile.
      @resource_registry = Inspec::Resource.new_registry
      @library_eval_context = Inspec::LibraryEvalContext.create(@resource_registry, @require_loader)
    end

    def dependencies
      if @conf['profile'].nil?
        {}
      else
        @conf['profile'].locked_dependencies
      end
    end

    def to_resources_dsl
      Inspec::Resource.create_dsl(self)
    end

    def control_eval_context
      @control_eval_context ||= begin
                                  ctx = Inspec::ControlEvalContext.create(self, to_resources_dsl)
                                  ctx.new(@backend, @conf, dependencies, @require_loader)
                                end
    end

    def reload_dsl
      @control_eval_context = nil
    end

    def profile_supports_os?
      return true if @conf['profile'].nil?

      @conf['profile'].supports_os?
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
      if !found
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
      autoloads.each do |path|
        next unless path.end_with?('.rb')
        load_library_file(*@require_loader.load(path)) unless @require_loader.loaded?(path)
      end
      reload_dsl
    end

    def load_control_file(*args)
      load_with_context(control_eval_context, *args)
    end
    alias load load_control_file

    def load_library_file(*args)
      load_with_context(@library_eval_context, *args)
    end

    def load_with_context(context, content, source = nil, line = nil)
      Inspec::Log.debug("Loading #{source || '<anonymous content>'} into #{self}")
      @current_load = { file: source }
      if content.is_a? Proc
        context.instance_eval(&content)
      elsif source.nil? && line.nil?
        context.instance_eval(content)
      else
        context.instance_eval(content, source || 'unknown', line || 1)
      end
    end

    def unregister_rule(id)
      @rules.delete(full_id(@profile_id, id))
    end

    attr_reader :current_load

    def register_rule(r)
      # get the full ID
      file = if @current_load.nil?
               'unknown'
             else
               @current_load[:file] || 'unknown'
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
  end
end
