require 'resources/azure/azure_backend'

module Inspec::Resources
  class AzureVirtualMachine < AzureResourceBase
    name 'azure_virtual_machine'

    desc '
      InSpec Resource to test Azure Virtual Machines
    '

    supports platform: 'azure'

    # Constructor for the resource. This calls the parent constructor to
    # get the generic resource for the specified machine. This will provide
    # static methods that are documented
    #
    # @author Russell Seymour
    def initialize(opts = {})
      # The generic resource needs to pass back a Microsoft.Compute/virtualMachines object so force it
      opts[:type] = 'Microsoft.Compute/virtualMachines'
      super(opts)

      # Find the virtual machines
      resources

      create_tag_methods
    end

    # Method to catch calls that are not explicitly defined.
    # This allows the simple attributes of the virtual machine to be read without having
    # to define each one in turn.
    #
    # rubocop:disable Metrics/AbcSize
    #
    # @param symobl method_id The symbol of the method that has been called
    #
    # @return Value of attribute that has been called
    def method_missing(method_id)
      # Depending on the method that has been called, determine what value should be returned
      # These are set as camel case methods to comply with rubocop
      image_reference_attrs = %w{sku publisher offer}
      osdisk_attrs = %w{os_type caching create_option disk_size_gb}
      hardware_profile_attrs = %w{vm_size}
      os_profile_attrs = %w{computer_name admin_username}
      osdisk_managed_disk_attrs = %w{storage_account_type}

      # determine the method name to call by converting the snake_case to camelCase
      # method_name = self.camel_case(method_id.to_s)
      method_name = method_id.to_s.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      method_name.end_with?('Gb') ? method_name.gsub!(/Gb/, &:upcase) : false

      if image_reference_attrs.include?(method_id.to_s)
        properties.storageProfile.imageReference.send(method_name)
      elsif osdisk_attrs.include?(method_id.to_s)
        properties.storageProfile.osDisk.send(method_name)
      elsif hardware_profile_attrs.include?(method_id.to_s)
        properties.hardwareProfile.send(method_name)
      elsif os_profile_attrs.include?(method_id.to_s)
        properties.osProfile.send(method_name)
      elsif osdisk_managed_disk_attrs.include?(method_id.to_s)
        properties.storageProfile.osDisk.managedDisk.send(method_name)
      end
    end

    # Return the name of the os disk
    #
    # @return string Name of the OS disk
    def os_disk_name
      properties.storageProfile.osDisk.name
    end

    # Determine if the OS disk is a managed disk
    #
    # @return boolean
    def has_managed_osdisk?
      defined?(properties.storageProfile.osDisk.managedDisk)
    end

    # Does the machine have any NICs connected
    #
    # @return boolean
    def has_nics?
      properties.networkProfile.networkInterfaces.count != 0
    end

    # How many NICs are connected to the machine
    #
    # @return integer
    def nic_count
      properties.networkProfile.networkInterfaces.count
    end

    # Return an array of the connected NICs so that it can be tested to ensure
    # the machine is connected properly
    #
    # @return array Array of NIC names connected to the machine
    def connected_nics
      nic_names = []
      properties.networkProfile.networkInterfaces.each do |nic|
        nic_names << nic.id.split(%r{/}).last
      end
      nic_names
    end

    # Whether the machine has data disks or not
    #
    # @return boolean
    def has_data_disks?
      properties.storageProfile.dataDisks.count != 0
    end

    # How many data disks are connected
    #
    # @return integer
    def data_disk_count
      properties.storageProfile.dataDisks.count
    end

    # Does the machine allow password authentication
    #
    # This allows the use of
    #   it { should have_password_authentication }
    # within the InSpec profile
    #
    # @return boolean
    def has_password_authentication?
      password_authentication?
    end

    # Deteremine if the machine allows password authentication
    #
    # @return boolean
    def password_authentication?
      # if the osProfile property has a linuxConfiguration section then interrogate that
      # otherwise it is a Windows machine and that always has password auth
      if defined?(properties.osProfile.linuxConfiguration)
        !properties.osProfile.linuxConfiguration.disablePasswordAuthentication
      else
        true
      end
    end

    # Has the machine been given Custom Data at creation
    #
    # This allows the use of
    #    it { should have_custom_data }
    # within the InSpec Profile
    #
    # @return boolean
    def has_custom_data?
      custom_data?
    end

    # Determine if custom data has been set
    #
    # @return boolean
    def custom_data?
      if defined?(properties.osProfile.CustomData)
        true
      else
        false
      end
    end

    # Are any SSH Keys assigned to the machine
    #
    # This allows the use of
    #    it { should have_ssh_keys }
    # within the InSpec Profile
    #
    # @return boolean
    def has_ssh_keys?
      ssh_keys?
    end

    # Determine if any ssh keys have been asigned to the machine
    #
    # @return boolean
    def ssh_keys?
      if defined?(properties.osProfile.linuxConfiguration.ssh)
        properties.osProfile.linuxConfiguration.ssh.publicKeys != 0
      else
        false
      end
    end

    # Return the number of ssh keys that have been assigned to the machine
    #
    # @return integer
    def ssh_key_count
      if defined?(properties.osProfile.linuxConfiguration.ssh)
        properties.osProfile.linuxConfiguration.ssh.publicKeys.count
      else
        0
      end
    end

    # Determine is the specified key is in the ssh_keys list
    #
    # @return array Array of the public keys that are assigned to allow for testing of that key
    def ssh_keys
      # iterate around the keys
      keys = []
      properties.osProfile.linuxConfiguration.ssh.publicKeys.each do |key|
        keys << key.keyData
      end
      keys
    end

    # Does the machine have boot diagnostics enabled
    #
    # @return boolean
    def has_boot_diagnostics?
      if defined?(properties.diagnosticsProfile)
        properties.diagnosticsProfile.bootDiagnostics.enabled
      else
        false
      end
    end

    # Return the URI that has been set for the boot diagnostics storage
    #
    # @return string
    def boot_diagnostics_storage_uri
      properties.diagnosticsProfile.bootDiagnostics.storageUri
    end

    # If this is a windows machine, returns whether the agent was provisioned or not
    #
    # @return boolean
    def has_provision_vmagent?
      if defined?(properties.osProfile.windowsConfiguration)
        properties.osProfile.windowsConfiguration.provisionVMAgent
      else
        false
      end
    end

    # If a windows machine see if automatic updates for the agent are enabled
    #
    # @return boolean
    def has_automatic_agent_update?
      if defined?(properties.osProfile.windowsConfiguration)
        properties.osProfile.windowsConfiguration.enableAutomaticUpdates
      else
        false
      end
    end

    # If this is a windows machine return a boolean to state of the WinRM options
    # have been set
    #
    # @return boolean
    def has_winrm_options?
      if defined?(properties.osProfile.windowsConfiguration) && defined?(properties.osProfile.windowsConfiguration.winrm)
        properties.osProfile.windowsConfiguration.winrm.protocol
      else
        false
      end
    end
  end
end
