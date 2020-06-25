control 'The letter a' do
  impact 0.7
  title 'The letter a'
  desc 'It is very important that the letter a works correctly.'
  describe 'a' do
    it { should cmp 'a' }
  end
end