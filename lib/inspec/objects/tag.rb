module Inspec
  class Tag
    attr_accessor :key, :value

    def initialize(key, value)
      @key = key
      @value = value
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
