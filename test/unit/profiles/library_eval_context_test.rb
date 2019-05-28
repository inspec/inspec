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
EOF
  }

  let(:registry) { Inspec::Resource.new_registry }
  let(:eval_context) { Inspec::LibraryEvalContext.create(registry, nil) }

  it 'accepts a registry' do
    Inspec::LibraryEvalContext.create(registry, nil)
  end

  it 'adds the resource to our registry' do
    eval_context.instance_eval(resource_content)
    registry.keys.include?("my_test_resource").must_equal true
  end

  it 'adds nothing to the default registry' do
    old_default_registry = Inspec::Resource.default_registry.dup
    eval_context.instance_eval(resource_content)
    old_default_registry.must_equal Inspec::Resource.default_registry
  end

  it 'provides an inspec context for requiring local files' do
    eval_context.__inspec_binding.must_be_kind_of Binding
  end
end
