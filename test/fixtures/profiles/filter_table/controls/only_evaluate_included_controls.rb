control "foo" do
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "bar" do
  puts 'Control block executed'
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "baz" do
  puts 'Control block executed'
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end
