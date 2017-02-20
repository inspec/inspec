
require_relative 'common/helpers'

class AzureRg < Inspec.resource(1)
  name 'azure_rg'

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

  # Resource constructor
  #
  def initialize(opts)
    opts = opts
    helpers = Helpers.new

    # Get the named resource group
    @rg = helpers.get_resource_group(opts[:name])

    # Retrieve the items within the resource group
    rg_items = helpers.get_resources(opts[:name])

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
  # == Returns:
  # String
  #
  def location
    rg.location
  end

  # Determime how many resources in total there are
  #
  # == Returns:
  # Integer
  #
  def total
    counts['total']
  end

  # Determine how many of a certain type there are
  #
  # == Returns:
  # Integer
  #
  def count
    entries.length
  end

  # Allows tests to be performed on the resources
  # For example it is possible to check that a resource of a certain name exists
  #
  # == Returns:
  # Boolean
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
  # == Returns:
  # Integer
  #
  def nic_count
    counts['Microsoft.Network/networkInterfaces']
  end

  # Helper method to determine the number of VMs in the resource group
  #
  # == Returns:
  # Integer
  #
  def vm_count
    counts['Microsoft.Compute/virtualMachines']
  end

  # Helper method to determine the number of NSGs in the resource group
  #
  # == Returns:
  # Integer
  #
  def nsg_count
    counts['Microsoft.Network/networkSecurityGroups']
  end

  # Helper method to determine the number of Virtual Networks in the resource group
  #
  # == Returns:
  # Integer
  #
  def vnet_count
    counts['Microsoft.Network/virtualNetworks']
  end

  # Helper method to determine the number of Storage Accounts in the resource group
  #
  # == Returns:
  # Integer
  #
  def sa_count
    counts['Microsoft.Storage/storageAccounts']
  end

  # Helper method to determine the number of Public IP Addresses in the resource group
  #
  # == Returns:
  # Integer
  #
  def public_ip_count
    counts['Microsoft.Network/publicIPAddresses']
  end

  private

  def parse_rg_resources(resources)
    # Declare the hashtable of counts
    @counts = {
      'total' => 0,
    }

    resources.each.map do |resource|
      parse_item(resource)
    end.compact
  end

  def parse_item(item)
    # Increment the count total
    counts['total'] += 1

    # Update the count for the resource type in the count table
    counts.key?(item.type) ? counts[item.type] +=1 : counts[item.type] = 1

    {
      'location' => item.location,
      'name' => item.name,
      'type' => item.type,
      'new' => 'me',
    }
  end
end
