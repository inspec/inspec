# encoding: utf-8

# check that ssh runs
if os.unix?
  describe port(22) do
    it { should be_listening }
    its('protocols') { should include('tcp') }
    its('protocols') { should_not include('udp') }
  end

  describe port(65432) do
    it { should_not be_listening }
  end
end

# extra test for linux
if os.linux?
  describe port(22) do
    its('processes') { should include 'sshd' }
  end
end
