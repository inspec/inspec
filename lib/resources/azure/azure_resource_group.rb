
require 'azure_backend'

# Class to test the resources in Resource Groups
#
# @author Russell Seymour
#
# @attr_reader [Hashtable] items List of items in the resource group
# @attr_reader [Azure::ARM::Resources::Models::ResourceGroup] rg Resource group under interrogation
# @attr_reader [Hashtable] counts Hashtable containing the counts of the different types in the resource group
class AzureRg < Inspec.resource(1)
  name 'azure_resource_group'

  desc "
    This resource returns information about the specified resource group
  "

  example "
    describe azure_rg(name: 'ACME') do
      its('nic_count') { should eq 4 }
      its('vm_count) { should eq 2 }
    end
  "

  attr_reader :items, :rg, :counts

  # Constructor which retrieves the named resource group and parses all of its items
  #
  # @author Russell Seymour
  #
  # @param [Hash] opts Hashtable of options
  #     opts[:name] The name of the resource group
  def initialize(opts)
    opts = opts
    helpers = Helpers.new

    # Get the named resource group
    @rg = helpers.resource_mgmt.get_resource_group(opts[:name])

    # If the rg is nil raise error
    raise format("Unable to find resource group '%s' in Azure subscription '%s'", opts[:name], helpers.azure.subscription_id) if rg.nil?

    # Retrieve the items within the resource group
    rg_items = helpers.resource_mgmt.get_resources(opts[:name])

    # Parse the resources
    @items = parse_rg_resources(rg_items.value)
  end

  # Create a FilterTable so that items can be selected
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add_accessor(:count)
        .add_accessor(:contains)
        .add(:type, field: 'type')
        .add(:name, field: 'name')
        .add(:location, field: 'location')

  filter.connect(self, :items)

  # Determine the location of the resource group
  #
  # @return [String Location of the resource group
  #
  def location
    rg.location
  end

  # Determime how many resources in total there are
  #
  # @return [Integer] Total number of items in the resource group
  #
  def total
    counts['total']
  end

  # Determine how many of a certain type there are
  #
  # @return [Integer] Number of specific items in the FilterTable
  #
  def count
    entries.length
  end

  # Allows tests to be performed on the resources
  # For example it is possible to check that a resource of a certain name exists
  #
  # @param [Hashtable] settings Hashtable of settings which will be used to perform the filter
  #     settings[:parameter] Name of the parameter being interrogated [name, type, location]
  #     settings[:value] The expected value of the specified paramater
  #
  # @return [Boolean] Whether or not the specified item exists in the resources
  #
  def contains(settings)
    result = false

    entries.each do |entry|
      if entry[settings[:parameter]] == settings[:value]
        result = true
        break
      end
    end

    result
  end

  # Helper method to determine the number of NICs in the resource group
  #
  # @return [Integer] Number of NICs in the resource group
  #
  def nic_count
    counts['Microsoft.Network/networkInterfaces']
  end

  # Helper method to determine the number of VMs in the resource group
  #
  # @return [Integer] Number of VMs in the resource group
  #
  def vm_count
    counts['Microsoft.Compute/virtualMachines']
  end

  # Helper method to determine the number of NSGs in the resource group
  #
  # @return [Integer] Number of NSGs in the resource group
  #
  def nsg_count
    counts['Microsoft.Network/networkSecurityGroups']
  end

  # Helper method to determine the number of Virtual Networks in the resource group
  #
  # @return [Integer] Number of VNETs in the resource group
  #
  def vnet_count
    counts['Microsoft.Network/virtualNetworks']
  end

  # Helper method to determine the number of Storage Accounts in the resource group
  #
  # @return [Integer] Number of SAs in the resource group
  #
  def sa_count
    counts['Microsoft.Storage/storageAccounts']
  end

  # Helper method to determine the number of Public IP Addresses in the resource group
  #
  # @return [Integer] Number of Public IP Addresses in the resource group
  #
  def public_ip_count
    counts['Microsoft.Network/publicIPAddresses']
  end

  # Helper method to determine the number of Managed Disk images in the resource group
  #
  # @return [Integer] Number of Managed Disk images
  #
  def managed_disk_image_count
    counts['Microsoft.Compute/images']
  end

  # Helper method to determine the number of Managed Disks in the resource group
  #
  # @return [Integer] Number of Managed Disks
  #
  def managed_disk_count
    counts['Microsoft.Compute/disks']
  end

  private

  # Parse the Resource Group Resources
  #
  # @param [Array] resources Array of resources in the resource group
  #
  # @return [Array<Hash>] Array of hashes providing the information about the resources for the FilterTable
  def parse_rg_resources(resources)
    # Declare the hashtable of counts
    @counts = {
      'total' => 0,
    }

    resources.each.map do |resource|
      parse_item(resource)
    end.compact
  end

  # Parses each resource item and extracts the information to be tested
  #
  # @return [Hash] Resource information
  #
  def parse_item(item)
    # Increment the count total
    counts['total'] += 1

    # Update the count for the resource type in the count table
    counts.key?(item.type) ? counts[item.type] +=1 : counts[item.type] = 1

    {
      'location' => item.location,
      'name' => item.name,
      'type' => item.type,
    }
  end
end
