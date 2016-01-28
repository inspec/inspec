# encoding: utf-8

case os[:family]
when 'centos', 'fedora', 'opensuse', 'debian', 'ubuntu'
  describe package('curl') do
    it { should be_installed }
  end
when 'aix'
  describe package('bos.rte') do
    it { should be_installed }
    its('version') { should match /^(6|7)[.|\d]+\d$/ }
  end
when 'solaris'

  if os[:release] == '11'
    pkg = 'system/file-system/zfs'
    ver = /^0\.5.+$/
  else
    pkg = 'SUNWzfsr'
    ver = /^11\.10.+$/
  end

  describe package(pkg) do
    it { should be_installed }
    its('version') { should match ver }
  end


end

describe package('nginx') do
  it { should_not be_installed }
end
