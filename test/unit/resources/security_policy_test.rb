
require 'helper'

describe 'Inspec::Resources::SecurityPolicy' do
  it 'verify processes resource' do
    resource = load_resource('security_policy')
    Process.expects(:pid).returns('abc123')

    _(resource.MaximumPasswordAge).must_equal 42
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_equal '4,0'
    _(resource.SeUndockPrivilege).must_equal ["S-1-5-32-544"]
    _(resource.SeRemoteInteractiveLogonRight).must_equal ["S-1-5-32-544","S-1-5-32-555"]
  end

  it 'parse empty policy file' do
    resource = load_resource('security_policy')
    Process.expects(:pid).returns('abc123')
    backend = resource.inspec.backend
    backend.commands['Get-Content win_secpol-abc123.cfg'] = backend.mock_command('', '', '', 0)

    _(resource.MaximumPasswordAge).must_be_nil
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_be_nil
    _(resource.SeUndockPrivilege).must_equal []
    _(resource.SeRemoteInteractiveLogonRight).must_equal []
  end

  it 'verify sids are successfully translated or returned SID' do
    resource = load_resource('security_policy', translate_sid: true)
    Process.expects(:pid).returns('abc123')

    _(resource.MaximumPasswordAge).must_equal 42
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_equal '4,0'
    _(resource.SeUndockPrivilege).must_equal ["BUILTIN\\Administrators"]
    _(resource.SeRemoteInteractiveLogonRight).must_equal ["BUILTIN\\Administrators","S-1-5-32-555"]
  end
end
