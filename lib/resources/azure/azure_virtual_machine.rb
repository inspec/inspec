
require 'azure_backend'

# Class to retrieve information about the specified virtual machine
#
# @author Russell Seymour
#
# @attr_reader [Azure::ARM::Compute::Models::VirtualMachine] vm VM object as retrieved from Azure
class AzureVm < Inspec.resource(1)
  name 'azure_virtual_machine'

  desc "
    This resource gathers information about which image the vm was created from
  "

  example "
    describe azure_vm(name: 'acme-test-01', resource_group: 'ACME') do
      its('sku') { should eq '16.04.0-LTS'}
    end
  "

  attr_accessor :vm, :nics, :helpers

  # Constructor to retrieve the VM from Azure
  #
  # @author Russell Seymour
  #
  # @param [Hash] opts Hashtable of options
  #     opts[:host] The name of the host in the resource group.  NOTE, this is the name as seen in Azure and not the name of the machine in the Operating System
  #     opts[:resource_group] Name of the resource group in which the host will be found
  def initialize(opts)
    opts = opts
    @helpers = Helpers.new
    @vm = helpers.get_vm(opts[:name], opts[:resource_group])

    # Ensure that the vm is an object
    raise format('An error has occured: %s', vm) if vm.instance_of?(String)

    # Parse the Network Interface Cards attached to the machine
    @nics = parse_nics(vm.network_profile.network_interfaces)
  end

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:accelerated_networking, field: 'enable_accelerated_networking')
        .add(:ip_forwarding, field: 'enable_ip_forwarding')
        .add(:location, field: 'location')
        .add(:name, field: 'name')
        .add(:primary, field: 'primary')
        .add(:ip_configurations, field: 'ip_configurations')

  filter.connect(self, :nics)

  # Determine the SKU used to create the machine
  #
  # @return [String] Showing the sku, e.g. 16.04.0-LTS
  #
  def sku
    vm.storage_profile.image_reference.sku
  end

  # Determine the publisher of the SKU
  #
  # @return [String] Publisher, e.g. Canonical
  #
  def publisher
    vm.storage_profile.image_reference.publisher
  end

  # Determine the offer from the publisher
  #
  # @return [String] offer, e.g. UbuntuServer
  #
  def offer
    vm.storage_profile.image_reference.offer
  end

  # Determine the size of the machine
  #
  # @return [String] Size of the machine, e.g. Standard_DS1_v2
  #
  def size
    vm.hardware_profile.vm_size
  end

  # Determine the location of the vm
  #
  # @return [String] location of the machinem, e.g. westeurope
  #
  def location
    vm.location
  end

  # State if boot diagnostics is enabled
  #
  # @return [Boolean]
  #
  def has_boot_diagnostics?
    if vm.diagnostics_profile
      vm.diagnostics_profile.boot_diagnostics.enabled
    else
      false
    end
  end

  # Determine how many network cards are connected to the machine
  #
  # @return [Integer]
  #
  def nic_count
    vm.network_profile.network_interfaces.length
  end

  # The admin username for the machine
  #
  # @return [String] Admin username when the machine was created, e.g. azure
  #
  def admin_username
    vm.os_profile.admin_username
  end

  # The computername as seen by the operating system
  # This might be different to the VM name as seen in Azure
  #
  # @return [String]
  #
  def computername
    vm.os_profile.computer_name
  end

  # Alias for computername
  #
  # @return [String]
  #
  def hostname
    computername
  end

  # Determine if password authentication is enabled
  # For Windows this is always True.  On Linux this will be determined
  #
  # @return [Boolean]
  #
  def password_authentication?
    # if the vm has a linux configuration then interrogate that, otherwise return true
    if !vm.os_profile.linux_configuration.nil?
      !vm.os_profile.linux_configuration.disable_password_authentication
    else
      true
    end
  end

  # How many SSH keys have been added to the machine
  # For Windows this will be 0, for Linux this will be determined
  #
  # @return [Integer]
  #
  def ssh_key_count
    if !vm.os_profile.linux_configuration.nil? && !vm.os_profile.linux_configuration.ssh.nil?
      vm.os_profile.linux_configuration.ssh.public_keys.length
    else
      0
    end
  end

  # Determine the Operating system type using the os_disk object
  #
  # @return [String] OS type, e.g. Windows or Linux
  #
  def os_type
    vm.storage_profile.os_disk.os_type
  end

  # Return an array of the private IP addresses so that it is possible
  # to check if the machine has the correct assigned address
  #
  # @return [Array] Array of private ip addresses
  #
  def private_ipaddresses
    # Create an array to hold the addresses
    addresses = []

    # Iterate around the filter that has been populated
    entries.each do |entry|
      entry.ip_configurations.each do |ip_config|
        addresses << ip_config['private_ipaddress']
      end
    end

    # return the array to the calling function
    addresses
  end

  # Boolean test to check that the machine has a public IP address
  #
  # @return [boolean]
  #
  def has_public_ipaddress?
    # Define the test value
    test = false

    entries.each do |entry|
      entry.ip_configurations.each do |ip_config|
        if ip_config['public_ipaddress']['attached']
          test = true
          break
        end
      end
    end

    test
  end

  # Return the domain name label that has been assigned to the machine
  #
  # @return [String] The domain name label
  #
  def domain_name_label
    label = nil
    entries.each do |entry|
      entry.ip_configurations.each do |ip_config|
        if ip_config['public_ipaddress']['attached']
          label = ip_config['public_ipaddress']['domain_name_label']
        end
      end
    end

    label
  end

  private

  # Parse the array of NICs attached to the machine
  #
  # @return [Array] Array of all the NICs
  #
  def parse_nics(attached_nics)
    # Iterate around the attached NICs
    attached_nics.each.map do |attached_nic|

      # Get the name of the resource group and the name of the NIC
      # This is required as the card might be in a different resource group
      nic_raw = attached_nic.id.split(%r{/})
      nic_resource_group_name = nic_raw[4]
      nic_name = nic_raw.last

      # Interrogate Azure for the NIC details
      nic = helpers.network_mgmt.client.network_interfaces.get(nic_resource_group_name, nic_name)

      # Parse the NIC
      parse_nic(nic)
    end.compact
  end

  # Parse the indivdual NIC
  #
  # @return [Hash] Properties of the indvidual NIC
  #
  def parse_nic(nic)
    # Create the hash table that contains all the information about the NIC
    {
      'enable_accelerated_networking' => nic.enable_accelerated_networking,
      'enable_ip_forwarding' => nic.enable_ipforwarding,
      'location' => nic.location,
      'name' => nic.name,
      'primary' => nic.primary,

      # Parse all the IP configurations for the NIC
      'ip_configurations' => parse_ip_configurations(nic.ip_configurations),
    }
  end

  # Parse the array of IP configurations that are applied to the NIC
  #
  # @returns [Array] Array of all the IP configurations
  #
  def parse_ip_configurations(ip_configurations)
    # Iterate around all of the IP configurations
    ip_configurations.each.map do |ip_configuration|
      parse_ip_configuration(ip_configuration)
    end.compact
  end

  # Parse the IP configuration item
  #
  # @return [Hash] Hashtable of the ip_configuration attributes
  #
  def parse_ip_configuration(ip_configuration)
    config = {
      'name' => ip_configuration.name,
      'primary' => ip_configuration.primary,
      'private_ipaddress' => ip_configuration.private_ipaddress,
      'public_ipaddress' => {
        'attached' => !ip_configuration.public_ipaddress.nil?,
      },
    }

    # if there is a public IP address attached get its details
    if config['public_ipaddress']['attached']

      # Get the name of the resource group and the name of the NIC
      # This is required as the card might be in a different resource group
      public_ip_raw = ip_configuration.public_ipaddress.id.split(%r{/})
      public_ip_resource_group_name = public_ip_raw[4]
      public_ip_name = public_ip_raw.last

      # Interrogate Azure for the NIC details
      public_ip = helpers.network_mgmt.client.public_ipaddresses.get(public_ip_resource_group_name, public_ip_name)

      # update the config with the information about the public IP if public dns settings are available
      if !public_ip.dns_settings.nil?
        config['public_ipaddress']['domain_name_label'] = public_ip.dns_settings.domain_name_label
        config['public_ipaddress']['dns_fqdn'] = public_ip.dns_settings.fqdn
      else
        config['public_ipaddress']['domain_name_label'] = nil
        config['public_ipaddress']['dns_fqdn'] = nil
      end
    end

    # return object
    config
  end
end
