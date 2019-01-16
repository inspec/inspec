title "Resource Group Type Counts"

control "azure-resource-group-1.0" do
  impact 1.0
  title "Ensure that the specified resource group has the correct number of Azure resources and metadata"

  # Obtain counts for all resources in the resource group
  describe azure_resource_group(name: "Inspec-Azure") do
    # Ensure that the name is correct - this is a little superfluous as this was used to select the resource
    its("name") { should cmp "Inspec-Azure" }

    # Where in Azure is the resource group located
    its("location") { should cmp "westeurope" }

    # Was the resource group provisionned successfully?
    its("provisioning_state") { should cmp "Succeeded" }

    # Make sure that the resource group has tags on it
    it { should have_tags }
    its("tag_count") { should be 1 }
    its("tags") { should include "CreatedBy" }
    its("CreatedBy_tag") { should cmp "InSpec Azure Integration Tests" }

    # How many resources are in the resource group in total
    its("total") { should eq 13 }

    # Does the RG have virtual machines and how many
    it { should have_vms }
    its("vm_count") { should eq 3 }

    # Does the RG have network cards and how many
    it { should have_nics }
    its("nic_count") { should eq 3 }

    # Does the RG have any public ip addresses and how many
    it { should have_public_ips }
    its("public_ip_count") { should eq 1 }

    # Does the RG have network security groups and how many
    it { should have_nsgs }
    its("nsg_count") { should eq 1 }

    # Does the RG have storage accounts and how many
    it { should have_sas }
    its("sa_count") { should eq 1 }

    # Does the RG have virtual networks and how many
    it { should have_vnets }
    its("vnet_count") { should eq 1 }

    # Does the RG have managed disks and how many
    it { should have_managed_disks }
    its("managed_disk_count") { should eq 3 }

    # Does the RG have managed disk images
    it { should_not have_managed_disk_images }
    its("managed_disk_image_count") { should eq 0 }
  end
end
