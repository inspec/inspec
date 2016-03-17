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

    def initialize(id, _opts, &block)
      @id = id
      @impact = nil
      @__block = block
      @__code = __get_block_source(&block)
      @__source_location = __get_block_source_location(&block)
      @title = nil
      @desc = nil
      @refs = []
      @tags = {}
      # not changeable by the user:
      @profile_id = nil
      @checks = []
      # evaluate the given definition
      instance_eval(&block) if block_given?
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
        end.new(method(:add_check))
      else
        add_check('describe', values, block)
      end
    end

    def expect(value, &block)
      target = Inspec::Expect.new(value, &block)
      add_check('expect', [value], target)
      target
    end

    def self.merge(dst, src)
      if src.id != dst.id
        # TODO: register an error, this case should not happen
        return
      end
      sp = src.instance_variable_get(:@profile_id)
      dp = dst.instance_variable_get(:@profile_id)
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
      sc = src.instance_variable_get(:@checks)
      unless sc.nil? || sc.empty?
        dst.instance_variable_set(:@checks, sc)
      end
    end

    # Get the full id consisting of profile id + rule id
    # for the rule. If the rule's profile id is empty,
    # the given profile_id will be used instead and also
    # set for the rule.
    def self.full_id(profile_id, rule)
      if rule.is_a?(String) or rule.nil?
        rid = rule
      else
        # As the profile context is exclusively pulled with a
        # profile ID, attach it to the rule if necessary.
        rid = rule.instance_variable_get(:@id)
        if rid.nil?
          # TODO: Message about skipping this rule
          # due to missing ID
          return nil
        end
      end
      pid = rule.instance_variable_get(:@profile_id)
      if pid.nil?
        rule.instance_variable_set(:@profile_id, profile_id)
        pid = profile_id
      end

      # if we don't have a profile id, just return the rule's ID
      return rid if pid.nil? or pid.empty?
      # otherwise combine them
      "#{pid}/#{rid}"
    end

    private

    def add_check(describe_or_expect, values, block)
      @checks.push([describe_or_expect, values, block])
    end

    # Idio(ma)tic unindent
    # TODO: replace this
    #
    # @param [String] text string which needs to be unindented
    # @return [String] input with indentation removed
    def unindent(text)
      return '' if text.nil?
      text.strip.split("\n").map(&:strip)
          .map { |x| x.empty? ? "\n" : x }
          .join(' ')
    end

    # get the rule's source code
    def __get_block_source(&block)
      return '' unless block_given?
      block.source.to_s
    rescue MethodSource::SourceNotFoundError
      ''
    end

    # get the source location of the block
    def __get_block_source_location(&block)
      return [nil, nil] unless block_given?
      block.source_location
    rescue MethodSource::SourceNotFoundError
      [nil, nil]
    end
  end
end
