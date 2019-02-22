# encoding: utf-8
# copyright: 2018, The Authors

title 'Sample Section'

aws_vpc_id = attribute('aws_vpc_id', default: '', description: 'Optional AWS VPC identifier.')

# You add controls here
control 'aws-single-vpc-exists-check' do                                    # A unique ID for this control.
  only_if { aws_vpc_id != ''}                                               # Only run this control if the `aws_vpc_id` atrtibute is provided.
  impact 1.0                                                                # The criticality, if this control fails.
  title 'Check to see if custom VPC exists.'                                # A human-readable title.
  describe aws_vpc(aws_vpc_id) do                                           # The test itself.
    it { should exist }
  end
end

# Plural resources can be inspected to check for specific resource details
control 'aws-vpcs-multi-region-status-check' do                             # A unique ID for this control.
  impact 1.0                                                                # The criticality, if this control fails.
  title 'Check AWS VPCs in all regions have status "available"'             # A human-readable title.
  aws_regions.region_names.each do |region|                                 # Loop over all available AWS regions
    aws_vpcs(aws_region: region).vpc_ids.each do |vpc|                      # Find all VPCs in a single AWS region
      describe aws_vpc(aws_region: region, vpc_id: vpc) do                  # The test itself.
        it { should exist }                                                 # Confirms AWS VPC exists
        it { should be_available }                                          # Confirms AWS VPC has status "available"
      end
    end
  end
end
