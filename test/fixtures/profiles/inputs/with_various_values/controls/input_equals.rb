title 'With various values'

control 'with equals sign' do
  describe input(:my_input) do
    it { should eq 'ab=cde' }
  end
end
