# encoding: utf-8

# based on operating system we select the available service
return unless os[:family] == 'centos'

describe auditd_rules.syscall('open') do
  its(:action) { should eq(['always']) }
end

describe auditd_rules.syscall('open').action do
  it { should eq(['always']) }
end

describe auditd_rules.key('sshd_config') do
  its(:permissions) { should contain_match(/x/) }
end

describe auditd_rules.file('/etc/ssh/sshd_config').permissions do
  it { should eq(['rwxa']) }
end

describe auditd_rules do
  its(:lines) { should contain_match(%r{-w /etc/ssh/sshd_config/}) }
end

describe auditd_rules.syscall('open').action('always').list do
  it { should eq(['exit']) }
end

describe auditd_rules.status('backlog') do
  it { should cmp 0 }
end
