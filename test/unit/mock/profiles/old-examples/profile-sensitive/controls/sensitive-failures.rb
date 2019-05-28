describe 'bob' do
  it { should eq 'billy' }
end

describe 'sensitivepassword', :sensitive do
  it { should eq 'secret' }
end
