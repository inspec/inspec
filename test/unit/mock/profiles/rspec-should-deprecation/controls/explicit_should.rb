control 'call-should-as-an-explicit-method' do
  describe 'It should work without issuing a deprecation warning' do
    it { 'a string'.should include 'ing' }
  end
end
