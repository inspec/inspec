# encoding:utf-8

module Inspec
  class OrTest
    attr_reader :tests
    def initialize(tests)
      @tests = tests
    end

    def skip
      nil
    end

    def to_ruby
      all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")
      format("describe.one do\n  %s\nend", all_tests)
    end

    def to_hash
      { describe_one: @tests.map(&:to_hash) }
    end
  end
end
