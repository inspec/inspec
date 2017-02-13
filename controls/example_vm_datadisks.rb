
title 'Sample profile to test the data disks of a vm'

control 'azure-vm-datadisks-1.0' do
  impact 1.0
  title 'Ensure that the machine has 1 data disk of greater than or equal to 10gb'

  describe azure_vm_datadisks(host: 'AutomateServer-VM', resource_group: 'rjs-automate-09').where { (disk == 1 and size >= 10) } do
    its('entries') { should_not be_empty }
  end
end
