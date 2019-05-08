# This should simply not error
unless attribute('test-01', value: 'test-01') == 'test-01'
  raise 'Failed bare input access'
end

describe attribute('test-02', value: 'test-02') do
  it { should cmp 'test-02' }
end

describe 'mentioning an input in a bare describe block as a redirected subject' do
  subject { attribute('test-03', value: 'test-03') }
  it { should cmp 'test-03' }
end

control 'test using an input inside a control block as the describe subject' do
  describe attribute('test-04', value: 'test-04') do
    it { should cmp 'test-04' }
  end
end

control "test using inputs in the test its block" do
  describe 'test-05' do
    it { should cmp attribute('test-05', value: 'test-05') }
  end
end

# TODO: add test for OR
