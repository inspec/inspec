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
    module CloudfunctionsV1
      
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
      
      class CallFunctionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CallFunctionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudFunction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTrigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FailurePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateDownloadUrlRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateDownloadUrlResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateUploadUrlRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateUploadUrlResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpsTrigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFunctionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Beta2
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Retry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceRepository
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
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::CloudfunctionsV1::AuditLogConfig, decorator: Google::Apis::CloudfunctionsV1::AuditLogConfig::Representation
      
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
          property :condition, as: 'condition', class: Google::Apis::CloudfunctionsV1::Expr, decorator: Google::Apis::CloudfunctionsV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class CallFunctionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, as: 'data'
        end
      end
      
      class CallFunctionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error'
          property :execution_id, as: 'executionId'
          property :result, as: 'result'
        end
      end
      
      class CloudFunction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :available_memory_mb, as: 'availableMemoryMb'
          property :description, as: 'description'
          property :entry_point, as: 'entryPoint'
          hash :environment_variables, as: 'environmentVariables'
          property :event_trigger, as: 'eventTrigger', class: Google::Apis::CloudfunctionsV1::EventTrigger, decorator: Google::Apis::CloudfunctionsV1::EventTrigger::Representation
      
          property :https_trigger, as: 'httpsTrigger', class: Google::Apis::CloudfunctionsV1::HttpsTrigger, decorator: Google::Apis::CloudfunctionsV1::HttpsTrigger::Representation
      
          hash :labels, as: 'labels'
          property :max_instances, as: 'maxInstances'
          property :name, as: 'name'
          property :network, as: 'network'
          property :runtime, as: 'runtime'
          property :service_account_email, as: 'serviceAccountEmail'
          property :source_archive_url, as: 'sourceArchiveUrl'
          property :source_repository, as: 'sourceRepository', class: Google::Apis::CloudfunctionsV1::SourceRepository, decorator: Google::Apis::CloudfunctionsV1::SourceRepository::Representation
      
          property :source_upload_url, as: 'sourceUploadUrl'
          property :status, as: 'status'
          property :timeout, as: 'timeout'
          property :update_time, as: 'updateTime'
          property :version_id, :numeric_string => true, as: 'versionId'
          property :vpc_connector, as: 'vpcConnector'
        end
      end
      
      class EventTrigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :event_type, as: 'eventType'
          property :failure_policy, as: 'failurePolicy', class: Google::Apis::CloudfunctionsV1::FailurePolicy, decorator: Google::Apis::CloudfunctionsV1::FailurePolicy::Representation
      
          property :resource, as: 'resource'
          property :service, as: 'service'
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
      
      class FailurePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :retry, as: 'retry', class: Google::Apis::CloudfunctionsV1::Retry, decorator: Google::Apis::CloudfunctionsV1::Retry::Representation
      
        end
      end
      
      class GenerateDownloadUrlRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :version_id, :numeric_string => true, as: 'versionId'
        end
      end
      
      class GenerateDownloadUrlResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :download_url, as: 'downloadUrl'
        end
      end
      
      class GenerateUploadUrlRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GenerateUploadUrlResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :upload_url, as: 'uploadUrl'
        end
      end
      
      class HttpsTrigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
      
      class ListFunctionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :functions, as: 'functions', class: Google::Apis::CloudfunctionsV1::CloudFunction, decorator: Google::Apis::CloudfunctionsV1::CloudFunction::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::CloudfunctionsV1::Location, decorator: Google::Apis::CloudfunctionsV1::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::CloudfunctionsV1::Operation, decorator: Google::Apis::CloudfunctionsV1::Operation::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::CloudfunctionsV1::Status, decorator: Google::Apis::CloudfunctionsV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :request, as: 'request'
          property :target, as: 'target'
          property :type, as: 'type'
          property :update_time, as: 'updateTime'
          property :version_id, :numeric_string => true, as: 'versionId'
        end
      end
      
      class OperationMetadataV1Beta2
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :request, as: 'request'
          property :target, as: 'target'
          property :type, as: 'type'
          property :update_time, as: 'updateTime'
          property :version_id, :numeric_string => true, as: 'versionId'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::CloudfunctionsV1::AuditConfig, decorator: Google::Apis::CloudfunctionsV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::CloudfunctionsV1::Binding, decorator: Google::Apis::CloudfunctionsV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Retry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudfunctionsV1::Policy, decorator: Google::Apis::CloudfunctionsV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class SourceRepository
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployed_url, as: 'deployedUrl'
          property :url, as: 'url'
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
