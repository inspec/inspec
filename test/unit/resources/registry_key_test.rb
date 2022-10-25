require "helper"
require "inspec/resource"
require "inspec/resources/registry_key"

describe "Inspec::Resources::RegistryKey" do
  it "read reg key with human readable name" do
    resource = MockLoader.new(:windows).load_resource("registry_key", "Task Scheduler", 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource.Start).must_equal 2
    _(resource.resource_id).must_equal "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\Schedule"
  end

  it "read reg key without human readable name" do
    resource_without_name = MockLoader.new(:windows).load_resource("registry_key", 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource_without_name.Start).must_equal 2
    _(resource_without_name.resource_id).must_equal "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\Schedule"
  end

  it "supports array syntax for keys with periods in them" do
    resource = MockLoader.new(:windows).load_resource("registry_key", 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource.send(:[], "key.with.period")).must_equal 12345
    _(resource.resource_id).must_equal "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\Schedule"
  end

  it "generates a proper path from options" do
    resource = MockLoader.new(:windows).load_resource(
      "registry_key",
      "Test 1",
      { hive: "my_hive", key: '\\my_prefixed_key' }
    )
    _(resource.send(:generate_registry_key_path_from_options)).must_equal 'my_hive\\my_prefixed_key'
    _(resource.resource_id).must_equal "my_hive\\my_prefixed_key"
  end

  it "generates a proper path from options when the key has no leading slash" do
    resource = MockLoader.new(:windows).load_resource(
      "registry_key",
      "Test 1",
      { hive: "my_hive", key: "key_with_no_slash" }
    )
    _(resource.send(:generate_registry_key_path_from_options)).must_equal 'my_hive\\key_with_no_slash'
    _(resource.resource_id).must_equal "my_hive\\key_with_no_slash"
  end

  it "returns user permissions values" do
    resource = MockLoader.new(:windows).load_resource("registry_key", 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    resource.stubs(:exist?).returns(true)
    resource.stubs(:user_permissions).returns({ "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" })
    _(resource.user_permissions).must_equal({ "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" })
    _(resource.resource_id).must_equal "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\Schedule"
  end

  it "returns true if file has inherit enabled on Windows." do
    resource = MockLoader.new(:windows).load_resource("registry_key", 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    resource.stubs(:exist?).returns(true)
    resource.stubs(:inherited?).returns(true)
    _(resource.inherited?).must_equal true
    _(resource.resource_id).must_equal "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\Schedule"
  end
end
