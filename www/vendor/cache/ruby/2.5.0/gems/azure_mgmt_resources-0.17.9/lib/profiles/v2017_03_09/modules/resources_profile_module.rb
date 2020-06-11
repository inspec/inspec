# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require 'azure_mgmt_resources'

module Azure::Resources::Profiles::V2017_03_09
  module Mgmt
    Deployments = Azure::Resources::Mgmt::V2016_02_01::Deployments
    Providers = Azure::Resources::Mgmt::V2016_02_01::Providers
    ResourceGroups = Azure::Resources::Mgmt::V2016_02_01::ResourceGroups
    Resources = Azure::Resources::Mgmt::V2016_02_01::Resources
    Tags = Azure::Resources::Mgmt::V2016_02_01::Tags
    DeploymentOperations = Azure::Resources::Mgmt::V2016_02_01::DeploymentOperations

    module Models
      ProviderListResult = Azure::Resources::Mgmt::V2016_02_01::Models::ProviderListResult
      Plan = Azure::Resources::Mgmt::V2016_02_01::Models::Plan
      GenericResourceFilter = Azure::Resources::Mgmt::V2016_02_01::Models::GenericResourceFilter
      Sku = Azure::Resources::Mgmt::V2016_02_01::Models::Sku
      TemplateLink = Azure::Resources::Mgmt::V2016_02_01::Models::TemplateLink
      Identity = Azure::Resources::Mgmt::V2016_02_01::Models::Identity
      DebugSetting = Azure::Resources::Mgmt::V2016_02_01::Models::DebugSetting
      DeploymentProperties = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentProperties
      TemplateHashResult = Azure::Resources::Mgmt::V2016_02_01::Models::TemplateHashResult
      DeploymentExportResult = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExportResult
      ResourceListResult = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceListResult
      ErrorResponse = Azure::Resources::Mgmt::V2016_02_01::Models::ErrorResponse
      ResourceGroupProperties = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupProperties
      ResourceManagementErrorWithDetails = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceManagementErrorWithDetails
      ResourceGroup = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroup
      AliasType = Azure::Resources::Mgmt::V2016_02_01::Models::AliasType
      ResourceGroupListResult = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupListResult
      Provider = Azure::Resources::Mgmt::V2016_02_01::Models::Provider
      ResourcesMoveInfo = Azure::Resources::Mgmt::V2016_02_01::Models::ResourcesMoveInfo
      Dependency = Azure::Resources::Mgmt::V2016_02_01::Models::Dependency
      ExportTemplateRequest = Azure::Resources::Mgmt::V2016_02_01::Models::ExportTemplateRequest
      DeploymentValidateResult = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentValidateResult
      TagCount = Azure::Resources::Mgmt::V2016_02_01::Models::TagCount
      DeploymentListResult = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentListResult
      TagValue = Azure::Resources::Mgmt::V2016_02_01::Models::TagValue
      ResourceGroupFilter = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupFilter
      TagDetails = Azure::Resources::Mgmt::V2016_02_01::Models::TagDetails
      Deployment = Azure::Resources::Mgmt::V2016_02_01::Models::Deployment
      TagsListResult = Azure::Resources::Mgmt::V2016_02_01::Models::TagsListResult
      TargetResource = Azure::Resources::Mgmt::V2016_02_01::Models::TargetResource
      ProviderResourceType = Azure::Resources::Mgmt::V2016_02_01::Models::ProviderResourceType
      HttpMessage = Azure::Resources::Mgmt::V2016_02_01::Models::HttpMessage
      DeploymentPropertiesExtended = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentPropertiesExtended
      DeploymentOperationProperties = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperationProperties
      DeploymentExtendedFilter = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExtendedFilter
      DeploymentOperation = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperation
      ErrorAdditionalInfo = Azure::Resources::Mgmt::V2016_02_01::Models::ErrorAdditionalInfo
      DeploymentOperationsListResult = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperationsListResult
      BasicDependency = Azure::Resources::Mgmt::V2016_02_01::Models::BasicDependency
      ResourceProviderOperationDisplayProperties = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceProviderOperationDisplayProperties
      ParametersLink = Azure::Resources::Mgmt::V2016_02_01::Models::ParametersLink
      Resource = Azure::Resources::Mgmt::V2016_02_01::Models::Resource
      DeploymentExtended = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExtended
      SubResource = Azure::Resources::Mgmt::V2016_02_01::Models::SubResource
      AliasPathType = Azure::Resources::Mgmt::V2016_02_01::Models::AliasPathType
      ResourceGroupExportResult = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupExportResult
      GenericResource = Azure::Resources::Mgmt::V2016_02_01::Models::GenericResource
      DeploymentMode = Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentMode
      ResourceIdentityType = Azure::Resources::Mgmt::V2016_02_01::Models::ResourceIdentityType
    end

    #
    # ResourcesManagementClass
    #
    class ResourcesManagementClass
      attr_reader :deployments, :providers, :resource_groups, :resources, :tags, :deployment_operations, :configurable, :base_url, :options, :model_classes

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

        @client_0 = Azure::Resources::Mgmt::V2016_02_01::ResourceManagementClient.new(configurable.credentials, base_url, options)
        if(@client_0.respond_to?(:subscription_id))
          @client_0.subscription_id = configurable.subscription_id
        end
        add_telemetry(@client_0)
        @deployments = @client_0.deployments
        @providers = @client_0.providers
        @resource_groups = @client_0.resource_groups
        @resources = @client_0.resources
        @tags = @client_0.tags
        @deployment_operations = @client_0.deployment_operations

        @model_classes = ModelClasses.new
      end

      def add_telemetry(client)
        profile_information = 'Profiles/V2017_03_09/Resources/Mgmt'
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
      def provider_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::ProviderListResult
      end
      def plan
        Azure::Resources::Mgmt::V2016_02_01::Models::Plan
      end
      def generic_resource_filter
        Azure::Resources::Mgmt::V2016_02_01::Models::GenericResourceFilter
      end
      def sku
        Azure::Resources::Mgmt::V2016_02_01::Models::Sku
      end
      def template_link
        Azure::Resources::Mgmt::V2016_02_01::Models::TemplateLink
      end
      def identity
        Azure::Resources::Mgmt::V2016_02_01::Models::Identity
      end
      def debug_setting
        Azure::Resources::Mgmt::V2016_02_01::Models::DebugSetting
      end
      def deployment_properties
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentProperties
      end
      def template_hash_result
        Azure::Resources::Mgmt::V2016_02_01::Models::TemplateHashResult
      end
      def deployment_export_result
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExportResult
      end
      def resource_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceListResult
      end
      def error_response
        Azure::Resources::Mgmt::V2016_02_01::Models::ErrorResponse
      end
      def resource_group_properties
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupProperties
      end
      def resource_management_error_with_details
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceManagementErrorWithDetails
      end
      def resource_group
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroup
      end
      def alias_type
        Azure::Resources::Mgmt::V2016_02_01::Models::AliasType
      end
      def resource_group_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupListResult
      end
      def provider
        Azure::Resources::Mgmt::V2016_02_01::Models::Provider
      end
      def resources_move_info
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourcesMoveInfo
      end
      def dependency
        Azure::Resources::Mgmt::V2016_02_01::Models::Dependency
      end
      def export_template_request
        Azure::Resources::Mgmt::V2016_02_01::Models::ExportTemplateRequest
      end
      def deployment_validate_result
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentValidateResult
      end
      def tag_count
        Azure::Resources::Mgmt::V2016_02_01::Models::TagCount
      end
      def deployment_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentListResult
      end
      def tag_value
        Azure::Resources::Mgmt::V2016_02_01::Models::TagValue
      end
      def resource_group_filter
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupFilter
      end
      def tag_details
        Azure::Resources::Mgmt::V2016_02_01::Models::TagDetails
      end
      def deployment
        Azure::Resources::Mgmt::V2016_02_01::Models::Deployment
      end
      def tags_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::TagsListResult
      end
      def target_resource
        Azure::Resources::Mgmt::V2016_02_01::Models::TargetResource
      end
      def provider_resource_type
        Azure::Resources::Mgmt::V2016_02_01::Models::ProviderResourceType
      end
      def http_message
        Azure::Resources::Mgmt::V2016_02_01::Models::HttpMessage
      end
      def deployment_properties_extended
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentPropertiesExtended
      end
      def deployment_operation_properties
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperationProperties
      end
      def deployment_extended_filter
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExtendedFilter
      end
      def deployment_operation
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperation
      end
      def error_additional_info
        Azure::Resources::Mgmt::V2016_02_01::Models::ErrorAdditionalInfo
      end
      def deployment_operations_list_result
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentOperationsListResult
      end
      def basic_dependency
        Azure::Resources::Mgmt::V2016_02_01::Models::BasicDependency
      end
      def resource_provider_operation_display_properties
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceProviderOperationDisplayProperties
      end
      def parameters_link
        Azure::Resources::Mgmt::V2016_02_01::Models::ParametersLink
      end
      def resource
        Azure::Resources::Mgmt::V2016_02_01::Models::Resource
      end
      def deployment_extended
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentExtended
      end
      def sub_resource
        Azure::Resources::Mgmt::V2016_02_01::Models::SubResource
      end
      def alias_path_type
        Azure::Resources::Mgmt::V2016_02_01::Models::AliasPathType
      end
      def resource_group_export_result
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceGroupExportResult
      end
      def generic_resource
        Azure::Resources::Mgmt::V2016_02_01::Models::GenericResource
      end
      def deployment_mode
        Azure::Resources::Mgmt::V2016_02_01::Models::DeploymentMode
      end
      def resource_identity_type
        Azure::Resources::Mgmt::V2016_02_01::Models::ResourceIdentityType
      end
    end
  end
end
