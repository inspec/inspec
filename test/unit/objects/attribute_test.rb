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
      attribute.value.must_equal nil
    end

    it 'returns the user-configured default value if no value is assigned (false)' do
      attribute = Inspec::Attribute.new('test_attribute', default: false)
      attribute.value.must_equal false
    end
  end
end
