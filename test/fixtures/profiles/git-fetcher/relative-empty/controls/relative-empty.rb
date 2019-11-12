include_controls 'basic-local'

control 'relative-empty-01' do
  describe 'always-pass' do
    it { should cmp 'always-pass'}
  end
end