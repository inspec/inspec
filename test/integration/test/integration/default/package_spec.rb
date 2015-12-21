# encoding: utf-8

case os[:family]
when 'centos', 'fedora', 'opensuse', 'debian', 'ubuntu'
  describe package('curl') do
    it { should be_installed }
  end
when 'aix'
  describe package('bos.rte') do
    it { should be_installed }
    its('version') { should match /^(6|7)\.1[.|\d]+\d/ }
  end
end

describe package('nginx') do
  it { should_not be_installed }
end
