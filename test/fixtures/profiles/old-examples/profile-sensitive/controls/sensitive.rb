describe 'bob' do
  it { should eq 'bob' }
end

describe 'sensitivepassword', :sensitive do
  it { should eq 'sensitivepassword' }
end
