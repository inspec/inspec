title 'Check Azure Resources'

control 'azure-generic-resource-group-resources-1.0' do

  impact 1.0
  title 'Check that the resource group has the correct resources'

  # Ensure that the expected resources have been deployed
  describe azure_generic_resource(group_name: 'Inspec-Azure') do
    its('total') { should eq 13 }
    its('Microsoft.Compute/virtualMachines') { should eq 3 }
    its('Microsoft.Network/networkInterfaces') { should eq 3 }
    its('Microsoft.Network/publicIPAddresses') { should eq 1 }
    its('Microsoft.Network/networkSecurityGroups') { should eq 1 }
    its('Microsoft.Storage/storageAccounts') { should eq 1 }
    its('Microsoft.Network/virtualNetworks') { should eq 1 }
    its('Microsoft.Compute/disks') { should eq 3 }

    # Check the tags
    it { should have_tags }
    its('tag_count') { should be 1 }
    its('tags') { should include 'CreatedBy' }
    its('CreatedBy_tag') { should cmp 'InSpec Azure Integration Tests' }
  end
end
