require 'helper'
require 'inspec/objects/input'

describe 'Inspec::Input and Events' do
  let(:ipt) { Inspec::Input.new('input') }

  #==============================================================#
  #                    Create Event
  #==============================================================#
  describe 'when creating an input' do
    it 'should have a creation event' do
      creation_events = ipt.events.select { |e| e.action == :create }
      creation_events.wont_be_empty
    end

    it 'should only have a creation event if no value was provided' do
      creation_events = ipt.events.select { |e| e.action == :create }
      creation_events.count.must_equal 1
    end

    it 'should have a create and a set event if a value was provided' do
      ipt = Inspec::Input.new('input', value: 42)
      creation_events = ipt.events.select { |e| e.action == :create }
      creation_events.count.must_equal 1
      set_events = ipt.set_events
      set_events.count.must_equal 1
      set_events.first.value.must_equal 42
    end
  end

  #==============================================================#
  #                    Set Events
  #==============================================================#
  describe 'when setting an input using value=' do
    it 'should add a set event' do
      ipt.set_events.count.must_equal 0
      ipt.value = 42
      ipt.set_events.count.must_equal 1
    end

    it 'should add one event for each value= operation' do
      ipt.set_events.count.must_equal 0
      ipt.value = 1
      ipt.value = 2
      ipt.value = 3
      ipt.set_events.count.must_equal 3
    end
  end

  #==============================================================#
  #                    Picking a Winner
  #==============================================================#

  # For more real-world testing of metadata vs --attrs vs inline, see
  # test/functional/inputs_test.rb
  describe 'priority voting' do
    it 'value() should return the correct value when there is just one set operation' do
      evt = Inspec::Input::Event.new(value: 42, priority: 25, action: :set)
      ipt.update(event: evt)
      ipt.value.must_equal 42
    end

    it 'should return the highest priority regardless of order' do
      evt1 = Inspec::Input::Event.new(value: 1, priority: 25, action: :set)
      ipt.update(event: evt1)
      evt2 = Inspec::Input::Event.new(value: 2, priority: 35, action: :set)
      ipt.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 3, priority: 15, action: :set)
      ipt.update(event: evt3)

      ipt.value.must_equal 2
    end

    it 'breaks ties using the last event of the highest priority' do
      evt1 = Inspec::Input::Event.new(value: 1, priority: 15, action: :set)
      ipt.update(event: evt1)
      evt2 = Inspec::Input::Event.new(value: 2, priority: 25, action: :set)
      ipt.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 3, priority: 25, action: :set)
      ipt.update(event: evt3)

      ipt.value.must_equal 3
    end
  end

  #==============================================================#
  #                    Stack Hueristics
  #==============================================================#

  describe 'when determining where the call came from' do
    it 'should get the line and file correct in the constructor' do
      expected_file = __FILE__
      expected_line = __LINE__; ipt = Inspec::Input.new('some_input') # Important to keep theses on one line
      event = ipt.events.first
      event.file.must_equal expected_file
      event.line.must_equal expected_line
    end
  end

  #==============================================================#
  #                    Diagnostics
  #==============================================================#

  describe 'input diagnostics' do
    it 'should dump the events' do
      evt1 = Inspec::Input::Event.new(value: {a:1, b:2}, priority: 15, action: :set, provider: :unit_test)
      ipt.update(event: evt1)
      evt2 = Inspec::Input::Event.new(action: :fetch, provider: :alcubierre, hit: false)
      ipt.update(event: evt2)
      evt3 = Inspec::Input::Event.new(value: 12, action: :set, provider: :control_dsl, file: '/tmp/some/file.rb', line: 2)
      ipt.update(event: evt3)

      text = ipt.diagnostic_string
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