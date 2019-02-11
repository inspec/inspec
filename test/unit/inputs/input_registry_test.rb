# encoding: utf-8

require 'helper'
require 'inspec/inpuut_registry'

describe Inspec::AttributeRegistry do
  let(:attributes) { Inspec::AttributeRegistry }

  def setup
    Inspec::AttributeRegistry.instance.__reset
  end

  describe 'creating a profile attribute' do
    it 'creates an attribute without options' do
      attributes.register_attribute('test_attribute', 'dummy_profile')
      # confirm we get the dummy default
      attributes.find_attribute('test_attribute', 'dummy_profile').value.class.must_equal Inspec::Attribute::DEFAULT_ATTRIBUTE
    end

    it 'creates an attribute with a default value' do
      attributes.register_attribute('color', 'dummy_profile', default: 'silver')
      attributes.find_attribute('color', 'dummy_profile').value.must_equal 'silver'
    end
  end

  describe 'creating a profile with a name alias' do
    it 'creates a default attribute on a profile with an alias' do
      attributes.register_profile_alias('old_profile', 'new_profile')
      attributes.register_attribute('color', 'new_profile', default: 'blue')
      attributes.find_attribute('color', 'new_profile').value.must_equal 'blue'
      attributes.find_attribute('color', 'old_profile').value.must_equal 'blue'
    end
  end

  describe 'creating a profile and select it' do
    it 'creates a profile with attributes' do
      attributes.register_attribute('color', 'dummy_profile', default: 'silver')
      attributes.register_attribute('color2', 'dummy_profile', default: 'blue')
      attributes.register_attribute('color3', 'dummy_profile', default: 'green')
      attributes.list_attributes_for_profile('dummy_profile').size.must_equal 3
    end
  end

  describe 'validate the correct objects are getting created' do
    it 'creates a profile with attributes' do
      attributes.register_attribute('color', 'dummy_profile', default: 'silver').class.must_equal Inspec::Attribute
      attributes.list_attributes_for_profile('dummy_profile').size.must_equal 1
    end
  end

  describe 'validate find_attribute method' do
    it 'find an attribute which exist' do
      attribute = attributes.register_attribute('color', 'dummy_profile')
      attribute.value = 'black'

      attributes.find_attribute('color', 'dummy_profile').value.must_equal 'black'
    end

    it 'errors when trying to find an attribute on an unknown profile' do
      attribute = attributes.register_attribute('color', 'dummy_profile')
      ex = assert_raises(Inspec::AttributeRegistry::ProfileError) { attributes.find_attribute('color', 'unknown_profile') }
      ex.message.must_match "Profile 'unknown_profile' does not have any attributes"
    end

    it 'errors when trying to find an unknown attribute on a known profile' do
      attribute = attributes.register_attribute('color', 'dummy_profile')
      ex = assert_raises(Inspec::AttributeRegistry::AttributeError) { attributes.find_attribute('unknown_attribute', 'dummy_profile') }
      ex.message.must_match "Profile 'dummy_profile' does not have an attribute with name 'unknown_attribute'"
    end
  end
end
