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
      
      class ApproximateProgress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApproximateReportedProgress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApproximateSplitRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigQueryIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BigTableIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CpuTime
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ComponentSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ComponentTransform
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ComputationTopology
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConcatPosition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CounterMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CounterStructuredName
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CounterStructuredNameAndMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CounterUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateJobFromTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomSourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DataDiskAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatastoreIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DerivedSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Disk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisplayData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DistributionUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicSourceSplit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Environment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecutionStageState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecutionStageSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FailedLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FlattenInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloatingPointList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloatingPointMean
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetDebugConfigRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetDebugConfigResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetTemplateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Histogram
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HotKeyDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstructionInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstructionOutput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IntegerGauge
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IntegerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IntegerMean
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobExecutionInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobExecutionStageInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyRangeDataDiskAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyRangeLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LaunchTemplateParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LaunchTemplateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaseWorkItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LeaseWorkItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobMessagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MapTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricShortId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricStructuredName
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MountedDataDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MultiOutputInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NameAndKind
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Package
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParDoInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParallelInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Parameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParameterMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartialGroupByKeyInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PipelineDescription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubSubIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubsubLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportWorkItemStatusRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportWorkItemStatusResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportedParallelism
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceUtilizationReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceUtilizationReportResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RuntimeEnvironment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SdkVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendDebugCaptureRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendDebugCaptureResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendWorkerMessagesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendWorkerMessagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SeqMapTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SeqMapTaskOutputInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShellTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SideInputInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Sink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceFork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceGetMetadataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceGetMetadataResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceOperationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceSplitOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceSplitRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceSplitResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceSplitShard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpannerIoDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SplitInt64
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StageSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StateFamilyConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Step
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingApplianceSnapshotConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingComputationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingComputationRanges
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingComputationTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingConfigTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingSetupTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingSideInputLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamingStageLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StringList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StructuredMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TaskRunnerSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TemplateMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TopologyConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransformSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ValidateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkItemServiceState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkItemStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerHealthReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerHealthReportResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerLifecycleEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerMessageCode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerMessageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerPool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerShutdownNotice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerShutdownNoticeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteInstruction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApproximateProgress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :percent_complete, as: 'percentComplete'
          property :position, as: 'position', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
          property :remaining_time, as: 'remainingTime'
        end
      end
      
      class ApproximateReportedProgress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumed_parallelism, as: 'consumedParallelism', class: Google::Apis::DataflowV1b3::ReportedParallelism, decorator: Google::Apis::DataflowV1b3::ReportedParallelism::Representation
      
          property :fraction_consumed, as: 'fractionConsumed'
          property :position, as: 'position', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
          property :remaining_parallelism, as: 'remainingParallelism', class: Google::Apis::DataflowV1b3::ReportedParallelism, decorator: Google::Apis::DataflowV1b3::ReportedParallelism::Representation
      
        end
      end
      
      class ApproximateSplitRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fraction_consumed, as: 'fractionConsumed'
          property :fraction_of_remainder, as: 'fractionOfRemainder'
          property :position, as: 'position', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
        end
      end
      
      class AutoscalingEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_num_workers, :numeric_string => true, as: 'currentNumWorkers'
          property :description, as: 'description', class: Google::Apis::DataflowV1b3::StructuredMessage, decorator: Google::Apis::DataflowV1b3::StructuredMessage::Representation
      
          property :event_type, as: 'eventType'
          property :target_num_workers, :numeric_string => true, as: 'targetNumWorkers'
          property :time, as: 'time'
          property :worker_pool, as: 'workerPool'
        end
      end
      
      class AutoscalingSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :algorithm, as: 'algorithm'
          property :max_num_workers, as: 'maxNumWorkers'
        end
      end
      
      class BigQueryIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset, as: 'dataset'
          property :project_id, as: 'projectId'
          property :query, as: 'query'
          property :table, as: 'table'
        end
      end
      
      class BigTableIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_id, as: 'instanceId'
          property :project_id, as: 'projectId'
          property :table_id, as: 'tableId'
        end
      end
      
      class CpuTime
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rate, as: 'rate'
          property :timestamp, as: 'timestamp'
          property :total_ms, :numeric_string => true, as: 'totalMs'
        end
      end
      
      class ComponentSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :original_transform_or_collection, as: 'originalTransformOrCollection'
          property :user_name, as: 'userName'
        end
      end
      
      class ComponentTransform
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :original_transform, as: 'originalTransform'
          property :user_name, as: 'userName'
        end
      end
      
      class ComputationTopology
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computation_id, as: 'computationId'
          collection :inputs, as: 'inputs', class: Google::Apis::DataflowV1b3::StreamLocation, decorator: Google::Apis::DataflowV1b3::StreamLocation::Representation
      
          collection :key_ranges, as: 'keyRanges', class: Google::Apis::DataflowV1b3::KeyRangeLocation, decorator: Google::Apis::DataflowV1b3::KeyRangeLocation::Representation
      
          collection :outputs, as: 'outputs', class: Google::Apis::DataflowV1b3::StreamLocation, decorator: Google::Apis::DataflowV1b3::StreamLocation::Representation
      
          collection :state_families, as: 'stateFamilies', class: Google::Apis::DataflowV1b3::StateFamilyConfig, decorator: Google::Apis::DataflowV1b3::StateFamilyConfig::Representation
      
          property :system_stage_name, as: 'systemStageName'
        end
      end
      
      class ConcatPosition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index, as: 'index'
          property :position, as: 'position', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
        end
      end
      
      class CounterMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :kind, as: 'kind'
          property :other_units, as: 'otherUnits'
          property :standard_units, as: 'standardUnits'
        end
      end
      
      class CounterStructuredName
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :component_step_name, as: 'componentStepName'
          property :execution_step_name, as: 'executionStepName'
          property :input_index, as: 'inputIndex'
          property :name, as: 'name'
          property :origin, as: 'origin'
          property :origin_namespace, as: 'originNamespace'
          property :original_requesting_step_name, as: 'originalRequestingStepName'
          property :original_step_name, as: 'originalStepName'
          property :portion, as: 'portion'
          property :worker_id, as: 'workerId'
        end
      end
      
      class CounterStructuredNameAndMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::DataflowV1b3::CounterMetadata, decorator: Google::Apis::DataflowV1b3::CounterMetadata::Representation
      
          property :name, as: 'name', class: Google::Apis::DataflowV1b3::CounterStructuredName, decorator: Google::Apis::DataflowV1b3::CounterStructuredName::Representation
      
        end
      end
      
      class CounterUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boolean, as: 'boolean'
          property :cumulative, as: 'cumulative'
          property :distribution, as: 'distribution', class: Google::Apis::DataflowV1b3::DistributionUpdate, decorator: Google::Apis::DataflowV1b3::DistributionUpdate::Representation
      
          property :floating_point, as: 'floatingPoint'
          property :floating_point_list, as: 'floatingPointList', class: Google::Apis::DataflowV1b3::FloatingPointList, decorator: Google::Apis::DataflowV1b3::FloatingPointList::Representation
      
          property :floating_point_mean, as: 'floatingPointMean', class: Google::Apis::DataflowV1b3::FloatingPointMean, decorator: Google::Apis::DataflowV1b3::FloatingPointMean::Representation
      
          property :integer, as: 'integer', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :integer_gauge, as: 'integerGauge', class: Google::Apis::DataflowV1b3::IntegerGauge, decorator: Google::Apis::DataflowV1b3::IntegerGauge::Representation
      
          property :integer_list, as: 'integerList', class: Google::Apis::DataflowV1b3::IntegerList, decorator: Google::Apis::DataflowV1b3::IntegerList::Representation
      
          property :integer_mean, as: 'integerMean', class: Google::Apis::DataflowV1b3::IntegerMean, decorator: Google::Apis::DataflowV1b3::IntegerMean::Representation
      
          property :internal, as: 'internal'
          property :name_and_kind, as: 'nameAndKind', class: Google::Apis::DataflowV1b3::NameAndKind, decorator: Google::Apis::DataflowV1b3::NameAndKind::Representation
      
          property :short_id, :numeric_string => true, as: 'shortId'
          property :string_list, as: 'stringList', class: Google::Apis::DataflowV1b3::StringList, decorator: Google::Apis::DataflowV1b3::StringList::Representation
      
          property :structured_name_and_metadata, as: 'structuredNameAndMetadata', class: Google::Apis::DataflowV1b3::CounterStructuredNameAndMetadata, decorator: Google::Apis::DataflowV1b3::CounterStructuredNameAndMetadata::Representation
      
        end
      end
      
      class CreateJobFromTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :environment, as: 'environment', class: Google::Apis::DataflowV1b3::RuntimeEnvironment, decorator: Google::Apis::DataflowV1b3::RuntimeEnvironment::Representation
      
          property :gcs_path, as: 'gcsPath'
          property :job_name, as: 'jobName'
          property :location, as: 'location'
          hash :parameters, as: 'parameters'
        end
      end
      
      class CustomSourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stateful, as: 'stateful'
        end
      end
      
      class DataDiskAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :data_disks, as: 'dataDisks'
          property :vm_instance, as: 'vmInstance'
        end
      end
      
      class DatastoreIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :namespace, as: 'namespace'
          property :project_id, as: 'projectId'
        end
      end
      
      class DerivedSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :derivation_mode, as: 'derivationMode'
          property :source, as: 'source', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
        end
      end
      
      class Disk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_type, as: 'diskType'
          property :mount_point, as: 'mountPoint'
          property :size_gb, as: 'sizeGb'
        end
      end
      
      class DisplayData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bool_value, as: 'boolValue'
          property :duration_value, as: 'durationValue'
          property :float_value, as: 'floatValue'
          property :int64_value, :numeric_string => true, as: 'int64Value'
          property :java_class_value, as: 'javaClassValue'
          property :key, as: 'key'
          property :label, as: 'label'
          property :namespace, as: 'namespace'
          property :short_str_value, as: 'shortStrValue'
          property :str_value, as: 'strValue'
          property :timestamp_value, as: 'timestampValue'
          property :url, as: 'url'
        end
      end
      
      class DistributionUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :histogram, as: 'histogram', class: Google::Apis::DataflowV1b3::Histogram, decorator: Google::Apis::DataflowV1b3::Histogram::Representation
      
          property :max, as: 'max', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :min, as: 'min', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :sum, as: 'sum', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :sum_of_squares, as: 'sumOfSquares'
        end
      end
      
      class DynamicSourceSplit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :primary, as: 'primary', class: Google::Apis::DataflowV1b3::DerivedSource, decorator: Google::Apis::DataflowV1b3::DerivedSource::Representation
      
          property :residual, as: 'residual', class: Google::Apis::DataflowV1b3::DerivedSource, decorator: Google::Apis::DataflowV1b3::DerivedSource::Representation
      
        end
      end
      
      class Environment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_manager_api_service, as: 'clusterManagerApiService'
          property :dataset, as: 'dataset'
          collection :experiments, as: 'experiments'
          property :flex_resource_scheduling_goal, as: 'flexResourceSchedulingGoal'
          hash :internal_experiments, as: 'internalExperiments'
          hash :sdk_pipeline_options, as: 'sdkPipelineOptions'
          property :service_account_email, as: 'serviceAccountEmail'
          property :service_kms_key_name, as: 'serviceKmsKeyName'
          property :temp_storage_prefix, as: 'tempStoragePrefix'
          hash :user_agent, as: 'userAgent'
          hash :version, as: 'version'
          collection :worker_pools, as: 'workerPools', class: Google::Apis::DataflowV1b3::WorkerPool, decorator: Google::Apis::DataflowV1b3::WorkerPool::Representation
      
          property :worker_region, as: 'workerRegion'
          property :worker_zone, as: 'workerZone'
        end
      end
      
      class ExecutionStageState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_state_time, as: 'currentStateTime'
          property :execution_stage_name, as: 'executionStageName'
          property :execution_stage_state, as: 'executionStageState'
        end
      end
      
      class ExecutionStageSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :component_source, as: 'componentSource', class: Google::Apis::DataflowV1b3::ComponentSource, decorator: Google::Apis::DataflowV1b3::ComponentSource::Representation
      
          collection :component_transform, as: 'componentTransform', class: Google::Apis::DataflowV1b3::ComponentTransform, decorator: Google::Apis::DataflowV1b3::ComponentTransform::Representation
      
          property :id, as: 'id'
          collection :input_source, as: 'inputSource', class: Google::Apis::DataflowV1b3::StageSource, decorator: Google::Apis::DataflowV1b3::StageSource::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :output_source, as: 'outputSource', class: Google::Apis::DataflowV1b3::StageSource, decorator: Google::Apis::DataflowV1b3::StageSource::Representation
      
        end
      end
      
      class FailedLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class FileIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_pattern, as: 'filePattern'
        end
      end
      
      class FlattenInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :inputs, as: 'inputs', class: Google::Apis::DataflowV1b3::InstructionInput, decorator: Google::Apis::DataflowV1b3::InstructionInput::Representation
      
        end
      end
      
      class FloatingPointList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :elements, as: 'elements'
        end
      end
      
      class FloatingPointMean
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :sum, as: 'sum'
        end
      end
      
      class GetDebugConfigRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :component_id, as: 'componentId'
          property :location, as: 'location'
          property :worker_id, as: 'workerId'
        end
      end
      
      class GetDebugConfigResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config'
        end
      end
      
      class GetTemplateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::DataflowV1b3::TemplateMetadata, decorator: Google::Apis::DataflowV1b3::TemplateMetadata::Representation
      
          property :status, as: 'status', class: Google::Apis::DataflowV1b3::Status, decorator: Google::Apis::DataflowV1b3::Status::Representation
      
        end
      end
      
      class Histogram
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bucket_counts, as: 'bucketCounts'
          property :first_bucket_offset, as: 'firstBucketOffset'
        end
      end
      
      class HotKeyDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hot_key_age, as: 'hotKeyAge'
          property :system_name, as: 'systemName'
          property :user_step_name, as: 'userStepName'
        end
      end
      
      class InstructionInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_num, as: 'outputNum'
          property :producer_instruction_index, as: 'producerInstructionIndex'
        end
      end
      
      class InstructionOutput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :codec, as: 'codec'
          property :name, as: 'name'
          property :only_count_key_bytes, as: 'onlyCountKeyBytes'
          property :only_count_value_bytes, as: 'onlyCountValueBytes'
          property :original_name, as: 'originalName'
          property :system_name, as: 'systemName'
        end
      end
      
      class IntegerGauge
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :timestamp, as: 'timestamp'
          property :value, as: 'value', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
        end
      end
      
      class IntegerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :elements, as: 'elements', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
        end
      end
      
      class IntegerMean
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
          property :sum, as: 'sum', class: Google::Apis::DataflowV1b3::SplitInt64, decorator: Google::Apis::DataflowV1b3::SplitInt64::Representation
      
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_request_id, as: 'clientRequestId'
          property :create_time, as: 'createTime'
          property :created_from_snapshot_id, as: 'createdFromSnapshotId'
          property :current_state, as: 'currentState'
          property :current_state_time, as: 'currentStateTime'
          property :environment, as: 'environment', class: Google::Apis::DataflowV1b3::Environment, decorator: Google::Apis::DataflowV1b3::Environment::Representation
      
          property :execution_info, as: 'executionInfo', class: Google::Apis::DataflowV1b3::JobExecutionInfo, decorator: Google::Apis::DataflowV1b3::JobExecutionInfo::Representation
      
          property :id, as: 'id'
          property :job_metadata, as: 'jobMetadata', class: Google::Apis::DataflowV1b3::JobMetadata, decorator: Google::Apis::DataflowV1b3::JobMetadata::Representation
      
          hash :labels, as: 'labels'
          property :location, as: 'location'
          property :name, as: 'name'
          property :pipeline_description, as: 'pipelineDescription', class: Google::Apis::DataflowV1b3::PipelineDescription, decorator: Google::Apis::DataflowV1b3::PipelineDescription::Representation
      
          property :project_id, as: 'projectId'
          property :replace_job_id, as: 'replaceJobId'
          property :replaced_by_job_id, as: 'replacedByJobId'
          property :requested_state, as: 'requestedState'
          collection :stage_states, as: 'stageStates', class: Google::Apis::DataflowV1b3::ExecutionStageState, decorator: Google::Apis::DataflowV1b3::ExecutionStageState::Representation
      
          property :start_time, as: 'startTime'
          collection :steps, as: 'steps', class: Google::Apis::DataflowV1b3::Step, decorator: Google::Apis::DataflowV1b3::Step::Representation
      
          property :steps_location, as: 'stepsLocation'
          collection :temp_files, as: 'tempFiles'
          hash :transform_name_mapping, as: 'transformNameMapping'
          property :type, as: 'type'
        end
      end
      
      class JobExecutionInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :stages, as: 'stages', class: Google::Apis::DataflowV1b3::JobExecutionStageInfo, decorator: Google::Apis::DataflowV1b3::JobExecutionStageInfo::Representation
      
        end
      end
      
      class JobExecutionStageInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :step_name, as: 'stepName'
        end
      end
      
      class JobMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :message_importance, as: 'messageImportance'
          property :message_text, as: 'messageText'
          property :time, as: 'time'
        end
      end
      
      class JobMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :big_table_details, as: 'bigTableDetails', class: Google::Apis::DataflowV1b3::BigTableIoDetails, decorator: Google::Apis::DataflowV1b3::BigTableIoDetails::Representation
      
          collection :bigquery_details, as: 'bigqueryDetails', class: Google::Apis::DataflowV1b3::BigQueryIoDetails, decorator: Google::Apis::DataflowV1b3::BigQueryIoDetails::Representation
      
          collection :datastore_details, as: 'datastoreDetails', class: Google::Apis::DataflowV1b3::DatastoreIoDetails, decorator: Google::Apis::DataflowV1b3::DatastoreIoDetails::Representation
      
          collection :file_details, as: 'fileDetails', class: Google::Apis::DataflowV1b3::FileIoDetails, decorator: Google::Apis::DataflowV1b3::FileIoDetails::Representation
      
          collection :pubsub_details, as: 'pubsubDetails', class: Google::Apis::DataflowV1b3::PubSubIoDetails, decorator: Google::Apis::DataflowV1b3::PubSubIoDetails::Representation
      
          property :sdk_version, as: 'sdkVersion', class: Google::Apis::DataflowV1b3::SdkVersion, decorator: Google::Apis::DataflowV1b3::SdkVersion::Representation
      
          collection :spanner_details, as: 'spannerDetails', class: Google::Apis::DataflowV1b3::SpannerIoDetails, decorator: Google::Apis::DataflowV1b3::SpannerIoDetails::Representation
      
        end
      end
      
      class JobMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metric_time, as: 'metricTime'
          collection :metrics, as: 'metrics', class: Google::Apis::DataflowV1b3::MetricUpdate, decorator: Google::Apis::DataflowV1b3::MetricUpdate::Representation
      
        end
      end
      
      class KeyRangeDataDiskAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_disk, as: 'dataDisk'
          property :end, as: 'end'
          property :start, as: 'start'
        end
      end
      
      class KeyRangeLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_disk, as: 'dataDisk'
          property :delivery_endpoint, as: 'deliveryEndpoint'
          property :deprecated_persistent_directory, as: 'deprecatedPersistentDirectory'
          property :end, as: 'end'
          property :start, as: 'start'
        end
      end
      
      class LaunchTemplateParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :environment, as: 'environment', class: Google::Apis::DataflowV1b3::RuntimeEnvironment, decorator: Google::Apis::DataflowV1b3::RuntimeEnvironment::Representation
      
          property :job_name, as: 'jobName'
          hash :parameters, as: 'parameters'
          hash :transform_name_mapping, as: 'transformNameMapping'
          property :update, as: 'update'
        end
      end
      
      class LaunchTemplateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job, as: 'job', class: Google::Apis::DataflowV1b3::Job, decorator: Google::Apis::DataflowV1b3::Job::Representation
      
        end
      end
      
      class LeaseWorkItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_worker_time, as: 'currentWorkerTime'
          property :location, as: 'location'
          property :requested_lease_duration, as: 'requestedLeaseDuration'
          hash :unified_worker_request, as: 'unifiedWorkerRequest'
          collection :work_item_types, as: 'workItemTypes'
          collection :worker_capabilities, as: 'workerCapabilities'
          property :worker_id, as: 'workerId'
        end
      end
      
      class LeaseWorkItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :unified_worker_response, as: 'unifiedWorkerResponse'
          collection :work_items, as: 'workItems', class: Google::Apis::DataflowV1b3::WorkItem, decorator: Google::Apis::DataflowV1b3::WorkItem::Representation
      
        end
      end
      
      class ListJobMessagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :autoscaling_events, as: 'autoscalingEvents', class: Google::Apis::DataflowV1b3::AutoscalingEvent, decorator: Google::Apis::DataflowV1b3::AutoscalingEvent::Representation
      
          collection :job_messages, as: 'jobMessages', class: Google::Apis::DataflowV1b3::JobMessage, decorator: Google::Apis::DataflowV1b3::JobMessage::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :failed_location, as: 'failedLocation', class: Google::Apis::DataflowV1b3::FailedLocation, decorator: Google::Apis::DataflowV1b3::FailedLocation::Representation
      
          collection :jobs, as: 'jobs', class: Google::Apis::DataflowV1b3::Job, decorator: Google::Apis::DataflowV1b3::Job::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class MapTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :counter_prefix, as: 'counterPrefix'
          collection :instructions, as: 'instructions', class: Google::Apis::DataflowV1b3::ParallelInstruction, decorator: Google::Apis::DataflowV1b3::ParallelInstruction::Representation
      
          property :stage_name, as: 'stageName'
          property :system_name, as: 'systemName'
        end
      end
      
      class MetricShortId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metric_index, as: 'metricIndex'
          property :short_id, :numeric_string => true, as: 'shortId'
        end
      end
      
      class MetricStructuredName
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :context, as: 'context'
          property :name, as: 'name'
          property :origin, as: 'origin'
        end
      end
      
      class MetricUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cumulative, as: 'cumulative'
          property :distribution, as: 'distribution'
          property :gauge, as: 'gauge'
          property :internal, as: 'internal'
          property :kind, as: 'kind'
          property :mean_count, as: 'meanCount'
          property :mean_sum, as: 'meanSum'
          property :name, as: 'name', class: Google::Apis::DataflowV1b3::MetricStructuredName, decorator: Google::Apis::DataflowV1b3::MetricStructuredName::Representation
      
          property :scalar, as: 'scalar'
          property :set, as: 'set'
          property :update_time, as: 'updateTime'
        end
      end
      
      class MountedDataDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_disk, as: 'dataDisk'
        end
      end
      
      class MultiOutputInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :tag, as: 'tag'
        end
      end
      
      class NameAndKind
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Package
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location'
          property :name, as: 'name'
        end
      end
      
      class ParDoInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input, as: 'input', class: Google::Apis::DataflowV1b3::InstructionInput, decorator: Google::Apis::DataflowV1b3::InstructionInput::Representation
      
          collection :multi_output_infos, as: 'multiOutputInfos', class: Google::Apis::DataflowV1b3::MultiOutputInfo, decorator: Google::Apis::DataflowV1b3::MultiOutputInfo::Representation
      
          property :num_outputs, as: 'numOutputs'
          collection :side_inputs, as: 'sideInputs', class: Google::Apis::DataflowV1b3::SideInputInfo, decorator: Google::Apis::DataflowV1b3::SideInputInfo::Representation
      
          hash :user_fn, as: 'userFn'
        end
      end
      
      class ParallelInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :flatten, as: 'flatten', class: Google::Apis::DataflowV1b3::FlattenInstruction, decorator: Google::Apis::DataflowV1b3::FlattenInstruction::Representation
      
          property :name, as: 'name'
          property :original_name, as: 'originalName'
          collection :outputs, as: 'outputs', class: Google::Apis::DataflowV1b3::InstructionOutput, decorator: Google::Apis::DataflowV1b3::InstructionOutput::Representation
      
          property :par_do, as: 'parDo', class: Google::Apis::DataflowV1b3::ParDoInstruction, decorator: Google::Apis::DataflowV1b3::ParDoInstruction::Representation
      
          property :partial_group_by_key, as: 'partialGroupByKey', class: Google::Apis::DataflowV1b3::PartialGroupByKeyInstruction, decorator: Google::Apis::DataflowV1b3::PartialGroupByKeyInstruction::Representation
      
          property :read, as: 'read', class: Google::Apis::DataflowV1b3::ReadInstruction, decorator: Google::Apis::DataflowV1b3::ReadInstruction::Representation
      
          property :system_name, as: 'systemName'
          property :write, as: 'write', class: Google::Apis::DataflowV1b3::WriteInstruction, decorator: Google::Apis::DataflowV1b3::WriteInstruction::Representation
      
        end
      end
      
      class Parameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class ParameterMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :help_text, as: 'helpText'
          property :is_optional, as: 'isOptional'
          property :label, as: 'label'
          property :name, as: 'name'
          collection :regexes, as: 'regexes'
        end
      end
      
      class PartialGroupByKeyInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input, as: 'input', class: Google::Apis::DataflowV1b3::InstructionInput, decorator: Google::Apis::DataflowV1b3::InstructionInput::Representation
      
          hash :input_element_codec, as: 'inputElementCodec'
          property :original_combine_values_input_store_name, as: 'originalCombineValuesInputStoreName'
          property :original_combine_values_step_name, as: 'originalCombineValuesStepName'
          collection :side_inputs, as: 'sideInputs', class: Google::Apis::DataflowV1b3::SideInputInfo, decorator: Google::Apis::DataflowV1b3::SideInputInfo::Representation
      
          hash :value_combining_fn, as: 'valueCombiningFn'
        end
      end
      
      class PipelineDescription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :display_data, as: 'displayData', class: Google::Apis::DataflowV1b3::DisplayData, decorator: Google::Apis::DataflowV1b3::DisplayData::Representation
      
          collection :execution_pipeline_stage, as: 'executionPipelineStage', class: Google::Apis::DataflowV1b3::ExecutionStageSummary, decorator: Google::Apis::DataflowV1b3::ExecutionStageSummary::Representation
      
          collection :original_pipeline_transform, as: 'originalPipelineTransform', class: Google::Apis::DataflowV1b3::TransformSummary, decorator: Google::Apis::DataflowV1b3::TransformSummary::Representation
      
        end
      end
      
      class Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :byte_offset, :numeric_string => true, as: 'byteOffset'
          property :concat_position, as: 'concatPosition', class: Google::Apis::DataflowV1b3::ConcatPosition, decorator: Google::Apis::DataflowV1b3::ConcatPosition::Representation
      
          property :end, as: 'end'
          property :key, as: 'key'
          property :record_index, :numeric_string => true, as: 'recordIndex'
          property :shuffle_position, as: 'shufflePosition'
        end
      end
      
      class PubSubIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :subscription, as: 'subscription'
          property :topic, as: 'topic'
        end
      end
      
      class PubsubLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drop_late_data, as: 'dropLateData'
          property :id_label, as: 'idLabel'
          property :subscription, as: 'subscription'
          property :timestamp_label, as: 'timestampLabel'
          property :topic, as: 'topic'
          property :tracking_subscription, as: 'trackingSubscription'
          property :with_attributes, as: 'withAttributes'
        end
      end
      
      class ReadInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source, as: 'source', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
        end
      end
      
      class ReportWorkItemStatusRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_worker_time, as: 'currentWorkerTime'
          property :location, as: 'location'
          hash :unified_worker_request, as: 'unifiedWorkerRequest'
          collection :work_item_statuses, as: 'workItemStatuses', class: Google::Apis::DataflowV1b3::WorkItemStatus, decorator: Google::Apis::DataflowV1b3::WorkItemStatus::Representation
      
          property :worker_id, as: 'workerId'
        end
      end
      
      class ReportWorkItemStatusResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :unified_worker_response, as: 'unifiedWorkerResponse'
          collection :work_item_service_states, as: 'workItemServiceStates', class: Google::Apis::DataflowV1b3::WorkItemServiceState, decorator: Google::Apis::DataflowV1b3::WorkItemServiceState::Representation
      
        end
      end
      
      class ReportedParallelism
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_infinite, as: 'isInfinite'
          property :value, as: 'value'
        end
      end
      
      class ResourceUtilizationReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cpu_time, as: 'cpuTime', class: Google::Apis::DataflowV1b3::CpuTime, decorator: Google::Apis::DataflowV1b3::CpuTime::Representation
      
        end
      end
      
      class ResourceUtilizationReportResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RuntimeEnvironment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_experiments, as: 'additionalExperiments'
          hash :additional_user_labels, as: 'additionalUserLabels'
          property :bypass_temp_dir_validation, as: 'bypassTempDirValidation'
          property :ip_configuration, as: 'ipConfiguration'
          property :kms_key_name, as: 'kmsKeyName'
          property :machine_type, as: 'machineType'
          property :max_workers, as: 'maxWorkers'
          property :network, as: 'network'
          property :num_workers, as: 'numWorkers'
          property :service_account_email, as: 'serviceAccountEmail'
          property :subnetwork, as: 'subnetwork'
          property :temp_location, as: 'tempLocation'
          property :worker_region, as: 'workerRegion'
          property :worker_zone, as: 'workerZone'
          property :zone, as: 'zone'
        end
      end
      
      class SdkVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sdk_support_status, as: 'sdkSupportStatus'
          property :version, as: 'version'
          property :version_display_name, as: 'versionDisplayName'
        end
      end
      
      class SendDebugCaptureRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :component_id, as: 'componentId'
          property :data, as: 'data'
          property :location, as: 'location'
          property :worker_id, as: 'workerId'
        end
      end
      
      class SendDebugCaptureResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SendWorkerMessagesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location'
          collection :worker_messages, as: 'workerMessages', class: Google::Apis::DataflowV1b3::WorkerMessage, decorator: Google::Apis::DataflowV1b3::WorkerMessage::Representation
      
        end
      end
      
      class SendWorkerMessagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :worker_message_responses, as: 'workerMessageResponses', class: Google::Apis::DataflowV1b3::WorkerMessageResponse, decorator: Google::Apis::DataflowV1b3::WorkerMessageResponse::Representation
      
        end
      end
      
      class SeqMapTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :inputs, as: 'inputs', class: Google::Apis::DataflowV1b3::SideInputInfo, decorator: Google::Apis::DataflowV1b3::SideInputInfo::Representation
      
          property :name, as: 'name'
          collection :output_infos, as: 'outputInfos', class: Google::Apis::DataflowV1b3::SeqMapTaskOutputInfo, decorator: Google::Apis::DataflowV1b3::SeqMapTaskOutputInfo::Representation
      
          property :stage_name, as: 'stageName'
          property :system_name, as: 'systemName'
          hash :user_fn, as: 'userFn'
        end
      end
      
      class SeqMapTaskOutputInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sink, as: 'sink', class: Google::Apis::DataflowV1b3::Sink, decorator: Google::Apis::DataflowV1b3::Sink::Representation
      
          property :tag, as: 'tag'
        end
      end
      
      class ShellTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :command, as: 'command'
          property :exit_code, as: 'exitCode'
        end
      end
      
      class SideInputInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :kind, as: 'kind'
          collection :sources, as: 'sources', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
          property :tag, as: 'tag'
        end
      end
      
      class Sink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :codec, as: 'codec'
          hash :spec, as: 'spec'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :base_specs, as: 'baseSpecs'
          hash :codec, as: 'codec'
          property :does_not_need_splitting, as: 'doesNotNeedSplitting'
          property :metadata, as: 'metadata', class: Google::Apis::DataflowV1b3::SourceMetadata, decorator: Google::Apis::DataflowV1b3::SourceMetadata::Representation
      
          hash :spec, as: 'spec'
        end
      end
      
      class SourceFork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :primary, as: 'primary', class: Google::Apis::DataflowV1b3::SourceSplitShard, decorator: Google::Apis::DataflowV1b3::SourceSplitShard::Representation
      
          property :primary_source, as: 'primarySource', class: Google::Apis::DataflowV1b3::DerivedSource, decorator: Google::Apis::DataflowV1b3::DerivedSource::Representation
      
          property :residual, as: 'residual', class: Google::Apis::DataflowV1b3::SourceSplitShard, decorator: Google::Apis::DataflowV1b3::SourceSplitShard::Representation
      
          property :residual_source, as: 'residualSource', class: Google::Apis::DataflowV1b3::DerivedSource, decorator: Google::Apis::DataflowV1b3::DerivedSource::Representation
      
        end
      end
      
      class SourceGetMetadataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source, as: 'source', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
        end
      end
      
      class SourceGetMetadataResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::DataflowV1b3::SourceMetadata, decorator: Google::Apis::DataflowV1b3::SourceMetadata::Representation
      
        end
      end
      
      class SourceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :estimated_size_bytes, :numeric_string => true, as: 'estimatedSizeBytes'
          property :infinite, as: 'infinite'
          property :produces_sorted_keys, as: 'producesSortedKeys'
        end
      end
      
      class SourceOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :get_metadata, as: 'getMetadata', class: Google::Apis::DataflowV1b3::SourceGetMetadataRequest, decorator: Google::Apis::DataflowV1b3::SourceGetMetadataRequest::Representation
      
          property :name, as: 'name'
          property :original_name, as: 'originalName'
          property :split, as: 'split', class: Google::Apis::DataflowV1b3::SourceSplitRequest, decorator: Google::Apis::DataflowV1b3::SourceSplitRequest::Representation
      
          property :stage_name, as: 'stageName'
          property :system_name, as: 'systemName'
        end
      end
      
      class SourceOperationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :get_metadata, as: 'getMetadata', class: Google::Apis::DataflowV1b3::SourceGetMetadataResponse, decorator: Google::Apis::DataflowV1b3::SourceGetMetadataResponse::Representation
      
          property :split, as: 'split', class: Google::Apis::DataflowV1b3::SourceSplitResponse, decorator: Google::Apis::DataflowV1b3::SourceSplitResponse::Representation
      
        end
      end
      
      class SourceSplitOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :desired_bundle_size_bytes, :numeric_string => true, as: 'desiredBundleSizeBytes'
          property :desired_shard_size_bytes, :numeric_string => true, as: 'desiredShardSizeBytes'
        end
      end
      
      class SourceSplitRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::DataflowV1b3::SourceSplitOptions, decorator: Google::Apis::DataflowV1b3::SourceSplitOptions::Representation
      
          property :source, as: 'source', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
        end
      end
      
      class SourceSplitResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bundles, as: 'bundles', class: Google::Apis::DataflowV1b3::DerivedSource, decorator: Google::Apis::DataflowV1b3::DerivedSource::Representation
      
          property :outcome, as: 'outcome'
          collection :shards, as: 'shards', class: Google::Apis::DataflowV1b3::SourceSplitShard, decorator: Google::Apis::DataflowV1b3::SourceSplitShard::Representation
      
        end
      end
      
      class SourceSplitShard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :derivation_mode, as: 'derivationMode'
          property :source, as: 'source', class: Google::Apis::DataflowV1b3::Source, decorator: Google::Apis::DataflowV1b3::Source::Representation
      
        end
      end
      
      class SpannerIoDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :database_id, as: 'databaseId'
          property :instance_id, as: 'instanceId'
          property :project_id, as: 'projectId'
        end
      end
      
      class SplitInt64
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :high_bits, as: 'highBits'
          property :low_bits, as: 'lowBits'
        end
      end
      
      class StageSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :original_transform_or_collection, as: 'originalTransformOrCollection'
          property :size_bytes, :numeric_string => true, as: 'sizeBytes'
          property :user_name, as: 'userName'
        end
      end
      
      class StateFamilyConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_read, as: 'isRead'
          property :state_family, as: 'stateFamily'
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
      
      class Step
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
          hash :properties, as: 'properties'
        end
      end
      
      class StreamLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_source_location, as: 'customSourceLocation', class: Google::Apis::DataflowV1b3::CustomSourceLocation, decorator: Google::Apis::DataflowV1b3::CustomSourceLocation::Representation
      
          property :pubsub_location, as: 'pubsubLocation', class: Google::Apis::DataflowV1b3::PubsubLocation, decorator: Google::Apis::DataflowV1b3::PubsubLocation::Representation
      
          property :side_input_location, as: 'sideInputLocation', class: Google::Apis::DataflowV1b3::StreamingSideInputLocation, decorator: Google::Apis::DataflowV1b3::StreamingSideInputLocation::Representation
      
          property :streaming_stage_location, as: 'streamingStageLocation', class: Google::Apis::DataflowV1b3::StreamingStageLocation, decorator: Google::Apis::DataflowV1b3::StreamingStageLocation::Representation
      
        end
      end
      
      class StreamingApplianceSnapshotConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :import_state_endpoint, as: 'importStateEndpoint'
          property :snapshot_id, as: 'snapshotId'
        end
      end
      
      class StreamingComputationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computation_id, as: 'computationId'
          collection :instructions, as: 'instructions', class: Google::Apis::DataflowV1b3::ParallelInstruction, decorator: Google::Apis::DataflowV1b3::ParallelInstruction::Representation
      
          property :stage_name, as: 'stageName'
          property :system_name, as: 'systemName'
          hash :transform_user_name_to_state_family, as: 'transformUserNameToStateFamily'
        end
      end
      
      class StreamingComputationRanges
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computation_id, as: 'computationId'
          collection :range_assignments, as: 'rangeAssignments', class: Google::Apis::DataflowV1b3::KeyRangeDataDiskAssignment, decorator: Google::Apis::DataflowV1b3::KeyRangeDataDiskAssignment::Representation
      
        end
      end
      
      class StreamingComputationTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :computation_ranges, as: 'computationRanges', class: Google::Apis::DataflowV1b3::StreamingComputationRanges, decorator: Google::Apis::DataflowV1b3::StreamingComputationRanges::Representation
      
          collection :data_disks, as: 'dataDisks', class: Google::Apis::DataflowV1b3::MountedDataDisk, decorator: Google::Apis::DataflowV1b3::MountedDataDisk::Representation
      
          property :task_type, as: 'taskType'
        end
      end
      
      class StreamingConfigTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commit_stream_chunk_size_bytes, :numeric_string => true, as: 'commitStreamChunkSizeBytes'
          property :get_data_stream_chunk_size_bytes, :numeric_string => true, as: 'getDataStreamChunkSizeBytes'
          property :max_work_item_commit_bytes, :numeric_string => true, as: 'maxWorkItemCommitBytes'
          collection :streaming_computation_configs, as: 'streamingComputationConfigs', class: Google::Apis::DataflowV1b3::StreamingComputationConfig, decorator: Google::Apis::DataflowV1b3::StreamingComputationConfig::Representation
      
          hash :user_step_to_state_family_name_map, as: 'userStepToStateFamilyNameMap'
          property :windmill_service_endpoint, as: 'windmillServiceEndpoint'
          property :windmill_service_port, :numeric_string => true, as: 'windmillServicePort'
        end
      end
      
      class StreamingSetupTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drain, as: 'drain'
          property :receive_work_port, as: 'receiveWorkPort'
          property :snapshot_config, as: 'snapshotConfig', class: Google::Apis::DataflowV1b3::StreamingApplianceSnapshotConfig, decorator: Google::Apis::DataflowV1b3::StreamingApplianceSnapshotConfig::Representation
      
          property :streaming_computation_topology, as: 'streamingComputationTopology', class: Google::Apis::DataflowV1b3::TopologyConfig, decorator: Google::Apis::DataflowV1b3::TopologyConfig::Representation
      
          property :worker_harness_port, as: 'workerHarnessPort'
        end
      end
      
      class StreamingSideInputLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state_family, as: 'stateFamily'
          property :tag, as: 'tag'
        end
      end
      
      class StreamingStageLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stream_id, as: 'streamId'
        end
      end
      
      class StringList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :elements, as: 'elements'
        end
      end
      
      class StructuredMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message_key, as: 'messageKey'
          property :message_text, as: 'messageText'
          collection :parameters, as: 'parameters', class: Google::Apis::DataflowV1b3::Parameter, decorator: Google::Apis::DataflowV1b3::Parameter::Representation
      
        end
      end
      
      class TaskRunnerSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alsologtostderr, as: 'alsologtostderr'
          property :base_task_dir, as: 'baseTaskDir'
          property :base_url, as: 'baseUrl'
          property :commandlines_file_name, as: 'commandlinesFileName'
          property :continue_on_exception, as: 'continueOnException'
          property :dataflow_api_version, as: 'dataflowApiVersion'
          property :harness_command, as: 'harnessCommand'
          property :language_hint, as: 'languageHint'
          property :log_dir, as: 'logDir'
          property :log_to_serialconsole, as: 'logToSerialconsole'
          property :log_upload_location, as: 'logUploadLocation'
          collection :oauth_scopes, as: 'oauthScopes'
          property :parallel_worker_settings, as: 'parallelWorkerSettings', class: Google::Apis::DataflowV1b3::WorkerSettings, decorator: Google::Apis::DataflowV1b3::WorkerSettings::Representation
      
          property :streaming_worker_main_class, as: 'streamingWorkerMainClass'
          property :task_group, as: 'taskGroup'
          property :task_user, as: 'taskUser'
          property :temp_storage_prefix, as: 'tempStoragePrefix'
          property :vm_id, as: 'vmId'
          property :workflow_file_name, as: 'workflowFileName'
        end
      end
      
      class TemplateMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :name, as: 'name'
          collection :parameters, as: 'parameters', class: Google::Apis::DataflowV1b3::ParameterMetadata, decorator: Google::Apis::DataflowV1b3::ParameterMetadata::Representation
      
        end
      end
      
      class TopologyConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :computations, as: 'computations', class: Google::Apis::DataflowV1b3::ComputationTopology, decorator: Google::Apis::DataflowV1b3::ComputationTopology::Representation
      
          collection :data_disk_assignments, as: 'dataDiskAssignments', class: Google::Apis::DataflowV1b3::DataDiskAssignment, decorator: Google::Apis::DataflowV1b3::DataDiskAssignment::Representation
      
          property :forwarding_key_bits, as: 'forwardingKeyBits'
          property :persistent_state_version, as: 'persistentStateVersion'
          hash :user_stage_to_computation_name_map, as: 'userStageToComputationNameMap'
        end
      end
      
      class TransformSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :display_data, as: 'displayData', class: Google::Apis::DataflowV1b3::DisplayData, decorator: Google::Apis::DataflowV1b3::DisplayData::Representation
      
          property :id, as: 'id'
          collection :input_collection_name, as: 'inputCollectionName'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :output_collection_name, as: 'outputCollectionName'
        end
      end
      
      class ValidateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message, as: 'errorMessage'
        end
      end
      
      class WorkItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration'
          property :id, :numeric_string => true, as: 'id'
          property :initial_report_index, :numeric_string => true, as: 'initialReportIndex'
          property :job_id, as: 'jobId'
          property :lease_expire_time, as: 'leaseExpireTime'
          property :map_task, as: 'mapTask', class: Google::Apis::DataflowV1b3::MapTask, decorator: Google::Apis::DataflowV1b3::MapTask::Representation
      
          collection :packages, as: 'packages', class: Google::Apis::DataflowV1b3::Package, decorator: Google::Apis::DataflowV1b3::Package::Representation
      
          property :project_id, as: 'projectId'
          property :report_status_interval, as: 'reportStatusInterval'
          property :seq_map_task, as: 'seqMapTask', class: Google::Apis::DataflowV1b3::SeqMapTask, decorator: Google::Apis::DataflowV1b3::SeqMapTask::Representation
      
          property :shell_task, as: 'shellTask', class: Google::Apis::DataflowV1b3::ShellTask, decorator: Google::Apis::DataflowV1b3::ShellTask::Representation
      
          property :source_operation_task, as: 'sourceOperationTask', class: Google::Apis::DataflowV1b3::SourceOperationRequest, decorator: Google::Apis::DataflowV1b3::SourceOperationRequest::Representation
      
          property :streaming_computation_task, as: 'streamingComputationTask', class: Google::Apis::DataflowV1b3::StreamingComputationTask, decorator: Google::Apis::DataflowV1b3::StreamingComputationTask::Representation
      
          property :streaming_config_task, as: 'streamingConfigTask', class: Google::Apis::DataflowV1b3::StreamingConfigTask, decorator: Google::Apis::DataflowV1b3::StreamingConfigTask::Representation
      
          property :streaming_setup_task, as: 'streamingSetupTask', class: Google::Apis::DataflowV1b3::StreamingSetupTask, decorator: Google::Apis::DataflowV1b3::StreamingSetupTask::Representation
      
        end
      end
      
      class WorkItemServiceState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :harness_data, as: 'harnessData'
          property :hot_key_detection, as: 'hotKeyDetection', class: Google::Apis::DataflowV1b3::HotKeyDetection, decorator: Google::Apis::DataflowV1b3::HotKeyDetection::Representation
      
          property :lease_expire_time, as: 'leaseExpireTime'
          collection :metric_short_id, as: 'metricShortId', class: Google::Apis::DataflowV1b3::MetricShortId, decorator: Google::Apis::DataflowV1b3::MetricShortId::Representation
      
          property :next_report_index, :numeric_string => true, as: 'nextReportIndex'
          property :report_status_interval, as: 'reportStatusInterval'
          property :split_request, as: 'splitRequest', class: Google::Apis::DataflowV1b3::ApproximateSplitRequest, decorator: Google::Apis::DataflowV1b3::ApproximateSplitRequest::Representation
      
          property :suggested_stop_point, as: 'suggestedStopPoint', class: Google::Apis::DataflowV1b3::ApproximateProgress, decorator: Google::Apis::DataflowV1b3::ApproximateProgress::Representation
      
          property :suggested_stop_position, as: 'suggestedStopPosition', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
        end
      end
      
      class WorkItemStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :completed, as: 'completed'
          collection :counter_updates, as: 'counterUpdates', class: Google::Apis::DataflowV1b3::CounterUpdate, decorator: Google::Apis::DataflowV1b3::CounterUpdate::Representation
      
          property :dynamic_source_split, as: 'dynamicSourceSplit', class: Google::Apis::DataflowV1b3::DynamicSourceSplit, decorator: Google::Apis::DataflowV1b3::DynamicSourceSplit::Representation
      
          collection :errors, as: 'errors', class: Google::Apis::DataflowV1b3::Status, decorator: Google::Apis::DataflowV1b3::Status::Representation
      
          collection :metric_updates, as: 'metricUpdates', class: Google::Apis::DataflowV1b3::MetricUpdate, decorator: Google::Apis::DataflowV1b3::MetricUpdate::Representation
      
          property :progress, as: 'progress', class: Google::Apis::DataflowV1b3::ApproximateProgress, decorator: Google::Apis::DataflowV1b3::ApproximateProgress::Representation
      
          property :report_index, :numeric_string => true, as: 'reportIndex'
          property :reported_progress, as: 'reportedProgress', class: Google::Apis::DataflowV1b3::ApproximateReportedProgress, decorator: Google::Apis::DataflowV1b3::ApproximateReportedProgress::Representation
      
          property :requested_lease_duration, as: 'requestedLeaseDuration'
          property :source_fork, as: 'sourceFork', class: Google::Apis::DataflowV1b3::SourceFork, decorator: Google::Apis::DataflowV1b3::SourceFork::Representation
      
          property :source_operation_response, as: 'sourceOperationResponse', class: Google::Apis::DataflowV1b3::SourceOperationResponse, decorator: Google::Apis::DataflowV1b3::SourceOperationResponse::Representation
      
          property :stop_position, as: 'stopPosition', class: Google::Apis::DataflowV1b3::Position, decorator: Google::Apis::DataflowV1b3::Position::Representation
      
          property :total_throttler_wait_time_seconds, as: 'totalThrottlerWaitTimeSeconds'
          property :work_item_id, as: 'workItemId'
        end
      end
      
      class WorkerHealthReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :msg, as: 'msg'
          collection :pods, as: 'pods'
          property :report_interval, as: 'reportInterval'
          property :vm_is_broken, as: 'vmIsBroken'
          property :vm_is_healthy, as: 'vmIsHealthy'
          property :vm_startup_time, as: 'vmStartupTime'
        end
      end
      
      class WorkerHealthReportResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :report_interval, as: 'reportInterval'
        end
      end
      
      class WorkerLifecycleEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_start_time, as: 'containerStartTime'
          property :event, as: 'event'
          hash :metadata, as: 'metadata'
        end
      end
      
      class WorkerMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :time, as: 'time'
          property :worker_health_report, as: 'workerHealthReport', class: Google::Apis::DataflowV1b3::WorkerHealthReport, decorator: Google::Apis::DataflowV1b3::WorkerHealthReport::Representation
      
          property :worker_lifecycle_event, as: 'workerLifecycleEvent', class: Google::Apis::DataflowV1b3::WorkerLifecycleEvent, decorator: Google::Apis::DataflowV1b3::WorkerLifecycleEvent::Representation
      
          property :worker_message_code, as: 'workerMessageCode', class: Google::Apis::DataflowV1b3::WorkerMessageCode, decorator: Google::Apis::DataflowV1b3::WorkerMessageCode::Representation
      
          property :worker_metrics, as: 'workerMetrics', class: Google::Apis::DataflowV1b3::ResourceUtilizationReport, decorator: Google::Apis::DataflowV1b3::ResourceUtilizationReport::Representation
      
          property :worker_shutdown_notice, as: 'workerShutdownNotice', class: Google::Apis::DataflowV1b3::WorkerShutdownNotice, decorator: Google::Apis::DataflowV1b3::WorkerShutdownNotice::Representation
      
        end
      end
      
      class WorkerMessageCode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          hash :parameters, as: 'parameters'
        end
      end
      
      class WorkerMessageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :worker_health_report_response, as: 'workerHealthReportResponse', class: Google::Apis::DataflowV1b3::WorkerHealthReportResponse, decorator: Google::Apis::DataflowV1b3::WorkerHealthReportResponse::Representation
      
          property :worker_metrics_response, as: 'workerMetricsResponse', class: Google::Apis::DataflowV1b3::ResourceUtilizationReportResponse, decorator: Google::Apis::DataflowV1b3::ResourceUtilizationReportResponse::Representation
      
          property :worker_shutdown_notice_response, as: 'workerShutdownNoticeResponse', class: Google::Apis::DataflowV1b3::WorkerShutdownNoticeResponse, decorator: Google::Apis::DataflowV1b3::WorkerShutdownNoticeResponse::Representation
      
        end
      end
      
      class WorkerPool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_settings, as: 'autoscalingSettings', class: Google::Apis::DataflowV1b3::AutoscalingSettings, decorator: Google::Apis::DataflowV1b3::AutoscalingSettings::Representation
      
          collection :data_disks, as: 'dataDisks', class: Google::Apis::DataflowV1b3::Disk, decorator: Google::Apis::DataflowV1b3::Disk::Representation
      
          property :default_package_set, as: 'defaultPackageSet'
          property :disk_size_gb, as: 'diskSizeGb'
          property :disk_source_image, as: 'diskSourceImage'
          property :disk_type, as: 'diskType'
          property :ip_configuration, as: 'ipConfiguration'
          property :kind, as: 'kind'
          property :machine_type, as: 'machineType'
          hash :metadata, as: 'metadata'
          property :network, as: 'network'
          property :num_threads_per_worker, as: 'numThreadsPerWorker'
          property :num_workers, as: 'numWorkers'
          property :on_host_maintenance, as: 'onHostMaintenance'
          collection :packages, as: 'packages', class: Google::Apis::DataflowV1b3::Package, decorator: Google::Apis::DataflowV1b3::Package::Representation
      
          hash :pool_args, as: 'poolArgs'
          property :subnetwork, as: 'subnetwork'
          property :taskrunner_settings, as: 'taskrunnerSettings', class: Google::Apis::DataflowV1b3::TaskRunnerSettings, decorator: Google::Apis::DataflowV1b3::TaskRunnerSettings::Representation
      
          property :teardown_policy, as: 'teardownPolicy'
          property :worker_harness_container_image, as: 'workerHarnessContainerImage'
          property :zone, as: 'zone'
        end
      end
      
      class WorkerSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_url, as: 'baseUrl'
          property :reporting_enabled, as: 'reportingEnabled'
          property :service_path, as: 'servicePath'
          property :shuffle_service_path, as: 'shuffleServicePath'
          property :temp_storage_prefix, as: 'tempStoragePrefix'
          property :worker_id, as: 'workerId'
        end
      end
      
      class WorkerShutdownNotice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reason, as: 'reason'
        end
      end
      
      class WorkerShutdownNoticeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class WriteInstruction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input, as: 'input', class: Google::Apis::DataflowV1b3::InstructionInput, decorator: Google::Apis::DataflowV1b3::InstructionInput::Representation
      
          property :sink, as: 'sink', class: Google::Apis::DataflowV1b3::Sink, decorator: Google::Apis::DataflowV1b3::Sink::Representation
      
        end
      end
    end
  end
end
