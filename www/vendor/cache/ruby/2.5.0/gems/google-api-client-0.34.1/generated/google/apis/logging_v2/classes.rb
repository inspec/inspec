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
      
      # Options that change functionality of a sink exporting data to BigQuery.
      class BigQueryOptions
        include Google::Apis::Core::Hashable
      
        # Optional. Whether to use BigQuery's partition tables. By default, Logging
        # creates dated tables based on the log entries' timestamps, e.g.
        # syslog_20170523. With partitioned tables the date suffix is no longer present
        # and special query syntax has to be used instead. In both cases, tables are
        # sharded based on UTC timezone.
        # Corresponds to the JSON property `usePartitionedTables`
        # @return [Boolean]
        attr_accessor :use_partitioned_tables
        alias_method :use_partitioned_tables?, :use_partitioned_tables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @use_partitioned_tables = args[:use_partitioned_tables] if args.key?(:use_partitioned_tables)
        end
      end
      
      # BucketOptions describes the bucket boundaries used to create a histogram for
      # the distribution. The buckets can be in a linear sequence, an exponential
      # sequence, or each bucket can be specified explicitly. BucketOptions does not
      # include the number of values in each bucket.A bucket has an inclusive lower
      # bound and exclusive upper bound for the values that are counted for that
      # bucket. The upper bound of a bucket must be strictly greater than the lower
      # bound. The sequence of N buckets for a distribution consists of an underflow
      # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
      # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
      # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
      # span the whole range of finite values: lower bound of the underflow bucket is -
      # infinity and the upper bound of the overflow bucket is +infinity. The finite
      # buckets are so-called because both bounds are finite.
      class BucketOptions
        include Google::Apis::Core::Hashable
      
        # Specifies a set of buckets with arbitrary widths.There are size(bounds) + 1 (=
        # N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-1):
        # boundsi  Lower bound (1 <= i < N); boundsi - 1The bounds field must contain at
        # least one element. If bounds has only one element, then there are no finite
        # buckets, and that single element is the common boundary of the overflow and
        # underflow buckets.
        # Corresponds to the JSON property `explicitBuckets`
        # @return [Google::Apis::LoggingV2::Explicit]
        attr_accessor :explicit_buckets
      
        # Specifies an exponential sequence of buckets that have a width that is
        # proportional to the value of the lower bound. Each bucket represents a
        # constant relative uncertainty on a specific value in the bucket.There are
        # num_finite_buckets + 2 (= N) buckets. Bucket i has the following boundaries:
        # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i).  Lower bound (1 <= i <
        # N): scale * (growth_factor ^ (i - 1)).
        # Corresponds to the JSON property `exponentialBuckets`
        # @return [Google::Apis::LoggingV2::Exponential]
        attr_accessor :exponential_buckets
      
        # Specifies a linear sequence of buckets that all have the same width (except
        # overflow and underflow). Each bucket represents a constant absolute
        # uncertainty on the specific value in the bucket.There are num_finite_buckets +
        # 2 (= N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-
        # 1): offset + (width * i).  Lower bound (1 <= i < N): offset + (width * (i - 1))
        # .
        # Corresponds to the JSON property `linearBuckets`
        # @return [Google::Apis::LoggingV2::Linear]
        attr_accessor :linear_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explicit_buckets = args[:explicit_buckets] if args.key?(:explicit_buckets)
          @exponential_buckets = args[:exponential_buckets] if args.key?(:exponential_buckets)
          @linear_buckets = args[:linear_buckets] if args.key?(:linear_buckets)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for Empty is empty JSON object ``.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Specifies a set of buckets with arbitrary widths.There are size(bounds) + 1 (=
      # N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-1):
      # boundsi  Lower bound (1 <= i < N); boundsi - 1The bounds field must contain at
      # least one element. If bounds has only one element, then there are no finite
      # buckets, and that single element is the common boundary of the overflow and
      # underflow buckets.
      class Explicit
        include Google::Apis::Core::Hashable
      
        # The values must be monotonically increasing.
        # Corresponds to the JSON property `bounds`
        # @return [Array<Float>]
        attr_accessor :bounds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounds = args[:bounds] if args.key?(:bounds)
        end
      end
      
      # Specifies an exponential sequence of buckets that have a width that is
      # proportional to the value of the lower bound. Each bucket represents a
      # constant relative uncertainty on a specific value in the bucket.There are
      # num_finite_buckets + 2 (= N) buckets. Bucket i has the following boundaries:
      # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i).  Lower bound (1 <= i <
      # N): scale * (growth_factor ^ (i - 1)).
      class Exponential
        include Google::Apis::Core::Hashable
      
        # Must be greater than 1.
        # Corresponds to the JSON property `growthFactor`
        # @return [Float]
        attr_accessor :growth_factor
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Must be greater than 0.
        # Corresponds to the JSON property `scale`
        # @return [Float]
        attr_accessor :scale
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @growth_factor = args[:growth_factor] if args.key?(:growth_factor)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @scale = args[:scale] if args.key?(:scale)
        end
      end
      
      # A common proto for logging HTTP requests. Only contains semantics defined by
      # the HTTP specification. Product-specific logging information MUST be defined
      # in a separate message.
      class HttpRequest
        include Google::Apis::Core::Hashable
      
        # The number of HTTP response bytes inserted into cache. Set only when a cache
        # fill was attempted.
        # Corresponds to the JSON property `cacheFillBytes`
        # @return [Fixnum]
        attr_accessor :cache_fill_bytes
      
        # Whether or not an entity was served from cache (with or without validation).
        # Corresponds to the JSON property `cacheHit`
        # @return [Boolean]
        attr_accessor :cache_hit
        alias_method :cache_hit?, :cache_hit
      
        # Whether or not a cache lookup was attempted.
        # Corresponds to the JSON property `cacheLookup`
        # @return [Boolean]
        attr_accessor :cache_lookup
        alias_method :cache_lookup?, :cache_lookup
      
        # Whether or not the response was validated with the origin server before being
        # served from cache. This field is only meaningful if cache_hit is True.
        # Corresponds to the JSON property `cacheValidatedWithOriginServer`
        # @return [Boolean]
        attr_accessor :cache_validated_with_origin_server
        alias_method :cache_validated_with_origin_server?, :cache_validated_with_origin_server
      
        # The request processing latency on the server, from the time the request was
        # received until the response was sent.
        # Corresponds to the JSON property `latency`
        # @return [String]
        attr_accessor :latency
      
        # Protocol used for the request. Examples: "HTTP/1.1", "HTTP/2", "websocket"
        # Corresponds to the JSON property `protocol`
        # @return [String]
        attr_accessor :protocol
      
        # The referer URL of the request, as defined in HTTP/1.1 Header Field
        # Definitions (http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).
        # Corresponds to the JSON property `referer`
        # @return [String]
        attr_accessor :referer
      
        # The IP address (IPv4 or IPv6) of the client that issued the HTTP request.
        # Examples: "192.168.1.1", "FE80::0202:B3FF:FE1E:8329".
        # Corresponds to the JSON property `remoteIp`
        # @return [String]
        attr_accessor :remote_ip
      
        # The request method. Examples: "GET", "HEAD", "PUT", "POST".
        # Corresponds to the JSON property `requestMethod`
        # @return [String]
        attr_accessor :request_method
      
        # The size of the HTTP request message in bytes, including the request headers
        # and the request body.
        # Corresponds to the JSON property `requestSize`
        # @return [Fixnum]
        attr_accessor :request_size
      
        # The scheme (http, https), the host name, the path and the query portion of the
        # URL that was requested. Example: "http://example.com/some/info?color=red".
        # Corresponds to the JSON property `requestUrl`
        # @return [String]
        attr_accessor :request_url
      
        # The size of the HTTP response message sent back to the client, in bytes,
        # including the response headers and the response body.
        # Corresponds to the JSON property `responseSize`
        # @return [Fixnum]
        attr_accessor :response_size
      
        # The IP address (IPv4 or IPv6) of the origin server that the request was sent
        # to.
        # Corresponds to the JSON property `serverIp`
        # @return [String]
        attr_accessor :server_ip
      
        # The response code indicating the status of response. Examples: 200, 404.
        # Corresponds to the JSON property `status`
        # @return [Fixnum]
        attr_accessor :status
      
        # The user agent sent by the client. Example: "Mozilla/4.0 (compatible; MSIE 6.0;
        # Windows 98; Q312461; .NET
        # CLR 1.0.3705)".
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_fill_bytes = args[:cache_fill_bytes] if args.key?(:cache_fill_bytes)
          @cache_hit = args[:cache_hit] if args.key?(:cache_hit)
          @cache_lookup = args[:cache_lookup] if args.key?(:cache_lookup)
          @cache_validated_with_origin_server = args[:cache_validated_with_origin_server] if args.key?(:cache_validated_with_origin_server)
          @latency = args[:latency] if args.key?(:latency)
          @protocol = args[:protocol] if args.key?(:protocol)
          @referer = args[:referer] if args.key?(:referer)
          @remote_ip = args[:remote_ip] if args.key?(:remote_ip)
          @request_method = args[:request_method] if args.key?(:request_method)
          @request_size = args[:request_size] if args.key?(:request_size)
          @request_url = args[:request_url] if args.key?(:request_url)
          @response_size = args[:response_size] if args.key?(:response_size)
          @server_ip = args[:server_ip] if args.key?(:server_ip)
          @status = args[:status] if args.key?(:status)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
        end
      end
      
      # A description of a label.
      class LabelDescriptor
        include Google::Apis::Core::Hashable
      
        # A human-readable description for the label.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The label key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The type of data that can be assigned to the label.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @key = args[:key] if args.key?(:key)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # Specifies a linear sequence of buckets that all have the same width (except
      # overflow and underflow). Each bucket represents a constant absolute
      # uncertainty on the specific value in the bucket.There are num_finite_buckets +
      # 2 (= N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-
      # 1): offset + (width * i).  Lower bound (1 <= i < N): offset + (width * (i - 1))
      # .
      class Linear
        include Google::Apis::Core::Hashable
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Lower bound of the first bucket.
        # Corresponds to the JSON property `offset`
        # @return [Float]
        attr_accessor :offset
      
        # Must be greater than 0.
        # Corresponds to the JSON property `width`
        # @return [Float]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @offset = args[:offset] if args.key?(:offset)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Result returned from ListExclusions.
      class ListExclusionsResponse
        include Google::Apis::Core::Hashable
      
        # A list of exclusions.
        # Corresponds to the JSON property `exclusions`
        # @return [Array<Google::Apis::LoggingV2::LogExclusion>]
        attr_accessor :exclusions
      
        # If there might be more results than appear in this response, then
        # nextPageToken is included. To get the next set of results, call the same
        # method again using the value of nextPageToken as pageToken.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusions = args[:exclusions] if args.key?(:exclusions)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The parameters to ListLogEntries.
      class ListLogEntriesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. A filter that chooses which log entries to return. See Advanced Logs
        # Queries. Only log entries that match the filter are returned. An empty filter
        # matches all log entries in the resources listed in resource_names. Referencing
        # a parent resource that is not listed in resource_names will cause the filter
        # to return no results. The maximum length of the filter is 20000 characters.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Optional. How the results should be sorted. Presently, the only permitted
        # values are "timestamp asc" (default) and "timestamp desc". The first option
        # returns entries in order of increasing values of LogEntry.timestamp (oldest
        # first), and the second option returns entries in order of decreasing
        # timestamps (newest first). Entries with equal timestamps are returned in order
        # of their insert_id values.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Optional. The maximum number of results to return from this request. Non-
        # positive values are ignored. The presence of next_page_token in the response
        # indicates that more results might be available.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Optional. If present, then retrieve the next batch of results from the
        # preceding call to this method. page_token must be the value of next_page_token
        # from the previous response. The values of other method parameters should be
        # identical to those in the previous call.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Deprecated. Use resource_names instead. One or more project identifiers or
        # project numbers from which to retrieve log entries. Example: "my-project-1A".
        # Corresponds to the JSON property `projectIds`
        # @return [Array<String>]
        attr_accessor :project_ids
      
        # Required. Names of one or more parent resources from which to retrieve log
        # entries:
        # "projects/[PROJECT_ID]"
        # "organizations/[ORGANIZATION_ID]"
        # "billingAccounts/[BILLING_ACCOUNT_ID]"
        # "folders/[FOLDER_ID]"
        # Projects listed in the project_ids field are added to this list.
        # Corresponds to the JSON property `resourceNames`
        # @return [Array<String>]
        attr_accessor :resource_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @project_ids = args[:project_ids] if args.key?(:project_ids)
          @resource_names = args[:resource_names] if args.key?(:resource_names)
        end
      end
      
      # Result returned from ListLogEntries.
      class ListLogEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A list of log entries. If entries is empty, nextPageToken may still be
        # returned, indicating that more entries may exist. See nextPageToken for more
        # information.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::LoggingV2::LogEntry>]
        attr_accessor :entries
      
        # If there might be more results than those appearing in this response, then
        # nextPageToken is included. To get the next set of results, call this method
        # again using the value of nextPageToken as pageToken.If a value for
        # next_page_token appears and the entries field is empty, it means that the
        # search found no log entries so far but it did not have time to search all the
        # possible log entries. Retry the method with this value for page_token to
        # continue the search. Alternatively, consider speeding up the search by
        # changing your filter to specify a single log name or resource type, or to
        # narrow the time range of the search.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Result returned from ListLogMetrics.
      class ListLogMetricsResponse
        include Google::Apis::Core::Hashable
      
        # A list of logs-based metrics.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::LoggingV2::LogMetric>]
        attr_accessor :metrics
      
        # If there might be more results than appear in this response, then
        # nextPageToken is included. To get the next set of results, call this method
        # again using the value of nextPageToken as pageToken.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metrics = args[:metrics] if args.key?(:metrics)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Result returned from ListLogs.
      class ListLogsResponse
        include Google::Apis::Core::Hashable
      
        # A list of log names. For example, "projects/my-project/logs/syslog" or "
        # organizations/123/logs/cloudresourcemanager.googleapis.com%2Factivity".
        # Corresponds to the JSON property `logNames`
        # @return [Array<String>]
        attr_accessor :log_names
      
        # If there might be more results than those appearing in this response, then
        # nextPageToken is included. To get the next set of results, call this method
        # again using the value of nextPageToken as pageToken.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @log_names = args[:log_names] if args.key?(:log_names)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Result returned from ListMonitoredResourceDescriptors.
      class ListMonitoredResourceDescriptorsResponse
        include Google::Apis::Core::Hashable
      
        # If there might be more results than those appearing in this response, then
        # nextPageToken is included. To get the next set of results, call this method
        # again using the value of nextPageToken as pageToken.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of resource descriptors.
        # Corresponds to the JSON property `resourceDescriptors`
        # @return [Array<Google::Apis::LoggingV2::MonitoredResourceDescriptor>]
        attr_accessor :resource_descriptors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @resource_descriptors = args[:resource_descriptors] if args.key?(:resource_descriptors)
        end
      end
      
      # Result returned from ListSinks.
      class ListSinksResponse
        include Google::Apis::Core::Hashable
      
        # If there might be more results than appear in this response, then
        # nextPageToken is included. To get the next set of results, call the same
        # method again using the value of nextPageToken as pageToken.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of sinks.
        # Corresponds to the JSON property `sinks`
        # @return [Array<Google::Apis::LoggingV2::LogSink>]
        attr_accessor :sinks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sinks = args[:sinks] if args.key?(:sinks)
        end
      end
      
      # An individual entry in a log.
      class LogEntry
        include Google::Apis::Core::Hashable
      
        # A common proto for logging HTTP requests. Only contains semantics defined by
        # the HTTP specification. Product-specific logging information MUST be defined
        # in a separate message.
        # Corresponds to the JSON property `httpRequest`
        # @return [Google::Apis::LoggingV2::HttpRequest]
        attr_accessor :http_request
      
        # Optional. A unique identifier for the log entry. If you provide a value, then
        # Logging considers other log entries in the same project, with the same
        # timestamp, and with the same insert_id to be duplicates which can be removed.
        # If omitted in new log entries, then Logging assigns its own unique identifier.
        # The insert_id is also used to order log entries that have the same timestamp
        # value.
        # Corresponds to the JSON property `insertId`
        # @return [String]
        attr_accessor :insert_id
      
        # The log entry payload, represented as a structure that is expressed as a JSON
        # object.
        # Corresponds to the JSON property `jsonPayload`
        # @return [Hash<String,Object>]
        attr_accessor :json_payload
      
        # Optional. A set of user-defined (key, value) data that provides additional
        # information about the log entry.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The resource name of the log to which this log entry belongs:
        # "projects/[PROJECT_ID]/logs/[LOG_ID]"
        # "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        # "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        # "folders/[FOLDER_ID]/logs/[LOG_ID]"
        # A project number may optionally be used in place of PROJECT_ID. The project
        # number is translated to its corresponding PROJECT_ID internally and the
        # log_name field will contain PROJECT_ID in queries and exports.[LOG_ID] must be
        # URL-encoded within log_name. Example: "organizations/1234567890/logs/
        # cloudresourcemanager.googleapis.com%2Factivity". [LOG_ID] must be less than
        # 512 characters long and can only include the following characters: upper and
        # lower case alphanumeric characters, forward-slash, underscore, hyphen, and
        # period.For backward compatibility, if log_name begins with a forward-slash,
        # such as /projects/..., then the log entry is ingested as usual but the forward-
        # slash is removed. Listing the log entry will not show the leading slash and
        # filtering for a log name with a leading slash will never return any results.
        # Corresponds to the JSON property `logName`
        # @return [String]
        attr_accessor :log_name
      
        # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
        # contain the minimum set of information to uniquely identify a monitored
        # resource instance. There is some other useful auxiliary metadata. Monitoring
        # and Logging use an ingestion pipeline to extract metadata for cloud resources
        # of all types, and store the metadata in this message.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::LoggingV2::MonitoredResourceMetadata]
        attr_accessor :metadata
      
        # Additional information about a potentially long-running operation with which a
        # log entry is associated.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::LoggingV2::LogEntryOperation]
        attr_accessor :operation
      
        # The log entry payload, represented as a protocol buffer. Some Google Cloud
        # Platform services use this field for their log entry payloads.The following
        # protocol buffer types are supported; user-defined types are not supported:"
        # type.googleapis.com/google.cloud.audit.AuditLog"  "type.googleapis.com/google.
        # appengine.logging.v1.RequestLog"
        # Corresponds to the JSON property `protoPayload`
        # @return [Hash<String,Object>]
        attr_accessor :proto_payload
      
        # Output only. The time the log entry was received by Logging.
        # Corresponds to the JSON property `receiveTimestamp`
        # @return [String]
        attr_accessor :receive_timestamp
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The type field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the labels field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
        # zone":
        # ` "type": "gce_instance",
        # "labels": ` "instance_id": "12345678901234",
        # "zone": "us-central1-a" ``
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::LoggingV2::MonitoredResource]
        attr_accessor :resource
      
        # Optional. The severity of the log entry. The default value is LogSeverity.
        # DEFAULT.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Additional information about the source code location that produced the log
        # entry.
        # Corresponds to the JSON property `sourceLocation`
        # @return [Google::Apis::LoggingV2::LogEntrySourceLocation]
        attr_accessor :source_location
      
        # Optional. The span ID within the trace associated with the log entry.For Trace
        # spans, this is the same format that the Trace API v2 uses: a 16-character
        # hexadecimal encoding of an 8-byte array, such as <code>"000000000000004a"</
        # code>.
        # Corresponds to the JSON property `spanId`
        # @return [String]
        attr_accessor :span_id
      
        # The log entry payload, represented as a Unicode string (UTF-8).
        # Corresponds to the JSON property `textPayload`
        # @return [String]
        attr_accessor :text_payload
      
        # Optional. The time the event described by the log entry occurred. This time is
        # used to compute the log entry's age and to enforce the logs retention period.
        # If this field is omitted in a new log entry, then Logging assigns it the
        # current time. Timestamps have nanosecond accuracy, but trailing zeros in the
        # fractional seconds might be omitted when the timestamp is displayed.Incoming
        # log entries should have timestamps that are no more than the logs retention
        # period in the past, and no more than 24 hours in the future. Log entries
        # outside those time boundaries will not be available when calling entries.list,
        # but those log entries can still be exported with LogSinks.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Optional. Resource name of the trace associated with the log entry, if any. If
        # it contains a relative resource name, the name is assumed to be relative to //
        # tracing.googleapis.com. Example: projects/my-projectid/traces/
        # 06796866738c859f2f19b7cfb3214824
        # Corresponds to the JSON property `trace`
        # @return [String]
        attr_accessor :trace
      
        # Optional. The sampling decision of the trace associated with the log entry.
        # True means that the trace resource name in the trace field was sampled for
        # storage in a trace backend. False means that the trace was not sampled for
        # storage when this log entry was written, or the sampling decision was unknown
        # at the time. A non-sampled trace value is still useful as a request
        # correlation identifier. The default is False.
        # Corresponds to the JSON property `traceSampled`
        # @return [Boolean]
        attr_accessor :trace_sampled
        alias_method :trace_sampled?, :trace_sampled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_request = args[:http_request] if args.key?(:http_request)
          @insert_id = args[:insert_id] if args.key?(:insert_id)
          @json_payload = args[:json_payload] if args.key?(:json_payload)
          @labels = args[:labels] if args.key?(:labels)
          @log_name = args[:log_name] if args.key?(:log_name)
          @metadata = args[:metadata] if args.key?(:metadata)
          @operation = args[:operation] if args.key?(:operation)
          @proto_payload = args[:proto_payload] if args.key?(:proto_payload)
          @receive_timestamp = args[:receive_timestamp] if args.key?(:receive_timestamp)
          @resource = args[:resource] if args.key?(:resource)
          @severity = args[:severity] if args.key?(:severity)
          @source_location = args[:source_location] if args.key?(:source_location)
          @span_id = args[:span_id] if args.key?(:span_id)
          @text_payload = args[:text_payload] if args.key?(:text_payload)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @trace = args[:trace] if args.key?(:trace)
          @trace_sampled = args[:trace_sampled] if args.key?(:trace_sampled)
        end
      end
      
      # Additional information about a potentially long-running operation with which a
      # log entry is associated.
      class LogEntryOperation
        include Google::Apis::Core::Hashable
      
        # Optional. Set this to True if this is the first log entry in the operation.
        # Corresponds to the JSON property `first`
        # @return [Boolean]
        attr_accessor :first
        alias_method :first?, :first
      
        # Optional. An arbitrary operation identifier. Log entries with the same
        # identifier are assumed to be part of the same operation.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Optional. Set this to True if this is the last log entry in the operation.
        # Corresponds to the JSON property `last`
        # @return [Boolean]
        attr_accessor :last
        alias_method :last?, :last
      
        # Optional. An arbitrary producer identifier. The combination of id and producer
        # must be globally unique. Examples for producer: "MyDivision.MyBigCompany.com",
        # "github.com/MyProject/MyApplication".
        # Corresponds to the JSON property `producer`
        # @return [String]
        attr_accessor :producer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @first = args[:first] if args.key?(:first)
          @id = args[:id] if args.key?(:id)
          @last = args[:last] if args.key?(:last)
          @producer = args[:producer] if args.key?(:producer)
        end
      end
      
      # Additional information about the source code location that produced the log
      # entry.
      class LogEntrySourceLocation
        include Google::Apis::Core::Hashable
      
        # Optional. Source file name. Depending on the runtime environment, this might
        # be a simple name or a fully-qualified name.
        # Corresponds to the JSON property `file`
        # @return [String]
        attr_accessor :file
      
        # Optional. Human-readable name of the function or method being invoked, with
        # optional context such as the class or package name. This information may be
        # used in contexts such as the logs viewer, where a file and line number are
        # less meaningful. The format can vary by language. For example: qual.if.ied.
        # Class.method (Java), dir/package.func (Go), function (Python).
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # Optional. Line within the source file. 1-based; 0 indicates no line number
        # available.
        # Corresponds to the JSON property `line`
        # @return [Fixnum]
        attr_accessor :line
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file = args[:file] if args.key?(:file)
          @function = args[:function] if args.key?(:function)
          @line = args[:line] if args.key?(:line)
        end
      end
      
      # Specifies a set of log entries that are not to be stored in Logging. If your
      # GCP resource receives a large volume of logs, you can use exclusions to reduce
      # your chargeable logs. Exclusions are processed after log sinks, so you can
      # export log entries before they are excluded. Note that organization-level and
      # folder-level exclusions don't apply to child resources, and that you can't
      # exclude audit log entries.
      class LogExclusion
        include Google::Apis::Core::Hashable
      
        # Output only. The creation timestamp of the exclusion.This field may not be
        # present for older exclusions.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. A description of this exclusion.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. If set to True, then this exclusion is disabled and it does not
        # exclude any log entries. You can update an exclusion to change the value of
        # this field.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        # Required. An advanced logs filter that matches the log entries to be excluded.
        # By using the sample function, you can exclude less than 100% of the matching
        # log entries. For example, the following query matches 99% of low-severity log
        # entries from Google Cloud Storage buckets:"resource.type=gcs_bucket severity<
        # ERROR sample(insertId, 0.99)"
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Required. A client-assigned identifier, such as "load-balancer-exclusion".
        # Identifiers are limited to 100 characters and can include only letters, digits,
        # underscores, hyphens, and periods.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The last update timestamp of the exclusion.This field may not be
        # present for older exclusions.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @disabled = args[:disabled] if args.key?(:disabled)
          @filter = args[:filter] if args.key?(:filter)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Application log line emitted while processing a request.
      class LogLine
        include Google::Apis::Core::Hashable
      
        # App-provided log message.
        # Corresponds to the JSON property `logMessage`
        # @return [String]
        attr_accessor :log_message
      
        # Severity of this log entry.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Specifies a location in a source code file.
        # Corresponds to the JSON property `sourceLocation`
        # @return [Google::Apis::LoggingV2::SourceLocation]
        attr_accessor :source_location
      
        # Approximate time when this log entry was made.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @log_message = args[:log_message] if args.key?(:log_message)
          @severity = args[:severity] if args.key?(:severity)
          @source_location = args[:source_location] if args.key?(:source_location)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # Describes a logs-based metric. The value of the metric is the number of log
      # entries that match a logs filter in a given time interval.Logs-based metric
      # can also be used to extract values from logs and create a a distribution of
      # the values. The distribution records the statistics of the extracted values
      # along with an optional histogram of the values as specified by the bucket
      # options.
      class LogMetric
        include Google::Apis::Core::Hashable
      
        # BucketOptions describes the bucket boundaries used to create a histogram for
        # the distribution. The buckets can be in a linear sequence, an exponential
        # sequence, or each bucket can be specified explicitly. BucketOptions does not
        # include the number of values in each bucket.A bucket has an inclusive lower
        # bound and exclusive upper bound for the values that are counted for that
        # bucket. The upper bound of a bucket must be strictly greater than the lower
        # bound. The sequence of N buckets for a distribution consists of an underflow
        # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
        # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
        # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
        # span the whole range of finite values: lower bound of the underflow bucket is -
        # infinity and the upper bound of the overflow bucket is +infinity. The finite
        # buckets are so-called because both bounds are finite.
        # Corresponds to the JSON property `bucketOptions`
        # @return [Google::Apis::LoggingV2::BucketOptions]
        attr_accessor :bucket_options
      
        # Output only. The creation timestamp of the metric.This field may not be
        # present for older metrics.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. A description of this metric, which is used in documentation. The
        # maximum length of the description is 8000 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. An advanced logs filter which is used to match log entries. Example:
        # "resource.type=gae_app AND severity>=ERROR"
        # The maximum length of the filter is 20000 characters.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Optional. A map from a label key string to an extractor expression which is
        # used to extract data from a log entry field and assign as the label value.
        # Each label key specified in the LabelDescriptor must have an associated
        # extractor expression in this map. The syntax of the extractor expression is
        # the same as for the value_extractor field.The extracted value is converted to
        # the type defined in the label descriptor. If the either the extraction or the
        # type conversion fails, the label will have a default value. The default value
        # for a string label is an empty string, for an integer label its 0, and for a
        # boolean label its false.Note that there are upper bounds on the maximum number
        # of labels and the number of active time series that are allowed in a project.
        # Corresponds to the JSON property `labelExtractors`
        # @return [Hash<String,String>]
        attr_accessor :label_extractors
      
        # Defines a metric type and its schema. Once a metric descriptor is created,
        # deleting or altering it stops data collection and makes the metric type's
        # existing data unusable.
        # Corresponds to the JSON property `metricDescriptor`
        # @return [Google::Apis::LoggingV2::MetricDescriptor]
        attr_accessor :metric_descriptor
      
        # Required. The client-assigned metric identifier. Examples: "error_count", "
        # nginx/requests".Metric identifiers are limited to 100 characters and can
        # include only the following characters: A-Z, a-z, 0-9, and the special
        # characters _-.,+!*',()%/. The forward-slash character (/) denotes a hierarchy
        # of name pieces, and it cannot be the first character of the name.The metric
        # identifier in this field must not be URL-encoded (https://en.wikipedia.org/
        # wiki/Percent-encoding). However, when the metric identifier appears as the [
        # METRIC_ID] part of a metric_name API parameter, then the metric identifier
        # must be URL-encoded. Example: "projects/my-project/metrics/nginx%2Frequests".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The last update timestamp of the metric.This field may not be
        # present for older metrics.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Optional. A value_extractor is required when using a distribution logs-based
        # metric to extract the values to record from a log entry. Two functions are
        # supported for value extraction: EXTRACT(field) or REGEXP_EXTRACT(field, regex).
        # The argument are:  1. field: The name of the log entry field from which the
        # value is to be  extracted.  2. regex: A regular expression using the Google
        # RE2 syntax  (https://github.com/google/re2/wiki/Syntax) with a single capture
        # group to extract data from the specified log entry field. The value  of the
        # field is converted to a string before applying the regex.  It is an error to
        # specify a regex that does not include exactly one  capture group.The result of
        # the extraction must be convertible to a double type, as the distribution
        # always records double values. If either the extraction or the conversion to
        # double fails, then those values are not recorded in the distribution.Example:
        # REGEXP_EXTRACT(jsonPayload.request, ".*quantity=(\d+).*")
        # Corresponds to the JSON property `valueExtractor`
        # @return [String]
        attr_accessor :value_extractor
      
        # Deprecated. The API version that created or updated this metric. The v2 format
        # is used by default and cannot be changed.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_options = args[:bucket_options] if args.key?(:bucket_options)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @filter = args[:filter] if args.key?(:filter)
          @label_extractors = args[:label_extractors] if args.key?(:label_extractors)
          @metric_descriptor = args[:metric_descriptor] if args.key?(:metric_descriptor)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
          @value_extractor = args[:value_extractor] if args.key?(:value_extractor)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Describes a sink used to export log entries to one of the following
      # destinations in any project: a Cloud Storage bucket, a BigQuery dataset, or a
      # Cloud Pub/Sub topic. A logs filter controls which log entries are exported.
      # The sink must be created within a project, organization, billing account, or
      # folder.
      class LogSink
        include Google::Apis::Core::Hashable
      
        # Options that change functionality of a sink exporting data to BigQuery.
        # Corresponds to the JSON property `bigqueryOptions`
        # @return [Google::Apis::LoggingV2::BigQueryOptions]
        attr_accessor :bigquery_options
      
        # Output only. The creation timestamp of the sink.This field may not be present
        # for older sinks.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Required. The export destination:
        # "storage.googleapis.com/[GCS_BUCKET]"
        # "bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]"
        # "pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]"
        # The sink's writer_identity, set when the sink is created, must have permission
        # to write to the destination or else the log entries are not exported. For more
        # information, see Exporting Logs with Sinks.
        # Corresponds to the JSON property `destination`
        # @return [String]
        attr_accessor :destination
      
        # Do not use. This field is ignored.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. An advanced logs filter. The only exported log entries are those
        # that are in the resource owning the sink and that match the filter. For
        # example:
        # logName="projects/[PROJECT_ID]/logs/[LOG_ID]" AND severity>=ERROR
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Optional. This field applies only to sinks owned by organizations and folders.
        # If the field is false, the default, only the logs owned by the sink's parent
        # resource are available for export. If the field is true, then logs from all
        # the projects, folders, and billing accounts contained in the sink's parent
        # resource are also available for export. Whether a particular log entry from
        # the children is exported depends on the sink's filter expression. For example,
        # if this field is true, then the filter resource.type=gce_instance would export
        # all Compute Engine VM instance log entries from all projects in the sink's
        # parent. To only export entries from certain child projects, filter on the
        # project part of the log name:
        # logName:("projects/test-project1/" OR "projects/test-project2/") AND
        # resource.type=gce_instance
        # Corresponds to the JSON property `includeChildren`
        # @return [Boolean]
        attr_accessor :include_children
        alias_method :include_children?, :include_children
      
        # Required. The client-assigned sink identifier, unique within the project.
        # Example: "my-syslog-errors-to-pubsub". Sink identifiers are limited to 100
        # characters and can include only the following characters: upper and lower-case
        # alphanumeric characters, underscores, hyphens, and periods.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The log entry format to use for this sink's exported log entries.
        # The v2 format is used by default and cannot be changed.
        # Corresponds to the JSON property `outputVersionFormat`
        # @return [String]
        attr_accessor :output_version_format
      
        # Do not use. This field is ignored.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Output only. The last update timestamp of the sink.This field may not be
        # present for older sinks.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Output only. An IAM identity&mdash;a service account or group&mdash;under
        # which Logging writes the exported log entries to the sink's destination. This
        # field is set by sinks.create and sinks.update based on the value of
        # unique_writer_identity in those methods.Until you grant this identity write-
        # access to the destination, log entry exports from this sink will fail. For
        # more information, see Granting Access for a Resource. Consult the destination
        # service's documentation to determine the appropriate IAM roles to assign to
        # the identity.
        # Corresponds to the JSON property `writerIdentity`
        # @return [String]
        attr_accessor :writer_identity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_options = args[:bigquery_options] if args.key?(:bigquery_options)
          @create_time = args[:create_time] if args.key?(:create_time)
          @destination = args[:destination] if args.key?(:destination)
          @end_time = args[:end_time] if args.key?(:end_time)
          @filter = args[:filter] if args.key?(:filter)
          @include_children = args[:include_children] if args.key?(:include_children)
          @name = args[:name] if args.key?(:name)
          @output_version_format = args[:output_version_format] if args.key?(:output_version_format)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
          @writer_identity = args[:writer_identity] if args.key?(:writer_identity)
        end
      end
      
      # Defines a metric type and its schema. Once a metric descriptor is created,
      # deleting or altering it stops data collection and makes the metric type's
      # existing data unusable.
      class MetricDescriptor
        include Google::Apis::Core::Hashable
      
        # A detailed description of the metric, which can be used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A concise name for the metric, which can be displayed in user interfaces. Use
        # sentence case without an ending period, for example "Request count". This
        # field is optional but it is recommended to be set for any metrics associated
        # with user-visible concepts, such as Quota.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The set of labels that can be used to describe a specific instance of this
        # metric type. For example, the appengine.googleapis.com/http/server/
        # response_latencies metric type has a label for the HTTP response code,
        # response_code, so you can look at latencies for successful responses or just
        # for responses that failed.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::LoggingV2::LabelDescriptor>]
        attr_accessor :labels
      
        # Optional. The launch stage of the metric definition.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # Additional annotations that can be used to guide the usage of a metric.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::LoggingV2::MetricDescriptorMetadata]
        attr_accessor :metadata
      
        # Whether the metric records instantaneous values, changes to a value, etc. Some
        # combinations of metric_kind and value_type might not be supported.
        # Corresponds to the JSON property `metricKind`
        # @return [String]
        attr_accessor :metric_kind
      
        # Read-only. If present, then a time series, which is identified partially by a
        # metric type and a MonitoredResourceDescriptor, that is associated with this
        # metric type can only be associated with one of the monitored resource types
        # listed here.
        # Corresponds to the JSON property `monitoredResourceTypes`
        # @return [Array<String>]
        attr_accessor :monitored_resource_types
      
        # The resource name of the metric descriptor.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The metric type, including its DNS name prefix. The type is not URL-encoded.
        # All user-defined metric types have the DNS name custom.googleapis.com or
        # external.googleapis.com. Metric types should use a natural hierarchical
        # grouping. For example:
        # "custom.googleapis.com/invoice/paid/amount"
        # "external.googleapis.com/prometheus/up"
        # "appengine.googleapis.com/http/server/response_latencies"
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The unit in which the metric value is reported. It is only applicable if the
        # value_type is INT64, DOUBLE, or DISTRIBUTION. The supported units are a subset
        # of The Unified Code for Units of Measure (http://unitsofmeasure.org/ucum.html)
        # standard:Basic units (UNIT)
        # bit bit
        # By byte
        # s second
        # min minute
        # h hour
        # d dayPrefixes (PREFIX)
        # k kilo (10**3)
        # M mega (10**6)
        # G giga (10**9)
        # T tera (10**12)
        # P peta (10**15)
        # E exa (10**18)
        # Z zetta (10**21)
        # Y yotta (10**24)
        # m milli (10**-3)
        # u micro (10**-6)
        # n nano (10**-9)
        # p pico (10**-12)
        # f femto (10**-15)
        # a atto (10**-18)
        # z zepto (10**-21)
        # y yocto (10**-24)
        # Ki kibi (2**10)
        # Mi mebi (2**20)
        # Gi gibi (2**30)
        # Ti tebi (2**40)GrammarThe grammar also includes these connectors:
        # / division (as an infix operator, e.g. 1/s).
        # . multiplication (as an infix operator, e.g. GBy.d)The grammar for a unit is
        # as follows:
        # Expression = Component ` "." Component ` ` "/" Component ` ;
        # Component = ( [ PREFIX ] UNIT | "%" ) [ Annotation ]
        # | Annotation
        # | "1"
        # ;
        # Annotation = "`" NAME "`" ;
        # Notes:
        # Annotation is just a comment if it follows a UNIT and is  equivalent to 1 if
        # it is used alone. For examples,  `requests`/s == 1/s, By`transmitted`/s == By/
        # s.
        # NAME is a sequence of non-blank printable ASCII characters not  containing '`'
        # or '`'.
        # 1 represents dimensionless value 1, such as in 1/s.
        # % represents dimensionless value 1/100, and annotates values giving  a
        # percentage.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # Whether the measurement is an integer, a floating-point number, etc. Some
        # combinations of metric_kind and value_type might not be supported.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @metadata = args[:metadata] if args.key?(:metadata)
          @metric_kind = args[:metric_kind] if args.key?(:metric_kind)
          @monitored_resource_types = args[:monitored_resource_types] if args.key?(:monitored_resource_types)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
          @unit = args[:unit] if args.key?(:unit)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # Additional annotations that can be used to guide the usage of a metric.
      class MetricDescriptorMetadata
        include Google::Apis::Core::Hashable
      
        # The delay of data points caused by ingestion. Data points older than this age
        # are guaranteed to be ingested and available to be read, excluding data loss
        # due to errors.
        # Corresponds to the JSON property `ingestDelay`
        # @return [String]
        attr_accessor :ingest_delay
      
        # Deprecated. Must use the MetricDescriptor.launch_stage instead.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # The sampling period of metric data points. For metrics which are written
        # periodically, consecutive data points are stored at this time interval,
        # excluding data loss due to errors. Metrics with a higher granularity have a
        # smaller sampling period.
        # Corresponds to the JSON property `samplePeriod`
        # @return [String]
        attr_accessor :sample_period
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ingest_delay = args[:ingest_delay] if args.key?(:ingest_delay)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @sample_period = args[:sample_period] if args.key?(:sample_period)
        end
      end
      
      # An object representing a resource that can be used for monitoring, logging,
      # billing, or other purposes. Examples include virtual machine instances,
      # databases, and storage devices such as disks. The type field identifies a
      # MonitoredResourceDescriptor object that describes the resource's schema.
      # Information in the labels field identifies the actual resource and its
      # attributes according to the schema. For example, a particular Compute Engine
      # VM instance could be represented by the following object, because the
      # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
      # zone":
      # ` "type": "gce_instance",
      # "labels": ` "instance_id": "12345678901234",
      # "zone": "us-central1-a" ``
      class MonitoredResource
        include Google::Apis::Core::Hashable
      
        # Required. Values for all of the labels listed in the associated monitored
        # resource descriptor. For example, Compute Engine VM instances use the labels "
        # project_id", "instance_id", and "zone".
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The monitored resource type. This field must match the type field of
        # a MonitoredResourceDescriptor object. For example, the type of a Compute
        # Engine VM instance is gce_instance.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An object that describes the schema of a MonitoredResource object using a type
      # name and a set of labels. For example, the monitored resource descriptor for
      # Google Compute Engine VM instances has a type of "gce_instance" and specifies
      # the use of the labels "instance_id" and "zone" to identify particular VM
      # instances.Different APIs can support different monitored resource types. APIs
      # generally provide a list method that returns the monitored resource
      # descriptors used by the API.
      class MonitoredResourceDescriptor
        include Google::Apis::Core::Hashable
      
        # Optional. A detailed description of the monitored resource type that might be
        # used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. A concise name for the monitored resource type that might be
        # displayed in user interfaces. It should be a Title Cased Noun Phrase, without
        # any article or other determiners. For example, "Google Cloud SQL Database".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Required. A set of labels used to describe instances of this monitored
        # resource type. For example, an individual Google Cloud SQL database is
        # identified by values for the labels "database_id" and "zone".
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::LoggingV2::LabelDescriptor>]
        attr_accessor :labels
      
        # Optional. The launch stage of the monitored resource definition.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # Optional. The resource name of the monitored resource descriptor: "projects/`
        # project_id`/monitoredResourceDescriptors/`type`" where `type` is the value of
        # the type field in this object and `project_id` is a project ID that provides
        # API-specific context for accessing the type. APIs that do not use project
        # information can use the resource name format "monitoredResourceDescriptors/`
        # type`".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The monitored resource type. For example, the type "
        # cloudsql_database" represents databases in Google Cloud SQL. The maximum
        # length of this value is 256 characters.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
      # contain the minimum set of information to uniquely identify a monitored
      # resource instance. There is some other useful auxiliary metadata. Monitoring
      # and Logging use an ingestion pipeline to extract metadata for cloud resources
      # of all types, and store the metadata in this message.
      class MonitoredResourceMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. Values for predefined system metadata labels. System labels are a
        # kind of metadata extracted by Google, including "machine_image", "vpc", "
        # subnet_id", "security_group", "name", etc. System label values can be only
        # strings, Boolean values, or a list of strings. For example:
        # ` "name": "my-test-instance",
        # "security_group": ["a", "b", "c"],
        # "spot_instance": false `
        # Corresponds to the JSON property `systemLabels`
        # @return [Hash<String,Object>]
        attr_accessor :system_labels
      
        # Output only. A map of user-defined metadata labels.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @system_labels = args[:system_labels] if args.key?(:system_labels)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Complete log information about a single HTTP request to an App Engine
      # application.
      class RequestLog
        include Google::Apis::Core::Hashable
      
        # App Engine release version.
        # Corresponds to the JSON property `appEngineRelease`
        # @return [String]
        attr_accessor :app_engine_release
      
        # Application that handled this request.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # An indication of the relative cost of serving this request.
        # Corresponds to the JSON property `cost`
        # @return [Float]
        attr_accessor :cost
      
        # Time when the request finished.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Whether this request is finished or active.
        # Corresponds to the JSON property `finished`
        # @return [Boolean]
        attr_accessor :finished
        alias_method :finished?, :finished
      
        # Whether this is the first RequestLog entry for this request. If an active
        # request has several RequestLog entries written to Stackdriver Logging, then
        # this field will be set for one of them.
        # Corresponds to the JSON property `first`
        # @return [Boolean]
        attr_accessor :first
        alias_method :first?, :first
      
        # Internet host and port number of the resource being requested.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # HTTP version of request. Example: "HTTP/1.1".
        # Corresponds to the JSON property `httpVersion`
        # @return [String]
        attr_accessor :http_version
      
        # An identifier for the instance that handled the request.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # If the instance processing this request belongs to a manually scaled module,
        # then this is the 0-based index of the instance. Otherwise, this value is -1.
        # Corresponds to the JSON property `instanceIndex`
        # @return [Fixnum]
        attr_accessor :instance_index
      
        # Origin IP address.
        # Corresponds to the JSON property `ip`
        # @return [String]
        attr_accessor :ip
      
        # Latency of the request.
        # Corresponds to the JSON property `latency`
        # @return [String]
        attr_accessor :latency
      
        # A list of log lines emitted by the application while serving this request.
        # Corresponds to the JSON property `line`
        # @return [Array<Google::Apis::LoggingV2::LogLine>]
        attr_accessor :line
      
        # Number of CPU megacycles used to process request.
        # Corresponds to the JSON property `megaCycles`
        # @return [Fixnum]
        attr_accessor :mega_cycles
      
        # Request method. Example: "GET", "HEAD", "PUT", "POST", "DELETE".
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Module of the application that handled this request.
        # Corresponds to the JSON property `moduleId`
        # @return [String]
        attr_accessor :module_id
      
        # The logged-in user who made the request.Most likely, this is the part of the
        # user's email before the @ sign. The field value is the same for different
        # requests from the same user, but different users can have similar names. This
        # information is also available to the application via the App Engine Users API.
        # This field will be populated starting with App Engine 1.9.21.
        # Corresponds to the JSON property `nickname`
        # @return [String]
        attr_accessor :nickname
      
        # Time this request spent in the pending request queue.
        # Corresponds to the JSON property `pendingTime`
        # @return [String]
        attr_accessor :pending_time
      
        # Referrer URL of request.
        # Corresponds to the JSON property `referrer`
        # @return [String]
        attr_accessor :referrer
      
        # Globally unique identifier for a request, which is based on the request start
        # time. Request IDs for requests which started later will compare greater as
        # strings than those for requests which started earlier.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        # Contains the path and query portion of the URL that was requested. For example,
        # if the URL was "http://example.com/app?name=val", the resource would be "/app?
        # name=val". The fragment identifier, which is identified by the # character, is
        # not included.
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        # Size in bytes sent back to client by request.
        # Corresponds to the JSON property `responseSize`
        # @return [Fixnum]
        attr_accessor :response_size
      
        # Source code for the application that handled this request. There can be more
        # than one source reference per deployed application if source code is
        # distributed among multiple repositories.
        # Corresponds to the JSON property `sourceReference`
        # @return [Array<Google::Apis::LoggingV2::SourceReference>]
        attr_accessor :source_reference
      
        # Time when the request started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # HTTP response status code. Example: 200, 404.
        # Corresponds to the JSON property `status`
        # @return [Fixnum]
        attr_accessor :status
      
        # Task name of the request, in the case of an offline request.
        # Corresponds to the JSON property `taskName`
        # @return [String]
        attr_accessor :task_name
      
        # Queue name of the request, in the case of an offline request.
        # Corresponds to the JSON property `taskQueueName`
        # @return [String]
        attr_accessor :task_queue_name
      
        # Stackdriver Trace identifier for this request.
        # Corresponds to the JSON property `traceId`
        # @return [String]
        attr_accessor :trace_id
      
        # If true, the value in the 'trace_id' field was sampled for storage in a trace
        # backend.
        # Corresponds to the JSON property `traceSampled`
        # @return [Boolean]
        attr_accessor :trace_sampled
        alias_method :trace_sampled?, :trace_sampled
      
        # File or class that handled the request.
        # Corresponds to the JSON property `urlMapEntry`
        # @return [String]
        attr_accessor :url_map_entry
      
        # User agent that made the request.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        # Version of the application that handled this request.
        # Corresponds to the JSON property `versionId`
        # @return [String]
        attr_accessor :version_id
      
        # Whether this was a loading request for the instance.
        # Corresponds to the JSON property `wasLoadingRequest`
        # @return [Boolean]
        attr_accessor :was_loading_request
        alias_method :was_loading_request?, :was_loading_request
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_release = args[:app_engine_release] if args.key?(:app_engine_release)
          @app_id = args[:app_id] if args.key?(:app_id)
          @cost = args[:cost] if args.key?(:cost)
          @end_time = args[:end_time] if args.key?(:end_time)
          @finished = args[:finished] if args.key?(:finished)
          @first = args[:first] if args.key?(:first)
          @host = args[:host] if args.key?(:host)
          @http_version = args[:http_version] if args.key?(:http_version)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @instance_index = args[:instance_index] if args.key?(:instance_index)
          @ip = args[:ip] if args.key?(:ip)
          @latency = args[:latency] if args.key?(:latency)
          @line = args[:line] if args.key?(:line)
          @mega_cycles = args[:mega_cycles] if args.key?(:mega_cycles)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @module_id = args[:module_id] if args.key?(:module_id)
          @nickname = args[:nickname] if args.key?(:nickname)
          @pending_time = args[:pending_time] if args.key?(:pending_time)
          @referrer = args[:referrer] if args.key?(:referrer)
          @request_id = args[:request_id] if args.key?(:request_id)
          @resource = args[:resource] if args.key?(:resource)
          @response_size = args[:response_size] if args.key?(:response_size)
          @source_reference = args[:source_reference] if args.key?(:source_reference)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @task_name = args[:task_name] if args.key?(:task_name)
          @task_queue_name = args[:task_queue_name] if args.key?(:task_queue_name)
          @trace_id = args[:trace_id] if args.key?(:trace_id)
          @trace_sampled = args[:trace_sampled] if args.key?(:trace_sampled)
          @url_map_entry = args[:url_map_entry] if args.key?(:url_map_entry)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
          @version_id = args[:version_id] if args.key?(:version_id)
          @was_loading_request = args[:was_loading_request] if args.key?(:was_loading_request)
        end
      end
      
      # Specifies a location in a source code file.
      class SourceLocation
        include Google::Apis::Core::Hashable
      
        # Source file name. Depending on the runtime environment, this might be a simple
        # name or a fully-qualified name.
        # Corresponds to the JSON property `file`
        # @return [String]
        attr_accessor :file
      
        # Human-readable name of the function or method being invoked, with optional
        # context such as the class or package name. This information is used in
        # contexts such as the logs viewer, where a file and line number are less
        # meaningful. The format can vary by language. For example: qual.if.ied.Class.
        # method (Java), dir/package.func (Go), function (Python).
        # Corresponds to the JSON property `functionName`
        # @return [String]
        attr_accessor :function_name
      
        # Line within the source file.
        # Corresponds to the JSON property `line`
        # @return [Fixnum]
        attr_accessor :line
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file = args[:file] if args.key?(:file)
          @function_name = args[:function_name] if args.key?(:function_name)
          @line = args[:line] if args.key?(:line)
        end
      end
      
      # A reference to a particular snapshot of the source tree used to build and
      # deploy an application.
      class SourceReference
        include Google::Apis::Core::Hashable
      
        # Optional. A URI string identifying the repository. Example: "https://github.
        # com/GoogleCloudPlatform/kubernetes.git"
        # Corresponds to the JSON property `repository`
        # @return [String]
        attr_accessor :repository
      
        # The canonical and persistent identifier of the deployed revision. Example (git)
        # : "0035781c50ec7aa23385dc841529ce8a4b70db1b"
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @repository = args[:repository] if args.key?(:repository)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # The parameters to WriteLogEntries.
      class WriteLogEntriesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. If true, the request should expect normal response, but the entries
        # won't be persisted nor exported. Useful for checking whether the logging API
        # endpoints are working properly before sending valuable data.
        # Corresponds to the JSON property `dryRun`
        # @return [Boolean]
        attr_accessor :dry_run
        alias_method :dry_run?, :dry_run
      
        # Required. The log entries to send to Logging. The order of log entries in this
        # list does not matter. Values supplied in this method's log_name, resource, and
        # labels fields are copied into those log entries in this list that do not
        # include values for their corresponding fields. For more information, see the
        # LogEntry type.If the timestamp or insert_id fields are missing in log entries,
        # then this method supplies the current time or a unique identifier,
        # respectively. The supplied values are chosen so that, among the log entries
        # that did not supply their own values, the entries earlier in the list will
        # sort before the entries later in the list. See the entries.list method.Log
        # entries with timestamps that are more than the logs retention period in the
        # past or more than 24 hours in the future will not be available when calling
        # entries.list. However, those log entries can still be exported with LogSinks.
        # To improve throughput and to avoid exceeding the quota limit for calls to
        # entries.write, you should try to include several log entries in this list,
        # rather than calling this method for each individual log entry.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::LoggingV2::LogEntry>]
        attr_accessor :entries
      
        # Optional. Default labels that are added to the labels field of all log entries
        # in entries. If a log entry already has a label with the same key as a label in
        # this parameter, then the log entry's label is not changed. See LogEntry.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Optional. A default log resource name that is assigned to all log entries in
        # entries that do not specify a value for log_name:
        # "projects/[PROJECT_ID]/logs/[LOG_ID]"
        # "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        # "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        # "folders/[FOLDER_ID]/logs/[LOG_ID]"
        # [LOG_ID] must be URL-encoded. For example:
        # "projects/my-project-id/logs/syslog"
        # "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%2Factivity"
        # The permission <code>logging.logEntries.create</code> is needed on each
        # project, organization, billing account, or folder that is receiving new log
        # entries, whether the resource is specified in <code>logName</code> or in an
        # individual log entry.
        # Corresponds to the JSON property `logName`
        # @return [String]
        attr_accessor :log_name
      
        # Optional. Whether valid entries should be written even if some other entries
        # fail due to INVALID_ARGUMENT or PERMISSION_DENIED errors. If any entry is not
        # written, then the response status is the error associated with one of the
        # failed entries and the response includes error details keyed by the entries'
        # zero-based index in the entries.write method.
        # Corresponds to the JSON property `partialSuccess`
        # @return [Boolean]
        attr_accessor :partial_success
        alias_method :partial_success?, :partial_success
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The type field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the labels field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
        # zone":
        # ` "type": "gce_instance",
        # "labels": ` "instance_id": "12345678901234",
        # "zone": "us-central1-a" ``
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::LoggingV2::MonitoredResource]
        attr_accessor :resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dry_run = args[:dry_run] if args.key?(:dry_run)
          @entries = args[:entries] if args.key?(:entries)
          @labels = args[:labels] if args.key?(:labels)
          @log_name = args[:log_name] if args.key?(:log_name)
          @partial_success = args[:partial_success] if args.key?(:partial_success)
          @resource = args[:resource] if args.key?(:resource)
        end
      end
      
      # Result returned from WriteLogEntries. empty
      class WriteLogEntriesResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
    end
  end
end
