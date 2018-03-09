title 'Virtual Network Properties (vNET)'

control 'azure-virtual-network-2.0' do

  impact 1.0
  title 'Ensure that the virtual network (vNET) has been created with the correct address space and subnet'

  describe azure_virtual_network(group_name: 'Inspec-Azure',
                          name: 'Inspec-VNet') do

    # Check that this named resource is indeed a virtual network
    its('type') { should cmp 'Microsoft.Network/virtualNetworks' }
    its('location') { should cmp 'westeurope' }

    # There should be no tags
    it { should_not have_tags }

    # Ensure that the address prefix for the VNet is correct
    # This will return an array so the `include` matcher needs to be used to
    # see if the specified address prefix is present
    its('address_prefixes') { should include '10.1.1.0/24' }

    # There should be one subnet
    its('subnets_count') { should eq 1 }

  end
end
