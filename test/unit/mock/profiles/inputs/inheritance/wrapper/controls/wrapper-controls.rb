# inheritance-child-01 is a simple dependency
include_controls('inheritance-child-01')

# inheritance-child-02 is an aliased dependency
include_controls('inheritance-child-02-aliased')

control 'wrapper-control-01' do
  describe attribute('test-01') do
    # This is an independent value, inheritance-wrapper/test-01
    it { should cmp 'value-from-wrapper-metadata' }
  end
  input_object('test-01')
end