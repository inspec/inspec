# encoding: utf-8

require "train/plugins"
require "ms_rest_azure"
require "azure_mgmt_resources"
require "azure_graph_rbac"
require "azure_mgmt_key_vault"
require "socket"
require "timeout"
require "train/transports/helpers/azure/file_credentials"
require "train/transports/clients/azure/graph_rbac"
require "train/transports/clients/azure/vault"

module Train::Transports
  class Azure < Train.plugin(1)
    name "azure"
    option :tenant_id, default: ENV["AZURE_TENANT_ID"]
    option :client_id, default: ENV["AZURE_CLIENT_ID"]
    option :client_secret, default: ENV["AZURE_CLIENT_SECRET"]
    option :subscription_id, default: ENV["AZURE_SUBSCRIPTION_ID"]
    option :msi_port, default: ENV["AZURE_MSI_PORT"] || "50342"

    # This can provide the client id and secret
    option :credentials_file, default: ENV["AZURE_CRED_FILE"]

    def connection(_ = nil)
      @connection ||= Connection.new(@options)
    end

    class Connection < BaseConnection
      attr_reader :options

      DEFAULT_FILE = ::File.join(Dir.home, ".azure", "credentials")

      def initialize(options)
        @apis = {}

        # Override for any cli options
        # azure://subscription_id
        options[:subscription_id] = options[:host] || options[:subscription_id]
        super(options)

        @cache_enabled[:api_call] = true
        @cache[:api_call] = {}

        if @options[:client_secret].nil? && @options[:client_id].nil?
          options[:credentials_file] = DEFAULT_FILE if options[:credentials_file].nil?
          @options.merge!(Helpers::Azure::FileCredentials.parse(**@options))
        end

        @options[:msi_port] = @options[:msi_port].to_i unless @options[:msi_port].nil?

        # additional platform details
        release = Gem.loaded_specs["azure_mgmt_resources"].version
        @platform_details = { release: "azure_mgmt_resources-v#{release}" }

        connect
      end

      def platform
        force_platform!("azure", @platform_details)
      end

      def azure_client(klass = ::Azure::Resources::Profiles::Latest::Mgmt::Client, opts = {})
        if cache_enabled?(:api_call)
          return @cache[:api_call][klass.to_s.to_sym] unless @cache[:api_call][klass.to_s.to_sym].nil?
        end

        if klass == ::Azure::Resources::Profiles::Latest::Mgmt::Client
          @credentials[:base_url] = MsRestAzure::AzureEnvironments::AzureCloud.resource_manager_endpoint_url
        elsif klass == ::Azure::GraphRbac::Profiles::Latest::Client
          client = GraphRbac.client(@credentials)
        elsif klass == ::Azure::KeyVault::Profiles::Latest::Mgmt::Client
          client = Vault.client(opts[:vault_name], @credentials)
        end

        client ||= klass.new(@credentials)

        # Cache if enabled
        @cache[:api_call][klass.to_s.to_sym] ||= client if cache_enabled?(:api_call)

        client
      end

      def connect
        if msi_auth?
          # this needs set for azure cloud to authenticate
          ENV["MSI_VM"] = "true"
          provider = ::MsRestAzure::MSITokenProvider.new(@options[:msi_port])
        else
          provider = ::MsRestAzure::ApplicationTokenProvider.new(
            @options[:tenant_id],
            @options[:client_id],
            @options[:client_secret]
          )
        end

        @credentials = {
          credentials: ::MsRest::TokenCredentials.new(provider),
          subscription_id: @options[:subscription_id],
          tenant_id: @options[:tenant_id],
        }
        @credentials[:client_id] = @options[:client_id] unless @options[:client_id].nil?
        @credentials[:client_secret] = @options[:client_secret] unless @options[:client_secret].nil?
      end

      def uri
        "azure://#{@options[:subscription_id]}"
      end

      # Returns the api version for the specified resource type
      #
      # If an api version has been specified in the options then the apis version table is updated
      # with that value and it is returned
      #
      # However if it is not specified, or multiple types are being interrogated then this method
      # will interrogate Azure for each of the types versions and pick the latest one. This is added
      # to the apis table so that it can be retrieved quickly again of another one of those resources
      # is encountered again in the resource collection.
      #
      # @param string resource_type The resource type for which the API is required
      # @param hash options Options have that have been passed to the resource during the test.
      # @option opts [String] :group_name Resource group name
      # @option opts [String] :type Azure resource type
      # @option opts [String] :name Name of specific resource to look for
      # @option opts [String] :apiversion If looking for a specific item or type specify the api version to use
      #
      # @return string API Version of the specified resource type
      def get_api_version(resource_type, options)
        # if an api version has been set in the options, add to the apis hashtable with
        # the resource type
        if options[:apiversion]
          @apis[resource_type] = options[:apiversion]
        else
          # only attempt to get the api version from Azure if the resource type
          # is not present in the apis hashtable
          unless @apis.key?(resource_type)

            # determine the namespace for the resource type
            namespace, type = resource_type.split(%r{/})

            client = azure_client(::Azure::Resources::Profiles::Latest::Mgmt::Client)
            provider = client.providers.get(namespace)

            # get the latest API version for the type
            # assuming that this is the first one in the list
            api_versions = (provider.resource_types.find { |v| v.resource_type == type }).api_versions
            @apis[resource_type] = api_versions[0]
          end
        end

        # return the api version for the type
        @apis[resource_type]
      end

      def unique_identifier
        options[:subscription_id] || options[:tenant_id]
      end

      def msi_auth?
        @options[:client_id].nil? && @options[:client_secret].nil? && port_open?(@options[:msi_port])
      end

      private

      def port_open?(port, seconds = 3)
        Timeout.timeout(seconds) do
          begin
            TCPSocket.new("localhost", port).close
            true
          rescue SystemCallError
            false
          end
        end
      rescue Timeout::Error
        false
      end
    end
  end
end
