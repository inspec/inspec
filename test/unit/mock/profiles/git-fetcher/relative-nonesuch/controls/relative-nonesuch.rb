include_controls 'none-such-01'

control 'relative-nonesuch-01' do
  describe 'always-pass' do
    it { should cmp 'always-pass'}
  end
end