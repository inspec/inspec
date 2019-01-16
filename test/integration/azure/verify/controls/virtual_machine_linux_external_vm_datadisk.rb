title "Windows Internal Machine Data Disks"

control "azure-virtual-machine-vm-linux-external-datadisks-1.0" do

  # Select the first data disk of the Windows Internal Machine
  describe azure_virtual_machine_data_disk(group_name: "Inspec-Azure", name: "Linux-External-VM").where(number: 1) do
    its("lun") { should cmp 0 }

    # Ensure that the the name of the managed disk is correct
    its("name") { should cmp "linux-external-datadisk-1" }

    # Ensure that its size, in GB, is correct
    its("size") { should cmp >= 15 }
    its("caching") { should cmp "None" }
    its("create_option") { should cmp "Empty" }

    # This should be a managed disk
    its("is_managed_disk?") { should cmp false }
  end
end
