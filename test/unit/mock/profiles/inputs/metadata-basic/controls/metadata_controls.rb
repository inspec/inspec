control 'test_control_01' do
  describe attribute('test_01') do
    it { should cmp 'test_value_01' }
  end
end