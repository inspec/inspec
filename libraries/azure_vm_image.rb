require 'azure_conn'
require 'azure_mgmt_compute'

require_relative 'common/resource_groups'

class AzureVmImage < Inspec.resource(1)
  name 'azurevm_image'

  desc "
    This resource gathers information about which image the vm was created from
  "

  example "
    describe azurevm_image_sku(host: 'acme-test-01', resource_group: 'ACME') do
      its('sku') { should eq '16.04.0-LTS'}
    end
  "

  # Load the configuration file on initialisation
  def initialize(opts)
    @opts = opts
  end

  def sku
    vm = get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.sku
    end
  end

  def publisher

    vm = get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.publisher
    end
  end

  def offer
    vm = get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.image_reference.offer
    end
  end

  def has_data_disks?
    vm = get_vm(@opts[:host], @opts[:resource_group])

    if vm.instance_of?(String)
      vm
    else
      vm.storage_profile.data_disks.length > 0
    end
  end

  # Retrieve the named virtual machine from Azure
  def get_vm(name, rg_name)
    # Azure connection
    azure = AzureConnection.new

    client = Azure::ARM::Compute::ComputeManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id

    # Ensure that the resource group exists
    rg = ResourceGroups.new(azure)

    unless rg.exists(rg_name)
      throw "The Resource group cannot be found: #{rg_name}"
    end

    # get a vm from the named resource group
    begin
      client.virtual_machines.get(rg_name, name)
    rescue => e
      e.error_message
    end
  end
end
