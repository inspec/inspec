
control 'start_marker' do
  describe('dummy_test_01') do
    it { should cmp 'dummy_test_01'}
  end
end

discard_me = input('required_01')

control 'end_marker' do
  describe('dummy_test_04') do
    it { should cmp 'dummy_test_04'}
  end
end
