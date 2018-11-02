include_controls 'child'

control 'control-01' do
  title 'the title set in wrapper-simple-include'
  description 'something'
  describe 'describe-01' do
    it { should include '01' }
  end
end