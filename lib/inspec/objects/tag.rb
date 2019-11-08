# This class is deprecated and will be removed in the next major release of InSpec.
# Use the Inspec::Object classes from the inspec-objects rubygem instead.

require "inspec/utils/deprecation"

module Inspec
  class Tag
    attr_accessor :key, :value

    def initialize(key, value)
      @key = key
      @value = value

      Inspec.deprecate(:object_classes, "The Inspec::Tag class is deprecated. Use the Inspec::Object::Tag class from the inspec-objects Ruby library.")
    end

    def to_hash
      {
        name: key,
        value: value,
      }
    end

    def to_ruby
      "tag #{key}: #{value.inspect}"
    end

    def to_s
      "Tag #{key} with #{value}"
    end
  end
end
