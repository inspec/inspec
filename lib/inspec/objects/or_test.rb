# This class is deprecated and will be removed in the next major release of InSpec.
# Use the Inspec::Object classes from the inspec-objects rubygem instead.

require "inspec/utils/deprecation"

module Inspec
  class OrTest
    attr_reader :tests
    def initialize(tests)
      @tests = tests
      @negated = false

      Inspec.deprecate(:object_classes, "The Inspec::OrTest class is deprecated. Use the Inspec::Object::OrTest class from the inspec-objects Ruby library.")
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
        all_tests = @tests.map do |test|
          test.negate!
          test
        end.map(&:to_ruby).join("\n")

        all_tests
      else
        all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")

        format("describe.one do\n  %s\nend", all_tests)
      end
    end

    def to_hash
      { describe_one: @tests.map(&:to_hash) }
    end
  end
end
