title "Network Security Group Properties"

control "azure-generic-network-security-group-1.0" do

  impact 1.0
  title "Ensure that the NSG has been setup as expected"

  describe azure_generic_resource(group_name: "Inspec-Azure", name: "Inspec-NSG") do

    # Check that the NSG is in the correct location
    its("location") { should cmp "westeurope" }

    # It should not have any tags
    it { should_not have_tags }

    # It has been provisionned successfully
    its("properties.provisioningState") { should eq "Succeeded" }

  end
end
