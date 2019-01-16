describe "working" do
  it { should eq "working" }
end

describe "skippy" do
  skip "This will be skipped intentionally."
end

describe "failing" do
  it { should eq "as intended" }
end
