# encoding: utf-8

require 'helper'
require 'inspec/objects/attribute'

describe Inspec::Attribute do
  let(:attribute) { Inspec::Attribute.new('test_attribute', default: 'default_value') }

  it 'returns the default value if no value is assigned' do
    attribute.value.must_equal 'default_value'
  end

  it 'returns the actual value, not the default, if one is assigned' do
    attribute.value = 'new_value'
    attribute.value.must_equal 'new_value'
  end

  it 'support storing and returning false' do
    attribute.value = false
    attribute.value.must_equal false
  end
end
