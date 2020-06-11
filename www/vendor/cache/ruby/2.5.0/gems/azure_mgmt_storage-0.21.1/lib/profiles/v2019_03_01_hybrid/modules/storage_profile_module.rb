# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require 'azure_mgmt_storage'

module Azure::Storage::Profiles::V2019_03_01_Hybrid
  module Mgmt
    Operations = Azure::Storage::Mgmt::V2017_10_01::Operations
    Skus = Azure::Storage::Mgmt::V2017_10_01::Skus
    StorageAccounts = Azure::Storage::Mgmt::V2017_10_01::StorageAccounts
    UsageOperations = Azure::Storage::Mgmt::V2017_10_01::UsageOperations

    module Models
      IPRule = Azure::Storage::Mgmt::V2017_10_01::Models::IPRule
      NetworkRuleSet = Azure::Storage::Mgmt::V2017_10_01::Models::NetworkRuleSet
      Dimension = Azure::Storage::Mgmt::V2017_10_01::Models::Dimension
      Identity = Azure::Storage::Mgmt::V2017_10_01::Models::Identity
      ServiceSpecification = Azure::Storage::Mgmt::V2017_10_01::Models::ServiceSpecification
      StorageAccountCreateParameters = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountCreateParameters
      OperationListResult = Azure::Storage::Mgmt::V2017_10_01::Models::OperationListResult
      Endpoints = Azure::Storage::Mgmt::V2017_10_01::Models::Endpoints
      SKUCapability = Azure::Storage::Mgmt::V2017_10_01::Models::SKUCapability
      Restriction = Azure::Storage::Mgmt::V2017_10_01::Models::Restriction
      StorageSkuListResult = Azure::Storage::Mgmt::V2017_10_01::Models::StorageSkuListResult
      StorageAccountKey = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountKey
      CustomDomain = Azure::Storage::Mgmt::V2017_10_01::Models::CustomDomain
      StorageAccountListResult = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountListResult
      EncryptionServices = Azure::Storage::Mgmt::V2017_10_01::Models::EncryptionServices
      StorageAccountListKeysResult = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountListKeysResult
      Encryption = Azure::Storage::Mgmt::V2017_10_01::Models::Encryption
      StorageAccountRegenerateKeyParameters = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountRegenerateKeyParameters
      OperationDisplay = Azure::Storage::Mgmt::V2017_10_01::Models::OperationDisplay
      StorageAccountUpdateParameters = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountUpdateParameters
      Operation = Azure::Storage::Mgmt::V2017_10_01::Models::Operation
      UsageName = Azure::Storage::Mgmt::V2017_10_01::Models::UsageName
      Sku = Azure::Storage::Mgmt::V2017_10_01::Models::Sku
      Usage = Azure::Storage::Mgmt::V2017_10_01::Models::Usage
      EncryptionService = Azure::Storage::Mgmt::V2017_10_01::Models::EncryptionService
      UsageListResult = Azure::Storage::Mgmt::V2017_10_01::Models::UsageListResult
      VirtualNetworkRule = Azure::Storage::Mgmt::V2017_10_01::Models::VirtualNetworkRule
      Resource = Azure::Storage::Mgmt::V2017_10_01::Models::Resource
      StorageAccountCheckNameAvailabilityParameters = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountCheckNameAvailabilityParameters
      AccountSasParameters = Azure::Storage::Mgmt::V2017_10_01::Models::AccountSasParameters
      KeyVaultProperties = Azure::Storage::Mgmt::V2017_10_01::Models::KeyVaultProperties
      ListAccountSasResponse = Azure::Storage::Mgmt::V2017_10_01::Models::ListAccountSasResponse
      CheckNameAvailabilityResult = Azure::Storage::Mgmt::V2017_10_01::Models::CheckNameAvailabilityResult
      ServiceSasParameters = Azure::Storage::Mgmt::V2017_10_01::Models::ServiceSasParameters
      MetricSpecification = Azure::Storage::Mgmt::V2017_10_01::Models::MetricSpecification
      ListServiceSasResponse = Azure::Storage::Mgmt::V2017_10_01::Models::ListServiceSasResponse
      StorageAccount = Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccount
      ReasonCode = Azure::Storage::Mgmt::V2017_10_01::Models::ReasonCode
      SkuName = Azure::Storage::Mgmt::V2017_10_01::Models::SkuName
      SkuTier = Azure::Storage::Mgmt::V2017_10_01::Models::SkuTier
      Kind = Azure::Storage::Mgmt::V2017_10_01::Models::Kind
      Reason = Azure::Storage::Mgmt::V2017_10_01::Models::Reason
      KeySource = Azure::Storage::Mgmt::V2017_10_01::Models::KeySource
      Action = Azure::Storage::Mgmt::V2017_10_01::Models::Action
      State = Azure::Storage::Mgmt::V2017_10_01::Models::State
      Bypass = Azure::Storage::Mgmt::V2017_10_01::Models::Bypass
      DefaultAction = Azure::Storage::Mgmt::V2017_10_01::Models::DefaultAction
      AccessTier = Azure::Storage::Mgmt::V2017_10_01::Models::AccessTier
      ProvisioningState = Azure::Storage::Mgmt::V2017_10_01::Models::ProvisioningState
      AccountStatus = Azure::Storage::Mgmt::V2017_10_01::Models::AccountStatus
      KeyPermission = Azure::Storage::Mgmt::V2017_10_01::Models::KeyPermission
      UsageUnit = Azure::Storage::Mgmt::V2017_10_01::Models::UsageUnit
      Services = Azure::Storage::Mgmt::V2017_10_01::Models::Services
      SignedResourceTypes = Azure::Storage::Mgmt::V2017_10_01::Models::SignedResourceTypes
      Permissions = Azure::Storage::Mgmt::V2017_10_01::Models::Permissions
      HttpProtocol = Azure::Storage::Mgmt::V2017_10_01::Models::HttpProtocol
      SignedResource = Azure::Storage::Mgmt::V2017_10_01::Models::SignedResource
    end

    #
    # StorageManagementClass
    #
    class StorageManagementClass
      attr_reader :operations, :skus, :storage_accounts, :usage_operations, :configurable, :base_url, :options, :model_classes

      def initialize(options = {})
        if options.is_a?(Hash) && options.length == 0
          @options = setup_default_options
        else
          @options = options
        end

        reset!(options)

        @configurable = self
        @base_url = options[:base_url].nil? ? nil:options[:base_url]
        @options = options[:options].nil? ? nil:options[:options]

        @client_0 = Azure::Storage::Mgmt::V2017_10_01::StorageManagementClient.new(configurable.credentials, base_url, options)
        if(@client_0.respond_to?(:subscription_id))
          @client_0.subscription_id = configurable.subscription_id
        end
        add_telemetry(@client_0)
        @operations = @client_0.operations
        @skus = @client_0.skus
        @storage_accounts = @client_0.storage_accounts
        @usage_operations = @client_0.usage_operations

        @model_classes = ModelClasses.new
      end

      def add_telemetry(client)
        profile_information = 'Profiles/V2019_03_01_Hybrid/Storage/Mgmt'
        client.add_user_agent_information(profile_information)
      end

      def method_missing(method, *args)
        if @client_0.respond_to?method
          @client_0.send(method, *args)
        else
          super
        end
      end

    end

    class ModelClasses
      def iprule
        Azure::Storage::Mgmt::V2017_10_01::Models::IPRule
      end
      def network_rule_set
        Azure::Storage::Mgmt::V2017_10_01::Models::NetworkRuleSet
      end
      def dimension
        Azure::Storage::Mgmt::V2017_10_01::Models::Dimension
      end
      def identity
        Azure::Storage::Mgmt::V2017_10_01::Models::Identity
      end
      def service_specification
        Azure::Storage::Mgmt::V2017_10_01::Models::ServiceSpecification
      end
      def storage_account_create_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountCreateParameters
      end
      def operation_list_result
        Azure::Storage::Mgmt::V2017_10_01::Models::OperationListResult
      end
      def endpoints
        Azure::Storage::Mgmt::V2017_10_01::Models::Endpoints
      end
      def skucapability
        Azure::Storage::Mgmt::V2017_10_01::Models::SKUCapability
      end
      def restriction
        Azure::Storage::Mgmt::V2017_10_01::Models::Restriction
      end
      def storage_sku_list_result
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageSkuListResult
      end
      def storage_account_key
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountKey
      end
      def custom_domain
        Azure::Storage::Mgmt::V2017_10_01::Models::CustomDomain
      end
      def storage_account_list_result
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountListResult
      end
      def encryption_services
        Azure::Storage::Mgmt::V2017_10_01::Models::EncryptionServices
      end
      def storage_account_list_keys_result
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountListKeysResult
      end
      def encryption
        Azure::Storage::Mgmt::V2017_10_01::Models::Encryption
      end
      def storage_account_regenerate_key_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountRegenerateKeyParameters
      end
      def operation_display
        Azure::Storage::Mgmt::V2017_10_01::Models::OperationDisplay
      end
      def storage_account_update_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountUpdateParameters
      end
      def operation
        Azure::Storage::Mgmt::V2017_10_01::Models::Operation
      end
      def usage_name
        Azure::Storage::Mgmt::V2017_10_01::Models::UsageName
      end
      def sku
        Azure::Storage::Mgmt::V2017_10_01::Models::Sku
      end
      def usage
        Azure::Storage::Mgmt::V2017_10_01::Models::Usage
      end
      def encryption_service
        Azure::Storage::Mgmt::V2017_10_01::Models::EncryptionService
      end
      def usage_list_result
        Azure::Storage::Mgmt::V2017_10_01::Models::UsageListResult
      end
      def virtual_network_rule
        Azure::Storage::Mgmt::V2017_10_01::Models::VirtualNetworkRule
      end
      def resource
        Azure::Storage::Mgmt::V2017_10_01::Models::Resource
      end
      def storage_account_check_name_availability_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccountCheckNameAvailabilityParameters
      end
      def account_sas_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::AccountSasParameters
      end
      def key_vault_properties
        Azure::Storage::Mgmt::V2017_10_01::Models::KeyVaultProperties
      end
      def list_account_sas_response
        Azure::Storage::Mgmt::V2017_10_01::Models::ListAccountSasResponse
      end
      def check_name_availability_result
        Azure::Storage::Mgmt::V2017_10_01::Models::CheckNameAvailabilityResult
      end
      def service_sas_parameters
        Azure::Storage::Mgmt::V2017_10_01::Models::ServiceSasParameters
      end
      def metric_specification
        Azure::Storage::Mgmt::V2017_10_01::Models::MetricSpecification
      end
      def list_service_sas_response
        Azure::Storage::Mgmt::V2017_10_01::Models::ListServiceSasResponse
      end
      def storage_account
        Azure::Storage::Mgmt::V2017_10_01::Models::StorageAccount
      end
      def reason_code
        Azure::Storage::Mgmt::V2017_10_01::Models::ReasonCode
      end
      def sku_name
        Azure::Storage::Mgmt::V2017_10_01::Models::SkuName
      end
      def sku_tier
        Azure::Storage::Mgmt::V2017_10_01::Models::SkuTier
      end
      def kind
        Azure::Storage::Mgmt::V2017_10_01::Models::Kind
      end
      def reason
        Azure::Storage::Mgmt::V2017_10_01::Models::Reason
      end
      def key_source
        Azure::Storage::Mgmt::V2017_10_01::Models::KeySource
      end
      def action
        Azure::Storage::Mgmt::V2017_10_01::Models::Action
      end
      def state
        Azure::Storage::Mgmt::V2017_10_01::Models::State
      end
      def bypass
        Azure::Storage::Mgmt::V2017_10_01::Models::Bypass
      end
      def default_action
        Azure::Storage::Mgmt::V2017_10_01::Models::DefaultAction
      end
      def access_tier
        Azure::Storage::Mgmt::V2017_10_01::Models::AccessTier
      end
      def provisioning_state
        Azure::Storage::Mgmt::V2017_10_01::Models::ProvisioningState
      end
      def account_status
        Azure::Storage::Mgmt::V2017_10_01::Models::AccountStatus
      end
      def key_permission
        Azure::Storage::Mgmt::V2017_10_01::Models::KeyPermission
      end
      def usage_unit
        Azure::Storage::Mgmt::V2017_10_01::Models::UsageUnit
      end
      def services
        Azure::Storage::Mgmt::V2017_10_01::Models::Services
      end
      def signed_resource_types
        Azure::Storage::Mgmt::V2017_10_01::Models::SignedResourceTypes
      end
      def permissions
        Azure::Storage::Mgmt::V2017_10_01::Models::Permissions
      end
      def http_protocol
        Azure::Storage::Mgmt::V2017_10_01::Models::HttpProtocol
      end
      def signed_resource
        Azure::Storage::Mgmt::V2017_10_01::Models::SignedResource
      end
    end
  end
end
