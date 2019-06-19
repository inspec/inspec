fixtures = {}
[
  'ec2_instance_recall_miss',
  'ec2_instance_centos_id',
  'ec2_instance_debian_id',  
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

#-------------------  Recall / Miss -------------------#
control "aws_ec_instances - Recall" do
  describe aws_ec2_instances do
    it { should exist }
  end
end

#------------------- Property instance_ids -------------#
control "aws_ec_instances - instance_ids property" do
  describe aws_ec2_instances do
    its('instance_ids') { should_not be_empty }
    its('instance_ids') { should include fixtures['ec2_instance_centos_id'] }
    its('instance_ids') { should include fixtures['ec2_instance_debian_id'] }
    its('instance_ids') { should_not include fixtures['ec2_instance_recall_miss'] }
    its('instance_ids') { should_not include nil }
  end
end
