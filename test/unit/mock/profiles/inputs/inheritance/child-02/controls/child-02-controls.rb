control 'child-02-control-01' do
  describe attribute('test-03') do
    # This value was set by the wrapper via an alias, inheritance-child-02/test-02
    it { should cmp 'value-from-wrapper-metadata' }
  end
end