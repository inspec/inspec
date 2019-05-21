
require 'helper'

describe 'Inspec::Resources::RegistryKey' do
  it 'read reg key with human readable name' do
    resource = MockLoader.new(:windows).load_resource('registry_key', 'Task Scheduler', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource.Start).must_equal 2
  end

  it 'read reg key without human readable name' do
    resource_without_name = MockLoader.new(:windows).load_resource('registry_key', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource_without_name.Start).must_equal 2
  end

  it 'supports array syntax for keys with periods in them' do
    resource = MockLoader.new(:windows).load_resource('registry_key', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource.send(:[], "key.with.period")).must_equal 12345
  end

  it 'generates a proper path from options' do
    resource = MockLoader.new(:windows).load_resource(
      'registry_key',
      'Test 1',
      { hive: 'my_hive', key: '\\my_prefixed_key'},
    )
    _(resource.send(:generate_registry_key_path_from_options)).must_equal 'my_hive\\my_prefixed_key'
  end

  it 'generates a proper path from options when the key has no leading slash' do
    resource = MockLoader.new(:windows).load_resource(
      'registry_key',
      'Test 1',
      { hive: 'my_hive', key: 'key_with_no_slash'},
    )
    _(resource.send(:generate_registry_key_path_from_options)).must_equal 'my_hive\\key_with_no_slash'
  end

end
