#
# change a few Windows registry keys for testing purposes

if node["platform_family"] == "windows"

  registry_key 'HKLM\System\Test' do
    values [{
      name: "",
      type: :string,
      data: "test",
    }, {
      name: "string value",
      type: :string,
      data: nil,
    }, {
      name: "binary value",
      type: :binary,
      data: "dfa0f066",
    }, {
      name: "dword value",
      type: :dword,
      data: 0,
    }, {
      name: "big dword value",
      type: :dword,
      data: 2147483648,
    }, {
      name: "qword value",
      type: :qword,
      data: 0,
    }, {
      name: "multistring value",
      type: :multi_string,
      data: %w{test multi string data},
    }, {
      name: 'super\/escape',
      type: :string,
      data: '\/value/\\',
    }, {
      name: "key.with.dot",
      type: :string,
      data: "value.with.dot",
    }]
    recursive true
    action :create
  end

  registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\System' do
    values [{ name: "MaxSize", type: :dword, data: 67_108_864 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Control\Session Manager' do
    values [{ name: "SafeDllSearchMode", type: :dword, data: 1 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
    values [{ name: "NullSessionShares", type: :multi_string, data: [] }]
    recursive true
    action :create
  end

  registry_key 'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' do
    values [{ name: "Isolation64Bit", type: :dword, data: 1 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
    values [{ name: "MinEncryptionLevel", type: :dword, data: 3 }]
    recursive true
    action :create
  end

  registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0' do
    values [{ name: "NTLMMinServerSec", type: :dword, data: 537_395_200 }]
    recursive true
    action :create
  end

  # used to verify pattern test
  ::Chef::Recipe.send(:include, Chef::Mixin::PowershellOut)
  cmd = powershell_out!("Get-WmiObject -Class Win32_UserAccount | % { $_.SID } | ConvertTo-Json")
  sids = JSON.parse(cmd.stdout)
  sids.each do |sid|
    registry_key "HKEY_USERS\\#{sid}\\Software\\Policies\\Microsoft\\Windows\\Installer" do
      values [{ name: "AlwaysInstallElevated", type: :dword, data: 0 }]
      recursive true
      ignore_failure true # ignore users that have not been logged in
      action :create
    end
  end
end
