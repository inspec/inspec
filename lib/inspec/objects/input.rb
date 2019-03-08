# encoding:utf-8

require 'utils/deprecation'

# For backwards compatibility during the rename (see #3802),
# maintain the Inspec::Attribute namespace for people checking for
# Inspec::Attribute::DEFAULT_ATTRIBUTE
module Inspec
  class Attribute
    # This only exists to create the Inspec::Attribute::DEFAULT_ATTRIBUTE symbol with a class
    class DEFAULT_ATTRIBUTE; end # rubocop: disable Style/ClassAndModuleCamelCase
  end
end

module Inspec
  class Input
    # This special class is used to represent the value when an input has
    # not been assigned a value. This allows a user to explicitly assign nil
    # to an input.
    class NO_VALUE_SET # rubocop: disable Style/ClassAndModuleCamelCase
      def initialize(name)
        @name = name

        # output warn message if we are in a exec call
        Inspec::Log.warn(
          "Input '#{@name}' does not have a value. "\
          "Use --input-file to provide a value for '#{@name}' or specify a  "\
          "value with `attribute('#{@name}', value: 'somevalue', ...)`.",
        ) if Inspec::BaseCLI.inspec_cli_command == :exec
      end

      def method_missing(*_)
        self
      end

      def respond_to_missing?(_, _)
        true
      end

      def to_s
        "Input '#{@name}' does not have a value. Skipping test."
      end

      def is_a?(klass)
        if klass == Inspec::Attribute::DEFAULT_ATTRIBUTE
          Inspec.deprecate(:rename_attributes_to_inputs, "Don't check for `is_a?(Inspec::Attribute::DEFAULT_ATTRIBUTE)`, check for `Inspec::Input::NO_VALUE_SET")
          true # lie for backward compatibility
        else
          super(klass)
        end
      end

      def kind_of?(klass)
        if klass == Inspec::Attribute::DEFAULT_ATTRIBUTE
          Inspec.deprecate(:rename_attributes_to_inputs, "Don't check for `kind_of?(Inspec::Attribute::DEFAULT_ATTRIBUTE)`, check for `Inspec::Input::NO_VALUE_SET")
          true # lie for backward compatibility
        else
          super(klass)
        end
      end
    end
  end

  class Input
    attr_accessor :name

    VALID_TYPES = %w{
      String
      Numeric
      Regexp
      Array
      Hash
      Boolean
      Any
    }.freeze

    def initialize(name, options = {})
      @name = name
      @opts = options
      if @opts.key?(:default)
        Inspec.deprecate(:attrs_value_replaces_default, "input name: '#{name}'")
        if @opts.key?(:value)
          Inspec::Log.warn "Input #{@name} created using both :default and :value options - ignoring :default"
          @opts.delete(:default)
        else
          @opts[:value] = @opts.delete(:default)
        end
      end
      @value = @opts[:value]
      validate_value_type(@value) if @opts.key?(:type) && @opts.key?(:value)
    end

    def value=(new_value)
      validate_value_type(new_value) if @opts.key?(:type)
      @value = new_value
    end

    def value
      if @value.nil?
        validate_required(@value) if @opts[:required] == true
        @value = value_or_dummy
      else
        @value
      end
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
      res.push "  value: #{value.inspect}," unless value.to_s.empty?
      # to_ruby may generate code that is to be used by older versions of inspec.
      # Anything older than 3.4 will not recognize the value: option, so
      # send the default: option as well. See #3759
      res.push "  default: #{value.inspect}," unless value.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push '})'
      res.join("\n")
    end

    def to_s
      "Input #{@name} with #{@value}"
    end

    private

    def validate_required(value)
      # skip if we are not doing an exec call (archive/vendor/check)
      return unless Inspec::BaseCLI.inspec_cli_command == :exec

      # value will be set already if a secrets file was passed in
      if (!@opts.key?(:default) && value.nil?) || (@opts[:default].nil? && value.nil?)
        error = Inspec::Input::RequiredError.new
        error.input_name = @name
        raise error, "Input '#{error.input_name}' is required and does not have a value."
      end
    end

    def validate_type(type)
      type = type.capitalize
      abbreviations = {
        'Num' => 'Numeric',
        'Regex' => 'Regexp',
      }
      type = abbreviations[type] if abbreviations.key?(type)
      if !VALID_TYPES.include?(type)
        error = Inspec::Input::TypeError.new
        error.input_type = type
        raise error, "Type '#{error.input_type}' is not a valid input type."
      end
      type
    end

    def valid_numeric?(value)
      Float(value)
      true
    rescue
      false
    end

    def valid_regexp?(value)
      # check for invalid regex syntex
      Regexp.new(value)
      true
    rescue
      false
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def validate_value_type(value)
      type = validate_type(@opts[:type])
      return if type == 'Any'

      invalid_type = false
      if type == 'Regexp'
        invalid_type = true if !value.is_a?(String) || !valid_regexp?(value)
      elsif type == 'Numeric'
        invalid_type = true if !valid_numeric?(value)
      elsif type == 'Boolean'
        invalid_type = true if ![true, false].include?(value)
      elsif value.is_a?(Module.const_get(type)) == false
        invalid_type = true
      end

      if invalid_type == true
        error = Inspec::Input::ValidationError.new
        error.input_name = @name
        error.input_value = value
        error.input_type = type
        raise error, "Input '#{error.input_name}' with value '#{error.input_value}' does not validate to type '#{error.input_type}'."
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    def value_or_dummy
      @opts.key?(:value) ? @opts[:value] : Inspec::Input::NO_VALUE_SET.new(@name)
    end
  end
end
