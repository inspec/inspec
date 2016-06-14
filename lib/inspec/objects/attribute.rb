# encoding:utf-8

module Inspec
  class Attribute
    attr_accessor :name
    def initialize(name, options)
      @name = name
      @opts = options
      @value = nil
    end

    # implicit call is done by inspec to determine the value of an attribute
    def value(newvalue = nil)
      unless newvalue.nil?
        @value = newvalue
      end
      @value || default
    end

    def default
      @opts[:default]
    end

    def to_hash
      {
        name: @name,
        options: @opts,
      }
    end

    def to_s
      "Attribute #{@name} with #{@value}"
    end
  end
end
