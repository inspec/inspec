fixtures = {}
%w{
  aws_region
  elb_subnet_a_id
  elb_subnet_c_id
  elb_alpha_name
  elb_alpha_dns_name
  elb_beta_name
  elb_beta_dns_name
  elb_beta_instance_1_id
  elb_beta_instance_2_id
  elb_security_group_to_instances_id
  elb_security_group_to_lb_id
  elb_vpc_id
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/ec2.tf"
  )
end

#-------------------  Search / Recall -------------------#
control "aws_elb - search" do
  describe aws_elb(fixtures["elb_alpha_name"]) do
    it { should exist }
  end
  describe aws_elb(elb_name: fixtures["elb_beta_name"]) do
    it { should exist }
  end
  describe aws_elb("nonesuch") do
    it { should_not exist }
  end
end

# #------------------- Properties -------------#
control "aws_elb properties" do

  describe aws_elb(fixtures["elb_alpha_name"]) do
    its("availability_zones") { should include fixtures["aws_region"] + "a" }
    its("availability_zones.count") { should cmp 1 }
    its("dns_name") { should match /elb\.amazonaws\.com$/ }
    its("external_ports") { should include 80 }
    its("external_ports.count") { should cmp 1 }
    its("instance_ids") { should be_empty }
    its("internal_ports") { should include 8080 }
    its("internal_ports.count") { should cmp 1 }
    its("security_group_ids") { should include fixtures["elb_security_group_to_lb_id"] }
    its("security_group_ids.count") { should cmp 1 }
    its("subnet_ids") { should include fixtures["elb_subnet_a_id"] }
    its("subnet_ids.count") { should cmp 1 }
    its("vpc_id") { should cmp fixtures["elb_vpc_id"] }
  end

  describe aws_elb(fixtures["elb_beta_name"]) do
    its("availability_zones") { should include fixtures["aws_region"] + "a" }
    its("availability_zones") { should include fixtures["aws_region"] + "c" }
    its("availability_zones.count") { should cmp 2 }
    its("dns_name") { should match /elb\.amazonaws\.com$/ }
    its("external_ports") { should include 80 }
    its("external_ports.count") { should cmp 1 }
    its("instance_ids") { should include fixtures["elb_beta_instance_1_id"] }
    its("instance_ids") { should include fixtures["elb_beta_instance_2_id"] }
    its("instance_ids.count") { should cmp 2 }
    its("internal_ports") { should include 80 }
    its("internal_ports.count") { should cmp 1 }
    its("security_group_ids") { should include fixtures["elb_security_group_to_lb_id"] }
    its("security_group_ids.count") { should cmp 1 }
    its("subnet_ids") { should include fixtures["elb_subnet_a_id"] }
    its("subnet_ids") { should include fixtures["elb_subnet_c_id"] }
    its("subnet_ids.count") { should cmp 2 }
    its("vpc_id") { should cmp fixtures["elb_vpc_id"] }
  end

  describe aws_elb("nonesuch") do
    its("availability_zones") { should be_empty }
    its("dns_name") { should be_nil }
    its("external_ports") { should be_empty }
    its("instance_ids") { should be_empty }
    its("internal_ports") { should be_empty }
    its("security_group_ids") { should be_empty }
    its("subnet_ids") { should be_empty }
    its("vpc_id") { should be_nil }
  end
end
