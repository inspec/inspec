# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/objects'

describe 'Objects' do
  describe 'Inspec::Test' do
    let(:obj) { Inspec::Test.new }
    it 'constructs a simple resource + its("argument")' do
      obj.qualifier = [['resource'], ['version']]
      obj.matcher = 'cmp >='
      obj.expectation = '2.4.2'
      obj.to_ruby.must_equal '
describe resource do
  its("version") { should cmp >= "2.4.2" }
end
'.strip
    end

    # same as the above test but with it
    it 'constructs a simple resource.argument' do
      # [''] forces an 'it' instead of 'its':
      obj.qualifier = [['resource'], ['version'], ['']]
      obj.matcher = 'cmp >='
      obj.expectation = '2.4.2'
      obj.to_ruby.must_equal '
describe resource.version do
  it { should cmp >= "2.4.2" }
end
'.strip
    end

    it 'constructs a simple resource+argument with to_s' do
      obj.qualifier = [['resource'], ['to_s']]
      obj.matcher = 'cmp'
      obj.expectation = Regexp.new('^Desc.+$')
      obj.to_ruby.must_equal '
describe resource.to_s do
  it { should cmp(/^Desc.+$/) }
end
'.strip
    end

    it 'constructs a simple resource+argument with to_i' do
      obj.qualifier = [['resource'], ['to_i']]
      obj.matcher = 'cmp >'
      obj.expectation = 3
      obj.to_ruby.must_equal '
describe resource.to_i do
  it { should cmp > 3 }
end
'.strip
    end

    it 'constructs a simple resource+argument with array accessors' do
      obj.qualifier = [['resource'], ['name[2]']]
      obj.matcher = 'exist'
      obj.matcher = 'eq'
      obj.expectation = 'mytest'
      obj.to_ruby.must_equal '
describe resource.name[2] do
  it { should eq "mytest" }
end
'.strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource'], ['hello', 'world']]
      obj.matcher = 'eq'
      obj.expectation = 'mytest'
      obj.to_ruby.must_equal '
describe resource.hello("world") do
  it { should eq "mytest" }
end
'.strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource'], [:mode]]
      obj.matcher = 'cmp'
      obj.expectation = '0755'
      obj.to_ruby.must_equal '
describe resource do
  its("mode") { should cmp "0755" }
end
'.strip
    end

    it 'constructs a resource+argument block with method call, matcher and expectation' do
      obj.qualifier = [['command','ls /etc'], ['exit_status']]
      obj.matcher = 'eq'
      obj.expectation = 0

      obj.to_ruby.must_equal '
describe command("ls /etc") do
  its("exit_status") { should eq 0 }
end
'.strip
    end

    it 'constructs a simple describe with static data, negated regex matcher and expectation' do
      obj.qualifier = [['"aaa"']]
      obj.matcher = 'match'
      obj.negate!
      obj.expectation = Regexp.new('^aa.*')

      obj.to_ruby.must_equal '
describe "aaa" do
  it { should_not match(/^aa.*/) }
end
'.strip
    end

    it 'constructs a resource+argument block without a property call' do
      obj.qualifier = [['service', 'avahi-daemon']]
      obj.qualifier.push(["info['properties']['UnitFileState']"])
      obj.expectation =  "enabled"
      obj.matcher = 'eq'
      obj.to_ruby.must_equal '
describe service("avahi-daemon").info[\'properties\'][\'UnitFileState\'] do
  it { should eq "enabled" }
end
'.strip
    end
  end


  describe 'Inspec::EachLoop, each_loop' do
    it 'constructs an each loop to match listening addresses' do
      loop_obj = Inspec::EachLoop.new
      loop_obj.qualifier = [['port', 25]]
      loop_obj.qualifier.push(['addresses'])
      obj = Inspec::Test.new
      obj.matcher = 'match'
      obj.negate!
      obj.expectation = '0.0.0.0'
      loop_obj.add_test(obj)
      loop_obj.to_ruby.must_equal '
port(25).addresses.each do |entry|
  describe entry do
    it { should_not match "0.0.0.0" }
  end
end
'.strip
    end
  end


  describe 'Inspec::List' do
    it 'constructs a list filtering test' do
      list_obj = Inspec::List.new([['passwd']])
      list_obj.qualifier.push(["where { user =~ /^(?!root|sync|shutdown|halt).*$/ }"])

      obj = Inspec::Test.new
      obj.qualifier = list_obj.qualifier
      obj.matcher = 'be_empty'
      obj.qualifier.push(['entries'])
      obj.negate!
      obj.to_ruby.must_equal '
describe passwd.where { user =~ /^(?!root|sync|shutdown|halt).*$/ } do
  its("entries") { should_not be_empty }
end
'.strip
    end
  end


  describe 'Inspec::OrTest and Inspec::Control' do
    let(:obj1) do
      obj1 = Inspec::Test.new
      obj1.qualifier = [['command','ls /etc'], ['exit_status']]
      obj1.matcher = 'eq'
      obj1.expectation = 0
      obj1
    end
    let(:obj2) do
      obj2 = obj1.dup
      obj2.negate!
      obj2.expectation = 100
      obj2
    end

    it 'constructs a simple describe.one block wrapping two tests' do
      or_obj = Inspec::OrTest.new([obj1,obj2])
      or_obj.to_ruby.must_equal '
describe.one do
  describe command("ls /etc") do
    its("exit_status") { should eq 0 }
  end
  describe command("ls /etc") do
    its("exit_status") { should_not eq 100 }
  end
end
'.strip
    end

    it 'negates a describe.one block, wow!' do
      or_obj = Inspec::OrTest.new([obj1,obj2])
      or_obj.negate!
      or_obj.to_ruby.must_equal '
describe command("ls /etc") do
  its("exit_status") { should_not eq 0 }
end
describe command("ls /etc") do
  its("exit_status") { should eq 100 }
end
'.strip
    end

    it 'loops a describe.one block, ooooooo!' do
      res = Inspec::EachLoop.new
      res.qualifier.push(['(1..5)'])
      # already defined in the let block:
      obj1.matcher = 'eq entity'
      obj2.matcher = 'eq entity'
      obj1.remove_expectation
      obj2.remove_expectation

      or_obj = Inspec::OrTest.new([obj1,obj2])
      res.tests = [or_obj]

      res.to_ruby.must_equal '
(1..5).each do |entry|
  describe.one do
    describe command("ls /etc") do
      its("exit_status") { should eq entity }
    end
    describe command("ls /etc") do
      its("exit_status") { should_not eq entity }
    end
  end
end
'.strip
    end

    it 'constructs a control' do
      control = Inspec::Control.new
      control.add_test(obj1)
      control.id = 'sample.control.id'
      control.title = 'Sample Control Important Title'
      control.desc = 'The most critical control the world has ever seen'
      control.impact = 1.0
      control.to_ruby.must_equal '
control "sample.control.id" do
  title "Sample Control Important Title"
  desc  "The most critical control the world has ever seen"
  impact 1.0
  describe command("ls /etc") do
    its("exit_status") { should eq 0 }
  end
end
'.strip
    end

    it 'constructs a multiline desc in a control' do
      control = Inspec::Control.new
      control.desc = "Multiline\ncontrol"
      control.to_ruby.must_equal '
control nil do
  desc  "Multiline
control"
end
'.strip
    end
  end

  describe 'Inspec::Variable, take #1' do
    it 'constructs a control with variable to instantiate a resource only once' do
      control = Inspec::Control.new
      variable = Inspec::Value.new([['command','which grep']])
      variable_id = variable.name_variable.to_s

      obj1 = Inspec::Test.new
      obj1.variables.push(variable)
      obj1.qualifier.push([variable_id])
      obj1.qualifier.push(['exit_status'])
      obj1.matcher = 'eq'
      obj1.expectation = 0
      control.add_test(obj1)

      obj2 = Inspec::Test.new
      obj2.qualifier.push([variable_id.to_s])
      obj2.qualifier.push(['stdout'])
      obj2.matcher = 'contain'
      obj2.expectation = 'grep'
      control.add_test(obj2)

      control.id = 'variable.control.id'
      control.title = 'Variable Control Important Title'
      control.desc = 'The most variable control the world has ever seen'
      control.impact = 1.0
      control.to_ruby.must_equal '
control "variable.control.id" do
  title "Variable Control Important Title"
  desc  "The most variable control the world has ever seen"
  impact 1.0
  a = command("which grep")
  describe a do
    its("exit_status") { should eq 0 }
  end
  describe a do
    its("stdout") { should contain "grep" }
  end
end
'.strip
    end
  end


  describe 'Inspec::Variable, take #2' do
    it 'constructs a control with variable, loop and var reference' do
      control = Inspec::Control.new
      command_value = /^\/usr\/bin\/chrony/
      pid_filter = '>'
      pid_value = 0
      loopy = Inspec::EachLoop.new
      loopy.qualifier = [['processes', command_value]]
      loopy.qualifier.push(["where { pid #{pid_filter} #{pid_value} }.entries"])
      obj = loopy.add_test

      variable = Inspec::Value.new([['passwd.where { user == "_chrony" }.uids.first']])
      variable_id = variable.name_variable.to_s
      obj.variables.push(variable)
      obj.qualifier = [['user(entry.user)'], ['uid']]
      obj.matcher = "cmp #{variable_id}"

      control.add_test(obj)
      control.id = 'variable.control.id'
      control.impact = 0.1
      control.to_ruby.must_equal '
control "variable.control.id" do
  impact 0.1
  a = passwd.where { user == "_chrony" }.uids.first
  describe user(entry.user) do
    its("uid") { should cmp a }
  end
end
'.strip
    end
  end

  describe 'Inspec::Tag' do
    it 'constructs a tag with key and value' do
      control = Inspec::Control.new

      res1 = { name: "key", value: "value" }
      tag1 = Inspec::Tag.new(res1[:name], res1[:value])
      tag1.to_hash.must_equal res1
      control.add_tag(tag1)

      res2 = { name: "key2'", value: "value'" }
      tag2 = Inspec::Tag.new(res2[:name], res2[:value])
      tag2.to_hash.must_equal res2
      control.add_tag(tag2)

      res3 = { name: "key3\"", value: "value\"" }
      tag3 = Inspec::Tag.new(res3[:name], res3[:value])
      tag3.to_hash.must_equal res3
      control.add_tag(tag3)

      res4 = { name: 'key4', value: ['a', 'b'] }
      tag4 = Inspec::Tag.new(res4[:name], res4[:value])
      tag4.to_hash.must_equal res4
      control.add_tag(tag4)

      control.id = 'tag.control.id'
      control.to_ruby.must_equal '
control "tag.control.id" do
  tag "key": "value"
  tag "key2\'": "value\'"
  tag "key3\"": "value\""
  tag "key4": ["a", "b"]
end
'.strip

      control_hash = {
        id:"tag.control.id",
        title: nil,
        desc: nil,
        impact: nil,
        tests: [],
        tags:[{
          name:"key",
          value:"value"
        }, {
          name:"key2'",
          value:"value'"
        }, {
          name:"key3\"",
          value:"value\""
        }, {
          name:"key4",
          value:["a", "b"]
        }]
      }
      control.to_hash.must_equal control_hash

    end
  end
end
