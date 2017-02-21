
require 'azure_mgmt_compute'

# Class to return a ComputeManagement client to get information about VMs
#
# @author Russell Seymour
#
# @attr_reader [Azure::ARM::Compute::ComputeManagementClient] client ComputeManagement client object
class ComputeManagement
  attr_reader :client

  # Constructor for the class.  Creates the new Network Management client object
  #
  # @author Russell Seymour
  #
  # @param [MsRest::TokenCredentials] azure Connection object for Azure
  def initialize(azure)
    @client = Azure::ARM::Compute::ComputeManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id
  end
end
