require 'helper'
require 'inspec/objects/input'

describe 'Inspec::Input and Events' do
  describe 'when creating an input' do
    it 'should have a creation event' do
    end
    it 'should only have a creation event if no value was provided' do
    end
    it 'should have a create and a set event if a value was provided' do
    end
  end

  describe 'when setting an input using value=' do
    it 'should add a set event' do
    end
    it 'should add one event for each value= operation' do
    end
  end

  describe 'input diagnostics' do
    it 'should dump the events' do
    end
  end

  # For more real-world testing of metadata vs --attrs vs inline, see
  # test/functional/inputs_test.rb
  describe 'priority voting' do
    it 'value() should return the correct value when there is just one set operation' do
    end
    it 'should return the highest priority regardless of order' do
    end
    it 'break ties using the first event of the highest priority' do
    end
  end
end