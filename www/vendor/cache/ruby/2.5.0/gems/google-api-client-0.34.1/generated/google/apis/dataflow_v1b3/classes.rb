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
    module DataflowV1b3
      
      # Obsolete in favor of ApproximateReportedProgress and ApproximateSplitRequest.
      class ApproximateProgress
        include Google::Apis::Core::Hashable
      
        # Obsolete.
        # Corresponds to the JSON property `percentComplete`
        # @return [Float]
        attr_accessor :percent_complete
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :position
      
        # Obsolete.
        # Corresponds to the JSON property `remainingTime`
        # @return [String]
        attr_accessor :remaining_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @percent_complete = args[:percent_complete] if args.key?(:percent_complete)
          @position = args[:position] if args.key?(:position)
          @remaining_time = args[:remaining_time] if args.key?(:remaining_time)
        end
      end
      
      # A progress measurement of a WorkItem by a worker.
      class ApproximateReportedProgress
        include Google::Apis::Core::Hashable
      
        # Represents the level of parallelism in a WorkItem's input,
        # reported by the worker.
        # Corresponds to the JSON property `consumedParallelism`
        # @return [Google::Apis::DataflowV1b3::ReportedParallelism]
        attr_accessor :consumed_parallelism
      
        # Completion as fraction of the input consumed, from 0.0 (beginning, nothing
        # consumed), to 1.0 (end of the input, entire input consumed).
        # Corresponds to the JSON property `fractionConsumed`
        # @return [Float]
        attr_accessor :fraction_consumed
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :position
      
        # Represents the level of parallelism in a WorkItem's input,
        # reported by the worker.
        # Corresponds to the JSON property `remainingParallelism`
        # @return [Google::Apis::DataflowV1b3::ReportedParallelism]
        attr_accessor :remaining_parallelism
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumed_parallelism = args[:consumed_parallelism] if args.key?(:consumed_parallelism)
          @fraction_consumed = args[:fraction_consumed] if args.key?(:fraction_consumed)
          @position = args[:position] if args.key?(:position)
          @remaining_parallelism = args[:remaining_parallelism] if args.key?(:remaining_parallelism)
        end
      end
      
      # A suggestion by the service to the worker to dynamically split the WorkItem.
      class ApproximateSplitRequest
        include Google::Apis::Core::Hashable
      
        # A fraction at which to split the work item, from 0.0 (beginning of the
        # input) to 1.0 (end of the input).
        # Corresponds to the JSON property `fractionConsumed`
        # @return [Float]
        attr_accessor :fraction_consumed
      
        # The fraction of the remainder of work to split the work item at, from 0.0
        # (split at the current position) to 1.0 (end of the input).
        # Corresponds to the JSON property `fractionOfRemainder`
        # @return [Float]
        attr_accessor :fraction_of_remainder
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fraction_consumed = args[:fraction_consumed] if args.key?(:fraction_consumed)
          @fraction_of_remainder = args[:fraction_of_remainder] if args.key?(:fraction_of_remainder)
          @position = args[:position] if args.key?(:position)
        end
      end
      
      # A structured message reporting an autoscaling decision made by the Dataflow
      # service.
      class AutoscalingEvent
        include Google::Apis::Core::Hashable
      
        # The current number of workers the job has.
        # Corresponds to the JSON property `currentNumWorkers`
        # @return [Fixnum]
        attr_accessor :current_num_workers
      
        # A rich message format, including a human readable string, a key for
        # identifying the message, and structured data associated with the message for
        # programmatic consumption.
        # Corresponds to the JSON property `description`
        # @return [Google::Apis::DataflowV1b3::StructuredMessage]
        attr_accessor :description
      
        # The type of autoscaling event to report.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        # The target number of workers the worker pool wants to resize to use.
        # Corresponds to the JSON property `targetNumWorkers`
        # @return [Fixnum]
        attr_accessor :target_num_workers
      
        # The time this event was emitted to indicate a new target or current
        # num_workers value.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        # A short and friendly name for the worker pool this event refers to,
        # populated from the value of PoolStageRelation::user_pool_name.
        # Corresponds to the JSON property `workerPool`
        # @return [String]
        attr_accessor :worker_pool
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_num_workers = args[:current_num_workers] if args.key?(:current_num_workers)
          @description = args[:description] if args.key?(:description)
          @event_type = args[:event_type] if args.key?(:event_type)
          @target_num_workers = args[:target_num_workers] if args.key?(:target_num_workers)
          @time = args[:time] if args.key?(:time)
          @worker_pool = args[:worker_pool] if args.key?(:worker_pool)
        end
      end
      
      # Settings for WorkerPool autoscaling.
      class AutoscalingSettings
        include Google::Apis::Core::Hashable
      
        # The algorithm to use for autoscaling.
        # Corresponds to the JSON property `algorithm`
        # @return [String]
        attr_accessor :algorithm
      
        # The maximum number of workers to cap scaling at.
        # Corresponds to the JSON property `maxNumWorkers`
        # @return [Fixnum]
        attr_accessor :max_num_workers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @algorithm = args[:algorithm] if args.key?(:algorithm)
          @max_num_workers = args[:max_num_workers] if args.key?(:max_num_workers)
        end
      end
      
      # Metadata for a BigQuery connector used by the job.
      class BigQueryIoDetails
        include Google::Apis::Core::Hashable
      
        # Dataset accessed in the connection.
        # Corresponds to the JSON property `dataset`
        # @return [String]
        attr_accessor :dataset
      
        # Project accessed in the connection.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Query used to access data in the connection.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Table accessed in the connection.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset = args[:dataset] if args.key?(:dataset)
          @project_id = args[:project_id] if args.key?(:project_id)
          @query = args[:query] if args.key?(:query)
          @table = args[:table] if args.key?(:table)
        end
      end
      
      # Metadata for a BigTable connector used by the job.
      class BigTableIoDetails
        include Google::Apis::Core::Hashable
      
        # InstanceId accessed in the connection.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # ProjectId accessed in the connection.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # TableId accessed in the connection.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Modeled after information exposed by /proc/stat.
      class CpuTime
        include Google::Apis::Core::Hashable
      
        # Average CPU utilization rate (% non-idle cpu / second) since previous
        # sample.
        # Corresponds to the JSON property `rate`
        # @return [Float]
        attr_accessor :rate
      
        # Timestamp of the measurement.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Total active CPU time across all cores (ie., non-idle) in milliseconds
        # since start-up.
        # Corresponds to the JSON property `totalMs`
        # @return [Fixnum]
        attr_accessor :total_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rate = args[:rate] if args.key?(:rate)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @total_ms = args[:total_ms] if args.key?(:total_ms)
        end
      end
      
      # Description of an interstitial value between transforms in an execution
      # stage.
      class ComponentSource
        include Google::Apis::Core::Hashable
      
        # Dataflow service generated name for this source.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User name for the original user transform or collection with which this
        # source is most closely associated.
        # Corresponds to the JSON property `originalTransformOrCollection`
        # @return [String]
        attr_accessor :original_transform_or_collection
      
        # Human-readable name for this transform; may be user or system generated.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @original_transform_or_collection = args[:original_transform_or_collection] if args.key?(:original_transform_or_collection)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # Description of a transform executed as part of an execution stage.
      class ComponentTransform
        include Google::Apis::Core::Hashable
      
        # Dataflow service generated name for this source.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User name for the original user transform with which this transform is
        # most closely associated.
        # Corresponds to the JSON property `originalTransform`
        # @return [String]
        attr_accessor :original_transform
      
        # Human-readable name for this transform; may be user or system generated.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @original_transform = args[:original_transform] if args.key?(:original_transform)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # All configuration data for a particular Computation.
      class ComputationTopology
        include Google::Apis::Core::Hashable
      
        # The ID of the computation.
        # Corresponds to the JSON property `computationId`
        # @return [String]
        attr_accessor :computation_id
      
        # The inputs to the computation.
        # Corresponds to the JSON property `inputs`
        # @return [Array<Google::Apis::DataflowV1b3::StreamLocation>]
        attr_accessor :inputs
      
        # The key ranges processed by the computation.
        # Corresponds to the JSON property `keyRanges`
        # @return [Array<Google::Apis::DataflowV1b3::KeyRangeLocation>]
        attr_accessor :key_ranges
      
        # The outputs from the computation.
        # Corresponds to the JSON property `outputs`
        # @return [Array<Google::Apis::DataflowV1b3::StreamLocation>]
        attr_accessor :outputs
      
        # The state family values.
        # Corresponds to the JSON property `stateFamilies`
        # @return [Array<Google::Apis::DataflowV1b3::StateFamilyConfig>]
        attr_accessor :state_families
      
        # The system stage name.
        # Corresponds to the JSON property `systemStageName`
        # @return [String]
        attr_accessor :system_stage_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computation_id = args[:computation_id] if args.key?(:computation_id)
          @inputs = args[:inputs] if args.key?(:inputs)
          @key_ranges = args[:key_ranges] if args.key?(:key_ranges)
          @outputs = args[:outputs] if args.key?(:outputs)
          @state_families = args[:state_families] if args.key?(:state_families)
          @system_stage_name = args[:system_stage_name] if args.key?(:system_stage_name)
        end
      end
      
      # A position that encapsulates an inner position and an index for the inner
      # position. A ConcatPosition can be used by a reader of a source that
      # encapsulates a set of other sources.
      class ConcatPosition
        include Google::Apis::Core::Hashable
      
        # Index of the inner source.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index = args[:index] if args.key?(:index)
          @position = args[:position] if args.key?(:position)
        end
      end
      
      # CounterMetadata includes all static non-name non-value counter attributes.
      class CounterMetadata
        include Google::Apis::Core::Hashable
      
        # Human-readable description of the counter semantics.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Counter aggregation kind.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A string referring to the unit type.
        # Corresponds to the JSON property `otherUnits`
        # @return [String]
        attr_accessor :other_units
      
        # System defined Units, see above enum.
        # Corresponds to the JSON property `standardUnits`
        # @return [String]
        attr_accessor :standard_units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @kind = args[:kind] if args.key?(:kind)
          @other_units = args[:other_units] if args.key?(:other_units)
          @standard_units = args[:standard_units] if args.key?(:standard_units)
        end
      end
      
      # Identifies a counter within a per-job namespace. Counters whose structured
      # names are the same get merged into a single value for the job.
      class CounterStructuredName
        include Google::Apis::Core::Hashable
      
        # Name of the optimized step being executed by the workers.
        # Corresponds to the JSON property `componentStepName`
        # @return [String]
        attr_accessor :component_step_name
      
        # Name of the stage. An execution step contains multiple component steps.
        # Corresponds to the JSON property `executionStepName`
        # @return [String]
        attr_accessor :execution_step_name
      
        # Index of an input collection that's being read from/written to as a side
        # input.
        # The index identifies a step's side inputs starting by 1 (e.g. the first
        # side input has input_index 1, the third has input_index 3).
        # Side inputs are identified by a pair of (original_step_name, input_index).
        # This field helps uniquely identify them.
        # Corresponds to the JSON property `inputIndex`
        # @return [Fixnum]
        attr_accessor :input_index
      
        # Counter name. Not necessarily globally-unique, but unique within the
        # context of the other fields.
        # Required.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # One of the standard Origins defined above.
        # Corresponds to the JSON property `origin`
        # @return [String]
        attr_accessor :origin
      
        # A string containing a more specific namespace of the counter's origin.
        # Corresponds to the JSON property `originNamespace`
        # @return [String]
        attr_accessor :origin_namespace
      
        # The step name requesting an operation, such as GBK.
        # I.e. the ParDo causing a read/write from shuffle to occur, or a
        # read from side inputs.
        # Corresponds to the JSON property `originalRequestingStepName`
        # @return [String]
        attr_accessor :original_requesting_step_name
      
        # System generated name of the original step in the user's graph, before
        # optimization.
        # Corresponds to the JSON property `originalStepName`
        # @return [String]
        attr_accessor :original_step_name
      
        # Portion of this counter, either key or value.
        # Corresponds to the JSON property `portion`
        # @return [String]
        attr_accessor :portion
      
        # ID of a particular worker.
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @component_step_name = args[:component_step_name] if args.key?(:component_step_name)
          @execution_step_name = args[:execution_step_name] if args.key?(:execution_step_name)
          @input_index = args[:input_index] if args.key?(:input_index)
          @name = args[:name] if args.key?(:name)
          @origin = args[:origin] if args.key?(:origin)
          @origin_namespace = args[:origin_namespace] if args.key?(:origin_namespace)
          @original_requesting_step_name = args[:original_requesting_step_name] if args.key?(:original_requesting_step_name)
          @original_step_name = args[:original_step_name] if args.key?(:original_step_name)
          @portion = args[:portion] if args.key?(:portion)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # A single message which encapsulates structured name and metadata for a given
      # counter.
      class CounterStructuredNameAndMetadata
        include Google::Apis::Core::Hashable
      
        # CounterMetadata includes all static non-name non-value counter attributes.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::DataflowV1b3::CounterMetadata]
        attr_accessor :metadata
      
        # Identifies a counter within a per-job namespace. Counters whose structured
        # names are the same get merged into a single value for the job.
        # Corresponds to the JSON property `name`
        # @return [Google::Apis::DataflowV1b3::CounterStructuredName]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An update to a Counter sent from a worker.
      class CounterUpdate
        include Google::Apis::Core::Hashable
      
        # Boolean value for And, Or.
        # Corresponds to the JSON property `boolean`
        # @return [Boolean]
        attr_accessor :boolean
        alias_method :boolean?, :boolean
      
        # True if this counter is reported as the total cumulative aggregate
        # value accumulated since the worker started working on this WorkItem.
        # By default this is false, indicating that this counter is reported
        # as a delta.
        # Corresponds to the JSON property `cumulative`
        # @return [Boolean]
        attr_accessor :cumulative
        alias_method :cumulative?, :cumulative
      
        # A metric value representing a distribution.
        # Corresponds to the JSON property `distribution`
        # @return [Google::Apis::DataflowV1b3::DistributionUpdate]
        attr_accessor :distribution
      
        # Floating point value for Sum, Max, Min.
        # Corresponds to the JSON property `floatingPoint`
        # @return [Float]
        attr_accessor :floating_point
      
        # A metric value representing a list of floating point numbers.
        # Corresponds to the JSON property `floatingPointList`
        # @return [Google::Apis::DataflowV1b3::FloatingPointList]
        attr_accessor :floating_point_list
      
        # A representation of a floating point mean metric contribution.
        # Corresponds to the JSON property `floatingPointMean`
        # @return [Google::Apis::DataflowV1b3::FloatingPointMean]
        attr_accessor :floating_point_mean
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `integer`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :integer
      
        # A metric value representing temporal values of a variable.
        # Corresponds to the JSON property `integerGauge`
        # @return [Google::Apis::DataflowV1b3::IntegerGauge]
        attr_accessor :integer_gauge
      
        # A metric value representing a list of integers.
        # Corresponds to the JSON property `integerList`
        # @return [Google::Apis::DataflowV1b3::IntegerList]
        attr_accessor :integer_list
      
        # A representation of an integer mean metric contribution.
        # Corresponds to the JSON property `integerMean`
        # @return [Google::Apis::DataflowV1b3::IntegerMean]
        attr_accessor :integer_mean
      
        # Value for internally-defined counters used by the Dataflow service.
        # Corresponds to the JSON property `internal`
        # @return [Object]
        attr_accessor :internal
      
        # Basic metadata about a counter.
        # Corresponds to the JSON property `nameAndKind`
        # @return [Google::Apis::DataflowV1b3::NameAndKind]
        attr_accessor :name_and_kind
      
        # The service-generated short identifier for this counter.
        # The short_id -> (name, metadata) mapping is constant for the lifetime of
        # a job.
        # Corresponds to the JSON property `shortId`
        # @return [Fixnum]
        attr_accessor :short_id
      
        # A metric value representing a list of strings.
        # Corresponds to the JSON property `stringList`
        # @return [Google::Apis::DataflowV1b3::StringList]
        attr_accessor :string_list
      
        # A single message which encapsulates structured name and metadata for a given
        # counter.
        # Corresponds to the JSON property `structuredNameAndMetadata`
        # @return [Google::Apis::DataflowV1b3::CounterStructuredNameAndMetadata]
        attr_accessor :structured_name_and_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean = args[:boolean] if args.key?(:boolean)
          @cumulative = args[:cumulative] if args.key?(:cumulative)
          @distribution = args[:distribution] if args.key?(:distribution)
          @floating_point = args[:floating_point] if args.key?(:floating_point)
          @floating_point_list = args[:floating_point_list] if args.key?(:floating_point_list)
          @floating_point_mean = args[:floating_point_mean] if args.key?(:floating_point_mean)
          @integer = args[:integer] if args.key?(:integer)
          @integer_gauge = args[:integer_gauge] if args.key?(:integer_gauge)
          @integer_list = args[:integer_list] if args.key?(:integer_list)
          @integer_mean = args[:integer_mean] if args.key?(:integer_mean)
          @internal = args[:internal] if args.key?(:internal)
          @name_and_kind = args[:name_and_kind] if args.key?(:name_and_kind)
          @short_id = args[:short_id] if args.key?(:short_id)
          @string_list = args[:string_list] if args.key?(:string_list)
          @structured_name_and_metadata = args[:structured_name_and_metadata] if args.key?(:structured_name_and_metadata)
        end
      end
      
      # A request to create a Cloud Dataflow job from a template.
      class CreateJobFromTemplateRequest
        include Google::Apis::Core::Hashable
      
        # The environment values to set at runtime.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::DataflowV1b3::RuntimeEnvironment]
        attr_accessor :environment
      
        # Required. A Cloud Storage path to the template from which to
        # create the job.
        # Must be a valid Cloud Storage URL, beginning with `gs://`.
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        # Required. The job name to use for the created job.
        # Corresponds to the JSON property `jobName`
        # @return [String]
        attr_accessor :job_name
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) to
        # which to direct the request.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The runtime parameters to pass to the job.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,String>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
          @job_name = args[:job_name] if args.key?(:job_name)
          @location = args[:location] if args.key?(:location)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # Identifies the location of a custom souce.
      class CustomSourceLocation
        include Google::Apis::Core::Hashable
      
        # Whether this source is stateful.
        # Corresponds to the JSON property `stateful`
        # @return [Boolean]
        attr_accessor :stateful
        alias_method :stateful?, :stateful
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stateful = args[:stateful] if args.key?(:stateful)
        end
      end
      
      # Data disk assignment for a given VM instance.
      class DataDiskAssignment
        include Google::Apis::Core::Hashable
      
        # Mounted data disks. The order is important a data disk's 0-based index in
        # this list defines which persistent directory the disk is mounted to, for
        # example the list of ` "myproject-1014-104817-4c2-harness-0-disk-0" `,
        # ` "myproject-1014-104817-4c2-harness-0-disk-1" `.
        # Corresponds to the JSON property `dataDisks`
        # @return [Array<String>]
        attr_accessor :data_disks
      
        # VM instance name the data disks mounted to, for example
        # "myproject-1014-104817-4c2-harness-0".
        # Corresponds to the JSON property `vmInstance`
        # @return [String]
        attr_accessor :vm_instance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_disks = args[:data_disks] if args.key?(:data_disks)
          @vm_instance = args[:vm_instance] if args.key?(:vm_instance)
        end
      end
      
      # Metadata for a Datastore connector used by the job.
      class DatastoreIoDetails
        include Google::Apis::Core::Hashable
      
        # Namespace used in the connection.
        # Corresponds to the JSON property `namespace`
        # @return [String]
        attr_accessor :namespace
      
        # ProjectId accessed in the connection.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespace = args[:namespace] if args.key?(:namespace)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Specification of one of the bundles produced as a result of splitting
      # a Source (e.g. when executing a SourceSplitRequest, or when
      # splitting an active task using WorkItemStatus.dynamic_source_split),
      # relative to the source being split.
      class DerivedSource
        include Google::Apis::Core::Hashable
      
        # What source to base the produced source on (if any).
        # Corresponds to the JSON property `derivationMode`
        # @return [String]
        attr_accessor :derivation_mode
      
        # A source that records can be read and decoded from.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::DataflowV1b3::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @derivation_mode = args[:derivation_mode] if args.key?(:derivation_mode)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Describes the data disk used by a workflow job.
      class Disk
        include Google::Apis::Core::Hashable
      
        # Disk storage type, as defined by Google Compute Engine.  This
        # must be a disk type appropriate to the project and zone in which
        # the workers will run.  If unknown or unspecified, the service
        # will attempt to choose a reasonable default.
        # For example, the standard persistent disk type is a resource name
        # typically ending in "pd-standard".  If SSD persistent disks are
        # available, the resource name typically ends with "pd-ssd".  The
        # actual valid values are defined the Google Compute Engine API,
        # not by the Cloud Dataflow API; consult the Google Compute Engine
        # documentation for more information about determining the set of
        # available disk types for a particular project and zone.
        # Google Compute Engine Disk types are local to a particular
        # project in a particular zone, and so the resource name will
        # typically look something like this:
        # compute.googleapis.com/projects/project-id/zones/zone/diskTypes/pd-standard
        # Corresponds to the JSON property `diskType`
        # @return [String]
        attr_accessor :disk_type
      
        # Directory in a VM where disk is mounted.
        # Corresponds to the JSON property `mountPoint`
        # @return [String]
        attr_accessor :mount_point
      
        # Size of disk in GB.  If zero or unspecified, the service will
        # attempt to choose a reasonable default.
        # Corresponds to the JSON property `sizeGb`
        # @return [Fixnum]
        attr_accessor :size_gb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk_type = args[:disk_type] if args.key?(:disk_type)
          @mount_point = args[:mount_point] if args.key?(:mount_point)
          @size_gb = args[:size_gb] if args.key?(:size_gb)
        end
      end
      
      # Data provided with a pipeline or transform to provide descriptive info.
      class DisplayData
        include Google::Apis::Core::Hashable
      
        # Contains value if the data is of a boolean type.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # Contains value if the data is of duration type.
        # Corresponds to the JSON property `durationValue`
        # @return [String]
        attr_accessor :duration_value
      
        # Contains value if the data is of float type.
        # Corresponds to the JSON property `floatValue`
        # @return [Float]
        attr_accessor :float_value
      
        # Contains value if the data is of int64 type.
        # Corresponds to the JSON property `int64Value`
        # @return [Fixnum]
        attr_accessor :int64_value
      
        # Contains value if the data is of java class type.
        # Corresponds to the JSON property `javaClassValue`
        # @return [String]
        attr_accessor :java_class_value
      
        # The key identifying the display data.
        # This is intended to be used as a label for the display data
        # when viewed in a dax monitoring system.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # An optional label to display in a dax UI for the element.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The namespace for the key. This is usually a class name or programming
        # language namespace (i.e. python module) which defines the display data.
        # This allows a dax monitoring system to specially handle the data
        # and perform custom rendering.
        # Corresponds to the JSON property `namespace`
        # @return [String]
        attr_accessor :namespace
      
        # A possible additional shorter value to display.
        # For example a java_class_name_value of com.mypackage.MyDoFn
        # will be stored with MyDoFn as the short_str_value and
        # com.mypackage.MyDoFn as the java_class_name value.
        # short_str_value can be displayed and java_class_name_value
        # will be displayed as a tooltip.
        # Corresponds to the JSON property `shortStrValue`
        # @return [String]
        attr_accessor :short_str_value
      
        # Contains value if the data is of string type.
        # Corresponds to the JSON property `strValue`
        # @return [String]
        attr_accessor :str_value
      
        # Contains value if the data is of timestamp type.
        # Corresponds to the JSON property `timestampValue`
        # @return [String]
        attr_accessor :timestamp_value
      
        # An optional full URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @duration_value = args[:duration_value] if args.key?(:duration_value)
          @float_value = args[:float_value] if args.key?(:float_value)
          @int64_value = args[:int64_value] if args.key?(:int64_value)
          @java_class_value = args[:java_class_value] if args.key?(:java_class_value)
          @key = args[:key] if args.key?(:key)
          @label = args[:label] if args.key?(:label)
          @namespace = args[:namespace] if args.key?(:namespace)
          @short_str_value = args[:short_str_value] if args.key?(:short_str_value)
          @str_value = args[:str_value] if args.key?(:str_value)
          @timestamp_value = args[:timestamp_value] if args.key?(:timestamp_value)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A metric value representing a distribution.
      class DistributionUpdate
        include Google::Apis::Core::Hashable
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `count`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :count
      
        # Histogram of value counts for a distribution.
        # Buckets have an inclusive lower bound and exclusive upper bound and use
        # "1,2,5 bucketing": The first bucket range is from [0,1) and all subsequent
        # bucket boundaries are powers of ten multiplied by 1, 2, or 5. Thus, bucket
        # boundaries are 0, 1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, ...
        # Negative values are not supported.
        # Corresponds to the JSON property `histogram`
        # @return [Google::Apis::DataflowV1b3::Histogram]
        attr_accessor :histogram
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `max`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :max
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `min`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :min
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `sum`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :sum
      
        # Use a double since the sum of squares is likely to overflow int64.
        # Corresponds to the JSON property `sumOfSquares`
        # @return [Float]
        attr_accessor :sum_of_squares
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @histogram = args[:histogram] if args.key?(:histogram)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
          @sum = args[:sum] if args.key?(:sum)
          @sum_of_squares = args[:sum_of_squares] if args.key?(:sum_of_squares)
        end
      end
      
      # When a task splits using WorkItemStatus.dynamic_source_split, this
      # message describes the two parts of the split relative to the
      # description of the current task's input.
      class DynamicSourceSplit
        include Google::Apis::Core::Hashable
      
        # Specification of one of the bundles produced as a result of splitting
        # a Source (e.g. when executing a SourceSplitRequest, or when
        # splitting an active task using WorkItemStatus.dynamic_source_split),
        # relative to the source being split.
        # Corresponds to the JSON property `primary`
        # @return [Google::Apis::DataflowV1b3::DerivedSource]
        attr_accessor :primary
      
        # Specification of one of the bundles produced as a result of splitting
        # a Source (e.g. when executing a SourceSplitRequest, or when
        # splitting an active task using WorkItemStatus.dynamic_source_split),
        # relative to the source being split.
        # Corresponds to the JSON property `residual`
        # @return [Google::Apis::DataflowV1b3::DerivedSource]
        attr_accessor :residual
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @primary = args[:primary] if args.key?(:primary)
          @residual = args[:residual] if args.key?(:residual)
        end
      end
      
      # Describes the environment in which a Dataflow Job runs.
      class Environment
        include Google::Apis::Core::Hashable
      
        # The type of cluster manager API to use.  If unknown or
        # unspecified, the service will attempt to choose a reasonable
        # default.  This should be in the form of the API service name,
        # e.g. "compute.googleapis.com".
        # Corresponds to the JSON property `clusterManagerApiService`
        # @return [String]
        attr_accessor :cluster_manager_api_service
      
        # The dataset for the current project where various workflow
        # related tables are stored.
        # The supported resource type is:
        # Google BigQuery:
        # bigquery.googleapis.com/`dataset`
        # Corresponds to the JSON property `dataset`
        # @return [String]
        attr_accessor :dataset
      
        # The list of experiments to enable.
        # Corresponds to the JSON property `experiments`
        # @return [Array<String>]
        attr_accessor :experiments
      
        # Which Flexible Resource Scheduling mode to run in.
        # Corresponds to the JSON property `flexResourceSchedulingGoal`
        # @return [String]
        attr_accessor :flex_resource_scheduling_goal
      
        # Experimental settings.
        # Corresponds to the JSON property `internalExperiments`
        # @return [Hash<String,Object>]
        attr_accessor :internal_experiments
      
        # The Cloud Dataflow SDK pipeline options specified by the user. These
        # options are passed through the service and are used to recreate the
        # SDK pipeline options on the worker in a language agnostic and platform
        # independent way.
        # Corresponds to the JSON property `sdkPipelineOptions`
        # @return [Hash<String,Object>]
        attr_accessor :sdk_pipeline_options
      
        # Identity to run virtual machines as. Defaults to the default account.
        # Corresponds to the JSON property `serviceAccountEmail`
        # @return [String]
        attr_accessor :service_account_email
      
        # If set, contains the Cloud KMS key identifier used to encrypt data
        # at rest, AKA a Customer Managed Encryption Key (CMEK).
        # Format:
        # projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY
        # Corresponds to the JSON property `serviceKmsKeyName`
        # @return [String]
        attr_accessor :service_kms_key_name
      
        # The prefix of the resources the system should use for temporary
        # storage.  The system will append the suffix "/temp-`JOBNAME` to
        # this resource prefix, where `JOBNAME` is the value of the
        # job_name field.  The resulting bucket and object prefix is used
        # as the prefix of the resources used to store temporary data
        # needed during the job execution.  NOTE: This will override the
        # value in taskrunner_settings.
        # The supported resource type is:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`/`object`
        # bucket.storage.googleapis.com/`object`
        # Corresponds to the JSON property `tempStoragePrefix`
        # @return [String]
        attr_accessor :temp_storage_prefix
      
        # A description of the process that generated the request.
        # Corresponds to the JSON property `userAgent`
        # @return [Hash<String,Object>]
        attr_accessor :user_agent
      
        # A structure describing which components and their versions of the service
        # are required in order to run the job.
        # Corresponds to the JSON property `version`
        # @return [Hash<String,Object>]
        attr_accessor :version
      
        # The worker pools. At least one "harness" worker pool must be
        # specified in order for the job to have workers.
        # Corresponds to the JSON property `workerPools`
        # @return [Array<Google::Apis::DataflowV1b3::WorkerPool>]
        attr_accessor :worker_pools
      
        # The Compute Engine region
        # (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in
        # which worker processing should occur, e.g. "us-west1". Mutually exclusive
        # with worker_zone. If neither worker_region nor worker_zone is specified,
        # default to the control plane's region.
        # Corresponds to the JSON property `workerRegion`
        # @return [String]
        attr_accessor :worker_region
      
        # The Compute Engine zone
        # (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in
        # which worker processing should occur, e.g. "us-west1-a". Mutually exclusive
        # with worker_region. If neither worker_region nor worker_zone is specified,
        # a zone in the control plane's region is chosen based on available capacity.
        # Corresponds to the JSON property `workerZone`
        # @return [String]
        attr_accessor :worker_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_manager_api_service = args[:cluster_manager_api_service] if args.key?(:cluster_manager_api_service)
          @dataset = args[:dataset] if args.key?(:dataset)
          @experiments = args[:experiments] if args.key?(:experiments)
          @flex_resource_scheduling_goal = args[:flex_resource_scheduling_goal] if args.key?(:flex_resource_scheduling_goal)
          @internal_experiments = args[:internal_experiments] if args.key?(:internal_experiments)
          @sdk_pipeline_options = args[:sdk_pipeline_options] if args.key?(:sdk_pipeline_options)
          @service_account_email = args[:service_account_email] if args.key?(:service_account_email)
          @service_kms_key_name = args[:service_kms_key_name] if args.key?(:service_kms_key_name)
          @temp_storage_prefix = args[:temp_storage_prefix] if args.key?(:temp_storage_prefix)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
          @version = args[:version] if args.key?(:version)
          @worker_pools = args[:worker_pools] if args.key?(:worker_pools)
          @worker_region = args[:worker_region] if args.key?(:worker_region)
          @worker_zone = args[:worker_zone] if args.key?(:worker_zone)
        end
      end
      
      # A message describing the state of a particular execution stage.
      class ExecutionStageState
        include Google::Apis::Core::Hashable
      
        # The time at which the stage transitioned to this state.
        # Corresponds to the JSON property `currentStateTime`
        # @return [String]
        attr_accessor :current_state_time
      
        # The name of the execution stage.
        # Corresponds to the JSON property `executionStageName`
        # @return [String]
        attr_accessor :execution_stage_name
      
        # Executions stage states allow the same set of values as JobState.
        # Corresponds to the JSON property `executionStageState`
        # @return [String]
        attr_accessor :execution_stage_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_state_time = args[:current_state_time] if args.key?(:current_state_time)
          @execution_stage_name = args[:execution_stage_name] if args.key?(:execution_stage_name)
          @execution_stage_state = args[:execution_stage_state] if args.key?(:execution_stage_state)
        end
      end
      
      # Description of the composing transforms, names/ids, and input/outputs of a
      # stage of execution.  Some composing transforms and sources may have been
      # generated by the Dataflow service during execution planning.
      class ExecutionStageSummary
        include Google::Apis::Core::Hashable
      
        # Collections produced and consumed by component transforms of this stage.
        # Corresponds to the JSON property `componentSource`
        # @return [Array<Google::Apis::DataflowV1b3::ComponentSource>]
        attr_accessor :component_source
      
        # Transforms that comprise this execution stage.
        # Corresponds to the JSON property `componentTransform`
        # @return [Array<Google::Apis::DataflowV1b3::ComponentTransform>]
        attr_accessor :component_transform
      
        # Dataflow service generated id for this stage.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Input sources for this stage.
        # Corresponds to the JSON property `inputSource`
        # @return [Array<Google::Apis::DataflowV1b3::StageSource>]
        attr_accessor :input_source
      
        # Type of tranform this stage is executing.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Dataflow service generated name for this stage.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output sources for this stage.
        # Corresponds to the JSON property `outputSource`
        # @return [Array<Google::Apis::DataflowV1b3::StageSource>]
        attr_accessor :output_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @component_source = args[:component_source] if args.key?(:component_source)
          @component_transform = args[:component_transform] if args.key?(:component_transform)
          @id = args[:id] if args.key?(:id)
          @input_source = args[:input_source] if args.key?(:input_source)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @output_source = args[:output_source] if args.key?(:output_source)
        end
      end
      
      # Indicates which [regional endpoint]
      # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) failed
      # to respond to a request for data.
      class FailedLocation
        include Google::Apis::Core::Hashable
      
        # The name of the [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # failed to respond.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata for a File connector used by the job.
      class FileIoDetails
        include Google::Apis::Core::Hashable
      
        # File Pattern used to access files by the connector.
        # Corresponds to the JSON property `filePattern`
        # @return [String]
        attr_accessor :file_pattern
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_pattern = args[:file_pattern] if args.key?(:file_pattern)
        end
      end
      
      # An instruction that copies its inputs (zero or more) to its (single) output.
      class FlattenInstruction
        include Google::Apis::Core::Hashable
      
        # Describes the inputs to the flatten instruction.
        # Corresponds to the JSON property `inputs`
        # @return [Array<Google::Apis::DataflowV1b3::InstructionInput>]
        attr_accessor :inputs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inputs = args[:inputs] if args.key?(:inputs)
        end
      end
      
      # A metric value representing a list of floating point numbers.
      class FloatingPointList
        include Google::Apis::Core::Hashable
      
        # Elements of the list.
        # Corresponds to the JSON property `elements`
        # @return [Array<Float>]
        attr_accessor :elements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @elements = args[:elements] if args.key?(:elements)
        end
      end
      
      # A representation of a floating point mean metric contribution.
      class FloatingPointMean
        include Google::Apis::Core::Hashable
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `count`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :count
      
        # The sum of all values being aggregated.
        # Corresponds to the JSON property `sum`
        # @return [Float]
        attr_accessor :sum
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @sum = args[:sum] if args.key?(:sum)
        end
      end
      
      # Request to get updated debug configuration for component.
      class GetDebugConfigRequest
        include Google::Apis::Core::Hashable
      
        # The internal component id for which debug configuration is
        # requested.
        # Corresponds to the JSON property `componentId`
        # @return [String]
        attr_accessor :component_id
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains the job specified by job_id.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The worker id, i.e., VM hostname.
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @component_id = args[:component_id] if args.key?(:component_id)
          @location = args[:location] if args.key?(:location)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # Response to a get debug configuration request.
      class GetDebugConfigResponse
        include Google::Apis::Core::Hashable
      
        # The encoded debug configuration for the requested component.
        # Corresponds to the JSON property `config`
        # @return [String]
        attr_accessor :config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
        end
      end
      
      # The response to a GetTemplate request.
      class GetTemplateResponse
        include Google::Apis::Core::Hashable
      
        # Metadata describing a template.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::DataflowV1b3::TemplateMetadata]
        attr_accessor :metadata
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataflowV1b3::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Histogram of value counts for a distribution.
      # Buckets have an inclusive lower bound and exclusive upper bound and use
      # "1,2,5 bucketing": The first bucket range is from [0,1) and all subsequent
      # bucket boundaries are powers of ten multiplied by 1, 2, or 5. Thus, bucket
      # boundaries are 0, 1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, ...
      # Negative values are not supported.
      class Histogram
        include Google::Apis::Core::Hashable
      
        # Counts of values in each bucket. For efficiency, prefix and trailing
        # buckets with count = 0 are elided. Buckets can store the full range of
        # values of an unsigned long, with ULLONG_MAX falling into the 59th bucket
        # with range [1e19, 2e19).
        # Corresponds to the JSON property `bucketCounts`
        # @return [Array<Fixnum>]
        attr_accessor :bucket_counts
      
        # Starting index of first stored bucket. The non-inclusive upper-bound of
        # the ith bucket is given by:
        # pow(10,(i-first_bucket_offset)/3) * (1,2,5)[(i-first_bucket_offset)%3]
        # Corresponds to the JSON property `firstBucketOffset`
        # @return [Fixnum]
        attr_accessor :first_bucket_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_counts = args[:bucket_counts] if args.key?(:bucket_counts)
          @first_bucket_offset = args[:first_bucket_offset] if args.key?(:first_bucket_offset)
        end
      end
      
      # Proto describing a hot key detected on a given WorkItem.
      class HotKeyDetection
        include Google::Apis::Core::Hashable
      
        # The age of the hot key measured from when it was first detected.
        # Corresponds to the JSON property `hotKeyAge`
        # @return [String]
        attr_accessor :hot_key_age
      
        # System-defined name of the step containing this hot key.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        # User-provided name of the step that contains this hot key.
        # Corresponds to the JSON property `userStepName`
        # @return [String]
        attr_accessor :user_step_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hot_key_age = args[:hot_key_age] if args.key?(:hot_key_age)
          @system_name = args[:system_name] if args.key?(:system_name)
          @user_step_name = args[:user_step_name] if args.key?(:user_step_name)
        end
      end
      
      # An input of an instruction, as a reference to an output of a
      # producer instruction.
      class InstructionInput
        include Google::Apis::Core::Hashable
      
        # The output index (origin zero) within the producer.
        # Corresponds to the JSON property `outputNum`
        # @return [Fixnum]
        attr_accessor :output_num
      
        # The index (origin zero) of the parallel instruction that produces
        # the output to be consumed by this input.  This index is relative
        # to the list of instructions in this input's instruction's
        # containing MapTask.
        # Corresponds to the JSON property `producerInstructionIndex`
        # @return [Fixnum]
        attr_accessor :producer_instruction_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_num = args[:output_num] if args.key?(:output_num)
          @producer_instruction_index = args[:producer_instruction_index] if args.key?(:producer_instruction_index)
        end
      end
      
      # An output of an instruction.
      class InstructionOutput
        include Google::Apis::Core::Hashable
      
        # The codec to use to encode data being written via this output.
        # Corresponds to the JSON property `codec`
        # @return [Hash<String,Object>]
        attr_accessor :codec
      
        # The user-provided name of this output.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # For system-generated byte and mean byte metrics, certain instructions
        # should only report the key size.
        # Corresponds to the JSON property `onlyCountKeyBytes`
        # @return [Boolean]
        attr_accessor :only_count_key_bytes
        alias_method :only_count_key_bytes?, :only_count_key_bytes
      
        # For system-generated byte and mean byte metrics, certain instructions
        # should only report the value size.
        # Corresponds to the JSON property `onlyCountValueBytes`
        # @return [Boolean]
        attr_accessor :only_count_value_bytes
        alias_method :only_count_value_bytes?, :only_count_value_bytes
      
        # System-defined name for this output in the original workflow graph.
        # Outputs that do not contribute to an original instruction do not set this.
        # Corresponds to the JSON property `originalName`
        # @return [String]
        attr_accessor :original_name
      
        # System-defined name of this output.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @codec = args[:codec] if args.key?(:codec)
          @name = args[:name] if args.key?(:name)
          @only_count_key_bytes = args[:only_count_key_bytes] if args.key?(:only_count_key_bytes)
          @only_count_value_bytes = args[:only_count_value_bytes] if args.key?(:only_count_value_bytes)
          @original_name = args[:original_name] if args.key?(:original_name)
          @system_name = args[:system_name] if args.key?(:system_name)
        end
      end
      
      # A metric value representing temporal values of a variable.
      class IntegerGauge
        include Google::Apis::Core::Hashable
      
        # The time at which this value was measured. Measured as msecs from epoch.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A metric value representing a list of integers.
      class IntegerList
        include Google::Apis::Core::Hashable
      
        # Elements of the list.
        # Corresponds to the JSON property `elements`
        # @return [Array<Google::Apis::DataflowV1b3::SplitInt64>]
        attr_accessor :elements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @elements = args[:elements] if args.key?(:elements)
        end
      end
      
      # A representation of an integer mean metric contribution.
      class IntegerMean
        include Google::Apis::Core::Hashable
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `count`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :count
      
        # A representation of an int64, n, that is immune to precision loss when
        # encoded in JSON.
        # Corresponds to the JSON property `sum`
        # @return [Google::Apis::DataflowV1b3::SplitInt64]
        attr_accessor :sum
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @sum = args[:sum] if args.key?(:sum)
        end
      end
      
      # Defines a job to be run by the Cloud Dataflow service.
      class Job
        include Google::Apis::Core::Hashable
      
        # The client's unique identifier of the job, re-used across retried attempts.
        # If this field is set, the service will ensure its uniqueness.
        # The request to create a job will fail if the service has knowledge of a
        # previously submitted job with the same client's ID and job name.
        # The caller may use this field to ensure idempotence of job
        # creation across retried attempts to create a job.
        # By default, the field is empty and, in that case, the service ignores it.
        # Corresponds to the JSON property `clientRequestId`
        # @return [String]
        attr_accessor :client_request_id
      
        # The timestamp when the job was initially created. Immutable and set by the
        # Cloud Dataflow service.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # If this is specified, the job's initial state is populated from the given
        # snapshot.
        # Corresponds to the JSON property `createdFromSnapshotId`
        # @return [String]
        attr_accessor :created_from_snapshot_id
      
        # The current state of the job.
        # Jobs are created in the `JOB_STATE_STOPPED` state unless otherwise
        # specified.
        # A job in the `JOB_STATE_RUNNING` state may asynchronously enter a
        # terminal state. After a job has reached a terminal state, no
        # further state updates may be made.
        # This field may be mutated by the Cloud Dataflow service;
        # callers cannot mutate it.
        # Corresponds to the JSON property `currentState`
        # @return [String]
        attr_accessor :current_state
      
        # The timestamp associated with the current state.
        # Corresponds to the JSON property `currentStateTime`
        # @return [String]
        attr_accessor :current_state_time
      
        # Describes the environment in which a Dataflow Job runs.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::DataflowV1b3::Environment]
        attr_accessor :environment
      
        # Additional information about how a Cloud Dataflow job will be executed that
        # isn't contained in the submitted job.
        # Corresponds to the JSON property `executionInfo`
        # @return [Google::Apis::DataflowV1b3::JobExecutionInfo]
        attr_accessor :execution_info
      
        # The unique ID of this job.
        # This field is set by the Cloud Dataflow service when the Job is
        # created, and is immutable for the life of the job.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Metadata available primarily for filtering jobs. Will be included in the
        # ListJob response and Job SUMMARY view.
        # Corresponds to the JSON property `jobMetadata`
        # @return [Google::Apis::DataflowV1b3::JobMetadata]
        attr_accessor :job_metadata
      
        # User-defined labels for this job.
        # The labels map can contain no more than 64 entries.  Entries of the labels
        # map are UTF8 strings that comply with the following restrictions:
        # * Keys must conform to regexp:  \p`Ll`\p`Lo``0,62`
        # * Values must conform to regexp:  [\p`Ll`\p`Lo`\p`N`_-]`0,63`
        # * Both keys and values are additionally constrained to be <= 128 bytes in
        # size.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains this job.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The user-specified Cloud Dataflow job name.
        # Only one Job with a given name may exist in a project at any
        # given time. If a caller attempts to create a Job with the same
        # name as an already-existing Job, the attempt returns the
        # existing Job.
        # The name must match the regular expression
        # `[a-z]([-a-z0-9]`0,38`[a-z0-9])?`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A descriptive representation of submitted pipeline as well as the executed
        # form.  This data is provided by the Dataflow service for ease of visualizing
        # the pipeline and interpreting Dataflow provided metrics.
        # Corresponds to the JSON property `pipelineDescription`
        # @return [Google::Apis::DataflowV1b3::PipelineDescription]
        attr_accessor :pipeline_description
      
        # The ID of the Cloud Platform project that the job belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # If this job is an update of an existing job, this field is the job ID
        # of the job it replaced.
        # When sending a `CreateJobRequest`, you can update a job by specifying it
        # here. The job named here is stopped, and its intermediate state is
        # transferred to this job.
        # Corresponds to the JSON property `replaceJobId`
        # @return [String]
        attr_accessor :replace_job_id
      
        # If another job is an update of this job (and thus, this job is in
        # `JOB_STATE_UPDATED`), this field contains the ID of that job.
        # Corresponds to the JSON property `replacedByJobId`
        # @return [String]
        attr_accessor :replaced_by_job_id
      
        # The job's requested state.
        # `UpdateJob` may be used to switch between the `JOB_STATE_STOPPED` and
        # `JOB_STATE_RUNNING` states, by setting requested_state.  `UpdateJob` may
        # also be used to directly set a job's requested state to
        # `JOB_STATE_CANCELLED` or `JOB_STATE_DONE`, irrevocably terminating the
        # job if it has not already reached a terminal state.
        # Corresponds to the JSON property `requestedState`
        # @return [String]
        attr_accessor :requested_state
      
        # This field may be mutated by the Cloud Dataflow service;
        # callers cannot mutate it.
        # Corresponds to the JSON property `stageStates`
        # @return [Array<Google::Apis::DataflowV1b3::ExecutionStageState>]
        attr_accessor :stage_states
      
        # The timestamp when the job was started (transitioned to JOB_STATE_PENDING).
        # Flexible resource scheduling jobs are started with some delay after job
        # creation, so start_time is unset before start and is updated when the
        # job is started by the Cloud Dataflow service. For other jobs, start_time
        # always equals to create_time and is immutable and set by the Cloud Dataflow
        # service.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Exactly one of step or steps_location should be specified.
        # The top-level steps that constitute the entire job.
        # Corresponds to the JSON property `steps`
        # @return [Array<Google::Apis::DataflowV1b3::Step>]
        attr_accessor :steps
      
        # The GCS location where the steps are stored.
        # Corresponds to the JSON property `stepsLocation`
        # @return [String]
        attr_accessor :steps_location
      
        # A set of files the system should be aware of that are used
        # for temporary storage. These temporary files will be
        # removed on job completion.
        # No duplicates are allowed.
        # No file patterns are supported.
        # The supported files are:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`/`object`
        # bucket.storage.googleapis.com/`object`
        # Corresponds to the JSON property `tempFiles`
        # @return [Array<String>]
        attr_accessor :temp_files
      
        # The map of transform name prefixes of the job to be replaced to the
        # corresponding name prefixes of the new job.
        # Corresponds to the JSON property `transformNameMapping`
        # @return [Hash<String,String>]
        attr_accessor :transform_name_mapping
      
        # The type of Cloud Dataflow job.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_request_id = args[:client_request_id] if args.key?(:client_request_id)
          @create_time = args[:create_time] if args.key?(:create_time)
          @created_from_snapshot_id = args[:created_from_snapshot_id] if args.key?(:created_from_snapshot_id)
          @current_state = args[:current_state] if args.key?(:current_state)
          @current_state_time = args[:current_state_time] if args.key?(:current_state_time)
          @environment = args[:environment] if args.key?(:environment)
          @execution_info = args[:execution_info] if args.key?(:execution_info)
          @id = args[:id] if args.key?(:id)
          @job_metadata = args[:job_metadata] if args.key?(:job_metadata)
          @labels = args[:labels] if args.key?(:labels)
          @location = args[:location] if args.key?(:location)
          @name = args[:name] if args.key?(:name)
          @pipeline_description = args[:pipeline_description] if args.key?(:pipeline_description)
          @project_id = args[:project_id] if args.key?(:project_id)
          @replace_job_id = args[:replace_job_id] if args.key?(:replace_job_id)
          @replaced_by_job_id = args[:replaced_by_job_id] if args.key?(:replaced_by_job_id)
          @requested_state = args[:requested_state] if args.key?(:requested_state)
          @stage_states = args[:stage_states] if args.key?(:stage_states)
          @start_time = args[:start_time] if args.key?(:start_time)
          @steps = args[:steps] if args.key?(:steps)
          @steps_location = args[:steps_location] if args.key?(:steps_location)
          @temp_files = args[:temp_files] if args.key?(:temp_files)
          @transform_name_mapping = args[:transform_name_mapping] if args.key?(:transform_name_mapping)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Additional information about how a Cloud Dataflow job will be executed that
      # isn't contained in the submitted job.
      class JobExecutionInfo
        include Google::Apis::Core::Hashable
      
        # A mapping from each stage to the information about that stage.
        # Corresponds to the JSON property `stages`
        # @return [Hash<String,Google::Apis::DataflowV1b3::JobExecutionStageInfo>]
        attr_accessor :stages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stages = args[:stages] if args.key?(:stages)
        end
      end
      
      # Contains information about how a particular
      # google.dataflow.v1beta3.Step will be executed.
      class JobExecutionStageInfo
        include Google::Apis::Core::Hashable
      
        # The steps associated with the execution stage.
        # Note that stages may have several steps, and that a given step
        # might be run by more than one stage.
        # Corresponds to the JSON property `stepName`
        # @return [Array<String>]
        attr_accessor :step_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @step_name = args[:step_name] if args.key?(:step_name)
        end
      end
      
      # A particular message pertaining to a Dataflow job.
      class JobMessage
        include Google::Apis::Core::Hashable
      
        # Deprecated.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Importance level of the message.
        # Corresponds to the JSON property `messageImportance`
        # @return [String]
        attr_accessor :message_importance
      
        # The text of the message.
        # Corresponds to the JSON property `messageText`
        # @return [String]
        attr_accessor :message_text
      
        # The timestamp of the message.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @message_importance = args[:message_importance] if args.key?(:message_importance)
          @message_text = args[:message_text] if args.key?(:message_text)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # Metadata available primarily for filtering jobs. Will be included in the
      # ListJob response and Job SUMMARY view.
      class JobMetadata
        include Google::Apis::Core::Hashable
      
        # Identification of a BigTable source used in the Dataflow job.
        # Corresponds to the JSON property `bigTableDetails`
        # @return [Array<Google::Apis::DataflowV1b3::BigTableIoDetails>]
        attr_accessor :big_table_details
      
        # Identification of a BigQuery source used in the Dataflow job.
        # Corresponds to the JSON property `bigqueryDetails`
        # @return [Array<Google::Apis::DataflowV1b3::BigQueryIoDetails>]
        attr_accessor :bigquery_details
      
        # Identification of a Datastore source used in the Dataflow job.
        # Corresponds to the JSON property `datastoreDetails`
        # @return [Array<Google::Apis::DataflowV1b3::DatastoreIoDetails>]
        attr_accessor :datastore_details
      
        # Identification of a File source used in the Dataflow job.
        # Corresponds to the JSON property `fileDetails`
        # @return [Array<Google::Apis::DataflowV1b3::FileIoDetails>]
        attr_accessor :file_details
      
        # Identification of a PubSub source used in the Dataflow job.
        # Corresponds to the JSON property `pubsubDetails`
        # @return [Array<Google::Apis::DataflowV1b3::PubSubIoDetails>]
        attr_accessor :pubsub_details
      
        # The version of the SDK used to run the job.
        # Corresponds to the JSON property `sdkVersion`
        # @return [Google::Apis::DataflowV1b3::SdkVersion]
        attr_accessor :sdk_version
      
        # Identification of a Spanner source used in the Dataflow job.
        # Corresponds to the JSON property `spannerDetails`
        # @return [Array<Google::Apis::DataflowV1b3::SpannerIoDetails>]
        attr_accessor :spanner_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @big_table_details = args[:big_table_details] if args.key?(:big_table_details)
          @bigquery_details = args[:bigquery_details] if args.key?(:bigquery_details)
          @datastore_details = args[:datastore_details] if args.key?(:datastore_details)
          @file_details = args[:file_details] if args.key?(:file_details)
          @pubsub_details = args[:pubsub_details] if args.key?(:pubsub_details)
          @sdk_version = args[:sdk_version] if args.key?(:sdk_version)
          @spanner_details = args[:spanner_details] if args.key?(:spanner_details)
        end
      end
      
      # JobMetrics contains a collection of metrics describing the detailed progress
      # of a Dataflow job. Metrics correspond to user-defined and system-defined
      # metrics in the job.
      # This resource captures only the most recent values of each metric;
      # time-series data can be queried for them (under the same metric names)
      # from Cloud Monitoring.
      class JobMetrics
        include Google::Apis::Core::Hashable
      
        # Timestamp as of which metric values are current.
        # Corresponds to the JSON property `metricTime`
        # @return [String]
        attr_accessor :metric_time
      
        # All metrics for this job.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DataflowV1b3::MetricUpdate>]
        attr_accessor :metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_time = args[:metric_time] if args.key?(:metric_time)
          @metrics = args[:metrics] if args.key?(:metrics)
        end
      end
      
      # Data disk assignment information for a specific key-range of a sharded
      # computation.
      # Currently we only support UTF-8 character splits to simplify encoding into
      # JSON.
      class KeyRangeDataDiskAssignment
        include Google::Apis::Core::Hashable
      
        # The name of the data disk where data for this range is stored.
        # This name is local to the Google Cloud Platform project and uniquely
        # identifies the disk within that project, for example
        # "myproject-1014-104817-4c2-harness-0-disk-1".
        # Corresponds to the JSON property `dataDisk`
        # @return [String]
        attr_accessor :data_disk
      
        # The end (exclusive) of the key range.
        # Corresponds to the JSON property `end`
        # @return [String]
        attr_accessor :end
      
        # The start (inclusive) of the key range.
        # Corresponds to the JSON property `start`
        # @return [String]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_disk = args[:data_disk] if args.key?(:data_disk)
          @end = args[:end] if args.key?(:end)
          @start = args[:start] if args.key?(:start)
        end
      end
      
      # Location information for a specific key-range of a sharded computation.
      # Currently we only support UTF-8 character splits to simplify encoding into
      # JSON.
      class KeyRangeLocation
        include Google::Apis::Core::Hashable
      
        # The name of the data disk where data for this range is stored.
        # This name is local to the Google Cloud Platform project and uniquely
        # identifies the disk within that project, for example
        # "myproject-1014-104817-4c2-harness-0-disk-1".
        # Corresponds to the JSON property `dataDisk`
        # @return [String]
        attr_accessor :data_disk
      
        # The physical location of this range assignment to be used for
        # streaming computation cross-worker message delivery.
        # Corresponds to the JSON property `deliveryEndpoint`
        # @return [String]
        attr_accessor :delivery_endpoint
      
        # DEPRECATED. The location of the persistent state for this range, as a
        # persistent directory in the worker local filesystem.
        # Corresponds to the JSON property `deprecatedPersistentDirectory`
        # @return [String]
        attr_accessor :deprecated_persistent_directory
      
        # The end (exclusive) of the key range.
        # Corresponds to the JSON property `end`
        # @return [String]
        attr_accessor :end
      
        # The start (inclusive) of the key range.
        # Corresponds to the JSON property `start`
        # @return [String]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_disk = args[:data_disk] if args.key?(:data_disk)
          @delivery_endpoint = args[:delivery_endpoint] if args.key?(:delivery_endpoint)
          @deprecated_persistent_directory = args[:deprecated_persistent_directory] if args.key?(:deprecated_persistent_directory)
          @end = args[:end] if args.key?(:end)
          @start = args[:start] if args.key?(:start)
        end
      end
      
      # Parameters to provide to the template being launched.
      class LaunchTemplateParameters
        include Google::Apis::Core::Hashable
      
        # The environment values to set at runtime.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::DataflowV1b3::RuntimeEnvironment]
        attr_accessor :environment
      
        # Required. The job name to use for the created job.
        # Corresponds to the JSON property `jobName`
        # @return [String]
        attr_accessor :job_name
      
        # The runtime parameters to pass to the job.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,String>]
        attr_accessor :parameters
      
        # Only applicable when updating a pipeline. Map of transform name prefixes of
        # the job to be replaced to the corresponding name prefixes of the new job.
        # Corresponds to the JSON property `transformNameMapping`
        # @return [Hash<String,String>]
        attr_accessor :transform_name_mapping
      
        # If set, replace the existing pipeline with the name specified by jobName
        # with this pipeline, preserving state.
        # Corresponds to the JSON property `update`
        # @return [Boolean]
        attr_accessor :update
        alias_method :update?, :update
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
          @job_name = args[:job_name] if args.key?(:job_name)
          @parameters = args[:parameters] if args.key?(:parameters)
          @transform_name_mapping = args[:transform_name_mapping] if args.key?(:transform_name_mapping)
          @update = args[:update] if args.key?(:update)
        end
      end
      
      # Response to the request to launch a template.
      class LaunchTemplateResponse
        include Google::Apis::Core::Hashable
      
        # Defines a job to be run by the Cloud Dataflow service.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::DataflowV1b3::Job]
        attr_accessor :job
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job = args[:job] if args.key?(:job)
        end
      end
      
      # Request to lease WorkItems.
      class LeaseWorkItemRequest
        include Google::Apis::Core::Hashable
      
        # The current timestamp at the worker.
        # Corresponds to the JSON property `currentWorkerTime`
        # @return [String]
        attr_accessor :current_worker_time
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains the WorkItem's job.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The initial lease period.
        # Corresponds to the JSON property `requestedLeaseDuration`
        # @return [String]
        attr_accessor :requested_lease_duration
      
        # Untranslated bag-of-bytes WorkRequest from UnifiedWorker.
        # Corresponds to the JSON property `unifiedWorkerRequest`
        # @return [Hash<String,Object>]
        attr_accessor :unified_worker_request
      
        # Filter for WorkItem type.
        # Corresponds to the JSON property `workItemTypes`
        # @return [Array<String>]
        attr_accessor :work_item_types
      
        # Worker capabilities. WorkItems might be limited to workers with specific
        # capabilities.
        # Corresponds to the JSON property `workerCapabilities`
        # @return [Array<String>]
        attr_accessor :worker_capabilities
      
        # Identifies the worker leasing work -- typically the ID of the
        # virtual machine running the worker.
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_worker_time = args[:current_worker_time] if args.key?(:current_worker_time)
          @location = args[:location] if args.key?(:location)
          @requested_lease_duration = args[:requested_lease_duration] if args.key?(:requested_lease_duration)
          @unified_worker_request = args[:unified_worker_request] if args.key?(:unified_worker_request)
          @work_item_types = args[:work_item_types] if args.key?(:work_item_types)
          @worker_capabilities = args[:worker_capabilities] if args.key?(:worker_capabilities)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # Response to a request to lease WorkItems.
      class LeaseWorkItemResponse
        include Google::Apis::Core::Hashable
      
        # Untranslated bag-of-bytes WorkResponse for UnifiedWorker.
        # Corresponds to the JSON property `unifiedWorkerResponse`
        # @return [Hash<String,Object>]
        attr_accessor :unified_worker_response
      
        # A list of the leased WorkItems.
        # Corresponds to the JSON property `workItems`
        # @return [Array<Google::Apis::DataflowV1b3::WorkItem>]
        attr_accessor :work_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unified_worker_response = args[:unified_worker_response] if args.key?(:unified_worker_response)
          @work_items = args[:work_items] if args.key?(:work_items)
        end
      end
      
      # Response to a request to list job messages.
      class ListJobMessagesResponse
        include Google::Apis::Core::Hashable
      
        # Autoscaling events in ascending timestamp order.
        # Corresponds to the JSON property `autoscalingEvents`
        # @return [Array<Google::Apis::DataflowV1b3::AutoscalingEvent>]
        attr_accessor :autoscaling_events
      
        # Messages in ascending timestamp order.
        # Corresponds to the JSON property `jobMessages`
        # @return [Array<Google::Apis::DataflowV1b3::JobMessage>]
        attr_accessor :job_messages
      
        # The token to obtain the next page of results if there are more.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoscaling_events = args[:autoscaling_events] if args.key?(:autoscaling_events)
          @job_messages = args[:job_messages] if args.key?(:job_messages)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response to a request to list Cloud Dataflow jobs.  This may be a partial
      # response, depending on the page size in the ListJobsRequest.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # Zero or more messages describing the [regional endpoints]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # failed to respond.
        # Corresponds to the JSON property `failedLocation`
        # @return [Array<Google::Apis::DataflowV1b3::FailedLocation>]
        attr_accessor :failed_location
      
        # A subset of the requested job information.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::DataflowV1b3::Job>]
        attr_accessor :jobs
      
        # Set if there may be more results than fit in this response.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failed_location = args[:failed_location] if args.key?(:failed_location)
          @jobs = args[:jobs] if args.key?(:jobs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # MapTask consists of an ordered set of instructions, each of which
      # describes one particular low-level operation for the worker to
      # perform in order to accomplish the MapTask's WorkItem.
      # Each instruction must appear in the list before any instructions which
      # depends on its output.
      class MapTask
        include Google::Apis::Core::Hashable
      
        # Counter prefix that can be used to prefix counters. Not currently used in
        # Dataflow.
        # Corresponds to the JSON property `counterPrefix`
        # @return [String]
        attr_accessor :counter_prefix
      
        # The instructions in the MapTask.
        # Corresponds to the JSON property `instructions`
        # @return [Array<Google::Apis::DataflowV1b3::ParallelInstruction>]
        attr_accessor :instructions
      
        # System-defined name of the stage containing this MapTask.
        # Unique across the workflow.
        # Corresponds to the JSON property `stageName`
        # @return [String]
        attr_accessor :stage_name
      
        # System-defined name of this MapTask.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @counter_prefix = args[:counter_prefix] if args.key?(:counter_prefix)
          @instructions = args[:instructions] if args.key?(:instructions)
          @stage_name = args[:stage_name] if args.key?(:stage_name)
          @system_name = args[:system_name] if args.key?(:system_name)
        end
      end
      
      # The metric short id is returned to the user alongside an offset into
      # ReportWorkItemStatusRequest
      class MetricShortId
        include Google::Apis::Core::Hashable
      
        # The index of the corresponding metric in
        # the ReportWorkItemStatusRequest. Required.
        # Corresponds to the JSON property `metricIndex`
        # @return [Fixnum]
        attr_accessor :metric_index
      
        # The service-generated short identifier for the metric.
        # Corresponds to the JSON property `shortId`
        # @return [Fixnum]
        attr_accessor :short_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_index = args[:metric_index] if args.key?(:metric_index)
          @short_id = args[:short_id] if args.key?(:short_id)
        end
      end
      
      # Identifies a metric, by describing the source which generated the
      # metric.
      class MetricStructuredName
        include Google::Apis::Core::Hashable
      
        # Zero or more labeled fields which identify the part of the job this
        # metric is associated with, such as the name of a step or collection.
        # For example, built-in counters associated with steps will have
        # context['step'] = <step-name>. Counters associated with PCollections
        # in the SDK will have context['pcollection'] = <pcollection-name>.
        # Corresponds to the JSON property `context`
        # @return [Hash<String,String>]
        attr_accessor :context
      
        # Worker-defined metric name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Origin (namespace) of metric name. May be blank for user-define metrics;
        # will be "dataflow" for metrics defined by the Dataflow service or SDK.
        # Corresponds to the JSON property `origin`
        # @return [String]
        attr_accessor :origin
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @name = args[:name] if args.key?(:name)
          @origin = args[:origin] if args.key?(:origin)
        end
      end
      
      # Describes the state of a metric.
      class MetricUpdate
        include Google::Apis::Core::Hashable
      
        # True if this metric is reported as the total cumulative aggregate
        # value accumulated since the worker started working on this WorkItem.
        # By default this is false, indicating that this metric is reported
        # as a delta that is not associated with any WorkItem.
        # Corresponds to the JSON property `cumulative`
        # @return [Boolean]
        attr_accessor :cumulative
        alias_method :cumulative?, :cumulative
      
        # A struct value describing properties of a distribution of numeric values.
        # Corresponds to the JSON property `distribution`
        # @return [Object]
        attr_accessor :distribution
      
        # A struct value describing properties of a Gauge.
        # Metrics of gauge type show the value of a metric across time, and is
        # aggregated based on the newest value.
        # Corresponds to the JSON property `gauge`
        # @return [Object]
        attr_accessor :gauge
      
        # Worker-computed aggregate value for internal use by the Dataflow
        # service.
        # Corresponds to the JSON property `internal`
        # @return [Object]
        attr_accessor :internal
      
        # Metric aggregation kind.  The possible metric aggregation kinds are
        # "Sum", "Max", "Min", "Mean", "Set", "And", "Or", and "Distribution".
        # The specified aggregation kind is case-insensitive.
        # If omitted, this is not an aggregated value but instead
        # a single metric sample value.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Worker-computed aggregate value for the "Mean" aggregation kind.
        # This holds the count of the aggregated values and is used in combination
        # with mean_sum above to obtain the actual mean aggregate value.
        # The only possible value type is Long.
        # Corresponds to the JSON property `meanCount`
        # @return [Object]
        attr_accessor :mean_count
      
        # Worker-computed aggregate value for the "Mean" aggregation kind.
        # This holds the sum of the aggregated values and is used in combination
        # with mean_count below to obtain the actual mean aggregate value.
        # The only possible value types are Long and Double.
        # Corresponds to the JSON property `meanSum`
        # @return [Object]
        attr_accessor :mean_sum
      
        # Identifies a metric, by describing the source which generated the
        # metric.
        # Corresponds to the JSON property `name`
        # @return [Google::Apis::DataflowV1b3::MetricStructuredName]
        attr_accessor :name
      
        # Worker-computed aggregate value for aggregation kinds "Sum", "Max", "Min",
        # "And", and "Or".  The possible value types are Long, Double, and Boolean.
        # Corresponds to the JSON property `scalar`
        # @return [Object]
        attr_accessor :scalar
      
        # Worker-computed aggregate value for the "Set" aggregation kind.  The only
        # possible value type is a list of Values whose type can be Long, Double,
        # or String, according to the metric's type.  All Values in the list must
        # be of the same type.
        # Corresponds to the JSON property `set`
        # @return [Object]
        attr_accessor :set
      
        # Timestamp associated with the metric value. Optional when workers are
        # reporting work progress; it will be filled in responses from the
        # metrics API.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cumulative = args[:cumulative] if args.key?(:cumulative)
          @distribution = args[:distribution] if args.key?(:distribution)
          @gauge = args[:gauge] if args.key?(:gauge)
          @internal = args[:internal] if args.key?(:internal)
          @kind = args[:kind] if args.key?(:kind)
          @mean_count = args[:mean_count] if args.key?(:mean_count)
          @mean_sum = args[:mean_sum] if args.key?(:mean_sum)
          @name = args[:name] if args.key?(:name)
          @scalar = args[:scalar] if args.key?(:scalar)
          @set = args[:set] if args.key?(:set)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Describes mounted data disk.
      class MountedDataDisk
        include Google::Apis::Core::Hashable
      
        # The name of the data disk.
        # This name is local to the Google Cloud Platform project and uniquely
        # identifies the disk within that project, for example
        # "myproject-1014-104817-4c2-harness-0-disk-1".
        # Corresponds to the JSON property `dataDisk`
        # @return [String]
        attr_accessor :data_disk
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_disk = args[:data_disk] if args.key?(:data_disk)
        end
      end
      
      # Information about an output of a multi-output DoFn.
      class MultiOutputInfo
        include Google::Apis::Core::Hashable
      
        # The id of the tag the user code will emit to this output by; this
        # should correspond to the tag of some SideInputInfo.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # Basic metadata about a counter.
      class NameAndKind
        include Google::Apis::Core::Hashable
      
        # Counter aggregation kind.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of the counter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The packages that must be installed in order for a worker to run the
      # steps of the Cloud Dataflow job that will be assigned to its worker
      # pool.
      # This is the mechanism by which the Cloud Dataflow SDK causes code to
      # be loaded onto the workers. For example, the Cloud Dataflow Java SDK
      # might use this to install jars containing the user's code and all of the
      # various dependencies (libraries, data files, etc.) required in order
      # for that code to run.
      class Package
        include Google::Apis::Core::Hashable
      
        # The resource to read the package from. The supported resource type is:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`
        # bucket.storage.googleapis.com/
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The name of the package.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An instruction that does a ParDo operation.
      # Takes one main input and zero or more side inputs, and produces
      # zero or more outputs.
      # Runs user code.
      class ParDoInstruction
        include Google::Apis::Core::Hashable
      
        # An input of an instruction, as a reference to an output of a
        # producer instruction.
        # Corresponds to the JSON property `input`
        # @return [Google::Apis::DataflowV1b3::InstructionInput]
        attr_accessor :input
      
        # Information about each of the outputs, if user_fn is a  MultiDoFn.
        # Corresponds to the JSON property `multiOutputInfos`
        # @return [Array<Google::Apis::DataflowV1b3::MultiOutputInfo>]
        attr_accessor :multi_output_infos
      
        # The number of outputs.
        # Corresponds to the JSON property `numOutputs`
        # @return [Fixnum]
        attr_accessor :num_outputs
      
        # Zero or more side inputs.
        # Corresponds to the JSON property `sideInputs`
        # @return [Array<Google::Apis::DataflowV1b3::SideInputInfo>]
        attr_accessor :side_inputs
      
        # The user function to invoke.
        # Corresponds to the JSON property `userFn`
        # @return [Hash<String,Object>]
        attr_accessor :user_fn
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @input = args[:input] if args.key?(:input)
          @multi_output_infos = args[:multi_output_infos] if args.key?(:multi_output_infos)
          @num_outputs = args[:num_outputs] if args.key?(:num_outputs)
          @side_inputs = args[:side_inputs] if args.key?(:side_inputs)
          @user_fn = args[:user_fn] if args.key?(:user_fn)
        end
      end
      
      # Describes a particular operation comprising a MapTask.
      class ParallelInstruction
        include Google::Apis::Core::Hashable
      
        # An instruction that copies its inputs (zero or more) to its (single) output.
        # Corresponds to the JSON property `flatten`
        # @return [Google::Apis::DataflowV1b3::FlattenInstruction]
        attr_accessor :flatten
      
        # User-provided name of this operation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # System-defined name for the operation in the original workflow graph.
        # Corresponds to the JSON property `originalName`
        # @return [String]
        attr_accessor :original_name
      
        # Describes the outputs of the instruction.
        # Corresponds to the JSON property `outputs`
        # @return [Array<Google::Apis::DataflowV1b3::InstructionOutput>]
        attr_accessor :outputs
      
        # An instruction that does a ParDo operation.
        # Takes one main input and zero or more side inputs, and produces
        # zero or more outputs.
        # Runs user code.
        # Corresponds to the JSON property `parDo`
        # @return [Google::Apis::DataflowV1b3::ParDoInstruction]
        attr_accessor :par_do
      
        # An instruction that does a partial group-by-key.
        # One input and one output.
        # Corresponds to the JSON property `partialGroupByKey`
        # @return [Google::Apis::DataflowV1b3::PartialGroupByKeyInstruction]
        attr_accessor :partial_group_by_key
      
        # An instruction that reads records.
        # Takes no inputs, produces one output.
        # Corresponds to the JSON property `read`
        # @return [Google::Apis::DataflowV1b3::ReadInstruction]
        attr_accessor :read
      
        # System-defined name of this operation.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        # An instruction that writes records.
        # Takes one input, produces no outputs.
        # Corresponds to the JSON property `write`
        # @return [Google::Apis::DataflowV1b3::WriteInstruction]
        attr_accessor :write
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @flatten = args[:flatten] if args.key?(:flatten)
          @name = args[:name] if args.key?(:name)
          @original_name = args[:original_name] if args.key?(:original_name)
          @outputs = args[:outputs] if args.key?(:outputs)
          @par_do = args[:par_do] if args.key?(:par_do)
          @partial_group_by_key = args[:partial_group_by_key] if args.key?(:partial_group_by_key)
          @read = args[:read] if args.key?(:read)
          @system_name = args[:system_name] if args.key?(:system_name)
          @write = args[:write] if args.key?(:write)
        end
      end
      
      # Structured data associated with this message.
      class Parameter
        include Google::Apis::Core::Hashable
      
        # Key or name for this parameter.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Value for this parameter.
        # Corresponds to the JSON property `value`
        # @return [Object]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Metadata for a specific parameter.
      class ParameterMetadata
        include Google::Apis::Core::Hashable
      
        # Required. The help text to display for the parameter.
        # Corresponds to the JSON property `helpText`
        # @return [String]
        attr_accessor :help_text
      
        # Optional. Whether the parameter is optional. Defaults to false.
        # Corresponds to the JSON property `isOptional`
        # @return [Boolean]
        attr_accessor :is_optional
        alias_method :is_optional?, :is_optional
      
        # Required. The label to display for the parameter.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # Required. The name of the parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Regexes that the parameter must match.
        # Corresponds to the JSON property `regexes`
        # @return [Array<String>]
        attr_accessor :regexes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @help_text = args[:help_text] if args.key?(:help_text)
          @is_optional = args[:is_optional] if args.key?(:is_optional)
          @label = args[:label] if args.key?(:label)
          @name = args[:name] if args.key?(:name)
          @regexes = args[:regexes] if args.key?(:regexes)
        end
      end
      
      # An instruction that does a partial group-by-key.
      # One input and one output.
      class PartialGroupByKeyInstruction
        include Google::Apis::Core::Hashable
      
        # An input of an instruction, as a reference to an output of a
        # producer instruction.
        # Corresponds to the JSON property `input`
        # @return [Google::Apis::DataflowV1b3::InstructionInput]
        attr_accessor :input
      
        # The codec to use for interpreting an element in the input PTable.
        # Corresponds to the JSON property `inputElementCodec`
        # @return [Hash<String,Object>]
        attr_accessor :input_element_codec
      
        # If this instruction includes a combining function this is the name of the
        # intermediate store between the GBK and the CombineValues.
        # Corresponds to the JSON property `originalCombineValuesInputStoreName`
        # @return [String]
        attr_accessor :original_combine_values_input_store_name
      
        # If this instruction includes a combining function, this is the name of the
        # CombineValues instruction lifted into this instruction.
        # Corresponds to the JSON property `originalCombineValuesStepName`
        # @return [String]
        attr_accessor :original_combine_values_step_name
      
        # Zero or more side inputs.
        # Corresponds to the JSON property `sideInputs`
        # @return [Array<Google::Apis::DataflowV1b3::SideInputInfo>]
        attr_accessor :side_inputs
      
        # The value combining function to invoke.
        # Corresponds to the JSON property `valueCombiningFn`
        # @return [Hash<String,Object>]
        attr_accessor :value_combining_fn
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @input = args[:input] if args.key?(:input)
          @input_element_codec = args[:input_element_codec] if args.key?(:input_element_codec)
          @original_combine_values_input_store_name = args[:original_combine_values_input_store_name] if args.key?(:original_combine_values_input_store_name)
          @original_combine_values_step_name = args[:original_combine_values_step_name] if args.key?(:original_combine_values_step_name)
          @side_inputs = args[:side_inputs] if args.key?(:side_inputs)
          @value_combining_fn = args[:value_combining_fn] if args.key?(:value_combining_fn)
        end
      end
      
      # A descriptive representation of submitted pipeline as well as the executed
      # form.  This data is provided by the Dataflow service for ease of visualizing
      # the pipeline and interpreting Dataflow provided metrics.
      class PipelineDescription
        include Google::Apis::Core::Hashable
      
        # Pipeline level display data.
        # Corresponds to the JSON property `displayData`
        # @return [Array<Google::Apis::DataflowV1b3::DisplayData>]
        attr_accessor :display_data
      
        # Description of each stage of execution of the pipeline.
        # Corresponds to the JSON property `executionPipelineStage`
        # @return [Array<Google::Apis::DataflowV1b3::ExecutionStageSummary>]
        attr_accessor :execution_pipeline_stage
      
        # Description of each transform in the pipeline and collections between them.
        # Corresponds to the JSON property `originalPipelineTransform`
        # @return [Array<Google::Apis::DataflowV1b3::TransformSummary>]
        attr_accessor :original_pipeline_transform
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_data = args[:display_data] if args.key?(:display_data)
          @execution_pipeline_stage = args[:execution_pipeline_stage] if args.key?(:execution_pipeline_stage)
          @original_pipeline_transform = args[:original_pipeline_transform] if args.key?(:original_pipeline_transform)
        end
      end
      
      # Position defines a position within a collection of data.  The value
      # can be either the end position, a key (used with ordered
      # collections), a byte offset, or a record index.
      class Position
        include Google::Apis::Core::Hashable
      
        # Position is a byte offset.
        # Corresponds to the JSON property `byteOffset`
        # @return [Fixnum]
        attr_accessor :byte_offset
      
        # A position that encapsulates an inner position and an index for the inner
        # position. A ConcatPosition can be used by a reader of a source that
        # encapsulates a set of other sources.
        # Corresponds to the JSON property `concatPosition`
        # @return [Google::Apis::DataflowV1b3::ConcatPosition]
        attr_accessor :concat_position
      
        # Position is past all other positions. Also useful for the end
        # position of an unbounded range.
        # Corresponds to the JSON property `end`
        # @return [Boolean]
        attr_accessor :end
        alias_method :end?, :end
      
        # Position is a string key, ordered lexicographically.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Position is a record index.
        # Corresponds to the JSON property `recordIndex`
        # @return [Fixnum]
        attr_accessor :record_index
      
        # CloudPosition is a base64 encoded BatchShufflePosition (with FIXED
        # sharding).
        # Corresponds to the JSON property `shufflePosition`
        # @return [String]
        attr_accessor :shuffle_position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @byte_offset = args[:byte_offset] if args.key?(:byte_offset)
          @concat_position = args[:concat_position] if args.key?(:concat_position)
          @end = args[:end] if args.key?(:end)
          @key = args[:key] if args.key?(:key)
          @record_index = args[:record_index] if args.key?(:record_index)
          @shuffle_position = args[:shuffle_position] if args.key?(:shuffle_position)
        end
      end
      
      # Metadata for a PubSub connector used by the job.
      class PubSubIoDetails
        include Google::Apis::Core::Hashable
      
        # Subscription used in the connection.
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        # Topic accessed in the connection.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subscription = args[:subscription] if args.key?(:subscription)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # Identifies a pubsub location to use for transferring data into or
      # out of a streaming Dataflow job.
      class PubsubLocation
        include Google::Apis::Core::Hashable
      
        # Indicates whether the pipeline allows late-arriving data.
        # Corresponds to the JSON property `dropLateData`
        # @return [Boolean]
        attr_accessor :drop_late_data
        alias_method :drop_late_data?, :drop_late_data
      
        # If set, contains a pubsub label from which to extract record ids.
        # If left empty, record deduplication will be strictly best effort.
        # Corresponds to the JSON property `idLabel`
        # @return [String]
        attr_accessor :id_label
      
        # A pubsub subscription, in the form of
        # "pubsub.googleapis.com/subscriptions/<project-id>/<subscription-name>"
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        # If set, contains a pubsub label from which to extract record timestamps.
        # If left empty, record timestamps will be generated upon arrival.
        # Corresponds to the JSON property `timestampLabel`
        # @return [String]
        attr_accessor :timestamp_label
      
        # A pubsub topic, in the form of
        # "pubsub.googleapis.com/topics/<project-id>/<topic-name>"
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        # If set, specifies the pubsub subscription that will be used for tracking
        # custom time timestamps for watermark estimation.
        # Corresponds to the JSON property `trackingSubscription`
        # @return [String]
        attr_accessor :tracking_subscription
      
        # If true, then the client has requested to get pubsub attributes.
        # Corresponds to the JSON property `withAttributes`
        # @return [Boolean]
        attr_accessor :with_attributes
        alias_method :with_attributes?, :with_attributes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drop_late_data = args[:drop_late_data] if args.key?(:drop_late_data)
          @id_label = args[:id_label] if args.key?(:id_label)
          @subscription = args[:subscription] if args.key?(:subscription)
          @timestamp_label = args[:timestamp_label] if args.key?(:timestamp_label)
          @topic = args[:topic] if args.key?(:topic)
          @tracking_subscription = args[:tracking_subscription] if args.key?(:tracking_subscription)
          @with_attributes = args[:with_attributes] if args.key?(:with_attributes)
        end
      end
      
      # An instruction that reads records.
      # Takes no inputs, produces one output.
      class ReadInstruction
        include Google::Apis::Core::Hashable
      
        # A source that records can be read and decoded from.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::DataflowV1b3::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Request to report the status of WorkItems.
      class ReportWorkItemStatusRequest
        include Google::Apis::Core::Hashable
      
        # The current timestamp at the worker.
        # Corresponds to the JSON property `currentWorkerTime`
        # @return [String]
        attr_accessor :current_worker_time
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains the WorkItem's job.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Untranslated bag-of-bytes WorkProgressUpdateRequest from UnifiedWorker.
        # Corresponds to the JSON property `unifiedWorkerRequest`
        # @return [Hash<String,Object>]
        attr_accessor :unified_worker_request
      
        # The order is unimportant, except that the order of the
        # WorkItemServiceState messages in the ReportWorkItemStatusResponse
        # corresponds to the order of WorkItemStatus messages here.
        # Corresponds to the JSON property `workItemStatuses`
        # @return [Array<Google::Apis::DataflowV1b3::WorkItemStatus>]
        attr_accessor :work_item_statuses
      
        # The ID of the worker reporting the WorkItem status.  If this
        # does not match the ID of the worker which the Dataflow service
        # believes currently has the lease on the WorkItem, the report
        # will be dropped (with an error response).
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_worker_time = args[:current_worker_time] if args.key?(:current_worker_time)
          @location = args[:location] if args.key?(:location)
          @unified_worker_request = args[:unified_worker_request] if args.key?(:unified_worker_request)
          @work_item_statuses = args[:work_item_statuses] if args.key?(:work_item_statuses)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # Response from a request to report the status of WorkItems.
      class ReportWorkItemStatusResponse
        include Google::Apis::Core::Hashable
      
        # Untranslated bag-of-bytes WorkProgressUpdateResponse for UnifiedWorker.
        # Corresponds to the JSON property `unifiedWorkerResponse`
        # @return [Hash<String,Object>]
        attr_accessor :unified_worker_response
      
        # A set of messages indicating the service-side state for each
        # WorkItem whose status was reported, in the same order as the
        # WorkItemStatus messages in the ReportWorkItemStatusRequest which
        # resulting in this response.
        # Corresponds to the JSON property `workItemServiceStates`
        # @return [Array<Google::Apis::DataflowV1b3::WorkItemServiceState>]
        attr_accessor :work_item_service_states
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unified_worker_response = args[:unified_worker_response] if args.key?(:unified_worker_response)
          @work_item_service_states = args[:work_item_service_states] if args.key?(:work_item_service_states)
        end
      end
      
      # Represents the level of parallelism in a WorkItem's input,
      # reported by the worker.
      class ReportedParallelism
        include Google::Apis::Core::Hashable
      
        # Specifies whether the parallelism is infinite. If true, "value" is
        # ignored.
        # Infinite parallelism means the service will assume that the work item
        # can always be split into more non-empty work items by dynamic splitting.
        # This is a work-around for lack of support for infinity by the current
        # JSON-based Java RPC stack.
        # Corresponds to the JSON property `isInfinite`
        # @return [Boolean]
        attr_accessor :is_infinite
        alias_method :is_infinite?, :is_infinite
      
        # Specifies the level of parallelism in case it is finite.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_infinite = args[:is_infinite] if args.key?(:is_infinite)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Worker metrics exported from workers. This contains resource utilization
      # metrics accumulated from a variety of sources. For more information, see
      # go/df-resource-signals.
      class ResourceUtilizationReport
        include Google::Apis::Core::Hashable
      
        # CPU utilization samples.
        # Corresponds to the JSON property `cpuTime`
        # @return [Array<Google::Apis::DataflowV1b3::CpuTime>]
        attr_accessor :cpu_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpu_time = args[:cpu_time] if args.key?(:cpu_time)
        end
      end
      
      # Service-side response to WorkerMessage reporting resource utilization.
      class ResourceUtilizationReportResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The environment values to set at runtime.
      class RuntimeEnvironment
        include Google::Apis::Core::Hashable
      
        # Additional experiment flags for the job.
        # Corresponds to the JSON property `additionalExperiments`
        # @return [Array<String>]
        attr_accessor :additional_experiments
      
        # Additional user labels to be specified for the job.
        # Keys and values should follow the restrictions specified in the [labeling
        # restrictions](https://cloud.google.com/compute/docs/labeling-resources#
        # restrictions)
        # page.
        # Corresponds to the JSON property `additionalUserLabels`
        # @return [Hash<String,String>]
        attr_accessor :additional_user_labels
      
        # Whether to bypass the safety checks for the job's temporary directory.
        # Use with caution.
        # Corresponds to the JSON property `bypassTempDirValidation`
        # @return [Boolean]
        attr_accessor :bypass_temp_dir_validation
        alias_method :bypass_temp_dir_validation?, :bypass_temp_dir_validation
      
        # Configuration for VM IPs.
        # Corresponds to the JSON property `ipConfiguration`
        # @return [String]
        attr_accessor :ip_configuration
      
        # Optional. Name for the Cloud KMS key for the job.
        # Key format is:
        # projects/<project>/locations/<location>/keyRings/<keyring>/cryptoKeys/<key>
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        # The machine type to use for the job. Defaults to the value from the
        # template if not specified.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # The maximum number of Google Compute Engine instances to be made
        # available to your pipeline during execution, from 1 to 1000.
        # Corresponds to the JSON property `maxWorkers`
        # @return [Fixnum]
        attr_accessor :max_workers
      
        # Network to which VMs will be assigned.  If empty or unspecified,
        # the service will use the network "default".
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # The initial number of Google Compute Engine instnaces for the job.
        # Corresponds to the JSON property `numWorkers`
        # @return [Fixnum]
        attr_accessor :num_workers
      
        # The email address of the service account to run the job as.
        # Corresponds to the JSON property `serviceAccountEmail`
        # @return [String]
        attr_accessor :service_account_email
      
        # Subnetwork to which VMs will be assigned, if desired.  Expected to be of
        # the form "regions/REGION/subnetworks/SUBNETWORK".
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        # The Cloud Storage path to use for temporary files.
        # Must be a valid Cloud Storage URL, beginning with `gs://`.
        # Corresponds to the JSON property `tempLocation`
        # @return [String]
        attr_accessor :temp_location
      
        # The Compute Engine region
        # (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in
        # which worker processing should occur, e.g. "us-west1". Mutually exclusive
        # with worker_zone. If neither worker_region nor worker_zone is specified,
        # default to the control plane's region.
        # Corresponds to the JSON property `workerRegion`
        # @return [String]
        attr_accessor :worker_region
      
        # The Compute Engine zone
        # (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in
        # which worker processing should occur, e.g. "us-west1-a". Mutually exclusive
        # with worker_region. If neither worker_region nor worker_zone is specified,
        # a zone in the control plane's region is chosen based on available capacity.
        # If both `worker_zone` and `zone` are set, `worker_zone` takes precedence.
        # Corresponds to the JSON property `workerZone`
        # @return [String]
        attr_accessor :worker_zone
      
        # The Compute Engine [availability
        # zone](https://cloud.google.com/compute/docs/regions-zones/regions-zones)
        # for launching worker instances to run your pipeline.
        # In the future, worker_zone will take precedence.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_experiments = args[:additional_experiments] if args.key?(:additional_experiments)
          @additional_user_labels = args[:additional_user_labels] if args.key?(:additional_user_labels)
          @bypass_temp_dir_validation = args[:bypass_temp_dir_validation] if args.key?(:bypass_temp_dir_validation)
          @ip_configuration = args[:ip_configuration] if args.key?(:ip_configuration)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @max_workers = args[:max_workers] if args.key?(:max_workers)
          @network = args[:network] if args.key?(:network)
          @num_workers = args[:num_workers] if args.key?(:num_workers)
          @service_account_email = args[:service_account_email] if args.key?(:service_account_email)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
          @temp_location = args[:temp_location] if args.key?(:temp_location)
          @worker_region = args[:worker_region] if args.key?(:worker_region)
          @worker_zone = args[:worker_zone] if args.key?(:worker_zone)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # The version of the SDK used to run the job.
      class SdkVersion
        include Google::Apis::Core::Hashable
      
        # The support status for this SDK version.
        # Corresponds to the JSON property `sdkSupportStatus`
        # @return [String]
        attr_accessor :sdk_support_status
      
        # The version of the SDK used to run the job.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # A readable string describing the version of the SDK.
        # Corresponds to the JSON property `versionDisplayName`
        # @return [String]
        attr_accessor :version_display_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sdk_support_status = args[:sdk_support_status] if args.key?(:sdk_support_status)
          @version = args[:version] if args.key?(:version)
          @version_display_name = args[:version_display_name] if args.key?(:version_display_name)
        end
      end
      
      # Request to send encoded debug information.
      class SendDebugCaptureRequest
        include Google::Apis::Core::Hashable
      
        # The internal component id for which debug information is sent.
        # Corresponds to the JSON property `componentId`
        # @return [String]
        attr_accessor :component_id
      
        # The encoded debug information.
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains the job specified by job_id.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The worker id, i.e., VM hostname.
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @component_id = args[:component_id] if args.key?(:component_id)
          @data = args[:data] if args.key?(:data)
          @location = args[:location] if args.key?(:location)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # Response to a send capture request.
      # nothing
      class SendDebugCaptureResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A request for sending worker messages to the service.
      class SendWorkerMessagesRequest
        include Google::Apis::Core::Hashable
      
        # The [regional endpoint]
        # (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that
        # contains the job.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The WorkerMessages to send.
        # Corresponds to the JSON property `workerMessages`
        # @return [Array<Google::Apis::DataflowV1b3::WorkerMessage>]
        attr_accessor :worker_messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @worker_messages = args[:worker_messages] if args.key?(:worker_messages)
        end
      end
      
      # The response to the worker messages.
      class SendWorkerMessagesResponse
        include Google::Apis::Core::Hashable
      
        # The servers response to the worker messages.
        # Corresponds to the JSON property `workerMessageResponses`
        # @return [Array<Google::Apis::DataflowV1b3::WorkerMessageResponse>]
        attr_accessor :worker_message_responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @worker_message_responses = args[:worker_message_responses] if args.key?(:worker_message_responses)
        end
      end
      
      # Describes a particular function to invoke.
      class SeqMapTask
        include Google::Apis::Core::Hashable
      
        # Information about each of the inputs.
        # Corresponds to the JSON property `inputs`
        # @return [Array<Google::Apis::DataflowV1b3::SideInputInfo>]
        attr_accessor :inputs
      
        # The user-provided name of the SeqDo operation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Information about each of the outputs.
        # Corresponds to the JSON property `outputInfos`
        # @return [Array<Google::Apis::DataflowV1b3::SeqMapTaskOutputInfo>]
        attr_accessor :output_infos
      
        # System-defined name of the stage containing the SeqDo operation.
        # Unique across the workflow.
        # Corresponds to the JSON property `stageName`
        # @return [String]
        attr_accessor :stage_name
      
        # System-defined name of the SeqDo operation.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        # The user function to invoke.
        # Corresponds to the JSON property `userFn`
        # @return [Hash<String,Object>]
        attr_accessor :user_fn
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inputs = args[:inputs] if args.key?(:inputs)
          @name = args[:name] if args.key?(:name)
          @output_infos = args[:output_infos] if args.key?(:output_infos)
          @stage_name = args[:stage_name] if args.key?(:stage_name)
          @system_name = args[:system_name] if args.key?(:system_name)
          @user_fn = args[:user_fn] if args.key?(:user_fn)
        end
      end
      
      # Information about an output of a SeqMapTask.
      class SeqMapTaskOutputInfo
        include Google::Apis::Core::Hashable
      
        # A sink that records can be encoded and written to.
        # Corresponds to the JSON property `sink`
        # @return [Google::Apis::DataflowV1b3::Sink]
        attr_accessor :sink
      
        # The id of the TupleTag the user code will tag the output value by.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sink = args[:sink] if args.key?(:sink)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # A task which consists of a shell command for the worker to execute.
      class ShellTask
        include Google::Apis::Core::Hashable
      
        # The shell command to run.
        # Corresponds to the JSON property `command`
        # @return [String]
        attr_accessor :command
      
        # Exit code for the task.
        # Corresponds to the JSON property `exitCode`
        # @return [Fixnum]
        attr_accessor :exit_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @command = args[:command] if args.key?(:command)
          @exit_code = args[:exit_code] if args.key?(:exit_code)
        end
      end
      
      # Information about a side input of a DoFn or an input of a SeqDoFn.
      class SideInputInfo
        include Google::Apis::Core::Hashable
      
        # How to interpret the source element(s) as a side input value.
        # Corresponds to the JSON property `kind`
        # @return [Hash<String,Object>]
        attr_accessor :kind
      
        # The source(s) to read element(s) from to get the value of this side input.
        # If more than one source, then the elements are taken from the
        # sources, in the specified order if order matters.
        # At least one source is required.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DataflowV1b3::Source>]
        attr_accessor :sources
      
        # The id of the tag the user code will access this side input by;
        # this should correspond to the tag of some MultiOutputInfo.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @sources = args[:sources] if args.key?(:sources)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # A sink that records can be encoded and written to.
      class Sink
        include Google::Apis::Core::Hashable
      
        # The codec to use to encode data written to the sink.
        # Corresponds to the JSON property `codec`
        # @return [Hash<String,Object>]
        attr_accessor :codec
      
        # The sink to write to, plus its parameters.
        # Corresponds to the JSON property `spec`
        # @return [Hash<String,Object>]
        attr_accessor :spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @codec = args[:codec] if args.key?(:codec)
          @spec = args[:spec] if args.key?(:spec)
        end
      end
      
      # A source that records can be read and decoded from.
      class Source
        include Google::Apis::Core::Hashable
      
        # While splitting, sources may specify the produced bundles
        # as differences against another source, in order to save backend-side
        # memory and allow bigger jobs. For details, see SourceSplitRequest.
        # To support this use case, the full set of parameters of the source
        # is logically obtained by taking the latest explicitly specified value
        # of each parameter in the order:
        # base_specs (later items win), spec (overrides anything in base_specs).
        # Corresponds to the JSON property `baseSpecs`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :base_specs
      
        # The codec to use to decode data read from the source.
        # Corresponds to the JSON property `codec`
        # @return [Hash<String,Object>]
        attr_accessor :codec
      
        # Setting this value to true hints to the framework that the source
        # doesn't need splitting, and using SourceSplitRequest on it would
        # yield SOURCE_SPLIT_OUTCOME_USE_CURRENT.
        # E.g. a file splitter may set this to true when splitting a single file
        # into a set of byte ranges of appropriate size, and set this
        # to false when splitting a filepattern into individual files.
        # However, for efficiency, a file splitter may decide to produce
        # file subranges directly from the filepattern to avoid a splitting
        # round-trip.
        # See SourceSplitRequest for an overview of the splitting process.
        # This field is meaningful only in the Source objects populated
        # by the user (e.g. when filling in a DerivedSource).
        # Source objects supplied by the framework to the user don't have
        # this field populated.
        # Corresponds to the JSON property `doesNotNeedSplitting`
        # @return [Boolean]
        attr_accessor :does_not_need_splitting
        alias_method :does_not_need_splitting?, :does_not_need_splitting
      
        # Metadata about a Source useful for automatically optimizing
        # and tuning the pipeline, etc.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::DataflowV1b3::SourceMetadata]
        attr_accessor :metadata
      
        # The source to read from, plus its parameters.
        # Corresponds to the JSON property `spec`
        # @return [Hash<String,Object>]
        attr_accessor :spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_specs = args[:base_specs] if args.key?(:base_specs)
          @codec = args[:codec] if args.key?(:codec)
          @does_not_need_splitting = args[:does_not_need_splitting] if args.key?(:does_not_need_splitting)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
        end
      end
      
      # DEPRECATED in favor of DynamicSourceSplit.
      class SourceFork
        include Google::Apis::Core::Hashable
      
        # DEPRECATED in favor of DerivedSource.
        # Corresponds to the JSON property `primary`
        # @return [Google::Apis::DataflowV1b3::SourceSplitShard]
        attr_accessor :primary
      
        # Specification of one of the bundles produced as a result of splitting
        # a Source (e.g. when executing a SourceSplitRequest, or when
        # splitting an active task using WorkItemStatus.dynamic_source_split),
        # relative to the source being split.
        # Corresponds to the JSON property `primarySource`
        # @return [Google::Apis::DataflowV1b3::DerivedSource]
        attr_accessor :primary_source
      
        # DEPRECATED in favor of DerivedSource.
        # Corresponds to the JSON property `residual`
        # @return [Google::Apis::DataflowV1b3::SourceSplitShard]
        attr_accessor :residual
      
        # Specification of one of the bundles produced as a result of splitting
        # a Source (e.g. when executing a SourceSplitRequest, or when
        # splitting an active task using WorkItemStatus.dynamic_source_split),
        # relative to the source being split.
        # Corresponds to the JSON property `residualSource`
        # @return [Google::Apis::DataflowV1b3::DerivedSource]
        attr_accessor :residual_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @primary = args[:primary] if args.key?(:primary)
          @primary_source = args[:primary_source] if args.key?(:primary_source)
          @residual = args[:residual] if args.key?(:residual)
          @residual_source = args[:residual_source] if args.key?(:residual_source)
        end
      end
      
      # A request to compute the SourceMetadata of a Source.
      class SourceGetMetadataRequest
        include Google::Apis::Core::Hashable
      
        # A source that records can be read and decoded from.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::DataflowV1b3::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # The result of a SourceGetMetadataOperation.
      class SourceGetMetadataResponse
        include Google::Apis::Core::Hashable
      
        # Metadata about a Source useful for automatically optimizing
        # and tuning the pipeline, etc.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::DataflowV1b3::SourceMetadata]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # Metadata about a Source useful for automatically optimizing
      # and tuning the pipeline, etc.
      class SourceMetadata
        include Google::Apis::Core::Hashable
      
        # An estimate of the total size (in bytes) of the data that would be
        # read from this source.  This estimate is in terms of external storage
        # size, before any decompression or other processing done by the reader.
        # Corresponds to the JSON property `estimatedSizeBytes`
        # @return [Fixnum]
        attr_accessor :estimated_size_bytes
      
        # Specifies that the size of this source is known to be infinite
        # (this is a streaming source).
        # Corresponds to the JSON property `infinite`
        # @return [Boolean]
        attr_accessor :infinite
        alias_method :infinite?, :infinite
      
        # Whether this source is known to produce key/value pairs with
        # the (encoded) keys in lexicographically sorted order.
        # Corresponds to the JSON property `producesSortedKeys`
        # @return [Boolean]
        attr_accessor :produces_sorted_keys
        alias_method :produces_sorted_keys?, :produces_sorted_keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @estimated_size_bytes = args[:estimated_size_bytes] if args.key?(:estimated_size_bytes)
          @infinite = args[:infinite] if args.key?(:infinite)
          @produces_sorted_keys = args[:produces_sorted_keys] if args.key?(:produces_sorted_keys)
        end
      end
      
      # A work item that represents the different operations that can be
      # performed on a user-defined Source specification.
      class SourceOperationRequest
        include Google::Apis::Core::Hashable
      
        # A request to compute the SourceMetadata of a Source.
        # Corresponds to the JSON property `getMetadata`
        # @return [Google::Apis::DataflowV1b3::SourceGetMetadataRequest]
        attr_accessor :get_metadata
      
        # User-provided name of the Read instruction for this source.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # System-defined name for the Read instruction for this source
        # in the original workflow graph.
        # Corresponds to the JSON property `originalName`
        # @return [String]
        attr_accessor :original_name
      
        # Represents the operation to split a high-level Source specification
        # into bundles (parts for parallel processing).
        # At a high level, splitting of a source into bundles happens as follows:
        # SourceSplitRequest is applied to the source. If it returns
        # SOURCE_SPLIT_OUTCOME_USE_CURRENT, no further splitting happens and the source
        # is used "as is". Otherwise, splitting is applied recursively to each
        # produced DerivedSource.
        # As an optimization, for any Source, if its does_not_need_splitting is
        # true, the framework assumes that splitting this source would return
        # SOURCE_SPLIT_OUTCOME_USE_CURRENT, and doesn't initiate a SourceSplitRequest.
        # This applies both to the initial source being split and to bundles
        # produced from it.
        # Corresponds to the JSON property `split`
        # @return [Google::Apis::DataflowV1b3::SourceSplitRequest]
        attr_accessor :split
      
        # System-defined name of the stage containing the source operation.
        # Unique across the workflow.
        # Corresponds to the JSON property `stageName`
        # @return [String]
        attr_accessor :stage_name
      
        # System-defined name of the Read instruction for this source.
        # Unique across the workflow.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @get_metadata = args[:get_metadata] if args.key?(:get_metadata)
          @name = args[:name] if args.key?(:name)
          @original_name = args[:original_name] if args.key?(:original_name)
          @split = args[:split] if args.key?(:split)
          @stage_name = args[:stage_name] if args.key?(:stage_name)
          @system_name = args[:system_name] if args.key?(:system_name)
        end
      end
      
      # The result of a SourceOperationRequest, specified in
      # ReportWorkItemStatusRequest.source_operation when the work item
      # is completed.
      class SourceOperationResponse
        include Google::Apis::Core::Hashable
      
        # The result of a SourceGetMetadataOperation.
        # Corresponds to the JSON property `getMetadata`
        # @return [Google::Apis::DataflowV1b3::SourceGetMetadataResponse]
        attr_accessor :get_metadata
      
        # The response to a SourceSplitRequest.
        # Corresponds to the JSON property `split`
        # @return [Google::Apis::DataflowV1b3::SourceSplitResponse]
        attr_accessor :split
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @get_metadata = args[:get_metadata] if args.key?(:get_metadata)
          @split = args[:split] if args.key?(:split)
        end
      end
      
      # Hints for splitting a Source into bundles (parts for parallel
      # processing) using SourceSplitRequest.
      class SourceSplitOptions
        include Google::Apis::Core::Hashable
      
        # The source should be split into a set of bundles where the estimated size
        # of each is approximately this many bytes.
        # Corresponds to the JSON property `desiredBundleSizeBytes`
        # @return [Fixnum]
        attr_accessor :desired_bundle_size_bytes
      
        # DEPRECATED in favor of desired_bundle_size_bytes.
        # Corresponds to the JSON property `desiredShardSizeBytes`
        # @return [Fixnum]
        attr_accessor :desired_shard_size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @desired_bundle_size_bytes = args[:desired_bundle_size_bytes] if args.key?(:desired_bundle_size_bytes)
          @desired_shard_size_bytes = args[:desired_shard_size_bytes] if args.key?(:desired_shard_size_bytes)
        end
      end
      
      # Represents the operation to split a high-level Source specification
      # into bundles (parts for parallel processing).
      # At a high level, splitting of a source into bundles happens as follows:
      # SourceSplitRequest is applied to the source. If it returns
      # SOURCE_SPLIT_OUTCOME_USE_CURRENT, no further splitting happens and the source
      # is used "as is". Otherwise, splitting is applied recursively to each
      # produced DerivedSource.
      # As an optimization, for any Source, if its does_not_need_splitting is
      # true, the framework assumes that splitting this source would return
      # SOURCE_SPLIT_OUTCOME_USE_CURRENT, and doesn't initiate a SourceSplitRequest.
      # This applies both to the initial source being split and to bundles
      # produced from it.
      class SourceSplitRequest
        include Google::Apis::Core::Hashable
      
        # Hints for splitting a Source into bundles (parts for parallel
        # processing) using SourceSplitRequest.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::DataflowV1b3::SourceSplitOptions]
        attr_accessor :options
      
        # A source that records can be read and decoded from.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::DataflowV1b3::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # The response to a SourceSplitRequest.
      class SourceSplitResponse
        include Google::Apis::Core::Hashable
      
        # If outcome is SPLITTING_HAPPENED, then this is a list of bundles
        # into which the source was split. Otherwise this field is ignored.
        # This list can be empty, which means the source represents an empty input.
        # Corresponds to the JSON property `bundles`
        # @return [Array<Google::Apis::DataflowV1b3::DerivedSource>]
        attr_accessor :bundles
      
        # Indicates whether splitting happened and produced a list of bundles.
        # If this is USE_CURRENT_SOURCE_AS_IS, the current source should
        # be processed "as is" without splitting. "bundles" is ignored in this case.
        # If this is SPLITTING_HAPPENED, then "bundles" contains a list of
        # bundles into which the source was split.
        # Corresponds to the JSON property `outcome`
        # @return [String]
        attr_accessor :outcome
      
        # DEPRECATED in favor of bundles.
        # Corresponds to the JSON property `shards`
        # @return [Array<Google::Apis::DataflowV1b3::SourceSplitShard>]
        attr_accessor :shards
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bundles = args[:bundles] if args.key?(:bundles)
          @outcome = args[:outcome] if args.key?(:outcome)
          @shards = args[:shards] if args.key?(:shards)
        end
      end
      
      # DEPRECATED in favor of DerivedSource.
      class SourceSplitShard
        include Google::Apis::Core::Hashable
      
        # DEPRECATED
        # Corresponds to the JSON property `derivationMode`
        # @return [String]
        attr_accessor :derivation_mode
      
        # A source that records can be read and decoded from.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::DataflowV1b3::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @derivation_mode = args[:derivation_mode] if args.key?(:derivation_mode)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Metadata for a Spanner connector used by the job.
      class SpannerIoDetails
        include Google::Apis::Core::Hashable
      
        # DatabaseId accessed in the connection.
        # Corresponds to the JSON property `databaseId`
        # @return [String]
        attr_accessor :database_id
      
        # InstanceId accessed in the connection.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # ProjectId accessed in the connection.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @database_id = args[:database_id] if args.key?(:database_id)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # A representation of an int64, n, that is immune to precision loss when
      # encoded in JSON.
      class SplitInt64
        include Google::Apis::Core::Hashable
      
        # The high order bits, including the sign: n >> 32.
        # Corresponds to the JSON property `highBits`
        # @return [Fixnum]
        attr_accessor :high_bits
      
        # The low order bits: n & 0xffffffff.
        # Corresponds to the JSON property `lowBits`
        # @return [Fixnum]
        attr_accessor :low_bits
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @high_bits = args[:high_bits] if args.key?(:high_bits)
          @low_bits = args[:low_bits] if args.key?(:low_bits)
        end
      end
      
      # Description of an input or output of an execution stage.
      class StageSource
        include Google::Apis::Core::Hashable
      
        # Dataflow service generated name for this source.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User name for the original user transform or collection with which this
        # source is most closely associated.
        # Corresponds to the JSON property `originalTransformOrCollection`
        # @return [String]
        attr_accessor :original_transform_or_collection
      
        # Size of the source, if measurable.
        # Corresponds to the JSON property `sizeBytes`
        # @return [Fixnum]
        attr_accessor :size_bytes
      
        # Human-readable name for this source; may be user or system generated.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @original_transform_or_collection = args[:original_transform_or_collection] if args.key?(:original_transform_or_collection)
          @size_bytes = args[:size_bytes] if args.key?(:size_bytes)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # State family configuration.
      class StateFamilyConfig
        include Google::Apis::Core::Hashable
      
        # If true, this family corresponds to a read operation.
        # Corresponds to the JSON property `isRead`
        # @return [Boolean]
        attr_accessor :is_read
        alias_method :is_read?, :is_read
      
        # The state family value.
        # Corresponds to the JSON property `stateFamily`
        # @return [String]
        attr_accessor :state_family
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_read = args[:is_read] if args.key?(:is_read)
          @state_family = args[:state_family] if args.key?(:state_family)
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
      
      # Defines a particular step within a Cloud Dataflow job.
      # A job consists of multiple steps, each of which performs some
      # specific operation as part of the overall job.  Data is typically
      # passed from one step to another as part of the job.
      # Here's an example of a sequence of steps which together implement a
      # Map-Reduce job:
      # * Read a collection of data from some source, parsing the
      # collection's elements.
      # * Validate the elements.
      # * Apply a user-defined function to map each element to some value
      # and extract an element-specific key value.
      # * Group elements with the same key into a single element with
      # that key, transforming a multiply-keyed collection into a
      # uniquely-keyed collection.
      # * Write the elements out to some data sink.
      # Note that the Cloud Dataflow service may be used to run many different
      # types of jobs, not just Map-Reduce.
      class Step
        include Google::Apis::Core::Hashable
      
        # The kind of step in the Cloud Dataflow job.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name that identifies the step. This must be unique for each
        # step with respect to all other steps in the Cloud Dataflow job.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Named properties associated with the step. Each kind of
        # predefined step has its own required set of properties.
        # Must be provided on Create.  Only retrieved with JOB_VIEW_ALL.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,Object>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # Describes a stream of data, either as input to be processed or as
      # output of a streaming Dataflow job.
      class StreamLocation
        include Google::Apis::Core::Hashable
      
        # Identifies the location of a custom souce.
        # Corresponds to the JSON property `customSourceLocation`
        # @return [Google::Apis::DataflowV1b3::CustomSourceLocation]
        attr_accessor :custom_source_location
      
        # Identifies a pubsub location to use for transferring data into or
        # out of a streaming Dataflow job.
        # Corresponds to the JSON property `pubsubLocation`
        # @return [Google::Apis::DataflowV1b3::PubsubLocation]
        attr_accessor :pubsub_location
      
        # Identifies the location of a streaming side input.
        # Corresponds to the JSON property `sideInputLocation`
        # @return [Google::Apis::DataflowV1b3::StreamingSideInputLocation]
        attr_accessor :side_input_location
      
        # Identifies the location of a streaming computation stage, for
        # stage-to-stage communication.
        # Corresponds to the JSON property `streamingStageLocation`
        # @return [Google::Apis::DataflowV1b3::StreamingStageLocation]
        attr_accessor :streaming_stage_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_source_location = args[:custom_source_location] if args.key?(:custom_source_location)
          @pubsub_location = args[:pubsub_location] if args.key?(:pubsub_location)
          @side_input_location = args[:side_input_location] if args.key?(:side_input_location)
          @streaming_stage_location = args[:streaming_stage_location] if args.key?(:streaming_stage_location)
        end
      end
      
      # Streaming appliance snapshot configuration.
      class StreamingApplianceSnapshotConfig
        include Google::Apis::Core::Hashable
      
        # Indicates which endpoint is used to import appliance state.
        # Corresponds to the JSON property `importStateEndpoint`
        # @return [String]
        attr_accessor :import_state_endpoint
      
        # If set, indicates the snapshot id for the snapshot being performed.
        # Corresponds to the JSON property `snapshotId`
        # @return [String]
        attr_accessor :snapshot_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @import_state_endpoint = args[:import_state_endpoint] if args.key?(:import_state_endpoint)
          @snapshot_id = args[:snapshot_id] if args.key?(:snapshot_id)
        end
      end
      
      # Configuration information for a single streaming computation.
      class StreamingComputationConfig
        include Google::Apis::Core::Hashable
      
        # Unique identifier for this computation.
        # Corresponds to the JSON property `computationId`
        # @return [String]
        attr_accessor :computation_id
      
        # Instructions that comprise the computation.
        # Corresponds to the JSON property `instructions`
        # @return [Array<Google::Apis::DataflowV1b3::ParallelInstruction>]
        attr_accessor :instructions
      
        # Stage name of this computation.
        # Corresponds to the JSON property `stageName`
        # @return [String]
        attr_accessor :stage_name
      
        # System defined name for this computation.
        # Corresponds to the JSON property `systemName`
        # @return [String]
        attr_accessor :system_name
      
        # Map from user name of stateful transforms in this stage to their state
        # family.
        # Corresponds to the JSON property `transformUserNameToStateFamily`
        # @return [Hash<String,String>]
        attr_accessor :transform_user_name_to_state_family
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computation_id = args[:computation_id] if args.key?(:computation_id)
          @instructions = args[:instructions] if args.key?(:instructions)
          @stage_name = args[:stage_name] if args.key?(:stage_name)
          @system_name = args[:system_name] if args.key?(:system_name)
          @transform_user_name_to_state_family = args[:transform_user_name_to_state_family] if args.key?(:transform_user_name_to_state_family)
        end
      end
      
      # Describes full or partial data disk assignment information of the computation
      # ranges.
      class StreamingComputationRanges
        include Google::Apis::Core::Hashable
      
        # The ID of the computation.
        # Corresponds to the JSON property `computationId`
        # @return [String]
        attr_accessor :computation_id
      
        # Data disk assignments for ranges from this computation.
        # Corresponds to the JSON property `rangeAssignments`
        # @return [Array<Google::Apis::DataflowV1b3::KeyRangeDataDiskAssignment>]
        attr_accessor :range_assignments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computation_id = args[:computation_id] if args.key?(:computation_id)
          @range_assignments = args[:range_assignments] if args.key?(:range_assignments)
        end
      end
      
      # A task which describes what action should be performed for the specified
      # streaming computation ranges.
      class StreamingComputationTask
        include Google::Apis::Core::Hashable
      
        # Contains ranges of a streaming computation this task should apply to.
        # Corresponds to the JSON property `computationRanges`
        # @return [Array<Google::Apis::DataflowV1b3::StreamingComputationRanges>]
        attr_accessor :computation_ranges
      
        # Describes the set of data disks this task should apply to.
        # Corresponds to the JSON property `dataDisks`
        # @return [Array<Google::Apis::DataflowV1b3::MountedDataDisk>]
        attr_accessor :data_disks
      
        # A type of streaming computation task.
        # Corresponds to the JSON property `taskType`
        # @return [String]
        attr_accessor :task_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computation_ranges = args[:computation_ranges] if args.key?(:computation_ranges)
          @data_disks = args[:data_disks] if args.key?(:data_disks)
          @task_type = args[:task_type] if args.key?(:task_type)
        end
      end
      
      # A task that carries configuration information for streaming computations.
      class StreamingConfigTask
        include Google::Apis::Core::Hashable
      
        # Chunk size for commit streams from the harness to windmill.
        # Corresponds to the JSON property `commitStreamChunkSizeBytes`
        # @return [Fixnum]
        attr_accessor :commit_stream_chunk_size_bytes
      
        # Chunk size for get data streams from the harness to windmill.
        # Corresponds to the JSON property `getDataStreamChunkSizeBytes`
        # @return [Fixnum]
        attr_accessor :get_data_stream_chunk_size_bytes
      
        # Maximum size for work item commit supported windmill storage layer.
        # Corresponds to the JSON property `maxWorkItemCommitBytes`
        # @return [Fixnum]
        attr_accessor :max_work_item_commit_bytes
      
        # Set of computation configuration information.
        # Corresponds to the JSON property `streamingComputationConfigs`
        # @return [Array<Google::Apis::DataflowV1b3::StreamingComputationConfig>]
        attr_accessor :streaming_computation_configs
      
        # Map from user step names to state families.
        # Corresponds to the JSON property `userStepToStateFamilyNameMap`
        # @return [Hash<String,String>]
        attr_accessor :user_step_to_state_family_name_map
      
        # If present, the worker must use this endpoint to communicate with Windmill
        # Service dispatchers, otherwise the worker must continue to use whatever
        # endpoint it had been using.
        # Corresponds to the JSON property `windmillServiceEndpoint`
        # @return [String]
        attr_accessor :windmill_service_endpoint
      
        # If present, the worker must use this port to communicate with Windmill
        # Service dispatchers. Only applicable when windmill_service_endpoint is
        # specified.
        # Corresponds to the JSON property `windmillServicePort`
        # @return [Fixnum]
        attr_accessor :windmill_service_port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commit_stream_chunk_size_bytes = args[:commit_stream_chunk_size_bytes] if args.key?(:commit_stream_chunk_size_bytes)
          @get_data_stream_chunk_size_bytes = args[:get_data_stream_chunk_size_bytes] if args.key?(:get_data_stream_chunk_size_bytes)
          @max_work_item_commit_bytes = args[:max_work_item_commit_bytes] if args.key?(:max_work_item_commit_bytes)
          @streaming_computation_configs = args[:streaming_computation_configs] if args.key?(:streaming_computation_configs)
          @user_step_to_state_family_name_map = args[:user_step_to_state_family_name_map] if args.key?(:user_step_to_state_family_name_map)
          @windmill_service_endpoint = args[:windmill_service_endpoint] if args.key?(:windmill_service_endpoint)
          @windmill_service_port = args[:windmill_service_port] if args.key?(:windmill_service_port)
        end
      end
      
      # A task which initializes part of a streaming Dataflow job.
      class StreamingSetupTask
        include Google::Apis::Core::Hashable
      
        # The user has requested drain.
        # Corresponds to the JSON property `drain`
        # @return [Boolean]
        attr_accessor :drain
        alias_method :drain?, :drain
      
        # The TCP port on which the worker should listen for messages from
        # other streaming computation workers.
        # Corresponds to the JSON property `receiveWorkPort`
        # @return [Fixnum]
        attr_accessor :receive_work_port
      
        # Streaming appliance snapshot configuration.
        # Corresponds to the JSON property `snapshotConfig`
        # @return [Google::Apis::DataflowV1b3::StreamingApplianceSnapshotConfig]
        attr_accessor :snapshot_config
      
        # Global topology of the streaming Dataflow job, including all
        # computations and their sharded locations.
        # Corresponds to the JSON property `streamingComputationTopology`
        # @return [Google::Apis::DataflowV1b3::TopologyConfig]
        attr_accessor :streaming_computation_topology
      
        # The TCP port used by the worker to communicate with the Dataflow
        # worker harness.
        # Corresponds to the JSON property `workerHarnessPort`
        # @return [Fixnum]
        attr_accessor :worker_harness_port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drain = args[:drain] if args.key?(:drain)
          @receive_work_port = args[:receive_work_port] if args.key?(:receive_work_port)
          @snapshot_config = args[:snapshot_config] if args.key?(:snapshot_config)
          @streaming_computation_topology = args[:streaming_computation_topology] if args.key?(:streaming_computation_topology)
          @worker_harness_port = args[:worker_harness_port] if args.key?(:worker_harness_port)
        end
      end
      
      # Identifies the location of a streaming side input.
      class StreamingSideInputLocation
        include Google::Apis::Core::Hashable
      
        # Identifies the state family where this side input is stored.
        # Corresponds to the JSON property `stateFamily`
        # @return [String]
        attr_accessor :state_family
      
        # Identifies the particular side input within the streaming Dataflow job.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state_family = args[:state_family] if args.key?(:state_family)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # Identifies the location of a streaming computation stage, for
      # stage-to-stage communication.
      class StreamingStageLocation
        include Google::Apis::Core::Hashable
      
        # Identifies the particular stream within the streaming Dataflow
        # job.
        # Corresponds to the JSON property `streamId`
        # @return [String]
        attr_accessor :stream_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stream_id = args[:stream_id] if args.key?(:stream_id)
        end
      end
      
      # A metric value representing a list of strings.
      class StringList
        include Google::Apis::Core::Hashable
      
        # Elements of the list.
        # Corresponds to the JSON property `elements`
        # @return [Array<String>]
        attr_accessor :elements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @elements = args[:elements] if args.key?(:elements)
        end
      end
      
      # A rich message format, including a human readable string, a key for
      # identifying the message, and structured data associated with the message for
      # programmatic consumption.
      class StructuredMessage
        include Google::Apis::Core::Hashable
      
        # Identifier for this message type.  Used by external systems to
        # internationalize or personalize message.
        # Corresponds to the JSON property `messageKey`
        # @return [String]
        attr_accessor :message_key
      
        # Human-readable version of message.
        # Corresponds to the JSON property `messageText`
        # @return [String]
        attr_accessor :message_text
      
        # The structured data associated with this message.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::DataflowV1b3::Parameter>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message_key = args[:message_key] if args.key?(:message_key)
          @message_text = args[:message_text] if args.key?(:message_text)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # Taskrunner configuration settings.
      class TaskRunnerSettings
        include Google::Apis::Core::Hashable
      
        # Whether to also send taskrunner log info to stderr.
        # Corresponds to the JSON property `alsologtostderr`
        # @return [Boolean]
        attr_accessor :alsologtostderr
        alias_method :alsologtostderr?, :alsologtostderr
      
        # The location on the worker for task-specific subdirectories.
        # Corresponds to the JSON property `baseTaskDir`
        # @return [String]
        attr_accessor :base_task_dir
      
        # The base URL for the taskrunner to use when accessing Google Cloud APIs.
        # When workers access Google Cloud APIs, they logically do so via
        # relative URLs.  If this field is specified, it supplies the base
        # URL to use for resolving these relative URLs.  The normative
        # algorithm used is defined by RFC 1808, "Relative Uniform Resource
        # Locators".
        # If not specified, the default value is "http://www.googleapis.com/"
        # Corresponds to the JSON property `baseUrl`
        # @return [String]
        attr_accessor :base_url
      
        # The file to store preprocessing commands in.
        # Corresponds to the JSON property `commandlinesFileName`
        # @return [String]
        attr_accessor :commandlines_file_name
      
        # Whether to continue taskrunner if an exception is hit.
        # Corresponds to the JSON property `continueOnException`
        # @return [Boolean]
        attr_accessor :continue_on_exception
        alias_method :continue_on_exception?, :continue_on_exception
      
        # The API version of endpoint, e.g. "v1b3"
        # Corresponds to the JSON property `dataflowApiVersion`
        # @return [String]
        attr_accessor :dataflow_api_version
      
        # The command to launch the worker harness.
        # Corresponds to the JSON property `harnessCommand`
        # @return [String]
        attr_accessor :harness_command
      
        # The suggested backend language.
        # Corresponds to the JSON property `languageHint`
        # @return [String]
        attr_accessor :language_hint
      
        # The directory on the VM to store logs.
        # Corresponds to the JSON property `logDir`
        # @return [String]
        attr_accessor :log_dir
      
        # Whether to send taskrunner log info to Google Compute Engine VM serial
        # console.
        # Corresponds to the JSON property `logToSerialconsole`
        # @return [Boolean]
        attr_accessor :log_to_serialconsole
        alias_method :log_to_serialconsole?, :log_to_serialconsole
      
        # Indicates where to put logs.  If this is not specified, the logs
        # will not be uploaded.
        # The supported resource type is:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`/`object`
        # bucket.storage.googleapis.com/`object`
        # Corresponds to the JSON property `logUploadLocation`
        # @return [String]
        attr_accessor :log_upload_location
      
        # The OAuth2 scopes to be requested by the taskrunner in order to
        # access the Cloud Dataflow API.
        # Corresponds to the JSON property `oauthScopes`
        # @return [Array<String>]
        attr_accessor :oauth_scopes
      
        # Provides data to pass through to the worker harness.
        # Corresponds to the JSON property `parallelWorkerSettings`
        # @return [Google::Apis::DataflowV1b3::WorkerSettings]
        attr_accessor :parallel_worker_settings
      
        # The streaming worker main class name.
        # Corresponds to the JSON property `streamingWorkerMainClass`
        # @return [String]
        attr_accessor :streaming_worker_main_class
      
        # The UNIX group ID on the worker VM to use for tasks launched by
        # taskrunner; e.g. "wheel".
        # Corresponds to the JSON property `taskGroup`
        # @return [String]
        attr_accessor :task_group
      
        # The UNIX user ID on the worker VM to use for tasks launched by
        # taskrunner; e.g. "root".
        # Corresponds to the JSON property `taskUser`
        # @return [String]
        attr_accessor :task_user
      
        # The prefix of the resources the taskrunner should use for
        # temporary storage.
        # The supported resource type is:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`/`object`
        # bucket.storage.googleapis.com/`object`
        # Corresponds to the JSON property `tempStoragePrefix`
        # @return [String]
        attr_accessor :temp_storage_prefix
      
        # The ID string of the VM.
        # Corresponds to the JSON property `vmId`
        # @return [String]
        attr_accessor :vm_id
      
        # The file to store the workflow in.
        # Corresponds to the JSON property `workflowFileName`
        # @return [String]
        attr_accessor :workflow_file_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alsologtostderr = args[:alsologtostderr] if args.key?(:alsologtostderr)
          @base_task_dir = args[:base_task_dir] if args.key?(:base_task_dir)
          @base_url = args[:base_url] if args.key?(:base_url)
          @commandlines_file_name = args[:commandlines_file_name] if args.key?(:commandlines_file_name)
          @continue_on_exception = args[:continue_on_exception] if args.key?(:continue_on_exception)
          @dataflow_api_version = args[:dataflow_api_version] if args.key?(:dataflow_api_version)
          @harness_command = args[:harness_command] if args.key?(:harness_command)
          @language_hint = args[:language_hint] if args.key?(:language_hint)
          @log_dir = args[:log_dir] if args.key?(:log_dir)
          @log_to_serialconsole = args[:log_to_serialconsole] if args.key?(:log_to_serialconsole)
          @log_upload_location = args[:log_upload_location] if args.key?(:log_upload_location)
          @oauth_scopes = args[:oauth_scopes] if args.key?(:oauth_scopes)
          @parallel_worker_settings = args[:parallel_worker_settings] if args.key?(:parallel_worker_settings)
          @streaming_worker_main_class = args[:streaming_worker_main_class] if args.key?(:streaming_worker_main_class)
          @task_group = args[:task_group] if args.key?(:task_group)
          @task_user = args[:task_user] if args.key?(:task_user)
          @temp_storage_prefix = args[:temp_storage_prefix] if args.key?(:temp_storage_prefix)
          @vm_id = args[:vm_id] if args.key?(:vm_id)
          @workflow_file_name = args[:workflow_file_name] if args.key?(:workflow_file_name)
        end
      end
      
      # Metadata describing a template.
      class TemplateMetadata
        include Google::Apis::Core::Hashable
      
        # Optional. A description of the template.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. The name of the template.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The parameters for the template.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::DataflowV1b3::ParameterMetadata>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # Global topology of the streaming Dataflow job, including all
      # computations and their sharded locations.
      class TopologyConfig
        include Google::Apis::Core::Hashable
      
        # The computations associated with a streaming Dataflow job.
        # Corresponds to the JSON property `computations`
        # @return [Array<Google::Apis::DataflowV1b3::ComputationTopology>]
        attr_accessor :computations
      
        # The disks assigned to a streaming Dataflow job.
        # Corresponds to the JSON property `dataDiskAssignments`
        # @return [Array<Google::Apis::DataflowV1b3::DataDiskAssignment>]
        attr_accessor :data_disk_assignments
      
        # The size (in bits) of keys that will be assigned to source messages.
        # Corresponds to the JSON property `forwardingKeyBits`
        # @return [Fixnum]
        attr_accessor :forwarding_key_bits
      
        # Version number for persistent state.
        # Corresponds to the JSON property `persistentStateVersion`
        # @return [Fixnum]
        attr_accessor :persistent_state_version
      
        # Maps user stage names to stable computation names.
        # Corresponds to the JSON property `userStageToComputationNameMap`
        # @return [Hash<String,String>]
        attr_accessor :user_stage_to_computation_name_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computations = args[:computations] if args.key?(:computations)
          @data_disk_assignments = args[:data_disk_assignments] if args.key?(:data_disk_assignments)
          @forwarding_key_bits = args[:forwarding_key_bits] if args.key?(:forwarding_key_bits)
          @persistent_state_version = args[:persistent_state_version] if args.key?(:persistent_state_version)
          @user_stage_to_computation_name_map = args[:user_stage_to_computation_name_map] if args.key?(:user_stage_to_computation_name_map)
        end
      end
      
      # Description of the type, names/ids, and input/outputs for a transform.
      class TransformSummary
        include Google::Apis::Core::Hashable
      
        # Transform-specific display data.
        # Corresponds to the JSON property `displayData`
        # @return [Array<Google::Apis::DataflowV1b3::DisplayData>]
        attr_accessor :display_data
      
        # SDK generated id of this transform instance.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # User names for all collection inputs to this transform.
        # Corresponds to the JSON property `inputCollectionName`
        # @return [Array<String>]
        attr_accessor :input_collection_name
      
        # Type of transform.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # User provided name for this transform instance.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User  names for all collection outputs to this transform.
        # Corresponds to the JSON property `outputCollectionName`
        # @return [Array<String>]
        attr_accessor :output_collection_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_data = args[:display_data] if args.key?(:display_data)
          @id = args[:id] if args.key?(:id)
          @input_collection_name = args[:input_collection_name] if args.key?(:input_collection_name)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @output_collection_name = args[:output_collection_name] if args.key?(:output_collection_name)
        end
      end
      
      # Response to the validation request.
      class ValidateResponse
        include Google::Apis::Core::Hashable
      
        # Will be empty if validation succeeds.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
        end
      end
      
      # WorkItem represents basic information about a WorkItem to be executed
      # in the cloud.
      class WorkItem
        include Google::Apis::Core::Hashable
      
        # Work item-specific configuration as an opaque blob.
        # Corresponds to the JSON property `configuration`
        # @return [String]
        attr_accessor :configuration
      
        # Identifies this WorkItem.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # The initial index to use when reporting the status of the WorkItem.
        # Corresponds to the JSON property `initialReportIndex`
        # @return [Fixnum]
        attr_accessor :initial_report_index
      
        # Identifies the workflow job this WorkItem belongs to.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # Time when the lease on this Work will expire.
        # Corresponds to the JSON property `leaseExpireTime`
        # @return [String]
        attr_accessor :lease_expire_time
      
        # MapTask consists of an ordered set of instructions, each of which
        # describes one particular low-level operation for the worker to
        # perform in order to accomplish the MapTask's WorkItem.
        # Each instruction must appear in the list before any instructions which
        # depends on its output.
        # Corresponds to the JSON property `mapTask`
        # @return [Google::Apis::DataflowV1b3::MapTask]
        attr_accessor :map_task
      
        # Any required packages that need to be fetched in order to execute
        # this WorkItem.
        # Corresponds to the JSON property `packages`
        # @return [Array<Google::Apis::DataflowV1b3::Package>]
        attr_accessor :packages
      
        # Identifies the cloud project this WorkItem belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Recommended reporting interval.
        # Corresponds to the JSON property `reportStatusInterval`
        # @return [String]
        attr_accessor :report_status_interval
      
        # Describes a particular function to invoke.
        # Corresponds to the JSON property `seqMapTask`
        # @return [Google::Apis::DataflowV1b3::SeqMapTask]
        attr_accessor :seq_map_task
      
        # A task which consists of a shell command for the worker to execute.
        # Corresponds to the JSON property `shellTask`
        # @return [Google::Apis::DataflowV1b3::ShellTask]
        attr_accessor :shell_task
      
        # A work item that represents the different operations that can be
        # performed on a user-defined Source specification.
        # Corresponds to the JSON property `sourceOperationTask`
        # @return [Google::Apis::DataflowV1b3::SourceOperationRequest]
        attr_accessor :source_operation_task
      
        # A task which describes what action should be performed for the specified
        # streaming computation ranges.
        # Corresponds to the JSON property `streamingComputationTask`
        # @return [Google::Apis::DataflowV1b3::StreamingComputationTask]
        attr_accessor :streaming_computation_task
      
        # A task that carries configuration information for streaming computations.
        # Corresponds to the JSON property `streamingConfigTask`
        # @return [Google::Apis::DataflowV1b3::StreamingConfigTask]
        attr_accessor :streaming_config_task
      
        # A task which initializes part of a streaming Dataflow job.
        # Corresponds to the JSON property `streamingSetupTask`
        # @return [Google::Apis::DataflowV1b3::StreamingSetupTask]
        attr_accessor :streaming_setup_task
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @id = args[:id] if args.key?(:id)
          @initial_report_index = args[:initial_report_index] if args.key?(:initial_report_index)
          @job_id = args[:job_id] if args.key?(:job_id)
          @lease_expire_time = args[:lease_expire_time] if args.key?(:lease_expire_time)
          @map_task = args[:map_task] if args.key?(:map_task)
          @packages = args[:packages] if args.key?(:packages)
          @project_id = args[:project_id] if args.key?(:project_id)
          @report_status_interval = args[:report_status_interval] if args.key?(:report_status_interval)
          @seq_map_task = args[:seq_map_task] if args.key?(:seq_map_task)
          @shell_task = args[:shell_task] if args.key?(:shell_task)
          @source_operation_task = args[:source_operation_task] if args.key?(:source_operation_task)
          @streaming_computation_task = args[:streaming_computation_task] if args.key?(:streaming_computation_task)
          @streaming_config_task = args[:streaming_config_task] if args.key?(:streaming_config_task)
          @streaming_setup_task = args[:streaming_setup_task] if args.key?(:streaming_setup_task)
        end
      end
      
      # The Dataflow service's idea of the current state of a WorkItem
      # being processed by a worker.
      class WorkItemServiceState
        include Google::Apis::Core::Hashable
      
        # Other data returned by the service, specific to the particular
        # worker harness.
        # Corresponds to the JSON property `harnessData`
        # @return [Hash<String,Object>]
        attr_accessor :harness_data
      
        # Proto describing a hot key detected on a given WorkItem.
        # Corresponds to the JSON property `hotKeyDetection`
        # @return [Google::Apis::DataflowV1b3::HotKeyDetection]
        attr_accessor :hot_key_detection
      
        # Time at which the current lease will expire.
        # Corresponds to the JSON property `leaseExpireTime`
        # @return [String]
        attr_accessor :lease_expire_time
      
        # The short ids that workers should use in subsequent metric updates.
        # Workers should strive to use short ids whenever possible, but it is ok
        # to request the short_id again if a worker lost track of it
        # (e.g. if the worker is recovering from a crash).
        # NOTE: it is possible that the response may have short ids for a subset
        # of the metrics.
        # Corresponds to the JSON property `metricShortId`
        # @return [Array<Google::Apis::DataflowV1b3::MetricShortId>]
        attr_accessor :metric_short_id
      
        # The index value to use for the next report sent by the worker.
        # Note: If the report call fails for whatever reason, the worker should
        # reuse this index for subsequent report attempts.
        # Corresponds to the JSON property `nextReportIndex`
        # @return [Fixnum]
        attr_accessor :next_report_index
      
        # New recommended reporting interval.
        # Corresponds to the JSON property `reportStatusInterval`
        # @return [String]
        attr_accessor :report_status_interval
      
        # A suggestion by the service to the worker to dynamically split the WorkItem.
        # Corresponds to the JSON property `splitRequest`
        # @return [Google::Apis::DataflowV1b3::ApproximateSplitRequest]
        attr_accessor :split_request
      
        # Obsolete in favor of ApproximateReportedProgress and ApproximateSplitRequest.
        # Corresponds to the JSON property `suggestedStopPoint`
        # @return [Google::Apis::DataflowV1b3::ApproximateProgress]
        attr_accessor :suggested_stop_point
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `suggestedStopPosition`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :suggested_stop_position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @harness_data = args[:harness_data] if args.key?(:harness_data)
          @hot_key_detection = args[:hot_key_detection] if args.key?(:hot_key_detection)
          @lease_expire_time = args[:lease_expire_time] if args.key?(:lease_expire_time)
          @metric_short_id = args[:metric_short_id] if args.key?(:metric_short_id)
          @next_report_index = args[:next_report_index] if args.key?(:next_report_index)
          @report_status_interval = args[:report_status_interval] if args.key?(:report_status_interval)
          @split_request = args[:split_request] if args.key?(:split_request)
          @suggested_stop_point = args[:suggested_stop_point] if args.key?(:suggested_stop_point)
          @suggested_stop_position = args[:suggested_stop_position] if args.key?(:suggested_stop_position)
        end
      end
      
      # Conveys a worker's progress through the work described by a WorkItem.
      class WorkItemStatus
        include Google::Apis::Core::Hashable
      
        # True if the WorkItem was completed (successfully or unsuccessfully).
        # Corresponds to the JSON property `completed`
        # @return [Boolean]
        attr_accessor :completed
        alias_method :completed?, :completed
      
        # Worker output counters for this WorkItem.
        # Corresponds to the JSON property `counterUpdates`
        # @return [Array<Google::Apis::DataflowV1b3::CounterUpdate>]
        attr_accessor :counter_updates
      
        # When a task splits using WorkItemStatus.dynamic_source_split, this
        # message describes the two parts of the split relative to the
        # description of the current task's input.
        # Corresponds to the JSON property `dynamicSourceSplit`
        # @return [Google::Apis::DataflowV1b3::DynamicSourceSplit]
        attr_accessor :dynamic_source_split
      
        # Specifies errors which occurred during processing.  If errors are
        # provided, and completed = true, then the WorkItem is considered
        # to have failed.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DataflowV1b3::Status>]
        attr_accessor :errors
      
        # DEPRECATED in favor of counter_updates.
        # Corresponds to the JSON property `metricUpdates`
        # @return [Array<Google::Apis::DataflowV1b3::MetricUpdate>]
        attr_accessor :metric_updates
      
        # Obsolete in favor of ApproximateReportedProgress and ApproximateSplitRequest.
        # Corresponds to the JSON property `progress`
        # @return [Google::Apis::DataflowV1b3::ApproximateProgress]
        attr_accessor :progress
      
        # The report index.  When a WorkItem is leased, the lease will
        # contain an initial report index.  When a WorkItem's status is
        # reported to the system, the report should be sent with
        # that report index, and the response will contain the index the
        # worker should use for the next report.  Reports received with
        # unexpected index values will be rejected by the service.
        # In order to preserve idempotency, the worker should not alter the
        # contents of a report, even if the worker must submit the same
        # report multiple times before getting back a response.  The worker
        # should not submit a subsequent report until the response for the
        # previous report had been received from the service.
        # Corresponds to the JSON property `reportIndex`
        # @return [Fixnum]
        attr_accessor :report_index
      
        # A progress measurement of a WorkItem by a worker.
        # Corresponds to the JSON property `reportedProgress`
        # @return [Google::Apis::DataflowV1b3::ApproximateReportedProgress]
        attr_accessor :reported_progress
      
        # Amount of time the worker requests for its lease.
        # Corresponds to the JSON property `requestedLeaseDuration`
        # @return [String]
        attr_accessor :requested_lease_duration
      
        # DEPRECATED in favor of DynamicSourceSplit.
        # Corresponds to the JSON property `sourceFork`
        # @return [Google::Apis::DataflowV1b3::SourceFork]
        attr_accessor :source_fork
      
        # The result of a SourceOperationRequest, specified in
        # ReportWorkItemStatusRequest.source_operation when the work item
        # is completed.
        # Corresponds to the JSON property `sourceOperationResponse`
        # @return [Google::Apis::DataflowV1b3::SourceOperationResponse]
        attr_accessor :source_operation_response
      
        # Position defines a position within a collection of data.  The value
        # can be either the end position, a key (used with ordered
        # collections), a byte offset, or a record index.
        # Corresponds to the JSON property `stopPosition`
        # @return [Google::Apis::DataflowV1b3::Position]
        attr_accessor :stop_position
      
        # Total time the worker spent being throttled by external systems.
        # Corresponds to the JSON property `totalThrottlerWaitTimeSeconds`
        # @return [Float]
        attr_accessor :total_throttler_wait_time_seconds
      
        # Identifies the WorkItem.
        # Corresponds to the JSON property `workItemId`
        # @return [String]
        attr_accessor :work_item_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completed = args[:completed] if args.key?(:completed)
          @counter_updates = args[:counter_updates] if args.key?(:counter_updates)
          @dynamic_source_split = args[:dynamic_source_split] if args.key?(:dynamic_source_split)
          @errors = args[:errors] if args.key?(:errors)
          @metric_updates = args[:metric_updates] if args.key?(:metric_updates)
          @progress = args[:progress] if args.key?(:progress)
          @report_index = args[:report_index] if args.key?(:report_index)
          @reported_progress = args[:reported_progress] if args.key?(:reported_progress)
          @requested_lease_duration = args[:requested_lease_duration] if args.key?(:requested_lease_duration)
          @source_fork = args[:source_fork] if args.key?(:source_fork)
          @source_operation_response = args[:source_operation_response] if args.key?(:source_operation_response)
          @stop_position = args[:stop_position] if args.key?(:stop_position)
          @total_throttler_wait_time_seconds = args[:total_throttler_wait_time_seconds] if args.key?(:total_throttler_wait_time_seconds)
          @work_item_id = args[:work_item_id] if args.key?(:work_item_id)
        end
      end
      
      # WorkerHealthReport contains information about the health of a worker.
      # The VM should be identified by the labels attached to the WorkerMessage that
      # this health ping belongs to.
      class WorkerHealthReport
        include Google::Apis::Core::Hashable
      
        # A message describing any unusual health reports.
        # Corresponds to the JSON property `msg`
        # @return [String]
        attr_accessor :msg
      
        # The pods running on the worker. See:
        # http://kubernetes.io/v1.1/docs/api-reference/v1/definitions.html#_v1_pod
        # This field is used by the worker to send the status of the indvidual
        # containers running on each worker.
        # Corresponds to the JSON property `pods`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :pods
      
        # The interval at which the worker is sending health reports.
        # The default value of 0 should be interpreted as the field is not being
        # explicitly set by the worker.
        # Corresponds to the JSON property `reportInterval`
        # @return [String]
        attr_accessor :report_interval
      
        # Whether the VM is in a permanently broken state.
        # Broken VMs should be abandoned or deleted ASAP to avoid assigning or
        # completing any work.
        # Corresponds to the JSON property `vmIsBroken`
        # @return [Boolean]
        attr_accessor :vm_is_broken
        alias_method :vm_is_broken?, :vm_is_broken
      
        # Whether the VM is currently healthy.
        # Corresponds to the JSON property `vmIsHealthy`
        # @return [Boolean]
        attr_accessor :vm_is_healthy
        alias_method :vm_is_healthy?, :vm_is_healthy
      
        # The time the VM was booted.
        # Corresponds to the JSON property `vmStartupTime`
        # @return [String]
        attr_accessor :vm_startup_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @msg = args[:msg] if args.key?(:msg)
          @pods = args[:pods] if args.key?(:pods)
          @report_interval = args[:report_interval] if args.key?(:report_interval)
          @vm_is_broken = args[:vm_is_broken] if args.key?(:vm_is_broken)
          @vm_is_healthy = args[:vm_is_healthy] if args.key?(:vm_is_healthy)
          @vm_startup_time = args[:vm_startup_time] if args.key?(:vm_startup_time)
        end
      end
      
      # WorkerHealthReportResponse contains information returned to the worker
      # in response to a health ping.
      class WorkerHealthReportResponse
        include Google::Apis::Core::Hashable
      
        # A positive value indicates the worker should change its reporting interval
        # to the specified value.
        # The default value of zero means no change in report rate is requested by
        # the server.
        # Corresponds to the JSON property `reportInterval`
        # @return [String]
        attr_accessor :report_interval
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @report_interval = args[:report_interval] if args.key?(:report_interval)
        end
      end
      
      # A report of an event in a worker's lifecycle.
      # The proto contains one event, because the worker is expected to
      # asynchronously send each message immediately after the event.
      # Due to this asynchrony, messages may arrive out of order (or missing), and it
      # is up to the consumer to interpret.
      # The timestamp of the event is in the enclosing WorkerMessage proto.
      class WorkerLifecycleEvent
        include Google::Apis::Core::Hashable
      
        # The start time of this container. All events will report this so that
        # events can be grouped together across container/VM restarts.
        # Corresponds to the JSON property `containerStartTime`
        # @return [String]
        attr_accessor :container_start_time
      
        # The event being reported.
        # Corresponds to the JSON property `event`
        # @return [String]
        attr_accessor :event
      
        # Other stats that can accompany an event. E.g.
        # ` "downloaded_bytes" : "123456" `
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_start_time = args[:container_start_time] if args.key?(:container_start_time)
          @event = args[:event] if args.key?(:event)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # WorkerMessage provides information to the backend about a worker.
      class WorkerMessage
        include Google::Apis::Core::Hashable
      
        # Labels are used to group WorkerMessages.
        # For example, a worker_message about a particular container
        # might have the labels:
        # ` "JOB_ID": "2015-04-22",
        # "WORKER_ID": "wordcount-vm-2015…"
        # "CONTAINER_TYPE": "worker",
        # "CONTAINER_ID": "ac1234def"`
        # Label tags typically correspond to Label enum values. However, for ease
        # of development other strings can be used as tags. LABEL_UNSPECIFIED should
        # not be used here.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The timestamp of the worker_message.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        # WorkerHealthReport contains information about the health of a worker.
        # The VM should be identified by the labels attached to the WorkerMessage that
        # this health ping belongs to.
        # Corresponds to the JSON property `workerHealthReport`
        # @return [Google::Apis::DataflowV1b3::WorkerHealthReport]
        attr_accessor :worker_health_report
      
        # A report of an event in a worker's lifecycle.
        # The proto contains one event, because the worker is expected to
        # asynchronously send each message immediately after the event.
        # Due to this asynchrony, messages may arrive out of order (or missing), and it
        # is up to the consumer to interpret.
        # The timestamp of the event is in the enclosing WorkerMessage proto.
        # Corresponds to the JSON property `workerLifecycleEvent`
        # @return [Google::Apis::DataflowV1b3::WorkerLifecycleEvent]
        attr_accessor :worker_lifecycle_event
      
        # A message code is used to report status and error messages to the service.
        # The message codes are intended to be machine readable. The service will
        # take care of translating these into user understandable messages if
        # necessary.
        # Example use cases:
        # 1. Worker processes reporting successful startup.
        # 2. Worker processes reporting specific errors (e.g. package staging
        # failure).
        # Corresponds to the JSON property `workerMessageCode`
        # @return [Google::Apis::DataflowV1b3::WorkerMessageCode]
        attr_accessor :worker_message_code
      
        # Worker metrics exported from workers. This contains resource utilization
        # metrics accumulated from a variety of sources. For more information, see
        # go/df-resource-signals.
        # Corresponds to the JSON property `workerMetrics`
        # @return [Google::Apis::DataflowV1b3::ResourceUtilizationReport]
        attr_accessor :worker_metrics
      
        # Shutdown notification from workers. This is to be sent by the shutdown
        # script of the worker VM so that the backend knows that the VM is being
        # shut down.
        # Corresponds to the JSON property `workerShutdownNotice`
        # @return [Google::Apis::DataflowV1b3::WorkerShutdownNotice]
        attr_accessor :worker_shutdown_notice
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @time = args[:time] if args.key?(:time)
          @worker_health_report = args[:worker_health_report] if args.key?(:worker_health_report)
          @worker_lifecycle_event = args[:worker_lifecycle_event] if args.key?(:worker_lifecycle_event)
          @worker_message_code = args[:worker_message_code] if args.key?(:worker_message_code)
          @worker_metrics = args[:worker_metrics] if args.key?(:worker_metrics)
          @worker_shutdown_notice = args[:worker_shutdown_notice] if args.key?(:worker_shutdown_notice)
        end
      end
      
      # A message code is used to report status and error messages to the service.
      # The message codes are intended to be machine readable. The service will
      # take care of translating these into user understandable messages if
      # necessary.
      # Example use cases:
      # 1. Worker processes reporting successful startup.
      # 2. Worker processes reporting specific errors (e.g. package staging
      # failure).
      class WorkerMessageCode
        include Google::Apis::Core::Hashable
      
        # The code is a string intended for consumption by a machine that identifies
        # the type of message being sent.
        # Examples:
        # 1. "HARNESS_STARTED" might be used to indicate the worker harness has
        # started.
        # 2. "GCS_DOWNLOAD_ERROR" might be used to indicate an error downloading
        # a GCS file as part of the boot process of one of the worker containers.
        # This is a string and not an enum to make it easy to add new codes without
        # waiting for an API change.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Parameters contains specific information about the code.
        # This is a struct to allow parameters of different types.
        # Examples:
        # 1. For a "HARNESS_STARTED" message parameters might provide the name
        # of the worker and additional data like timing information.
        # 2. For a "GCS_DOWNLOAD_ERROR" parameters might contain fields listing
        # the GCS objects being downloaded and fields containing errors.
        # In general complex data structures should be avoided. If a worker
        # needs to send a specific and complicated data structure then please
        # consider defining a new proto and adding it to the data oneof in
        # WorkerMessageResponse.
        # Conventions:
        # Parameters should only be used for information that isn't typically passed
        # as a label.
        # hostname and other worker identifiers should almost always be passed
        # as labels since they will be included on most messages.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # A worker_message response allows the server to pass information to the
      # sender.
      class WorkerMessageResponse
        include Google::Apis::Core::Hashable
      
        # WorkerHealthReportResponse contains information returned to the worker
        # in response to a health ping.
        # Corresponds to the JSON property `workerHealthReportResponse`
        # @return [Google::Apis::DataflowV1b3::WorkerHealthReportResponse]
        attr_accessor :worker_health_report_response
      
        # Service-side response to WorkerMessage reporting resource utilization.
        # Corresponds to the JSON property `workerMetricsResponse`
        # @return [Google::Apis::DataflowV1b3::ResourceUtilizationReportResponse]
        attr_accessor :worker_metrics_response
      
        # Service-side response to WorkerMessage issuing shutdown notice.
        # Corresponds to the JSON property `workerShutdownNoticeResponse`
        # @return [Google::Apis::DataflowV1b3::WorkerShutdownNoticeResponse]
        attr_accessor :worker_shutdown_notice_response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @worker_health_report_response = args[:worker_health_report_response] if args.key?(:worker_health_report_response)
          @worker_metrics_response = args[:worker_metrics_response] if args.key?(:worker_metrics_response)
          @worker_shutdown_notice_response = args[:worker_shutdown_notice_response] if args.key?(:worker_shutdown_notice_response)
        end
      end
      
      # Describes one particular pool of Cloud Dataflow workers to be
      # instantiated by the Cloud Dataflow service in order to perform the
      # computations required by a job.  Note that a workflow job may use
      # multiple pools, in order to match the various computational
      # requirements of the various stages of the job.
      class WorkerPool
        include Google::Apis::Core::Hashable
      
        # Settings for WorkerPool autoscaling.
        # Corresponds to the JSON property `autoscalingSettings`
        # @return [Google::Apis::DataflowV1b3::AutoscalingSettings]
        attr_accessor :autoscaling_settings
      
        # Data disks that are used by a VM in this workflow.
        # Corresponds to the JSON property `dataDisks`
        # @return [Array<Google::Apis::DataflowV1b3::Disk>]
        attr_accessor :data_disks
      
        # The default package set to install.  This allows the service to
        # select a default set of packages which are useful to worker
        # harnesses written in a particular language.
        # Corresponds to the JSON property `defaultPackageSet`
        # @return [String]
        attr_accessor :default_package_set
      
        # Size of root disk for VMs, in GB.  If zero or unspecified, the service will
        # attempt to choose a reasonable default.
        # Corresponds to the JSON property `diskSizeGb`
        # @return [Fixnum]
        attr_accessor :disk_size_gb
      
        # Fully qualified source image for disks.
        # Corresponds to the JSON property `diskSourceImage`
        # @return [String]
        attr_accessor :disk_source_image
      
        # Type of root disk for VMs.  If empty or unspecified, the service will
        # attempt to choose a reasonable default.
        # Corresponds to the JSON property `diskType`
        # @return [String]
        attr_accessor :disk_type
      
        # Configuration for VM IPs.
        # Corresponds to the JSON property `ipConfiguration`
        # @return [String]
        attr_accessor :ip_configuration
      
        # The kind of the worker pool; currently only `harness` and `shuffle`
        # are supported.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Machine type (e.g. "n1-standard-1").  If empty or unspecified, the
        # service will attempt to choose a reasonable default.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # Metadata to set on the Google Compute Engine VMs.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Network to which VMs will be assigned.  If empty or unspecified,
        # the service will use the network "default".
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # The number of threads per worker harness. If empty or unspecified, the
        # service will choose a number of threads (according to the number of cores
        # on the selected machine type for batch, or 1 by convention for streaming).
        # Corresponds to the JSON property `numThreadsPerWorker`
        # @return [Fixnum]
        attr_accessor :num_threads_per_worker
      
        # Number of Google Compute Engine workers in this pool needed to
        # execute the job.  If zero or unspecified, the service will
        # attempt to choose a reasonable default.
        # Corresponds to the JSON property `numWorkers`
        # @return [Fixnum]
        attr_accessor :num_workers
      
        # The action to take on host maintenance, as defined by the Google
        # Compute Engine API.
        # Corresponds to the JSON property `onHostMaintenance`
        # @return [String]
        attr_accessor :on_host_maintenance
      
        # Packages to be installed on workers.
        # Corresponds to the JSON property `packages`
        # @return [Array<Google::Apis::DataflowV1b3::Package>]
        attr_accessor :packages
      
        # Extra arguments for this worker pool.
        # Corresponds to the JSON property `poolArgs`
        # @return [Hash<String,Object>]
        attr_accessor :pool_args
      
        # Subnetwork to which VMs will be assigned, if desired.  Expected to be of
        # the form "regions/REGION/subnetworks/SUBNETWORK".
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        # Taskrunner configuration settings.
        # Corresponds to the JSON property `taskrunnerSettings`
        # @return [Google::Apis::DataflowV1b3::TaskRunnerSettings]
        attr_accessor :taskrunner_settings
      
        # Sets the policy for determining when to turndown worker pool.
        # Allowed values are: `TEARDOWN_ALWAYS`, `TEARDOWN_ON_SUCCESS`, and
        # `TEARDOWN_NEVER`.
        # `TEARDOWN_ALWAYS` means workers are always torn down regardless of whether
        # the job succeeds. `TEARDOWN_ON_SUCCESS` means workers are torn down
        # if the job succeeds. `TEARDOWN_NEVER` means the workers are never torn
        # down.
        # If the workers are not torn down by the service, they will
        # continue to run and use Google Compute Engine VM resources in the
        # user's project until they are explicitly terminated by the user.
        # Because of this, Google recommends using the `TEARDOWN_ALWAYS`
        # policy except for small, manually supervised test jobs.
        # If unknown or unspecified, the service will attempt to choose a reasonable
        # default.
        # Corresponds to the JSON property `teardownPolicy`
        # @return [String]
        attr_accessor :teardown_policy
      
        # Required. Docker container image that executes the Cloud Dataflow worker
        # harness, residing in Google Container Registry.
        # Corresponds to the JSON property `workerHarnessContainerImage`
        # @return [String]
        attr_accessor :worker_harness_container_image
      
        # Zone to run the worker pools in.  If empty or unspecified, the service
        # will attempt to choose a reasonable default.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoscaling_settings = args[:autoscaling_settings] if args.key?(:autoscaling_settings)
          @data_disks = args[:data_disks] if args.key?(:data_disks)
          @default_package_set = args[:default_package_set] if args.key?(:default_package_set)
          @disk_size_gb = args[:disk_size_gb] if args.key?(:disk_size_gb)
          @disk_source_image = args[:disk_source_image] if args.key?(:disk_source_image)
          @disk_type = args[:disk_type] if args.key?(:disk_type)
          @ip_configuration = args[:ip_configuration] if args.key?(:ip_configuration)
          @kind = args[:kind] if args.key?(:kind)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @metadata = args[:metadata] if args.key?(:metadata)
          @network = args[:network] if args.key?(:network)
          @num_threads_per_worker = args[:num_threads_per_worker] if args.key?(:num_threads_per_worker)
          @num_workers = args[:num_workers] if args.key?(:num_workers)
          @on_host_maintenance = args[:on_host_maintenance] if args.key?(:on_host_maintenance)
          @packages = args[:packages] if args.key?(:packages)
          @pool_args = args[:pool_args] if args.key?(:pool_args)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
          @taskrunner_settings = args[:taskrunner_settings] if args.key?(:taskrunner_settings)
          @teardown_policy = args[:teardown_policy] if args.key?(:teardown_policy)
          @worker_harness_container_image = args[:worker_harness_container_image] if args.key?(:worker_harness_container_image)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Provides data to pass through to the worker harness.
      class WorkerSettings
        include Google::Apis::Core::Hashable
      
        # The base URL for accessing Google Cloud APIs.
        # When workers access Google Cloud APIs, they logically do so via
        # relative URLs.  If this field is specified, it supplies the base
        # URL to use for resolving these relative URLs.  The normative
        # algorithm used is defined by RFC 1808, "Relative Uniform Resource
        # Locators".
        # If not specified, the default value is "http://www.googleapis.com/"
        # Corresponds to the JSON property `baseUrl`
        # @return [String]
        attr_accessor :base_url
      
        # Whether to send work progress updates to the service.
        # Corresponds to the JSON property `reportingEnabled`
        # @return [Boolean]
        attr_accessor :reporting_enabled
        alias_method :reporting_enabled?, :reporting_enabled
      
        # The Cloud Dataflow service path relative to the root URL, for example,
        # "dataflow/v1b3/projects".
        # Corresponds to the JSON property `servicePath`
        # @return [String]
        attr_accessor :service_path
      
        # The Shuffle service path relative to the root URL, for example,
        # "shuffle/v1beta1".
        # Corresponds to the JSON property `shuffleServicePath`
        # @return [String]
        attr_accessor :shuffle_service_path
      
        # The prefix of the resources the system should use for temporary
        # storage.
        # The supported resource type is:
        # Google Cloud Storage:
        # storage.googleapis.com/`bucket`/`object`
        # bucket.storage.googleapis.com/`object`
        # Corresponds to the JSON property `tempStoragePrefix`
        # @return [String]
        attr_accessor :temp_storage_prefix
      
        # The ID of the worker running this pipeline.
        # Corresponds to the JSON property `workerId`
        # @return [String]
        attr_accessor :worker_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_url = args[:base_url] if args.key?(:base_url)
          @reporting_enabled = args[:reporting_enabled] if args.key?(:reporting_enabled)
          @service_path = args[:service_path] if args.key?(:service_path)
          @shuffle_service_path = args[:shuffle_service_path] if args.key?(:shuffle_service_path)
          @temp_storage_prefix = args[:temp_storage_prefix] if args.key?(:temp_storage_prefix)
          @worker_id = args[:worker_id] if args.key?(:worker_id)
        end
      end
      
      # Shutdown notification from workers. This is to be sent by the shutdown
      # script of the worker VM so that the backend knows that the VM is being
      # shut down.
      class WorkerShutdownNotice
        include Google::Apis::Core::Hashable
      
        # The reason for the worker shutdown.
        # Current possible values are:
        # "UNKNOWN": shutdown reason is unknown.
        # "PREEMPTION": shutdown reason is preemption.
        # Other possible reasons may be added in the future.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # Service-side response to WorkerMessage issuing shutdown notice.
      class WorkerShutdownNoticeResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An instruction that writes records.
      # Takes one input, produces no outputs.
      class WriteInstruction
        include Google::Apis::Core::Hashable
      
        # An input of an instruction, as a reference to an output of a
        # producer instruction.
        # Corresponds to the JSON property `input`
        # @return [Google::Apis::DataflowV1b3::InstructionInput]
        attr_accessor :input
      
        # A sink that records can be encoded and written to.
        # Corresponds to the JSON property `sink`
        # @return [Google::Apis::DataflowV1b3::Sink]
        attr_accessor :sink
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @input = args[:input] if args.key?(:input)
          @sink = args[:sink] if args.key?(:sink)
        end
      end
    end
  end
end
