title 'Internal Virtual Machine Properties'

control 'azure-generic-vm-windows-internal-2.0' do

  impact 1.0
  title 'Ensure Windows Internal VM was built with the correct Image and has the correct properties'

  # Ensure that the virtual machine has been created with the correct attributes
  describe azure_generic_resource(group_name: 'Inspec-Azure',
                          name: 'Windows-Internal-VM') do

    its('location') { should cmp 'westeurope' }

    # check the storage profile for the machine
    its('properties.storageProfile.imageReference.publisher') { should cmp 'MicrosoftWindowsServer' }
    its('properties.storageProfile.imageReference.offer') { should cmp 'WindowsServer' }
    its('properties.storageProfile.imageReference.sku') { should cmp '2016-Datacenter' }

    # Check the disk for the machine
    its('properties.storageProfile.osDisk.osType') { should cmp 'Windows' }
    its('properties.storageProfile.osDisk.name') { should cmp 'Windows-Internal-OSDisk-MD' }
    its('properties.storageProfile.osDisk.caching') { should cmp 'ReadWrite' }

    # This machine has been setup with a Managed Disk for the OSDisk, ensure that
    # it is linked to the correct disk
    its('properties.storageProfile.osDisk.managedDisk.id') { should match 'Windows-Internal-OSDisk-MD' }
    its('properties.storageProfile.osDisk.managedDisk.storageAccountType') { should cmp 'Standard_LRS' }

    # Esnure that the machine has a data disk attached
    its('properties.storageProfile.dataDisks.count') { should eq 1 }

    # Check the hardwareProfile
    its('properties.hardwareProfile.vmSize') { should cmp 'Standard_DS2_v2' }

    # Check the network interfaces
    its('properties.networkProfile.networkInterfaces.count') { should eq 1 }

    # Determine the authentication and OS type
    its('properties.osProfile.computerName') { should eq 'win-internal-1' }
    its('properties.osProfile.adminUsername') { should eq 'azure' }
    its('properties.osProfile.windowsConfiguration.provisionVMAgent') { should be true }
    its('properties.osProfile.windowsConfiguration.enableAutomaticUpdates') { should be false }

    # There should be no tags
    it { should_not have_tags }
  end

end
