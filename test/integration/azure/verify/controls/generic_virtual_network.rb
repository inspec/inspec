title "Virtual Network Properties"

control "azure-generic-virtual-network-2.0" do

  impact 1.0
  title "Ensure that the virtual network has been created with the correct address space and subnet"

  describe azure_generic_resource(group_name: "Inspec-Azure",
                          name: "Inspec-VNet") do

    # Check that this named resource is indeed a virtual network
    its("type") { should cmp "Microsoft.Network/virtualNetworks" }
    its("location") { should cmp "westeurope" }

    # There should be no tags
    it { should_not have_tags }

    # Ensure that the address prefix for the VNet is correct
    # This will return an array so the `include` matcher needs to be used to
    # see if the specified address prefix is present
    its("properties.addressSpace.addressPrefixes") { should include "10.1.1.0/24" }

    # There should be one subnet
    its("properties.subnets.count") { should eq 1 }

  end
end
