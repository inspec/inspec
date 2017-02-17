
require_relative '../azure_conn'
require 'azure_mgmt_compute'

require_relative 'resource_groups'

class Helpers
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
