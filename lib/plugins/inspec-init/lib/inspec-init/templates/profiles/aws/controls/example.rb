# encoding: utf-8
# copyright: 2018, The Authors

title 'Sample Section'

aws_vpc_id = attribute('aws_vpc_id')

# you add controls here
control 'aws-vpc-check' do                                                  # A unique ID for this control.
  impact 1.0                                                                # The criticality, if this control fails.
  title 'Check to see if custom VPC exists.'                                # A human-readable title
  describe aws_vpc(aws_vpc_id) do                                           # The test itself.
    it { should exist }
  end
end

# Plural resources can be inspected to check for specific resource details.
control 'aws-vpcs-check' do
  impact 1.0
  title 'Check in all the VPCs for default sg not allowing 22 inwards'
  aws_vpcs.vpc_ids.each do |vpc_id|
    describe aws_security_group(vpc_id: vpc_id, group_name: 'default') do
      it { should allow_in(port: 22) }
    end
  end
end
