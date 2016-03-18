# encoding: utf-8
# author: Alex Pop
# author: Christoph Hartmann
#
# change a few Windows registry keys for testing purposes

if node['platform_family'] == 'windows'

  registry_key 'HKLM\System\Test' do
    values [{
      :name => '',
      :type => :string,
      :data => 'test'
    },{
      :name => 'string value',
      :type => :string,
      :data => nil
    },{
      :name => 'binary value',
      :type => :binary,
      :data => 'dfa0f066'
    },{
      :name => 'dword value',
      :type => :dword,
      :data => 0
    },{
      :name => 'qword value',
      :type => :qword,
      :data => 0
    },{
      :name => 'multistring value',
      :type => :multi_string,
      :data => ['test', 'multi','string','data']
    }]
    recursive true
    action :create
  end

  registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\System' do
    values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Control\Session Manager' do
    values [{ name: 'SafeDllSearchMode', type: :dword, data: 1 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
    values [{ name: 'NullSessionShares', type: :multi_string, data: [] }]
    recursive true
    action :create
  end

  registry_key 'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' do
    values [{ name: 'Isolation64Bit', type: :dword, data: 1 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
    values [{ name: 'MinEncryptionLevel', type: :dword, data: 3 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0' do
    values [{ name: 'NTLMMinServerSec', type: :dword, data: 537_395_200 }]
    recursive true
    action :create
  end
end
