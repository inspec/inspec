control 'dupe-01' do
  impact 1
  title 'dupe-01-title-one'
  description 'something'

  desc 'collision', 'one'
  desc 'uniq-one', 'one'

  describe true do
    it { should eq false }
  end
end

control 'dupe-01' do
  impact 0
  title 'dupe-01-title-two'
  description 'something'

  desc 'collision', 'two'
  desc 'uniq-two', 'two'

  describe true do
    it { should eq true }
  end
end