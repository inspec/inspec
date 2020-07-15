control '/foo must exit' do
  describe file('/foo') do
    it { should exist }
  end
end
