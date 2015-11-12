# encoding: utf-8

if os[:family] == 'windows'
  # rule 'windows-audit-103' do
  # title 'Configure System Event Log (System)'
  describe registry_key('HKLM\Software\Policies\Microsoft\Windows\EventLog\System') do
    it { should exist }
    its('MaxSize') { should_not eq nil }
  end

  # rule 'windows-base-101' do
  # title 'Safe DLL Search Mode is Enabled'
  describe registry_key('HKLM\System\CurrentControlSet\Control\Session Manager') do
    it { should exist }
    it { should_not have_property_value('SafeDllSearchMode', :type_dword, '0') }
  end

  # rule 'windows-base-103'
  # title 'All Shares are Configured to Prevent Anonymous Access'
  describe registry_key('HKLM\System\CurrentControlSet\Services\LanManServer\Parameters') do
    it { should exist }
    its('NullSessionShares') { should eq nil }
  end

  # rule 'windows-ie-101'
  # title 'IE 64-bit tab'
  describe registry_key('HKLM\Software\Policies\Microsoft\Internet Explorer\Main') do
    it { should exist }
    its('Isolation64Bit') { should eq 1 }
  end

  # rule 'windows-rdp-101'
  # title 'Strong Encryption for Windows Remote Desktop Required'
  describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services') do
    it { should exist }
    its('MinEncryptionLevel') { should eq 3 }
  end
end
