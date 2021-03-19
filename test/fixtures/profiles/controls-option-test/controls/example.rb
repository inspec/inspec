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

describe 'a thing' do
  puts 'only-describe'
  it { should cmp 'a thing' }
end

