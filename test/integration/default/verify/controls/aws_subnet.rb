fixtures = {}
[
  'ec2_security_group_default_vpc_id',
  'ec2_default_vpc_subnet_01_id',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

control "aws_subnet recall of subnet_01" do
  # Test hash given subnet_id
  describe aws_subnet(subnet_id: fixtures['ec2_default_vpc_subnet_01_id']) do
    it { should exist }
  end
  
  # Test scalar works
  describe aws_subnet(fixtures['ec2_default_vpc_subnet_01_id']) do
    it { should exist }
  end

  describe aws_subnet(subnet_id: 'subnet-00000000') do
    it { should_not exist }
  end
end

control "aws_subnet properties of subnet_01" do
  describe aws_subnet(subnet_id: fixtures['ec2_default_vpc_subnet_01_id']) do
    its('vpc_id') { should eq fixtures['ec2_security_group_default_vpc_id'] }
    its('subnet_id') { should eq fixtures['ec2_default_vpc_subnet_01_id'] }
    its('cidr_block') { should eq '172.31.96.0/20' }
    its('available_ip_address_count') { should eq 4091 }
    its('availability_zone') { should eq 'us-east-1c' }
    its('ipv_6_cidr_block_association_set') { should eq [] }
  end
end

control "aws_subnet matchers of subnet_01" do
  describe aws_subnet(subnet_id: fixtures['ec2_default_vpc_subnet_01_id']) do
    it { should be_available }
    it { should_not be_mapping_public_ip_on_launch }
    it { should_not be_default_for_az }
    it { should_not be_assigning_ipv_6_address_on_creation }
  end
end
