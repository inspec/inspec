# author: Gary Bright
# author: Chris Beard
require 'helper'
require 'inspec/resource'

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
    _(resource.hostname).must_equal 'WINDOWSHOST'
    _(resource.taskname).must_equal 'TASK'
    _(resource.next_run_time).must_equal 'N\A'
    _(resource.status).must_equal 'Enabled'
    _(resource.last_run_time).must_equal 'N\A'
    _(resource.author).must_equal 'AUTHOR'
    _(resource.start_in).must_equal '%windir%'
    _(resource.comment).must_equal 'COMMENT'
    _(resource.idle_time).must_equal 'N\A'
    _(resource.power_management).must_equal 'Stop On Battery Mode'
    _(resource.delete_task_if_not_rescheduled).must_equal 'Disabled'
    _(resource.stop_task_if_runs).must_equal 'Disabled'
    _(resource.schedule_type).must_equal 'At logon time'
    _(resource.start_time).must_equal 'N\A'
    _(resource.start_date).must_equal 'N\A'
    _(resource.end_date).must_equal 'N\A'
    _(resource.days).must_equal 'N\A'
    _(resource.months).must_equal 'N\A'
    _(resource.repeat_every).must_equal 'N\A'
    _(resource.repeat_until_time).must_equal 'N\A'
    _(resource.repeat_until_duration).must_equal 'N\A'
    _(resource.repeat_stop_if_still_running).must_equal 'N\A'
    _(resource.type).must_equal 'windows-task'
    _(resource.to_s).must_equal "Windows Task 'WeLovePizza'"
  end
end
