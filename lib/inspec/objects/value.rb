# This class is deprecated and will be removed in the next major release of InSpec.
# Use the Inspec::Object classes from the inspec-objects rubygem instead.

require "inspec/utils/deprecation"

module Inspec
  class Value
    include ::Inspec::RubyHelper

    attr_accessor :qualifier
    attr_accessor :skip
    attr_accessor :variable

    def initialize(qualifiers = [])
      @qualifier = qualifiers
      @variable = nil

      Inspec.deprecate(:object_classes, "The Inspec::Value class is deprecated. Use the Inspec::Object::Value class from the inspec-objects Ruby library.")
    end

    def to_ruby
      res = @variable.nil? ? "" : "#{@variable} = "
      res + @qualifier.map { |x| ruby_qualifier(x) }.join(".")
    end

    def name_variable(cache = [])
      @variable = Array("a".."z").find { |x| !cache.include?(x) }
      cache.push(@variable)
      @variable
    end
  end
end
