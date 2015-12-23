# encoding: utf-8

if os.unix?
  # check that ssh runs
  describe port(22) do
    it { should be_listening }
    its('protocols') { should include('tcp') }
    its('protocols') { should_not include('udp') }
    its('processes') { should include 'sshd' }
  end

  describe port(65432) do
    it { should_not be_listening }
  end
end
