# encoding: utf-8

if ['centos', 'fedora', 'opensuse', 'debian', 'ubuntu'].include?(os[:family])
  describe package('curl') do
    it { should be_installed }
  end

  describe package('nginx') do
    it { should_not be_installed }
  end
end
