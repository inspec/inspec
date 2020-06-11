# encoding: utf-8

require "azure_graph_rbac"

# Wrapper class for ::Azure::GraphRbac::Profiles::Latest::Client allowing custom configuration,
# for example, defining additional settings for the ::MsRestAzure::ApplicationTokenProvider.
class GraphRbac
  AUTH_ENDPOINT = MsRestAzure::AzureEnvironments::AzureCloud.active_directory_endpoint_url
  API_ENDPOINT = MsRestAzure::AzureEnvironments::AzureCloud.active_directory_graph_resource_id

  def self.client(credentials)
    credentials[:credentials] = ::MsRest::TokenCredentials.new(provider(credentials))
    credentials[:base_url] = API_ENDPOINT

    ::Azure::GraphRbac::Profiles::Latest::Client.new(credentials)
  end

  def self.provider(credentials)
    ::MsRestAzure::ApplicationTokenProvider.new(
      credentials[:tenant_id],
      credentials[:client_id],
      credentials[:client_secret],
      settings
    )
  end

  def self.settings
    client_settings = MsRestAzure::ActiveDirectoryServiceSettings.get_azure_settings
    client_settings.authentication_endpoint = AUTH_ENDPOINT
    client_settings.token_audience = API_ENDPOINT
    client_settings
  end

  private_class_method :provider, :settings
end
