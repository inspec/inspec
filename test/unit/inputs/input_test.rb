# encoding: utf-8

require 'helper'
require 'inspec/objects/input'

describe Inspec::Attribute do
  let(:attribute) { Inspec::Attribute.new('test_attribute') }

  it 'support storing and returning false' do
    attribute.value = false
    attribute.value.must_equal false
  end

  describe 'the dummy value used when value is not set' do
    it 'returns the actual value, not the dummy object, if one is assigned' do
      attribute.value = 'new_value'
      attribute.value.must_equal 'new_value'
    end

    it 'returns the dummy value if no value is assigned' do
      attribute.value.must_be_kind_of Inspec::Attribute::DEFAULT_ATTRIBUTE
      attribute.value.to_s.must_equal "Attribute 'test_attribute' does not have a value. Skipping test."
    end

    it 'has a dummy value that can be called like a nested map' do
      attribute.value['hello']['world'][1][2]['three'].wont_be_nil
    end

    it 'has a dummy value that can take any nested method calls' do
      attribute.value.call.some.fancy.functions.wont_be_nil
    end
  end

  describe 'attribute with a value set' do
    it 'returns the user-configured value' do
      attribute = Inspec::Attribute.new('test_attribute', value: 'some_value')
      attribute.value.must_equal 'some_value'
    end

    it 'returns the user-configured value if nil is explicitly assigned' do
      attribute = Inspec::Attribute.new('test_attribute', value: nil)
      attribute.value.must_be_nil
    end

    it 'returns the user-configured value if false is explicitly assigned' do
      attribute = Inspec::Attribute.new('test_attribute', value: false)
      attribute.value.must_equal false
    end

    it 'returns a new value if the value has been assigned by value=' do
      attribute = Inspec::Attribute.new('test_attribute', value: 'original_value')
      attribute.value = 'new_value'
      attribute.value.must_equal 'new_value'
    end

    it 'accepts the legacy ":default" option' do
      attribute = Inspec::Attribute.new('test_attribute', default: 'a_default')
      attribute.value.must_equal 'a_default'
    end

    it 'accepts the legacy ":default" and ":value" options' do
      attribute = Inspec::Attribute.new('test_attribute', default: 'a_default', value: 'a_value')
      attribute.value.must_equal 'a_value'
    end
  end

  describe 'validate required method' do
    it 'does not error if a value is set' do
      attribute = Inspec::Attribute.new('test_attribute', value: 'some_value', required: true)
      attribute.value.must_equal 'some_value'
    end

    it 'does not error if a value is specified by value=' do
      attribute = Inspec::Attribute.new('test_attribute', required: true)
      attribute.value = 'test_value'
      attribute.value.must_equal 'test_value'
    end

    it 'returns an error if no value is set' do
      # Assigning the cli_command is needed because in check mode, we don't error
      # on unset attributes. This is how you tell the attribute system we are not in
      # check mode, apparently.
      Inspec::BaseCLI.inspec_cli_command = :exec
      attribute = Inspec::Attribute.new('test_attribute', required: true)
      ex = assert_raises(Inspec::Attribute::RequiredError) { attribute.value }
      ex.message.must_match /Attribute 'test_attribute' is required and does not have a value./
      Inspec::BaseCLI.inspec_cli_command = nil
    end
  end

  describe 'validate value type method' do
    let(:opts) { {} }
    let(:attribute) { Inspec::Attribute.new('test_attribute', opts) }

    it 'validates a string type' do
      opts[:type] = 'string'
      attribute.send(:validate_value_type, 'string')
    end

    it 'returns an error if a invalid string is set' do
      opts[:type] = 'string'
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, 123) }
      ex.message.must_match /Attribute 'test_attribute' with value '123' does not validate to type 'String'./
    end

    it 'validates a numeric type' do
      opts[:type] = 'numeric'
      attribute.send(:validate_value_type, 123.33)
    end

    it 'returns an error if a invalid numeric is set' do
      opts[:type] = 'numeric'
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, 'invalid') }
      ex.message.must_match /Attribute 'test_attribute' with value 'invalid' does not validate to type 'Numeric'./
    end

    it 'validates a regex type' do
      opts[:type] = 'regex'
      attribute.send(:validate_value_type, '/^\d*$/')
    end

    it 'returns an error if a invalid regex is set' do
      opts[:type] = 'regex'
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, '/(.+/') }
      ex.message.must_match "Attribute 'test_attribute' with value '/(.+/' does not validate to type 'Regexp'."
    end

    it 'validates a array type' do
      opts[:type] = 'Array'
      value = [1, 2, 3]
      attribute.send(:validate_value_type, value)
    end

    it 'returns an error if a invalid array is set' do
      opts[:type] = 'Array'
      value = { a: 1, b: 2, c: 3 }
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, value) }
      ex.message.must_match /Attribute 'test_attribute' with value '{:a=>1, :b=>2, :c=>3}' does not validate to type 'Array'./
    end

    it 'validates a hash type' do
      opts[:type] = 'Hash'
      value = { a: 1, b: 2, c: 3 }
      attribute.send(:validate_value_type, value)
    end

    it 'returns an error if a invalid hash is set' do
      opts[:type] = 'hash'
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, 'invalid') }
      ex.message.must_match /Attribute 'test_attribute' with value 'invalid' does not validate to type 'Hash'./
    end

    it 'validates a boolean type' do
      opts[:type] = 'boolean'
      attribute.send(:validate_value_type, false)
      attribute.send(:validate_value_type, true)
    end

    it 'returns an error if a invalid boolean is set' do
      opts[:type] = 'boolean'
      ex = assert_raises(Inspec::Attribute::ValidationError) { attribute.send(:validate_value_type, 'not_true') }
      ex.message.must_match /Attribute 'test_attribute' with value 'not_true' does not validate to type 'Boolean'./
    end

    it 'validates a any type' do
      opts[:type] = 'any'
      attribute.send(:validate_value_type, false)
      attribute.send(:validate_value_type, true)
      attribute.send(:validate_value_type, 1)
      attribute.send(:validate_value_type, 'bob')
    end
  end

  describe 'validate type method' do
    it 'converts regex to Regexp' do
      attribute.send(:validate_type, 'regex').must_equal 'Regexp'
    end

    it 'returns the same value if there is nothing to clean' do
      attribute.send(:validate_type, 'String').must_equal 'String'
    end

    it 'returns an error if a invalid type is sent' do
      ex = assert_raises(Inspec::Attribute::TypeError) { attribute.send(:validate_type, 'dressing') }
      ex.message.must_match /Type 'Dressing' is not a valid attribute type./
    end
  end

  describe 'valid_regexp? method' do
    it 'validates a string regex' do
      attribute.send(:valid_regexp?, '/.*/').must_equal true
    end

    it 'validates a slash regex' do
      attribute.send(:valid_regexp?, /.*/).must_equal true
    end

    it 'does not vaildate a invalid regex' do
      attribute.send(:valid_regexp?, '/.*(/').must_equal false
    end
  end

  describe 'valid_numeric? method' do
    it 'validates a string number' do
      attribute.send(:valid_numeric?, '123').must_equal true
    end

    it 'validates a float number' do
      attribute.send(:valid_numeric?, 44.55).must_equal true
    end

    it 'validats a wrong padded number' do
      attribute.send(:valid_numeric?, '00080').must_equal true
    end

    it 'does not vaildate a invalid number' do
      attribute.send(:valid_numeric?, '55.55.55.5').must_equal false
    end

    it 'does not vaildate a invalid string' do
      attribute.send(:valid_numeric?, 'one').must_equal false
    end

    it 'does not vaildate a fraction' do
      attribute.send(:valid_numeric?, '1/2').must_equal false
    end
  end

  describe 'to_ruby method' do
    it 'generates the code for the attribute' do
      attribute = Inspec::Attribute.new('application_port', description: 'The port my application uses', value: 80)

      ruby_code = attribute.to_ruby
      ruby_code.must_include "attr_application_port = " # Should assign to a var
      ruby_code.must_include "attribute('application_port'" # Should have the DSL call
      ruby_code.must_include 'value: 80'
      ruby_code.must_include 'default: 80'
      ruby_code.must_include "description: 'The port my application uses'"

      # Try to eval the code to verify that the generated code was valid ruby.
      # Note that the attribute() method is part of the DSL, so we need to
      # alter the call into something that can respond - the constructor will do
      ruby_code_for_eval = ruby_code.sub(/attribute\(/,'Inspec::Attribute.new(')

      # This will throw exceptions if there is a problem
      new_attr = eval(ruby_code_for_eval) # Could use ripper!
      new_attr.value.must_equal 80
    end
  end
end
