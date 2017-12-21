# encoding:utf-8

module Inspec
  class Attribute
    attr_accessor :name
    attr_writer :value

    DEFAULT_ATTRIBUTE = Class.new do
      def method_missing(*_)
        self
      end

      def respond_to_missing?(_, _)
        true
      end
    end

    def initialize(name, options = {})
      @name = name
      @opts = options
      @value = nil
    end

    # implicit call is done by inspec to determine the value of an attribute
    def value
      @value.nil? ? default : @value
    end

    def default
      @opts.key?(:default) ? @opts[:default] : DEFAULT_ATTRIBUTE.new
    end

    def title
      @opts[:title]
    end

    def description
      @opts[:description]
    end

    def ruby_var_identifier
      @opts[:identifier] || 'attr_' + @name.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
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
      res.push "  default: #{default.inspect}," unless default.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push '})'
      res.join("\n")
    end

    def to_s
      "Attribute #{@name} with #{@value}"
    end
  end
end
