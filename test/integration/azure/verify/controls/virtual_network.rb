title 'Azure Virtual Network (vNet)'

control 'azure-virtual-network-2.0' do
  impact 1.0
  title 'Ensure that the specified virtual network is configured correctly.'

  describe azure_virtual_network(group_name: 'Inspec-Azure',name: 'Inspec-VNet') do

    # Ensure that the name is correct - this is a little superfluous as this was used to select the resource
    its('name') { should cmp 'Inspec-VNet' }

    # Where in Azure is the virtual network  located
    its('location') { should cmp 'westus' }

    # Ensure that the address prefix for the VNet is correct
    # This will return an array so the `include` matcher needs to be used to
    # see if the specified address prefix is present
    its('address_prefixes') { should include '10.1.0.0/24' }

    # should have subnets attached to it
    it { should have_subnets }

    # There should be one subnet
    its('subnets_count') { should eq 1 }

    # There should be a subnet with the specified name.
    its('connected_subnets') { should include 'Inspec-Subnet' }

    # Should not have DNS servers attached
    its('has_dns_servers') { should eq false }

  end
end
