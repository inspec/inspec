# encoding: utf-8

require 'helper'
require 'inspec/attributes'

describe Inspec::Attributes do
  let(:attributes) { Inspec::Attributes.instance }

  def setup
    Inspec::Attributes.instance.__reset
  end

  describe 'creating a profile attribute' do
    it 'creates a attribute without options' do
      attributes.find_or_create('test_attribute', 'profile')
      # confirm we get the dummy default
      attributes.find_or_create('test_attribute', 'profile').value.class.must_equal Inspec::Attribute::DEFAULT_ATTRIBUTE
    end

    it 'creates a attribute without options' do
      attributes.find_or_create('color', 'profile', default: 'silver')
      attributes.find_or_create('color', 'profile').value.must_equal 'silver'
    end
  end

  describe 'creating a profile with a name override' do
    it 'creates a attribute without options' do
      attributes.register_profile_override('old_profile', 'new_profile')
      attributes.find_or_create('color', 'new_profile', default: 'blue')
      attributes.find_or_create('color', 'new_profile').value.must_equal 'blue'
      attributes.find_or_create('color', 'old_profile').value.must_equal 'blue'
    end
  end

  describe 'creating a profile and select it' do
    it 'creates a profile with attributes' do
      attributes.find_or_create('color', 'profile', default: 'silver')
      attributes.find_or_create('color2', 'profile', default: 'blue')
      attributes.find_or_create('color3', 'profile', default: 'green')
      attributes.select_profile('profile').size.must_equal 3
    end
  end
end
