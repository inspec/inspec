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
    module TpuV1
      
      # A accelerator type that a Node can be configured with.
      class AcceleratorType
        include Google::Apis::Core::Hashable
      
        # The resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # the accelerator type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
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
      
      # Response for ListAcceleratorTypes.
      class ListAcceleratorTypesResponse
        include Google::Apis::Core::Hashable
      
        # The listed nodes.
        # Corresponds to the JSON property `acceleratorTypes`
        # @return [Array<Google::Apis::TpuV1::AcceleratorType>]
        attr_accessor :accelerator_types
      
        # The next page token or empty if none.
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
          @accelerator_types = args[:accelerator_types] if args.key?(:accelerator_types)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::TpuV1::Location>]
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
      
      # Response for ListNodes.
      class ListNodesResponse
        include Google::Apis::Core::Hashable
      
        # The next page token or empty if none.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The listed nodes.
        # Corresponds to the JSON property `nodes`
        # @return [Array<Google::Apis::TpuV1::Node>]
        attr_accessor :nodes
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @nodes = args[:nodes] if args.key?(:nodes)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
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
        # @return [Array<Google::Apis::TpuV1::Operation>]
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
      
      # Response for ListTensorFlowVersions.
      class ListTensorFlowVersionsResponse
        include Google::Apis::Core::Hashable
      
        # The next page token or empty if none.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The listed nodes.
        # Corresponds to the JSON property `tensorflowVersions`
        # @return [Array<Google::Apis::TpuV1::TensorFlowVersion>]
        attr_accessor :tensorflow_versions
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tensorflow_versions = args[:tensorflow_versions] if args.key?(:tensorflow_versions)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
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
      
        # The canonical id for this location. For example: `"us-east1"`.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations.
        # For example: `"projects/example-project/locations/us-east1"`
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
      
      # A network endpoint over which a TPU worker can be reached.
      class NetworkEndpoint
        include Google::Apis::Core::Hashable
      
        # The IP address of this network endpoint.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # The port of this network endpoint.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @port = args[:port] if args.key?(:port)
        end
      end
      
      # A TPU instance.
      class Node
        include Google::Apis::Core::Hashable
      
        # The type of hardware accelerators associated with this node.
        # Required.
        # Corresponds to the JSON property `acceleratorType`
        # @return [String]
        attr_accessor :accelerator_type
      
        # The CIDR block that the TPU node will use when selecting an IP address.
        # This CIDR block must be a /29 block; the Compute Engine networks API
        # forbids a smaller block, and using a larger block would be wasteful (a
        # node can only consume one IP address). Errors will occur if the CIDR block
        # has already been used for a currently existing TPU node, the CIDR block
        # conflicts with any subnetworks in the user's provided network, or the
        # provided network is peered with another network that is using that CIDR
        # block.
        # Required.
        # Corresponds to the JSON property `cidrBlock`
        # @return [String]
        attr_accessor :cidr_block
      
        # Output only. The time when the node was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The user-supplied description of the TPU. Maximum of 512 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The health status of the TPU node.
        # Corresponds to the JSON property `health`
        # @return [String]
        attr_accessor :health
      
        # Output only. If this field is populated, it contains a description of why the
        # TPU Node
        # is unhealthy.
        # Corresponds to the JSON property `healthDescription`
        # @return [String]
        attr_accessor :health_description
      
        # Output only. DEPRECATED! Use network_endpoints instead.
        # The network address for the TPU Node as visible to Compute Engine
        # instances.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # Resource labels to represent user-provided metadata.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The immutable name of the TPU
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The name of a network they wish to peer the TPU node to. It must be a
        # preexisting Compute Engine network inside of the project on which this API
        # has been activated. If none is provided, "default" will be used.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # Output only. The network endpoints where TPU workers can be accessed and
        # sent work. It is recommended that Tensorflow clients of the node reach out
        # to the 0th entry in this map first.
        # Corresponds to the JSON property `networkEndpoints`
        # @return [Array<Google::Apis::TpuV1::NetworkEndpoint>]
        attr_accessor :network_endpoints
      
        # Output only. DEPRECATED! Use network_endpoints instead.
        # The network port for the TPU Node as visible to Compute Engine instances.
        # Corresponds to the JSON property `port`
        # @return [String]
        attr_accessor :port
      
        # 
        # Corresponds to the JSON property `schedulingConfig`
        # @return [Google::Apis::TpuV1::SchedulingConfig]
        attr_accessor :scheduling_config
      
        # Output only. The service account used to run the tensor flow services within
        # the node.
        # To share resources, including Google Cloud Storage data, with the
        # Tensorflow job running in the Node, this account must have permissions to
        # that data.
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # Output only. The current state for the TPU Node.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The version of Tensorflow running in the Node.
        # Required.
        # Corresponds to the JSON property `tensorflowVersion`
        # @return [String]
        attr_accessor :tensorflow_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_type = args[:accelerator_type] if args.key?(:accelerator_type)
          @cidr_block = args[:cidr_block] if args.key?(:cidr_block)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @health = args[:health] if args.key?(:health)
          @health_description = args[:health_description] if args.key?(:health_description)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @network_endpoints = args[:network_endpoints] if args.key?(:network_endpoints)
          @port = args[:port] if args.key?(:port)
          @scheduling_config = args[:scheduling_config] if args.key?(:scheduling_config)
          @service_account = args[:service_account] if args.key?(:service_account)
          @state = args[:state] if args.key?(:state)
          @tensorflow_version = args[:tensorflow_version] if args.key?(:tensorflow_version)
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
        # @return [Google::Apis::TpuV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
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
      
      # Represents the metadata of the long-running operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # [Output only] API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # [Output only] Identifies whether the user has requested cancellation
        # of the operation. Operations that have successfully been cancelled
        # have Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # [Output only] The time the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # [Output only] The time the operation finished running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # [Output only] Human-readable status of the operation, if any.
        # Corresponds to the JSON property `statusDetail`
        # @return [String]
        attr_accessor :status_detail
      
        # [Output only] Server-defined resource path for the target of the operation.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # [Output only] Name of the verb executed by the operation.
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
      
      # Request for ReimageNode.
      class ReimageNodeRequest
        include Google::Apis::Core::Hashable
      
        # The version for reimage to create.
        # Corresponds to the JSON property `tensorflowVersion`
        # @return [String]
        attr_accessor :tensorflow_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tensorflow_version = args[:tensorflow_version] if args.key?(:tensorflow_version)
        end
      end
      
      # 
      class SchedulingConfig
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `preemptible`
        # @return [Boolean]
        attr_accessor :preemptible
        alias_method :preemptible?, :preemptible
      
        # Whether the node is created under a reservation.
        # Corresponds to the JSON property `reserved`
        # @return [Boolean]
        attr_accessor :reserved
        alias_method :reserved?, :reserved
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preemptible = args[:preemptible] if args.key?(:preemptible)
          @reserved = args[:reserved] if args.key?(:reserved)
        end
      end
      
      # Request for StartNode.
      class StartNodeRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
      
      # Request for StopNode.
      class StopNodeRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A tensorflow version that a Node can be configured with.
      class TensorFlowVersion
        include Google::Apis::Core::Hashable
      
        # The resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # the tensorflow version.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @version = args[:version] if args.key?(:version)
        end
      end
    end
  end
end
