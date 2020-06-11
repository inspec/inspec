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
    module LoggingV2
      
      class BigQueryOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Explicit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Exponential
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LabelDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Linear
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListExclusionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogEntriesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogEntriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogMetricsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMonitoredResourceDescriptorsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSinksResponse
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
      
      class LogExclusion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogLine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogSink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricDescriptorMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResourceDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResourceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestLog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteLogEntriesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteLogEntriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigQueryOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :use_partitioned_tables, as: 'usePartitionedTables'
        end
      end
      
      class BucketOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :explicit_buckets, as: 'explicitBuckets', class: Google::Apis::LoggingV2::Explicit, decorator: Google::Apis::LoggingV2::Explicit::Representation
      
          property :exponential_buckets, as: 'exponentialBuckets', class: Google::Apis::LoggingV2::Exponential, decorator: Google::Apis::LoggingV2::Exponential::Representation
      
          property :linear_buckets, as: 'linearBuckets', class: Google::Apis::LoggingV2::Linear, decorator: Google::Apis::LoggingV2::Linear::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Explicit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounds, as: 'bounds'
        end
      end
      
      class Exponential
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :growth_factor, as: 'growthFactor'
          property :num_finite_buckets, as: 'numFiniteBuckets'
          property :scale, as: 'scale'
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
      
      class LabelDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :key, as: 'key'
          property :value_type, as: 'valueType'
        end
      end
      
      class Linear
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :num_finite_buckets, as: 'numFiniteBuckets'
          property :offset, as: 'offset'
          property :width, as: 'width'
        end
      end
      
      class ListExclusionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exclusions, as: 'exclusions', class: Google::Apis::LoggingV2::LogExclusion, decorator: Google::Apis::LoggingV2::LogExclusion::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLogEntriesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
          property :order_by, as: 'orderBy'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
          collection :project_ids, as: 'projectIds'
          collection :resource_names, as: 'resourceNames'
        end
      end
      
      class ListLogEntriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::LoggingV2::LogEntry, decorator: Google::Apis::LoggingV2::LogEntry::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLogMetricsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :metrics, as: 'metrics', class: Google::Apis::LoggingV2::LogMetric, decorator: Google::Apis::LoggingV2::LogMetric::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLogsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :log_names, as: 'logNames'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListMonitoredResourceDescriptorsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resource_descriptors, as: 'resourceDescriptors', class: Google::Apis::LoggingV2::MonitoredResourceDescriptor, decorator: Google::Apis::LoggingV2::MonitoredResourceDescriptor::Representation
      
        end
      end
      
      class ListSinksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :sinks, as: 'sinks', class: Google::Apis::LoggingV2::LogSink, decorator: Google::Apis::LoggingV2::LogSink::Representation
      
        end
      end
      
      class LogEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_request, as: 'httpRequest', class: Google::Apis::LoggingV2::HttpRequest, decorator: Google::Apis::LoggingV2::HttpRequest::Representation
      
          property :insert_id, as: 'insertId'
          hash :json_payload, as: 'jsonPayload'
          hash :labels, as: 'labels'
          property :log_name, as: 'logName'
          property :metadata, as: 'metadata', class: Google::Apis::LoggingV2::MonitoredResourceMetadata, decorator: Google::Apis::LoggingV2::MonitoredResourceMetadata::Representation
      
          property :operation, as: 'operation', class: Google::Apis::LoggingV2::LogEntryOperation, decorator: Google::Apis::LoggingV2::LogEntryOperation::Representation
      
          hash :proto_payload, as: 'protoPayload'
          property :receive_timestamp, as: 'receiveTimestamp'
          property :resource, as: 'resource', class: Google::Apis::LoggingV2::MonitoredResource, decorator: Google::Apis::LoggingV2::MonitoredResource::Representation
      
          property :severity, as: 'severity'
          property :source_location, as: 'sourceLocation', class: Google::Apis::LoggingV2::LogEntrySourceLocation, decorator: Google::Apis::LoggingV2::LogEntrySourceLocation::Representation
      
          property :span_id, as: 'spanId'
          property :text_payload, as: 'textPayload'
          property :timestamp, as: 'timestamp'
          property :trace, as: 'trace'
          property :trace_sampled, as: 'traceSampled'
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
      
      class LogExclusion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :disabled, as: 'disabled'
          property :filter, as: 'filter'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class LogLine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :log_message, as: 'logMessage'
          property :severity, as: 'severity'
          property :source_location, as: 'sourceLocation', class: Google::Apis::LoggingV2::SourceLocation, decorator: Google::Apis::LoggingV2::SourceLocation::Representation
      
          property :time, as: 'time'
        end
      end
      
      class LogMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_options, as: 'bucketOptions', class: Google::Apis::LoggingV2::BucketOptions, decorator: Google::Apis::LoggingV2::BucketOptions::Representation
      
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :filter, as: 'filter'
          hash :label_extractors, as: 'labelExtractors'
          property :metric_descriptor, as: 'metricDescriptor', class: Google::Apis::LoggingV2::MetricDescriptor, decorator: Google::Apis::LoggingV2::MetricDescriptor::Representation
      
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
          property :value_extractor, as: 'valueExtractor'
          property :version, as: 'version'
        end
      end
      
      class LogSink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bigquery_options, as: 'bigqueryOptions', class: Google::Apis::LoggingV2::BigQueryOptions, decorator: Google::Apis::LoggingV2::BigQueryOptions::Representation
      
          property :create_time, as: 'createTime'
          property :destination, as: 'destination'
          property :end_time, as: 'endTime'
          property :filter, as: 'filter'
          property :include_children, as: 'includeChildren'
          property :name, as: 'name'
          property :output_version_format, as: 'outputVersionFormat'
          property :start_time, as: 'startTime'
          property :update_time, as: 'updateTime'
          property :writer_identity, as: 'writerIdentity'
        end
      end
      
      class MetricDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :labels, as: 'labels', class: Google::Apis::LoggingV2::LabelDescriptor, decorator: Google::Apis::LoggingV2::LabelDescriptor::Representation
      
          property :launch_stage, as: 'launchStage'
          property :metadata, as: 'metadata', class: Google::Apis::LoggingV2::MetricDescriptorMetadata, decorator: Google::Apis::LoggingV2::MetricDescriptorMetadata::Representation
      
          property :metric_kind, as: 'metricKind'
          collection :monitored_resource_types, as: 'monitoredResourceTypes'
          property :name, as: 'name'
          property :type, as: 'type'
          property :unit, as: 'unit'
          property :value_type, as: 'valueType'
        end
      end
      
      class MetricDescriptorMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ingest_delay, as: 'ingestDelay'
          property :launch_stage, as: 'launchStage'
          property :sample_period, as: 'samplePeriod'
        end
      end
      
      class MonitoredResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :type, as: 'type'
        end
      end
      
      class MonitoredResourceDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :labels, as: 'labels', class: Google::Apis::LoggingV2::LabelDescriptor, decorator: Google::Apis::LoggingV2::LabelDescriptor::Representation
      
          property :launch_stage, as: 'launchStage'
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class MonitoredResourceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :system_labels, as: 'systemLabels'
          hash :user_labels, as: 'userLabels'
        end
      end
      
      class RequestLog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_engine_release, as: 'appEngineRelease'
          property :app_id, as: 'appId'
          property :cost, as: 'cost'
          property :end_time, as: 'endTime'
          property :finished, as: 'finished'
          property :first, as: 'first'
          property :host, as: 'host'
          property :http_version, as: 'httpVersion'
          property :instance_id, as: 'instanceId'
          property :instance_index, as: 'instanceIndex'
          property :ip, as: 'ip'
          property :latency, as: 'latency'
          collection :line, as: 'line', class: Google::Apis::LoggingV2::LogLine, decorator: Google::Apis::LoggingV2::LogLine::Representation
      
          property :mega_cycles, :numeric_string => true, as: 'megaCycles'
          property :method_prop, as: 'method'
          property :module_id, as: 'moduleId'
          property :nickname, as: 'nickname'
          property :pending_time, as: 'pendingTime'
          property :referrer, as: 'referrer'
          property :request_id, as: 'requestId'
          property :resource, as: 'resource'
          property :response_size, :numeric_string => true, as: 'responseSize'
          collection :source_reference, as: 'sourceReference', class: Google::Apis::LoggingV2::SourceReference, decorator: Google::Apis::LoggingV2::SourceReference::Representation
      
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :task_name, as: 'taskName'
          property :task_queue_name, as: 'taskQueueName'
          property :trace_id, as: 'traceId'
          property :trace_sampled, as: 'traceSampled'
          property :url_map_entry, as: 'urlMapEntry'
          property :user_agent, as: 'userAgent'
          property :version_id, as: 'versionId'
          property :was_loading_request, as: 'wasLoadingRequest'
        end
      end
      
      class SourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file, as: 'file'
          property :function_name, as: 'functionName'
          property :line, :numeric_string => true, as: 'line'
        end
      end
      
      class SourceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repository, as: 'repository'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class WriteLogEntriesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dry_run, as: 'dryRun'
          collection :entries, as: 'entries', class: Google::Apis::LoggingV2::LogEntry, decorator: Google::Apis::LoggingV2::LogEntry::Representation
      
          hash :labels, as: 'labels'
          property :log_name, as: 'logName'
          property :partial_success, as: 'partialSuccess'
          property :resource, as: 'resource', class: Google::Apis::LoggingV2::MonitoredResource, decorator: Google::Apis::LoggingV2::MonitoredResource::Representation
      
        end
      end
      
      class WriteLogEntriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
    end
  end
end
