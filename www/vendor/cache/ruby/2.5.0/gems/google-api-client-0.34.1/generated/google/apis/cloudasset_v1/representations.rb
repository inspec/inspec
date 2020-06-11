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
    module CloudassetV1
      
      class Asset
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
      
      class BatchGetAssetsHistoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigQueryDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExportAssetsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudOrgpolicyV1BooleanPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudOrgpolicyV1ListPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudOrgpolicyV1Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudOrgpolicyV1RestoreDefault
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1AccessLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1AccessPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1BasicLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1DevicePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1OsConstraint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TemporalAsset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeWindow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Asset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_level, as: 'accessLevel', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessLevel, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessLevel::Representation
      
          property :access_policy, as: 'accessPolicy', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessPolicy, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessPolicy::Representation
      
          collection :ancestors, as: 'ancestors'
          property :asset_type, as: 'assetType'
          property :iam_policy, as: 'iamPolicy', class: Google::Apis::CloudassetV1::Policy, decorator: Google::Apis::CloudassetV1::Policy::Representation
      
          property :name, as: 'name'
          collection :org_policy, as: 'orgPolicy', class: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1Policy, decorator: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1Policy::Representation
      
          property :resource, as: 'resource', class: Google::Apis::CloudassetV1::Resource, decorator: Google::Apis::CloudassetV1::Resource::Representation
      
          property :service_perimeter, as: 'servicePerimeter', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeter, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeter::Representation
      
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::CloudassetV1::AuditLogConfig, decorator: Google::Apis::CloudassetV1::AuditLogConfig::Representation
      
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
      
      class BatchGetAssetsHistoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :assets, as: 'assets', class: Google::Apis::CloudassetV1::TemporalAsset, decorator: Google::Apis::CloudassetV1::TemporalAsset::Representation
      
        end
      end
      
      class BigQueryDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset, as: 'dataset'
          property :force, as: 'force'
          property :table, as: 'table'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::CloudassetV1::Expr, decorator: Google::Apis::CloudassetV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class ExportAssetsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :asset_types, as: 'assetTypes'
          property :content_type, as: 'contentType'
          property :output_config, as: 'outputConfig', class: Google::Apis::CloudassetV1::OutputConfig, decorator: Google::Apis::CloudassetV1::OutputConfig::Representation
      
          property :read_time, as: 'readTime'
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
      
      class GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
          property :uri_prefix, as: 'uriPrefix'
        end
      end
      
      class GoogleCloudOrgpolicyV1BooleanPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enforced, as: 'enforced'
        end
      end
      
      class GoogleCloudOrgpolicyV1ListPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :all_values, as: 'allValues'
          collection :allowed_values, as: 'allowedValues'
          collection :denied_values, as: 'deniedValues'
          property :inherit_from_parent, as: 'inheritFromParent'
          property :suggested_value, as: 'suggestedValue'
        end
      end
      
      class GoogleCloudOrgpolicyV1Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boolean_policy, as: 'booleanPolicy', class: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1BooleanPolicy, decorator: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1BooleanPolicy::Representation
      
          property :constraint, as: 'constraint'
          property :etag, :base64 => true, as: 'etag'
          property :list_policy, as: 'listPolicy', class: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1ListPolicy, decorator: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1ListPolicy::Representation
      
          property :restore_default, as: 'restoreDefault', class: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1RestoreDefault, decorator: Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1RestoreDefault::Representation
      
          property :update_time, as: 'updateTime'
          property :version, as: 'version'
        end
      end
      
      class GoogleCloudOrgpolicyV1RestoreDefault
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1AccessLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :basic, as: 'basic', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1BasicLevel, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1BasicLevel::Representation
      
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :name, as: 'name'
          property :title, as: 'title'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1AccessPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :parent, as: 'parent'
          property :title, as: 'title'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1BasicLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :combining_function, as: 'combiningFunction'
          collection :conditions, as: 'conditions', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1Condition, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1Condition::Representation
      
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_policy, as: 'devicePolicy', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1DevicePolicy, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1DevicePolicy::Representation
      
          collection :ip_subnetworks, as: 'ipSubnetworks'
          collection :members, as: 'members'
          property :negate, as: 'negate'
          collection :regions, as: 'regions'
          collection :required_access_levels, as: 'requiredAccessLevels'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1DevicePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed_device_management_levels, as: 'allowedDeviceManagementLevels'
          collection :allowed_encryption_statuses, as: 'allowedEncryptionStatuses'
          collection :os_constraints, as: 'osConstraints', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1OsConstraint, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1OsConstraint::Representation
      
          property :require_admin_approval, as: 'requireAdminApproval'
          property :require_corp_owned, as: 'requireCorpOwned'
          property :require_screenlock, as: 'requireScreenlock'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1OsConstraint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :minimum_version, as: 'minimumVersion'
          property :os_type, as: 'osType'
          property :require_verified_chrome_os, as: 'requireVerifiedChromeOs'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :name, as: 'name'
          property :perimeter_type, as: 'perimeterType'
          property :status, as: 'status', class: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig, decorator: Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig::Representation
      
          property :title, as: 'title'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access_levels, as: 'accessLevels'
          collection :resources, as: 'resources'
          collection :restricted_services, as: 'restrictedServices'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::CloudassetV1::Status, decorator: Google::Apis::CloudassetV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bigquery_destination, as: 'bigqueryDestination', class: Google::Apis::CloudassetV1::BigQueryDestination, decorator: Google::Apis::CloudassetV1::BigQueryDestination::Representation
      
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::CloudassetV1::GcsDestination, decorator: Google::Apis::CloudassetV1::GcsDestination::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::CloudassetV1::AuditConfig, decorator: Google::Apis::CloudassetV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::CloudassetV1::Binding, decorator: Google::Apis::CloudassetV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :data, as: 'data'
          property :discovery_document_uri, as: 'discoveryDocumentUri'
          property :discovery_name, as: 'discoveryName'
          property :parent, as: 'parent'
          property :resource_url, as: 'resourceUrl'
          property :version, as: 'version'
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
      
      class TemporalAsset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset, as: 'asset', class: Google::Apis::CloudassetV1::Asset, decorator: Google::Apis::CloudassetV1::Asset::Representation
      
          property :deleted, as: 'deleted'
          property :window, as: 'window', class: Google::Apis::CloudassetV1::TimeWindow, decorator: Google::Apis::CloudassetV1::TimeWindow::Representation
      
        end
      end
      
      class TimeWindow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
    end
  end
end
