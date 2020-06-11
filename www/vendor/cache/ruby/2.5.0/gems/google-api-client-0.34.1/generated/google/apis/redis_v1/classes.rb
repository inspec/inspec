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
    module RedisV1
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request for Export.
      class ExportInstanceRequest
        include Google::Apis::Core::Hashable
      
        # The output content
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::RedisV1::OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Request for Failover.
      class FailoverInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Available data protection modes that the user can choose. If it's
        # unspecified, data protection mode will be LIMITED_DATA_LOSS by default.
        # Corresponds to the JSON property `dataProtectionMode`
        # @return [String]
        attr_accessor :data_protection_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_protection_mode = args[:data_protection_mode] if args.key?(:data_protection_mode)
        end
      end
      
      # The Cloud Storage location for the output content
      class GcsDestination
        include Google::Apis::Core::Hashable
      
        # Required. Data destination URI (e.g.
        # 'gs://my_bucket/my_object'). Existing files will be overwritten.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Cloud Storage location for the input content
      class GcsSource
        include Google::Apis::Core::Hashable
      
        # Required. Source data URI. (e.g. 'gs://my_bucket/my_object').
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # This location metadata represents additional configuration options for a
      # given location where a Redis instance may be created. All fields are output
      # only. It is returned as content of the
      # `google.cloud.location.Location.metadata` field.
      class GoogleCloudRedisV1LocationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The set of available zones in the location. The map is keyed
        # by the lowercase ID of each zone, as defined by GCE. These keys can be
        # specified in `location_id` or `alternative_location_id` fields when
        # creating a Redis instance.
        # Corresponds to the JSON property `availableZones`
        # @return [Hash<String,Google::Apis::RedisV1::GoogleCloudRedisV1ZoneMetadata>]
        attr_accessor :available_zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_zones = args[:available_zones] if args.key?(:available_zones)
        end
      end
      
      # Represents the v1 metadata of the long-running operation.
      class GoogleCloudRedisV1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # API version.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # Specifies if cancellation was requested for the operation.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # Creation timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # End timestamp.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Operation status details.
        # Corresponds to the JSON property `statusDetail`
        # @return [String]
        attr_accessor :status_detail
      
        # Operation target.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # Operation verb.
        # Corresponds to the JSON property `verb`
        # @return [String]
        attr_accessor :verb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @cancel_requested = args[:cancel_requested] if args.key?(:cancel_requested)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @status_detail = args[:status_detail] if args.key?(:status_detail)
          @target = args[:target] if args.key?(:target)
          @verb = args[:verb] if args.key?(:verb)
        end
      end
      
      # Defines specific information for a particular zone. Currently empty and
      # reserved for future use only.
      class GoogleCloudRedisV1ZoneMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request for Import.
      class ImportInstanceRequest
        include Google::Apis::Core::Hashable
      
        # The input content
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::RedisV1::InputConfig]
        attr_accessor :input_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @input_config = args[:input_config] if args.key?(:input_config)
        end
      end
      
      # The input content
      class InputConfig
        include Google::Apis::Core::Hashable
      
        # The Cloud Storage location for the input content
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::RedisV1::GcsSource]
        attr_accessor :gcs_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
        end
      end
      
      # A Google Cloud Redis instance.
      class Instance
        include Google::Apis::Core::Hashable
      
        # Optional. Only applicable to STANDARD_HA tier which protects the instance
        # against zonal failures by provisioning it across two zones. If provided, it
        # must be a different zone from the one provided in location_id.
        # Corresponds to the JSON property `alternativeLocationId`
        # @return [String]
        attr_accessor :alternative_location_id
      
        # Optional. The full name of the Google Compute Engine
        # [network](/compute/docs/networks-and-firewalls#networks) to which the
        # instance is connected. If left unspecified, the `default` network
        # will be used.
        # Corresponds to the JSON property `authorizedNetwork`
        # @return [String]
        attr_accessor :authorized_network
      
        # Output only. The time the instance was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The current zone where the Redis endpoint is placed. For Basic
        # Tier instances, this will always be the same as the location_id
        # provided by the user at creation time. For Standard Tier instances,
        # this can be either location_id or alternative_location_id and can
        # change after a failover event.
        # Corresponds to the JSON property `currentLocationId`
        # @return [String]
        attr_accessor :current_location_id
      
        # An arbitrary and optional user-provided name for the instance.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. Hostname or IP address of the exposed Redis endpoint used by
        # clients to connect to the service.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # Resource labels to represent user provided metadata
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Optional. The zone where the instance will be provisioned. If not provided,
        # the service will choose a zone for the instance. For STANDARD_HA tier,
        # instances will be created across two zones for protection against zonal
        # failures. If alternative_location_id is also provided, it must be
        # different from location_id.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Required. Redis memory size in GiB.
        # Corresponds to the JSON property `memorySizeGb`
        # @return [Fixnum]
        attr_accessor :memory_size_gb
      
        # Required. Unique name of the resource in this scope including project and
        # location using the form:
        # `projects/`project_id`/locations/`location_id`/instances/`instance_id``
        # Note: Redis instances are managed and addressed at regional level so
        # location_id here refers to a GCP region; however, users may choose which
        # specific zone (or collection of zones for cross-zone instances) an instance
        # should be provisioned in. Refer to location_id and
        # alternative_location_id fields for more details.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Cloud IAM identity used by import / export operations to
        # transfer data to/from Cloud Storage. Format is
        # "serviceAccount:<service_account_email>". The value may change over time
        # for a given instance so should be checked before each import/export
        # operation.
        # Corresponds to the JSON property `persistenceIamIdentity`
        # @return [String]
        attr_accessor :persistence_iam_identity
      
        # Output only. The port number of the exposed Redis endpoint.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # Optional. Redis configuration parameters, according to
        # http://redis.io/topics/config. Currently, the only supported parameters
        # are:
        # Redis 3.2 and above:
        # *   maxmemory-policy
        # *   notify-keyspace-events
        # Redis 4.0 and above:
        # *   activedefrag
        # *   lfu-log-factor
        # *   lfu-decay-time
        # Corresponds to the JSON property `redisConfigs`
        # @return [Hash<String,String>]
        attr_accessor :redis_configs
      
        # Optional. The version of Redis software.
        # If not provided, latest supported version will be used. Updating the
        # version will perform an upgrade/downgrade to the new version. Currently,
        # the supported values are:
        # *   `REDIS_4_0` for Redis 4.0 compatibility (default)
        # *   `REDIS_3_2` for Redis 3.2 compatibility
        # Corresponds to the JSON property `redisVersion`
        # @return [String]
        attr_accessor :redis_version
      
        # Optional. The CIDR range of internal addresses that are reserved for this
        # instance. If not provided, the service will choose an unused /29 block,
        # for example, 10.0.0.0/29 or 192.168.0.0/29. Ranges must be unique
        # and non-overlapping with existing subnets in an authorized network.
        # Corresponds to the JSON property `reservedIpRange`
        # @return [String]
        attr_accessor :reserved_ip_range
      
        # Output only. The current state of this instance.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Additional information about the current status of this
        # instance, if available.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # Required. The service tier of the instance.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_location_id = args[:alternative_location_id] if args.key?(:alternative_location_id)
          @authorized_network = args[:authorized_network] if args.key?(:authorized_network)
          @create_time = args[:create_time] if args.key?(:create_time)
          @current_location_id = args[:current_location_id] if args.key?(:current_location_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @host = args[:host] if args.key?(:host)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @memory_size_gb = args[:memory_size_gb] if args.key?(:memory_size_gb)
          @name = args[:name] if args.key?(:name)
          @persistence_iam_identity = args[:persistence_iam_identity] if args.key?(:persistence_iam_identity)
          @port = args[:port] if args.key?(:port)
          @redis_configs = args[:redis_configs] if args.key?(:redis_configs)
          @redis_version = args[:redis_version] if args.key?(:redis_version)
          @reserved_ip_range = args[:reserved_ip_range] if args.key?(:reserved_ip_range)
          @state = args[:state] if args.key?(:state)
          @status_message = args[:status_message] if args.key?(:status_message)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # Response for ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # A list of Redis instances in the project in the specified location,
        # or across all locations.
        # If the `location_id` in the parent field of the request is "-", all regions
        # available to the project are queried, and the results aggregated.
        # If in such an aggregated query a location is unavailable, a dummy Redis
        # entry is included in the response with the `name` field set to a value of
        # the form `projects/`project_id`/locations/`location_id`/instances/`- and
        # the `status` field set to ERROR and `status_message` field set to "location
        # not available for ListInstances".
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::RedisV1::Instance>]
        attr_accessor :instances
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::RedisV1::Location>]
        attr_accessor :locations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::RedisV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # A resource that represents Google Cloud Platform location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name.
        # For example, "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example
        # `"cloud.googleapis.com/region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Resource ID for the region. For example: "us-east1".
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Output only. The set of available zones in the location. The map is keyed by
        # the lowercase ID of each zone, as defined by Compute Engine. These keys can be
        # specified in `location_id` or `alternative_location_id` fields when creating a
        # Redis instance.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Full resource name for the region. For example: "projects/example-project/
        # locations/us-east1".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::RedisV1::Status]
        attr_accessor :error
      
        # `
        # `createTime`: The time the operation was created.
        # `endTime`: The time the operation finished running.
        # `target`: Server-defined resource path for the target of the operation.
        # `verb`: Name of the verb executed by the operation.
        # `statusDetail`: Human-readable status of the operation, if any.
        # `cancelRequested`: Identifies whether the user has requested cancellation of
        # the operation. Operations that have successfully been cancelled have Operation.
        # error value with a google.rpc.Status.code of 1, corresponding to `Code.
        # CANCELLED`.
        # `apiVersion`: API version used to start the operation.
        # `
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The output content
      class OutputConfig
        include Google::Apis::Core::Hashable
      
        # The Cloud Storage location for the output content
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::RedisV1::GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
    end
  end
end
