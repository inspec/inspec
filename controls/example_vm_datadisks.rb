
title 'Sample profile to test the data disks of a vm'

control 'azure-vm-datadisks-1.0' do
  impact 1.0
  title 'Ensure that the machine has 1 data disk'

  hostname = ENV['AZURE_VM_NAME']
  resource_group_name = ENV['AZURE_RESOURCE_GROUP_NAME']

  describe azure_vm_datadisks(host: hostname, resource_group: resource_group_name) do
    its('has_disks?') { should be true }
    its('count') { should eq 1 }
  end

  describe azure_vm_datadisks(host: hostname, resource_group: resource_group_name).where { disk.zero? and size > 10 } do
    its('entries') { should_not be_empty }
  end
end
