module Inspec
  class Describe
    # Internal helper to structure test objects.
    # Should not be exposed to the user as it is hidden behind
    # `add_test`, `to_hash`, and `to_ruby` in Inspec::Describe
    Test = Struct.new(:its, :matcher, :expectation, :negated) do
      def negate!
        self.negated = !negated
      end

      def to_ruby
        itsy = 'it'
        unless its.nil?
          if its.is_a? Array
            itsy = 'its(' + its.inspect + ')'
          else
            itsy = 'its(' + its.to_s.inspect + ')'
          end
        end
        naughty = negated ? '_not' : ''
        xpect = if expectation.nil?
                  ''
                elsif expectation.class == Regexp
                  # without this, xpect values like / \/zones\// will not be parsed properly
                  "(#{expectation.inspect})"
                else
                  ' ' + expectation.inspect
                end
        format('%s { should%s %s%s }', itsy, naughty, matcher, xpect)
      end
    end

    # A qualifier describing the resource that will be tested. It may consist
    # of the resource identification and multiple accessors to pinpoint the data
    # the user wants to test.
    attr_accessor :qualifier

    # An array of individual tests for the qualifier. Every entry will be
    # translated into an `it` or `its` clause.
    attr_accessor :tests

    # Optional variables which are used by tests.
    attr_accessor :variables

    # Optional method to skip this describe block altogether. If `skip` is
    # defined it takes precendence and will print the skip statement instead
    # of adding other tests.
    attr_accessor :skip

    include RubyHelper

    def initialize
      @qualifier = []
      @tests = []
      @variables = []
    end

    def add_test(its, matcher, expectation, opts = {})
      test = Inspec::Describe::Test.new(its, matcher, expectation, opts[:negated])
      tests.push(test)
      test
    end

    def to_ruby
      return rb_skip if !skip.nil?
      rb_describe
    end

    def to_hash
      { qualifier: qualifier, tests: tests.map(&:to_h), variables: variables, skip: skip }
    end

    def resource
      return nil if qualifier.empty? || qualifier[0].empty? || qualifier[0][0].empty?
      qualifier[0][0]
    end

    private

    def rb_describe
      vars = variables.map(&:to_ruby).join("\n")
      vars += "\n" unless vars.empty?

      objarr = @qualifier
      objarr = [['unknown object'.inspect]] if objarr.nil? || objarr.empty?
      obj = objarr.map { |q| ruby_qualifier(q) }.join('.')

      rbtests = tests.map(&:to_ruby).join("\n  ")
      format("%sdescribe %s do\n  %s\nend", vars, obj, rbtests)
    end

    def rb_skip
      obj = @qualifier || skip.inspect
      format("describe %s do\n  skip %s\nend", obj, skip.inspect)
    end
  end
end
