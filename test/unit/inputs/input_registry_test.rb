# encoding: utf-8

require 'helper'
require 'inspec/input_registry'

describe Inspec::InputRegistry do
  let(:registry) { Inspec::InputRegistry }

  def setup
    Inspec::InputRegistry.instance.__reset
  end

  describe 'creating a profile input' do
    it 'creates an input without options' do
      registry.register_input('test_input', 'dummy_profile')
      # confirm we get the dummy default
      registry.find_input('test_input', 'dummy_profile').value.class.must_equal Inspec::Input::NO_VALUE_SET
    end

    it 'creates an input with a default value' do
      registry.register_input('color', 'dummy_profile', default: 'silver')
      registry.find_input('color', 'dummy_profile').value.must_equal 'silver'
    end
  end

  describe 'creating a profile with a name alias' do
    it 'creates a default input on a profile with an alias' do
      registry.register_profile_alias('old_profile', 'new_profile')
      registry.register_input('color', 'new_profile', default: 'blue')
      registry.find_input('color', 'new_profile').value.must_equal 'blue'
      registry.find_input('color', 'old_profile').value.must_equal 'blue'
    end
  end

  describe 'creating a profile and select it' do
    it 'creates a profile with inputs' do
      registry.register_input('color', 'dummy_profile', default: 'silver')
      registry.register_input('color2', 'dummy_profile', default: 'blue')
      registry.register_input('color3', 'dummy_profile', default: 'green')
      registry.list_inputs_for_profile('dummy_profile').size.must_equal 3
    end
  end

  describe 'validate the correct objects are getting created' do
    it 'creates a profile with inputs' do
      registry.register_input('color', 'dummy_profile', default: 'silver').class.must_equal Inspec::Input
      registry.list_inputs_for_profile('dummy_profile').size.must_equal 1
    end
  end

  describe 'validate find_input method' do
    it 'find an input which exist' do
      input = registry.register_input('color', 'dummy_profile')
      input.value = 'black'

      registry.find_input('color', 'dummy_profile').value.must_equal 'black'
    end

    it 'errors when trying to find an input on an unknown profile' do
      input = registry.register_input('color', 'dummy_profile')
      ex = assert_raises(Inspec::InputRegistry::ProfileLookupError) { registry.find_input('color', 'unknown_profile') }
      ex.message.must_match "Profile 'unknown_profile' does not have any inputs"
    end

    it 'errors when trying to find an unknown input on a known profile' do
      input = registry.register_input('color', 'dummy_profile')
      ex = assert_raises(Inspec::InputRegistry::InputLookupError) { registry.find_input('unknown_input', 'dummy_profile') }
      ex.message.must_match "Profile 'dummy_profile' does not have an input with name 'unknown_input'"
    end
  end
end
