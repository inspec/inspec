
title 'Virtual Machine Data Disks'

control 'azure-vm-datadisks-1.0' do

  impact 1.0
  title 'Ensure VM has 1 data disk and it is of the correct size'

  # Set the name of the vm and resource_group
  vm_internal = 'Linux-Internal-VM'
  resource_group_name = 'Inspec-Azure'

  # Ensure that the named machine has 1 data disk
  describe azure_virtual_machine_datadisks(name: vm_internal, resource_group: resource_group_name) do
    its('has_disks?') { should be true }
    its('count') { should eq 1 }
  end

  # Ensure that the first data disk on the same machine size is greater than 10gb
  describe azure_virtual_machine_datadisks(name: vm_internal, resource_group: resource_group_name).where { disk.zero? and size > 10 } do
    its('entries') { should_not be_empty }
  end

end