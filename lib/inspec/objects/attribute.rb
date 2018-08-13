# encoding:utf-8

module Inspec
  class Attribute
    class << self
      # Retrieve the current attribute list, containing all attribute names
      # and their options.
      #
      # @return [Hash] map with profile name and attributes
      def list
        @list ||= {}
      end
    end

    attr_accessor :name

    VALID_TYPES = %w{
      String
      Integer
      Numeric
      Float
      Regexp
      Array
      Hash
      Boolean
      Any
    }.freeze

    NUMERIC_TYPES = %w{
      Integer
      Float
      Numeric
    }.freeze

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

    def self.generate(name, profile, options = {})
      Inspec::Attribute.list[profile] ||= Inspec::Attribute.list[profile] = {}
      if Inspec::Attribute.list[profile][name] && options.nil?
        Inspec::Attribute.list[profile][name]
      else
        Inspec::Attribute.list[profile][name] = Inspec::Attribute.new(name, options)
      end
    end

    def initialize(name, options = {})
      @name = name
      @opts = options
      validate_type(default) if @opts.key?(:type) && @opts.key?(:default)
    end

    def value=(new_value)
      validate_type(new_value) if @opts.key?(:type) && !new_value.nil?
      @value = new_value
    end

    def value
      if @value.nil?
        validate_required(@value) if @opts.key?(:required) && @opts[:required] == true
        default
      else
        @value
      end
    end

    def validate_required(value)
      if (!@opt.key?(:defualt) && value.nil?) || (@opt[:default].nil? && value.nil?)
        raise "Attribute '#{@name}' with value '#{value}' is required and does not have a value."
      end
    end

    def clean_type(type)
      type = type.gsub(/^:/, '').capitalize
      case type
      when 'Int'
        'Integer'
      when 'Regex'
        'Regexp'
      else
        type
      end
    end

    def convert_string_to_numeric(type, value)
      if value =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        if type == 'Integer'
          value.to_i
        else
          value.to_f
        end
      else
        value
      end
    end

    def validate_type(value) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      type = clean_type(@opts[:type])
      return if type == 'Any'
      raise "Type '#{type}' is not a valid attribute type" if !VALID_TYPES.include?(type)
      value = convert_string_to_numeric(type, value) if NUMERIC_TYPES.include?(type) && value.is_a?(String)

      invalid_type = false
      if type == 'Regexp'
        invalid_type = true if !value.is_a?(String) || (!value.start_with?('/') || !value.end_with?('/'))
      elsif type == 'Boolean'
        invalid_type = true if ![true, false].include?(value)
      elsif instance_eval("value.is_a?(#{type})") == false
        invalid_type = true
      end

      raise "Attribute '#{@name}' with value '#{value}' does not validate to type '#{type}'." if invalid_type == true
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
