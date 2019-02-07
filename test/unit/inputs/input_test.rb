# encoding: utf-8

require 'helper'
require 'inspec/objects/input'

describe Inspec::Input do
  let(:input) { Inspec::Input.new('test_input') }

  #==============================================================#
  #                   Setting Value - One Shot
  #            (see events_test.rb for overwrite support)
  #==============================================================#
  describe 'the dummy value used when value is not set' do
    it 'returns the actual value, not the dummy object, if one is assigned' do
      input.value = 'new_value'
      input.value.must_equal 'new_value'
    end

    it 'returns the dummy value if no value is assigned' do
      input.value.must_be_kind_of Inspec::Input::NO_VALUE_SET
      input.value.is_a?(Inspec::Input::NO_VALUE_SET).must_equal true
      input.value.to_s.must_equal "Input 'test_input' does not have a value. Skipping test."
    end

    it 'the dummy value responds true to the legacy class checks' do
      input.value.is_a?(Inspec::ATTRIBUTE::DEFAULT_ATTRIBUTE).must_equal true
      input.value.must_be_kind_of Inspec::Attribute::DEFAULT_ATTRIBUTE
    end

    it 'has a dummy value that can be called like a nested map' do
      input.value['hello']['world'][1][2]['three'].wont_be_nil
    end

    it 'has a dummy value that can take any nested method calls' do
      input.value.call.some.fancy.functions.wont_be_nil
    end
  end

  describe 'setting a value in the constructor using value:' do
    it 'returns the user-configured value' do
      input = Inspec::Input.new('test_input', value: 'some_value')
      input.value.must_equal 'some_value'
    end

    it 'returns the user-configured value if nil is explicitly assigned' do
      input = Inspec::Input.new('test_input', value: nil)
      input.value.must_be_nil
    end

    it 'returns the user-configured value if false is explicitly assigned' do
      input = Inspec::Input.new('test_input', value: false)
      input.value.must_equal false
    end

    it 'returns a new value if the value has been assigned by value=' do
      input = Inspec::Input.new('test_input', value: 'original_value')
      input.value = 'new_value'
      input.value.must_equal 'new_value'
    end

    it 'accepts the legacy ":default" option' do
      input = Inspec::Input.new('test_input', default: 'a_default')
      input.value.must_equal 'a_default'
    end

    it 'accepts the legacy ":default" and ":value" options' do
      input = Inspec::Input.new('test_input', default: 'a_default', value: 'a_value')
      input.value.must_equal 'a_value'
    end
  end

  describe 'setting a value using value=' do
    it 'supports storing and returning a value' do
      input.value = 'a_value'
      input.value.must_equal 'a_value'
    end

    it 'supports storing and returning false' do
      input.value = false
      input.value.must_equal false
    end

    it 'supports storing and returning nil' do
      input.value = nil
      input.value.must_be_nil
    end
  end

  #==============================================================#
  #                      Code Generation
  #==============================================================#
  describe 'to_ruby method' do
    it 'generates the code for the input' do
      input = Inspec::Input.new('application_port', description: 'The port my application uses', value: 80)

      ruby_code = input.to_ruby
      ruby_code.must_include "attr_application_port = " # Should assign to a var
      ruby_code.must_include "attribute('application_port'" # Should have the DSL call
      ruby_code.must_include 'value: 80'
      ruby_code.must_include 'default: 80'
      ruby_code.must_include "description: 'The port my application uses'"

      # Try to eval the code to verify that the generated code was valid ruby.
      # Note that the attribute() method is part of the DSL, so we need to
      # alter the call into something that can respond - the constructor will do
      ruby_code_for_eval = ruby_code.sub(/attribute\(/,'Inspec::Input.new(')

      # This will throw exceptions if there is a problem
      new_attr = eval(ruby_code_for_eval) # Could use ripper!
      new_attr.value.must_equal 80
    end
  end

  #==============================================================#
  #                   Validation
  #         (see also validator_types_test.rb)
  #==============================================================#
  describe 'enforce_required_validation' do
    it 'does not error if a value is set' do
      input = Inspec::Input.new('test_input', value: 'some_value', required: true)
      input.value.must_equal 'some_value'
    end

    it 'does not error if a value is specified by value=' do
      input = Inspec::Input.new('test_input', required: true)
      input.value = 'test_value'
      input.value.must_equal 'test_value'
    end

    it 'returns an error if no value is set' do
      # Assigning the cli_command is needed because in check mode, we don't error
      # on unset inputs. This is how you tell the input system we are not in
      # check mode, apparently.
      Inspec::BaseCLI.inspec_cli_command = :exec
      input = Inspec::Input.new('test_input', required: true)
      ex = assert_raises(Inspec::Input::RequiredError) { input.value }
      ex.message.must_match /Input 'test_input' is required and does not have a value./
      Inspec::BaseCLI.inspec_cli_command = nil
    end
  end

  describe 'enforce_type_validation' do
    {
      'string' => { good: 'a_string', bad: 123.3, norm: 'String' },
      'numeric' => { good: 123, bad: 'not a number', norm: 'Numeric' },
      'regex' => { good: /\d+.+/, bad: '/(.+/', norm: 'Regexp' }
      # TODO - array, hash, boolean, any
    }.each do |type, examples|
      it "validates a #{type} in the constructor - (good)" do
        opts = { type: type, value: examples[:good] }
        Inspec::Input.new('test_input', opts) # No exception
      end

      it "validates a #{type} in the constructor - (bad)" do
        opts = { type: type, value: examples[:bad] }
        ex = assert_raises(Inspec::Input::ValidationError) { Inspec::Input.new('test_input', opts) }
        ex.message.must_include 'test_input'
        ex.message.must_include "'#{examples[:bad]}'"
        ex.message.must_include "does not validate to type '#{examples[:norm]}'"
      end

      it "validates a #{type} in value= (good)" do
        att = Inspec::Input.new('test_input', type: type)
        att.value = examples[:good]
      end

      it "validates a #{type} in the value= - (bad)" do
        att = Inspec::Input.new('test_input', type: type)
        ex = assert_raises(Inspec::Input::ValidationError) { att.value = examples[:bad] }
        ex.message.must_include 'test_input'
        ex.message.must_include "'#{examples[:bad]}'"
        ex.message.must_include "does not validate to type '#{examples[:norm]}'"
      end
    end

end
