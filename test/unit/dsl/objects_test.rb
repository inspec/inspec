# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/objects'

describe 'Objects' do
  describe 'Inspec::Test' do
    let(:obj) { Inspec::Test.new }
    it 'constructs a simple resource+argument' do
      obj.qualifier = [['resource'], ['arg']]
      obj.to_ruby.must_equal "
describe resource do
  its(\"arg\") { should  }
end
".strip
    end

    it 'constructs a simple resource+argument with to_s' do
      obj.qualifier = [['resource'], ['to_s']]
      obj.to_ruby.must_equal "
describe resource.to_s do
  it { should  }
end
".strip
    end

    it 'constructs a simple resource+argument with to_i' do
      obj.qualifier = [['resource'], ['to_i']]
      obj.to_ruby.must_equal "
describe resource.to_i do
  it { should  }
end
".strip
    end

    it 'constructs a simple resource+argument with array accessors' do
      obj.qualifier = [['resource'], ['name[2]']]
      obj.to_ruby.must_equal "
describe resource.name[2] do
  it { should  }
end
".strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource'], ['hello', 'world']]
      obj.to_ruby.must_equal "
describe resource.hello(\"world\") do
  it { should  }
end
".strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource'], [:world]]
      obj.to_ruby.must_equal "
describe resource do
  its(\"world\") { should  }
end
".strip
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
    it { should_not match("0.0.0.0") }
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

    it 'constructs a control' do
      control = Inspec::Control.new
      control.add_test(obj1)
      control.id = 'test.control.id'
      control.title = 'Test Control Important Title'
      control.desc = 'The most critical control the world has ever seen'
      control.impact = 1.0
      control.to_ruby.must_equal '
control "test.control.id" do
  title "Test Control Important Title"
  desc  "The most critical control the world has ever seen"
  impact 1.0
  describe command("ls /etc") do
    its("exit_status") { should eq 0 }
  end
end
'.strip
    end

  end


end
