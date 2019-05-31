family = os[:family]

# use symbol
describe os[:family] do
  it { should eq family }
end

# use string
describe os['family'] do
  it { should eq family }
end
