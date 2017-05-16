# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'method_source'
require 'inspec/describe'
require 'inspec/expect'

module Inspec
  class Rule # rubocop:disable Metrics/ClassLength
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

    def initialize(id, profile_id, _opts, &block)
      @impact = nil
      @title = nil
      @desc = nil
      @refs = []
      @tags = {}

      # not changeable by the user:
      @__block = block
      @__source_location = __get_block_source_location(&block)
      @__rule_id = id
      @__profile_id = profile_id
      @__checks = []
      @__skip_rule = nil
      @__merge_count = 0

      # evaluate the given definition
      instance_eval(&block) if block_given?
    end

    def to_s
      Inspec::Rule.rule_id(self)
    end

    def id(*_)
      # never overwrite the ID
      @id
    end

    def impact(v = nil)
      @impact = v unless v.nil?
      @impact
    end

    def title(v = nil)
      @title = v unless v.nil?
      @title
    end

    def desc(v = nil)
      @desc = unindent(v) unless v.nil?
      @desc
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

    # Skip all checks if only_if is false
    #
    # @param [Type] &block returns true if tests are added, false otherwise
    # @return [nil]
    def only_if
      return unless block_given?
      @__skip_rule ||= !yield
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

    def self.set_skip_rule(rule, value)
      rule.instance_variable_set(:@__skip_rule, value)
    end

    def self.merge_count(rule)
      rule.instance_variable_get(:@__merge_count)
    end

    def self.prepare_checks(rule)
      msg = skip_status(rule)
      return checks(rule) unless msg
      msg = 'Skipped control due to only_if condition.' if msg == true

      # TODO: we use os as the carrier here, but should consider
      # a separate resource to do skipping
      resource = rule.os
      resource.skip_resource(msg)
      [['describe', [resource], nil]]
    end

    def self.merge(dst, src)
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
      dst.impact(src.impact) unless src.impact.nil?
      dst.title(src.title)   unless src.title.nil?
      dst.desc(src.desc)     unless src.desc.nil?
      # merge indirect fields
      # checks defined in the source will completely eliminate
      # all checks that were defined in the destination
      sc = checks(src)
      dst.instance_variable_set(:@__checks, sc) unless sc.empty?
      sr = skip_status(src)
      set_skip_rule(dst, sr) unless sr.nil?
      # increment merge count
      dst.instance_variable_set(:@__merge_count, merge_count(dst) + 1)
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
