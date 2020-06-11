# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module SecuritycenterV1
      
      class Asset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AssetDiscoveryConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Finding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudSecuritycenterV1RunAssetDiscoveryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudSecuritycenterV1beta1RunAssetDiscoveryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupAssetsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupAssetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupFindingsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupFindingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IamPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAssetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAssetsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFindingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFindingsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSourcesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrganizationSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunAssetDiscoveryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityCenterProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityMarks
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetFindingStateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Asset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :iam_policy, as: 'iamPolicy', class: Google::Apis::SecuritycenterV1::IamPolicy, decorator: Google::Apis::SecuritycenterV1::IamPolicy::Representation
      
          property :name, as: 'name'
          hash :resource_properties, as: 'resourceProperties'
          property :security_center_properties, as: 'securityCenterProperties', class: Google::Apis::SecuritycenterV1::SecurityCenterProperties, decorator: Google::Apis::SecuritycenterV1::SecurityCenterProperties::Representation
      
          property :security_marks, as: 'securityMarks', class: Google::Apis::SecuritycenterV1::SecurityMarks, decorator: Google::Apis::SecuritycenterV1::SecurityMarks::Representation
      
          property :update_time, as: 'updateTime'
        end
      end
      
      class AssetDiscoveryConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inclusion_mode, as: 'inclusionMode'
          collection :project_ids, as: 'projectIds'
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::SecuritycenterV1::AuditLogConfig, decorator: Google::Apis::SecuritycenterV1::AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::SecuritycenterV1::Expr, decorator: Google::Apis::SecuritycenterV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class Finding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :create_time, as: 'createTime'
          property :event_time, as: 'eventTime'
          property :external_uri, as: 'externalUri'
          property :name, as: 'name'
          property :parent, as: 'parent'
          property :resource_name, as: 'resourceName'
          property :security_marks, as: 'securityMarks', class: Google::Apis::SecuritycenterV1::SecurityMarks, decorator: Google::Apis::SecuritycenterV1::SecurityMarks::Representation
      
          hash :source_properties, as: 'sourceProperties'
          property :state, as: 'state'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::SecuritycenterV1::GetPolicyOptions, decorator: Google::Apis::SecuritycenterV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class GoogleCloudSecuritycenterV1RunAssetDiscoveryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :state, as: 'state'
        end
      end
      
      class GoogleCloudSecuritycenterV1beta1RunAssetDiscoveryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :state, as: 'state'
        end
      end
      
      class GroupAssetsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compare_duration, as: 'compareDuration'
          property :filter, as: 'filter'
          property :group_by, as: 'groupBy'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
          property :read_time, as: 'readTime'
        end
      end
      
      class GroupAssetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :group_by_results, as: 'groupByResults', class: Google::Apis::SecuritycenterV1::GroupResult, decorator: Google::Apis::SecuritycenterV1::GroupResult::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :read_time, as: 'readTime'
          property :total_size, as: 'totalSize'
        end
      end
      
      class GroupFindingsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compare_duration, as: 'compareDuration'
          property :filter, as: 'filter'
          property :group_by, as: 'groupBy'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
          property :read_time, as: 'readTime'
        end
      end
      
      class GroupFindingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :group_by_results, as: 'groupByResults', class: Google::Apis::SecuritycenterV1::GroupResult, decorator: Google::Apis::SecuritycenterV1::GroupResult::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :read_time, as: 'readTime'
          property :total_size, as: 'totalSize'
        end
      end
      
      class GroupResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          hash :properties, as: 'properties'
        end
      end
      
      class IamPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy_blob, as: 'policyBlob'
        end
      end
      
      class ListAssetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :list_assets_results, as: 'listAssetsResults', class: Google::Apis::SecuritycenterV1::ListAssetsResult, decorator: Google::Apis::SecuritycenterV1::ListAssetsResult::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :read_time, as: 'readTime'
          property :total_size, as: 'totalSize'
        end
      end
      
      class ListAssetsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset, as: 'asset', class: Google::Apis::SecuritycenterV1::Asset, decorator: Google::Apis::SecuritycenterV1::Asset::Representation
      
          property :state_change, as: 'stateChange'
        end
      end
      
      class ListFindingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :list_findings_results, as: 'listFindingsResults', class: Google::Apis::SecuritycenterV1::ListFindingsResult, decorator: Google::Apis::SecuritycenterV1::ListFindingsResult::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :read_time, as: 'readTime'
          property :total_size, as: 'totalSize'
        end
      end
      
      class ListFindingsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :finding, as: 'finding', class: Google::Apis::SecuritycenterV1::Finding, decorator: Google::Apis::SecuritycenterV1::Finding::Representation
      
          property :state_change, as: 'stateChange'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::SecuritycenterV1::Operation, decorator: Google::Apis::SecuritycenterV1::Operation::Representation
      
        end
      end
      
      class ListSourcesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :sources, as: 'sources', class: Google::Apis::SecuritycenterV1::Source, decorator: Google::Apis::SecuritycenterV1::Source::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::SecuritycenterV1::Status, decorator: Google::Apis::SecuritycenterV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OrganizationSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset_discovery_config, as: 'assetDiscoveryConfig', class: Google::Apis::SecuritycenterV1::AssetDiscoveryConfig, decorator: Google::Apis::SecuritycenterV1::AssetDiscoveryConfig::Representation
      
          property :enable_asset_discovery, as: 'enableAssetDiscovery'
          property :name, as: 'name'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::SecuritycenterV1::AuditConfig, decorator: Google::Apis::SecuritycenterV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::SecuritycenterV1::Binding, decorator: Google::Apis::SecuritycenterV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class RunAssetDiscoveryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SecurityCenterProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_name, as: 'resourceName'
          collection :resource_owners, as: 'resourceOwners'
          property :resource_parent, as: 'resourceParent'
          property :resource_project, as: 'resourceProject'
          property :resource_type, as: 'resourceType'
        end
      end
      
      class SecurityMarks
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :marks, as: 'marks'
          property :name, as: 'name'
        end
      end
      
      class SetFindingStateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :start_time, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::SecuritycenterV1::Policy, decorator: Google::Apis::SecuritycenterV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
    end
  end
end
