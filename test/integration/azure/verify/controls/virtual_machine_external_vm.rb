title "Internal Virtual Machine Properties"

control "azure-virtual-machine-vm-external-2.0" do

  impact 1.0
  title "Ensure External VM was built with the correct Image and has the correct properties"

  # Ensure that the virtual machine has been created with the correct attributes
  describe azure_virtual_machine(group_name: "Inspec-Azure",
                          name: "Linux-External-VM") do

    # Ensure that the location of the resource is correct
    its("location") { should cmp "westeurope" }

    # Check the type. However this should always be this type because the
    # resource azure_virtual_machine has been used which forces this type
    its("type") { should cmp "Microsoft.Compute/virtualMachines" }

    # Check the name, although this has beeb specified in the options
    its("name") { should cmp "Linux-External-VM" }

    # Ensure that tags have been set
    it { should have_tags }
    its("tags") { should include "Description" }
    its("Description_tag") { should match "Externally facing Linux" }

    # Ensure that the machine has been created from the correct image
    its("publisher") { should cmp "Canonical" }
    its("offer") { should cmp "UbuntuServer" }
    its("sku") { should cmp "16.04.0-LTS" }

    # Check the type of the machine and the disk that it is using
    its("os_type") { should cmp "Linux" }
    its("os_disk_name") { should cmp "linux-external-osdisk" }
    its("caching") { should cmp "ReadWrite" }
    its("disk_size_gb") { should be >= 25 }
    its("create_option") { should cmp "FromImage" }

    # The OS disk should be a managed disk
    it { should_not have_managed_osdisk }

    # Ensure that the machine is of the correct size
    its("vm_size") { should cmp "Standard_DS2_v2" }

    # Check the admin username for the machine and the hostname
    its("admin_username") { should cmp "azure" }
    its("computer_name") { should cmp "linux-external-1" }

    # Check that the machine has a NIC and that the correct one is connected
    it { should have_nics }
    its("nic_count") { should eq 1 }
    its("connected_nics") { should include "Inspec-NIC-2" }

    # This machine should not have any data disks
    it { should have_data_disks }

    # Password authentication should be enabled
    it { should_not have_password_authentication }
    its("password_authentication?") { should be false }

    # No ssh keys should be assigned to the machine
    it { should have_ssh_keys }
    its("ssh_keys?") { should be true }
    its("ssh_keys") { should include /azure@inspec.local/ }

    # The machine should have boot diagnostics enabled
    it { should_not have_boot_diagnostics }
  end
end
