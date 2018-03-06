fixtures = {}
[
  'ec2_security_group_default_vpc_id',
  'ec2_security_group_default_group_id',
  'ec2_security_group_alpha_group_id',
  'ec2_security_group_alpha_group_name',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

control "aws_security_group recall of default VPC" do

  describe aws_security_group(fixtures['ec2_security_group_default_group_id']) do
    it { should exist }
  end

  describe aws_security_group(group_name: 'default', vpc_id: fixtures['ec2_security_group_default_vpc_id']) do
    it { should exist }
  end

  describe aws_security_group(group_name: 'no-such-security-group') do
    it { should_not exist }
  end
end

control "aws_security_group properties" do
  # You should be able to find the default security group's ID.
  describe aws_security_group(fixtures['ec2_security_group_default_group_id']) do
    its('group_id') { should cmp fixtures['ec2_security_group_default_group_id'] }
  end

  describe aws_security_group(fixtures['ec2_security_group_alpha_group_id']) do
    its('group_name') { should cmp fixtures['ec2_security_group_alpha_group_name'] }
    its('vpc_id') { should cmp  fixtures['ec2_security_group_default_vpc_id'] }
    its('description') { should cmp 'SG alpha' }
  end

end
