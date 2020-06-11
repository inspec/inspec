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
      
      class CancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ComputeEngine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerKilledEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerStartedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerStoppedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ControllerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DelayedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Disk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DockerExecutor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Event
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FailedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPipelinesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalCopy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoggingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Pipeline
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PipelineParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PipelineResources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullStartedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullStoppedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepeatedString
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunPipelineArgs
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunPipelineRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunPipelineResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RuntimeMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetOperationStatusRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimestampEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnexpectedExitStatusEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerAssignedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerReleasedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ComputeEngine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disk_names, as: 'diskNames'
          property :instance_name, as: 'instanceName'
          property :machine_type, as: 'machineType'
          property :zone, as: 'zone'
        end
      end
      
      class ContainerKilledEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
        end
      end
      
      class ContainerStartedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :ip_address, as: 'ipAddress'
          hash :port_mappings, as: 'portMappings'
        end
      end
      
      class ContainerStoppedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :exit_status, as: 'exitStatus'
          property :stderr, as: 'stderr'
        end
      end
      
      class ControllerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cmd, as: 'cmd'
          hash :disks, as: 'disks'
          property :gcs_log_path, as: 'gcsLogPath'
          hash :gcs_sinks, as: 'gcsSinks', class: Google::Apis::GenomicsV1alpha2::RepeatedString, decorator: Google::Apis::GenomicsV1alpha2::RepeatedString::Representation
      
          hash :gcs_sources, as: 'gcsSources', class: Google::Apis::GenomicsV1alpha2::RepeatedString, decorator: Google::Apis::GenomicsV1alpha2::RepeatedString::Representation
      
          property :image, as: 'image'
          property :machine_type, as: 'machineType'
          hash :vars, as: 'vars'
        end
      end
      
      class DelayedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cause, as: 'cause'
          collection :metrics, as: 'metrics'
        end
      end
      
      class Disk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :mount_point, as: 'mountPoint'
          property :name, as: 'name'
          property :read_only, as: 'readOnly'
          property :size_gb, as: 'sizeGb'
          property :source, as: 'source'
          property :type, as: 'type'
        end
      end
      
      class DockerExecutor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cmd, as: 'cmd'
          property :image_name, as: 'imageName'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Event
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          hash :details, as: 'details'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class FailedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cause, as: 'cause'
          property :code, as: 'code'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::GenomicsV1alpha2::Operation, decorator: Google::Apis::GenomicsV1alpha2::Operation::Representation
      
        end
      end
      
      class ListPipelinesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :pipelines, as: 'pipelines', class: Google::Apis::GenomicsV1alpha2::Pipeline, decorator: Google::Apis::GenomicsV1alpha2::Pipeline::Representation
      
        end
      end
      
      class LocalCopy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk, as: 'disk'
          property :path, as: 'path'
        end
      end
      
      class LoggingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_path, as: 'gcsPath'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::GenomicsV1alpha2::Status, decorator: Google::Apis::GenomicsV1alpha2::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          collection :events, as: 'events', class: Google::Apis::GenomicsV1alpha2::OperationEvent, decorator: Google::Apis::GenomicsV1alpha2::OperationEvent::Representation
      
          hash :labels, as: 'labels'
          property :project_id, as: 'projectId'
          hash :request, as: 'request'
          hash :runtime_metadata, as: 'runtimeMetadata'
          property :start_time, as: 'startTime'
        end
      end
      
      class Pipeline
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :docker, as: 'docker', class: Google::Apis::GenomicsV1alpha2::DockerExecutor, decorator: Google::Apis::GenomicsV1alpha2::DockerExecutor::Representation
      
          collection :input_parameters, as: 'inputParameters', class: Google::Apis::GenomicsV1alpha2::PipelineParameter, decorator: Google::Apis::GenomicsV1alpha2::PipelineParameter::Representation
      
          property :name, as: 'name'
          collection :output_parameters, as: 'outputParameters', class: Google::Apis::GenomicsV1alpha2::PipelineParameter, decorator: Google::Apis::GenomicsV1alpha2::PipelineParameter::Representation
      
          property :pipeline_id, as: 'pipelineId'
          property :project_id, as: 'projectId'
          property :resources, as: 'resources', class: Google::Apis::GenomicsV1alpha2::PipelineResources, decorator: Google::Apis::GenomicsV1alpha2::PipelineResources::Representation
      
        end
      end
      
      class PipelineParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_value, as: 'defaultValue'
          property :description, as: 'description'
          property :local_copy, as: 'localCopy', class: Google::Apis::GenomicsV1alpha2::LocalCopy, decorator: Google::Apis::GenomicsV1alpha2::LocalCopy::Representation
      
          property :name, as: 'name'
        end
      end
      
      class PipelineResources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator_count, :numeric_string => true, as: 'acceleratorCount'
          property :accelerator_type, as: 'acceleratorType'
          property :boot_disk_size_gb, as: 'bootDiskSizeGb'
          collection :disks, as: 'disks', class: Google::Apis::GenomicsV1alpha2::Disk, decorator: Google::Apis::GenomicsV1alpha2::Disk::Representation
      
          property :minimum_cpu_cores, as: 'minimumCpuCores'
          property :minimum_ram_gb, as: 'minimumRamGb'
          property :no_address, as: 'noAddress'
          property :preemptible, as: 'preemptible'
          collection :zones, as: 'zones'
        end
      end
      
      class PullStartedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_uri, as: 'imageUri'
        end
      end
      
      class PullStoppedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_uri, as: 'imageUri'
        end
      end
      
      class RepeatedString
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values'
        end
      end
      
      class RunPipelineArgs
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          hash :inputs, as: 'inputs'
          property :keep_vm_alive_on_failure_duration, as: 'keepVmAliveOnFailureDuration'
          hash :labels, as: 'labels'
          property :logging, as: 'logging', class: Google::Apis::GenomicsV1alpha2::LoggingOptions, decorator: Google::Apis::GenomicsV1alpha2::LoggingOptions::Representation
      
          hash :outputs, as: 'outputs'
          property :project_id, as: 'projectId'
          property :resources, as: 'resources', class: Google::Apis::GenomicsV1alpha2::PipelineResources, decorator: Google::Apis::GenomicsV1alpha2::PipelineResources::Representation
      
          property :service_account, as: 'serviceAccount', class: Google::Apis::GenomicsV1alpha2::ServiceAccount, decorator: Google::Apis::GenomicsV1alpha2::ServiceAccount::Representation
      
        end
      end
      
      class RunPipelineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ephemeral_pipeline, as: 'ephemeralPipeline', class: Google::Apis::GenomicsV1alpha2::Pipeline, decorator: Google::Apis::GenomicsV1alpha2::Pipeline::Representation
      
          property :pipeline_args, as: 'pipelineArgs', class: Google::Apis::GenomicsV1alpha2::RunPipelineArgs, decorator: Google::Apis::GenomicsV1alpha2::RunPipelineArgs::Representation
      
          property :pipeline_id, as: 'pipelineId'
        end
      end
      
      class RunPipelineResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RuntimeMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compute_engine, as: 'computeEngine', class: Google::Apis::GenomicsV1alpha2::ComputeEngine, decorator: Google::Apis::GenomicsV1alpha2::ComputeEngine::Representation
      
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
        end
      end
      
      class SetOperationStatusRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_code, as: 'errorCode'
          property :error_message, as: 'errorMessage'
          property :operation_id, as: 'operationId'
          collection :timestamp_events, as: 'timestampEvents', class: Google::Apis::GenomicsV1alpha2::TimestampEvent, decorator: Google::Apis::GenomicsV1alpha2::TimestampEvent::Representation
      
          property :validation_token, :numeric_string => true, as: 'validationToken'
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
      
      class TimestampEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class UnexpectedExitStatusEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :exit_status, as: 'exitStatus'
        end
      end
      
      class WorkerAssignedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          property :machine_type, as: 'machineType'
          property :zone, as: 'zone'
        end
      end
      
      class WorkerReleasedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          property :zone, as: 'zone'
        end
      end
    end
  end
end
