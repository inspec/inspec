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
    module AppengineV1beta5
      
      class ApiConfigHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApiEndpointHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Application
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutomaticScaling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BasicScaling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CpuUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1Alpha
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1Beta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DebugInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EndpointsApiService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityAwareProxy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Instance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Library
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInstancesResponse
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
      
      class ListServicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManualScaling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Network
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Alpha
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Beta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Beta5
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScriptHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StaticFilesHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrafficSplit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlDispatchRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMap
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApiConfigHandler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auth_fail_action, as: 'authFailAction'
          property :login, as: 'login'
          property :script, as: 'script'
          property :security_level, as: 'securityLevel'
          property :url, as: 'url'
        end
      end
      
      class ApiEndpointHandler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :script_path, as: 'scriptPath'
        end
      end
      
      class Application
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auth_domain, as: 'authDomain'
          property :code_bucket, as: 'codeBucket'
          property :default_bucket, as: 'defaultBucket'
          property :default_cookie_expiration, as: 'defaultCookieExpiration'
          property :default_hostname, as: 'defaultHostname'
          collection :dispatch_rules, as: 'dispatchRules', class: Google::Apis::AppengineV1beta5::UrlDispatchRule, decorator: Google::Apis::AppengineV1beta5::UrlDispatchRule::Representation
      
          property :iap, as: 'iap', class: Google::Apis::AppengineV1beta5::IdentityAwareProxy, decorator: Google::Apis::AppengineV1beta5::IdentityAwareProxy::Representation
      
          property :id, as: 'id'
          property :location, as: 'location'
          property :name, as: 'name'
        end
      end
      
      class AutomaticScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cool_down_period, as: 'coolDownPeriod'
          property :cpu_utilization, as: 'cpuUtilization', class: Google::Apis::AppengineV1beta5::CpuUtilization, decorator: Google::Apis::AppengineV1beta5::CpuUtilization::Representation
      
          property :disk_utilization, as: 'diskUtilization', class: Google::Apis::AppengineV1beta5::DiskUtilization, decorator: Google::Apis::AppengineV1beta5::DiskUtilization::Representation
      
          property :max_concurrent_requests, as: 'maxConcurrentRequests'
          property :max_idle_instances, as: 'maxIdleInstances'
          property :max_pending_latency, as: 'maxPendingLatency'
          property :max_total_instances, as: 'maxTotalInstances'
          property :min_idle_instances, as: 'minIdleInstances'
          property :min_pending_latency, as: 'minPendingLatency'
          property :min_total_instances, as: 'minTotalInstances'
          property :network_utilization, as: 'networkUtilization', class: Google::Apis::AppengineV1beta5::NetworkUtilization, decorator: Google::Apis::AppengineV1beta5::NetworkUtilization::Representation
      
          property :request_utilization, as: 'requestUtilization', class: Google::Apis::AppengineV1beta5::RequestUtilization, decorator: Google::Apis::AppengineV1beta5::RequestUtilization::Representation
      
        end
      end
      
      class BasicScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :idle_timeout, as: 'idleTimeout'
          property :max_instances, as: 'maxInstances'
        end
      end
      
      class ContainerInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
        end
      end
      
      class CpuUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregation_window_length, as: 'aggregationWindowLength'
          property :target_utilization, as: 'targetUtilization'
        end
      end
      
      class CreateVersionMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class CreateVersionMetadataV1Alpha
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class CreateVersionMetadataV1Beta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class DebugInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ssh_key, as: 'sshKey'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container, as: 'container', class: Google::Apis::AppengineV1beta5::ContainerInfo, decorator: Google::Apis::AppengineV1beta5::ContainerInfo::Representation
      
          hash :files, as: 'files', class: Google::Apis::AppengineV1beta5::FileInfo, decorator: Google::Apis::AppengineV1beta5::FileInfo::Representation
      
          collection :source_references, as: 'sourceReferences', class: Google::Apis::AppengineV1beta5::SourceReference, decorator: Google::Apis::AppengineV1beta5::SourceReference::Representation
      
        end
      end
      
      class DiskUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_read_bytes_per_sec, as: 'targetReadBytesPerSec'
          property :target_read_ops_per_sec, as: 'targetReadOpsPerSec'
          property :target_write_bytes_per_sec, as: 'targetWriteBytesPerSec'
          property :target_write_ops_per_sec, as: 'targetWriteOpsPerSec'
        end
      end
      
      class EndpointsApiService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_id, as: 'configId'
          property :disable_trace_sampling, as: 'disableTraceSampling'
          property :name, as: 'name'
          property :rollout_strategy, as: 'rolloutStrategy'
        end
      end
      
      class ErrorHandler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_code, as: 'errorCode'
          property :mime_type, as: 'mimeType'
          property :static_file, as: 'staticFile'
        end
      end
      
      class FileInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mime_type, as: 'mimeType'
          property :sha1_sum, as: 'sha1Sum'
          property :source_url, as: 'sourceUrl'
        end
      end
      
      class HealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval, as: 'checkInterval'
          property :disable_health_check, as: 'disableHealthCheck'
          property :healthy_threshold, as: 'healthyThreshold'
          property :host, as: 'host'
          property :restart_threshold, as: 'restartThreshold'
          property :timeout, as: 'timeout'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class IdentityAwareProxy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :oauth2_client_id, as: 'oauth2ClientId'
          property :oauth2_client_secret, as: 'oauth2ClientSecret'
          property :oauth2_client_secret_sha256, as: 'oauth2ClientSecretSha256'
        end
      end
      
      class Instance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_engine_release, as: 'appEngineRelease'
          property :availability, as: 'availability'
          property :average_latency, as: 'averageLatency'
          property :errors, as: 'errors'
          property :id, as: 'id'
          property :memory_usage, :numeric_string => true, as: 'memoryUsage'
          property :name, as: 'name'
          property :qps, as: 'qps'
          property :requests, as: 'requests'
          property :start_timestamp, as: 'startTimestamp'
          property :vm_id, as: 'vmId'
          property :vm_ip, as: 'vmIp'
          property :vm_name, as: 'vmName'
          property :vm_status, as: 'vmStatus'
          property :vm_unlocked, as: 'vmUnlocked'
          property :vm_zone_name, as: 'vmZoneName'
        end
      end
      
      class Library
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :version, as: 'version'
        end
      end
      
      class ListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::AppengineV1beta5::Instance, decorator: Google::Apis::AppengineV1beta5::Instance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::AppengineV1beta5::Location, decorator: Google::Apis::AppengineV1beta5::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::AppengineV1beta5::Operation, decorator: Google::Apis::AppengineV1beta5::Operation::Representation
      
        end
      end
      
      class ListServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :services, as: 'services', class: Google::Apis::AppengineV1beta5::Service, decorator: Google::Apis::AppengineV1beta5::Service::Representation
      
        end
      end
      
      class ListVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :versions, as: 'versions', class: Google::Apis::AppengineV1beta5::Version, decorator: Google::Apis::AppengineV1beta5::Version::Representation
      
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
      
      class LocationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :flexible_environment_available, as: 'flexibleEnvironmentAvailable'
          property :standard_environment_available, as: 'standardEnvironmentAvailable'
        end
      end
      
      class ManualScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instances, as: 'instances'
        end
      end
      
      class Network
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :forwarded_ports, as: 'forwardedPorts'
          property :instance_tag, as: 'instanceTag'
          property :name, as: 'name'
          property :subnetwork_name, as: 'subnetworkName'
        end
      end
      
      class NetworkUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_received_bytes_per_sec, as: 'targetReceivedBytesPerSec'
          property :target_received_packets_per_sec, as: 'targetReceivedPacketsPerSec'
          property :target_sent_bytes_per_sec, as: 'targetSentBytesPerSec'
          property :target_sent_packets_per_sec, as: 'targetSentPacketsPerSec'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::AppengineV1beta5::Status, decorator: Google::Apis::AppengineV1beta5::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :operation_type, as: 'operationType'
          property :target, as: 'target'
          property :user, as: 'user'
        end
      end
      
      class OperationMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1, decorator: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class OperationMetadataV1Alpha
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1Alpha, decorator: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1Alpha::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class OperationMetadataV1Beta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1Beta, decorator: Google::Apis::AppengineV1beta5::CreateVersionMetadataV1Beta::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class OperationMetadataV1Beta5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
        end
      end
      
      class RequestUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_concurrent_requests, as: 'targetConcurrentRequests'
          property :target_request_count_per_sec, as: 'targetRequestCountPerSec'
        end
      end
      
      class Resources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpu, as: 'cpu'
          property :disk_gb, as: 'diskGb'
          property :memory_gb, as: 'memoryGb'
          collection :volumes, as: 'volumes', class: Google::Apis::AppengineV1beta5::Volume, decorator: Google::Apis::AppengineV1beta5::Volume::Representation
      
        end
      end
      
      class ScriptHandler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :script_path, as: 'scriptPath'
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
          property :split, as: 'split', class: Google::Apis::AppengineV1beta5::TrafficSplit, decorator: Google::Apis::AppengineV1beta5::TrafficSplit::Representation
      
        end
      end
      
      class SourceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repository, as: 'repository'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class StaticFilesHandler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_readable, as: 'applicationReadable'
          property :expiration, as: 'expiration'
          hash :http_headers, as: 'httpHeaders'
          property :mime_type, as: 'mimeType'
          property :path, as: 'path'
          property :require_matching_file, as: 'requireMatchingFile'
          property :upload_path_regex, as: 'uploadPathRegex'
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
      
      class TrafficSplit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :allocations, as: 'allocations'
          property :shard_by, as: 'shardBy'
        end
      end
      
      class UrlDispatchRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain, as: 'domain'
          property :path, as: 'path'
          property :service, as: 'service'
        end
      end
      
      class UrlMap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_endpoint, as: 'apiEndpoint', class: Google::Apis::AppengineV1beta5::ApiEndpointHandler, decorator: Google::Apis::AppengineV1beta5::ApiEndpointHandler::Representation
      
          property :auth_fail_action, as: 'authFailAction'
          property :login, as: 'login'
          property :redirect_http_response_code, as: 'redirectHttpResponseCode'
          property :script, as: 'script', class: Google::Apis::AppengineV1beta5::ScriptHandler, decorator: Google::Apis::AppengineV1beta5::ScriptHandler::Representation
      
          property :security_level, as: 'securityLevel'
          property :static_files, as: 'staticFiles', class: Google::Apis::AppengineV1beta5::StaticFilesHandler, decorator: Google::Apis::AppengineV1beta5::StaticFilesHandler::Representation
      
          property :url_regex, as: 'urlRegex'
        end
      end
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_config, as: 'apiConfig', class: Google::Apis::AppengineV1beta5::ApiConfigHandler, decorator: Google::Apis::AppengineV1beta5::ApiConfigHandler::Representation
      
          property :automatic_scaling, as: 'automaticScaling', class: Google::Apis::AppengineV1beta5::AutomaticScaling, decorator: Google::Apis::AppengineV1beta5::AutomaticScaling::Representation
      
          property :basic_scaling, as: 'basicScaling', class: Google::Apis::AppengineV1beta5::BasicScaling, decorator: Google::Apis::AppengineV1beta5::BasicScaling::Representation
      
          hash :beta_settings, as: 'betaSettings'
          property :creation_time, as: 'creationTime'
          property :default_expiration, as: 'defaultExpiration'
          property :deployer, as: 'deployer'
          property :deployment, as: 'deployment', class: Google::Apis::AppengineV1beta5::Deployment, decorator: Google::Apis::AppengineV1beta5::Deployment::Representation
      
          property :disk_usage_bytes, :numeric_string => true, as: 'diskUsageBytes'
          property :endpoints_api_service, as: 'endpointsApiService', class: Google::Apis::AppengineV1beta5::EndpointsApiService, decorator: Google::Apis::AppengineV1beta5::EndpointsApiService::Representation
      
          property :env, as: 'env'
          hash :env_variables, as: 'envVariables'
          collection :error_handlers, as: 'errorHandlers', class: Google::Apis::AppengineV1beta5::ErrorHandler, decorator: Google::Apis::AppengineV1beta5::ErrorHandler::Representation
      
          collection :handlers, as: 'handlers', class: Google::Apis::AppengineV1beta5::UrlMap, decorator: Google::Apis::AppengineV1beta5::UrlMap::Representation
      
          property :health_check, as: 'healthCheck', class: Google::Apis::AppengineV1beta5::HealthCheck, decorator: Google::Apis::AppengineV1beta5::HealthCheck::Representation
      
          property :id, as: 'id'
          collection :inbound_services, as: 'inboundServices'
          property :instance_class, as: 'instanceClass'
          collection :libraries, as: 'libraries', class: Google::Apis::AppengineV1beta5::Library, decorator: Google::Apis::AppengineV1beta5::Library::Representation
      
          property :manual_scaling, as: 'manualScaling', class: Google::Apis::AppengineV1beta5::ManualScaling, decorator: Google::Apis::AppengineV1beta5::ManualScaling::Representation
      
          property :name, as: 'name'
          property :network, as: 'network', class: Google::Apis::AppengineV1beta5::Network, decorator: Google::Apis::AppengineV1beta5::Network::Representation
      
          property :nobuild_files_regex, as: 'nobuildFilesRegex'
          property :resources, as: 'resources', class: Google::Apis::AppengineV1beta5::Resources, decorator: Google::Apis::AppengineV1beta5::Resources::Representation
      
          property :runtime, as: 'runtime'
          property :runtime_api_version, as: 'runtimeApiVersion'
          property :runtime_main_executable_path, as: 'runtimeMainExecutablePath'
          property :serving_status, as: 'servingStatus'
          property :threadsafe, as: 'threadsafe'
          property :vm, as: 'vm'
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :size_gb, as: 'sizeGb'
          property :volume_type, as: 'volumeType'
        end
      end
    end
  end
end
