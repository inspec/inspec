fixtures = {}
[
  'ec2_security_group_default_vpc_id',
  'ec2_security_group_default_group_id',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

control "aws_security_groups client-side filtering" do
  all_groups = aws_security_groups

  # You should always have at least one security group
  describe all_groups do
    it { should exist }
  end

  # You should be able to find a security group in the default VPC
  describe all_groups.where(vpc_id: fixtures['ec2_security_group_default_vpc_id']) do
    it { should exist }
  end
  describe all_groups.where(vpc_id: 'vpc-12345678') do
    it { should_not exist }
  end

  # You should be able to find the security group named default
  describe all_groups.where(group_name: 'default') do
    it { should exist }
  end
  describe all_groups.where(group_name: 'no-such-security-group') do
    it { should_not exist }
  end
end

control "aws_security_groups properties" do
  # You should be able to find the default security group's ID.
  describe aws_security_groups.where(vpc_id: fixtures['ec2_security_group_default_vpc_id']) do
    its('group_ids') { should include fixtures['ec2_security_group_default_group_id'] }
  end
end

control "aws_security_groups" do
  # Verify you have more than the default security group
  describe aws_security_groups do
    its('entries.count') { should be >= 2 }
  end
end
