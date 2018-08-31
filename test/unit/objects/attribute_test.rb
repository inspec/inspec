# encoding: utf-8

require 'helper'
require 'inspec/objects/attribute'

describe Inspec::Attribute do
  let(:attribute) { Inspec::Attribute.new('test_attribute') }

  it 'returns the actual value, not the default, if one is assigned' do
    attribute.value = 'new_value'
    attribute.value.must_equal 'new_value'
  end

  it 'support storing and returning false' do
    attribute.value = false
    attribute.value.must_equal false
  end

  it 'returns the default value if no value is assigned' do
    attribute.value.must_be_kind_of Inspec::Attribute::DEFAULT_ATTRIBUTE
  end

  it 'has a default value that can be called like a nested map' do
    attribute.value['hello']['world'][1][2]['three'].wont_be_nil
  end

  it 'has a default value that can take any nested method calls' do
    attribute.value.call.some.fancy.functions.wont_be_nil
  end

  describe 'attribute with a default value set' do
    it 'returns the user-configured default value if no value is assigned' do
      attribute = Inspec::Attribute.new('test_attribute', default: 'default_value')
      attribute.value.must_equal 'default_value'
    end

    it 'returns the user-configured default value if no value is assigned (nil)' do
      attribute = Inspec::Attribute.new('test_attribute', default: nil)
      attribute.value.must_be_nil
    end

    it 'returns the user-configured default value if no value is assigned (false)' do
      attribute = Inspec::Attribute.new('test_attribute', default: false)
      attribute.value.must_equal false
    end
  end

  describe 'validate required method' do
    it 'does not error if a default is set' do
      attribute = Inspec::Attribute.new('test_attribute', default: 'default_value', require: true)
      attribute.value.must_equal 'default_value'
    end

    it 'does not error if a secrets value is set' do
      attribute = Inspec::Attribute.new('test_attribute', secrets_override: 'default_value', required: true)
      attribute.value.must_equal 'default_value'
    end

    it 'returns an error is no value is set' do
      attribute = Inspec::Attribute.new('test_attribute', required: true)
      e = proc { attribute.value }.must_raise(Inspec::AttributeError)
      e.message.must_match /Attribute 'test_attribute' is required and does not have a value./
    end
  end

  describe 'validate value type method' do
    let(:opts) { {} }
    let(:attribute) { Inspec::Attribute.new('test_attribute', opts) }

    it 'validates a string type' do
      opts[:type] = ':string'
      attribute.send(:validate_value_type, 'string').must_be_nil
    end

    it 'validates a integer type' do
      opts[:type] = 'integer'
      attribute.send(:validate_value_type, 123).must_be_nil
    end

    it 'validates a float type' do
      opts[:type] = ':float'
      attribute.send(:validate_value_type, 123.33).must_be_nil
    end

    it 'validates a regex type' do
      opts[:type] = ':regex'
      attribute.send(:validate_value_type, '/^\d*$/').must_be_nil
    end

    it 'validates a array type' do
      opts[:type] = ':Array'
      value = [1, 2, 3]
      attribute.send(:validate_value_type, value).must_be_nil
    end

    it 'validates a hash type' do
      opts[:type] = ':Hash'
      value = { a: 1, b: 2, c: 3 }
      attribute.send(:validate_value_type, value).must_be_nil
    end

    it 'validates a boolean type' do
      opts[:type] = ':boolean'
      attribute.send(:validate_value_type, false).must_be_nil
      attribute.send(:validate_value_type, true).must_be_nil
    end

    it 'validates a boolean type' do
      opts[:type] = ':any'
      attribute.send(:validate_value_type, false).must_be_nil
      attribute.send(:validate_value_type, true).must_be_nil
      attribute.send(:validate_value_type, 1).must_be_nil
      attribute.send(:validate_value_type, 'bob').must_be_nil
    end

    it 'returns an error if a invalid type is set' do
      opts[:type] = ':string'
      e = proc { attribute.send(:validate_value_type, 123) }.must_raise(Inspec::AttributeError)
      e.message.must_match /Attribute 'test_attribute' with value '123' does not validate to type 'String'./
    end
  end

  describe 'clean type method' do
    it 'removes optional colon at start' do
      attribute.send(:clean_type, ':string').must_equal 'String'
    end

    it 'converts int to integer' do
      attribute.send(:clean_type, ':int').must_equal 'Integer'
    end

    it 'returns the same value if there is nothing to clean' do
      attribute.send(:clean_type, 'String').must_equal 'String'
    end
  end

  describe 'convert string to numeric method' do
    it 'converts value to a int' do
      attribute.send(:convert_string_to_numeric, 'Integer', '123').must_equal 123
    end

    it 'converts value to a float' do
      attribute.send(:convert_string_to_numeric, 'Float', '123.33').must_equal 123.33
    end

    it 'converts value to a numeric' do
      attribute.send(:convert_string_to_numeric, 'Numeric', '123.33').must_equal 123.33
    end
  end
end
