require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::OsEnv' do
  it 'verify env parsing' do
    resource = load_resource('os_env', 'PATH')
    _(resource.split).must_equal %w{/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin}
  end

  it 'read env variable on Windows' do
    resource = MockLoader.new(:windows).load_resource('os_env', 'PATH')
    _(resource.split).must_equal ['C:\Windows\system32', 'C:\Windows', 'C:\Windows\System32\Wbem', 'C:\Windows\System32\WindowsPowerShell\v1.0\\', 'C:\opscode\chef\bin\\']
  end
end
