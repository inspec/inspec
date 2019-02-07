require 'helper'
require 'inspec/objects/input'

describe 'Inspec::Input and Events' do
  let(:ipt { Inspec::Input.new('input') }
  describe 'when creating an input' do
    it 'should have a creation event' do
      creation_events = att.events.select { |e| e.action == :create }
      creation_events.wont_be_empty
    end

    it 'should only have a creation event if no value was provided' do
      creation_events = att.events.select { |e| e.action == :create }
      creation_events.count.must_equal 1
    end

    it 'should have a create and a set event if a value was provided' do
      att = Inspec::Input.new('input', value: 42)
      creation_events = att.events.select { |e| e.action == :create }
      creation_events.count.must_equal 1
      set_events = att.set_events
      set_events.count.must_equal 1
      set_events.first.value.must_equal 42
    end
  end

  describe 'when setting an input using value=' do
    it 'should add a set event' do
      att.set_events.count.must_equal 0
      att.value = 42
      att.set_events.count.must_equal 1
    end

    it 'should add one event for each value= operation' do
      att.set_events.count.must_equal 0
      att.value = 1
      att.value = 2
      att.value = 3
      att.set_events.count.must_equal 3
    end
  end

  # For more real-world testing of metadata vs --attrs vs inline, see
  # test/functional/inputs_test.rb
  describe 'priority voting' do
    it 'value() should return the correct value when there is just one set operation' do
      evt = Inspec::Input::Event.new(value: 42, priority: 25, action: :set)
      att.update(event: evt)
      att.value.must_equal 42
    end

    it 'should return the highest priority regardless of order' do
      evt1 = Inspec::Input::Event.new(value: 1, priority: 25, action: :set)
      att.update(event: evt1)
      evt2 = Inspec::Input::Event.new(value: 2, priority: 35, action: :set)
      att.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 3, priority: 15, action: :set)
      att.update(event: evt3)

      att.value.must_equal 2
    end

    it 'breaks ties using the last event of the highest priority' do
      evt1 = Inspec::Input::Event.new(value: 1, priority: 15, action: :set)
      att.update(event: evt1)
      evt2 = Inspec::Input::Event.new(value: 2, priority: 25, action: :set)
      att.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 3, priority: 25, action: :set)
      att.update(event: evt3)

      att.value.must_equal 3
    end
  end

  # TODO: test stack hueristics?

  describe 'input diagnostics' do
    it 'should dump the events' do
      evt1 = Inspec::Input::Event.new(value: {a:1, b:2}, priority: 15, action: :set, provider: :unit_test)
      att.update(event: evt1)
      evt2 = Inspec::Input::Event.new(action: :fetch, provider: :alcubierre, hit: false)
      att.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 12, action: :set, provider: :control_dsl, file: '/tmp/some/file.rb', line: 2)
      att.update(event: evt3)

      text = att.diagnostic_string
      lines = text.split("\n")
      lines.count.must_equal 5 # 3 events above + 1 create + 1 input name line
      lines.shift # Not testing the inputs top line here

      lines.each do |line|
        line.must_match /^\s\s([a-z]+:\s\'.+\',\s)*?([a-z]+:\s\'.+\')$/ # key: 'value', key: 'value' ...
      end

      lines[0].must_include "action: 'create',"

      lines[1].must_include "action: 'set',"
      lines[1].must_include "value: '{" # It should to_s the value
      lines[1].must_include "provider: 'unit_test'"
      lines[1].must_include "priority: '15'"

    end
  end
end