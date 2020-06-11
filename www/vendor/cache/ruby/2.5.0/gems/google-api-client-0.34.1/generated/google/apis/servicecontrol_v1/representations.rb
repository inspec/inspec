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
    module ServicecontrolV1
      
      class AllocateInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocateQuotaRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocateQuotaResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Auth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthenticationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConsumerInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Distribution
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Exemplar
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExplicitBuckets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExponentialBuckets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirstPartyPrincipal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LinearBuckets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntryOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntrySourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricValueSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Money
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Peer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Request
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccountDelegationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThirdPartyPrincipal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocateInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :unused_arguments, as: 'unusedArguments'
        end
      end
      
      class AllocateQuotaRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allocate_operation, as: 'allocateOperation', class: Google::Apis::ServicecontrolV1::QuotaOperation, decorator: Google::Apis::ServicecontrolV1::QuotaOperation::Representation
      
          property :service_config_id, as: 'serviceConfigId'
        end
      end
      
      class AllocateQuotaResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allocate_errors, as: 'allocateErrors', class: Google::Apis::ServicecontrolV1::QuotaError, decorator: Google::Apis::ServicecontrolV1::QuotaError::Representation
      
          property :allocate_info, as: 'allocateInfo', class: Google::Apis::ServicecontrolV1::AllocateInfo, decorator: Google::Apis::ServicecontrolV1::AllocateInfo::Representation
      
          property :operation_id, as: 'operationId'
          collection :quota_metrics, as: 'quotaMetrics', class: Google::Apis::ServicecontrolV1::MetricValueSet, decorator: Google::Apis::ServicecontrolV1::MetricValueSet::Representation
      
          property :service_config_id, as: 'serviceConfigId'
        end
      end
      
      class AuditLog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authentication_info, as: 'authenticationInfo', class: Google::Apis::ServicecontrolV1::AuthenticationInfo, decorator: Google::Apis::ServicecontrolV1::AuthenticationInfo::Representation
      
          collection :authorization_info, as: 'authorizationInfo', class: Google::Apis::ServicecontrolV1::AuthorizationInfo, decorator: Google::Apis::ServicecontrolV1::AuthorizationInfo::Representation
      
          hash :metadata, as: 'metadata'
          property :method_name, as: 'methodName'
          property :num_response_items, :numeric_string => true, as: 'numResponseItems'
          hash :request, as: 'request'
          property :request_metadata, as: 'requestMetadata', class: Google::Apis::ServicecontrolV1::RequestMetadata, decorator: Google::Apis::ServicecontrolV1::RequestMetadata::Representation
      
          property :resource_location, as: 'resourceLocation', class: Google::Apis::ServicecontrolV1::ResourceLocation, decorator: Google::Apis::ServicecontrolV1::ResourceLocation::Representation
      
          property :resource_name, as: 'resourceName'
          hash :resource_original_state, as: 'resourceOriginalState'
          hash :response, as: 'response'
          hash :service_data, as: 'serviceData'
          property :service_name, as: 'serviceName'
          property :status, as: 'status', class: Google::Apis::ServicecontrolV1::Status, decorator: Google::Apis::ServicecontrolV1::Status::Representation
      
        end
      end
      
      class Auth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access_levels, as: 'accessLevels'
          collection :audiences, as: 'audiences'
          hash :claims, as: 'claims'
          property :presenter, as: 'presenter'
          property :principal, as: 'principal'
        end
      end
      
      class AuthenticationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authority_selector, as: 'authoritySelector'
          property :principal_email, as: 'principalEmail'
          collection :service_account_delegation_info, as: 'serviceAccountDelegationInfo', class: Google::Apis::ServicecontrolV1::ServiceAccountDelegationInfo, decorator: Google::Apis::ServicecontrolV1::ServiceAccountDelegationInfo::Representation
      
          property :service_account_key_name, as: 'serviceAccountKeyName'
          hash :third_party_principal, as: 'thirdPartyPrincipal'
        end
      end
      
      class AuthorizationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :granted, as: 'granted'
          property :permission, as: 'permission'
          property :resource, as: 'resource'
          property :resource_attributes, as: 'resourceAttributes', class: Google::Apis::ServicecontrolV1::Resource, decorator: Google::Apis::ServicecontrolV1::Resource::Representation
      
        end
      end
      
      class CheckError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :detail, as: 'detail'
          property :status, as: 'status', class: Google::Apis::ServicecontrolV1::Status, decorator: Google::Apis::ServicecontrolV1::Status::Representation
      
          property :subject, as: 'subject'
        end
      end
      
      class CheckInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_info, as: 'consumerInfo', class: Google::Apis::ServicecontrolV1::ConsumerInfo, decorator: Google::Apis::ServicecontrolV1::ConsumerInfo::Representation
      
          collection :unused_arguments, as: 'unusedArguments'
        end
      end
      
      class CheckRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation, as: 'operation', class: Google::Apis::ServicecontrolV1::Operation, decorator: Google::Apis::ServicecontrolV1::Operation::Representation
      
          property :request_project_settings, as: 'requestProjectSettings'
          property :service_config_id, as: 'serviceConfigId'
          property :skip_activation_check, as: 'skipActivationCheck'
        end
      end
      
      class CheckResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :check_errors, as: 'checkErrors', class: Google::Apis::ServicecontrolV1::CheckError, decorator: Google::Apis::ServicecontrolV1::CheckError::Representation
      
          property :check_info, as: 'checkInfo', class: Google::Apis::ServicecontrolV1::CheckInfo, decorator: Google::Apis::ServicecontrolV1::CheckInfo::Representation
      
          property :operation_id, as: 'operationId'
          property :quota_info, as: 'quotaInfo', class: Google::Apis::ServicecontrolV1::QuotaInfo, decorator: Google::Apis::ServicecontrolV1::QuotaInfo::Representation
      
          property :service_config_id, as: 'serviceConfigId'
          property :service_rollout_id, as: 'serviceRolloutId'
        end
      end
      
      class ConsumerInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_number, :numeric_string => true, as: 'consumerNumber'
          property :project_number, :numeric_string => true, as: 'projectNumber'
          property :type, as: 'type'
        end
      end
      
      class Distribution
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bucket_counts, as: 'bucketCounts'
          property :count, :numeric_string => true, as: 'count'
          collection :exemplars, as: 'exemplars', class: Google::Apis::ServicecontrolV1::Exemplar, decorator: Google::Apis::ServicecontrolV1::Exemplar::Representation
      
          property :explicit_buckets, as: 'explicitBuckets', class: Google::Apis::ServicecontrolV1::ExplicitBuckets, decorator: Google::Apis::ServicecontrolV1::ExplicitBuckets::Representation
      
          property :exponential_buckets, as: 'exponentialBuckets', class: Google::Apis::ServicecontrolV1::ExponentialBuckets, decorator: Google::Apis::ServicecontrolV1::ExponentialBuckets::Representation
      
          property :linear_buckets, as: 'linearBuckets', class: Google::Apis::ServicecontrolV1::LinearBuckets, decorator: Google::Apis::ServicecontrolV1::LinearBuckets::Representation
      
          property :maximum, as: 'maximum'
          property :mean, as: 'mean'
          property :minimum, as: 'minimum'
          property :sum_of_squared_deviation, as: 'sumOfSquaredDeviation'
        end
      end
      
      class Exemplar
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :attachments, as: 'attachments'
          property :timestamp, as: 'timestamp'
          property :value, as: 'value'
        end
      end
      
      class ExplicitBuckets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounds, as: 'bounds'
        end
      end
      
      class ExponentialBuckets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :growth_factor, as: 'growthFactor'
          property :num_finite_buckets, as: 'numFiniteBuckets'
          property :scale, as: 'scale'
        end
      end
      
      class FirstPartyPrincipal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :principal_email, as: 'principalEmail'
          hash :service_metadata, as: 'serviceMetadata'
        end
      end
      
      class HttpRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_fill_bytes, :numeric_string => true, as: 'cacheFillBytes'
          property :cache_hit, as: 'cacheHit'
          property :cache_lookup, as: 'cacheLookup'
          property :cache_validated_with_origin_server, as: 'cacheValidatedWithOriginServer'
          property :latency, as: 'latency'
          property :protocol, as: 'protocol'
          property :referer, as: 'referer'
          property :remote_ip, as: 'remoteIp'
          property :request_method, as: 'requestMethod'
          property :request_size, :numeric_string => true, as: 'requestSize'
          property :request_url, as: 'requestUrl'
          property :response_size, :numeric_string => true, as: 'responseSize'
          property :server_ip, as: 'serverIp'
          property :status, as: 'status'
          property :user_agent, as: 'userAgent'
        end
      end
      
      class LinearBuckets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :num_finite_buckets, as: 'numFiniteBuckets'
          property :offset, as: 'offset'
          property :width, as: 'width'
        end
      end
      
      class LogEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_request, as: 'httpRequest', class: Google::Apis::ServicecontrolV1::HttpRequest, decorator: Google::Apis::ServicecontrolV1::HttpRequest::Representation
      
          property :insert_id, as: 'insertId'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :operation, as: 'operation', class: Google::Apis::ServicecontrolV1::LogEntryOperation, decorator: Google::Apis::ServicecontrolV1::LogEntryOperation::Representation
      
          hash :proto_payload, as: 'protoPayload'
          property :severity, as: 'severity'
          property :source_location, as: 'sourceLocation', class: Google::Apis::ServicecontrolV1::LogEntrySourceLocation, decorator: Google::Apis::ServicecontrolV1::LogEntrySourceLocation::Representation
      
          hash :struct_payload, as: 'structPayload'
          property :text_payload, as: 'textPayload'
          property :timestamp, as: 'timestamp'
          property :trace, as: 'trace'
        end
      end
      
      class LogEntryOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :first, as: 'first'
          property :id, as: 'id'
          property :last, as: 'last'
          property :producer, as: 'producer'
        end
      end
      
      class LogEntrySourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file, as: 'file'
          property :function, as: 'function'
          property :line, :numeric_string => true, as: 'line'
        end
      end
      
      class MetricValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bool_value, as: 'boolValue'
          property :distribution_value, as: 'distributionValue', class: Google::Apis::ServicecontrolV1::Distribution, decorator: Google::Apis::ServicecontrolV1::Distribution::Representation
      
          property :double_value, as: 'doubleValue'
          property :end_time, as: 'endTime'
          property :int64_value, :numeric_string => true, as: 'int64Value'
          hash :labels, as: 'labels'
          property :money_value, as: 'moneyValue', class: Google::Apis::ServicecontrolV1::Money, decorator: Google::Apis::ServicecontrolV1::Money::Representation
      
          property :start_time, as: 'startTime'
          property :string_value, as: 'stringValue'
        end
      end
      
      class MetricValueSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metric_name, as: 'metricName'
          collection :metric_values, as: 'metricValues', class: Google::Apis::ServicecontrolV1::MetricValue, decorator: Google::Apis::ServicecontrolV1::MetricValue::Representation
      
        end
      end
      
      class Money
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency_code, as: 'currencyCode'
          property :nanos, as: 'nanos'
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_id, as: 'consumerId'
          property :end_time, as: 'endTime'
          property :importance, as: 'importance'
          hash :labels, as: 'labels'
          collection :log_entries, as: 'logEntries', class: Google::Apis::ServicecontrolV1::LogEntry, decorator: Google::Apis::ServicecontrolV1::LogEntry::Representation
      
          collection :metric_value_sets, as: 'metricValueSets', class: Google::Apis::ServicecontrolV1::MetricValueSet, decorator: Google::Apis::ServicecontrolV1::MetricValueSet::Representation
      
          property :operation_id, as: 'operationId'
          property :operation_name, as: 'operationName'
          property :quota_properties, as: 'quotaProperties', class: Google::Apis::ServicecontrolV1::QuotaProperties, decorator: Google::Apis::ServicecontrolV1::QuotaProperties::Representation
      
          collection :resources, as: 'resources', class: Google::Apis::ServicecontrolV1::ResourceInfo, decorator: Google::Apis::ServicecontrolV1::ResourceInfo::Representation
      
          property :start_time, as: 'startTime'
          hash :user_labels, as: 'userLabels'
        end
      end
      
      class Peer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip, as: 'ip'
          hash :labels, as: 'labels'
          property :port, :numeric_string => true, as: 'port'
          property :principal, as: 'principal'
          property :region_code, as: 'regionCode'
        end
      end
      
      class QuotaError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :description, as: 'description'
          property :subject, as: 'subject'
        end
      end
      
      class QuotaInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :limit_exceeded, as: 'limitExceeded'
          hash :quota_consumed, as: 'quotaConsumed'
          collection :quota_metrics, as: 'quotaMetrics', class: Google::Apis::ServicecontrolV1::MetricValueSet, decorator: Google::Apis::ServicecontrolV1::MetricValueSet::Representation
      
        end
      end
      
      class QuotaOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_id, as: 'consumerId'
          hash :labels, as: 'labels'
          property :method_name, as: 'methodName'
          property :operation_id, as: 'operationId'
          collection :quota_metrics, as: 'quotaMetrics', class: Google::Apis::ServicecontrolV1::MetricValueSet, decorator: Google::Apis::ServicecontrolV1::MetricValueSet::Representation
      
          property :quota_mode, as: 'quotaMode'
        end
      end
      
      class QuotaProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :quota_mode, as: 'quotaMode'
        end
      end
      
      class ReportError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
          property :status, as: 'status', class: Google::Apis::ServicecontrolV1::Status, decorator: Google::Apis::ServicecontrolV1::Status::Representation
      
        end
      end
      
      class ReportInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
          property :quota_info, as: 'quotaInfo', class: Google::Apis::ServicecontrolV1::QuotaInfo, decorator: Google::Apis::ServicecontrolV1::QuotaInfo::Representation
      
        end
      end
      
      class ReportRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :operations, as: 'operations', class: Google::Apis::ServicecontrolV1::Operation, decorator: Google::Apis::ServicecontrolV1::Operation::Representation
      
          property :service_config_id, as: 'serviceConfigId'
        end
      end
      
      class ReportResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :report_errors, as: 'reportErrors', class: Google::Apis::ServicecontrolV1::ReportError, decorator: Google::Apis::ServicecontrolV1::ReportError::Representation
      
          collection :report_infos, as: 'reportInfos', class: Google::Apis::ServicecontrolV1::ReportInfo, decorator: Google::Apis::ServicecontrolV1::ReportInfo::Representation
      
          property :service_config_id, as: 'serviceConfigId'
          property :service_rollout_id, as: 'serviceRolloutId'
        end
      end
      
      class Request
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auth, as: 'auth', class: Google::Apis::ServicecontrolV1::Auth, decorator: Google::Apis::ServicecontrolV1::Auth::Representation
      
          hash :headers, as: 'headers'
          property :host, as: 'host'
          property :id, as: 'id'
          property :method_prop, as: 'method'
          property :path, as: 'path'
          property :protocol, as: 'protocol'
          property :query, as: 'query'
          property :reason, as: 'reason'
          property :scheme, as: 'scheme'
          property :size, :numeric_string => true, as: 'size'
          property :time, as: 'time'
        end
      end
      
      class RequestMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :caller_ip, as: 'callerIp'
          property :caller_network, as: 'callerNetwork'
          property :caller_supplied_user_agent, as: 'callerSuppliedUserAgent'
          property :destination_attributes, as: 'destinationAttributes', class: Google::Apis::ServicecontrolV1::Peer, decorator: Google::Apis::ServicecontrolV1::Peer::Representation
      
          property :request_attributes, as: 'requestAttributes', class: Google::Apis::ServicecontrolV1::Request, decorator: Google::Apis::ServicecontrolV1::Request::Representation
      
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :service, as: 'service'
          property :type, as: 'type'
        end
      end
      
      class ResourceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_container, as: 'resourceContainer'
          property :resource_location, as: 'resourceLocation'
          property :resource_name, as: 'resourceName'
        end
      end
      
      class ResourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :current_locations, as: 'currentLocations'
          collection :original_locations, as: 'originalLocations'
        end
      end
      
      class ServiceAccountDelegationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :first_party_principal, as: 'firstPartyPrincipal', class: Google::Apis::ServicecontrolV1::FirstPartyPrincipal, decorator: Google::Apis::ServicecontrolV1::FirstPartyPrincipal::Representation
      
          property :third_party_principal, as: 'thirdPartyPrincipal', class: Google::Apis::ServicecontrolV1::ThirdPartyPrincipal, decorator: Google::Apis::ServicecontrolV1::ThirdPartyPrincipal::Representation
      
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
      
      class ThirdPartyPrincipal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :third_party_claims, as: 'thirdPartyClaims'
        end
      end
    end
  end
end
