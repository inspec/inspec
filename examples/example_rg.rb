
title 'Sample profile to test names resource group'

control 'azure-rg-1.0' do
  impact 1.0
  title 'Ensure that a resource group has the correct resources'

  resource_group_name = ENV['AZURE_RESOURCE_GROUP_NAME']

  describe azure_rg(name: resource_group_name) do
    its('total') { should be >= 7 }
    its('vm_count') { should eq 1 }
  end

  describe azure_rg(name: resource_group_name).where { type == 'Microsoft.Storage/storageAccounts' }.entries do
    its('count') { should eq 1 }
  end

  describe azure_rg(name: resource_group_name).contains(parameter: 'name', value: 'example-VM-ip') do
    it { should be true }
  end
end
