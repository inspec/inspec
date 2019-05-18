
unless os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
  return
end

# Get-WmiObject win32_service or Get-WmiObject -class win32_service
# returns an array of service objects
describe wmi({class: 'win32_service'}) do
  its('DisplayName') { should include 'Windows Remote Management (WS-Management)'}
end

# Use win32_service with filter, it returns a single service object
describe wmi({
  class: 'win32_service',
  filter: 'name like "%winrm%"'
}) do
  its('Status') { should cmp 'ok' }
  its('State') { should cmp 'Running' }
  its('ExitCode') { should cmp 0 }
  its('DisplayName') { should eq 'Windows Remote Management (WS-Management)'}
end

# TODO: this works on domain controllers only
describe wmi({
  class: 'RSOP_SecuritySettingNumeric',
  namespace: 'root\\rsop\\computer',
  filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
}) do
   its('Setting') { should eq 1 }
end

# new syntax
describe wmi({
  namespace: 'root\rsop\computer',
  query: "SELECT Setting FROM RSOP_SecuritySettingBoolean WHERE KeyName='LSAAnonymousNameLookup' AND Precedence=1"
}) do
  its('Setting') { should eq false }
end

describe wmi({
  namespace: 'root\cimv2',
  query: 'SELECT filesystem FROM win32_logicaldisk WHERE drivetype=3'
}).params.values.join do
  it { should eq 'NTFS' }
end

# deprecated syntax
describe wmi('win32_service') do
  its('DisplayName') { should include 'Windows Remote Management (WS-Management)'}
end

describe wmi('RSOP_SecuritySettingNumeric', {
  namespace: 'root\\rsop\\computer',
  filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
}) do
   its('Setting') { should eq 1 }
   its('setting') { should eq 1 }
end

describe wmi('win32_service', {
  filter: "name like '%winrm%'"
}) do
  its('DisplayName') { should eq 'Windows Remote Management (WS-Management)'}
end
