title 'External Virtual Machine Properties'

control 'azure-generic-vm-linux-external-2.0' do

  impact 1.0
  title 'Ensure External VM was built with the correct Image and has the correct properties'

  # Ensure that the virtual machine has been created with the correct attributes
  describe azure_generic_resource(group_name: 'Inspec-Azure', name: 'Linux-External-VM') do

    its('location') { should cmp 'westeurope' }

    # check the storage profile for the machine
    its('properties.storageProfile.imageReference.publisher') { should cmp 'Canonical' }
    its('properties.storageProfile.imageReference.offer') { should cmp 'UbuntuServer' }
    its('properties.storageProfile.imageReference.sku') { should cmp '16.04.0-LTS' }

    # Check the disk for the machine
    its('properties.storageProfile.osDisk.osType') { should cmp 'Linux' }
    its('properties.storageProfile.osDisk.createOption') { should cmp 'FromImage' }
    its('properties.storageProfile.osDisk.name') { should cmp 'linux-external-osdisk' }
    its('properties.storageProfile.osDisk.caching') { should cmp 'ReadWrite' }

    # Esnure that the machine has no data disks attached
    its('properties.storageProfile.dataDisks.count') { should eq 1 }

    # Check the hardwareProfile
    its('properties.hardwareProfile.vmSize') { should cmp 'Standard_DS2_v2' }

    # Check the network interfaces
    its('properties.networkProfile.networkInterfaces.count') { should eq 1 }

    # Determine the authentication and OS type
    its('properties.osProfile.computerName') { should eq 'linux-external-1' }
    its('properties.osProfile.adminUsername') { should eq 'azure' }
    its('properties.osProfile.linuxConfiguration.disablePasswordAuthentication') { should be true }

    # Check that the tags have been set properly
    it { should have_tags }
    its('tag_count') { should be 1 }
    its('tags') { should include 'Description' }
    its('Description_tag') { should match 'Externally facing' }
  end
end
