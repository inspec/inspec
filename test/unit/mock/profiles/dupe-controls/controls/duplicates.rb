control 'dupe-01' do
  impact 1
  title 'dupe-01-title-one'
  desc 'default-one'
  description 'collision', 'one'
  description 'uniq-one', 'one'

  describe true do
    it { should eq true }
  end
end

control 'dupe-01' do
  impact 0
  title 'dupe-01-title-two'
  desc 'default-two'
  description 'collision', 'two'
  description 'uniq-two', 'two'

  describe true do
    it { should eq false }
  end
end