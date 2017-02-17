
title 'Sample profile to test the Image SKU of a vm'

control 'azure-vm-1.0' do
  impact 1.0
  title 'Ensure that the machine has an image SKU of 16.04.0-LTS'

  hostname = ENV['AZURE_VM_NAME']
  resource_group_name = ENV['AZURE_RESOURCE_GROUP_NAME']

  describe azure_vm(host: hostname, resource_group: resource_group_name) do
    its('sku') { should eq '16.04-LTS' }
    its('publisher') { should eq 'Canonical' }
    its('offer') { should eq 'UbuntuServer' }
  end
end
