title "Windows Internal Machine Data Disks"

control "azure-virtual-machine-vm-windows-internal-datadisks-1.0" do

  # Select the first data disk of the Windows Internal Machine
  describe azure_virtual_machine_data_disk(group_name: "Inspec-Azure", name: "Windows-Internal-VM").where(number: 1) do
    its("lun") { should cmp 0 }

    # Ensure that the the name of the managed disk is correct
    its("name") { should cmp "Windows-Internal-DataDisk-1-MD" }

    # Ensure that its size, in GB, is correct
    its("size") { should cmp >= 15 }
    its("caching") { should cmp "None" }
    its("create_option") { should cmp "Empty" }

    # This should be a managed disk
    its("is_managed_disk?") { should cmp true }

    # If the disk is a managed disk then the following values should be available
    # The storage account type and the resource group that the managed disk is in
    its("storage_account_type") { should cmp "Standard_LRS" }
    its("resource_group") { should cmp "Inspec-Azure" }
  end
end
