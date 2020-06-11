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
    module DeploymentmanagerV2
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizationLoggingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentLabelEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentUpdateLabelEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentsCancelPreviewRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDeploymentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentsStopRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalSetPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigCloudAuditOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigCounterOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigDataAccessOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Manifest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListManifestsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Error
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Error
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resource
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceAccessControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Error
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Error
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListResourcesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Type
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::DeploymentmanagerV2::AuditLogConfig, decorator: Google::Apis::DeploymentmanagerV2::AuditLogConfig::Representation
      
          collection :exempted_members, as: 'exemptedMembers'
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
      
      class AuthorizationLoggingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission_type, as: 'permissionType'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::DeploymentmanagerV2::Expr, decorator: Google::Apis::DeploymentmanagerV2::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :iam, as: 'iam'
          property :op, as: 'op'
          property :svc, as: 'svc'
          property :sys, as: 'sys'
          property :value, as: 'value'
          collection :values, as: 'values'
        end
      end
      
      class ConfigFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2::DeploymentLabelEntry, decorator: Google::Apis::DeploymentmanagerV2::DeploymentLabelEntry::Representation
      
          property :manifest, as: 'manifest'
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2::Operation, decorator: Google::Apis::DeploymentmanagerV2::Operation::Representation
      
          property :self_link, as: 'selfLink'
          property :target, as: 'target', class: Google::Apis::DeploymentmanagerV2::TargetConfiguration, decorator: Google::Apis::DeploymentmanagerV2::TargetConfiguration::Representation
      
          property :update, as: 'update', class: Google::Apis::DeploymentmanagerV2::DeploymentUpdate, decorator: Google::Apis::DeploymentmanagerV2::DeploymentUpdate::Representation
      
          property :update_time, as: 'updateTime'
        end
      end
      
      class DeploymentLabelEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class DeploymentUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2::DeploymentUpdateLabelEntry, decorator: Google::Apis::DeploymentmanagerV2::DeploymentUpdateLabelEntry::Representation
      
          property :manifest, as: 'manifest'
        end
      end
      
      class DeploymentUpdateLabelEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class DeploymentsCancelPreviewRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
        end
      end
      
      class ListDeploymentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deployments, as: 'deployments', class: Google::Apis::DeploymentmanagerV2::Deployment, decorator: Google::Apis::DeploymentmanagerV2::Deployment::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DeploymentsStopRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
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
      
      class GlobalSetPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::DeploymentmanagerV2::Binding, decorator: Google::Apis::DeploymentmanagerV2::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::DeploymentmanagerV2::Policy, decorator: Google::Apis::DeploymentmanagerV2::Policy::Representation
      
        end
      end
      
      class ImportFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :name, as: 'name'
        end
      end
      
      class LogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_audit, as: 'cloudAudit', class: Google::Apis::DeploymentmanagerV2::LogConfigCloudAuditOptions, decorator: Google::Apis::DeploymentmanagerV2::LogConfigCloudAuditOptions::Representation
      
          property :counter, as: 'counter', class: Google::Apis::DeploymentmanagerV2::LogConfigCounterOptions, decorator: Google::Apis::DeploymentmanagerV2::LogConfigCounterOptions::Representation
      
          property :data_access, as: 'dataAccess', class: Google::Apis::DeploymentmanagerV2::LogConfigDataAccessOptions, decorator: Google::Apis::DeploymentmanagerV2::LogConfigDataAccessOptions::Representation
      
        end
      end
      
      class LogConfigCloudAuditOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization_logging_options, as: 'authorizationLoggingOptions', class: Google::Apis::DeploymentmanagerV2::AuthorizationLoggingOptions, decorator: Google::Apis::DeploymentmanagerV2::AuthorizationLoggingOptions::Representation
      
          property :log_name, as: 'logName'
        end
      end
      
      class LogConfigCounterOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field'
          property :metric, as: 'metric'
        end
      end
      
      class LogConfigDataAccessOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :log_mode, as: 'logMode'
        end
      end
      
      class Manifest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DeploymentmanagerV2::ConfigFile, decorator: Google::Apis::DeploymentmanagerV2::ConfigFile::Representation
      
          property :expanded_config, as: 'expandedConfig'
          property :id, :numeric_string => true, as: 'id'
          collection :imports, as: 'imports', class: Google::Apis::DeploymentmanagerV2::ImportFile, decorator: Google::Apis::DeploymentmanagerV2::ImportFile::Representation
      
          property :insert_time, as: 'insertTime'
          property :layout, as: 'layout'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ListManifestsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :manifests, as: 'manifests', class: Google::Apis::DeploymentmanagerV2::Manifest, decorator: Google::Apis::DeploymentmanagerV2::Manifest::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_operation_id, as: 'clientOperationId'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :end_time, as: 'endTime'
          property :error, as: 'error', class: Google::Apis::DeploymentmanagerV2::Operation::Error, decorator: Google::Apis::DeploymentmanagerV2::Operation::Error::Representation
      
          property :http_error_message, as: 'httpErrorMessage'
          property :http_error_status_code, as: 'httpErrorStatusCode'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :operation_type, as: 'operationType'
          property :progress, as: 'progress'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :target_id, :numeric_string => true, as: 'targetId'
          property :target_link, as: 'targetLink'
          property :user, as: 'user'
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2::Operation::Warning, decorator: Google::Apis::DeploymentmanagerV2::Operation::Warning::Representation
      
          property :zone, as: 'zone'
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::DeploymentmanagerV2::Operation::Error::Error, decorator: Google::Apis::DeploymentmanagerV2::Operation::Error::Error::Representation
        
          end
          
          class Error
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :code, as: 'code'
              property :location, as: 'location'
              property :message, as: 'message'
            end
          end
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2::Operation::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2::Operation::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::DeploymentmanagerV2::Operation, decorator: Google::Apis::DeploymentmanagerV2::Operation::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::DeploymentmanagerV2::AuditConfig, decorator: Google::Apis::DeploymentmanagerV2::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::DeploymentmanagerV2::Binding, decorator: Google::Apis::DeploymentmanagerV2::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :iam_owned, as: 'iamOwned'
          collection :rules, as: 'rules', class: Google::Apis::DeploymentmanagerV2::Rule, decorator: Google::Apis::DeploymentmanagerV2::Rule::Representation
      
          property :version, as: 'version'
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_control, as: 'accessControl', class: Google::Apis::DeploymentmanagerV2::ResourceAccessControl, decorator: Google::Apis::DeploymentmanagerV2::ResourceAccessControl::Representation
      
          property :final_properties, as: 'finalProperties'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          property :manifest, as: 'manifest'
          property :name, as: 'name'
          property :properties, as: 'properties'
          property :type, as: 'type'
          property :update, as: 'update', class: Google::Apis::DeploymentmanagerV2::ResourceUpdate, decorator: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Representation
      
          property :update_time, as: 'updateTime'
          property :url, as: 'url'
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2::Resource::Warning, decorator: Google::Apis::DeploymentmanagerV2::Resource::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2::Resource::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2::Resource::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ResourceAccessControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcp_iam_policy, as: 'gcpIamPolicy'
        end
      end
      
      class ResourceUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_control, as: 'accessControl', class: Google::Apis::DeploymentmanagerV2::ResourceAccessControl, decorator: Google::Apis::DeploymentmanagerV2::ResourceAccessControl::Representation
      
          property :error, as: 'error', class: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error, decorator: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error::Representation
      
          property :final_properties, as: 'finalProperties'
          property :intent, as: 'intent'
          property :manifest, as: 'manifest'
          property :properties, as: 'properties'
          property :state, as: 'state'
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning, decorator: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning::Representation
      
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error::Error, decorator: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error::Error::Representation
        
          end
          
          class Error
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :code, as: 'code'
              property :location, as: 'location'
              property :message, as: 'message'
            end
          end
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ListResourcesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::DeploymentmanagerV2::Resource, decorator: Google::Apis::DeploymentmanagerV2::Resource::Representation
      
        end
      end
      
      class Rule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          collection :conditions, as: 'conditions', class: Google::Apis::DeploymentmanagerV2::Condition, decorator: Google::Apis::DeploymentmanagerV2::Condition::Representation
      
          property :description, as: 'description'
          collection :ins, as: 'ins'
          collection :log_configs, as: 'logConfigs', class: Google::Apis::DeploymentmanagerV2::LogConfig, decorator: Google::Apis::DeploymentmanagerV2::LogConfig::Representation
      
          collection :not_ins, as: 'notIns'
          collection :permissions, as: 'permissions'
        end
      end
      
      class TargetConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DeploymentmanagerV2::ConfigFile, decorator: Google::Apis::DeploymentmanagerV2::ConfigFile::Representation
      
          collection :imports, as: 'imports', class: Google::Apis::DeploymentmanagerV2::ImportFile, decorator: Google::Apis::DeploymentmanagerV2::ImportFile::Representation
      
        end
      end
      
      class TestPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class Type
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2::Operation, decorator: Google::Apis::DeploymentmanagerV2::Operation::Representation
      
          property :self_link, as: 'selfLink'
        end
      end
      
      class ListTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :types, as: 'types', class: Google::Apis::DeploymentmanagerV2::Type, decorator: Google::Apis::DeploymentmanagerV2::Type::Representation
      
        end
      end
    end
  end
end
