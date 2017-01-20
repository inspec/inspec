
require 'azure_mgmt_resources'

class ResourceGroups
  def initialize(azure)
    @client = Azure::ARM::Resources::ResourceManagementClient.new(azure.connection)
    @client.subscription_id = azure.subscription_id
  end

  def exists(name)
    @client.resource_groups.check_existence(name)
  end
end
