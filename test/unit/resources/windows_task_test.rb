require "helper"
require "inspec/resource"
require "inspec/resources/windows_task"

describe "Inspec::Resources::WindowsTasks" do
  it "can handle a Windows task that does not exist" do
    resource_fail = MockLoader.new(:windows).load_resource("windows_task", "does-not-exist")
    _(resource_fail.exists?).must_equal false
  end
  it "parses a windows task with one trigger correctly" do
    resource = MockLoader.new(:windows).load_resource("windows_task", "WeLovePizza")
    _(resource.enabled?).must_equal true
    _(resource.disabled?).must_equal false
    _(resource.logon_mode).must_equal "Interactive/Background"
    _(resource.last_result).must_equal "1056"
    _(resource.task_to_run).must_equal '%windir%\\system32\\sc.exe start w32time task_started'
    _(resource.run_as_user).must_equal "LOCAL SERVICE"
    _(resource.type).must_equal "windows-task"
    _(resource.to_s).must_equal "Windows Task 'WeLovePizza'"
  end
  it "parses a windows task with more than one trigger correctly" do
    resource = MockLoader.new(:windows).load_resource("windows_task", "WeLoveMultiplePizzas")
    _(resource.enabled?).must_equal true
    _(resource.disabled?).must_equal false
    _(resource.logon_mode).must_equal "Interactive/Background"
    _(resource.last_result).must_equal "1056"
    _(resource.task_to_run).must_equal '%windir%\\system32\\sc.exe start w32time task_started'
    _(resource.run_as_user).must_equal "LOCAL SERVICE"
    _(resource.type).must_equal "windows-task"
    _(resource.to_s).must_equal "Windows Task 'WeLoveMultiplePizzas'"
  end
end
