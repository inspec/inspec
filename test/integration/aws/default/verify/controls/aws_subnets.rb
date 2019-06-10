fixtures = {}
[
  'subnet_01_id',
  'subnet_vpc_id',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

control "aws_subnets recall" do
  all_subnets = aws_subnets
  
  # You should be able to get a specific subnet given its id
  describe all_subnets.where(subnet_id: fixtures['subnet_01_id']) do
    it { should exist }
  end

  # You should be able to get subnets given a vpc_id
  describe all_subnets.where(vpc_id: fixtures['subnet_vpc_id']) do
    it { should exist }
  end

  describe all_subnets.where(vpc_id: 'vpc-00000000') do
    it { should_not exist }
  end

  describe all_subnets.where(subnet_id: 'subnet-00000000') do
    it { should_not exist }
  end
end

control "aws_subnets properties by subnet id" do
  # you should be able to test the cidr_block of a subnet
  describe aws_subnets.where(subnet_id: fixtures['subnet_01_id']) do
    its('cidr_blocks') { should include '172.31.48.0/28' }
    its('states') { should_not include 'pending' }
  end
end

control "aws_subnets properties by vpc_id" do
  # you should be able to test the cidr_block of a subnet
  describe aws_subnets.where(vpc_id: fixtures['subnet_vpc_id']) do
    its('cidr_blocks') { should include '172.31.48.0/28' }
    its('states') { should include 'available' }
  end
end
