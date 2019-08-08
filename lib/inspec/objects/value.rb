module Inspec
  class Value
    include ::Inspec::RubyHelper

    attr_accessor :qualifier
    attr_accessor :skip
    attr_accessor :variable

    def initialize(qualifiers = [])
      @qualifier = qualifiers
      @variable = nil
    end

    def to_ruby
      val = @qualifier.map { |x| ruby_qualifier(x) }.join(".")

      if @variable
        if @variable == :subject
          "subject { %s }" % [val]
        else
          "let(:%s) { %s }" % [@variable, val]
        end
      else
        val
      end
    end

    def name_variable(cache = [])
      @variable = Array("a".."z").find { |x| !cache.include?(x) }
      cache.push(@variable)
      @variable
    end
  end
end
