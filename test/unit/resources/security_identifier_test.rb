require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::SecurityIdentifier' do
  it 'returns a SID for an existing user' do
    resource = load_resource('security_identifier', { user: 'Alice' })
    _(resource.exist?).must_equal true
    _(resource.sid).must_equal 'S-1-5-21-1601936709-1892662786-3840804712-315762'
  end

  it 'returns nil for a non-existent  user' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { user: 'Bob' })
    _(resource.exist?).must_equal false
    _(resource.sid).must_be_nil
  end

    it 'returns a SID for an existing group' do
    resource = load_resource('security_identifier', { group: 'Guests' })
    _(resource.exist?).must_equal true
    _(resource.sid).must_equal 'S-1-5-32-546'
  end

  it 'returns nil for a non-existent group' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { group: 'DontExist' })
    _(resource.exist?).must_equal false
    _(resource.sid).must_be_nil
  end

  it 'returns a SID for an existing entity with type :unspecified' do
    resource = load_resource('security_identifier', { unspecified: 'Guests' })
    _(resource.exist?).must_equal true
    _(resource.sid).must_equal 'S-1-5-32-546'
  end

  it 'returns nil for a non-existent entity with type :unspecified' do
    resource = MockLoader.new(:windows).load_resource('security_identifier', { unspecified: 'DontExist' })
    _(resource.exist?).must_equal false
    _(resource.sid).must_be_nil
  end

  it 'raises ArgumentError for an unsupported type' do
    err = proc { MockLoader.new(:windows).load_resource('security_identifier', { yooser: 'Alice' }) }.must_raise ArgumentError
    err.message.must_equal 'Unsupported security_identifier options \'[:yooser]\'. Supported keys: #[supported_opt_keys]'
  end
end
