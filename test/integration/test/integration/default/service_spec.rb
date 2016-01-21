# encoding: utf-8

# based on operating system we select the available service
if ['centos', 'fedora', 'freebsd', 'opensuse'].include?(os[:family])
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
elsif ['windows'].include?(os[:family])
  # Ubuntu
  unavailable_service = 'sshd'
  available_service = 'dhcp'
elsif ['aix'].include?(os[:family])
  unavailable_service = 'clamav'
  available_service = 'xntpd'
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
if os[:family] == 'ubuntu'
  describe service('ntp') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

# extra tests for alt. runit on centos with runit_service
if os[:family] == 'centos'
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
end
