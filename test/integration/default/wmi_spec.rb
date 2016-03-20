# encoding: utf-8

# Get-WmiObject win32_service
# Get-WmiObject -class win32_service
# returns an array of service objects
describe wmi('win32_service') do
  its(['Path','ClassName']) { should include 'Win32_Service' }
  its('DisplayName') { should include 'Windows Remote Management (WS-Management)'}
end

# Use win32_service with filter
# this returns a single service object
describe wmi('win32_service', {
  filter: "name like '%winrm%'"
}) do
  its(['Path','ClassName']) { should eq 'Win32_Service' }
  its('DisplayName') { should eq 'Windows Remote Management (WS-Management)'}
end

# TODO: this works on domain controllers only
describe wmi('RSOP_SecuritySettingNumeric', {
  namespace: 'root\\rsop\\computer',
  filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
}) do
   its('Setting') { should eq 1 }
end
