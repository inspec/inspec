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
    module CloudfunctionsV1beta2
      
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
      
      class Retry
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
          property :entry_point, as: 'entryPoint'
          hash :environment_variables, as: 'environmentVariables'
          property :event_trigger, as: 'eventTrigger', class: Google::Apis::CloudfunctionsV1beta2::EventTrigger, decorator: Google::Apis::CloudfunctionsV1beta2::EventTrigger::Representation
      
          property :https_trigger, as: 'httpsTrigger', class: Google::Apis::CloudfunctionsV1beta2::HttpsTrigger, decorator: Google::Apis::CloudfunctionsV1beta2::HttpsTrigger::Representation
      
          hash :labels, as: 'labels'
          property :latest_operation, as: 'latestOperation'
          property :max_instances, as: 'maxInstances'
          property :name, as: 'name'
          property :network, as: 'network'
          property :runtime, as: 'runtime'
          property :service_account, as: 'serviceAccount'
          property :source_archive_url, as: 'sourceArchiveUrl'
          property :source_repository, as: 'sourceRepository', class: Google::Apis::CloudfunctionsV1beta2::SourceRepository, decorator: Google::Apis::CloudfunctionsV1beta2::SourceRepository::Representation
      
          property :source_repository_url, as: 'sourceRepositoryUrl'
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
          property :failure_policy, as: 'failurePolicy', class: Google::Apis::CloudfunctionsV1beta2::FailurePolicy, decorator: Google::Apis::CloudfunctionsV1beta2::FailurePolicy::Representation
      
          property :resource, as: 'resource'
          property :service, as: 'service'
        end
      end
      
      class FailurePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :retry, as: 'retry', class: Google::Apis::CloudfunctionsV1beta2::Retry, decorator: Google::Apis::CloudfunctionsV1beta2::Retry::Representation
      
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
          collection :functions, as: 'functions', class: Google::Apis::CloudfunctionsV1beta2::CloudFunction, decorator: Google::Apis::CloudfunctionsV1beta2::CloudFunction::Representation
      
          property :next_page_token, as: 'nextPageToken'
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::CloudfunctionsV1beta2::Location, decorator: Google::Apis::CloudfunctionsV1beta2::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::CloudfunctionsV1beta2::Operation, decorator: Google::Apis::CloudfunctionsV1beta2::Operation::Representation
      
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
          property :error, as: 'error', class: Google::Apis::CloudfunctionsV1beta2::Status, decorator: Google::Apis::CloudfunctionsV1beta2::Status::Representation
      
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
      
      class Retry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SourceRepository
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :branch, as: 'branch'
          property :deployed_revision, as: 'deployedRevision'
          property :repository_url, as: 'repositoryUrl'
          property :revision, as: 'revision'
          property :source_path, as: 'sourcePath'
          property :tag, as: 'tag'
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
    end
  end
end
