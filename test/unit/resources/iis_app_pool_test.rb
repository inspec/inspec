
require 'helper'

describe 'Inspec::Resources::IisAppPool' do
  it 'verify default app pool settings' do
    resource = MockLoader.new(:windows).load_resource('iis_app_pool', 'DefaultAppPool')
    _(resource.send('to_s')).must_equal 'IIS App Pool \'DefaultAppPool\''
    _(resource.send('pool_name')).must_equal 'DefaultAppPool'
    _(resource.send('runtime_version')).must_equal 'v4.0'
    _(resource.send('enable32bit')).must_equal true
    _(resource.send('pipeline_mode')).must_equal 'Classic'
    _(resource.send('max_processes')).must_equal 2
    _(resource.send('timeout')).must_equal '0:0:0'
    _(resource.send('timeout_days')).must_equal 0
    _(resource.send('timeout_hours')).must_equal 0
    _(resource.send('timeout_minutes')).must_equal 0
    _(resource.send('timeout_seconds')).must_equal 0
    _(resource.send('user_identity_type')).must_equal 'SpecificUser'
    _(resource.send('username')).must_include 'vagrant'
    _(resource.send('exists?')).must_equal true
  end
end
