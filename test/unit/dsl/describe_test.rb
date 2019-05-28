require 'helper'
require 'inspec/objects'

describe 'Objects' do
  describe 'Inspec::Describe' do
    let(:obj) { Inspec::Describe.new }
    it 'constructs a simple resource + its("argument")' do
      obj.qualifier.push(['resource'])
      obj.add_test('version', 'cmp >=', '2.4.2')
      obj.to_ruby.must_equal '
describe resource do
  its("version") { should cmp >= "2.4.2" }
end
'.strip
    end

    it 'constructs a simple resource.argument' do
      obj.qualifier = [['resource'], ['version']]
      obj.add_test(nil, 'cmp >=', '2.4.2')
      obj.to_ruby.must_equal '
describe resource.version do
  it { should cmp >= "2.4.2" }
end
'.strip
    end

    it 'constructs a simple resource+argument with to_s' do
      obj.qualifier = [['resource'], ['to_s']]
      obj.add_test(nil, 'cmp', Regexp.new('^Desc.+$'))
      obj.to_ruby.must_equal '
describe resource.to_s do
  it { should cmp(/^Desc.+$/) }
end
'.strip
    end

    it 'constructs a simple resource+argument with to_i' do
      obj.qualifier = [['resource'], ['to_i']]
      obj.add_test(nil, 'cmp >', 3)
      obj.to_ruby.must_equal '
describe resource.to_i do
  it { should cmp > 3 }
end
'.strip
    end

    it 'constructs a simple resource+argument with array accessors' do
      obj.qualifier = [['resource'], ['name[2]']]
      obj.add_test(nil, 'eq', 'mytest')
      obj.to_ruby.must_equal '
describe resource.name[2] do
  it { should eq "mytest" }
end
'.strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource'], ['hello', 'world']]
      obj.add_test(nil, 'eq', 'mytest')
      obj.to_ruby.must_equal '
describe resource.hello("world") do
  it { should eq "mytest" }
end
'.strip
    end

    it 'constructs a simple resource+argument with method calls' do
      obj.qualifier = [['resource']]
      obj.add_test(:mode, 'cmp', '0755')
      obj.to_ruby.must_equal '
describe resource do
  its("mode") { should cmp "0755" }
end
'.strip
    end

    it 'constructs a resource+argument block with method call, matcher and expectation' do
      obj.qualifier = [['command','ls /etc']]
      obj.add_test('exit_status', 'eq', 0)
      obj.to_ruby.must_equal '
describe command("ls /etc") do
  its("exit_status") { should eq 0 }
end
'.strip
    end

    it 'constructs a simple describe with static data, negated regex matcher and expectation' do
      obj.qualifier = [['"aaa"']]
      obj.add_test(nil, 'match', Regexp.new('^aa.*')).negate!
      obj.to_ruby.must_equal '
describe "aaa" do
  it { should_not match(/^aa.*/) }
end
'.strip
    end

    it 'constructs a resource+argument block without a property call' do
      obj.qualifier = [['service', 'avahi-daemon']]
      obj.qualifier.push(["info['properties']['UnitFileState']"])
      obj.add_test(nil, 'eq', 'enabled')
      obj.to_ruby.must_equal '
describe service("avahi-daemon").info[\'properties\'][\'UnitFileState\'] do
  it { should eq "enabled" }
end
'.strip
    end

    it 'contains multiple tests' do
      obj.add_test(nil, 'eq', 123)
      obj.add_test(:aba, 'cmp', 'cba').negate!
      obj.to_ruby.must_equal '
describe "unknown object" do
  it { should eq 123 }
  its("aba") { should_not cmp "cba" }
end
'.strip
    end

    it 'constructs a test with an array of strings' do
      obj.qualifier = [['resource']]
      obj.add_test(['explorer', 'exe'], 'cmp', 1)
      obj.to_ruby.must_equal '
describe resource do
  its(["explorer", "exe"]) { should cmp 1 }
end
'.strip
    end

    it 'is negated' do
      obj.qualifier = [['resource']]
      obj.add_test(['explorer', 'exe'], 'cmp', 1, :negated => true)
      obj.to_ruby.must_equal '
describe resource do
  its(["explorer", "exe"]) { should_not cmp 1 }
end
'.strip
    end

    it 'is not negated' do
      obj.qualifier = [['resource']]
      obj.add_test(['explorer', 'exe'], 'cmp', 1, :negated => false)
      obj.to_ruby.must_equal '
describe resource do
  its(["explorer", "exe"]) { should cmp 1 }
end
'.strip
    end
  end
end
