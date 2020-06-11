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
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
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
          property :always_run, as: 'alwaysRun'
          collection :commands, as: 'commands'
          property :container_name, as: 'containerName'
          property :credentials, as: 'credentials', class: Google::Apis::LifesciencesV2beta::Secret, decorator: Google::Apis::LifesciencesV2beta::Secret::Representation
      
          property :disable_image_prefetch, as: 'disableImagePrefetch'
          property :disable_standard_error_capture, as: 'disableStandardErrorCapture'
          property :enable_fuse, as: 'enableFuse'
          property :entrypoint, as: 'entrypoint'
          hash :environment, as: 'environment'
          property :ignore_exit_status, as: 'ignoreExitStatus'
          property :image_uri, as: 'imageUri'
          hash :labels, as: 'labels'
          collection :mounts, as: 'mounts', class: Google::Apis::LifesciencesV2beta::Mount, decorator: Google::Apis::LifesciencesV2beta::Mount::Representation
      
          property :pid_namespace, as: 'pidNamespace'
          hash :port_mappings, as: 'portMappings'
          property :publish_exposed_ports, as: 'publishExposedPorts'
          property :run_in_background, as: 'runInBackground'
          property :timeout, as: 'timeout'
        end
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
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
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Event
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_killed, as: 'containerKilled', class: Google::Apis::LifesciencesV2beta::ContainerKilledEvent, decorator: Google::Apis::LifesciencesV2beta::ContainerKilledEvent::Representation
      
          property :container_started, as: 'containerStarted', class: Google::Apis::LifesciencesV2beta::ContainerStartedEvent, decorator: Google::Apis::LifesciencesV2beta::ContainerStartedEvent::Representation
      
          property :container_stopped, as: 'containerStopped', class: Google::Apis::LifesciencesV2beta::ContainerStoppedEvent, decorator: Google::Apis::LifesciencesV2beta::ContainerStoppedEvent::Representation
      
          property :delayed, as: 'delayed', class: Google::Apis::LifesciencesV2beta::DelayedEvent, decorator: Google::Apis::LifesciencesV2beta::DelayedEvent::Representation
      
          property :description, as: 'description'
          property :failed, as: 'failed', class: Google::Apis::LifesciencesV2beta::FailedEvent, decorator: Google::Apis::LifesciencesV2beta::FailedEvent::Representation
      
          property :pull_started, as: 'pullStarted', class: Google::Apis::LifesciencesV2beta::PullStartedEvent, decorator: Google::Apis::LifesciencesV2beta::PullStartedEvent::Representation
      
          property :pull_stopped, as: 'pullStopped', class: Google::Apis::LifesciencesV2beta::PullStoppedEvent, decorator: Google::Apis::LifesciencesV2beta::PullStoppedEvent::Representation
      
          property :timestamp, as: 'timestamp'
          property :unexpected_exit_status, as: 'unexpectedExitStatus', class: Google::Apis::LifesciencesV2beta::UnexpectedExitStatusEvent, decorator: Google::Apis::LifesciencesV2beta::UnexpectedExitStatusEvent::Representation
      
          property :worker_assigned, as: 'workerAssigned', class: Google::Apis::LifesciencesV2beta::WorkerAssignedEvent, decorator: Google::Apis::LifesciencesV2beta::WorkerAssignedEvent::Representation
      
          property :worker_released, as: 'workerReleased', class: Google::Apis::LifesciencesV2beta::WorkerReleasedEvent, decorator: Google::Apis::LifesciencesV2beta::WorkerReleasedEvent::Representation
      
        end
      end
      
      class FailedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cause, as: 'cause'
          property :code, as: 'code'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::LifesciencesV2beta::Location, decorator: Google::Apis::LifesciencesV2beta::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::LifesciencesV2beta::Operation, decorator: Google::Apis::LifesciencesV2beta::Operation::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          collection :events, as: 'events', class: Google::Apis::LifesciencesV2beta::Event, decorator: Google::Apis::LifesciencesV2beta::Event::Representation
      
          hash :labels, as: 'labels'
          property :pipeline, as: 'pipeline', class: Google::Apis::LifesciencesV2beta::Pipeline, decorator: Google::Apis::LifesciencesV2beta::Pipeline::Representation
      
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
          property :network, as: 'network'
          property :subnetwork, as: 'subnetwork'
          property :use_private_address, as: 'usePrivateAddress'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::LifesciencesV2beta::Status, decorator: Google::Apis::LifesciencesV2beta::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class Pipeline
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions', class: Google::Apis::LifesciencesV2beta::Action, decorator: Google::Apis::LifesciencesV2beta::Action::Representation
      
          hash :environment, as: 'environment'
          property :resources, as: 'resources', class: Google::Apis::LifesciencesV2beta::Resources, decorator: Google::Apis::LifesciencesV2beta::Resources::Representation
      
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
          collection :regions, as: 'regions'
          property :virtual_machine, as: 'virtualMachine', class: Google::Apis::LifesciencesV2beta::VirtualMachine, decorator: Google::Apis::LifesciencesV2beta::VirtualMachine::Representation
      
          collection :zones, as: 'zones'
        end
      end
      
      class RunPipelineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :pipeline, as: 'pipeline', class: Google::Apis::LifesciencesV2beta::Pipeline, decorator: Google::Apis::LifesciencesV2beta::Pipeline::Representation
      
        end
      end
      
      class RunPipelineResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
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
          collection :accelerators, as: 'accelerators', class: Google::Apis::LifesciencesV2beta::Accelerator, decorator: Google::Apis::LifesciencesV2beta::Accelerator::Representation
      
          property :boot_disk_size_gb, as: 'bootDiskSizeGb'
          property :boot_image, as: 'bootImage'
          property :cpu_platform, as: 'cpuPlatform'
          collection :disks, as: 'disks', class: Google::Apis::LifesciencesV2beta::Disk, decorator: Google::Apis::LifesciencesV2beta::Disk::Representation
      
          property :enable_stackdriver_monitoring, as: 'enableStackdriverMonitoring'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :network, as: 'network', class: Google::Apis::LifesciencesV2beta::Network, decorator: Google::Apis::LifesciencesV2beta::Network::Representation
      
          property :nvidia_driver_version, as: 'nvidiaDriverVersion'
          property :preemptible, as: 'preemptible'
          property :service_account, as: 'serviceAccount', class: Google::Apis::LifesciencesV2beta::ServiceAccount, decorator: Google::Apis::LifesciencesV2beta::ServiceAccount::Representation
      
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
