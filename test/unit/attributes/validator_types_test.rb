require 'helper'
require 'inspec/objects/attribute'

describe 'details of type validation' do
  let(:opts) { {} }
  let(:attribute) { Inspec::Attribute.new('test_attribute', opts) }

  describe 'validate type option' do
    it 'converts regex to Regexp' do
      opts[:type] = 'regex'
      attribute.type_restriction.must_equal 'Regexp'
    end

    it 'returns the same value if there is nothing to clean' do
      opts[:type] = 'String'
      attribute.type_restriction.must_equal 'String'
    end

    it 'returns an error if a invalid type is sent' do
      opts[:type] = 'dressing'
      ex = assert_raises(Inspec::Attribute::TypeError) { attribute }
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
  end
