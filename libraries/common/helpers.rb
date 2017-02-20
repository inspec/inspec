
require_relative '../azure_conn'

require_relative 'resource_management'
require_relative 'compute_management'
require_relative 'network_management'

# Helper class to configure and give access to the various management components of Azure
# Also provides shortcuts for certain components, such as returing the VM object and performing
# all the checks that need to be done before retrieving the VM
#
# @author Russell Seymour
# @attr_reader [MsRest::TokenCredentials] azure Azure connection credentials
# @attr_reader [ComputeManagement] compute_mgmt Compute object for retrieving details about VMs
# @attr_reader [ResourceManagement] resource_mgmt Resource object for accessing specific resources and resoure groups
# @attr_reader [NetworkManagement] network_mgmt Network object for retrieving all information about Network cards and IP configurations
class Helpers
  attr_reader :azure, :compute_mgmt, :resource_mgmt, :network_mgmt

  # Constructor to configure the various objects that are required for Inspec testing
  #
  # @author Russell Seymour
  def initialize
    # Azure connection
    @azure = AzureConnection.new

    # Create the necessary clients
    @compute_mgmt = ComputeManagement.new(azure)
    @resource_mgmt = ResourceManagement.new(azure)
    @network_mgmt = NetworkManagement.new(azure)

  end

  # Retrieve the named virtual machine from Azure
  #
  # This is specified here as it combines two different resource types, Compute and Resource Groups
  #
  # @author Russell Seymour
  #
  # @return [] VM object
  #
  def get_vm(name, rg_name)
    # Ensure that the resource group exists
    unless resource_mgmt.client.resource_groups.check_existence(rg_name)
      raise "The Resource group cannot be found: #{rg_name}"
    end

    # get a vm from the named resource group
    begin
      compute_mgmt.client.virtual_machines.get(rg_name, name)
    rescue => e
      e.error_message
    end
  end
end
