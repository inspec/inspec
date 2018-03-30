fixtures = {}
%w[fl-vpc fl-subnet subnet_01_id ec2_security_group_default_vpc_id].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/flow_log.tf',
  )
end

control 'aws_flow_log flow_log_id exists' do
  describe aws_flow_log(flow_log_id: fixtures['fl-vpc']) do
    it { should exist }
    its('name') { should cmp fixtures['fl-vpc'] }
    its('log_group_name') { should cmp 'test_log_group' }
    its('resource_id') { should cmp fixtures['ec2_security_group_default_vpc_id'] }
  end
end

control 'aws_flow_log exists' do
  describe aws_flow_log(fixtures['fl-vpc']) do
    it { should exist}
  end
end

control 'aws_flow_log should not exist' do
  describe aws_flow_log(flow_log_id: 'fl-1122aabb') do
    it { should_not exist }
  end
end

control 'aws_flow_log search by subnet exists' do
  describe aws_flow_log(subnet_id: fixtures['subnet_01_id']) do
    it { should exist }
    its('name') { should cmp fixtures['fl-subnet'] }
    its('log_group_name') { should cmp 'test_log_group' }
    its('resource_id') { should cmp fixtures['subnet_01_id'] }
  end
end

control 'aws_flow_log search by vpc exists' do
  describe aws_flow_log(vpc_id: fixtures['ec2_security_group_default_vpc_id']) do
    it { should exist }
  end
end
