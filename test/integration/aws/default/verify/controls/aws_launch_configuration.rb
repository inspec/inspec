fixtures = {}
[
  'launch_configuration_test_name',
  'ec2_ami_id_debian',
  'ec2_security_group_alpha_group_id',
  'ec2_security_group_beta_group_id',
  'key_pair_test_name',
  'ec2_instance_iam_profile_name',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: 'See ../build/asg.tf',
  )
end

control 'aws_launch_configuration lookup' do
  
  lc_name = fixtures['launch_configuration_test_name']  

  # Search miss
  lc_name_non_existent = lc_name + "random"
  
  describe aws_launch_configuration(name: lc_name_non_existent) do
    it { should_not exist }
  end

  # Search hit
  describe aws_launch_configuration(name: lc_name) do
    it { should exist }
  end
end

control "aws_launch_configuration properties" do  
  describe aws_launch_configuration(name: fixtures['launch_configuration_test_name']) do
    its('name') { should eq 'TestLaunchConfiguration' }
    its('image_id') { should eq fixtures['ec2_ami_id_debian'] }
    its('instance_type') { should eq 't2.micro' }
    its('iam_instance_profile') { should eq fixtures['ec2_instance_iam_profile_name'] }
    its('key_name') { should eq fixtures['key_pair_test_name']}
    its('security_groups') { should include fixtures['ec2_security_group_alpha_group_id'] }
    its('security_groups') { should include fixtures['ec2_security_group_beta_group_id']}
    its('associate_public_ip_address') { should be false }
    its('user_data') { should include '#!/bin/bash'}
    its('ebs_optimized') { should be false }
    its('instance_monitoring') { should eq 'detailed' }
    its('spot_price') { should eq 0.1 }
  end
end