fixtures = {}
[
  'auto_scaling_group_test_name',
  'launch_configuration_test_name',
  'subnet_01_id',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: 'See ../build/asg.tf',
  )
end

control 'aws_auto_scaling_group lookup' do
  
  asg_name = fixtures['auto_scaling_group_test_name']  

  # Search miss
  asg_name_non_existent = asg_name + "random"
  
  describe aws_auto_scaling_group(name: asg_name_non_existent) do
    it { should_not exist }
  end

  # Search hit
  describe aws_auto_scaling_group(name: asg_name) do
    it { should exist }
  end
end

control "aws_auto_scaling_group properties" do  
  describe aws_auto_scaling_group(name: fixtures['auto_scaling_group_test_name']) do
    its('name') { should eq 'TestASG' }
    its('launch_configuration_name') { should eq fixtures['launch_configuration_test_name']}
    its('max_size') { should be 5 }
    its('min_size') { should be 1 }
    its('desired_capacity') { should be 2 }

    its('vpc_zone_identifier') { should include fixtures['subnet_01_id']}
    its('tags') { should include({'key': 'Application', 'value': 'TestApplication', 'resource_type': 'auto-scaling-group', 'resource_id': fixtures['auto_scaling_group_test_name'], 'propagate_at_launch': true}) }
    its('tags') { should include({'key': 'Environment', 'value': 'Test', 'resource_type': 'auto-scaling-group', 'resource_id': fixtures['auto_scaling_group_test_name'], 'propagate_at_launch': true}) }
  
  end
end
