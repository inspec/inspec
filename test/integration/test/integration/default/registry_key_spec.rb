# encoding: utf-8

if os.windows?

  describe registry_key('HKLM\System\Test') do
    it { should exist }
    it { should have_value('test') }
    it { should have_property('binary value', :binary) }
    it { should have_property('Binary value', :binary) }
    it { should have_property('string value') }
    it { should have_property('String value') }
    it { should have_property('dword value', :dword) }
    it { should have_property_value('multistring value', :multi_string, ['test', 'multi','string','data']) }
    it { should have_property_value('Multistring Value', :multi_string, ['test', 'multi','string','data']) }
    it { should have_property_value('qword value', :qword, 0) }
    it { should have_property_value('Qword value', :qword, 0) }
    it { should have_property_value('binary value', :binary, 'dfa0f066') }
    it { should have_property_value('Binary value', :binary, 'dfa0f066') }
  end

  # serverspec compatability
  describe windows_registry_key('HKLM\System\Test') do
    it { should exist }
    it { should have_value('test') }
    it { should have_property('string value') }
    it { should have_property('binary value', :type_binary) }
    it { should have_property('dword value', :type_dword) }
    it { should have_property_value('multistring value', :type_multistring, ['test', 'multi','string','data']) }
    it { should have_property_value('qword value', :type_qword, 0) }
    it { should have_property_value('binary value', :type_binary, 'dfa0f066') }
  end

  describe registry_key('HKLM\Software\Policies\Microsoft\Windows\EventLog\System') do
    it { should exist }
    its('MaxSize') { should_not eq nil }
  end

  describe registry_key('HKLM\System\CurrentControlSet\Control\Session Manager') do
    it { should exist }
    it { should_not have_property_value('SafeDllSearchMode', :type_dword, 0) }
    # case-insensitive test
    it { should_not have_property_value('safedllsearchmode', :type_dword, 0) }
  end

  describe registry_key('HKLM\System\CurrentControlSet\Services\LanManServer\Parameters') do
    it { should exist }
    its('NullSessionShares') { should eq [''] }
  end

  describe registry_key('HKLM\Software\Policies\Microsoft\Internet Explorer\Main') do
    it { should exist }
    its('Isolation64Bit') { should eq 1 }
    # check that its is case-insensitive
    its('isolation64bit') { should eq 1 }
  end

  describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services') do
    it { should exist }
    its('MinEncryptionLevel') { should eq 3 }
  end

  describe registry_key('HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0') do
    it { should exist }
    its('NTLMMinServerSec') { should eq 537_395_200 }
    its('NtlmMinServerSec') { should eq 537_395_200 }
  end
end
