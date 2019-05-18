
unless os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
  return
end

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

describe registry_key('HKLM\Missing\In\Action') do
  it { should_not exist }
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

describe registry_key('HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0') do
  it { should exist }
  its('NTLMMinServerSec') { should eq 537_395_200 }
  its('NtlmMinServerSec') { should eq 537_395_200 }
end

describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services') do
  it { should exist }
  its('MinEncryptionLevel') { should eq 3 }
end

# test option hash
describe registry_key({
  hive: 'HKLM',
  key: 'SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
}) do
  it { should exist }
  its('MinEncryptionLevel') { should eq 3 }
end

describe registry_key({
  hive: 'HKEY_LOCAL_MACHINE',
  key: 'SOFTWARE\Microsoft\SystemCertificates\Root\Certificates\8C941B34EA1EA6ED9AE2BC54CF687252B4C9B561'
}) do
  it { should exist }
end

# test regular expressions in our match
describe registry_key({
  hive: 'HKEY_LOCAL_MACHINE',
  key: 'SOFTWARE\Microsoft\Windows NT\CurrentVersion'
}) do
  its('ProductName') { should match /^[a-zA-Z0-9\(\)\s]*2012\s[rR]2[a-zA-Z0-9\(\)\s]*$/ }
end

# verify all children via a regular expression
control 'regex-test' do
  title "Ensure 'Always install with elevated privileges' is set to 'Disabled'"
  children = registry_key({
    hive: 'HKEY_USERS'
  }).children(/^S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]{3,}\\Software\\Policies\\Microsoft\\Windows\\Installer/)
  describe children do
    it { should_not eq []}
  end
  children.each { |key|
    describe registry_key(key) do
      its('AlwaysInstallElevated') { should cmp 0 }
    end
  }
end

# test key without leading slash
describe registry_key({
  hive: 'HKLM',
  key:  'System\Test',
}) do
  it { should exist }
  it { should have_value('test') }
end

# test key with leading slash
describe registry_key({
  hive: 'HKLM',
  key:  '\System\Test',
}) do
  it { should exist }
  it { should have_value('test') }
end

describe registry_key('HKLM\System\Test') do
  it { should exist }
  its('super\/escape') { should eq '\/value/\\' }
  its('big dword value') { should eq 2147483648}

  # its('key.with.dot') { should eq 'value.with.dot' }
  # does not work due to the . inside the its block
  # see https://github.com/chef/inspec/issues/1281
  # use the following solution:
  it { should have_property_value('key.with.dot', :string, 'value.with.dot') }
end
