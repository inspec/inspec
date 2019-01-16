fixtures = {}
%w{
  subnet_vpc_id
  subnet_01_id
  subnet_01_az
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/ec2.tf"
  )
end

control "aws_subnet recall of subnet_01" do
  # Test hash given subnet_id
  describe aws_subnet(subnet_id: fixtures["subnet_01_id"]) do
    it { should exist }
  end

  # Test scalar works
  describe aws_subnet(fixtures["subnet_01_id"]) do
    it { should exist }
  end

  describe aws_subnet(subnet_id: "subnet-00000000") do
    it { should_not exist }
  end
end

control "aws_subnet properties of subnet_01" do
  describe aws_subnet(subnet_id: fixtures["subnet_01_id"]) do
    its("vpc_id") { should eq fixtures["subnet_vpc_id"] }
    its("subnet_id") { should eq fixtures["subnet_01_id"] }
    its("cidr_block") { should eq "172.31.48.0/28" }
    its("available_ip_address_count") { should eq 11 } # AWS Reserve 5
    its("availability_zone") { should eq fixtures["subnet_01_az"] }
    its("ipv_6_cidr_block_association_set") { should eq [] }
  end
end

control "aws_subnet matchers of subnet_01" do
  describe aws_subnet(subnet_id: fixtures["subnet_01_id"]) do
    it { should be_available }
    it { should_not be_mapping_public_ip_on_launch }
    it { should_not be_default_for_az }
    it { should_not be_assigning_ipv_6_address_on_creation }
  end
end
