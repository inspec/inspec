require 'helper'
require 'inspec/objects/input'

describe 'type validation' do
  let(:opts) { {} }
  let(:input) { Inspec::Input.new('test_input', opts) }

  #==============================================================#
  #                      Requiredness
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

  #==============================================================#
  #                   Type Validation
  #==============================================================#
  describe 'enforce_type_validation' do
    {
      'string' => { good: 'a_string', bad: 123.3, norm: 'String' },
      'numeric' => { good: 123, bad: 'not a number', norm: 'Numeric' },
      'regex' => { good: /\d+.+/, bad: '/(.+/', norm: 'Regexp' }
      'array' => { good: [1, 2, 3], bad: { a: 1, b: 2, c: 3 }, norm: 'Array' },
      'hash' => { good: { a: 1, b: 2, c: 3 }, bad: 'i am not a hash', norm: 'Hash' },
      'boolean' => { good: true, bad: 'i am not a boolean', norm: 'Boolean' },
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
    it 'validates the Any type' do
      Inspec::Input.new('test_input', type: 'any', value: false) # No exception
      Inspec::Input.new('test_input', type: 'any', value: true) # No exception
      Inspec::Input.new('test_input', type: 'any', value: 'bob') # No exception
      Inspec::Input.new('test_input', type: 'any', value: 1) # No exception
    end
  end

  #==============================================================#
  #           Type Option Validation and Normalization
  #==============================================================#
  describe 'validate type option' do
    it 'converts regex to Regexp' do
      opts[:type] = 'regex'
      input.type_restriction.must_equal 'Regexp'
    end

    it 'returns the same value if there is nothing to clean' do
      opts[:type] = 'String'
      input.type_restriction.must_equal 'String'
    end

    it 'returns an error if a invalid type is sent' do
      opts[:type] = 'dressing'
      ex = assert_raises(Inspec::Attribute::TypeError) { input }
      ex.message.must_match /Type 'Dressing' is not a valid input type./
    end
  end

  describe 'valid_regexp? method' do
    it 'validates a string regex' do
      input.send(:valid_regexp?, '/.*/').must_equal true
    end

    it 'validates a slash regex' do
      input.send(:valid_regexp?, /.*/).must_equal true
    end

    it 'does not validate a invalid regex' do
      input.send(:valid_regexp?, '/.*(/').must_equal false
    end
  end

  describe 'valid_numeric? method' do
    it 'validates a string number' do
      input.send(:valid_numeric?, '123').must_equal true
    end

    it 'validates a float number' do
      input.send(:valid_numeric?, 44.55).must_equal true
    end

    it 'validats a wrong padded number' do
      input.send(:valid_numeric?, '00080').must_equal true
    end

    it 'does not vaildate a invalid number' do
      input.send(:valid_numeric?, '55.55.55.5').must_equal false
    end

    it 'does not validate a invalid string' do
      input.send(:valid_numeric?, 'one').must_equal false
    end

    it 'does not validate a fraction' do
      input.send(:valid_numeric?, '1/2').must_equal false
    end
  end
end
