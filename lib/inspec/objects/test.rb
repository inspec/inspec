# encoding:utf-8

module Inspec
  class Test
    attr_accessor :qualifier, :matcher, :expectation, :skip, :negated, :variables
    include RubyHelper

    def initialize
      @qualifier = []
      @negated = false
      @variables = []
    end

    def negate!
      @negated = !@negated
    end

    def to_ruby
      return rb_skip if !skip.nil?
      rb_describe
    end

    def to_hash
      { qualifier: qualifier, matcher: matcher, expectation: expectation, skip: skip, negated: negated }
    end

    def resource
      @resource ||=
        if qualifier.empty? || qualifier[0].empty? || qualifier[0][0].empty?
          nil
        else
          qualifier[0][0]
        end
    end

    def remove_expectation
      remove_instance_variable(:@expectation)
    end

    private

    def describe_chain
      return nil if @qualifier.empty?

      resource = (@qualifier.length > 1) ? @qualifier[0..-2] : [@qualifier[0]]
      res = resource.map { |q| ruby_qualifier(q) }.join('.')
      xres = nil

      if @qualifier.length > 1
        last = @qualifier[-1]
        if last.length == 1
          xres = last[0]
        else
          res += '.' + ruby_qualifier(last)
        end
      end

      [res, xres]
    end

    def rb_describe
      vars = variables.map(&:to_ruby).join("\n")
      vars += "\n" unless vars.empty?
      res, xtra = describe_chain
      itsy = xtra.nil? ? 'it' : 'its(' + xtra.to_sym.inspect + ')'
      naughty = @negated ? '_not' : ''
      xpect = defined?(@expectation) ? expectation.inspect : ''
      format("%sdescribe %s do\n  %s { should%s %s %s }\nend",
             vars, res, itsy, naughty, matcher, xpect)
    end

    def rb_skip
      dc = describe_chain
      obj = dc.nil? ? skip.inspect : dc[0]
      format("describe %s do\n  skip %s\nend", obj, skip.inspect)
    end
  end
end
