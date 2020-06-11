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
    module AppengineV1beta
      
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
      
      class AuthorizedCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizedDomain
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
      
      class BatchUpdateIngressRulesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUpdateIngressRulesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CertificateRawData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudBuildOptions
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
      
      class CustomMetric
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
      
      class DomainMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EndpointsApiService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Entrypoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorHandler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirewallRule
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
      
      class ListAuthorizedCertificatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAuthorizedDomainsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDomainMappingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListIngressRulesResponse
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
      
      class LivenessCheck
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
      
      class ManagedCertificate
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
      
      class OAuth2ClientInfo
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
      
      class OperationMetadataV1Alpha
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Beta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadinessCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepairApplicationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRecord
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
      
      class SslSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StandardSchedulerSettings
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
      
      class VpcAccessConnector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZipInfo
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
          collection :dispatch_rules, as: 'dispatchRules', class: Google::Apis::AppengineV1beta::UrlDispatchRule, decorator: Google::Apis::AppengineV1beta::UrlDispatchRule::Representation
      
          property :feature_settings, as: 'featureSettings', class: Google::Apis::AppengineV1beta::FeatureSettings, decorator: Google::Apis::AppengineV1beta::FeatureSettings::Representation
      
          property :gcr_domain, as: 'gcrDomain'
          property :iap, as: 'iap', class: Google::Apis::AppengineV1beta::IdentityAwareProxy, decorator: Google::Apis::AppengineV1beta::IdentityAwareProxy::Representation
      
          property :id, as: 'id'
          property :location_id, as: 'locationId'
          property :name, as: 'name'
          property :serving_status, as: 'servingStatus'
        end
      end
      
      class AuthorizedCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_raw_data, as: 'certificateRawData', class: Google::Apis::AppengineV1beta::CertificateRawData, decorator: Google::Apis::AppengineV1beta::CertificateRawData::Representation
      
          property :display_name, as: 'displayName'
          property :domain_mappings_count, as: 'domainMappingsCount'
          collection :domain_names, as: 'domainNames'
          property :expire_time, as: 'expireTime'
          property :id, as: 'id'
          property :managed_certificate, as: 'managedCertificate', class: Google::Apis::AppengineV1beta::ManagedCertificate, decorator: Google::Apis::AppengineV1beta::ManagedCertificate::Representation
      
          property :name, as: 'name'
          collection :visible_domain_mappings, as: 'visibleDomainMappings'
        end
      end
      
      class AuthorizedDomain
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class AutomaticScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cool_down_period, as: 'coolDownPeriod'
          property :cpu_utilization, as: 'cpuUtilization', class: Google::Apis::AppengineV1beta::CpuUtilization, decorator: Google::Apis::AppengineV1beta::CpuUtilization::Representation
      
          collection :custom_metrics, as: 'customMetrics', class: Google::Apis::AppengineV1beta::CustomMetric, decorator: Google::Apis::AppengineV1beta::CustomMetric::Representation
      
          property :disk_utilization, as: 'diskUtilization', class: Google::Apis::AppengineV1beta::DiskUtilization, decorator: Google::Apis::AppengineV1beta::DiskUtilization::Representation
      
          property :max_concurrent_requests, as: 'maxConcurrentRequests'
          property :max_idle_instances, as: 'maxIdleInstances'
          property :max_pending_latency, as: 'maxPendingLatency'
          property :max_total_instances, as: 'maxTotalInstances'
          property :min_idle_instances, as: 'minIdleInstances'
          property :min_pending_latency, as: 'minPendingLatency'
          property :min_total_instances, as: 'minTotalInstances'
          property :network_utilization, as: 'networkUtilization', class: Google::Apis::AppengineV1beta::NetworkUtilization, decorator: Google::Apis::AppengineV1beta::NetworkUtilization::Representation
      
          property :request_utilization, as: 'requestUtilization', class: Google::Apis::AppengineV1beta::RequestUtilization, decorator: Google::Apis::AppengineV1beta::RequestUtilization::Representation
      
          property :standard_scheduler_settings, as: 'standardSchedulerSettings', class: Google::Apis::AppengineV1beta::StandardSchedulerSettings, decorator: Google::Apis::AppengineV1beta::StandardSchedulerSettings::Representation
      
        end
      end
      
      class BasicScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :idle_timeout, as: 'idleTimeout'
          property :max_instances, as: 'maxInstances'
        end
      end
      
      class BatchUpdateIngressRulesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ingress_rules, as: 'ingressRules', class: Google::Apis::AppengineV1beta::FirewallRule, decorator: Google::Apis::AppengineV1beta::FirewallRule::Representation
      
        end
      end
      
      class BatchUpdateIngressRulesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ingress_rules, as: 'ingressRules', class: Google::Apis::AppengineV1beta::FirewallRule, decorator: Google::Apis::AppengineV1beta::FirewallRule::Representation
      
        end
      end
      
      class BuildInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class CertificateRawData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :private_key, as: 'privateKey'
          property :public_certificate, as: 'publicCertificate'
        end
      end
      
      class CloudBuildOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_yaml_path, as: 'appYamlPath'
          property :cloud_build_timeout, as: 'cloudBuildTimeout'
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
      
      class CustomMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
          property :metric_name, as: 'metricName'
          property :single_instance_assignment, as: 'singleInstanceAssignment'
          property :target_type, as: 'targetType'
          property :target_utilization, as: 'targetUtilization'
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
          property :build, as: 'build', class: Google::Apis::AppengineV1beta::BuildInfo, decorator: Google::Apis::AppengineV1beta::BuildInfo::Representation
      
          property :cloud_build_options, as: 'cloudBuildOptions', class: Google::Apis::AppengineV1beta::CloudBuildOptions, decorator: Google::Apis::AppengineV1beta::CloudBuildOptions::Representation
      
          property :container, as: 'container', class: Google::Apis::AppengineV1beta::ContainerInfo, decorator: Google::Apis::AppengineV1beta::ContainerInfo::Representation
      
          hash :files, as: 'files', class: Google::Apis::AppengineV1beta::FileInfo, decorator: Google::Apis::AppengineV1beta::FileInfo::Representation
      
          property :zip, as: 'zip', class: Google::Apis::AppengineV1beta::ZipInfo, decorator: Google::Apis::AppengineV1beta::ZipInfo::Representation
      
        end
      end
      
      class DiskUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_read_bytes_per_second, as: 'targetReadBytesPerSecond'
          property :target_read_ops_per_second, as: 'targetReadOpsPerSecond'
          property :target_write_bytes_per_second, as: 'targetWriteBytesPerSecond'
          property :target_write_ops_per_second, as: 'targetWriteOpsPerSecond'
        end
      end
      
      class DomainMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
          collection :resource_records, as: 'resourceRecords', class: Google::Apis::AppengineV1beta::ResourceRecord, decorator: Google::Apis::AppengineV1beta::ResourceRecord::Representation
      
          property :ssl_settings, as: 'sslSettings', class: Google::Apis::AppengineV1beta::SslSettings, decorator: Google::Apis::AppengineV1beta::SslSettings::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
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
      
      class Entrypoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :shell, as: 'shell'
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
      
      class FeatureSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :split_health_checks, as: 'splitHealthChecks'
          property :use_container_optimized_os, as: 'useContainerOptimizedOs'
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
      
      class FirewallRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :description, as: 'description'
          property :priority, as: 'priority'
          property :source_range, as: 'sourceRange'
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
          property :oauth2_client_info, as: 'oauth2ClientInfo', class: Google::Apis::AppengineV1beta::OAuth2ClientInfo, decorator: Google::Apis::AppengineV1beta::OAuth2ClientInfo::Representation
      
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
          property :start_time, as: 'startTime'
          property :vm_debug_enabled, as: 'vmDebugEnabled'
          property :vm_id, as: 'vmId'
          property :vm_ip, as: 'vmIp'
          property :vm_name, as: 'vmName'
          property :vm_status, as: 'vmStatus'
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
      
      class ListAuthorizedCertificatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :certificates, as: 'certificates', class: Google::Apis::AppengineV1beta::AuthorizedCertificate, decorator: Google::Apis::AppengineV1beta::AuthorizedCertificate::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListAuthorizedDomainsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::AppengineV1beta::AuthorizedDomain, decorator: Google::Apis::AppengineV1beta::AuthorizedDomain::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListDomainMappingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domain_mappings, as: 'domainMappings', class: Google::Apis::AppengineV1beta::DomainMapping, decorator: Google::Apis::AppengineV1beta::DomainMapping::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListIngressRulesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ingress_rules, as: 'ingressRules', class: Google::Apis::AppengineV1beta::FirewallRule, decorator: Google::Apis::AppengineV1beta::FirewallRule::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::AppengineV1beta::Instance, decorator: Google::Apis::AppengineV1beta::Instance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::AppengineV1beta::Location, decorator: Google::Apis::AppengineV1beta::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::AppengineV1beta::Operation, decorator: Google::Apis::AppengineV1beta::Operation::Representation
      
        end
      end
      
      class ListServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :services, as: 'services', class: Google::Apis::AppengineV1beta::Service, decorator: Google::Apis::AppengineV1beta::Service::Representation
      
        end
      end
      
      class ListVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :versions, as: 'versions', class: Google::Apis::AppengineV1beta::Version, decorator: Google::Apis::AppengineV1beta::Version::Representation
      
        end
      end
      
      class LivenessCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval, as: 'checkInterval'
          property :failure_threshold, as: 'failureThreshold'
          property :host, as: 'host'
          property :initial_delay, as: 'initialDelay'
          property :path, as: 'path'
          property :success_threshold, as: 'successThreshold'
          property :timeout, as: 'timeout'
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
      
      class ManagedCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_renewal_time, as: 'lastRenewalTime'
          property :status, as: 'status'
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
          property :session_affinity, as: 'sessionAffinity'
          property :subnetwork_name, as: 'subnetworkName'
        end
      end
      
      class NetworkUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_received_bytes_per_second, as: 'targetReceivedBytesPerSecond'
          property :target_received_packets_per_second, as: 'targetReceivedPacketsPerSecond'
          property :target_sent_bytes_per_second, as: 'targetSentBytesPerSecond'
          property :target_sent_packets_per_second, as: 'targetSentPacketsPerSecond'
        end
      end
      
      class OAuth2ClientInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_name, as: 'applicationName'
          property :client_name, as: 'clientName'
          property :developer_email_address, as: 'developerEmailAddress'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::AppengineV1beta::Status, decorator: Google::Apis::AppengineV1beta::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta::CreateVersionMetadataV1, decorator: Google::Apis::AppengineV1beta::CreateVersionMetadataV1::Representation
      
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
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta::CreateVersionMetadataV1Alpha, decorator: Google::Apis::AppengineV1beta::CreateVersionMetadataV1Alpha::Representation
      
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
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1beta::CreateVersionMetadataV1Beta, decorator: Google::Apis::AppengineV1beta::CreateVersionMetadataV1Beta::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class ReadinessCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_start_timeout, as: 'appStartTimeout'
          property :check_interval, as: 'checkInterval'
          property :failure_threshold, as: 'failureThreshold'
          property :host, as: 'host'
          property :path, as: 'path'
          property :success_threshold, as: 'successThreshold'
          property :timeout, as: 'timeout'
        end
      end
      
      class RepairApplicationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RequestUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target_concurrent_requests, as: 'targetConcurrentRequests'
          property :target_request_count_per_second, as: 'targetRequestCountPerSecond'
        end
      end
      
      class ResourceRecord
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :rrdata, as: 'rrdata'
          property :type, as: 'type'
        end
      end
      
      class Resources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpu, as: 'cpu'
          property :disk_gb, as: 'diskGb'
          property :memory_gb, as: 'memoryGb'
          collection :volumes, as: 'volumes', class: Google::Apis::AppengineV1beta::Volume, decorator: Google::Apis::AppengineV1beta::Volume::Representation
      
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
          property :split, as: 'split', class: Google::Apis::AppengineV1beta::TrafficSplit, decorator: Google::Apis::AppengineV1beta::TrafficSplit::Representation
      
        end
      end
      
      class SslSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_id, as: 'certificateId'
          property :pending_managed_certificate_id, as: 'pendingManagedCertificateId'
          property :ssl_management_type, as: 'sslManagementType'
        end
      end
      
      class StandardSchedulerSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_instances, as: 'maxInstances'
          property :min_instances, as: 'minInstances'
          property :target_cpu_utilization, as: 'targetCpuUtilization'
          property :target_throughput_utilization, as: 'targetThroughputUtilization'
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
          property :api_endpoint, as: 'apiEndpoint', class: Google::Apis::AppengineV1beta::ApiEndpointHandler, decorator: Google::Apis::AppengineV1beta::ApiEndpointHandler::Representation
      
          property :auth_fail_action, as: 'authFailAction'
          property :login, as: 'login'
          property :redirect_http_response_code, as: 'redirectHttpResponseCode'
          property :script, as: 'script', class: Google::Apis::AppengineV1beta::ScriptHandler, decorator: Google::Apis::AppengineV1beta::ScriptHandler::Representation
      
          property :security_level, as: 'securityLevel'
          property :static_files, as: 'staticFiles', class: Google::Apis::AppengineV1beta::StaticFilesHandler, decorator: Google::Apis::AppengineV1beta::StaticFilesHandler::Representation
      
          property :url_regex, as: 'urlRegex'
        end
      end
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_config, as: 'apiConfig', class: Google::Apis::AppengineV1beta::ApiConfigHandler, decorator: Google::Apis::AppengineV1beta::ApiConfigHandler::Representation
      
          property :automatic_scaling, as: 'automaticScaling', class: Google::Apis::AppengineV1beta::AutomaticScaling, decorator: Google::Apis::AppengineV1beta::AutomaticScaling::Representation
      
          property :basic_scaling, as: 'basicScaling', class: Google::Apis::AppengineV1beta::BasicScaling, decorator: Google::Apis::AppengineV1beta::BasicScaling::Representation
      
          hash :beta_settings, as: 'betaSettings'
          property :create_time, as: 'createTime'
          property :created_by, as: 'createdBy'
          property :default_expiration, as: 'defaultExpiration'
          property :deployment, as: 'deployment', class: Google::Apis::AppengineV1beta::Deployment, decorator: Google::Apis::AppengineV1beta::Deployment::Representation
      
          property :disk_usage_bytes, :numeric_string => true, as: 'diskUsageBytes'
          property :endpoints_api_service, as: 'endpointsApiService', class: Google::Apis::AppengineV1beta::EndpointsApiService, decorator: Google::Apis::AppengineV1beta::EndpointsApiService::Representation
      
          property :entrypoint, as: 'entrypoint', class: Google::Apis::AppengineV1beta::Entrypoint, decorator: Google::Apis::AppengineV1beta::Entrypoint::Representation
      
          property :env, as: 'env'
          hash :env_variables, as: 'envVariables'
          collection :error_handlers, as: 'errorHandlers', class: Google::Apis::AppengineV1beta::ErrorHandler, decorator: Google::Apis::AppengineV1beta::ErrorHandler::Representation
      
          collection :handlers, as: 'handlers', class: Google::Apis::AppengineV1beta::UrlMap, decorator: Google::Apis::AppengineV1beta::UrlMap::Representation
      
          property :health_check, as: 'healthCheck', class: Google::Apis::AppengineV1beta::HealthCheck, decorator: Google::Apis::AppengineV1beta::HealthCheck::Representation
      
          property :id, as: 'id'
          collection :inbound_services, as: 'inboundServices'
          property :instance_class, as: 'instanceClass'
          collection :libraries, as: 'libraries', class: Google::Apis::AppengineV1beta::Library, decorator: Google::Apis::AppengineV1beta::Library::Representation
      
          property :liveness_check, as: 'livenessCheck', class: Google::Apis::AppengineV1beta::LivenessCheck, decorator: Google::Apis::AppengineV1beta::LivenessCheck::Representation
      
          property :manual_scaling, as: 'manualScaling', class: Google::Apis::AppengineV1beta::ManualScaling, decorator: Google::Apis::AppengineV1beta::ManualScaling::Representation
      
          property :name, as: 'name'
          property :network, as: 'network', class: Google::Apis::AppengineV1beta::Network, decorator: Google::Apis::AppengineV1beta::Network::Representation
      
          property :nobuild_files_regex, as: 'nobuildFilesRegex'
          property :readiness_check, as: 'readinessCheck', class: Google::Apis::AppengineV1beta::ReadinessCheck, decorator: Google::Apis::AppengineV1beta::ReadinessCheck::Representation
      
          property :resources, as: 'resources', class: Google::Apis::AppengineV1beta::Resources, decorator: Google::Apis::AppengineV1beta::Resources::Representation
      
          property :runtime, as: 'runtime'
          property :runtime_api_version, as: 'runtimeApiVersion'
          property :runtime_channel, as: 'runtimeChannel'
          property :runtime_main_executable_path, as: 'runtimeMainExecutablePath'
          property :serving_status, as: 'servingStatus'
          property :threadsafe, as: 'threadsafe'
          property :version_url, as: 'versionUrl'
          property :vm, as: 'vm'
          property :vpc_access_connector, as: 'vpcAccessConnector', class: Google::Apis::AppengineV1beta::VpcAccessConnector, decorator: Google::Apis::AppengineV1beta::VpcAccessConnector::Representation
      
          collection :zones, as: 'zones'
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
      
      class VpcAccessConnector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class ZipInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :files_count, as: 'filesCount'
          property :source_url, as: 'sourceUrl'
        end
      end
    end
  end
end
