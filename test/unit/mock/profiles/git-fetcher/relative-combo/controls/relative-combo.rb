include_controls 'child-01'
include_controls 'child-02'

control 'relative-combo-01' do
  describe 'always-pass' do
    it { should cmp 'always-pass'}
  end
end