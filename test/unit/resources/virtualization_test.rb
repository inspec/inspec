# encoding: utf-8

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Virtualization' do
  let(:resource) { MockLoader.new(:ubuntu).load_resource('virtualization') }

  it 'skips the resource if OS is not Linux' do
    resource = MockLoader.new(:windows).load_resource('virtualization')
    resource.resource_skipped?.must_equal true
  end

  it 'returns nil for all properties if no virutalization platform is found' do
    resource.system.must_be_nil
    resource.role.must_be_nil
  end
end
