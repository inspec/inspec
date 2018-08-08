# encoding:utf-8

module Inspec
  class Attribute
    attr_accessor :name

    DEFAULT_ATTRIBUTE = Class.new do
      def initialize(name)
        @name = name
      end

      def method_missing(*_)
        Inspec::Log.warn(
          "Returning DEFAULT_ATTRIBUTE for '#{@name}'. "\
          "Use --attrs to provide a value for '#{@name}' or specify a default  "\
          "value with `attribute('#{@name}', default: 'somedefault', ...)`.",
        )

        self
      end

      def respond_to_missing?(_, _)
        true
      end
    end

    def initialize(name, value, options = {})
      @name = name
      @opts = options
      validate_type(default) if @opts.key?(:type) && @opts.key?(:default)
      validate_required(value) if @opts.key?(:required) && @opts[:required] == true
      validate_type(value) unless value.nil?
      @value = value
    end

    def value
      @value.nil? ? default : @value
    end

    def validate_required(value)
      if (!@opt.key?(:defualt) && value.nil?) || (@opt[:default].nil? && value.nil?)
        raise "Attribute '#{@name}' with value '#{value}' is required and does not have a value."
      end
    end

    def validate_type(value)
      # clean up type
      type = @opts[:type].gsub(/^:/, '').capitalize
      case type
      when 'Int'
        type = 'Integer'
      end

      if instance_eval("value.is_a?(#{type})") == false
        raise "Attribute '#{@name}' with value '#{value}' does not validate to type '#{@opts[:type].capitalize}'."
      end
    end

    def default
      @opts.key?(:default) ? @opts[:default] : DEFAULT_ATTRIBUTE.new(@name)
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
