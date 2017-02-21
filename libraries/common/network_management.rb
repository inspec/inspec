
require 'azure_mgmt_network'

# Class to return a NetworkManagement client for use with NICs and Public IP Addresses
#
# @author Russell Seymour
# @attr_reader [Azure::ARM::Network::NetworkManagementClient] client Azure Network Management cient
class NetworkManagement
  attr_reader :client

  # Constructor for the class.  Creates the new Network Management client object
  #
  # @author Russell Seymour
  #
  # @param [MsRest::TokenCredentials] azure Connection object for Azure
  def initialize(azure)
    @client = Azure::ARM::Network::NetworkManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id
  end
end
