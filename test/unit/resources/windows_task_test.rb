require 'helper'

describe 'Inspec::Resources::WindowsTasks' do
  it 'verify parsing a windows task that does not exist' do
    resource_fail = MockLoader.new(:windows).load_resource('windows_task', 'does-not-exist')
    _(resource_fail.exists?).must_equal false
  end
  it 'verify parsing a windows task which is valid' do
    resource = MockLoader.new(:windows).load_resource('windows_task', 'WeLovePizza')
    _(resource.enabled?).must_equal true
    _(resource.disabled?).must_equal false
    _(resource.logon_mode).must_equal 'Interactive/Background'
    _(resource.last_result).must_equal '1056'
    _(resource.task_to_run).must_equal '%windir%\\system32\\sc.exe start w32time task_started'
    _(resource.run_as_user).must_equal 'LOCAL SERVICE'
    _(resource.type).must_equal 'windows-task'
    _(resource.to_s).must_equal "Windows Task 'WeLovePizza'"
  end
end
