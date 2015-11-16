# encoding: utf-8

if os.unix?
  # check that ssh runs
  describe port(22) do
    it { should be_listening }
    its('protocol') { should include('tcp') }
  end
end
