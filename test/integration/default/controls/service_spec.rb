if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

# based on operating system we select the available service
if ['centos', 'fedora', 'freebsd', 'opensuse', 'suse'].include?(os[:family])
  # CentOS, Fedora
  unavailable_service = 'ssh'
  available_service = 'sshd'
elsif ['debian'].include?(os[:family])
  # Debian
  unavailable_service = 'clamav'
  available_service = 'ssh'
elsif ['ubuntu'].include?(os[:family])
  # Ubuntu
  unavailable_service = 'sshd'
  available_service = 'ssh'
elsif os.windows?
  # Ubuntu
  unavailable_service = 'sshd'
  available_service = 'dhcp'
elsif ['aix'].include?(os[:family])
  unavailable_service = 'clamav'
  available_service = 'xntpd'
elsif os.solaris?
  unavailable_service = 'clamav'
  available_service = 'ssh'
end

describe service(unavailable_service) do
  it { should_not be_enabled }
  it { should_not be_installed }
  it { should_not be_running }
end

describe service(available_service) do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

# extra test for ubuntu upstart with systemv service
if os[:family] == 'ubuntu' && os[:release] == '12.04'
  describe upstart_service('ssh') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

# extra tests for alt. runit on centos with runit_service
if os[:family] == 'centos' && os[:release].to_i >= 6
  describe runit_service('running-runit-service') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end

  describe runit_service('not-running-runit-service') do
    it { should be_enabled }
    it { should be_installed }
    it { should_not be_running }
  end

  describe runit_service('not-enabled-runit-service') do
    it { should_not be_enabled }
    it { should be_installed }
    it { should_not be_running }
  end

  # alt. ctl location
  describe runit_service('running-runit-service', '/opt/chef/embedded/sbin/sv') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end

  describe runit_service('unknown') do
    it { should_not be_enabled }
    it { should_not be_installed }
    it { should_not be_running }
  end

  describe upstart_service('upstart-running') do
    it { should_not be_enabled }
    it { should be_installed }
    it { should be_running }
  end

  describe upstart_service('upstart-enabled-and-running') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
    its('type') { should be 'upstart' }
    its('name') { should be 'upstart-enabled-and-running' }
    its('description') { should be nil }
  end

  describe upstart_service('upstart-enabled-not-running') do
    it { should be_enabled }
    it { should be_installed }
    it { should_not be_running }
  end

  describe upstart_service('unknown') do
    it { should_not be_enabled }
    it { should_not be_installed }
    it { should_not be_running }
    its('type') { should be nil }
  end
end

# extra tests for sys-v runlevels
if os[:family] == 'centos' && os[:release].to_i <= 6
  describe service('sshd').runlevels do
    its('keys') { should include(2) }
  end

  describe service('sshd').runlevels(2, 4) do
    it { should be_enabled }
  end

  describe service('sshd').runlevels(0, 1) do
    it { should_not be_enabled }
  end
end
