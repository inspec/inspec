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
