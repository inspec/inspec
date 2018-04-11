# encoding: utf-8

require 'resources/azure/azure_backend'
require 'uri'

module Inspec::Resources
  class AzureVirtualMachineDataDisk < AzureResourceBase
    name 'azure_virtual_machine_data_disk'

    desc '
      Inspec Resource to ensure that the data disks attached to a machine are correct
    '

    supports platform: 'azure'

    # Create a filter table so that tests on the disk can be performed
    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:exists?) { |x| !x.entries.empty? }
          .add(:disk, field: :disk)
          .add(:number, field: :number)
          .add(:name, field: :name)
          .add(:size, field: :size)
          .add(:vhd_uri, field: :vhd_uri)
          .add(:storage_account_name, field: :storage_account_name)
          .add(:lun, field: :lun)
          .add(:caching, field: :caching)
          .add(:create_option, field: :create_option)
          .add(:is_managed_disk?, field: :is_managed_disk?)
          .add(:storage_account_type, field: :storage_account_type)
          .add(:subscription_id, field: :subscription_id)
          .add(:resource_group, field: :resource_group)
    filter.connect(self, :datadisk_details)

    # Constructor for the resource. This calls the parent constructor to
    # get the generic resource for the specified machine. This will provide
    # static methods that are documented
    #
    # @author Russell Seymour
    def initialize(opts = {})
      # The generic resource needs to pass back a Microsoft.Compute/virtualMachines object so force it
      opts[:type] = 'Microsoft.Compute/virtualMachines'
      super(opts)

      # Get the data disks
      resources
    end

    # Return information about the disks and add to the filter table so that
    # assertions can be performed
    #
    # @author Russell Seymour
    def datadisk_details
      return if failed_resource?
      # Iterate around the data disks on the machine
      properties.storageProfile.dataDisks.each_with_index.map do |datadisk, index|
        # Call function to parse the data disks and return an object based on the parameters
        parse_datadisk(datadisk, index)
      end
    end

    # Return boolean to denote if the machine has data disks attached or not
    def has_data_disks?
      !entries.empty?
    end

    # Return an integer stating how many data disks are attached to the machine
    def count
      entries.count
    end

    # Return boolean to state if the machine is using managed disks for data disks
    def has_managed_disks?
      # iterate around the entries
      result = entries.each.select { |e| e[:is_managed_disk?] }
      result.empty? ? false : true
    end

    private

    # Parse the data disk to determine if these are managed disks or in a storage account
    # for example. The disk index, name and size will be returned
    #
    # params object disk Object containing the details of the disk
    # params integer index Index denoting which disk number this is on the machine
    #
    # return hashtable
    def parse_datadisk(disk, index)
      # Configure parsed hashtable to hold the information
      # Initialise this with common attributes from the different types of disk
      parsed = {
        disk: index,
        number: index + 1,
        lun: disk.lun,
        name: disk.name,
        size: disk.diskSizeGB,
        caching: disk.caching,
        create_option: disk.createOption,
      }

      # Determine if the current disk is a managed disk or not
      if defined?(disk.vhd)
        # As this is in a storage account this is not a managed disk
        parsed[:is_managed_disk?] = false

        # Set information about the disk
        # Parse the uri of the disk URI so that the storage account can be retrieved
        uri = URI.parse(disk.vhd.uri)
        parsed[:vhd_uri] = disk.vhd.uri
        parsed[:storage_account_name] = uri.host.split('.').first

      elsif defined?(disk.managedDisk)
        # State that this is a managed disk
        parsed[:is_managed_disk?] = true

        # Get information about the managed disk
        parsed[:storage_account_type] = disk.managedDisk.storageAccountType
        parsed[:id] = disk.managedDisk.id

        # Break up the ID string so that the following information can get retreived
        # - subscription_id
        # - resource_group
        id_parts = parsed[:id].split(%r{/}).reject(&:empty?)

        parsed[:subscription_id] = id_parts[1]
        parsed[:resource_group] = id_parts[3]
      end

      # return the parsed object
      parsed
    end
  end
end
