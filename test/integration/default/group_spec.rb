# encoding: utf-8

# test root group on linux
if os.linux?
  describe group('root') do
    it { should exist }
    its('gid') { should eq 0 }
  end

  describe group('noroot') do
    it { should_not exist }
    its('gid') { should eq nil }
  end
end

if os[:family] == 'freebsd'

  describe group('wheel') do
    it { should exist }
    its('gid') { should eq 0 }
  end

  describe group('root') do
    it { should_not exist }
    its('gid') { should eq nil }
  end

  describe group('noroot') do
    it { should_not exist }
    its('gid') { should eq nil }
  end
end
