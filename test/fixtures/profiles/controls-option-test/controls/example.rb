# copyright: 2018, The Authors

control "foo" do
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "bar" do
  puts 'bar'
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "baz" do
  puts 'baz'
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "11_pass" do
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end

control "11_pass2" do
  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end