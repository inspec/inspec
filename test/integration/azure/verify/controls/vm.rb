
title 'Virtual Machine Properties'

control 'azure-vm-1.0' do

  impact 1.0
  title 'Ensure VM was built with the correct Image and has the correct properties'

  # Ensure that the virtual machine has been created with the correct attributes
  describe azure_virtual_machine(name: 'Linux-Internal-VM', resource_group: 'Inspec-Azure') do
    its('sku') { should eq '16.04.0-LTS' }
    its('publisher') { should eq 'Canonical' }
    its('offer') { should eq 'UbuntuServer' }
    its('size') { should eq 'Standard_DS2_v2' }
    its('location') { should eq 'westeurope' }
    its('boot_diagnostics?') { should be false }
    its('nic_count') { should eq 1 }
    its('admin_username') { should eq 'azure' }
    its('password_authentication?') { should be true }
    its('ssh_key_count') { should eq 0 }
    its('os_type') { should eq 'Linux' }  
  end

end
