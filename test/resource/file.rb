
describe file('/tmp') do
  its(:type) { should eq :directory }
end
