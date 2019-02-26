# encoding: utf-8

require 'helper'
require 'inspec/input_registry'
require 'inspec/secrets'

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

  # =============================================================== #
  #                  Loading inputs from --attrs
  # =============================================================== #
  describe '#bind_profile_inputs' do
    before do
      Inspec::InputRegistry.any_instance.stubs(:validate_inputs_file_readability!)
    end
    let(:profile) do
      p = mock()
      p.expects(:profile_name).returns('test_fixture_profile').at_least_once
      p
    end
    let(:seen_inputs) do
      registry.bind_profile_inputs(profile, sources)
      inputs = registry.list_inputs_for_profile('test_fixture_profile')
      # Flatten Input objects down to their values
      inputs.keys.each { |input_name| inputs[input_name] = inputs[input_name].value }
      inputs
    end

    describe 'when no CLI --attrs are specified' do
      let(:sources) { { cli_input_files: [] } }
      it 'returns an empty hash' do
        seen_inputs.must_equal({})
      end
    end

    describe 'when a CLI --attrs option is provided and does not resolve' do
      let(:sources) { { cli_input_files: ['nope.jpg'] } }
      it 'raises an exception' do
        Inspec::SecretsBackend.expects(:resolve).with('nope.jpg').returns(nil)
        proc { seen_inputs }.must_raise Inspec::Exceptions::SecretsBackendNotFound
      end
    end

    describe 'when a CLI --attrs option is provided and has no inputs' do
      let(:sources) { { cli_input_files: ['empty.yaml'] } }
      it 'returns an empty hash' do
        secrets = mock
        secrets.stubs(:inputs).returns(nil)
        Inspec::SecretsBackend.expects(:resolve).with('empty.yaml').returns(secrets)

        seen_inputs.must_equal({})
      end
    end

    describe 'when a CLI --attrs file is provided and has inputs' do
      let(:sources) { { cli_input_files: ['file1.yaml'] } }
      it 'returns a hash containing the inputs' do
        fixture_inputs = { foo: 'bar' }
        secrets = mock
        secrets.stubs(:inputs).returns(fixture_inputs)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets)

        seen_inputs.must_equal(fixture_inputs)
      end
    end

    describe 'when multiple CLI --attrs option args are provided and one fails' do
      let(:sources) { { cli_input_files: ['file1.yaml', 'file2.yaml'] } }
      it 'raises an exception' do
        secrets = mock
        secrets.stubs(:inputs).returns(nil)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(nil)
        proc { seen_inputs }.must_raise Inspec::Exceptions::SecretsBackendNotFound
      end
    end

    describe 'when multiple CLI --attrs option args are provided and one has no inputs' do
      let(:sources) { { cli_input_files: ['file1.yaml', 'file2.yaml'] } }

      it 'returns a hash containing the inputs from the valid files' do
        inputs = { foo: 'bar' }
        secrets1 = mock
        secrets1.stubs(:inputs).returns(nil)
        secrets2 = mock
        secrets2.stubs(:inputs).returns(inputs)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets1)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(secrets2)
        seen_inputs.must_equal(inputs)
      end
    end

    describe 'when multiple CLI --attrs option args are provided and all have inputs' do
      let(:sources) { { cli_input_files: ['file1.yaml', 'file2.yaml'] } }
      it 'returns a hash containing all the inputs' do
        options = { attrs: ['file1.yaml', 'file2.yaml'] }
        secrets1 = mock
        secrets1.stubs(:inputs).returns({ key1: 'value1' })
        secrets2 = mock
        secrets2.stubs(:inputs).returns({ key2: 'value2' })
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets1)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(secrets2)
        seen_inputs.must_equal({ key1: 'value1', key2: 'value2' })
      end
    end
  end
end
