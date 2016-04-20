# encoding:utf-8

module Inspec
  class EachLoop < List
    attr_reader :tests
    def initialize
      super
      @tests = []
    end

    def add_test(t = nil)
      t ||= Test.new
      t.qualifier[0] = ['entry']
      @tests.push(t)
      t
    end

    def negate!
      @tests.each(&:negate!)
    end

    def to_hash
      { qualifier: qualifier, test: @test }
    end

    def to_ruby
      obj = super
      all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")
      format("%s.each do |entry|\n  %s\nend", obj, all_tests)
    end
  end
end
