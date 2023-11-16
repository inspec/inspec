require "helper"
require "inspec/resource"
require "inspec/resources/security_policy"

describe "Inspec::Resources::SecurityPolicy" do
  it "verify processes resource" do
    resource = load_resource("security_policy")
    Process.expects(:pid).returns("abc123")

    _(resource.MaximumPasswordAge).must_equal 42
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_equal "4,0"
    _(resource.SeUndockPrivilege).must_equal ["S-1-5-32-544"]
    _(resource.SeRemoteInteractiveLogonRight).must_equal ["S-1-5-32-544", "S-1-5-32-555"]
    _(resource.SeServiceLogonRight).must_equal %w{ DB2ADMNS db2admin }
    _(resource.LockoutDuration).must_equal "-1"
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount')).must_equal "1,\"10\""
    _(resource.send('MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec')).must_equal "4,536870912"
    _(resource.NewAdministratorName).must_equal "Administrator"
    _(resource.NewGuestName).must_equal "Guest"
    _(resource.RequireLogonToChangePassword).must_equal 0
    _(resource.resource_id).must_equal "Security Policy"
  end

  it "parse empty policy file" do
    resource = load_resource("security_policy")
    Process.expects(:pid).returns("abc123")
    backend = resource.inspec.backend
    backend.commands["Get-Content win_secpol-abc123.cfg"] = backend.mock_command("", "", "", 0)

    _(resource.MaximumPasswordAge).must_be_nil
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_be_nil
    _(resource.SeUndockPrivilege).must_equal []
    _(resource.SeRemoteInteractiveLogonRight).must_equal []
  end

  it "verify sids are successfully translated or returned SID" do
    resource = load_resource("security_policy", translate_sid: true)
    Process.expects(:pid).returns("abc123")

    _(resource.MaximumPasswordAge).must_equal 42
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_equal "4,0"
    _(resource.SeUndockPrivilege).must_equal ["BUILTIN\\Administrators"]
    _(resource.SeRemoteInteractiveLogonRight).must_equal ["BUILTIN\\Administrators", "S-1-5-32-555"]
    _(resource.SeServiceLogonRight).must_equal %w{ DB2ADMNS db2admin }
  end
end
