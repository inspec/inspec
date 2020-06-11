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
    module GenomicsV1alpha2
      
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
      
      # Stores the information that the controller will fetch from the
      # server in order to run. Should only be used by VMs created by the
      # Pipelines Service and not by end users.
      class ControllerConfig
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `cmd`
        # @return [String]
        attr_accessor :cmd
      
        # 
        # Corresponds to the JSON property `disks`
        # @return [Hash<String,String>]
        attr_accessor :disks
      
        # 
        # Corresponds to the JSON property `gcsLogPath`
        # @return [String]
        attr_accessor :gcs_log_path
      
        # 
        # Corresponds to the JSON property `gcsSinks`
        # @return [Hash<String,Google::Apis::GenomicsV1alpha2::RepeatedString>]
        attr_accessor :gcs_sinks
      
        # 
        # Corresponds to the JSON property `gcsSources`
        # @return [Hash<String,Google::Apis::GenomicsV1alpha2::RepeatedString>]
        attr_accessor :gcs_sources
      
        # 
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # 
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # 
        # Corresponds to the JSON property `vars`
        # @return [Hash<String,String>]
        attr_accessor :vars
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cmd = args[:cmd] if args.key?(:cmd)
          @disks = args[:disks] if args.key?(:disks)
          @gcs_log_path = args[:gcs_log_path] if args.key?(:gcs_log_path)
          @gcs_sinks = args[:gcs_sinks] if args.key?(:gcs_sinks)
          @gcs_sources = args[:gcs_sources] if args.key?(:gcs_sources)
          @image = args[:image] if args.key?(:image)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @vars = args[:vars] if args.key?(:vars)
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
      
      # A Google Compute Engine disk resource specification.
      class Disk
        include Google::Apis::Core::Hashable
      
        # Deprecated. Disks created by the Pipelines API will be deleted at the end
        # of the pipeline run, regardless of what this field is set to.
        # Corresponds to the JSON property `autoDelete`
        # @return [Boolean]
        attr_accessor :auto_delete
        alias_method :auto_delete?, :auto_delete
      
        # Required at create time and cannot be overridden at run time.
        # Specifies the path in the docker container where files on
        # this disk should be located. For example, if `mountPoint`
        # is `/mnt/disk`, and the parameter has `localPath`
        # `inputs/file.txt`, the docker container can access the data at
        # `/mnt/disk/inputs/file.txt`.
        # Corresponds to the JSON property `mountPoint`
        # @return [String]
        attr_accessor :mount_point
      
        # Required. The name of the disk that can be used in the pipeline
        # parameters. Must be 1 - 63 characters.
        # The name "boot" is reserved for system use.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Specifies how a sourced-base persistent disk will be mounted. See
        # https://cloud.google.com/compute/docs/disks/persistent-disks#
        # use_multi_instances
        # for more details.
        # Can only be set at create time.
        # Corresponds to the JSON property `readOnly`
        # @return [Boolean]
        attr_accessor :read_only
        alias_method :read_only?, :read_only
      
        # The size of the disk. Defaults to 500 (GB).
        # This field is not applicable for local SSD.
        # Corresponds to the JSON property `sizeGb`
        # @return [Fixnum]
        attr_accessor :size_gb
      
        # The full or partial URL of the persistent disk to attach. See
        # https://cloud.google.com/compute/docs/reference/latest/instances#resource
        # and
        # https://cloud.google.com/compute/docs/disks/persistent-disks#snapshots
        # for more details.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Required. The type of the disk to create.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_delete = args[:auto_delete] if args.key?(:auto_delete)
          @mount_point = args[:mount_point] if args.key?(:mount_point)
          @name = args[:name] if args.key?(:name)
          @read_only = args[:read_only] if args.key?(:read_only)
          @size_gb = args[:size_gb] if args.key?(:size_gb)
          @source = args[:source] if args.key?(:source)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Docker execuctor specification.
      class DockerExecutor
        include Google::Apis::Core::Hashable
      
        # Required. The command or newline delimited script to run. The command
        # string will be executed within a bash shell.
        # If the command exits with a non-zero exit code, output parameter
        # de-localization will be skipped and the pipeline operation's
        # `error` field will be populated.
        # Maximum command string length is 16384.
        # Corresponds to the JSON property `cmd`
        # @return [String]
        attr_accessor :cmd
      
        # Required. Image name from either Docker Hub or Google Container Registry.
        # Users that run pipelines must have READ access to the image.
        # Corresponds to the JSON property `imageName`
        # @return [String]
        attr_accessor :image_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cmd = args[:cmd] if args.key?(:cmd)
          @image_name = args[:image_name] if args.key?(:image_name)
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
        # @return [Array<Google::Apis::GenomicsV1alpha2::Operation>]
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
      
      # The response of ListPipelines. Contains at most `pageSize`
      # pipelines. If it contains `pageSize` pipelines, and more pipelines
      # exist, then `nextPageToken` will be populated and should be
      # used as the `pageToken` argument to a subsequent ListPipelines
      # request.
      class ListPipelinesResponse
        include Google::Apis::Core::Hashable
      
        # The token to use to get the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The matched pipelines.
        # Corresponds to the JSON property `pipelines`
        # @return [Array<Google::Apis::GenomicsV1alpha2::Pipeline>]
        attr_accessor :pipelines
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @pipelines = args[:pipelines] if args.key?(:pipelines)
        end
      end
      
      # LocalCopy defines how a remote file should be copied to and from the VM.
      class LocalCopy
        include Google::Apis::Core::Hashable
      
        # Required. The name of the disk where this parameter is
        # located. Can be the name of one of the disks specified in the
        # Resources field, or "boot", which represents the Docker
        # instance's boot disk and has a mount point of `/`.
        # Corresponds to the JSON property `disk`
        # @return [String]
        attr_accessor :disk
      
        # Required. The path within the user's docker container where
        # this input should be localized to and from, relative to the specified
        # disk's mount point. For example: file.txt,
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk = args[:disk] if args.key?(:disk)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # The logging options for the pipeline run.
      class LoggingOptions
        include Google::Apis::Core::Hashable
      
        # The location in Google Cloud Storage to which the pipeline logs
        # will be copied. Can be specified as a fully qualified directory
        # path, in which case logs will be output with a unique identifier
        # as the filename in that directory, or as a fully specified path,
        # which must end in `.log`, in which case that path will be
        # used, and the user must ensure that logs are not
        # overwritten. Stdout and stderr logs from the run are also
        # generated and output as `-stdout.log` and `-stderr.log`.
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
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
        # @return [Google::Apis::GenomicsV1alpha2::Status]
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
        # @return [Array<Google::Apis::GenomicsV1alpha2::OperationEvent>]
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
      
      # The pipeline object. Represents a transformation from a set of input
      # parameters to a set of output parameters. The transformation is defined
      # as a docker image and command to run within that image. Each pipeline
      # is run on a Google Compute Engine VM. A pipeline can be created with the
      # `create` method and then later run with the `run` method, or a pipeline can
      # be defined and run all at once with the `run` method.
      class Pipeline
        include Google::Apis::Core::Hashable
      
        # User-specified description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The Docker execuctor specification.
        # Corresponds to the JSON property `docker`
        # @return [Google::Apis::GenomicsV1alpha2::DockerExecutor]
        attr_accessor :docker
      
        # Input parameters of the pipeline.
        # Corresponds to the JSON property `inputParameters`
        # @return [Array<Google::Apis::GenomicsV1alpha2::PipelineParameter>]
        attr_accessor :input_parameters
      
        # Required. A user specified pipeline name that does not have to be unique.
        # This name can be used for filtering Pipelines in ListPipelines.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output parameters of the pipeline.
        # Corresponds to the JSON property `outputParameters`
        # @return [Array<Google::Apis::GenomicsV1alpha2::PipelineParameter>]
        attr_accessor :output_parameters
      
        # Unique pipeline id that is generated by the service when CreatePipeline
        # is called. Cannot be specified in the Pipeline used in the
        # CreatePipelineRequest, and will be populated in the response to
        # CreatePipeline and all subsequent Get and List calls. Indicates that the
        # service has registered this pipeline.
        # Corresponds to the JSON property `pipelineId`
        # @return [String]
        attr_accessor :pipeline_id
      
        # Required. The project in which to create the pipeline. The caller must have
        # WRITE access.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The system resources for the pipeline run.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::GenomicsV1alpha2::PipelineResources]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @docker = args[:docker] if args.key?(:docker)
          @input_parameters = args[:input_parameters] if args.key?(:input_parameters)
          @name = args[:name] if args.key?(:name)
          @output_parameters = args[:output_parameters] if args.key?(:output_parameters)
          @pipeline_id = args[:pipeline_id] if args.key?(:pipeline_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # Parameters facilitate setting and delivering data into the
      # pipeline's execution environment. They are defined at create time,
      # with optional defaults, and can be overridden at run time.
      # If `localCopy` is unset, then the parameter specifies a string that
      # is passed as-is into the pipeline, as the value of the environment
      # variable with the given name.  A default value can be optionally
      # specified at create time. The default can be overridden at run time
      # using the inputs map. If no default is given, a value must be
      # supplied at runtime.
      # If `localCopy` is defined, then the parameter specifies a data
      # source or sink, both in Google Cloud Storage and on the Docker container
      # where the pipeline computation is run. The service account associated with
      # the Pipeline (by
      # default the project's Compute Engine service account) must have access to the
      # Google Cloud Storage paths.
      # At run time, the Google Cloud Storage paths can be overridden if a default
      # was provided at create time, or must be set otherwise. The pipeline runner
      # should add a key/value pair to either the inputs or outputs map. The
      # indicated data copies will be carried out before/after pipeline execution,
      # just as if the corresponding arguments were provided to `gsutil cp`.
      # For example: Given the following `PipelineParameter`, specified
      # in the `inputParameters` list:
      # ```
      # `name: "input_file", localCopy: `path: "file.txt", disk: "pd1"``
      # ```
      # where `disk` is defined in the `PipelineResources` object as:
      # ```
      # `name: "pd1", mountPoint: "/mnt/disk/"`
      # ```
      # We create a disk named `pd1`, mount it on the host VM, and map
      # `/mnt/pd1` to `/mnt/disk` in the docker container.  At
      # runtime, an entry for `input_file` would be required in the inputs
      # map, such as:
      # ```
      # inputs["input_file"] = "gs://my-bucket/bar.txt"
      # ```
      # This would generate the following gsutil call:
      # ```
      # gsutil cp gs://my-bucket/bar.txt /mnt/pd1/file.txt
      # ```
      # The file `/mnt/pd1/file.txt` maps to `/mnt/disk/file.txt` in the
      # Docker container. Acceptable paths are:
      # <table>
      # <thead>
      # <tr><th>Google Cloud storage path</th><th>Local path</th></tr>
      # </thead>
      # <tbody>
      # <tr><td>file</td><td>file</td></tr>
      # <tr><td>glob</td><td>directory</td></tr>
      # </tbody>
      # </table>
      # For outputs, the direction of the copy is reversed:
      # ```
      # gsutil cp /mnt/disk/file.txt gs://my-bucket/bar.txt
      # ```
      # Acceptable paths are:
      # <table>
      # <thead>
      # <tr><th>Local path</th><th>Google Cloud Storage path</th></tr>
      # </thead>
      # <tbody>
      # <tr><td>file</td><td>file</td></tr>
      # <tr>
      # <td>file</td>
      # <td>directory - directory must already exist</td>
      # </tr>
      # <tr>
      # <td>glob</td>
      # <td>directory - directory will be created if it doesn't exist</td></tr>
      # </tbody>
      # </table>
      # One restriction due to docker limitations, is that for outputs that are found
      # on the boot disk, the local path cannot be a glob and must be a file.
      class PipelineParameter
        include Google::Apis::Core::Hashable
      
        # The default value for this parameter. Can be overridden at runtime.
        # If `localCopy` is present, then this must be a Google Cloud Storage path
        # beginning with `gs://`.
        # Corresponds to the JSON property `defaultValue`
        # @return [String]
        attr_accessor :default_value
      
        # Human-readable description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # LocalCopy defines how a remote file should be copied to and from the VM.
        # Corresponds to the JSON property `localCopy`
        # @return [Google::Apis::GenomicsV1alpha2::LocalCopy]
        attr_accessor :local_copy
      
        # Required. Name of the parameter - the pipeline runner uses this string
        # as the key to the input and output maps in RunPipeline.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_value = args[:default_value] if args.key?(:default_value)
          @description = args[:description] if args.key?(:description)
          @local_copy = args[:local_copy] if args.key?(:local_copy)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The system resources for the pipeline run.
      class PipelineResources
        include Google::Apis::Core::Hashable
      
        # Optional. The number of accelerators of the specified type to attach.
        # By specifying this parameter, you will download and install the following
        # third-party software onto your managed Compute Engine instances:
        # NVIDIA® Tesla® drivers and NVIDIA® CUDA toolkit.
        # Corresponds to the JSON property `acceleratorCount`
        # @return [Fixnum]
        attr_accessor :accelerator_count
      
        # Optional. The Compute Engine defined accelerator type.
        # By specifying this parameter, you will download and install the following
        # third-party software onto your managed Compute Engine instances: NVIDIA®
        # Tesla® drivers and NVIDIA® CUDA toolkit.
        # Please see https://cloud.google.com/compute/docs/gpus/ for a list of
        # available accelerator types.
        # Corresponds to the JSON property `acceleratorType`
        # @return [String]
        attr_accessor :accelerator_type
      
        # The size of the boot disk. Defaults to 10 (GB).
        # Corresponds to the JSON property `bootDiskSizeGb`
        # @return [Fixnum]
        attr_accessor :boot_disk_size_gb
      
        # Disks to attach.
        # Corresponds to the JSON property `disks`
        # @return [Array<Google::Apis::GenomicsV1alpha2::Disk>]
        attr_accessor :disks
      
        # The minimum number of cores to use. Defaults to 1.
        # Corresponds to the JSON property `minimumCpuCores`
        # @return [Fixnum]
        attr_accessor :minimum_cpu_cores
      
        # The minimum amount of RAM to use. Defaults to 3.75 (GB)
        # Corresponds to the JSON property `minimumRamGb`
        # @return [Float]
        attr_accessor :minimum_ram_gb
      
        # Whether to assign an external IP to the instance. This is an experimental
        # feature that may go away. Defaults to false.
        # Corresponds to `--no_address` flag for [gcloud compute instances create]
        # (https://cloud.google.com/sdk/gcloud/reference/compute/instances/create).
        # In order to use this, must be true for both create time and run time.
        # Cannot be true at run time if false at create time. If you need to ssh into
        # a private IP VM for debugging, you can ssh to a public VM and then ssh into
        # the private VM's Internal IP.  If noAddress is set, this pipeline run may
        # only load docker images from Google Container Registry and not Docker Hub.
        # Before using this, you must
        # [configure access to Google services from internal
        # IPs](https://cloud.google.com/compute/docs/configure-private-google-access#
        # configuring_access_to_google_services_from_internal_ips).
        # Corresponds to the JSON property `noAddress`
        # @return [Boolean]
        attr_accessor :no_address
        alias_method :no_address?, :no_address
      
        # Whether to use preemptible VMs. Defaults to `false`. In order to use this,
        # must be true for both create time and run time. Cannot be true at run time
        # if false at create time.
        # Corresponds to the JSON property `preemptible`
        # @return [Boolean]
        attr_accessor :preemptible
        alias_method :preemptible?, :preemptible
      
        # List of Google Compute Engine availability zones to which resource
        # creation will restricted. If empty, any zone may be chosen.
        # Corresponds to the JSON property `zones`
        # @return [Array<String>]
        attr_accessor :zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_count = args[:accelerator_count] if args.key?(:accelerator_count)
          @accelerator_type = args[:accelerator_type] if args.key?(:accelerator_type)
          @boot_disk_size_gb = args[:boot_disk_size_gb] if args.key?(:boot_disk_size_gb)
          @disks = args[:disks] if args.key?(:disks)
          @minimum_cpu_cores = args[:minimum_cpu_cores] if args.key?(:minimum_cpu_cores)
          @minimum_ram_gb = args[:minimum_ram_gb] if args.key?(:minimum_ram_gb)
          @no_address = args[:no_address] if args.key?(:no_address)
          @preemptible = args[:preemptible] if args.key?(:preemptible)
          @zones = args[:zones] if args.key?(:zones)
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
      
      # 
      class RepeatedString
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # The pipeline run arguments.
      class RunPipelineArgs
        include Google::Apis::Core::Hashable
      
        # This field is deprecated. Use `labels` instead. Client-specified pipeline
        # operation identifier.
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # Pipeline input arguments; keys are defined in the pipeline documentation.
        # All input parameters that do not have default values  must be specified.
        # If parameters with defaults are specified here, the defaults will be
        # overridden.
        # Corresponds to the JSON property `inputs`
        # @return [Hash<String,String>]
        attr_accessor :inputs
      
        # How long to keep the VM up after a failure (for example docker command
        # failed, copying input or output files failed, etc). While the VM is up, one
        # can ssh into the VM to debug. Default is 0; maximum allowed value is 1 day.
        # Corresponds to the JSON property `keepVmAliveOnFailureDuration`
        # @return [String]
        attr_accessor :keep_vm_alive_on_failure_duration
      
        # Labels to apply to this pipeline run. Labels will also be applied to
        # compute resources (VM, disks) created by this pipeline run. When listing
        # operations, operations can filtered by labels.
        # Label keys may not be empty; label values may be empty. Non-empty labels
        # must be 1-63 characters long, and comply with [RFC1035]
        # (https://www.ietf.org/rfc/rfc1035.txt).
        # Specifically, the name must be 1-63 characters long and match the regular
        # expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first
        # character must be a lowercase letter, and all following characters must be
        # a dash, lowercase letter, or digit, except the last character, which cannot
        # be a dash.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The logging options for the pipeline run.
        # Corresponds to the JSON property `logging`
        # @return [Google::Apis::GenomicsV1alpha2::LoggingOptions]
        attr_accessor :logging
      
        # Pipeline output arguments; keys are defined in the pipeline
        # documentation.  All output parameters of without default values
        # must be specified.  If parameters with defaults are specified
        # here, the defaults will be overridden.
        # Corresponds to the JSON property `outputs`
        # @return [Hash<String,String>]
        attr_accessor :outputs
      
        # Required. The project in which to run the pipeline. The caller must have
        # WRITER access to all Google Cloud services and resources (e.g. Google
        # Compute Engine) will be used.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The system resources for the pipeline run.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::GenomicsV1alpha2::PipelineResources]
        attr_accessor :resources
      
        # A Google Cloud Service Account.
        # Corresponds to the JSON property `serviceAccount`
        # @return [Google::Apis::GenomicsV1alpha2::ServiceAccount]
        attr_accessor :service_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @inputs = args[:inputs] if args.key?(:inputs)
          @keep_vm_alive_on_failure_duration = args[:keep_vm_alive_on_failure_duration] if args.key?(:keep_vm_alive_on_failure_duration)
          @labels = args[:labels] if args.key?(:labels)
          @logging = args[:logging] if args.key?(:logging)
          @outputs = args[:outputs] if args.key?(:outputs)
          @project_id = args[:project_id] if args.key?(:project_id)
          @resources = args[:resources] if args.key?(:resources)
          @service_account = args[:service_account] if args.key?(:service_account)
        end
      end
      
      # The request to run a pipeline. If `pipelineId` is specified, it
      # refers to a saved pipeline created with CreatePipeline and set as
      # the `pipelineId` of the returned Pipeline object. If
      # `ephemeralPipeline` is specified, that pipeline is run once
      # with the given args and not saved. It is an error to specify both
      # `pipelineId` and `ephemeralPipeline`. `pipelineArgs`
      # must be specified.
      class RunPipelineRequest
        include Google::Apis::Core::Hashable
      
        # The pipeline object. Represents a transformation from a set of input
        # parameters to a set of output parameters. The transformation is defined
        # as a docker image and command to run within that image. Each pipeline
        # is run on a Google Compute Engine VM. A pipeline can be created with the
        # `create` method and then later run with the `run` method, or a pipeline can
        # be defined and run all at once with the `run` method.
        # Corresponds to the JSON property `ephemeralPipeline`
        # @return [Google::Apis::GenomicsV1alpha2::Pipeline]
        attr_accessor :ephemeral_pipeline
      
        # The pipeline run arguments.
        # Corresponds to the JSON property `pipelineArgs`
        # @return [Google::Apis::GenomicsV1alpha2::RunPipelineArgs]
        attr_accessor :pipeline_args
      
        # The already created pipeline to run.
        # Corresponds to the JSON property `pipelineId`
        # @return [String]
        attr_accessor :pipeline_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ephemeral_pipeline = args[:ephemeral_pipeline] if args.key?(:ephemeral_pipeline)
          @pipeline_args = args[:pipeline_args] if args.key?(:pipeline_args)
          @pipeline_id = args[:pipeline_id] if args.key?(:pipeline_id)
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
        # @return [Google::Apis::GenomicsV1alpha2::ComputeEngine]
        attr_accessor :compute_engine
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compute_engine = args[:compute_engine] if args.key?(:compute_engine)
        end
      end
      
      # A Google Cloud Service Account.
      class ServiceAccount
        include Google::Apis::Core::Hashable
      
        # Email address of the service account. Defaults to `default`,
        # which uses the compute service account associated with the project.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # List of scopes to be enabled for this service account on the VM.
        # The following scopes are automatically included:
        # * https://www.googleapis.com/auth/compute
        # * https://www.googleapis.com/auth/devstorage.full_control
        # * https://www.googleapis.com/auth/genomics
        # * https://www.googleapis.com/auth/logging.write
        # * https://www.googleapis.com/auth/monitoring.write
        # Corresponds to the JSON property `scopes`
        # @return [Array<String>]
        attr_accessor :scopes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @scopes = args[:scopes] if args.key?(:scopes)
        end
      end
      
      # Request to set operation status. Should only be used by VMs
      # created by the Pipelines Service and not by end users.
      class SetOperationStatusRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `errorCode`
        # @return [String]
        attr_accessor :error_code
      
        # 
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # 
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # 
        # Corresponds to the JSON property `timestampEvents`
        # @return [Array<Google::Apis::GenomicsV1alpha2::TimestampEvent>]
        attr_accessor :timestamp_events
      
        # 
        # Corresponds to the JSON property `validationToken`
        # @return [Fixnum]
        attr_accessor :validation_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_code = args[:error_code] if args.key?(:error_code)
          @error_message = args[:error_message] if args.key?(:error_message)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @timestamp_events = args[:timestamp_events] if args.key?(:timestamp_events)
          @validation_token = args[:validation_token] if args.key?(:validation_token)
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
      
      # Stores the list of events and times they occured for major events in job
      # execution.
      class TimestampEvent
        include Google::Apis::Core::Hashable
      
        # String indicating the type of event
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The time this event occured.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
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
