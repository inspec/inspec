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
    module GenomicsV1
      
      # The request message for Operations.CancelOperation.
      class CancelOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Describes a Compute Engine resource that is being managed by a running
      # pipeline.
      class ComputeEngine
        include Google::Apis::Core::Hashable
      
        # The names of the disks that were created for this pipeline.
        # Corresponds to the JSON property `diskNames`
        # @return [Array<String>]
        attr_accessor :disk_names
      
        # The instance on which the operation is running.
        # Corresponds to the JSON property `instanceName`
        # @return [String]
        attr_accessor :instance_name
      
        # The machine type of the instance.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # The availability zone in which the instance resides.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk_names = args[:disk_names] if args.key?(:disk_names)
          @instance_name = args[:instance_name] if args.key?(:instance_name)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # An event generated when a container is forcibly terminated by the
      # worker. Currently, this only occurs when the container outlives the
      # timeout specified by the user.
      class ContainerKilledEvent
        include Google::Apis::Core::Hashable
      
        # The numeric ID of the action that started the container.
        # Corresponds to the JSON property `actionId`
        # @return [Fixnum]
        attr_accessor :action_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_id = args[:action_id] if args.key?(:action_id)
        end
      end
      
      # An event generated when a container starts.
      class ContainerStartedEvent
        include Google::Apis::Core::Hashable
      
        # The numeric ID of the action that started this container.
        # Corresponds to the JSON property `actionId`
        # @return [Fixnum]
        attr_accessor :action_id
      
        # The public IP address that can be used to connect to the container. This
        # field is only populated when at least one port mapping is present. If the
        # instance was created with a private address, this field will be empty even
        # if port mappings exist.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # The container-to-host port mappings installed for this container. This
        # set will contain any ports exposed using the `PUBLISH_EXPOSED_PORTS` flag
        # as well as any specified in the `Action` definition.
        # Corresponds to the JSON property `portMappings`
        # @return [Hash<String,Fixnum>]
        attr_accessor :port_mappings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_id = args[:action_id] if args.key?(:action_id)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @port_mappings = args[:port_mappings] if args.key?(:port_mappings)
        end
      end
      
      # An event generated when a container exits.
      class ContainerStoppedEvent
        include Google::Apis::Core::Hashable
      
        # The numeric ID of the action that started this container.
        # Corresponds to the JSON property `actionId`
        # @return [Fixnum]
        attr_accessor :action_id
      
        # The exit status of the container.
        # Corresponds to the JSON property `exitStatus`
        # @return [Fixnum]
        attr_accessor :exit_status
      
        # The tail end of any content written to standard error by the container.
        # If the content emits large amounts of debugging noise or contains
        # sensitive information, you can prevent the content from being printed by
        # setting the `DISABLE_STANDARD_ERROR_CAPTURE` flag.
        # Note that only a small amount of the end of the stream is captured here.
        # The entire stream is stored in the `/google/logs` directory mounted into
        # each action, and can be copied off the machine as described elsewhere.
        # Corresponds to the JSON property `stderr`
        # @return [String]
        attr_accessor :stderr
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_id = args[:action_id] if args.key?(:action_id)
          @exit_status = args[:exit_status] if args.key?(:exit_status)
          @stderr = args[:stderr] if args.key?(:stderr)
        end
      end
      
      # An event generated whenever a resource limitation or transient error
      # delays execution of a pipeline that was otherwise ready to run.
      class DelayedEvent
        include Google::Apis::Core::Hashable
      
        # A textual description of the cause of the delay. The string can change
        # without notice because it is often generated by another service (such as
        # Compute Engine).
        # Corresponds to the JSON property `cause`
        # @return [String]
        attr_accessor :cause
      
        # If the delay was caused by a resource shortage, this field lists the
        # Compute Engine metrics that are preventing this operation from running
        # (for example, `CPUS` or `INSTANCES`). If the particular metric is not
        # known, a single `UNKNOWN` metric will be present.
        # Corresponds to the JSON property `metrics`
        # @return [Array<String>]
        attr_accessor :metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cause = args[:cause] if args.key?(:cause)
          @metrics = args[:metrics] if args.key?(:metrics)
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
      
      # Carries information about events that occur during pipeline execution.
      class Event
        include Google::Apis::Core::Hashable
      
        # A human-readable description of the event. Note that these strings can
        # change at any time without notice. Any application logic must use the
        # information in the `details` field.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Machine-readable details about the event.
        # Corresponds to the JSON property `details`
        # @return [Hash<String,Object>]
        attr_accessor :details
      
        # The time at which the event occurred.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @details = args[:details] if args.key?(:details)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # An event generated when the execution of a pipeline has failed. Note
      # that other events can continue to occur after this event.
      class FailedEvent
        include Google::Apis::Core::Hashable
      
        # The human-readable description of the cause of the failure.
        # Corresponds to the JSON property `cause`
        # @return [String]
        attr_accessor :cause
      
        # The Google standard error code that best describes this failure.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cause = args[:cause] if args.key?(:cause)
          @code = args[:code] if args.key?(:code)
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
        # @return [Array<Google::Apis::GenomicsV1::Operation>]
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
        # @return [Google::Apis::GenomicsV1::Status]
        attr_accessor :error
      
        # An OperationMetadata or Metadata object. This will always be returned with the
        # Operation.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. For example&#58; `operations/CJHU7Oi_ChDrveSpBRjfuL-
        # qzoWAgEw`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An Empty object.
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
      
      # An event that occurred during an Operation.
      class OperationEvent
        include Google::Apis::Core::Hashable
      
        # Required description of event.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional time of when event finished. An event can have a start time and no
        # finish time. If an event has a finish time, there must be a start time.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional time of when event started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Metadata describing an Operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # This field is deprecated. Use `labels` instead. Optionally provided by the
        # caller when submitting the request that creates the operation.
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # The time at which the job was submitted to the Genomics service.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The time at which the job stopped running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional event messages that were generated during the job's execution.
        # This also contains any warnings that were generated during import
        # or export.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::GenomicsV1::OperationEvent>]
        attr_accessor :events
      
        # Optionally provided by the caller when submitting the request that creates
        # the operation.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The Google Cloud Project in which the job is scoped.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The original request that started the operation. Note that this will be in
        # current version of the API. If the operation was started with v1beta2 API
        # and a GetOperation is performed on v1 API, a v1 request will be returned.
        # Corresponds to the JSON property `request`
        # @return [Hash<String,Object>]
        attr_accessor :request
      
        # Runtime metadata on this Operation.
        # Corresponds to the JSON property `runtimeMetadata`
        # @return [Hash<String,Object>]
        attr_accessor :runtime_metadata
      
        # The time at which the job began to run.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @events = args[:events] if args.key?(:events)
          @labels = args[:labels] if args.key?(:labels)
          @project_id = args[:project_id] if args.key?(:project_id)
          @request = args[:request] if args.key?(:request)
          @runtime_metadata = args[:runtime_metadata] if args.key?(:runtime_metadata)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # An event generated when the worker starts pulling an image.
      class PullStartedEvent
        include Google::Apis::Core::Hashable
      
        # The URI of the image that was pulled.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # An event generated when the worker stops pulling an image.
      class PullStoppedEvent
        include Google::Apis::Core::Hashable
      
        # The URI of the image that was pulled.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # The response to the RunPipeline method, returned in the operation's result
      # field on success.
      class RunPipelineResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Runtime metadata that will be populated in the
      # runtimeMetadata
      # field of the Operation associated with a RunPipeline execution.
      class RuntimeMetadata
        include Google::Apis::Core::Hashable
      
        # Describes a Compute Engine resource that is being managed by a running
        # pipeline.
        # Corresponds to the JSON property `computeEngine`
        # @return [Google::Apis::GenomicsV1::ComputeEngine]
        attr_accessor :compute_engine
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compute_engine = args[:compute_engine] if args.key?(:compute_engine)
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
      
      # An event generated when the execution of a container results in a
      # non-zero exit status that was not otherwise ignored. Execution will
      # continue, but only actions that are flagged as `ALWAYS_RUN` will be
      # executed. Other actions will be skipped.
      class UnexpectedExitStatusEvent
        include Google::Apis::Core::Hashable
      
        # The numeric ID of the action that started the container.
        # Corresponds to the JSON property `actionId`
        # @return [Fixnum]
        attr_accessor :action_id
      
        # The exit status of the container.
        # Corresponds to the JSON property `exitStatus`
        # @return [Fixnum]
        attr_accessor :exit_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_id = args[:action_id] if args.key?(:action_id)
          @exit_status = args[:exit_status] if args.key?(:exit_status)
        end
      end
      
      # An event generated after a worker VM has been assigned to run the
      # pipeline.
      class WorkerAssignedEvent
        include Google::Apis::Core::Hashable
      
        # The worker's instance name.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # The machine type that was assigned for the worker.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # The zone the worker is running in.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance = args[:instance] if args.key?(:instance)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # An event generated when the worker VM that was assigned to the pipeline
      # has been released (deleted).
      class WorkerReleasedEvent
        include Google::Apis::Core::Hashable
      
        # The worker's instance name.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # The zone the worker was running in.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance = args[:instance] if args.key?(:instance)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
    end
  end
end
