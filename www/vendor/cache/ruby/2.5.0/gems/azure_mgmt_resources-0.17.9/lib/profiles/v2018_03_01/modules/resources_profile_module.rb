# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require 'azure_mgmt_resources'

module Azure::Resources::Profiles::V2018_03_01
  module Mgmt
    Deployments = Azure::Resources::Mgmt::V2018_02_01::Deployments
    Providers = Azure::Resources::Mgmt::V2018_02_01::Providers
    Resources = Azure::Resources::Mgmt::V2018_02_01::Resources
    ResourceGroups = Azure::Resources::Mgmt::V2018_02_01::ResourceGroups
    Tags = Azure::Resources::Mgmt::V2018_02_01::Tags
    DeploymentOperations = Azure::Resources::Mgmt::V2018_02_01::DeploymentOperations

    module Models
      ProviderListResult = Azure::Resources::Mgmt::V2018_02_01::Models::ProviderListResult
      DeploymentExtendedFilter = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExtendedFilter
      Plan = Azure::Resources::Mgmt::V2018_02_01::Models::Plan
      ResourceGroupFilter = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupFilter
      Sku = Azure::Resources::Mgmt::V2018_02_01::Models::Sku
      ParametersLink = Azure::Resources::Mgmt::V2018_02_01::Models::ParametersLink
      Identity = Azure::Resources::Mgmt::V2018_02_01::Models::Identity
      OnErrorDeployment = Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeployment
      DeploymentProperties = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentProperties
      TemplateHashResult = Azure::Resources::Mgmt::V2018_02_01::Models::TemplateHashResult
      DeploymentExportResult = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExportResult
      ResourceListResult = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceListResult
      ErrorResponse = Azure::Resources::Mgmt::V2018_02_01::Models::ErrorResponse
      ResourceGroupProperties = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupProperties
      ResourceManagementErrorWithDetails = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceManagementErrorWithDetails
      ResourceGroup = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroup
      AliasType = Azure::Resources::Mgmt::V2018_02_01::Models::AliasType
      ResourceGroupPatchable = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupPatchable
      Provider = Azure::Resources::Mgmt::V2018_02_01::Models::Provider
      ResourceGroupListResult = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupListResult
      Dependency = Azure::Resources::Mgmt::V2018_02_01::Models::Dependency
      ResourcesMoveInfo = Azure::Resources::Mgmt::V2018_02_01::Models::ResourcesMoveInfo
      DeploymentPropertiesExtended = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentPropertiesExtended
      ExportTemplateRequest = Azure::Resources::Mgmt::V2018_02_01::Models::ExportTemplateRequest
      DeploymentExtended = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExtended
      TagCount = Azure::Resources::Mgmt::V2018_02_01::Models::TagCount
      GenericResourceFilter = Azure::Resources::Mgmt::V2018_02_01::Models::GenericResourceFilter
      TagValue = Azure::Resources::Mgmt::V2018_02_01::Models::TagValue
      DebugSetting = Azure::Resources::Mgmt::V2018_02_01::Models::DebugSetting
      TagDetails = Azure::Resources::Mgmt::V2018_02_01::Models::TagDetails
      ErrorAdditionalInfo = Azure::Resources::Mgmt::V2018_02_01::Models::ErrorAdditionalInfo
      TagsListResult = Azure::Resources::Mgmt::V2018_02_01::Models::TagsListResult
      AliasPathType = Azure::Resources::Mgmt::V2018_02_01::Models::AliasPathType
      TargetResource = Azure::Resources::Mgmt::V2018_02_01::Models::TargetResource
      BasicDependency = Azure::Resources::Mgmt::V2018_02_01::Models::BasicDependency
      HttpMessage = Azure::Resources::Mgmt::V2018_02_01::Models::HttpMessage
      DeploymentValidateResult = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentValidateResult
      DeploymentOperationProperties = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperationProperties
      TemplateLink = Azure::Resources::Mgmt::V2018_02_01::Models::TemplateLink
      DeploymentOperation = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperation
      DeploymentOperationsListResult = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperationsListResult
      OnErrorDeploymentExtended = Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeploymentExtended
      ResourceProviderOperationDisplayProperties = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceProviderOperationDisplayProperties
      Deployment = Azure::Resources::Mgmt::V2018_02_01::Models::Deployment
      Resource = Azure::Resources::Mgmt::V2018_02_01::Models::Resource
      DeploymentListResult = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentListResult
      SubResource = Azure::Resources::Mgmt::V2018_02_01::Models::SubResource
      ProviderResourceType = Azure::Resources::Mgmt::V2018_02_01::Models::ProviderResourceType
      ResourceGroupExportResult = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupExportResult
      GenericResource = Azure::Resources::Mgmt::V2018_02_01::Models::GenericResource
      DeploymentMode = Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentMode
      OnErrorDeploymentType = Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeploymentType
      ResourceIdentityType = Azure::Resources::Mgmt::V2018_02_01::Models::ResourceIdentityType
    end

    #
    # ResourcesManagementClass
    #
    class ResourcesManagementClass
      attr_reader :deployments, :providers, :resources, :resource_groups, :tags, :deployment_operations, :configurable, :base_url, :options, :model_classes

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

        @client_0 = Azure::Resources::Mgmt::V2018_02_01::ResourceManagementClient.new(configurable.credentials, base_url, options)
        if(@client_0.respond_to?(:subscription_id))
          @client_0.subscription_id = configurable.subscription_id
        end
        add_telemetry(@client_0)
        @deployments = @client_0.deployments
        @providers = @client_0.providers
        @resources = @client_0.resources
        @resource_groups = @client_0.resource_groups
        @tags = @client_0.tags
        @deployment_operations = @client_0.deployment_operations

        @model_classes = ModelClasses.new
      end

      def add_telemetry(client)
        profile_information = 'Profiles/V2018_03_01/Resources/Mgmt'
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
        Azure::Resources::Mgmt::V2018_02_01::Models::ProviderListResult
      end
      def deployment_extended_filter
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExtendedFilter
      end
      def plan
        Azure::Resources::Mgmt::V2018_02_01::Models::Plan
      end
      def resource_group_filter
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupFilter
      end
      def sku
        Azure::Resources::Mgmt::V2018_02_01::Models::Sku
      end
      def parameters_link
        Azure::Resources::Mgmt::V2018_02_01::Models::ParametersLink
      end
      def identity
        Azure::Resources::Mgmt::V2018_02_01::Models::Identity
      end
      def on_error_deployment
        Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeployment
      end
      def deployment_properties
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentProperties
      end
      def template_hash_result
        Azure::Resources::Mgmt::V2018_02_01::Models::TemplateHashResult
      end
      def deployment_export_result
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExportResult
      end
      def resource_list_result
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceListResult
      end
      def error_response
        Azure::Resources::Mgmt::V2018_02_01::Models::ErrorResponse
      end
      def resource_group_properties
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupProperties
      end
      def resource_management_error_with_details
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceManagementErrorWithDetails
      end
      def resource_group
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroup
      end
      def alias_type
        Azure::Resources::Mgmt::V2018_02_01::Models::AliasType
      end
      def resource_group_patchable
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupPatchable
      end
      def provider
        Azure::Resources::Mgmt::V2018_02_01::Models::Provider
      end
      def resource_group_list_result
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupListResult
      end
      def dependency
        Azure::Resources::Mgmt::V2018_02_01::Models::Dependency
      end
      def resources_move_info
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourcesMoveInfo
      end
      def deployment_properties_extended
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentPropertiesExtended
      end
      def export_template_request
        Azure::Resources::Mgmt::V2018_02_01::Models::ExportTemplateRequest
      end
      def deployment_extended
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentExtended
      end
      def tag_count
        Azure::Resources::Mgmt::V2018_02_01::Models::TagCount
      end
      def generic_resource_filter
        Azure::Resources::Mgmt::V2018_02_01::Models::GenericResourceFilter
      end
      def tag_value
        Azure::Resources::Mgmt::V2018_02_01::Models::TagValue
      end
      def debug_setting
        Azure::Resources::Mgmt::V2018_02_01::Models::DebugSetting
      end
      def tag_details
        Azure::Resources::Mgmt::V2018_02_01::Models::TagDetails
      end
      def error_additional_info
        Azure::Resources::Mgmt::V2018_02_01::Models::ErrorAdditionalInfo
      end
      def tags_list_result
        Azure::Resources::Mgmt::V2018_02_01::Models::TagsListResult
      end
      def alias_path_type
        Azure::Resources::Mgmt::V2018_02_01::Models::AliasPathType
      end
      def target_resource
        Azure::Resources::Mgmt::V2018_02_01::Models::TargetResource
      end
      def basic_dependency
        Azure::Resources::Mgmt::V2018_02_01::Models::BasicDependency
      end
      def http_message
        Azure::Resources::Mgmt::V2018_02_01::Models::HttpMessage
      end
      def deployment_validate_result
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentValidateResult
      end
      def deployment_operation_properties
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperationProperties
      end
      def template_link
        Azure::Resources::Mgmt::V2018_02_01::Models::TemplateLink
      end
      def deployment_operation
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperation
      end
      def deployment_operations_list_result
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentOperationsListResult
      end
      def on_error_deployment_extended
        Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeploymentExtended
      end
      def resource_provider_operation_display_properties
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceProviderOperationDisplayProperties
      end
      def deployment
        Azure::Resources::Mgmt::V2018_02_01::Models::Deployment
      end
      def resource
        Azure::Resources::Mgmt::V2018_02_01::Models::Resource
      end
      def deployment_list_result
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentListResult
      end
      def sub_resource
        Azure::Resources::Mgmt::V2018_02_01::Models::SubResource
      end
      def provider_resource_type
        Azure::Resources::Mgmt::V2018_02_01::Models::ProviderResourceType
      end
      def resource_group_export_result
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceGroupExportResult
      end
      def generic_resource
        Azure::Resources::Mgmt::V2018_02_01::Models::GenericResource
      end
      def deployment_mode
        Azure::Resources::Mgmt::V2018_02_01::Models::DeploymentMode
      end
      def on_error_deployment_type
        Azure::Resources::Mgmt::V2018_02_01::Models::OnErrorDeploymentType
      end
      def resource_identity_type
        Azure::Resources::Mgmt::V2018_02_01::Models::ResourceIdentityType
      end
    end
  end
end
