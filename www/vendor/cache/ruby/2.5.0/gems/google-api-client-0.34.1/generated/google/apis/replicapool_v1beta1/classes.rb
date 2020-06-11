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
      
      # A Compute Engine network accessConfig. Identical to the accessConfig on
      # corresponding Compute Engine resource.
      class AccessConfig
        include Google::Apis::Core::Hashable
      
        # Name of this access configuration.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An external IP address associated with this instance.
        # Corresponds to the JSON property `natIp`
        # @return [String]
        attr_accessor :nat_ip
      
        # Type of this access configuration file. Currently only ONE_TO_ONE_NAT is
        # supported.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @nat_ip = args[:nat_ip] if args.key?(:nat_ip)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An action that gets executed during initialization of the replicas.
      class Action
        include Google::Apis::Core::Hashable
      
        # A list of commands to run, one per line. If any command fails, the whole
        # action is considered a failure and no further actions are run. This also marks
        # the virtual machine or replica as a failure.
        # Corresponds to the JSON property `commands`
        # @return [Array<String>]
        attr_accessor :commands
      
        # A list of environment variables to use for the commands in this action.
        # Corresponds to the JSON property `envVariables`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::EnvVariable>]
        attr_accessor :env_variables
      
        # If an action's commands on a particular replica do not finish in the specified
        # timeoutMilliSeconds, the replica is considered to be in a FAILING state. No
        # efforts are made to stop any processes that were spawned or created as the
        # result of running the action's commands. The default is the max allowed value,
        # 1 hour (i.e. 3600000 milliseconds).
        # Corresponds to the JSON property `timeoutMilliSeconds`
        # @return [Fixnum]
        attr_accessor :timeout_milli_seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commands = args[:commands] if args.key?(:commands)
          @env_variables = args[:env_variables] if args.key?(:env_variables)
          @timeout_milli_seconds = args[:timeout_milli_seconds] if args.key?(:timeout_milli_seconds)
        end
      end
      
      # Specifies how to attach a disk to a Replica.
      class DiskAttachment
        include Google::Apis::Core::Hashable
      
        # The device name of this disk.
        # Corresponds to the JSON property `deviceName`
        # @return [String]
        attr_accessor :device_name
      
        # A zero-based index to assign to this disk, where 0 is reserved for the boot
        # disk. If not specified, this is assigned by the server.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_name = args[:device_name] if args.key?(:device_name)
          @index = args[:index] if args.key?(:index)
        end
      end
      
      # An environment variable to set for an action.
      class EnvVariable
        include Google::Apis::Core::Hashable
      
        # Deprecated, do not use.
        # Corresponds to the JSON property `hidden`
        # @return [Boolean]
        attr_accessor :hidden
        alias_method :hidden?, :hidden
      
        # The name of the environment variable.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The value of the variable.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hidden = args[:hidden] if args.key?(:hidden)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A pre-existing persistent disk that will be attached to every Replica in the
      # Pool in READ_ONLY mode.
      class ExistingDisk
        include Google::Apis::Core::Hashable
      
        # Specifies how to attach a disk to a Replica.
        # Corresponds to the JSON property `attachment`
        # @return [Google::Apis::ReplicapoolV1beta1::DiskAttachment]
        attr_accessor :attachment
      
        # The name of the Persistent Disk resource. The Persistent Disk resource must be
        # in the same zone as the Pool.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachment = args[:attachment] if args.key?(:attachment)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # 
      class HealthCheck
        include Google::Apis::Core::Hashable
      
        # How often (in seconds) to make HTTP requests for this healthcheck. The default
        # value is 5 seconds.
        # Corresponds to the JSON property `checkIntervalSec`
        # @return [Fixnum]
        attr_accessor :check_interval_sec
      
        # The description for this health check.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The number of consecutive health check requests that need to succeed before
        # the replica is considered healthy again. The default value is 2.
        # Corresponds to the JSON property `healthyThreshold`
        # @return [Fixnum]
        attr_accessor :healthy_threshold
      
        # The value of the host header in the HTTP health check request. If left empty (
        # default value), the localhost IP 127.0.0.1 will be used.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The name of this health check.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The localhost request path to send this health check, in the format /path/to/
        # use. For example, /healthcheck.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The TCP port for the health check requests.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # How long (in seconds) to wait before a timeout failure for this healthcheck.
        # The default value is 5 seconds.
        # Corresponds to the JSON property `timeoutSec`
        # @return [Fixnum]
        attr_accessor :timeout_sec
      
        # The number of consecutive health check requests that need to fail in order to
        # consider the replica unhealthy. The default value is 2.
        # Corresponds to the JSON property `unhealthyThreshold`
        # @return [Fixnum]
        attr_accessor :unhealthy_threshold
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @check_interval_sec = args[:check_interval_sec] if args.key?(:check_interval_sec)
          @description = args[:description] if args.key?(:description)
          @healthy_threshold = args[:healthy_threshold] if args.key?(:healthy_threshold)
          @host = args[:host] if args.key?(:host)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @port = args[:port] if args.key?(:port)
          @timeout_sec = args[:timeout_sec] if args.key?(:timeout_sec)
          @unhealthy_threshold = args[:unhealthy_threshold] if args.key?(:unhealthy_threshold)
        end
      end
      
      # A label to apply to this replica pool.
      class Label
        include Google::Apis::Core::Hashable
      
        # The key for this label.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of this label.
        # Corresponds to the JSON property `value`
        # @return [String]
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
      
      # A Compute Engine metadata entry. Identical to the metadata on the
      # corresponding Compute Engine resource.
      class Metadata
        include Google::Apis::Core::Hashable
      
        # The fingerprint of the metadata. Required for updating the metadata entries
        # for this instance.
        # Corresponds to the JSON property `fingerPrint`
        # @return [String]
        attr_accessor :finger_print
      
        # A list of metadata items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::MetadataItem>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finger_print = args[:finger_print] if args.key?(:finger_print)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # A Compute Engine metadata item, defined as a key:value pair. Identical to the
      # metadata on the corresponding Compute Engine resource.
      class MetadataItem
        include Google::Apis::Core::Hashable
      
        # A metadata key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # A metadata value.
        # Corresponds to the JSON property `value`
        # @return [String]
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
      
      # A Compute Engine NetworkInterface resource. Identical to the NetworkInterface
      # on the corresponding Compute Engine resource.
      class NetworkInterface
        include Google::Apis::Core::Hashable
      
        # An array of configurations for this interface. This specifies how this
        # interface is configured to interact with other network services.
        # Corresponds to the JSON property `accessConfigs`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::AccessConfig>]
        attr_accessor :access_configs
      
        # Name the Network resource to which this interface applies.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # An optional IPV4 internal network address to assign to the instance for this
        # network interface.
        # Corresponds to the JSON property `networkIp`
        # @return [String]
        attr_accessor :network_ip
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_configs = args[:access_configs] if args.key?(:access_configs)
          @network = args[:network] if args.key?(:network)
          @network_ip = args[:network_ip] if args.key?(:network_ip)
        end
      end
      
      # A Persistent Disk resource that will be created and attached to each Replica
      # in the Pool. Each Replica will have a unique persistent disk that is created
      # and attached to that Replica in READ_WRITE mode.
      class NewDisk
        include Google::Apis::Core::Hashable
      
        # Specifies how to attach a disk to a Replica.
        # Corresponds to the JSON property `attachment`
        # @return [Google::Apis::ReplicapoolV1beta1::DiskAttachment]
        attr_accessor :attachment
      
        # If true, then this disk will be deleted when the instance is deleted. The
        # default value is true.
        # Corresponds to the JSON property `autoDelete`
        # @return [Boolean]
        attr_accessor :auto_delete
        alias_method :auto_delete?, :auto_delete
      
        # If true, indicates that this is the root persistent disk.
        # Corresponds to the JSON property `boot`
        # @return [Boolean]
        attr_accessor :boot
        alias_method :boot?, :boot
      
        # Initialization parameters for creating a new disk.
        # Corresponds to the JSON property `initializeParams`
        # @return [Google::Apis::ReplicapoolV1beta1::NewDiskInitializeParams]
        attr_accessor :initialize_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachment = args[:attachment] if args.key?(:attachment)
          @auto_delete = args[:auto_delete] if args.key?(:auto_delete)
          @boot = args[:boot] if args.key?(:boot)
          @initialize_params = args[:initialize_params] if args.key?(:initialize_params)
        end
      end
      
      # Initialization parameters for creating a new disk.
      class NewDiskInitializeParams
        include Google::Apis::Core::Hashable
      
        # The size of the created disk in gigabytes.
        # Corresponds to the JSON property `diskSizeGb`
        # @return [Fixnum]
        attr_accessor :disk_size_gb
      
        # Name of the disk type resource describing which disk type to use to create the
        # disk. For example 'pd-ssd' or 'pd-standard'. Default is 'pd-standard'
        # Corresponds to the JSON property `diskType`
        # @return [String]
        attr_accessor :disk_type
      
        # The name or fully-qualified URL of a source image to use to create this disk.
        # If you provide a name of the source image, Replica Pool will look for an image
        # with that name in your project. If you are specifying an image provided by
        # Compute Engine, you will need to provide the full URL with the correct project,
        # such as:
        # http://www.googleapis.com/compute/v1/projects/debian-cloud/ global/images/
        # debian-wheezy-7-vYYYYMMDD
        # Corresponds to the JSON property `sourceImage`
        # @return [String]
        attr_accessor :source_image
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk_size_gb = args[:disk_size_gb] if args.key?(:disk_size_gb)
          @disk_type = args[:disk_type] if args.key?(:disk_type)
          @source_image = args[:source_image] if args.key?(:source_image)
        end
      end
      
      # 
      class Pool
        include Google::Apis::Core::Hashable
      
        # Whether replicas in this pool should be restarted if they experience a failure.
        # The default value is true.
        # Corresponds to the JSON property `autoRestart`
        # @return [Boolean]
        attr_accessor :auto_restart
        alias_method :auto_restart?, :auto_restart
      
        # The base instance name to use for the replicas in this pool. This must match
        # the regex [a-z]([-a-z0-9]*[a-z0-9])?. If specified, the instances in this
        # replica pool will be named in the format <base-instance-name>-<ID>. The <ID>
        # postfix will be a four character alphanumeric identifier generated by the
        # service.
        # If this is not specified by the user, a random base instance name is generated
        # by the service.
        # Corresponds to the JSON property `baseInstanceName`
        # @return [String]
        attr_accessor :base_instance_name
      
        # [Output Only] The current number of replicas in the pool.
        # Corresponds to the JSON property `currentNumReplicas`
        # @return [Fixnum]
        attr_accessor :current_num_replicas
      
        # An optional description of the replica pool.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Deprecated. Please use template[].healthChecks instead.
        # Corresponds to the JSON property `healthChecks`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::HealthCheck>]
        attr_accessor :health_checks
      
        # The initial number of replicas this pool should have. You must provide a value
        # greater than or equal to 0.
        # Corresponds to the JSON property `initialNumReplicas`
        # @return [Fixnum]
        attr_accessor :initial_num_replicas
      
        # A list of labels to attach to this replica pool and all created virtual
        # machines in this replica pool.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::Label>]
        attr_accessor :labels
      
        # The name of the replica pool. Must follow the regex [a-z]([-a-z0-9]*[a-z0-9])?
        # and be 1-28 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated! Use initial_num_replicas instead.
        # Corresponds to the JSON property `numReplicas`
        # @return [Fixnum]
        attr_accessor :num_replicas
      
        # The list of resource views that should be updated with all the replicas that
        # are managed by this pool.
        # Corresponds to the JSON property `resourceViews`
        # @return [Array<String>]
        attr_accessor :resource_views
      
        # [Output Only] A self-link to the replica pool.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Deprecated, please use target_pools instead.
        # Corresponds to the JSON property `targetPool`
        # @return [String]
        attr_accessor :target_pool
      
        # A list of target pools to update with the replicas that are managed by this
        # pool. If specified, the replicas in this replica pool will be added to the
        # specified target pools for load balancing purposes. The replica pool must live
        # in the same region as the specified target pools. These values must be the
        # target pool resource names, and not fully qualified URLs.
        # Corresponds to the JSON property `targetPools`
        # @return [Array<String>]
        attr_accessor :target_pools
      
        # The template used for creating replicas in the pool.
        # Corresponds to the JSON property `template`
        # @return [Google::Apis::ReplicapoolV1beta1::Template]
        attr_accessor :template
      
        # Deprecated! Do not set.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_restart = args[:auto_restart] if args.key?(:auto_restart)
          @base_instance_name = args[:base_instance_name] if args.key?(:base_instance_name)
          @current_num_replicas = args[:current_num_replicas] if args.key?(:current_num_replicas)
          @description = args[:description] if args.key?(:description)
          @health_checks = args[:health_checks] if args.key?(:health_checks)
          @initial_num_replicas = args[:initial_num_replicas] if args.key?(:initial_num_replicas)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @num_replicas = args[:num_replicas] if args.key?(:num_replicas)
          @resource_views = args[:resource_views] if args.key?(:resource_views)
          @self_link = args[:self_link] if args.key?(:self_link)
          @target_pool = args[:target_pool] if args.key?(:target_pool)
          @target_pools = args[:target_pools] if args.key?(:target_pools)
          @template = args[:template] if args.key?(:template)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class PoolsDeleteRequest
        include Google::Apis::Core::Hashable
      
        # If there are instances you would like to keep, you can specify them here.
        # These instances won't be deleted, but the associated replica objects will be
        # removed.
        # Corresponds to the JSON property `abandonInstances`
        # @return [Array<String>]
        attr_accessor :abandon_instances
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @abandon_instances = args[:abandon_instances] if args.key?(:abandon_instances)
        end
      end
      
      # 
      class PoolsListResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::Pool>]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # An individual Replica within a Pool. Replicas are automatically created by the
      # replica pool, using the template provided by the user. You cannot directly
      # create replicas.
      class Replica
        include Google::Apis::Core::Hashable
      
        # [Output Only] The name of the Replica object.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Output Only] The self-link of the Replica.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The current status of a Replica.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ReplicapoolV1beta1::ReplicaStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # The current status of a Replica.
      class ReplicaStatus
        include Google::Apis::Core::Hashable
      
        # [Output Only] Human-readable details about the current state of the replica
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # [Output Only] The state of the Replica.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # [Output Only] The template used to build the replica.
        # Corresponds to the JSON property `templateVersion`
        # @return [String]
        attr_accessor :template_version
      
        # [Output Only] Link to the virtual machine that this Replica represents.
        # Corresponds to the JSON property `vmLink`
        # @return [String]
        attr_accessor :vm_link
      
        # [Output Only] The time that this Replica got to the RUNNING state, in RFC 3339
        # format. If the start time is unknown, UNKNOWN is returned.
        # Corresponds to the JSON property `vmStartTime`
        # @return [String]
        attr_accessor :vm_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @state = args[:state] if args.key?(:state)
          @template_version = args[:template_version] if args.key?(:template_version)
          @vm_link = args[:vm_link] if args.key?(:vm_link)
          @vm_start_time = args[:vm_start_time] if args.key?(:vm_start_time)
        end
      end
      
      # 
      class ReplicasDeleteRequest
        include Google::Apis::Core::Hashable
      
        # Whether the instance resource represented by this replica should be deleted or
        # abandoned. If abandoned, the replica will be deleted but the virtual machine
        # instance will remain. By default, this is set to false and the instance will
        # be deleted along with the replica.
        # Corresponds to the JSON property `abandonInstance`
        # @return [Boolean]
        attr_accessor :abandon_instance
        alias_method :abandon_instance?, :abandon_instance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @abandon_instance = args[:abandon_instance] if args.key?(:abandon_instance)
        end
      end
      
      # 
      class ReplicasListResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::Replica>]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # A Compute Engine service account, identical to the Compute Engine resource.
      class ServiceAccount
        include Google::Apis::Core::Hashable
      
        # The service account email address, for example: 123845678986@project.
        # gserviceaccount.com
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The list of OAuth2 scopes to obtain for the service account, for example:
        # https://www.googleapis.com/auth/devstorage.full_control
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
      
      # A Compute Engine Instance tag, identical to the tags on the corresponding
      # Compute Engine Instance resource.
      class Tag
        include Google::Apis::Core::Hashable
      
        # The fingerprint of the tag. Required for updating the list of tags.
        # Corresponds to the JSON property `fingerPrint`
        # @return [String]
        attr_accessor :finger_print
      
        # Items contained in this tag.
        # Corresponds to the JSON property `items`
        # @return [Array<String>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finger_print = args[:finger_print] if args.key?(:finger_print)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # The template used for creating replicas in the pool.
      class Template
        include Google::Apis::Core::Hashable
      
        # An action that gets executed during initialization of the replicas.
        # Corresponds to the JSON property `action`
        # @return [Google::Apis::ReplicapoolV1beta1::Action]
        attr_accessor :action
      
        # A list of HTTP Health Checks to configure for this replica pool and all
        # virtual machines in this replica pool.
        # Corresponds to the JSON property `healthChecks`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::HealthCheck>]
        attr_accessor :health_checks
      
        # A free-form string describing the version of this template. You can provide
        # any versioning string you would like. For example, version1 or template-v1.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # Parameters for creating a Compute Engine Instance resource. Most fields are
        # identical to the corresponding Compute Engine resource.
        # Corresponds to the JSON property `vmParams`
        # @return [Google::Apis::ReplicapoolV1beta1::VmParams]
        attr_accessor :vm_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @health_checks = args[:health_checks] if args.key?(:health_checks)
          @version = args[:version] if args.key?(:version)
          @vm_params = args[:vm_params] if args.key?(:vm_params)
        end
      end
      
      # Parameters for creating a Compute Engine Instance resource. Most fields are
      # identical to the corresponding Compute Engine resource.
      class VmParams
        include Google::Apis::Core::Hashable
      
        # Deprecated. Please use baseInstanceName instead.
        # Corresponds to the JSON property `baseInstanceName`
        # @return [String]
        attr_accessor :base_instance_name
      
        # Enables IP Forwarding, which allows this instance to receive packets destined
        # for a different IP address, and send packets with a different source IP. See
        # IP Forwarding for more information.
        # Corresponds to the JSON property `canIpForward`
        # @return [Boolean]
        attr_accessor :can_ip_forward
        alias_method :can_ip_forward?, :can_ip_forward
      
        # An optional textual description of the instance.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A list of existing Persistent Disk resources to attach to each replica in the
        # pool. Each disk will be attached in read-only mode to every replica.
        # Corresponds to the JSON property `disksToAttach`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::ExistingDisk>]
        attr_accessor :disks_to_attach
      
        # A list of Disk resources to create and attach to each Replica in the Pool.
        # Currently, you can only define one disk and it must be a root persistent disk.
        # Note that Replica Pool will create a root persistent disk for each replica.
        # Corresponds to the JSON property `disksToCreate`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::NewDisk>]
        attr_accessor :disks_to_create
      
        # The machine type for this instance. The resource name (e.g. n1-standard-1).
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # A Compute Engine metadata entry. Identical to the metadata on the
        # corresponding Compute Engine resource.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::ReplicapoolV1beta1::Metadata]
        attr_accessor :metadata
      
        # A list of network interfaces for the instance. Currently only one interface is
        # supported by Google Compute Engine, ONE_TO_ONE_NAT.
        # Corresponds to the JSON property `networkInterfaces`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::NetworkInterface>]
        attr_accessor :network_interfaces
      
        # 
        # Corresponds to the JSON property `onHostMaintenance`
        # @return [String]
        attr_accessor :on_host_maintenance
      
        # A list of Service Accounts to enable for this instance.
        # Corresponds to the JSON property `serviceAccounts`
        # @return [Array<Google::Apis::ReplicapoolV1beta1::ServiceAccount>]
        attr_accessor :service_accounts
      
        # A Compute Engine Instance tag, identical to the tags on the corresponding
        # Compute Engine Instance resource.
        # Corresponds to the JSON property `tags`
        # @return [Google::Apis::ReplicapoolV1beta1::Tag]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_instance_name = args[:base_instance_name] if args.key?(:base_instance_name)
          @can_ip_forward = args[:can_ip_forward] if args.key?(:can_ip_forward)
          @description = args[:description] if args.key?(:description)
          @disks_to_attach = args[:disks_to_attach] if args.key?(:disks_to_attach)
          @disks_to_create = args[:disks_to_create] if args.key?(:disks_to_create)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @metadata = args[:metadata] if args.key?(:metadata)
          @network_interfaces = args[:network_interfaces] if args.key?(:network_interfaces)
          @on_host_maintenance = args[:on_host_maintenance] if args.key?(:on_host_maintenance)
          @service_accounts = args[:service_accounts] if args.key?(:service_accounts)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
    end
  end
end
