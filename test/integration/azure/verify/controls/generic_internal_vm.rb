title 'Internal Virtual Machine Properties'

control 'azure-generic-vm-linux-internal-2.0' do

  impact 1.0
  title 'Ensure Internal VM was built with the correct Image and has the correct properties'

  # Ensure that the virtual machine has been created with the correct attributes
  describe azure_generic_resource(group_name: 'Inspec-Azure', name: 'Linux-Internal-VM') do

    its('location') { should cmp 'westeurope' }

    # check the storage profile for the machine
    its('properties.storageProfile.imageReference.publisher') { should cmp 'Canonical' }
    its('properties.storageProfile.imageReference.offer') { should cmp 'UbuntuServer' }
    its('properties.storageProfile.imageReference.sku') { should cmp '16.04.0-LTS' }

    # Check the disk for the machine
    its('properties.storageProfile.osDisk.osType') { should cmp 'Linux' }
    its('properties.storageProfile.osDisk.name') { should cmp 'Linux-Internal-OSDisk-MD' }
    its('properties.storageProfile.osDisk.caching') { should cmp 'ReadWrite' }

    # This machine has been setup with a Managed Disk for the OSDisk, ensure that
    # it is linked to the correct disk
    its('properties.storageProfile.osDisk.managedDisk.id') { should match 'Linux-Internal-OSDisk-MD' }

    # Esnure that the machine has a data disk attached
    its('properties.storageProfile.dataDisks.count') { should eq 0 }

    # Check the hardwareProfile
    its('properties.hardwareProfile.vmSize') { should cmp 'Standard_DS2_v2' }

    # Check the network interfaces
    its('properties.networkProfile.networkInterfaces.count') { should eq 1 }

    # Determine the authentication and OS type
    its('properties.osProfile.computerName') { should eq 'linux-internal-1' }
    its('properties.osProfile.adminUsername') { should eq 'azure' }
    its('properties.osProfile.linuxConfiguration.disablePasswordAuthentication') { should be false }

    # There should be no tags on the machine
    its('tags.count') { should eq 0 }
  end
end
