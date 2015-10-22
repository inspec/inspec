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
else
  # Ubuntu, Freebsd, Debian
  unavailable_service = 'sshd'
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
