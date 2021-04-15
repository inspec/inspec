# copyright: 2015, Dominik Richter

require "method_source"
require "date"
require "inspec/describe_base"
require "inspec/expect"
require "inspec/impact"
require "inspec/resource"
require "inspec/resources/os"
require "inspec/input_registry"

module Inspec
  class Rule
    include ::RSpec::Matchers

    attr_reader :__waiver_data
    attr_accessor :resource_dsl
    attr_reader :__profile_id

    def initialize(id, profile_id, resource_dsl, opts, &block)
      @impact = nil
      @title = nil
      @descriptions = {}
      @refs = []
      @tags = {}

      @resource_dsl = resource_dsl
      extend resource_dsl # TODO: remove! do it via method_missing

      # not changeable by the user:
      @__code = nil
      @__block = block
      @__source_location = __get_block_source_location(&block)
      @__rule_id = id
      @__profile_id = profile_id
      @__checks = []
      @__skip_rule = {} # { result: true, message: "Why", type: [:only_if, :waiver] }
      @__merge_count = 0
      @__merge_changes = []
      @__skip_only_if_eval = opts[:skip_only_if_eval]

      # evaluate the given definition
      return unless block_given?

      begin
        instance_eval(&block)

        # By applying waivers *after* the instance eval, we assure that
        # waivers have higher precedence than only_if.
        __apply_waivers

      rescue SystemStackError, StandardError => e
        # We've encountered an exception while trying to eval the code inside the
        # control block. We need to prevent the exception from bubbling up, and
        # fail the control. Controls are failed by having a failed resource within
        # them; but since our control block is unsafe (and opaque) to us, let's
        # make a dummy and fail that.
        location = block.source_location.compact.join(":")
        describe "Control Source Code Error" do
          # Rubocop thinks we are raising an exception - we're actually calling RSpec's fail()
          its(location) { fail e.message } # rubocop: disable Style/SignalException
        end
      end
    end

    def to_s
      Inspec::Rule.rule_id(self)
    end

    def id(*_)
      # never overwrite the ID
      @id
    end

    def impact(v = nil)
      if v.is_a?(String)
        @impact = Inspec::Impact.impact_from_string(v)
      elsif !v.nil?
        @impact = v
      end

      @impact
    end

    def title(v = nil)
      @title = v unless v.nil?
      @title
    end

    def desc(v = nil, data = nil)
      return @descriptions[:default] if v.nil?

      if data.nil?
        @descriptions[:default] = unindent(v)
      else
        @descriptions[v.to_sym] = unindent(data)
      end
    end

    def descriptions(description_hash = nil)
      return @descriptions if description_hash.nil?

      @descriptions.merge!(description_hash)
    end

    def ref(ref = nil, opts = {})
      return @refs if ref.nil? && opts.empty?

      if opts.empty? && ref.is_a?(Hash)
        opts = ref
      else
        opts[:ref] = ref
      end
      @refs.push(opts)
    end

    def tag(*args)
      args.each do |arg|
        if arg.is_a?(Hash)
          @tags.merge!(arg)
        else
          @tags[arg] ||= nil
        end
      end
      @tags
    end

    def source_file
      @__file
    end

    # Skip all checks if only_if is false
    #
    # @param [Type] &block returns true if tests are added, false otherwise
    # @return [nil]
    def only_if(message = nil)
      return unless block_given?
      return if @__skip_only_if_eval == true

      @__skip_rule[:result] ||= !yield
      @__skip_rule[:type] = :only_if
      @__skip_rule[:message] = message
    end

    # Describe will add one or more tests to this control. There is 2 ways
    # of calling it:
    #
    #   describe resource do ... end
    #
    # or
    #
    #   describe.one do ... end
    #
    # @param [any] Resource to be describe, string, or nil
    # @param [Proc] An optional block containing tests for the described resource
    # @return [nil|DescribeBase] if called without arguments, returns DescribeBase
    def describe(*values, &block)
      if values.empty? && !block_given?
        dsl = resource_dsl
        Class.new(DescribeBase) do
          include dsl
        end.new(method(:__add_check))
      else
        __add_check("describe", values, with_dsl(block))
      end
    end

    def expect(value, &block)
      target = Inspec::Expect.new(value, &with_dsl(block))
      __add_check("expect", [value], target)
      target
    end

    # allow attributes to be accessed within control blocks
    def input(input_name, options = {})
      if options.empty?
        # Simply an access, no event here
        Inspec::InputRegistry.find_or_register_input(input_name, __profile_id).value
      else
        options[:priority] ||= 20
        options[:provider] = :inline_control_code
        evt = Inspec::Input.infer_event(options)
        Inspec::InputRegistry.find_or_register_input(
          input_name,
          __profile_id,
          type: options[:type],
          required: options[:required],
          description: options[:description],
          pattern: options[:pattern],
          event: evt
        ).value
      end
    end

    # Find the Input object, but don't collapse to a value.
    # Will return nil on a miss.
    def input_object(input_name)
      Inspec::InputRegistry.find_or_register_input(input_name, __profile_id)
    end

    def attribute(name, options = {})
      Inspec.deprecate(:attrs_dsl, "Input name: #{name}, Profile: #{__profile_id}")
      input(name, options)
    end

    # Support for Control DSL plugins.
    # This is called when an unknown method is encountered
    # within a control block.
    def method_missing(method_name, *arguments, &block)
      # Check to see if there is a control_dsl plugin activator hook with the method name
      registry = Inspec::Plugin::V2::Registry.instance
      hook = registry.find_activators(plugin_type: :control_dsl, activator_name: method_name).first
      if hook
        # OK, load the hook if it hasn't been already.  We'll then know a module,
        # which we can then inject into the context
        hook.activate

        # Inject the module's methods into the context.
        # implementation_class is the field name, but this is actually a module.
        self.class.include(hook.implementation_class)
        # Now that the module is loaded, it defined one or more methods
        # (presumably the one we were looking for.)
        # We still haven't called it, so do so now.
        send(method_name, *arguments, &block)
      else
        begin
          Inspec::DSL.method_missing_resource(inspec, method_name, *arguments)
        rescue LoadError
          super
        end
      end
    end

    # TODO: figure out why these violations exist and nuke them.
    def self.rule_id(rule)
      rule.instance_variable_get(:@__rule_id)
    end

    def self.set_rule_id(rule, value)
      rule.instance_variable_set(:@__rule_id, value)
    end

    def self.profile_id(rule)
      rule.instance_variable_get(:@__profile_id)
    end

    def self.checks(rule)
      rule.instance_variable_get(:@__checks)
    end

    def self.skip_status(rule)
      rule.instance_variable_get(:@__skip_rule)
    end

    def self.set_skip_rule(rule, value, message = nil, type = :only_if)
      rule.instance_variable_set(:@__skip_rule,
                                 {
                                   result: value,
                                   message: message,
                                   type: type,
                                 })
    end

    def self.merge_count(rule)
      rule.instance_variable_get(:@__merge_count)
    end

    def self.merge_changes(rule)
      rule.instance_variable_get(:@__merge_changes)
    end

    # If a rule is marked to be skipped, this
    # creates a dummay array of "checks" with a skip outcome
    def self.prepare_checks(rule)
      skip_check = skip_status(rule)
      return checks(rule) unless skip_check[:result].eql?(true)

      if skip_check[:message]
        msg = "Skipped control due to #{skip_check[:type]} condition: #{skip_check[:message]}"
      else
        msg = "Skipped control due to #{skip_check[:type]} condition."
      end

      resource = rule.noop
      resource.skip_resource(msg)
      [["describe", [resource], nil]]
    end

    def self.merge(dst, src) # rubocop:disable Metrics/AbcSize
      if src.id != dst.id
        # TODO: register an error, this case should not happen
        return
      end

      sp = rule_id(src)
      dp = rule_id(dst)
      if sp != dp
        # TODO: register an error, this case should not happen
        return
      end

      # merge all fields
      dst.impact(src.impact)                 unless src.impact.nil?
      dst.title(src.title)                   unless src.title.nil?
      dst.descriptions(src.descriptions)     unless src.descriptions.nil?
      dst.tag(src.tag)                       unless src.tag.nil?
      dst.ref(src.ref)                       unless src.ref.nil?

      # merge indirect fields
      # checks defined in the source will completely eliminate
      # all checks that were defined in the destination
      sc = checks(src)
      dst.instance_variable_set(:@__checks, sc) unless sc.empty?
      skip_check = skip_status(src)
      sr = skip_check[:result]
      msg = skip_check[:message]
      skip_type = skip_check[:type]
      set_skip_rule(dst, sr, msg, skip_type) unless sr.nil?

      # Save merge history
      dst.instance_variable_set(:@__merge_count, merge_count(dst) + 1)
      dst.instance_variable_set(
        :@__merge_changes,
        merge_changes(dst) << src.instance_variable_get(:@__source_location)
      )
    end

    private

    def __add_check(describe_or_expect, values, block)
      @__checks.push([describe_or_expect, values, block])
    end

    # Look for an input with a matching ID, and if found, apply waiver
    # skipping logic. Basically, if we have a current waiver, and it says
    # to skip, we'll replace all the checks with a dummy check (same as
    # only_if mechanism)
    # Double underscore: not intended to be called as part of the DSL
    def __apply_waivers
      input_name = @__rule_id # TODO: control ID slugging
      registry = Inspec::InputRegistry.instance
      input = registry.inputs_by_profile.dig(__profile_id, input_name)
      return unless input && input.has_value? && input.value.is_a?(Hash)

      # An InSpec Input is a datastructure that tracks a profile parameter
      # over time. Its value can be set by many sources, and it keeps a
      # log of each "set" event so that when it is collapsed to a value,
      # it can determine the correct (highest priority) value.
      # Store in an instance variable for.. later reading???
      @__waiver_data = input.value
      __waiver_data["skipped_due_to_waiver"] = false
      __waiver_data["message"] = ""

      # Does it have an expiration date, and if so, is it in the future?
      # This sets a waiver message before checking `run: true`
      expiry = __waiver_data["expiration_date"]
      if expiry
        # YAML will automagically give us a Date or a Time.
        # If transcoding YAML between languages (e.g. Go) the date might have also ended up as a String.
        # A string that does not represent a valid time results in the date 0000-01-01.
        if [Date, Time].include?(expiry.class) || (expiry.is_a?(String) && Time.new(expiry).year != 0)
          expiry = expiry.to_time if expiry.is_a? Date
          expiry = Time.new(expiry) if expiry.is_a? String
          if expiry < Time.now # If the waiver expired, return - no skip applied
            __waiver_data["message"] = "Waiver expired on #{expiry}, evaluating control normally"
            return
          end
        else
          ui = Inspec::UI.new
          ui.error("Unable to parse waiver expiration date '#{expiry}' for control #{@__rule_id}")
          ui.exit(:usage_error)
        end
      end

      # Waivers should have a hash value with keys possibly including "run" and
      # expiration_date. We only care here if it has a "run" key and it
      # is false-like, since all non-skipped waiver operations are handled
      # during reporting phase.
      return unless __waiver_data.key?("run") && !__waiver_data["run"]

      # OK, apply a skip.
      @__skip_rule[:result] = true
      @__skip_rule[:type] = :waiver
      @__skip_rule[:message] = __waiver_data["justification"]
      __waiver_data["skipped_due_to_waiver"] = true
    end

    #
    # Takes a block and returns a block that will run the given block
    # with access to the resource_dsl of the current class. This is to
    # ensure that inside the constructed Rspec::ExampleGroup users
    # have access to DSL methods. Previous this was done in
    # Inspec::Runner before sending the example groups to rspec. It
    # was moved here to ensure that code inside `its` blocks hae the
    # same visibility into resources as code outside its blocks.
    #
    # @param [Proc] block
    # @return [Proc]
    #
    def with_dsl(block)
      return nil if block.nil?

      dsl = resource_dsl

      return block unless dsl

      proc do |*args|
        include dsl
        instance_exec(*args, &block)
      end
    end

    # Idio(ma)tic unindent, behaves similar to Ruby2.3 curly heredocs.
    # Find the shortest indentation of non-empty lines and strip that from every line
    # See: https://bugs.ruby-lang.org/issues/9098
    #
    # It is implemented here to support pre-Ruby2.3 with this feature and
    # to not force non-programmers to understand heredocs.
    #
    # Please note: tabs are not supported! (they will be removed but they are not
    # treated the same as in Ruby2.3 heredocs)
    #
    # @param [String] text string which needs to be unindented
    # @return [String] input with indentation removed; '' if input is nil
    def unindent(text)
      return "" if text.nil?

      len = text.split("\n").reject { |l| l.strip.empty? }.map { |x| x.index(/[^\s]/) }.compact.min
      text.gsub(/^[[:blank:]]{#{len}}/, "").strip
    end

    # get the source location of the block
    def __get_block_source_location(&block)
      return {} unless block_given?

      r, l = block.source_location
      { ref: r, line: l }
    rescue MethodSource::SourceNotFoundError
      {}
    end
  end
end
