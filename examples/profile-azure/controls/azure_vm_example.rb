control "azure_vm_example" do
  title "Check if the Example VM matches expectations"
  impact 1.0

  describe azure_generic_resource(group_name: "Inspec-Azure", name: "Windows-Example-VM") do
    # Check if the VM is located in the correct region
    its("location") { should cmp "westeurope" }

    # Check if the VM has tags
    it { should_not have_tags }

    # Check if the VM has the correct image
    its("properties.storageProfile.imageReference.publisher") { should cmp "MicrosoftWindowsServer" }
    its("properties.storageProfile.imageReference.offer") { should cmp "WindowsServer" }
    its("properties.storageProfile.imageReference.sku") { should cmp "2016-Datacenter" }

    # Check if the VM has the correct size
    its("properties.hardwareProfile.vmSize") { should cmp "Standard_DS2_v2" }

    # Check if the VM has the correct computer name
    its("properties.osProfile.computerName") { should eq "SomethingObscure" }

    # Check if the VM has the correct admin username
    its("properties.osProfile.adminUsername") { should eq "SomethingSecure" }

    # Check if the VM has automatic updates enabled
    its("properties.osProfile.windowsConfiguration.enableAutomaticUpdates") { should be true }
  end
end
