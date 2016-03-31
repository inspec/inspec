# encoding:utf-8

module Inspec
  class OrTest
    def initialize(tests)
      @tests = tests
    end

    def skip
      nil
    end

    def to_ruby
      format("describe.one do\n  %s\nend",
             @tests.map(&:to_ruby).join("\n"))
    end

    def to_hash
      { describe_one: @tests.map(&:to_hash) }
    end
  end
end
