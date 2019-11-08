# This class is deprecated and will be removed in the next major release of InSpec.
# Use the Inspec::Object classes from the inspec-objects rubygem instead.

require "inspec/utils/deprecation"

module Inspec
  class EachLoop < List
    attr_reader :variables
    attr_accessor :tests
    def initialize
      super
      @tests = []
      @variables = []

      Inspec.deprecate(:object_classes, "The Inspec::EachLoop class is deprecated. Use the Inspec::Object::EachLoop class from the inspec-objects Ruby library.")
    end

    def add_test(t = nil)
      t ||= Test.new
      t.qualifier[0] = ["entry"]
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
      vars = variables.map(&:to_ruby).join("\n")
      vars += "\n" unless vars.empty?
      obj = super
      all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")
      format("%s%s.each do |entry|\n  %s\nend", vars, obj, all_tests)
    end
  end
end
