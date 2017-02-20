
require_relative '../azure_conn'
require 'azure_mgmt_compute'

require_relative 'resource_groups'

class Helpers

  attr_reader :azure, :client, :resource_group

  def initialize
    # Azure connection
    @azure = AzureConnection.new

    @client = Azure::ARM::Compute::ComputeManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id

    @resource_group = ResourceGroups.new(azure)
  end

  # Retrive the specified resource group
  #
  # == Returns:
  # Object representing the resource group
  #
  def get_resource_group(rg_name)
    resource_group.get(rg_name)
  end

  def get_resources(rg_name)
    resource_group.get_resources(rg_name)
  end

  # Retrieve the named virtual machine from Azure
  #
  # == Returns:
  # Object representing the VM in Azure
  #
  def get_vm(name, rg_name)

    # Ensure that the resource group exists
    unless resource_group.exists(rg_name)
      raise "The Resource group cannot be found: #{rg_name}"
    end

    # get a vm from the named resource group
    begin
      client.virtual_machines.get(rg_name, name)
    rescue => e
      e.error_message
    end
  end
end
