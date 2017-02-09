
require_relative 'common/helpers'

class AzureVm < Inspec.resource(1)
  name 'azure_vm'

  desc "
    This resource gathers information about which image the vm was created from
  "

  example "
    describe azure_vm(host: 'acme-test-01', resource_group: 'ACME') do
      its('sku') { should eq '16.04.0-LTS'}
    end
  "

  # Load the configuration file on initialisation
  def initialize(opts)
    @opts = opts
    @helpers = Helpers.new()
  end

  def sku
    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.sku
    end
  end

  def publisher

    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.publisher
    end
  end

  def offer
    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.offer
    end
  end

  def has_data_disks?
    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.data_disks.length > 0
    end
  end

  def data_disk

    vm = @helpers.get_vm(@opts[:host], @opts[:resource_group])

    dd = DataDisks.new(vm)
  end

end
