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

    def title
      @opts[:title]
    end

    def description
      @opts[:description]
    end

    def ruby_var_identifier
      'attr_' + @name.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
    end

    def to_hash
      {
        name: @name,
        options: @opts,
      }
    end

    def to_ruby
      res = ["#{ruby_var_identifier} = attribute('#{@name}',{"]
      res.push "  title: '#{title}'," unless title.to_s.empty?
      res.push "  default: '#{default}'," unless default.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push '})'
      res.join("\n")
    end

    def to_s
      "Attribute #{@name} with #{@value}"
    end
  end
end
