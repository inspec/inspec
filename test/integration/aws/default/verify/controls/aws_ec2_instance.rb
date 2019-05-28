fixtures = {}
[
  'ec2_instance_recall_hit_id',
  'ec2_instance_recall_hit_name',
  'ec2_instance_recall_miss',
  'ec2_instance_no_role_id',
  'ec2_instance_has_role_id',
  'ec2_instance_type_t2_micro_id',
  'ec2_instance_type_t2_small_id',
  'ec2_instance_centos_id',
  'ec2_ami_id_centos',
  'ec2_instance_debian_id',  
  'ec2_ami_id_debian',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

#-------------------  Recall / Miss -------------------#
control "aws_ec_instance - Recall" do
  describe aws_ec2_instance(fixtures['ec2_instance_recall_miss']) do
    it { should_not exist }
  end

  # Recall by ID
  describe aws_ec2_instance(fixtures['ec2_instance_recall_hit_id']) do
    it { should exist }
  end

  # Recall by Name tag
  describe aws_ec2_instance(name: fixtures['ec2_instance_recall_hit_name']) do
    it { should exist }
  end
end

# TODO: Most properties are untested.  Some to consider including:
#   security_groups
#   state
#   vpc_id
#   tags


#----------------- has_role property ------------------#
control "aws_ec2_instance - has_role property" do

  describe aws_ec2_instance(fixtures['ec2_instance_has_role_id']) do
    it { should have_roles } # TODO: this is a misnomer, you may have only one role attached
  end

  describe aws_ec2_instance(fixtures['ec2_instance_no_role_id']) do  
    it { should_not have_roles } # TODO: this is a misnomer, you may have only one role attached
  end
end

#----------------- instance_type property ------------------#
control "aws_ec2_instance - instance_type property" do
  describe aws_ec2_instance(fixtures['ec2_instance_type_t2_micro_id']) do
    its('instance_type') { should eq 't2.micro' }
  end
  describe aws_ec2_instance(fixtures['ec2_instance_type_t2_small_id']) do
    its('instance_type') { should eq 't2.small' }
  end
end

#-------------------- image_id property --------------------#
control "aws_ec2_instance - image_id property" do
  describe aws_ec2_instance(fixtures['ec2_instance_centos_id']) do
    its('image_id') { should eq fixtures['ec2_ami_id_centos'] }
  end
  
  describe aws_ec2_instance(fixtures['ec2_instance_debian_id']) do
    its('image_id') { should eq fixtures['ec2_ami_id_debian'] }
  end
end