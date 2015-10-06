# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::SecurityPolicy' do
  let(:resource) { load_resource('security_policy') }

  it 'verify processes resource' do
    _(resource.MaximumPasswordAge).must_equal 42
    _(resource.send('MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel')).must_equal '4,0'
    _(resource.SeUndockPrivilege).must_equal '*S-1-5-32-544'
    _(resource.SeRemoteInteractiveLogonRight).must_equal '*S-1-5-32-544,*S-1-5-32-555'
  end
end
