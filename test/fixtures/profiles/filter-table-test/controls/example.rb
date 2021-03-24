describe dummy([{'name' => 'foo'}]).valid? do
  it { should eq '' }
end

describe dummy([{'name' => 'foo'}]) do
  its('valid?') { should eq '' }
end

describe dummy([{'name' => 'foo'}]) do
  it { should be_valid }
end
