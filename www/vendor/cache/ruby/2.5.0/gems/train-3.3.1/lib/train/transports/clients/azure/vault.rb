# encoding: utf-8

require "azure_mgmt_key_vault"

# Wrapper class for ::Azure::KeyVault::Profiles::Latest::Mgmt::Client allowing custom configuration,
# for example, defining additional settings for the ::MsRestAzure::ApplicationTokenProvider.
class Vault
  AUTH_ENDPOINT = MsRestAzure::AzureEnvironments::AzureCloud.active_directory_endpoint_url
  RESOURCE_ENDPOINT = "https://vault.azure.net".freeze

  def self.client(vault_name, credentials)
    raise ::Train::UserError, "Vault Name cannot be nil" if vault_name.nil?

    credentials[:credentials] = ::MsRest::TokenCredentials.new(provider(credentials))
    credentials[:base_url] = api_endpoint(vault_name)

    ::Azure::KeyVault::Profiles::Latest::Mgmt::Client.new(credentials)
  end

  def self.provider(credentials)
    ::MsRestAzure::ApplicationTokenProvider.new(
      credentials[:tenant_id],
      credentials[:client_id],
      credentials[:client_secret],
      settings
    )
  end

  def self.api_endpoint(vault_name)
    "https://#{vault_name}#{MsRestAzure::AzureEnvironments::AzureCloud.key_vault_dns_suffix}"
  end

  def self.settings
    client_settings = MsRestAzure::ActiveDirectoryServiceSettings.get_azure_settings
    client_settings.authentication_endpoint = AUTH_ENDPOINT
    client_settings.token_audience = RESOURCE_ENDPOINT
    client_settings
  end

  private_class_method :provider, :api_endpoint, :settings
end
