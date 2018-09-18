# encoding: utf-8

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::SecurityIdentifier' do
  it 'instantiates' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { user => 'Administrator' })
    _(resource).wont_be_nil
  end
end
