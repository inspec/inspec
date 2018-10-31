include_controls 'child'

control 'control-01' do
  title 'the title set in wrapper-simple-include'
<<<<<<< HEAD
  description 'something'
=======
>>>>>>> Get functional tests passing; ensure inheritance does not trip duplicate warning
  describe 'describe-01' do
    it { should include '01' }
  end
end