# encoding: utf-8

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::SecurityIdentifier' do
  it 'returns a SID for a known user' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { user: 'Alice' })
    _(resource.exist?).must_equal true
    _(resource.pid).must_equal 'S-1-5-21-1601936709-1892662786-3840804712-315762'
  end

  it 'returns nil for an unknown user' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { user: 'Bob' })
    _(resource.exist?).must_equal false
    _(resource.pid).must_be_nil
  end
end
