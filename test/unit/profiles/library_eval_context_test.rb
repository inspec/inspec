# encoding: utf-8
# author: Steven Danna

require 'helper'
require 'inspec/resource'
require 'inspec/library_eval_context'

describe Inspec::LibraryEvalContext do
  let(:resource_content) { <<EOF
class MyTestResource < Inspec.resource(1)
  name 'my_test_resource'

  desc 'A test description'
  example 'Forgot to write docs, sorry'

  def version
    '2.0'
  end
end

class AnotherResource < IniConfig
  name 'another_resource'

  desc 'Another Resource description'
  example 'see README'

  def version
    '2.0'
  end
end
EOF
  }

  let(:registry) { Inspec::Resource.new_registry }
  let(:eval_context) { Inspec::LibraryEvalContext.create(registry, nil) }

  it 'accepts a registry' do
    Inspec::LibraryEvalContext.create(registry, nil)
  end

  it 'adds the resource to our registry' do
    eval_context.instance_eval(resource_content)
    registry.keys.include?('my_test_resource').must_equal true
  end

  it 'adds the global resource to default registry' do
    eval_context.instance_eval(resource_content)
    Inspec::Resource.new_registry.keys.include?('another_resource').must_equal true
  end

end
