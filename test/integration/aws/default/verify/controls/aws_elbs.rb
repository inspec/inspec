fixtures = {}
[
  'aws_region',
  'elb_subnet_a_id',
  'elb_subnet_c_id',
  'elb_alpha_name',
  'elb_alpha_dns_name',
  'elb_beta_name',
  'elb_beta_dns_name',
  'elb_beta_instance_1_id',
  'elb_beta_instance_2_id',
  'elb_security_group_to_instances_id',
  'elb_security_group_to_lb_id',
  'elb_vpc_id',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

#-------------------  Recall / Miss -------------------#
control "aws_elbs - Recall" do
  describe aws_elbs do
    it { should exist }
  end
  describe aws_elbs.where(elb_name: 'nonesuch') do
    it { should_not exist }
  end
end

#-------------------   Filtering   -------------------#
control "aws_elbs - filtering" do
  elbs = aws_elbs

  # Alpha is in a only
  # Beta is in a and c
  region = fixtures['aws_region']
  describe elbs.where { availability_zones.include? region + 'a' } do
    its('elb_names') { should include fixtures['elb_alpha_name']}
    its('elb_names') { should include fixtures['elb_beta_name']}
  end
  describe elbs.where { availability_zones.include? region + 'c' } do
    its('elb_names') { should_not include fixtures['elb_alpha_name']}
    its('elb_names') { should include fixtures['elb_beta_name']}
  end

  describe elbs.where(dns_name: /com$/) do
    its('count') { should cmp 2 }
  end

  # Both listen on 80
  describe elbs.where { external_ports.include? 80 } do
    its('count') { should cmp 2 }
  end

  # Alpha has no instances, beta has two
  describe elbs.where { instance_ids.count == 0 } do
    its('count') { should cmp 1 }
    its('elb_names') { should include fixtures['elb_alpha_name'] }
  end
  describe elbs.where { instance_ids.count == 2 } do
    its('count') { should cmp 1 }
    its('elb_names') { should include fixtures['elb_beta_name'] }
    its('instance_ids') { should include fixtures['elb_beta_instance_1_id'] }
    its('instance_ids') { should include fixtures['elb_beta_instance_2_id'] }
    its('instance_ids.count') { should cmp 2 }    
  end

  # Alpha uses 8080, beta uses 80
  describe elbs.where { internal_ports.include? 8080 } do
    its('count') { should cmp 1 }
    its('elb_names') { should include fixtures['elb_alpha_name'] }
  end

  # Both have the same
  describe elbs.where { security_group_ids.count == 1 } do
    its('count') { should cmp 2 }
    its('elb_names') { should include fixtures['elb_alpha_name'] }
    its('elb_names') { should include fixtures['elb_beta_name'] }    
  end

  # Alpha is in A only 
  # Beta is in A and C
  describe elbs.where { subnet_ids.include? fixtures['elb_subnet_a_id']} do
    its('count') { should cmp 2 }
    its('elb_names') { should include fixtures['elb_alpha_name'] }
    its('elb_names') { should include fixtures['elb_beta_name'] }  
  end
  describe elbs.where { subnet_ids.include? fixtures['elb_subnet_c_id']} do
    its('count') { should cmp 1 }
    its('elb_names') { should_not include fixtures['elb_alpha_name'] }
    its('elb_names') { should include fixtures['elb_beta_name'] }  
  end

  describe elbs.where(vpc_id: fixtures['elb_vpc_id']) do
    its('count') { should cmp 2 }
    its('elb_names') { should include fixtures['elb_alpha_name'] }
    its('elb_names') { should include fixtures['elb_beta_name'] } 
  end
end

# #------------------- Properties -------------#
control "aws_elbs properties" do
  describe aws_elbs do
    its('availability_zones') { should include fixtures['aws_region'] + 'a' }
    its('availability_zones') { should include fixtures['aws_region'] + 'c' }
    its('availability_zones.count') { should cmp 2 }     
    its('dns_names') { should include(a_string_ending_with('elb.amazonaws.com'))}
    its('dns_names.count') { should cmp 2 }
    its('external_ports') { should include 80 }
    its('external_ports.count') { should cmp 1 }
    its('instance_ids') { should include fixtures['elb_beta_instance_1_id']}
    its('instance_ids') { should include fixtures['elb_beta_instance_2_id']}
    its('instance_ids.count') { should cmp 2 }
    its('internal_ports') { should include 80 }
    its('internal_ports') { should include 8080 }
    its('internal_ports.count') { should cmp 2 }
    its('security_group_ids') { should include fixtures['elb_security_group_to_lb_id']}
    its('security_group_ids.count') { should cmp 1 }
    its('subnet_ids') { should include fixtures['elb_subnet_a_id']}
    its('subnet_ids') { should include fixtures['elb_subnet_c_id']}
    its('subnet_ids.count') { should cmp 2 }
    its('vpc_ids') { should include fixtures['elb_vpc_id']}
    its('vpc_ids.count') { should cmp 1 }
  end
end
