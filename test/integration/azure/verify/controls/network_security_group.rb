title 'Azure Network Security Group (NSG)'

control 'azure-network-security-group-2.0' do
  impact 1.0
  title 'Ensure that the specified network security group (NSG) is configured correctly.'

  describe azure_network_security_group(group_name: 'Inspec-Azure', name: 'Inspec-NSG') do

    # Ensure that the name is correct - this is a little superfluous as this was used to select the resource
    its('name') { should cmp 'Inspec-NSG' }

    # Where in Azure is the virtual network  located
    its('location') { should cmp 'westeurope' }

     # should have security rules defined.
    it { should have_security_rules }

    # Should have a rule by specified name
    its('security_rules') { should include 'SSH-22' }

    # Should not have a RDP rule configured
    its('security_rules') { should_not include 'RDP' }

    # NSG should have network interfaces attached to it
    it {should have_subnets }

    # NSG should have network interfaces , at least one or more
    its('subnets_count?') { should be > 0 }

    # NGG should have one subnet associated with it
    its('subnets_count?') { should eq 1 }

    # NSG should contain a subnet wit the name InSpec-Subnet
    its('subnet_names') { should include 'Inspec-Subnet' }
  end
end