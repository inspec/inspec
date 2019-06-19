control 'start_marker' do
  describe('dummy_test_01') do
    it { should cmp 'dummy_test_01'}
  end
end

control 'undeclared_in_control_body' do
  input('undeclared_01')
  assignment_outcome = input('undeclared_02')
  describe('dummy_test_02') do
    it { should cmp 'dummy_test_02'}
  end
end

control 'undeclared_in_only_if' do
  only_if { input('undeclared_03') }
  describe('dummy_test_03') do
    it { should cmp 'dummy_test_03'}
  end
end

input('undeclared_04')

control 'end_marker' do
  describe('dummy_test_04') do
    it { should cmp 'dummy_test_04'}
  end
end
