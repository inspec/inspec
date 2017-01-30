# encoding:utf-8

module Inspec
  class OrTest
    attr_reader :tests
    def initialize(tests)
      @tests = tests
      @negated = false
    end

    def skip
      nil
    end

    def negate!
      @negated = !@negated
    end

    def to_ruby
      if @negated
        # We don't use the describe.one wrapper when negated because:
        # !(test1 || test2)     same as    (!test1 && !test2)    where && is implicit in inspec
        all_tests = @tests.map { |test|
          test.negate!
          test
        }.map(&:to_ruby).join("\n")
        return all_tests
      else
        all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")
        return format("describe.one do\n  %s\nend", all_tests)
      end
    end

    def to_hash
      { describe_one: @tests.map(&:to_hash) }
    end
  end
end
