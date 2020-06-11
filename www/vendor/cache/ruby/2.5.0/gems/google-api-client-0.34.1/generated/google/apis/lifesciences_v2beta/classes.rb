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
    module LifesciencesV2beta
      
      # Carries information about an accelerator that can be attached to a VM.
      class Accelerator
        include Google::Apis::Core::Hashable
      
        # How many accelerators of this type to attach.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The accelerator type string (for example, "nvidia-tesla-k80").
        # Only NVIDIA GPU accelerators are currently supported. If an NVIDIA GPU is
        # attached, the required runtime libraries will be made available to all
        # containers under `/usr/local/nvidia`. The driver version to install must
        # be specified using the NVIDIA driver version parameter on the virtual
        # machine specification. Note that attaching a GPU increases the worker VM
        # startup time by a few minutes.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Specifies a single action that runs a Docker container.
      class Action
        include Google::Apis::Core::Hashable
      
        # By default, after an action fails, no further actions are run. This flag
        # indicates that this action must be run even if the pipeline has already
        # failed. This is useful for actions that copy output files off of the VM
        # or for debugging. Note that no actions will be run if image prefetching
        # fails.
        # Corresponds to the JSON property `alwaysRun`
        # @return [Boolean]
        attr_accessor :always_run
        alias_method :always_run?, :always_run
      
        # If specified, overrides the `CMD` specified in the container. If the
        # container also has an `ENTRYPOINT` the values are used as entrypoint
        # arguments. Otherwise, they are used as a command and arguments to run
        # inside the container.
        # Corresponds to the JSON property `commands`
        # @return [Array<String>]
        attr_accessor :commands
      
        # An optional name for the container. The container hostname will be set to
        # this name, making it useful for inter-container communication. The name
        # must contain only upper and lowercase alphanumeric characters and hyphens
        # and cannot start with a hyphen.
        # Corresponds to the JSON property `containerName`
        # @return [String]
        attr_accessor :container_name
      
        # Holds encrypted information that is only decrypted and stored in RAM
        # by the worker VM when running the pipeline.
        # Corresponds to the JSON property `credentials`
        # @return [Google::Apis::LifesciencesV2beta::Secret]
        attr_accessor :credentials
      
        # All container images are typically downloaded before any actions are
        # executed. This helps prevent typos in URIs or issues like lack of disk
        # space from wasting large amounts of compute resources.
        # If set, this flag prevents the worker from downloading the image until
        # just before the action is executed.
        # Corresponds to the JSON property `disableImagePrefetch`
        # @return [Boolean]
        attr_accessor :disable_image_prefetch
        alias_method :disable_image_prefetch?, :disable_image_prefetch
      
        # A small portion of the container's standard error stream is typically
        # captured and returned inside the `ContainerStoppedEvent`. Setting this
        # flag disables this functionality.
        # Corresponds to the JSON property `disableStandardErrorCapture`
        # @return [Boolean]
        attr_accessor :disable_standard_error_capture
        alias_method :disable_standard_error_capture?, :disable_standard_error_capture
      
        # Enable access to the FUSE device for this action. Filesystems can then
        # be mounted into disks shared with other actions. The other actions do
        # not need the `enable_fuse` flag to access the mounted filesystem.
        # This has the effect of causing the container to be executed with
        # `CAP_SYS_ADMIN` and exposes `/dev/fuse` to the container, so use it only
        # for containers you trust.
        # Corresponds to the JSON property `enableFuse`
        # @return [Boolean]
        attr_accessor :enable_fuse
        alias_method :enable_fuse?, :enable_fuse
      
        # If specified, overrides the `ENTRYPOINT` specified in the container.
        # Corresponds to the JSON property `entrypoint`
        # @return [String]
        attr_accessor :entrypoint
      
        # The environment to pass into the container. This environment is merged
        # with values specified in the google.cloud.lifesciences.v2beta.Pipeline
        # message, overwriting any duplicate values.
        # In addition to the values passed here, a few other values are
        # automatically injected into the environment. These cannot be hidden or
        # overwritten.
        # `GOOGLE_PIPELINE_FAILED` will be set to "1" if the pipeline failed
        # because an action has exited with a non-zero status (and did not have the
        # `IGNORE_EXIT_STATUS` flag set). This can be used to determine if additional
        # debug or logging actions should execute.
        # `GOOGLE_LAST_EXIT_STATUS` will be set to the exit status of the last
        # non-background action that executed. This can be used by workflow engine
        # authors to determine whether an individual action has succeeded or failed.
        # Corresponds to the JSON property `environment`
        # @return [Hash<String,String>]
        attr_accessor :environment
      
        # Normally, a non-zero exit status causes the pipeline to fail. This flag
        # allows execution of other actions to continue instead.
        # Corresponds to the JSON property `ignoreExitStatus`
        # @return [Boolean]
        attr_accessor :ignore_exit_status
        alias_method :ignore_exit_status?, :ignore_exit_status
      
        # Required. The URI to pull the container image from. Note that all images
        # referenced
        # by actions in the pipeline are pulled before the first action runs. If
        # multiple actions reference the same image, it is only pulled once,
        # ensuring that the same image is used for all actions in a single pipeline.
        # The image URI can be either a complete host and image specification (e.g.,
        # quay.io/biocontainers/samtools), a library and image name (e.g.,
        # google/cloud-sdk) or a bare image name ('bash') to pull from the default
        # library.  No schema is required in any of these cases.
        # If the specified image is not public, the service account specified for
        # the Virtual Machine must have access to pull the images from GCR, or
        # appropriate credentials must be specified in the
        # google.cloud.lifesciences.v2beta.Action.credentials field.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Labels to associate with the action. This field is provided to assist
        # workflow engine authors in identifying actions (for example, to indicate
        # what sort of action they perform, such as localization or debugging).
        # They are returned in the operation metadata, but are otherwise ignored.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # A list of mounts to make available to the action.
        # In addition to the values specified here, every action has a special
        # virtual disk mounted under `/google` that contains log files and other
        # operational components.
        # <ul>
        # <li><code>/google/logs</code> All logs written during the pipeline
        # execution.</li>
        # <li><code>/google/logs/output</code> The combined standard output and
        # standard error of all actions run as part of the pipeline
        # execution.</li>
        # <li><code>/google/logs/action/*/stdout</code> The complete contents of
        # each individual action's standard output.</li>
        # <li><code>/google/logs/action/*/stderr</code> The complete contents of
        # each individual action's standard error output.</li>
        # </ul>
        # Corresponds to the JSON property `mounts`
        # @return [Array<Google::Apis::LifesciencesV2beta::Mount>]
        attr_accessor :mounts
      
        # An optional identifier for a PID namespace to run the action inside.
        # Multiple actions should use the same string to share a namespace.  If
        # unspecified, a separate isolated namespace is used.
        # Corresponds to the JSON property `pidNamespace`
        # @return [String]
        attr_accessor :pid_namespace
      
        # A map of containers to host port mappings for this container. If the
        # container already specifies exposed ports, use the
        # `PUBLISH_EXPOSED_PORTS` flag instead.
        # The host port number must be less than 65536. If it is zero, an unused
        # random port is assigned. To determine the resulting port number, consult
        # the `ContainerStartedEvent` in the operation metadata.
        # Corresponds to the JSON property `portMappings`
        # @return [Hash<String,Fixnum>]
        attr_accessor :port_mappings
      
        # Exposes all ports specified by `EXPOSE` statements in the container. To
        # discover the host side port numbers, consult the `ACTION_STARTED` event
        # in the operation metadata.
        # Corresponds to the JSON property `publishExposedPorts`
        # @return [Boolean]
        attr_accessor :publish_exposed_ports
        alias_method :publish_exposed_ports?, :publish_exposed_ports
      
        # This flag allows an action to continue running in the background while
        # executing subsequent actions. This is useful to provide services to
        # other actions (or to provide debugging support tools like SSH servers).
        # Corresponds to the JSON property `runInBackground`
        # @return [Boolean]
        attr_accessor :run_in_background
        alias_method :run_in_background?, :run_in_background
      
        # The maximum amount of time to give the action to complete. If the action
        # fails to complete before the timeout, it will be terminated and the exit
        # status will be non-zero. The pipeline will continue or terminate based
        # on the rules defined by the `ALWAYS_RUN` and `IGNORE_EXIT_STATUS` flags.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @always_run = args[:always_run] if args.key?(:always_run)
          @commands = args[:commands] if args.key?(:commands)
          @container_name = args[:container_name] if args.key?(:container_name)
          @credentials = args[:credentials] if args.key?(:credentials)
          @disable_image_prefetch = args[:disable_image_prefetch] if args.key?(:disable_image_prefetch)
          @disable_standard_error_capture = args[:disable_standard_error_capture] if args.key?(:disable_standard_error_capture)
          @enable_fuse = args[:enable_fuse] if args.key?(:enable_fuse)
          @entrypoint = args[:entrypoint] if args.key?(:entrypoint)
          @environment = args[:environment] if args.key?(:environment)
          @ignore_exit_status = args[:ignore_exit_status] if args.key?(:ignore_exit_status)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @labels = args[:labels] if args.key?(:labels)
          @mounts = args[:mounts] if args.key?(:mounts)
          @pid_namespace = args[:pid_namespace] if args.key?(:pid_namespace)
          @port_mappings = args[:port_mappings] if args.key?(:port_mappings)
          @publish_exposed_ports = args[:publish_exposed_ports] if args.key?(:publish_exposed_ports)
          @run_in_background = args[:run_in_background] if args.key?(:run_in_background)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
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
      
      # Carries information about a disk that can be attached to a VM.
      # See https://cloud.google.com/compute/docs/disks/performance for more
      # information about disk type, size, and performance considerations.
      class Disk
        include Google::Apis::Core::Hashable
      
        # A user-supplied name for the disk. Used when mounting the disk into
        # actions. The name must contain only upper and lowercase alphanumeric
        # characters and hyphens and cannot start with a hyphen.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The size, in GB, of the disk to attach. If the size is not
        # specified, a default is chosen to ensure reasonable I/O performance.
        # If the disk type is specified as `local-ssd`, multiple local drives are
        # automatically combined to provide the requested size. Note, however, that
        # each physical SSD is 375GB in size, and no more than 8 drives can be
        # attached to a single instance.
        # Corresponds to the JSON property `sizeGb`
        # @return [Fixnum]
        attr_accessor :size_gb
      
        # An optional image to put on the disk before attaching it to the VM.
        # Corresponds to the JSON property `sourceImage`
        # @return [String]
        attr_accessor :source_image
      
        # The Compute Engine disk type. If unspecified, `pd-standard` is used.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @size_gb = args[:size_gb] if args.key?(:size_gb)
          @source_image = args[:source_image] if args.key?(:source_image)
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
      
      # Carries information about events that occur during pipeline execution.
      class Event
        include Google::Apis::Core::Hashable
      
        # An event generated when a container is forcibly terminated by the
        # worker. Currently, this only occurs when the container outlives the
        # timeout specified by the user.
        # Corresponds to the JSON property `containerKilled`
        # @return [Google::Apis::LifesciencesV2beta::ContainerKilledEvent]
        attr_accessor :container_killed
      
        # An event generated when a container starts.
        # Corresponds to the JSON property `containerStarted`
        # @return [Google::Apis::LifesciencesV2beta::ContainerStartedEvent]
        attr_accessor :container_started
      
        # An event generated when a container exits.
        # Corresponds to the JSON property `containerStopped`
        # @return [Google::Apis::LifesciencesV2beta::ContainerStoppedEvent]
        attr_accessor :container_stopped
      
        # An event generated whenever a resource limitation or transient error
        # delays execution of a pipeline that was otherwise ready to run.
        # Corresponds to the JSON property `delayed`
        # @return [Google::Apis::LifesciencesV2beta::DelayedEvent]
        attr_accessor :delayed
      
        # A human-readable description of the event. Note that these strings can
        # change at any time without notice. Any application logic must use the
        # information in the `details` field.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # An event generated when the execution of a pipeline has failed. Note
        # that other events can continue to occur after this event.
        # Corresponds to the JSON property `failed`
        # @return [Google::Apis::LifesciencesV2beta::FailedEvent]
        attr_accessor :failed
      
        # An event generated when the worker starts pulling an image.
        # Corresponds to the JSON property `pullStarted`
        # @return [Google::Apis::LifesciencesV2beta::PullStartedEvent]
        attr_accessor :pull_started
      
        # An event generated when the worker stops pulling an image.
        # Corresponds to the JSON property `pullStopped`
        # @return [Google::Apis::LifesciencesV2beta::PullStoppedEvent]
        attr_accessor :pull_stopped
      
        # The time at which the event occurred.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # An event generated when the execution of a container results in a
        # non-zero exit status that was not otherwise ignored. Execution will
        # continue, but only actions that are flagged as `ALWAYS_RUN` will be
        # executed. Other actions will be skipped.
        # Corresponds to the JSON property `unexpectedExitStatus`
        # @return [Google::Apis::LifesciencesV2beta::UnexpectedExitStatusEvent]
        attr_accessor :unexpected_exit_status
      
        # An event generated after a worker VM has been assigned to run the
        # pipeline.
        # Corresponds to the JSON property `workerAssigned`
        # @return [Google::Apis::LifesciencesV2beta::WorkerAssignedEvent]
        attr_accessor :worker_assigned
      
        # An event generated when the worker VM that was assigned to the pipeline
        # has been released (deleted).
        # Corresponds to the JSON property `workerReleased`
        # @return [Google::Apis::LifesciencesV2beta::WorkerReleasedEvent]
        attr_accessor :worker_released
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_killed = args[:container_killed] if args.key?(:container_killed)
          @container_started = args[:container_started] if args.key?(:container_started)
          @container_stopped = args[:container_stopped] if args.key?(:container_stopped)
          @delayed = args[:delayed] if args.key?(:delayed)
          @description = args[:description] if args.key?(:description)
          @failed = args[:failed] if args.key?(:failed)
          @pull_started = args[:pull_started] if args.key?(:pull_started)
          @pull_stopped = args[:pull_stopped] if args.key?(:pull_stopped)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @unexpected_exit_status = args[:unexpected_exit_status] if args.key?(:unexpected_exit_status)
          @worker_assigned = args[:worker_assigned] if args.key?(:worker_assigned)
          @worker_released = args[:worker_released] if args.key?(:worker_released)
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
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::LifesciencesV2beta::Location>]
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
        # @return [Array<Google::Apis::LifesciencesV2beta::Operation>]
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
      
      # Carries information about the pipeline execution that is returned
      # in the long running operation's metadata field.
      class Metadata
        include Google::Apis::Core::Hashable
      
        # The time at which the operation was created by the API.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The time at which execution was completed and resources were cleaned up.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The list of events that have happened so far during the execution of this
        # operation.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::LifesciencesV2beta::Event>]
        attr_accessor :events
      
        # The user-defined labels associated with this operation.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Specifies a series of actions to execute, expressed as Docker containers.
        # Corresponds to the JSON property `pipeline`
        # @return [Google::Apis::LifesciencesV2beta::Pipeline]
        attr_accessor :pipeline
      
        # The first time at which resources were allocated to execute the pipeline.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @events = args[:events] if args.key?(:events)
          @labels = args[:labels] if args.key?(:labels)
          @pipeline = args[:pipeline] if args.key?(:pipeline)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Carries information about a particular disk mount inside a container.
      class Mount
        include Google::Apis::Core::Hashable
      
        # The name of the disk to mount, as specified in the resources section.
        # Corresponds to the JSON property `disk`
        # @return [String]
        attr_accessor :disk
      
        # The path to mount the disk inside the container.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # If true, the disk is mounted read-only inside the container.
        # Corresponds to the JSON property `readOnly`
        # @return [Boolean]
        attr_accessor :read_only
        alias_method :read_only?, :read_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk = args[:disk] if args.key?(:disk)
          @path = args[:path] if args.key?(:path)
          @read_only = args[:read_only] if args.key?(:read_only)
        end
      end
      
      # VM networking options.
      class Network
        include Google::Apis::Core::Hashable
      
        # The network name to attach the VM's network interface to. The value will
        # be prefixed with `global/networks/` unless it contains a `/`, in which
        # case it is assumed to be a fully specified network resource URL.
        # If unspecified, the global default network is used.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # If the specified network is configured for custom subnet creation, the
        # name of the subnetwork to attach the instance to must be specified here.
        # The value is prefixed with `regions/*/subnetworks/` unless it contains a
        # `/`, in which case it is assumed to be a fully specified subnetwork
        # resource URL.
        # If the `*` character appears in the value, it is replaced with the region
        # that the virtual machine has been allocated in.
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        # If set to true, do not attach a public IP address to the VM. Note that
        # without a public IP address, additional configuration is required to
        # allow the VM to access Google services.
        # See https://cloud.google.com/vpc/docs/configure-private-google-access
        # for more information.
        # Corresponds to the JSON property `usePrivateAddress`
        # @return [Boolean]
        attr_accessor :use_private_address
        alias_method :use_private_address?, :use_private_address
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @network = args[:network] if args.key?(:network)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
          @use_private_address = args[:use_private_address] if args.key?(:use_private_address)
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
        # @return [Google::Apis::LifesciencesV2beta::Status]
        attr_accessor :error
      
        # An Metadata object. This will always be returned with the Operation.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name for the operation.  This may be passed to the other
        # operation methods to retrieve information about the operation's status.
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
      
      # Specifies a series of actions to execute, expressed as Docker containers.
      class Pipeline
        include Google::Apis::Core::Hashable
      
        # The list of actions to execute, in the order they are specified.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::LifesciencesV2beta::Action>]
        attr_accessor :actions
      
        # The environment to pass into every action. Each action can also specify
        # additional environment variables but cannot delete an entry from this map
        # (though they can overwrite it with a different value).
        # Corresponds to the JSON property `environment`
        # @return [Hash<String,String>]
        attr_accessor :environment
      
        # The system resources for the pipeline run.
        # At least one zone or region must be specified or the pipeline run will fail.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::LifesciencesV2beta::Resources]
        attr_accessor :resources
      
        # The maximum amount of time to give the pipeline to complete.  This includes
        # the time spent waiting for a worker to be allocated.  If the pipeline fails
        # to complete before the timeout, it will be cancelled and the error code
        # will be set to DEADLINE_EXCEEDED.
        # If unspecified, it will default to 7 days.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @environment = args[:environment] if args.key?(:environment)
          @resources = args[:resources] if args.key?(:resources)
          @timeout = args[:timeout] if args.key?(:timeout)
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
      
      # The system resources for the pipeline run.
      # At least one zone or region must be specified or the pipeline run will fail.
      class Resources
        include Google::Apis::Core::Hashable
      
        # The list of regions allowed for VM allocation. If set, the `zones` field
        # must not be set.
        # Corresponds to the JSON property `regions`
        # @return [Array<String>]
        attr_accessor :regions
      
        # Carries information about a Compute Engine VM resource.
        # Corresponds to the JSON property `virtualMachine`
        # @return [Google::Apis::LifesciencesV2beta::VirtualMachine]
        attr_accessor :virtual_machine
      
        # The list of zones allowed for VM allocation. If set, the `regions` field
        # must not be set.
        # Corresponds to the JSON property `zones`
        # @return [Array<String>]
        attr_accessor :zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @regions = args[:regions] if args.key?(:regions)
          @virtual_machine = args[:virtual_machine] if args.key?(:virtual_machine)
          @zones = args[:zones] if args.key?(:zones)
        end
      end
      
      # The arguments to the `RunPipeline` method. The requesting user must have
      # the `iam.serviceAccounts.actAs` permission for the Cloud Life Sciences
      # service account or the request will fail.
      class RunPipelineRequest
        include Google::Apis::Core::Hashable
      
        # User-defined labels to associate with the returned operation. These
        # labels are not propagated to any Google Cloud Platform resources used by
        # the operation, and can be modified at any time.
        # To associate labels with resources created while executing the operation,
        # see the appropriate resource message (for example, `VirtualMachine`).
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Specifies a series of actions to execute, expressed as Docker containers.
        # Corresponds to the JSON property `pipeline`
        # @return [Google::Apis::LifesciencesV2beta::Pipeline]
        attr_accessor :pipeline
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @pipeline = args[:pipeline] if args.key?(:pipeline)
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
      
      # Holds encrypted information that is only decrypted and stored in RAM
      # by the worker VM when running the pipeline.
      class Secret
        include Google::Apis::Core::Hashable
      
        # The value of the cipherText response from the `encrypt` method. This field
        # is intentionally unaudited.
        # Corresponds to the JSON property `cipherText`
        # @return [String]
        attr_accessor :cipher_text
      
        # The name of the Cloud KMS key that will be used to decrypt the secret
        # value. The VM service account must have the required permissions and
        # authentication scopes to invoke the `decrypt` method on the specified key.
        # Corresponds to the JSON property `keyName`
        # @return [String]
        attr_accessor :key_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cipher_text = args[:cipher_text] if args.key?(:cipher_text)
          @key_name = args[:key_name] if args.key?(:key_name)
        end
      end
      
      # Carries information about a Google Cloud service account.
      class ServiceAccount
        include Google::Apis::Core::Hashable
      
        # Email address of the service account. If not specified, the default
        # Compute Engine service account for the project will be used.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # List of scopes to be enabled for this service account on the VM, in
        # addition to the cloud-platform API scope that will be added by default.
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
      
      # Carries information about a Compute Engine VM resource.
      class VirtualMachine
        include Google::Apis::Core::Hashable
      
        # The list of accelerators to attach to the VM.
        # Corresponds to the JSON property `accelerators`
        # @return [Array<Google::Apis::LifesciencesV2beta::Accelerator>]
        attr_accessor :accelerators
      
        # The size of the boot disk, in GB. The boot disk must be large
        # enough to accommodate all of the Docker images from each action in the
        # pipeline at the same time. If not specified, a small but reasonable
        # default value is used.
        # Corresponds to the JSON property `bootDiskSizeGb`
        # @return [Fixnum]
        attr_accessor :boot_disk_size_gb
      
        # The host operating system image to use.
        # Currently, only Container-Optimized OS images can be used.
        # The default value is `projects/cos-cloud/global/images/family/cos-stable`,
        # which selects the latest stable release of Container-Optimized OS.
        # This option is provided to allow testing against the beta release of the
        # operating system to ensure that the new version does not interact
        # negatively with production pipelines.
        # To test a pipeline against the beta release of Container-Optimized OS,
        # use the value `projects/cos-cloud/global/images/family/cos-beta`.
        # Corresponds to the JSON property `bootImage`
        # @return [String]
        attr_accessor :boot_image
      
        # The CPU platform to request. An instance based on a newer platform can be
        # allocated, but never one with fewer capabilities. The value of this
        # parameter must be a valid Compute Engine CPU platform name (such as "Intel
        # Skylake"). This parameter is only useful for carefully optimized work
        # loads where the CPU platform has a significant impact.
        # For more information about the effect of this parameter, see
        # https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform.
        # Corresponds to the JSON property `cpuPlatform`
        # @return [String]
        attr_accessor :cpu_platform
      
        # The list of disks to create and attach to the VM.
        # Corresponds to the JSON property `disks`
        # @return [Array<Google::Apis::LifesciencesV2beta::Disk>]
        attr_accessor :disks
      
        # Whether Stackdriver monitoring should be enabled on the VM.
        # Corresponds to the JSON property `enableStackdriverMonitoring`
        # @return [Boolean]
        attr_accessor :enable_stackdriver_monitoring
        alias_method :enable_stackdriver_monitoring?, :enable_stackdriver_monitoring
      
        # Optional set of labels to apply to the VM and any attached disk resources.
        # These labels must adhere to the [name and value
        # restrictions](https://cloud.google.com/compute/docs/labeling-resources) on
        # VM labels imposed by Compute Engine.
        # Labels keys with the prefix 'google-' are reserved for use by Google.
        # Labels applied at creation time to the VM. Applied on a best-effort basis
        # to attached disk resources shortly after VM creation.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The machine type of the virtual machine to create. Must be the short
        # name
        # of a standard machine type (such as "n1-standard-1") or a custom machine
        # type (such as "custom-1-4096", where "1" indicates the number of vCPUs and
        # "4096" indicates the memory in MB). See
        # [Creating an instance with a custom machine
        # type](https://cloud.google.com/compute/docs/instances/creating-instance-with-
        # custom-machine-type#create)
        # for more specifications on creating a custom machine type.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # VM networking options.
        # Corresponds to the JSON property `network`
        # @return [Google::Apis::LifesciencesV2beta::Network]
        attr_accessor :network
      
        # The NVIDIA driver version to use when attaching an NVIDIA GPU accelerator.
        # The version specified here must be compatible with the GPU libraries
        # contained in the container being executed, and must be one of the drivers
        # hosted in the `nvidia-drivers-us-public` bucket on Google Cloud Storage.
        # Corresponds to the JSON property `nvidiaDriverVersion`
        # @return [String]
        attr_accessor :nvidia_driver_version
      
        # If true, allocate a preemptible VM.
        # Corresponds to the JSON property `preemptible`
        # @return [Boolean]
        attr_accessor :preemptible
        alias_method :preemptible?, :preemptible
      
        # Carries information about a Google Cloud service account.
        # Corresponds to the JSON property `serviceAccount`
        # @return [Google::Apis::LifesciencesV2beta::ServiceAccount]
        attr_accessor :service_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerators = args[:accelerators] if args.key?(:accelerators)
          @boot_disk_size_gb = args[:boot_disk_size_gb] if args.key?(:boot_disk_size_gb)
          @boot_image = args[:boot_image] if args.key?(:boot_image)
          @cpu_platform = args[:cpu_platform] if args.key?(:cpu_platform)
          @disks = args[:disks] if args.key?(:disks)
          @enable_stackdriver_monitoring = args[:enable_stackdriver_monitoring] if args.key?(:enable_stackdriver_monitoring)
          @labels = args[:labels] if args.key?(:labels)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @network = args[:network] if args.key?(:network)
          @nvidia_driver_version = args[:nvidia_driver_version] if args.key?(:nvidia_driver_version)
          @preemptible = args[:preemptible] if args.key?(:preemptible)
          @service_account = args[:service_account] if args.key?(:service_account)
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
