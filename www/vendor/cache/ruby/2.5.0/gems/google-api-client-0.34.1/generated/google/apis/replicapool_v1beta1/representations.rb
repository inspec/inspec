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
    module ReplicapoolV1beta1
      
      class AccessConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskAttachment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnvVariable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExistingDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Label
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NewDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NewDiskInitializeParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Pool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PoolsDeleteRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PoolsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Replica
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplicaStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplicasDeleteRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplicasListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Template
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VmParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :nat_ip, as: 'natIp'
          property :type, as: 'type'
        end
      end
      
      class Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :commands, as: 'commands'
          collection :env_variables, as: 'envVariables', class: Google::Apis::ReplicapoolV1beta1::EnvVariable, decorator: Google::Apis::ReplicapoolV1beta1::EnvVariable::Representation
      
          property :timeout_milli_seconds, as: 'timeoutMilliSeconds'
        end
      end
      
      class DiskAttachment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_name, as: 'deviceName'
          property :index, as: 'index'
        end
      end
      
      class EnvVariable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hidden, as: 'hidden'
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class ExistingDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attachment, as: 'attachment', class: Google::Apis::ReplicapoolV1beta1::DiskAttachment, decorator: Google::Apis::ReplicapoolV1beta1::DiskAttachment::Representation
      
          property :source, as: 'source'
        end
      end
      
      class HealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval_sec, as: 'checkIntervalSec'
          property :description, as: 'description'
          property :healthy_threshold, as: 'healthyThreshold'
          property :host, as: 'host'
          property :name, as: 'name'
          property :path, as: 'path'
          property :port, as: 'port'
          property :timeout_sec, as: 'timeoutSec'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class Label
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :finger_print, as: 'fingerPrint'
          collection :items, as: 'items', class: Google::Apis::ReplicapoolV1beta1::MetadataItem, decorator: Google::Apis::ReplicapoolV1beta1::MetadataItem::Representation
      
        end
      end
      
      class MetadataItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class NetworkInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access_configs, as: 'accessConfigs', class: Google::Apis::ReplicapoolV1beta1::AccessConfig, decorator: Google::Apis::ReplicapoolV1beta1::AccessConfig::Representation
      
          property :network, as: 'network'
          property :network_ip, as: 'networkIp'
        end
      end
      
      class NewDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attachment, as: 'attachment', class: Google::Apis::ReplicapoolV1beta1::DiskAttachment, decorator: Google::Apis::ReplicapoolV1beta1::DiskAttachment::Representation
      
          property :auto_delete, as: 'autoDelete'
          property :boot, as: 'boot'
          property :initialize_params, as: 'initializeParams', class: Google::Apis::ReplicapoolV1beta1::NewDiskInitializeParams, decorator: Google::Apis::ReplicapoolV1beta1::NewDiskInitializeParams::Representation
      
        end
      end
      
      class NewDiskInitializeParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :disk_type, as: 'diskType'
          property :source_image, as: 'sourceImage'
        end
      end
      
      class Pool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_restart, as: 'autoRestart'
          property :base_instance_name, as: 'baseInstanceName'
          property :current_num_replicas, as: 'currentNumReplicas'
          property :description, as: 'description'
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ReplicapoolV1beta1::HealthCheck, decorator: Google::Apis::ReplicapoolV1beta1::HealthCheck::Representation
      
          property :initial_num_replicas, as: 'initialNumReplicas'
          collection :labels, as: 'labels', class: Google::Apis::ReplicapoolV1beta1::Label, decorator: Google::Apis::ReplicapoolV1beta1::Label::Representation
      
          property :name, as: 'name'
          property :num_replicas, as: 'numReplicas'
          collection :resource_views, as: 'resourceViews'
          property :self_link, as: 'selfLink'
          property :target_pool, as: 'targetPool'
          collection :target_pools, as: 'targetPools'
          property :template, as: 'template', class: Google::Apis::ReplicapoolV1beta1::Template, decorator: Google::Apis::ReplicapoolV1beta1::Template::Representation
      
          property :type, as: 'type'
        end
      end
      
      class PoolsDeleteRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :abandon_instances, as: 'abandonInstances'
        end
      end
      
      class PoolsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ReplicapoolV1beta1::Pool, decorator: Google::Apis::ReplicapoolV1beta1::Pool::Representation
      
        end
      end
      
      class Replica
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :status, as: 'status', class: Google::Apis::ReplicapoolV1beta1::ReplicaStatus, decorator: Google::Apis::ReplicapoolV1beta1::ReplicaStatus::Representation
      
        end
      end
      
      class ReplicaStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details'
          property :state, as: 'state'
          property :template_version, as: 'templateVersion'
          property :vm_link, as: 'vmLink'
          property :vm_start_time, as: 'vmStartTime'
        end
      end
      
      class ReplicasDeleteRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :abandon_instance, as: 'abandonInstance'
        end
      end
      
      class ReplicasListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ReplicapoolV1beta1::Replica, decorator: Google::Apis::ReplicapoolV1beta1::Replica::Representation
      
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
        end
      end
      
      class Tag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :finger_print, as: 'fingerPrint'
          collection :items, as: 'items'
        end
      end
      
      class Template
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action', class: Google::Apis::ReplicapoolV1beta1::Action, decorator: Google::Apis::ReplicapoolV1beta1::Action::Representation
      
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ReplicapoolV1beta1::HealthCheck, decorator: Google::Apis::ReplicapoolV1beta1::HealthCheck::Representation
      
          property :version, as: 'version'
          property :vm_params, as: 'vmParams', class: Google::Apis::ReplicapoolV1beta1::VmParams, decorator: Google::Apis::ReplicapoolV1beta1::VmParams::Representation
      
        end
      end
      
      class VmParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_instance_name, as: 'baseInstanceName'
          property :can_ip_forward, as: 'canIpForward'
          property :description, as: 'description'
          collection :disks_to_attach, as: 'disksToAttach', class: Google::Apis::ReplicapoolV1beta1::ExistingDisk, decorator: Google::Apis::ReplicapoolV1beta1::ExistingDisk::Representation
      
          collection :disks_to_create, as: 'disksToCreate', class: Google::Apis::ReplicapoolV1beta1::NewDisk, decorator: Google::Apis::ReplicapoolV1beta1::NewDisk::Representation
      
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ReplicapoolV1beta1::Metadata, decorator: Google::Apis::ReplicapoolV1beta1::Metadata::Representation
      
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ReplicapoolV1beta1::NetworkInterface, decorator: Google::Apis::ReplicapoolV1beta1::NetworkInterface::Representation
      
          property :on_host_maintenance, as: 'onHostMaintenance'
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ReplicapoolV1beta1::ServiceAccount, decorator: Google::Apis::ReplicapoolV1beta1::ServiceAccount::Representation
      
          property :tags, as: 'tags', class: Google::Apis::ReplicapoolV1beta1::Tag, decorator: Google::Apis::ReplicapoolV1beta1::Tag::Representation
      
        end
      end
    end
  end
end
