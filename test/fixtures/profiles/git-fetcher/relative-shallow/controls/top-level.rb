include_controls 'child-01'

control 'top-level-01' do
  describe 'always-pass' do
    it { should cmp 'always-pass'}
  end
end