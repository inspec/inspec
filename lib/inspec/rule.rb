# copyright: 2015, Dominik Richter

require 'method_source'
require 'inspec/describe'
require 'inspec/expect'
require 'inspec/resource'
require 'inspec/resources/os'

module Inspec
  class Rule
    include ::RSpec::Matchers

    #
    # Include any resources from the given resource DSL.  The passed
    # resource_dsl will also be included in any Inspec::Expect objects
    # we make.
    #
    # @params resource_dsl [Module]
    # @returns [TrueClass]
    #
    def self.with_resource_dsl(resource_dsl)
      include resource_dsl
      @resource_dsl = resource_dsl
      true
    end

    def self.resource_dsl # rubocop:disable Style/TrivialAccessors
      @resource_dsl
    end

    def initialize(id, profile_id, opts, &block)
      @impact = nil
      @title = nil
      @descriptions = {}
      @refs = []
      @tags = {}

      # not changeable by the user:
      @__code = nil
      @__block = block
      @__source_location = __get_block_source_location(&block)
      @__rule_id = id
      @__profile_id = profile_id
      @__checks = []
      @__skip_rule = {}
      @__merge_count = 0
      @__merge_changes = []
      @__skip_only_if_eval = opts[:skip_only_if_eval]

      # evaluate the given definition
      return unless block_given?
      begin
        instance_eval(&block)
      rescue StandardError => e
        # We've encountered an exception while trying to eval the code inside the
        # control block. We need to prevent the exception from bubbling up, and
        # fail the control. Controls are failed by having a failed resource within
        # them; but since our control block is unsafe (and opaque) to us, let's
        # make a dummy and fail that.
        location = block.source_location.compact.join(':')
        describe 'Control Source Code Error' do
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
        dsl = self.class.ancestors[1]
        Class.new(DescribeBase) do
          include dsl
        end.new(method(:__add_check))
      else
        __add_check('describe', values, with_dsl(block))
      end
    end

    def expect(value, &block)
      target = Inspec::Expect.new(value, &with_dsl(block))
      __add_check('expect', [value], target)
      target
    end

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

    def self.set_skip_rule(rule, value, message = nil)
      rule.instance_variable_set(:@__skip_rule,
                                 { result: value, message: message })
    end

    def self.merge_count(rule)
      rule.instance_variable_get(:@__merge_count)
    end

    def self.merge_changes(rule)
      rule.instance_variable_get(:@__merge_changes)
    end

    def self.prepare_checks(rule)
      skip_check = skip_status(rule)
      return checks(rule) unless skip_check[:result].eql?(true)
      if skip_check[:message]
        msg = "Skipped control due to only_if condition: #{skip_check[:message]}"
      else
        msg = 'Skipped control due to only_if condition.'
      end

      # TODO: we use os as the carrier here, but should consider
      # a separate resource to do skipping
      resource = rule.os
      resource.skip_resource(msg)
      [['describe', [resource], nil]]
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
      set_skip_rule(dst, sr, msg) unless sr.nil?

      # Save merge history
      dst.instance_variable_set(:@__merge_count, merge_count(dst) + 1)
      dst.instance_variable_set(
        :@__merge_changes,
        merge_changes(dst) << src.instance_variable_get(:@__source_location),
      )
    end

    private

    def __add_check(describe_or_expect, values, block)
      @__checks.push([describe_or_expect, values, block])
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
      if self.class.resource_dsl
        dsl = self.class.resource_dsl
        proc do |*args|
          include dsl
          instance_exec(*args, &block)
        end
      else
        block
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
      return '' if text.nil?
      len = text.split("\n").reject { |l| l.strip.empty? }.map { |x| x.index(/[^\s]/) }.compact.min
      text.gsub(/^[[:blank:]]{#{len}}/, '').strip
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
