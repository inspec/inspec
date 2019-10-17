if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

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
    its('protocols') { should include 'tcp' }
    its('addresses') {should include '0.0.0.0'}
  end
end
