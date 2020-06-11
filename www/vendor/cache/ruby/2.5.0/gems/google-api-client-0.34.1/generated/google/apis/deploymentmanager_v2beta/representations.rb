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
    module DeploymentmanagerV2beta
      
      class AsyncOptions
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
      
      class AuthorizationLoggingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BaseType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BasicAuth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CollectionOverride
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompositeType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompositeTypeLabelEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompositeTypesListResponse
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
      
      class Credential
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
      
      class DeploymentsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentsStopRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Diagnostic
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
      
      class InputMapping
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
      
      class ManifestsListResponse
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
      
      class OperationsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Options
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PollingOptions
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
      
      class ResourcesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TemplateContents
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
      
      class TypeInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeInfoSchemaInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeLabelEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeProvider
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeProviderLabelEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeProvidersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypeProvidersListTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ValidationOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :method_match, as: 'methodMatch'
          property :polling_options, as: 'pollingOptions', class: Google::Apis::DeploymentmanagerV2beta::PollingOptions, decorator: Google::Apis::DeploymentmanagerV2beta::PollingOptions::Representation
      
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::DeploymentmanagerV2beta::AuditLogConfig, decorator: Google::Apis::DeploymentmanagerV2beta::AuditLogConfig::Representation
      
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
      
      class BaseType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_overrides, as: 'collectionOverrides', class: Google::Apis::DeploymentmanagerV2beta::CollectionOverride, decorator: Google::Apis::DeploymentmanagerV2beta::CollectionOverride::Representation
      
          property :credential, as: 'credential', class: Google::Apis::DeploymentmanagerV2beta::Credential, decorator: Google::Apis::DeploymentmanagerV2beta::Credential::Representation
      
          property :descriptor_url, as: 'descriptorUrl'
          property :options, as: 'options', class: Google::Apis::DeploymentmanagerV2beta::Options, decorator: Google::Apis::DeploymentmanagerV2beta::Options::Representation
      
        end
      end
      
      class BasicAuth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :password, as: 'password'
          property :user, as: 'user'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::DeploymentmanagerV2beta::Expr, decorator: Google::Apis::DeploymentmanagerV2beta::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class CollectionOverride
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :collection, as: 'collection'
          property :options, as: 'options', class: Google::Apis::DeploymentmanagerV2beta::Options, decorator: Google::Apis::DeploymentmanagerV2beta::Options::Representation
      
        end
      end
      
      class CompositeType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2beta::CompositeTypeLabelEntry, decorator: Google::Apis::DeploymentmanagerV2beta::CompositeTypeLabelEntry::Representation
      
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2beta::Operation, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Representation
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :template_contents, as: 'templateContents', class: Google::Apis::DeploymentmanagerV2beta::TemplateContents, decorator: Google::Apis::DeploymentmanagerV2beta::TemplateContents::Representation
      
        end
      end
      
      class CompositeTypeLabelEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class CompositeTypesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :composite_types, as: 'compositeTypes', class: Google::Apis::DeploymentmanagerV2beta::CompositeType, decorator: Google::Apis::DeploymentmanagerV2beta::CompositeType::Representation
      
          property :next_page_token, as: 'nextPageToken'
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
      
      class Credential
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :basic_auth, as: 'basicAuth', class: Google::Apis::DeploymentmanagerV2beta::BasicAuth, decorator: Google::Apis::DeploymentmanagerV2beta::BasicAuth::Representation
      
          property :service_account, as: 'serviceAccount', class: Google::Apis::DeploymentmanagerV2beta::ServiceAccount, decorator: Google::Apis::DeploymentmanagerV2beta::ServiceAccount::Representation
      
          property :use_project_default, as: 'useProjectDefault'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2beta::DeploymentLabelEntry, decorator: Google::Apis::DeploymentmanagerV2beta::DeploymentLabelEntry::Representation
      
          property :manifest, as: 'manifest'
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2beta::Operation, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Representation
      
          property :self_link, as: 'selfLink'
          property :target, as: 'target', class: Google::Apis::DeploymentmanagerV2beta::TargetConfiguration, decorator: Google::Apis::DeploymentmanagerV2beta::TargetConfiguration::Representation
      
          property :update, as: 'update', class: Google::Apis::DeploymentmanagerV2beta::DeploymentUpdate, decorator: Google::Apis::DeploymentmanagerV2beta::DeploymentUpdate::Representation
      
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
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2beta::DeploymentUpdateLabelEntry, decorator: Google::Apis::DeploymentmanagerV2beta::DeploymentUpdateLabelEntry::Representation
      
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
      
      class DeploymentsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deployments, as: 'deployments', class: Google::Apis::DeploymentmanagerV2beta::Deployment, decorator: Google::Apis::DeploymentmanagerV2beta::Deployment::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DeploymentsStopRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
        end
      end
      
      class Diagnostic
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field'
          property :level, as: 'level'
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
          collection :bindings, as: 'bindings', class: Google::Apis::DeploymentmanagerV2beta::Binding, decorator: Google::Apis::DeploymentmanagerV2beta::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::DeploymentmanagerV2beta::Policy, decorator: Google::Apis::DeploymentmanagerV2beta::Policy::Representation
      
        end
      end
      
      class ImportFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :name, as: 'name'
        end
      end
      
      class InputMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field_name, as: 'fieldName'
          property :location, as: 'location'
          property :method_match, as: 'methodMatch'
          property :value, as: 'value'
        end
      end
      
      class LogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_audit, as: 'cloudAudit', class: Google::Apis::DeploymentmanagerV2beta::LogConfigCloudAuditOptions, decorator: Google::Apis::DeploymentmanagerV2beta::LogConfigCloudAuditOptions::Representation
      
          property :counter, as: 'counter', class: Google::Apis::DeploymentmanagerV2beta::LogConfigCounterOptions, decorator: Google::Apis::DeploymentmanagerV2beta::LogConfigCounterOptions::Representation
      
          property :data_access, as: 'dataAccess', class: Google::Apis::DeploymentmanagerV2beta::LogConfigDataAccessOptions, decorator: Google::Apis::DeploymentmanagerV2beta::LogConfigDataAccessOptions::Representation
      
        end
      end
      
      class LogConfigCloudAuditOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization_logging_options, as: 'authorizationLoggingOptions', class: Google::Apis::DeploymentmanagerV2beta::AuthorizationLoggingOptions, decorator: Google::Apis::DeploymentmanagerV2beta::AuthorizationLoggingOptions::Representation
      
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
          property :config, as: 'config', class: Google::Apis::DeploymentmanagerV2beta::ConfigFile, decorator: Google::Apis::DeploymentmanagerV2beta::ConfigFile::Representation
      
          property :expanded_config, as: 'expandedConfig'
          property :id, :numeric_string => true, as: 'id'
          collection :imports, as: 'imports', class: Google::Apis::DeploymentmanagerV2beta::ImportFile, decorator: Google::Apis::DeploymentmanagerV2beta::ImportFile::Representation
      
          property :insert_time, as: 'insertTime'
          property :layout, as: 'layout'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ManifestsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :manifests, as: 'manifests', class: Google::Apis::DeploymentmanagerV2beta::Manifest, decorator: Google::Apis::DeploymentmanagerV2beta::Manifest::Representation
      
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
          property :error, as: 'error', class: Google::Apis::DeploymentmanagerV2beta::Operation::Error, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Error::Representation
      
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
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2beta::Operation::Warning, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Warning::Representation
      
          property :zone, as: 'zone'
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::DeploymentmanagerV2beta::Operation::Error::Error, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Error::Error::Representation
        
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
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2beta::Operation::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Warning::Datum::Representation
        
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
      
      class OperationsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::DeploymentmanagerV2beta::Operation, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Representation
      
        end
      end
      
      class Options
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :async_options, as: 'asyncOptions', class: Google::Apis::DeploymentmanagerV2beta::AsyncOptions, decorator: Google::Apis::DeploymentmanagerV2beta::AsyncOptions::Representation
      
          collection :input_mappings, as: 'inputMappings', class: Google::Apis::DeploymentmanagerV2beta::InputMapping, decorator: Google::Apis::DeploymentmanagerV2beta::InputMapping::Representation
      
          property :validation_options, as: 'validationOptions', class: Google::Apis::DeploymentmanagerV2beta::ValidationOptions, decorator: Google::Apis::DeploymentmanagerV2beta::ValidationOptions::Representation
      
          property :virtual_properties, as: 'virtualProperties'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::DeploymentmanagerV2beta::AuditConfig, decorator: Google::Apis::DeploymentmanagerV2beta::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::DeploymentmanagerV2beta::Binding, decorator: Google::Apis::DeploymentmanagerV2beta::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :iam_owned, as: 'iamOwned'
          collection :rules, as: 'rules', class: Google::Apis::DeploymentmanagerV2beta::Rule, decorator: Google::Apis::DeploymentmanagerV2beta::Rule::Representation
      
          property :version, as: 'version'
        end
      end
      
      class PollingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :diagnostics, as: 'diagnostics', class: Google::Apis::DeploymentmanagerV2beta::Diagnostic, decorator: Google::Apis::DeploymentmanagerV2beta::Diagnostic::Representation
      
          property :fail_condition, as: 'failCondition'
          property :finish_condition, as: 'finishCondition'
          property :polling_link, as: 'pollingLink'
          property :target_link, as: 'targetLink'
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_control, as: 'accessControl', class: Google::Apis::DeploymentmanagerV2beta::ResourceAccessControl, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceAccessControl::Representation
      
          property :final_properties, as: 'finalProperties'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          property :manifest, as: 'manifest'
          property :name, as: 'name'
          property :properties, as: 'properties'
          property :type, as: 'type'
          property :update, as: 'update', class: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Representation
      
          property :update_time, as: 'updateTime'
          property :url, as: 'url'
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2beta::Resource::Warning, decorator: Google::Apis::DeploymentmanagerV2beta::Resource::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2beta::Resource::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2beta::Resource::Warning::Datum::Representation
        
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
          property :access_control, as: 'accessControl', class: Google::Apis::DeploymentmanagerV2beta::ResourceAccessControl, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceAccessControl::Representation
      
          property :error, as: 'error', class: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Error, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Error::Representation
      
          property :final_properties, as: 'finalProperties'
          property :intent, as: 'intent'
          property :manifest, as: 'manifest'
          property :properties, as: 'properties'
          property :state, as: 'state'
          collection :warnings, as: 'warnings', class: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Warning, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Warning::Representation
      
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Error::Error, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Error::Error::Representation
        
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
            collection :data, as: 'data', class: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Warning::Datum, decorator: Google::Apis::DeploymentmanagerV2beta::ResourceUpdate::Warning::Datum::Representation
        
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
      
      class ResourcesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::DeploymentmanagerV2beta::Resource, decorator: Google::Apis::DeploymentmanagerV2beta::Resource::Representation
      
        end
      end
      
      class Rule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          collection :conditions, as: 'conditions', class: Google::Apis::DeploymentmanagerV2beta::Condition, decorator: Google::Apis::DeploymentmanagerV2beta::Condition::Representation
      
          property :description, as: 'description'
          collection :ins, as: 'ins'
          collection :log_configs, as: 'logConfigs', class: Google::Apis::DeploymentmanagerV2beta::LogConfig, decorator: Google::Apis::DeploymentmanagerV2beta::LogConfig::Representation
      
          collection :not_ins, as: 'notIns'
          collection :permissions, as: 'permissions'
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
        end
      end
      
      class TargetConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::DeploymentmanagerV2beta::ConfigFile, decorator: Google::Apis::DeploymentmanagerV2beta::ConfigFile::Representation
      
          collection :imports, as: 'imports', class: Google::Apis::DeploymentmanagerV2beta::ImportFile, decorator: Google::Apis::DeploymentmanagerV2beta::ImportFile::Representation
      
        end
      end
      
      class TemplateContents
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :imports, as: 'imports', class: Google::Apis::DeploymentmanagerV2beta::ImportFile, decorator: Google::Apis::DeploymentmanagerV2beta::ImportFile::Representation
      
          property :interpreter, as: 'interpreter'
          property :main_template, as: 'mainTemplate'
          property :schema, as: 'schema'
          property :template, as: 'template'
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
          property :base, as: 'base', class: Google::Apis::DeploymentmanagerV2beta::BaseType, decorator: Google::Apis::DeploymentmanagerV2beta::BaseType::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2beta::TypeLabelEntry, decorator: Google::Apis::DeploymentmanagerV2beta::TypeLabelEntry::Representation
      
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2beta::Operation, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Representation
      
          property :self_link, as: 'selfLink'
        end
      end
      
      class TypeInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :documentation_link, as: 'documentationLink'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :schema, as: 'schema', class: Google::Apis::DeploymentmanagerV2beta::TypeInfoSchemaInfo, decorator: Google::Apis::DeploymentmanagerV2beta::TypeInfoSchemaInfo::Representation
      
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
        end
      end
      
      class TypeInfoSchemaInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input, as: 'input'
          property :output, as: 'output'
        end
      end
      
      class TypeLabelEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class TypeProvider
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :collection_overrides, as: 'collectionOverrides', class: Google::Apis::DeploymentmanagerV2beta::CollectionOverride, decorator: Google::Apis::DeploymentmanagerV2beta::CollectionOverride::Representation
      
          property :credential, as: 'credential', class: Google::Apis::DeploymentmanagerV2beta::Credential, decorator: Google::Apis::DeploymentmanagerV2beta::Credential::Representation
      
          property :description, as: 'description'
          property :descriptor_url, as: 'descriptorUrl'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          collection :labels, as: 'labels', class: Google::Apis::DeploymentmanagerV2beta::TypeProviderLabelEntry, decorator: Google::Apis::DeploymentmanagerV2beta::TypeProviderLabelEntry::Representation
      
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::DeploymentmanagerV2beta::Operation, decorator: Google::Apis::DeploymentmanagerV2beta::Operation::Representation
      
          property :options, as: 'options', class: Google::Apis::DeploymentmanagerV2beta::Options, decorator: Google::Apis::DeploymentmanagerV2beta::Options::Representation
      
          property :self_link, as: 'selfLink'
        end
      end
      
      class TypeProviderLabelEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class TypeProvidersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :type_providers, as: 'typeProviders', class: Google::Apis::DeploymentmanagerV2beta::TypeProvider, decorator: Google::Apis::DeploymentmanagerV2beta::TypeProvider::Representation
      
        end
      end
      
      class TypeProvidersListTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :types, as: 'types', class: Google::Apis::DeploymentmanagerV2beta::TypeInfo, decorator: Google::Apis::DeploymentmanagerV2beta::TypeInfo::Representation
      
        end
      end
      
      class TypesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :types, as: 'types', class: Google::Apis::DeploymentmanagerV2beta::Type, decorator: Google::Apis::DeploymentmanagerV2beta::Type::Representation
      
        end
      end
      
      class ValidationOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :schema_validation, as: 'schemaValidation'
          property :undeclared_properties, as: 'undeclaredProperties'
        end
      end
    end
  end
end
