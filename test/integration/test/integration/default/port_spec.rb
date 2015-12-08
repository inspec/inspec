# encoding: utf-8

if os.unix?
  # check that ssh runs
  describe port(22) do
    it { should be_listening }
    its('protocols') { should include('tcp') }
  end
end
