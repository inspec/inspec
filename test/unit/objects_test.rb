# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/objects'

describe 'Objects' do
  describe 'Test' do
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
  end
end
