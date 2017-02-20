
require 'azure_mgmt_resources'

class ResourceGroups
  attr_reader :client

  def initialize(azure)
    @client = Azure::ARM::Resources::ResourceManagementClient.new(azure.connection)
    client.subscription_id = azure.subscription_id
  end

  def exists(name)
    client.resource_groups.check_existence(name)
  end

  def get(name)
    client.resource_groups.get(name) if exists(name)
  end

  def get_resources(name)
    client.resource_groups.list_resources_as_lazy(name) if exists(name)
  end
end
