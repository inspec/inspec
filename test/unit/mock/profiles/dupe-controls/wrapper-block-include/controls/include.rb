include_controls 'child' do
  control 'control-01' do
    title 'title set in wrapper-block-include, inside the block'
  end
end

control 'control-01' do
  title 'the title set in wrapper-block-include, outside the block'
  describe 'describe-01' do
    it { should include '01' }
  end
end