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
    module GenomicsV2alpha1
      
      class Accelerator
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckInRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckInResponse
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
      
      class DelayedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Disk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskStatus
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
      
      class Metadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Network
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
      
      class PullStartedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullStoppedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resources
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
      
      class Secret
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnexpectedExitStatusEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VirtualMachine
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
      
      class WorkerStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Accelerator
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :type, as: 'type'
        end
      end
      
      class Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :commands, as: 'commands'
          property :credentials, as: 'credentials', class: Google::Apis::GenomicsV2alpha1::Secret, decorator: Google::Apis::GenomicsV2alpha1::Secret::Representation
      
          property :entrypoint, as: 'entrypoint'
          hash :environment, as: 'environment'
          collection :flags, as: 'flags'
          property :image_uri, as: 'imageUri'
          hash :labels, as: 'labels'
          collection :mounts, as: 'mounts', class: Google::Apis::GenomicsV2alpha1::Mount, decorator: Google::Apis::GenomicsV2alpha1::Mount::Representation
      
          property :name, as: 'name'
          property :pid_namespace, as: 'pidNamespace'
          hash :port_mappings, as: 'portMappings'
          property :timeout, as: 'timeout'
        end
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class CheckInRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deadline_expired, as: 'deadlineExpired', class: Google::Apis::GenomicsV2alpha1::Empty, decorator: Google::Apis::GenomicsV2alpha1::Empty::Representation
      
          hash :event, as: 'event'
          property :result, as: 'result', class: Google::Apis::GenomicsV2alpha1::Status, decorator: Google::Apis::GenomicsV2alpha1::Status::Representation
      
          property :worker_status, as: 'workerStatus', class: Google::Apis::GenomicsV2alpha1::WorkerStatus, decorator: Google::Apis::GenomicsV2alpha1::WorkerStatus::Representation
      
        end
      end
      
      class CheckInResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deadline, as: 'deadline'
          hash :metadata, as: 'metadata'
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
          property :name, as: 'name'
          property :size_gb, as: 'sizeGb'
          property :source_image, as: 'sourceImage'
          property :type, as: 'type'
        end
      end
      
      class DiskStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :free_space_bytes, :numeric_string => true, as: 'freeSpaceBytes'
          property :total_space_bytes, :numeric_string => true, as: 'totalSpaceBytes'
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
          collection :operations, as: 'operations', class: Google::Apis::GenomicsV2alpha1::Operation, decorator: Google::Apis::GenomicsV2alpha1::Operation::Representation
      
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          collection :events, as: 'events', class: Google::Apis::GenomicsV2alpha1::Event, decorator: Google::Apis::GenomicsV2alpha1::Event::Representation
      
          hash :labels, as: 'labels'
          property :pipeline, as: 'pipeline', class: Google::Apis::GenomicsV2alpha1::Pipeline, decorator: Google::Apis::GenomicsV2alpha1::Pipeline::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class Mount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk, as: 'disk'
          property :path, as: 'path'
          property :read_only, as: 'readOnly'
        end
      end
      
      class Network
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :subnetwork, as: 'subnetwork'
          property :use_private_address, as: 'usePrivateAddress'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::GenomicsV2alpha1::Status, decorator: Google::Apis::GenomicsV2alpha1::Status::Representation
      
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
          collection :events, as: 'events', class: Google::Apis::GenomicsV2alpha1::OperationEvent, decorator: Google::Apis::GenomicsV2alpha1::OperationEvent::Representation
      
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
          collection :actions, as: 'actions', class: Google::Apis::GenomicsV2alpha1::Action, decorator: Google::Apis::GenomicsV2alpha1::Action::Representation
      
          hash :environment, as: 'environment'
          property :resources, as: 'resources', class: Google::Apis::GenomicsV2alpha1::Resources, decorator: Google::Apis::GenomicsV2alpha1::Resources::Representation
      
          property :timeout, as: 'timeout'
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
      
      class Resources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          collection :regions, as: 'regions'
          property :virtual_machine, as: 'virtualMachine', class: Google::Apis::GenomicsV2alpha1::VirtualMachine, decorator: Google::Apis::GenomicsV2alpha1::VirtualMachine::Representation
      
          collection :zones, as: 'zones'
        end
      end
      
      class RunPipelineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :pipeline, as: 'pipeline', class: Google::Apis::GenomicsV2alpha1::Pipeline, decorator: Google::Apis::GenomicsV2alpha1::Pipeline::Representation
      
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
          property :compute_engine, as: 'computeEngine', class: Google::Apis::GenomicsV2alpha1::ComputeEngine, decorator: Google::Apis::GenomicsV2alpha1::ComputeEngine::Representation
      
        end
      end
      
      class Secret
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cipher_text, as: 'cipherText'
          property :key_name, as: 'keyName'
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
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
      
      class UnexpectedExitStatusEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :exit_status, as: 'exitStatus'
        end
      end
      
      class VirtualMachine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accelerators, as: 'accelerators', class: Google::Apis::GenomicsV2alpha1::Accelerator, decorator: Google::Apis::GenomicsV2alpha1::Accelerator::Representation
      
          property :boot_disk_size_gb, as: 'bootDiskSizeGb'
          property :boot_image, as: 'bootImage'
          property :cpu_platform, as: 'cpuPlatform'
          collection :disks, as: 'disks', class: Google::Apis::GenomicsV2alpha1::Disk, decorator: Google::Apis::GenomicsV2alpha1::Disk::Representation
      
          property :enable_stackdriver_monitoring, as: 'enableStackdriverMonitoring'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :network, as: 'network', class: Google::Apis::GenomicsV2alpha1::Network, decorator: Google::Apis::GenomicsV2alpha1::Network::Representation
      
          property :nvidia_driver_version, as: 'nvidiaDriverVersion'
          property :preemptible, as: 'preemptible'
          property :service_account, as: 'serviceAccount', class: Google::Apis::GenomicsV2alpha1::ServiceAccount, decorator: Google::Apis::GenomicsV2alpha1::ServiceAccount::Representation
      
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
      
      class WorkerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attached_disks, as: 'attachedDisks', class: Google::Apis::GenomicsV2alpha1::DiskStatus, decorator: Google::Apis::GenomicsV2alpha1::DiskStatus::Representation
      
          property :boot_disk, as: 'bootDisk', class: Google::Apis::GenomicsV2alpha1::DiskStatus, decorator: Google::Apis::GenomicsV2alpha1::DiskStatus::Representation
      
          property :free_ram_bytes, :numeric_string => true, as: 'freeRamBytes'
          property :total_ram_bytes, :numeric_string => true, as: 'totalRamBytes'
          property :uptime_seconds, :numeric_string => true, as: 'uptimeSeconds'
        end
      end
    end
  end
end
