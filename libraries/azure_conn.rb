require 'ms_rest_azure'
require 'inifile'

class AzureConnection
  attr_accessor :subscription_id

  def initialize
    # If an INSPEC_AZURE_CREDS environment has been specified set the
    # the credentials file to that, otherwise set the one in home
    azure_creds_file = ENV['AZURE_CREDS_FILE']
    if azure_creds_file.nil?

      # The environment file has not be set, so default to one in the home directory
      azure_creds_file = File.join(Dir.home, '.azure', 'credentials')
    end

    # Check to see if the credentials file exists
    if File.file?(azure_creds_file)
      @credentials = IniFile.load(File.expand_path(azure_creds_file))
    else
      warn format('%s was not found or not accessible', azure_creds_file)
    end
  end

  def connection
    # If a connection already exists then return it
    return @conn if defined?(@conn)

    # Determine if only one subscription is specified in the configuration file, if so use that
    if @credentials.sections.length == 1
      @subscription_id = @credentials.sections[0]
    else
      @subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
    end

    # Determine the client_id, tenant_id and the client_secret
    tenant_id = ENV['AZURE_TENANT_ID'] || @credentials[@subscription_id]['tenant_id']
    client_id = ENV['AZURE_CLIENT_ID'] || @credentials[@subscription_id]['client_id']
    client_secret = ENV['AZURE_CLIENT_SECRET'] || @credentials[@subscription_id]['client_secret']

    # Create a new connection
    token_provider = MsRestAzure::ApplicationTokenProvider.new(tenant_id, client_id, client_secret)
    @conn = MsRest::TokenCredentials.new(token_provider)
  end
end
