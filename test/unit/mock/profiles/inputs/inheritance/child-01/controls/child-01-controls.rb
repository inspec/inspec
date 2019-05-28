control 'child-01-control-01' do
  describe attribute('test-01') do
    # This is an independent value, inheritance-child-01/test-01
    it { should cmp 'value-from-child-01-metadata' }
  end
end

control 'child-01-control-02' do
  describe attribute('test-02') do
    # This value was set by the wrapper, inheritance-child-01/test-02
    it { should cmp 'value-from-wrapper-metadata' }
  end
end