
require_relative 'common/helpers'
require 'uri'

class AzureVmDataDisks < Inspec.resource(1)
  name 'azure_vm_datadisks'

  desc "
    This resource gather information about the data disks attached to a virtual machine
  "

  example "
    describe azure_vm_datadisks(host: 'example-01', resource_group: 'MyResourceGroup').where { (disk == 1 and size >= 10) } do
      it { should be true }
    end
  "

  attr_reader :params

  # Load the configuration on initialisation
  def initialize(opts)
    @opts = opts
    @helpers = Helpers.new

    # Get the VM that needs to be interrogated
    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    # Parse the data disks
    @params = parse_data_disks(vm.storage_profile.data_disks)
  end

  # Create a FilterTable which can be used by controls to interogate the data disks
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add_accessor(:count)
        .add_accessor(:has_disks?)
        .add(:disk, field: 'disk')
        .add(:caching, field: 'caching')
        .add(:create_option, field: 'create_option')
        .add(:size, field: 'size')
        .add(:lun, field: 'lun')
        .add(:name, field: 'name')
        .add(:uri, field: 'uri')
        .add(:storage_account, field: 'storage_account')

  filter.connect(self, :params)

  # Determine how many data disks have been applied to the machine
  #
  # == Returns:
  # Integer
  def count
    entries.length
  end

  # Determine if any data disks are attached to the machine
  #
  # == Returns:
  # Boolean
  def has_disks?
    entries.!empty?
  end

  private

  def parse_data_disks(data_disks)
    data_disks.each_with_index.map do |disk, index|
      parse_data_disk_item(disk, index)
    end.compact
  end

  def parse_data_disk_item(disk, index)
    # Parse the uri of the disk so that the storage account can be retrieved
    uri = URI.parse(disk.vhd.uri)

    {
      'disk' => index,
      'caching' => disk.caching,
      'create_option' => disk.create_option,
      'size' => disk.disk_size_gb,
      'lun' => disk.lun,
      'name' => disk.name,
      'uri' => disk.vhd.uri,
      'storage_account' => uri.host.split('.').first,
    }
  end
end
