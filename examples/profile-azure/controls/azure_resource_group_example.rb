control "azure_resource_group_example" do
  title "Check if the Example Resource Group matches expectations"
  impact 1.0

  describe azure_resource_group(name: "Inspec-Azure") do
    # Check if the Resource Group is located in the correct region
    its("location") { should cmp "westeurope" }

    # Check if the Resource Group has tags
    it { should have_tags }

    # Check if the number of VMs in the Resource Group is correct
    its("vm_count") { should eq 3 }

    # Check if the number of public IPs is correct
    its("public_ip_count") { should eq 1 }

    # Check if the number of Network Security Groups is correct
    its("nsg_count") { should eq 1 }

    # Check if the number of Storage Accounts is correct
    its("sa_count") { should eq 1 }
  end
end
