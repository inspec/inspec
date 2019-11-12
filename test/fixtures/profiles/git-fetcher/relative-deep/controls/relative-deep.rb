include_controls 'child-02'

control 'relative-deep-01' do
  describe 'always-pass' do
    it { should cmp 'always-pass'}
  end
end