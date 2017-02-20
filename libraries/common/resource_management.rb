
require 'azure_mgmt_resources'

# Class to return a NetworkManagement client for use with NICs and Public IP Addresses
#
# @author Russell Seymour
# @attr_reader [Azure::ARM::Network::NetworkManagementClient] client Azure Network Management cient
class ResourceManagement
  attr_reader :client

  # Constructor for the class.  Creates the new Network Management client object
  #
  # @author Russell Seymour
  #
  # @param [MsRest::TokenCredentials] azure Connection object for Azure
  def initialize(azure)
    @client = Azure::ARM::Resources::ResourceManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id
  end

  # Determine if the specified resource group exists in the subscription_id
  #
  # @author Russell Seymour
  #
  # @param [String] name Name of the resource group
  #
  # @return [Boolean] Whether the resource group exists or not
  def exists(name)
    client.resource_groups.check_existence(name)
  end

  # Retrieve the named resource group if it exists
  #
  # @author Russell Seymour
  #
  # @param [String] name Name of the resource group
  #
  # @return [Azure::ARM::Resources::Models::ResourceGroup] Object containing information about the resource group
  def get_resource_group(name)
    client.resource_groups.get(name) if exists(name)
  end

  # Get all of the resources that are contained within the resource group if it exists
  #
  # @author Russell Seymour
  #
  # @param [String] name Name of the resource group
  #
  # @return [Azure::ARM::Resources::Models::ResourceListResult] Object containing array of all the resources
  def get_resources(name)
    client.resource_groups.list_resources_as_lazy(name) if exists(name)
  end
end
