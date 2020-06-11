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
    module DataprocV1beta2
      
      # Specifies the type and number of accelerator cards attached to the instances
      # of an instance group (see GPUs on Compute Engine).
      class AcceleratorConfig
        include Google::Apis::Core::Hashable
      
        # The number of the accelerator cards of this type exposed to this instance.
        # Corresponds to the JSON property `acceleratorCount`
        # @return [Fixnum]
        attr_accessor :accelerator_count
      
        # Full URL, partial URI, or short name of the accelerator type resource to
        # expose to this instance. See Compute Engine AcceleratorTypesExamples * https://
        # www.googleapis.com/compute/beta/projects/[project_id]/zones/us-east1-a/
        # acceleratorTypes/nvidia-tesla-k80 * projects/[project_id]/zones/us-east1-a/
        # acceleratorTypes/nvidia-tesla-k80 * nvidia-tesla-k80Auto Zone Exception: If
        # you are using the Cloud Dataproc Auto Zone Placement feature, you must use the
        # short name of the accelerator type resource, for example, nvidia-tesla-k80.
        # Corresponds to the JSON property `acceleratorTypeUri`
        # @return [String]
        attr_accessor :accelerator_type_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_count = args[:accelerator_count] if args.key?(:accelerator_count)
          @accelerator_type_uri = args[:accelerator_type_uri] if args.key?(:accelerator_type_uri)
        end
      end
      
      # Autoscaling Policy config associated with the cluster.
      class AutoscalingConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The autoscaling policy used by the cluster.Only resource names
        # including projectid and location (region) are valid. Examples:
        # https://www.googleapis.com/compute/v1/projects/[project_id]/locations/[
        # dataproc_region]/autoscalingPolicies/[policy_id]
        # projects/[project_id]/locations/[dataproc_region]/autoscalingPolicies/[
        # policy_id]Note that the policy must be in the same project and Cloud Dataproc
        # region.
        # Corresponds to the JSON property `policyUri`
        # @return [String]
        attr_accessor :policy_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy_uri = args[:policy_uri] if args.key?(:policy_uri)
        end
      end
      
      # Describes an autoscaling policy for Dataproc cluster autoscaler.
      class AutoscalingPolicy
        include Google::Apis::Core::Hashable
      
        # Basic algorithm for autoscaling.
        # Corresponds to the JSON property `basicAlgorithm`
        # @return [Google::Apis::DataprocV1beta2::BasicAutoscalingAlgorithm]
        attr_accessor :basic_algorithm
      
        # Required. The policy id.The id must contain only letters (a-z, A-Z), numbers (
        # 0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or
        # hyphen. Must consist of between 3 and 50 characters.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Output only. The "resource name" of the autoscaling policy, as described in
        # https://cloud.google.com/apis/design/resource_names.
        # For projects.regions.autoscalingPolicies, the resource name of the  policy has
        # the following format:  projects/`project_id`/regions/`region`/
        # autoscalingPolicies/`policy_id`
        # For projects.locations.autoscalingPolicies, the resource name of the  policy
        # has the following format:  projects/`project_id`/locations/`location`/
        # autoscalingPolicies/`policy_id`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for the size bounds of an instance group, including its
        # proportional size to other groups.
        # Corresponds to the JSON property `secondaryWorkerConfig`
        # @return [Google::Apis::DataprocV1beta2::InstanceGroupAutoscalingPolicyConfig]
        attr_accessor :secondary_worker_config
      
        # Configuration for the size bounds of an instance group, including its
        # proportional size to other groups.
        # Corresponds to the JSON property `workerConfig`
        # @return [Google::Apis::DataprocV1beta2::InstanceGroupAutoscalingPolicyConfig]
        attr_accessor :worker_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @basic_algorithm = args[:basic_algorithm] if args.key?(:basic_algorithm)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @secondary_worker_config = args[:secondary_worker_config] if args.key?(:secondary_worker_config)
          @worker_config = args[:worker_config] if args.key?(:worker_config)
        end
      end
      
      # Basic algorithm for autoscaling.
      class BasicAutoscalingAlgorithm
        include Google::Apis::Core::Hashable
      
        # Optional. Duration between scaling events. A scaling period starts after the
        # update operation from the previous event has completed.Bounds: 2m, 1d. Default:
        # 2m.
        # Corresponds to the JSON property `cooldownPeriod`
        # @return [String]
        attr_accessor :cooldown_period
      
        # Basic autoscaling configurations for YARN.
        # Corresponds to the JSON property `yarnConfig`
        # @return [Google::Apis::DataprocV1beta2::BasicYarnAutoscalingConfig]
        attr_accessor :yarn_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cooldown_period = args[:cooldown_period] if args.key?(:cooldown_period)
          @yarn_config = args[:yarn_config] if args.key?(:yarn_config)
        end
      end
      
      # Basic autoscaling configurations for YARN.
      class BasicYarnAutoscalingConfig
        include Google::Apis::Core::Hashable
      
        # Required. Timeout for YARN graceful decommissioning of Node Managers.
        # Specifies the duration to wait for jobs to complete before forcefully removing
        # workers (and potentially interrupting jobs). Only applicable to downscaling
        # operations.Bounds: 0s, 1d.
        # Corresponds to the JSON property `gracefulDecommissionTimeout`
        # @return [String]
        attr_accessor :graceful_decommission_timeout
      
        # Required. Fraction of average pending memory in the last cooldown period for
        # which to remove workers. A scale-down factor of 1 will result in scaling down
        # so that there is no available memory remaining after the update (more
        # aggressive scaling). A scale-down factor of 0 disables removing workers, which
        # can be beneficial for autoscaling a single job.Bounds: 0.0, 1.0.
        # Corresponds to the JSON property `scaleDownFactor`
        # @return [Float]
        attr_accessor :scale_down_factor
      
        # Optional. Minimum scale-down threshold as a fraction of total cluster size
        # before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1
        # means the autoscaler must recommend at least a 2 worker scale-down for the
        # cluster to scale. A threshold of 0 means the autoscaler will scale down on any
        # recommended change.Bounds: 0.0, 1.0. Default: 0.0.
        # Corresponds to the JSON property `scaleDownMinWorkerFraction`
        # @return [Float]
        attr_accessor :scale_down_min_worker_fraction
      
        # Required. Fraction of average pending memory in the last cooldown period for
        # which to add workers. A scale-up factor of 1.0 will result in scaling up so
        # that there is no pending memory remaining after the update (more aggressive
        # scaling). A scale-up factor closer to 0 will result in a smaller magnitude of
        # scaling up (less aggressive scaling).Bounds: 0.0, 1.0.
        # Corresponds to the JSON property `scaleUpFactor`
        # @return [Float]
        attr_accessor :scale_up_factor
      
        # Optional. Minimum scale-up threshold as a fraction of total cluster size
        # before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1
        # means the autoscaler must recommend at least a 2-worker scale-up for the
        # cluster to scale. A threshold of 0 means the autoscaler will scale up on any
        # recommended change.Bounds: 0.0, 1.0. Default: 0.0.
        # Corresponds to the JSON property `scaleUpMinWorkerFraction`
        # @return [Float]
        attr_accessor :scale_up_min_worker_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @graceful_decommission_timeout = args[:graceful_decommission_timeout] if args.key?(:graceful_decommission_timeout)
          @scale_down_factor = args[:scale_down_factor] if args.key?(:scale_down_factor)
          @scale_down_min_worker_fraction = args[:scale_down_min_worker_fraction] if args.key?(:scale_down_min_worker_fraction)
          @scale_up_factor = args[:scale_up_factor] if args.key?(:scale_up_factor)
          @scale_up_min_worker_fraction = args[:scale_up_min_worker_fraction] if args.key?(:scale_up_min_worker_fraction)
        end
      end
      
      # Associates members with a role.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::DataprocV1beta2::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # members can have the following values:
        # allUsers: A special identifier that represents anyone who is  on the internet;
        # with or without a Google account.
        # allAuthenticatedUsers: A special identifier that represents anyone  who is
        # authenticated with a Google account or a service account.
        # user:`emailid`: An email address that represents a specific Google  account.
        # For example, alice@example.com .
        # serviceAccount:`emailid`: An email address that represents a service  account.
        # For example, my-other-app@appspot.gserviceaccount.com.
        # group:`emailid`: An email address that represents a Google group.  For example,
        # admins@example.com.
        # domain:`domain`: The G Suite domain (primary) that represents all the  users
        # of that domain. For example, google.com or example.com.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to members. For example, roles/viewer, roles/editor, or
        # roles/owner.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # A request to cancel a job.
      class CancelJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Describes the identifying information, config, and status of a cluster of
      # Compute Engine instances.
      class Cluster
        include Google::Apis::Core::Hashable
      
        # Required. The cluster name. Cluster names within a project must be unique.
        # Names of deleted clusters can be reused.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Output only. A cluster UUID (Unique Universal Identifier). Cloud Dataproc
        # generates this value when it creates the cluster.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        # The cluster config.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DataprocV1beta2::ClusterConfig]
        attr_accessor :config
      
        # Optional. The labels to associate with this cluster. Label keys must contain 1
        # to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/
        # rfc1035.txt). Label values may be empty, but, if present, must contain 1 to 63
        # characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt)
        # . No more than 32 labels can be associated with a cluster.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Contains cluster daemon metrics, such as HDFS and YARN stats.Beta Feature:
        # This report is available for testing purposes only. It may be changed before
        # final release.
        # Corresponds to the JSON property `metrics`
        # @return [Google::Apis::DataprocV1beta2::ClusterMetrics]
        attr_accessor :metrics
      
        # Required. The Google Cloud Platform project ID that the cluster belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The status of a cluster and its instances.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1beta2::ClusterStatus]
        attr_accessor :status
      
        # Output only. The previous cluster status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1beta2::ClusterStatus>]
        attr_accessor :status_history
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
          @config = args[:config] if args.key?(:config)
          @labels = args[:labels] if args.key?(:labels)
          @metrics = args[:metrics] if args.key?(:metrics)
          @project_id = args[:project_id] if args.key?(:project_id)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
        end
      end
      
      # The cluster config.
      class ClusterConfig
        include Google::Apis::Core::Hashable
      
        # Autoscaling Policy config associated with the cluster.
        # Corresponds to the JSON property `autoscalingConfig`
        # @return [Google::Apis::DataprocV1beta2::AutoscalingConfig]
        attr_accessor :autoscaling_config
      
        # Optional. A Google Cloud Storage bucket used to stage job dependencies, config
        # files, and job driver console output. If you do not specify a staging bucket,
        # Cloud Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for
        # your cluster's staging bucket according to the Google Compute Engine zone
        # where your cluster is deployed, and then create and manage this project-level,
        # per-location bucket (see Cloud Dataproc staging bucket).
        # Corresponds to the JSON property `configBucket`
        # @return [String]
        attr_accessor :config_bucket
      
        # Encryption settings for the cluster.
        # Corresponds to the JSON property `encryptionConfig`
        # @return [Google::Apis::DataprocV1beta2::EncryptionConfig]
        attr_accessor :encryption_config
      
        # Endpoint config for this cluster
        # Corresponds to the JSON property `endpointConfig`
        # @return [Google::Apis::DataprocV1beta2::EndpointConfig]
        attr_accessor :endpoint_config
      
        # Common config settings for resources of Compute Engine cluster instances,
        # applicable to all instances in the cluster.
        # Corresponds to the JSON property `gceClusterConfig`
        # @return [Google::Apis::DataprocV1beta2::GceClusterConfig]
        attr_accessor :gce_cluster_config
      
        # Optional. Commands to execute on each node after config is completed. By
        # default, executables are run on master and all worker nodes. You can test a
        # node's <code>role</code> metadata to run an executable on a master or worker
        # node, as shown below using curl (you can also use wget):
        # ROLE=$(curl -H Metadata-Flavor:Google
        # http://metadata/computeMetadata/v1beta2/instance/attributes/dataproc-role)
        # if [[ "$`ROLE`" == 'Master' ]]; then
        # ... master specific actions ...
        # else
        # ... worker specific actions ...
        # fi
        # Corresponds to the JSON property `initializationActions`
        # @return [Array<Google::Apis::DataprocV1beta2::NodeInitializationAction>]
        attr_accessor :initialization_actions
      
        # Specifies the cluster auto-delete schedule configuration.
        # Corresponds to the JSON property `lifecycleConfig`
        # @return [Google::Apis::DataprocV1beta2::LifecycleConfig]
        attr_accessor :lifecycle_config
      
        # The config settings for Compute Engine resources in an instance group, such as
        # a master or worker group.
        # Corresponds to the JSON property `masterConfig`
        # @return [Google::Apis::DataprocV1beta2::InstanceGroupConfig]
        attr_accessor :master_config
      
        # The config settings for Compute Engine resources in an instance group, such as
        # a master or worker group.
        # Corresponds to the JSON property `secondaryWorkerConfig`
        # @return [Google::Apis::DataprocV1beta2::InstanceGroupConfig]
        attr_accessor :secondary_worker_config
      
        # Security related configuration, including encryption, Kerberos, etc.
        # Corresponds to the JSON property `securityConfig`
        # @return [Google::Apis::DataprocV1beta2::SecurityConfig]
        attr_accessor :security_config
      
        # Specifies the selection and config of software inside the cluster.
        # Corresponds to the JSON property `softwareConfig`
        # @return [Google::Apis::DataprocV1beta2::SoftwareConfig]
        attr_accessor :software_config
      
        # The config settings for Compute Engine resources in an instance group, such as
        # a master or worker group.
        # Corresponds to the JSON property `workerConfig`
        # @return [Google::Apis::DataprocV1beta2::InstanceGroupConfig]
        attr_accessor :worker_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoscaling_config = args[:autoscaling_config] if args.key?(:autoscaling_config)
          @config_bucket = args[:config_bucket] if args.key?(:config_bucket)
          @encryption_config = args[:encryption_config] if args.key?(:encryption_config)
          @endpoint_config = args[:endpoint_config] if args.key?(:endpoint_config)
          @gce_cluster_config = args[:gce_cluster_config] if args.key?(:gce_cluster_config)
          @initialization_actions = args[:initialization_actions] if args.key?(:initialization_actions)
          @lifecycle_config = args[:lifecycle_config] if args.key?(:lifecycle_config)
          @master_config = args[:master_config] if args.key?(:master_config)
          @secondary_worker_config = args[:secondary_worker_config] if args.key?(:secondary_worker_config)
          @security_config = args[:security_config] if args.key?(:security_config)
          @software_config = args[:software_config] if args.key?(:software_config)
          @worker_config = args[:worker_config] if args.key?(:worker_config)
        end
      end
      
      # Contains cluster daemon metrics, such as HDFS and YARN stats.Beta Feature:
      # This report is available for testing purposes only. It may be changed before
      # final release.
      class ClusterMetrics
        include Google::Apis::Core::Hashable
      
        # The HDFS metrics.
        # Corresponds to the JSON property `hdfsMetrics`
        # @return [Hash<String,Fixnum>]
        attr_accessor :hdfs_metrics
      
        # The YARN metrics.
        # Corresponds to the JSON property `yarnMetrics`
        # @return [Hash<String,Fixnum>]
        attr_accessor :yarn_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hdfs_metrics = args[:hdfs_metrics] if args.key?(:hdfs_metrics)
          @yarn_metrics = args[:yarn_metrics] if args.key?(:yarn_metrics)
        end
      end
      
      # The cluster operation triggered by a workflow.
      class ClusterOperation
        include Google::Apis::Core::Hashable
      
        # Output only. Indicates the operation is done.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # Output only. Error, if operation failed.
        # Corresponds to the JSON property `error`
        # @return [String]
        attr_accessor :error
      
        # Output only. The id of the cluster operation.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
        end
      end
      
      # Metadata describing the operation.
      class ClusterOperationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. Name of the cluster for the operation.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Output only. Cluster UUID for the operation.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        # Output only. Short description of operation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. Labels associated with the operation
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The operation type.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The status of the operation.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1beta2::ClusterOperationStatus]
        attr_accessor :status
      
        # Output only. The previous operation status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1beta2::ClusterOperationStatus>]
        attr_accessor :status_history
      
        # Output only. Errors encountered during operation execution.
        # Corresponds to the JSON property `warnings`
        # @return [Array<String>]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
          @description = args[:description] if args.key?(:description)
          @labels = args[:labels] if args.key?(:labels)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
      end
      
      # The status of the operation.
      class ClusterOperationStatus
        include Google::Apis::Core::Hashable
      
        # Output only. A message containing any operation metadata details.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # Output only. A message containing the detailed operation state.
        # Corresponds to the JSON property `innerState`
        # @return [String]
        attr_accessor :inner_state
      
        # Output only. A message containing the operation state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The time this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @inner_state = args[:inner_state] if args.key?(:inner_state)
          @state = args[:state] if args.key?(:state)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
        end
      end
      
      # A selector that chooses target cluster for jobs based on metadata.
      class ClusterSelector
        include Google::Apis::Core::Hashable
      
        # Required. The cluster labels. Cluster must have all labels to match.
        # Corresponds to the JSON property `clusterLabels`
        # @return [Hash<String,String>]
        attr_accessor :cluster_labels
      
        # Optional. The zone where workflow process executes. This parameter does not
        # affect the selection of the cluster.If unspecified, the zone of the first
        # cluster matching the selector is used.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_labels = args[:cluster_labels] if args.key?(:cluster_labels)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # The status of a cluster and its instances.
      class ClusterStatus
        include Google::Apis::Core::Hashable
      
        # Output only. Optional details of cluster's state.
        # Corresponds to the JSON property `detail`
        # @return [String]
        attr_accessor :detail
      
        # Output only. The cluster's state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Time when this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        # Output only. Additional state information that includes status reported by the
        # agent.
        # Corresponds to the JSON property `substate`
        # @return [String]
        attr_accessor :substate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detail = args[:detail] if args.key?(:detail)
          @state = args[:state] if args.key?(:state)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
          @substate = args[:substate] if args.key?(:substate)
        end
      end
      
      # A request to collect cluster diagnostic information.
      class DiagnoseClusterRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The location of diagnostic output.
      class DiagnoseClusterResults
        include Google::Apis::Core::Hashable
      
        # Output only. The Cloud Storage URI of the diagnostic output. The output report
        # is a plain text file with a summary of collected diagnostics.
        # Corresponds to the JSON property `outputUri`
        # @return [String]
        attr_accessor :output_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_uri = args[:output_uri] if args.key?(:output_uri)
        end
      end
      
      # Specifies the config of disk options for a group of VM instances.
      class DiskConfig
        include Google::Apis::Core::Hashable
      
        # Optional. Size in GB of the boot disk (default is 500GB).
        # Corresponds to the JSON property `bootDiskSizeGb`
        # @return [Fixnum]
        attr_accessor :boot_disk_size_gb
      
        # Optional. Type of the boot disk (default is "pd-standard"). Valid values: "pd-
        # ssd" (Persistent Disk Solid State Drive) or "pd-standard" (Persistent Disk
        # Hard Disk Drive).
        # Corresponds to the JSON property `bootDiskType`
        # @return [String]
        attr_accessor :boot_disk_type
      
        # Number of attached SSDs, from 0 to 4 (default is 0). If SSDs are not attached,
        # the boot disk is used to store runtime logs and HDFS (https://hadoop.apache.
        # org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached,
        # this runtime bulk data is spread across them, and the boot disk contains only
        # basic config and installed binaries.
        # Corresponds to the JSON property `numLocalSsds`
        # @return [Fixnum]
        attr_accessor :num_local_ssds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boot_disk_size_gb = args[:boot_disk_size_gb] if args.key?(:boot_disk_size_gb)
          @boot_disk_type = args[:boot_disk_type] if args.key?(:boot_disk_type)
          @num_local_ssds = args[:num_local_ssds] if args.key?(:num_local_ssds)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for Empty is empty JSON object ``.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Encryption settings for the cluster.
      class EncryptionConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The Cloud KMS key name to use for PD disk encryption for all
        # instances in the cluster.
        # Corresponds to the JSON property `gcePdKmsKeyName`
        # @return [String]
        attr_accessor :gce_pd_kms_key_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gce_pd_kms_key_name = args[:gce_pd_kms_key_name] if args.key?(:gce_pd_kms_key_name)
        end
      end
      
      # Endpoint config for this cluster
      class EndpointConfig
        include Google::Apis::Core::Hashable
      
        # Optional. If true, enable http access to specific ports on the cluster from
        # external sources. Defaults to false.
        # Corresponds to the JSON property `enableHttpPortAccess`
        # @return [Boolean]
        attr_accessor :enable_http_port_access
        alias_method :enable_http_port_access?, :enable_http_port_access
      
        # Output only. The map of port descriptions to URLs. Will only be populated if
        # enable_http_port_access is true.
        # Corresponds to the JSON property `httpPorts`
        # @return [Hash<String,String>]
        attr_accessor :http_ports
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_http_port_access = args[:enable_http_port_access] if args.key?(:enable_http_port_access)
          @http_ports = args[:http_ports] if args.key?(:http_ports)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class Expr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in Common Expression Language syntax.
        # The application context of the containing message determines which well-known
        # feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing its
        # purpose. This can be used e.g. in UIs which allow to enter the expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Common config settings for resources of Compute Engine cluster instances,
      # applicable to all instances in the cluster.
      class GceClusterConfig
        include Google::Apis::Core::Hashable
      
        # Optional. If true, all instances in the cluster will only have internal IP
        # addresses. By default, clusters are not restricted to internal IP addresses,
        # and will have ephemeral external IP addresses assigned to each instance. This
        # internal_ip_only restriction can only be enabled for subnetwork enabled
        # networks, and all off-cluster dependencies must be configured to be accessible
        # without external IP addresses.
        # Corresponds to the JSON property `internalIpOnly`
        # @return [Boolean]
        attr_accessor :internal_ip_only
        alias_method :internal_ip_only?, :internal_ip_only
      
        # The Compute Engine metadata entries to add to all instances (see Project and
        # instance metadata (https://cloud.google.com/compute/docs/storing-retrieving-
        # metadata#project_and_instance_metadata)).
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Optional. The Compute Engine network to be used for machine communications.
        # Cannot be specified with subnetwork_uri. If neither network_uri nor
        # subnetwork_uri is specified, the "default" network of the project is used, if
        # it exists. Cannot be a "Custom Subnet Network" (see Using Subnetworks for more
        # information).A full URL, partial URI, or short name are valid. Examples:
        # https://www.googleapis.com/compute/v1/projects/[project_id]/regions/global/
        # default
        # projects/[project_id]/regions/global/default
        # default
        # Corresponds to the JSON property `networkUri`
        # @return [String]
        attr_accessor :network_uri
      
        # Reservation Affinity for consuming Zonal reservation.
        # Corresponds to the JSON property `reservationAffinity`
        # @return [Google::Apis::DataprocV1beta2::ReservationAffinity]
        attr_accessor :reservation_affinity
      
        # Optional. The service account of the instances. Defaults to the default
        # Compute Engine service account. Custom service accounts need permissions
        # equivalent to the following IAM roles:
        # roles/logging.logWriter
        # roles/storage.objectAdmin(see https://cloud.google.com/compute/docs/access/
        # service-accounts#custom_service_accounts for more information). Example: [
        # account_id]@[project_id].iam.gserviceaccount.com
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # Optional. The URIs of service account scopes to be included in Compute Engine
        # instances. The following base set of scopes is always included:
        # https://www.googleapis.com/auth/cloud.useraccounts.readonly
        # https://www.googleapis.com/auth/devstorage.read_write
        # https://www.googleapis.com/auth/logging.writeIf no scopes are specified, the
        # following defaults are also provided:
        # https://www.googleapis.com/auth/bigquery
        # https://www.googleapis.com/auth/bigtable.admin.table
        # https://www.googleapis.com/auth/bigtable.data
        # https://www.googleapis.com/auth/devstorage.full_control
        # Corresponds to the JSON property `serviceAccountScopes`
        # @return [Array<String>]
        attr_accessor :service_account_scopes
      
        # Optional. The Compute Engine subnetwork to be used for machine communications.
        # Cannot be specified with network_uri.A full URL, partial URI, or short name
        # are valid. Examples:
        # https://www.googleapis.com/compute/v1/projects/[project_id]/regions/us-east1/
        # subnetworks/sub0
        # projects/[project_id]/regions/us-east1/subnetworks/sub0
        # sub0
        # Corresponds to the JSON property `subnetworkUri`
        # @return [String]
        attr_accessor :subnetwork_uri
      
        # The Compute Engine tags to add to all instances (see Tagging instances).
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # Optional. The zone where the Compute Engine cluster will be located. On a
        # create request, it is required in the "global" region. If omitted in a non-
        # global Cloud Dataproc region, the service will pick a zone in the
        # corresponding Compute Engine region. On a get request, zone will always be
        # present.A full URL, partial URI, or short name are valid. Examples:
        # https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]
        # projects/[project_id]/zones/[zone]
        # us-central1-f
        # Corresponds to the JSON property `zoneUri`
        # @return [String]
        attr_accessor :zone_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @internal_ip_only = args[:internal_ip_only] if args.key?(:internal_ip_only)
          @metadata = args[:metadata] if args.key?(:metadata)
          @network_uri = args[:network_uri] if args.key?(:network_uri)
          @reservation_affinity = args[:reservation_affinity] if args.key?(:reservation_affinity)
          @service_account = args[:service_account] if args.key?(:service_account)
          @service_account_scopes = args[:service_account_scopes] if args.key?(:service_account_scopes)
          @subnetwork_uri = args[:subnetwork_uri] if args.key?(:subnetwork_uri)
          @tags = args[:tags] if args.key?(:tags)
          @zone_uri = args[:zone_uri] if args.key?(:zone_uri)
        end
      end
      
      # Request message for GetIamPolicy method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::DataprocV1beta2::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Encapsulates settings provided to GetIamPolicy.
      class GetPolicyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. The policy format version to be returned.Valid values are 0, 1, and
        # 3. Requests specifying an invalid value will be rejected.Requests for policies
        # with any conditional bindings must specify version 3. Policies without any
        # conditional bindings may specify any valid value or leave the field unset.
        # Corresponds to the JSON property `requestedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :requested_policy_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_policy_version = args[:requested_policy_version] if args.key?(:requested_policy_version)
        end
      end
      
      # A Cloud Dataproc job for running Apache Hadoop MapReduce (https://hadoop.
      # apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/
      # MapReduceTutorial.html) jobs on Apache Hadoop YARN (https://hadoop.apache.org/
      # docs/r2.7.1/hadoop-yarn/hadoop-yarn-site/YARN.html).
      class HadoopJob
        include Google::Apis::Core::Hashable
      
        # Optional. HCFS URIs of archives to be extracted in the working directory of
        # Hadoop drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, or .
        # zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # Optional. The arguments to pass to the driver. Do not include arguments, such
        # as -libjars or -Dfoo=bar, that can be set as job properties, since a collision
        # may occur that causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Optional. HCFS (Hadoop Compatible Filesystem) URIs of files to be copied to
        # the working directory of Hadoop drivers and distributed tasks. Useful for
        # naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # Optional. Jar file URIs to add to the CLASSPATHs of the Hadoop driver and
        # tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # The name of the driver's main class. The jar file containing the class must be
        # in the default CLASSPATH or specified in jar_file_uris.
        # Corresponds to the JSON property `mainClass`
        # @return [String]
        attr_accessor :main_class
      
        # The HCFS URI of the jar file containing the main class. Examples:  'gs://foo-
        # bucket/analytics-binaries/extract-useful-metrics-mr.jar'  'hdfs:/tmp/test-
        # samples/custom-wordcount.jar'  'file:///home/usr/lib/hadoop-mapreduce/hadoop-
        # mapreduce-examples.jar'
        # Corresponds to the JSON property `mainJarFileUri`
        # @return [String]
        attr_accessor :main_jar_file_uri
      
        # Optional. A mapping of property names to values, used to configure Hadoop.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site and classes
        # in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @args = args[:args] if args.key?(:args)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @main_class = args[:main_class] if args.key?(:main_class)
          @main_jar_file_uri = args[:main_jar_file_uri] if args.key?(:main_jar_file_uri)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A Cloud Dataproc job for running Apache Hive (https://hive.apache.org/)
      # queries on YARN.
      class HiveJob
        include Google::Apis::Core::Hashable
      
        # Optional. Whether to continue executing queries if a query fails. The default
        # value is false. Setting to true can be useful when executing independent
        # parallel queries.
        # Corresponds to the JSON property `continueOnFailure`
        # @return [Boolean]
        attr_accessor :continue_on_failure
        alias_method :continue_on_failure?, :continue_on_failure
      
        # Optional. HCFS URIs of jar files to add to the CLASSPATH of the Hive server
        # and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes and UDFs.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # Optional. A mapping of property names and values, used to configure Hive.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/
        # hive/conf/hive-site.xml, and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The HCFS URI of the script that contains Hive queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1beta2::QueryList]
        attr_accessor :query_list
      
        # Optional. Mapping of query variable names to values (equivalent to the Hive
        # command: SET name="value";).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @continue_on_failure = args[:continue_on_failure] if args.key?(:continue_on_failure)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @properties = args[:properties] if args.key?(:properties)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
        end
      end
      
      # Configuration for the size bounds of an instance group, including its
      # proportional size to other groups.
      class InstanceGroupAutoscalingPolicyConfig
        include Google::Apis::Core::Hashable
      
        # Optional. Maximum number of instances for this group. Required for primary
        # workers. Note that by default, clusters will not use secondary workers.
        # Required for secondary workers if the minimum secondary instances is set.
        # Primary workers - Bounds: [min_instances, ). Required. Secondary workers -
        # Bounds: [min_instances, ). Default: 0.
        # Corresponds to the JSON property `maxInstances`
        # @return [Fixnum]
        attr_accessor :max_instances
      
        # Optional. Minimum number of instances for this group.Primary workers - Bounds:
        # 2, max_instances. Default: 2. Secondary workers - Bounds: 0, max_instances.
        # Default: 0.
        # Corresponds to the JSON property `minInstances`
        # @return [Fixnum]
        attr_accessor :min_instances
      
        # Optional. Weight for the instance group, which is used to determine the
        # fraction of total workers in the cluster from this instance group. For example,
        # if primary workers have weight 2, and secondary workers have weight 1, the
        # cluster will have approximately 2 primary workers for each secondary worker.
        # The cluster may not reach the specified balance if constrained by min/max
        # bounds or other autoscaling settings. For example, if max_instances for
        # secondary workers is 0, then only primary workers will be added. The cluster
        # can also be out of balance when created.If weight is not set on any instance
        # group, the cluster will default to equal weight for all groups: the cluster
        # will attempt to maintain an equal number of workers in each group within the
        # configured size bounds for each group. If weight is set for one group only,
        # the cluster will default to zero weight on the unset group. For example if
        # weight is set only on primary workers, the cluster will use primary workers
        # only and no secondary workers.
        # Corresponds to the JSON property `weight`
        # @return [Fixnum]
        attr_accessor :weight
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_instances = args[:max_instances] if args.key?(:max_instances)
          @min_instances = args[:min_instances] if args.key?(:min_instances)
          @weight = args[:weight] if args.key?(:weight)
        end
      end
      
      # The config settings for Compute Engine resources in an instance group, such as
      # a master or worker group.
      class InstanceGroupConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The Compute Engine accelerator configuration for these instances.
        # Beta Feature: This feature is still under development. It may be changed
        # before final release.
        # Corresponds to the JSON property `accelerators`
        # @return [Array<Google::Apis::DataprocV1beta2::AcceleratorConfig>]
        attr_accessor :accelerators
      
        # Specifies the config of disk options for a group of VM instances.
        # Corresponds to the JSON property `diskConfig`
        # @return [Google::Apis::DataprocV1beta2::DiskConfig]
        attr_accessor :disk_config
      
        # Optional. The Compute Engine image resource used for cluster instances. It can
        # be specified or may be inferred from SoftwareConfig.image_version.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Output only. The list of instance names. Cloud Dataproc derives the names from
        # cluster_name, num_instances, and the instance group.
        # Corresponds to the JSON property `instanceNames`
        # @return [Array<String>]
        attr_accessor :instance_names
      
        # Optional. Specifies that this instance group contains preemptible instances.
        # Corresponds to the JSON property `isPreemptible`
        # @return [Boolean]
        attr_accessor :is_preemptible
        alias_method :is_preemptible?, :is_preemptible
      
        # Optional. The Compute Engine machine type used for cluster instances.A full
        # URL, partial URI, or short name are valid. Examples:
        # https://www.googleapis.com/compute/v1/projects/[project_id]/zones/us-east1-a/
        # machineTypes/n1-standard-2
        # projects/[project_id]/zones/us-east1-a/machineTypes/n1-standard-2
        # n1-standard-2Auto Zone Exception: If you are using the Cloud Dataproc Auto
        # Zone Placement feature, you must use the short name of the machine type
        # resource, for example, n1-standard-2.
        # Corresponds to the JSON property `machineTypeUri`
        # @return [String]
        attr_accessor :machine_type_uri
      
        # Specifies the resources used to actively manage an instance group.
        # Corresponds to the JSON property `managedGroupConfig`
        # @return [Google::Apis::DataprocV1beta2::ManagedGroupConfig]
        attr_accessor :managed_group_config
      
        # Specifies the minimum cpu platform for the Instance Group. See Cloud Dataproc&
        # rarr;Minimum CPU Platform.
        # Corresponds to the JSON property `minCpuPlatform`
        # @return [String]
        attr_accessor :min_cpu_platform
      
        # Optional. The number of VM instances in the instance group. For master
        # instance groups, must be set to 1.
        # Corresponds to the JSON property `numInstances`
        # @return [Fixnum]
        attr_accessor :num_instances
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerators = args[:accelerators] if args.key?(:accelerators)
          @disk_config = args[:disk_config] if args.key?(:disk_config)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @instance_names = args[:instance_names] if args.key?(:instance_names)
          @is_preemptible = args[:is_preemptible] if args.key?(:is_preemptible)
          @machine_type_uri = args[:machine_type_uri] if args.key?(:machine_type_uri)
          @managed_group_config = args[:managed_group_config] if args.key?(:managed_group_config)
          @min_cpu_platform = args[:min_cpu_platform] if args.key?(:min_cpu_platform)
          @num_instances = args[:num_instances] if args.key?(:num_instances)
        end
      end
      
      # A request to instantiate a workflow template.
      class InstantiateWorkflowTemplateRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. Please use request_id field instead.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Optional. Map from parameter names to values that should be used for those
        # parameters. Values may not exceed 100 characters.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,String>]
        attr_accessor :parameters
      
        # Optional. A tag that prevents multiple concurrent workflow instances with the
        # same tag from running. This mitigates risk of concurrent instances started due
        # to retries.It is recommended to always set this value to a UUID (https://en.
        # wikipedia.org/wiki/Universally_unique_identifier).The tag must contain only
        # letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). The
        # maximum length is 40 characters.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        # Optional. The version of workflow template to instantiate. If specified, the
        # workflow will be instantiated only if the current version of the workflow
        # template has the supplied version.This option cannot be used to instantiate a
        # previous version of workflow template.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @parameters = args[:parameters] if args.key?(:parameters)
          @request_id = args[:request_id] if args.key?(:request_id)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A Cloud Dataproc job resource.
      class Job
        include Google::Apis::Core::Hashable
      
        # Output only. If present, the location of miscellaneous control files which may
        # be used as part of job setup and handling. If not present, control files may
        # be placed in the same location as driver_output_uri.
        # Corresponds to the JSON property `driverControlFilesUri`
        # @return [String]
        attr_accessor :driver_control_files_uri
      
        # Output only. A URI pointing to the location of the stdout of the job's driver
        # program.
        # Corresponds to the JSON property `driverOutputResourceUri`
        # @return [String]
        attr_accessor :driver_output_resource_uri
      
        # A Cloud Dataproc job for running Apache Hadoop MapReduce (https://hadoop.
        # apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/
        # MapReduceTutorial.html) jobs on Apache Hadoop YARN (https://hadoop.apache.org/
        # docs/r2.7.1/hadoop-yarn/hadoop-yarn-site/YARN.html).
        # Corresponds to the JSON property `hadoopJob`
        # @return [Google::Apis::DataprocV1beta2::HadoopJob]
        attr_accessor :hadoop_job
      
        # A Cloud Dataproc job for running Apache Hive (https://hive.apache.org/)
        # queries on YARN.
        # Corresponds to the JSON property `hiveJob`
        # @return [Google::Apis::DataprocV1beta2::HiveJob]
        attr_accessor :hive_job
      
        # Output only. A UUID that uniquely identifies a job within the project over
        # time. This is in contrast to a user-settable reference.job_id that may be
        # reused over time.
        # Corresponds to the JSON property `jobUuid`
        # @return [String]
        attr_accessor :job_uuid
      
        # Optional. The labels to associate with this job. Label keys must contain 1 to
        # 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.
        # txt). Label values may be empty, but, if present, must contain 1 to 63
        # characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt)
        # . No more than 32 labels can be associated with a job.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # A Cloud Dataproc job for running Apache Pig (https://pig.apache.org/) queries
        # on YARN.
        # Corresponds to the JSON property `pigJob`
        # @return [Google::Apis::DataprocV1beta2::PigJob]
        attr_accessor :pig_job
      
        # Cloud Dataproc job config.
        # Corresponds to the JSON property `placement`
        # @return [Google::Apis::DataprocV1beta2::JobPlacement]
        attr_accessor :placement
      
        # A Cloud Dataproc job for running Presto (https://prestosql.io/) queries
        # Corresponds to the JSON property `prestoJob`
        # @return [Google::Apis::DataprocV1beta2::PrestoJob]
        attr_accessor :presto_job
      
        # A Cloud Dataproc job for running Apache PySpark (https://spark.apache.org/docs/
        # 0.9.0/python-programming-guide.html) applications on YARN.
        # Corresponds to the JSON property `pysparkJob`
        # @return [Google::Apis::DataprocV1beta2::PySparkJob]
        attr_accessor :pyspark_job
      
        # Encapsulates the full scoping used to reference a job.
        # Corresponds to the JSON property `reference`
        # @return [Google::Apis::DataprocV1beta2::JobReference]
        attr_accessor :reference
      
        # Job scheduling options.
        # Corresponds to the JSON property `scheduling`
        # @return [Google::Apis::DataprocV1beta2::JobScheduling]
        attr_accessor :scheduling
      
        # A Cloud Dataproc job for running Apache Spark (http://spark.apache.org/)
        # applications on YARN. The specification of the main method to call to drive
        # the job. Specify either the jar file that contains the main class or the main
        # class name. To pass both a main jar and a main class in that jar, add the jar
        # to CommonJob.jar_file_uris, and then specify the main class name in main_class.
        # Corresponds to the JSON property `sparkJob`
        # @return [Google::Apis::DataprocV1beta2::SparkJob]
        attr_accessor :spark_job
      
        # A Cloud Dataproc job for running Apache SparkR (https://spark.apache.org/docs/
        # latest/sparkr.html) applications on YARN.
        # Corresponds to the JSON property `sparkRJob`
        # @return [Google::Apis::DataprocV1beta2::SparkRJob]
        attr_accessor :spark_r_job
      
        # A Cloud Dataproc job for running Apache Spark SQL (http://spark.apache.org/sql/
        # ) queries.
        # Corresponds to the JSON property `sparkSqlJob`
        # @return [Google::Apis::DataprocV1beta2::SparkSqlJob]
        attr_accessor :spark_sql_job
      
        # Cloud Dataproc job status.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1beta2::JobStatus]
        attr_accessor :status
      
        # Output only. The previous job status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1beta2::JobStatus>]
        attr_accessor :status_history
      
        # Output only. The email address of the user submitting the job. For jobs
        # submitted on the cluster, the address is <code>username@hostname</code>.
        # Corresponds to the JSON property `submittedBy`
        # @return [String]
        attr_accessor :submitted_by
      
        # Output only. The collection of YARN applications spun up by this job.Beta
        # Feature: This report is available for testing purposes only. It may be changed
        # before final release.
        # Corresponds to the JSON property `yarnApplications`
        # @return [Array<Google::Apis::DataprocV1beta2::YarnApplication>]
        attr_accessor :yarn_applications
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @driver_control_files_uri = args[:driver_control_files_uri] if args.key?(:driver_control_files_uri)
          @driver_output_resource_uri = args[:driver_output_resource_uri] if args.key?(:driver_output_resource_uri)
          @hadoop_job = args[:hadoop_job] if args.key?(:hadoop_job)
          @hive_job = args[:hive_job] if args.key?(:hive_job)
          @job_uuid = args[:job_uuid] if args.key?(:job_uuid)
          @labels = args[:labels] if args.key?(:labels)
          @pig_job = args[:pig_job] if args.key?(:pig_job)
          @placement = args[:placement] if args.key?(:placement)
          @presto_job = args[:presto_job] if args.key?(:presto_job)
          @pyspark_job = args[:pyspark_job] if args.key?(:pyspark_job)
          @reference = args[:reference] if args.key?(:reference)
          @scheduling = args[:scheduling] if args.key?(:scheduling)
          @spark_job = args[:spark_job] if args.key?(:spark_job)
          @spark_r_job = args[:spark_r_job] if args.key?(:spark_r_job)
          @spark_sql_job = args[:spark_sql_job] if args.key?(:spark_sql_job)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @submitted_by = args[:submitted_by] if args.key?(:submitted_by)
          @yarn_applications = args[:yarn_applications] if args.key?(:yarn_applications)
        end
      end
      
      # Cloud Dataproc job config.
      class JobPlacement
        include Google::Apis::Core::Hashable
      
        # Required. The name of the cluster where the job will be submitted.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Output only. A cluster UUID generated by the Cloud Dataproc service when the
        # job is submitted.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
        end
      end
      
      # Encapsulates the full scoping used to reference a job.
      class JobReference
        include Google::Apis::Core::Hashable
      
        # Optional. The job ID, which must be unique within the project.The ID must
        # contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or hyphens (-)
        # . The maximum length is 100 characters.If not specified by the caller, the job
        # ID will be provided by the server.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # Required. The ID of the Google Cloud Platform project that the job belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_id = args[:job_id] if args.key?(:job_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Job scheduling options.
      class JobScheduling
        include Google::Apis::Core::Hashable
      
        # Optional. Maximum number of times per hour a driver may be restarted as a
        # result of driver terminating with non-zero code before job is reported failed.
        # A job may be reported as thrashing if driver exits with non-zero code 4 times
        # within 10 minute window.Maximum value is 10.
        # Corresponds to the JSON property `maxFailuresPerHour`
        # @return [Fixnum]
        attr_accessor :max_failures_per_hour
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_failures_per_hour = args[:max_failures_per_hour] if args.key?(:max_failures_per_hour)
        end
      end
      
      # Cloud Dataproc job status.
      class JobStatus
        include Google::Apis::Core::Hashable
      
        # Output only. Optional job state details, such as an error description if the
        # state is <code>ERROR</code>.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # Output only. A state message specifying the overall job state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The time when this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        # Output only. Additional state information, which includes status reported by
        # the agent.
        # Corresponds to the JSON property `substate`
        # @return [String]
        attr_accessor :substate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @state = args[:state] if args.key?(:state)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
          @substate = args[:substate] if args.key?(:substate)
        end
      end
      
      # Specifies Kerberos related configuration.
      class KerberosConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The admin server (IP or hostname) for the remote trusted realm in a
        # cross realm trust relationship.
        # Corresponds to the JSON property `crossRealmTrustAdminServer`
        # @return [String]
        attr_accessor :cross_realm_trust_admin_server
      
        # Optional. The KDC (IP or hostname) for the remote trusted realm in a cross
        # realm trust relationship.
        # Corresponds to the JSON property `crossRealmTrustKdc`
        # @return [String]
        attr_accessor :cross_realm_trust_kdc
      
        # Optional. The remote realm the Dataproc on-cluster KDC will trust, should the
        # user enable cross realm trust.
        # Corresponds to the JSON property `crossRealmTrustRealm`
        # @return [String]
        attr_accessor :cross_realm_trust_realm
      
        # Optional. The Cloud Storage URI of a KMS encrypted file containing the shared
        # password between the on-cluster Kerberos realm and the remote trusted realm,
        # in a cross realm trust relationship.
        # Corresponds to the JSON property `crossRealmTrustSharedPasswordUri`
        # @return [String]
        attr_accessor :cross_realm_trust_shared_password_uri
      
        # Optional. Flag to indicate whether to Kerberize the cluster.
        # Corresponds to the JSON property `enableKerberos`
        # @return [Boolean]
        attr_accessor :enable_kerberos
        alias_method :enable_kerberos?, :enable_kerberos
      
        # Optional. The Cloud Storage URI of a KMS encrypted file containing the master
        # key of the KDC database.
        # Corresponds to the JSON property `kdcDbKeyUri`
        # @return [String]
        attr_accessor :kdc_db_key_uri
      
        # Optional. The Cloud Storage URI of a KMS encrypted file containing the
        # password to the user provided key. For the self-signed certificate, this
        # password is generated by Dataproc.
        # Corresponds to the JSON property `keyPasswordUri`
        # @return [String]
        attr_accessor :key_password_uri
      
        # Optional. The Cloud Storage URI of a KMS encrypted file containing the
        # password to the user provided keystore. For the self-signed certificate, this
        # password is generated by Dataproc.
        # Corresponds to the JSON property `keystorePasswordUri`
        # @return [String]
        attr_accessor :keystore_password_uri
      
        # Optional. The Cloud Storage URI of the keystore file used for SSL encryption.
        # If not provided, Dataproc will provide a self-signed certificate.
        # Corresponds to the JSON property `keystoreUri`
        # @return [String]
        attr_accessor :keystore_uri
      
        # Required. The uri of the KMS key used to encrypt various sensitive files.
        # Corresponds to the JSON property `kmsKeyUri`
        # @return [String]
        attr_accessor :kms_key_uri
      
        # Optional. The name of the on-cluster Kerberos realm. If not specified, the
        # uppercased domain of hostnames will be the realm.
        # Corresponds to the JSON property `realm`
        # @return [String]
        attr_accessor :realm
      
        # Required. The Cloud Storage URI of a KMS encrypted file containing the root
        # principal password.
        # Corresponds to the JSON property `rootPrincipalPasswordUri`
        # @return [String]
        attr_accessor :root_principal_password_uri
      
        # Optional. The lifetime of the ticket granting ticket, in hours. If not
        # specified, or user specifies 0, then default value 10 will be used.
        # Corresponds to the JSON property `tgtLifetimeHours`
        # @return [Fixnum]
        attr_accessor :tgt_lifetime_hours
      
        # Optional. The Cloud Storage URI of a KMS encrypted file containing the
        # password to the user provided truststore. For the self-signed certificate,
        # this password is generated by Dataproc.
        # Corresponds to the JSON property `truststorePasswordUri`
        # @return [String]
        attr_accessor :truststore_password_uri
      
        # Optional. The Cloud Storage URI of the truststore file used for SSL encryption.
        # If not provided, Dataproc will provide a self-signed certificate.
        # Corresponds to the JSON property `truststoreUri`
        # @return [String]
        attr_accessor :truststore_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cross_realm_trust_admin_server = args[:cross_realm_trust_admin_server] if args.key?(:cross_realm_trust_admin_server)
          @cross_realm_trust_kdc = args[:cross_realm_trust_kdc] if args.key?(:cross_realm_trust_kdc)
          @cross_realm_trust_realm = args[:cross_realm_trust_realm] if args.key?(:cross_realm_trust_realm)
          @cross_realm_trust_shared_password_uri = args[:cross_realm_trust_shared_password_uri] if args.key?(:cross_realm_trust_shared_password_uri)
          @enable_kerberos = args[:enable_kerberos] if args.key?(:enable_kerberos)
          @kdc_db_key_uri = args[:kdc_db_key_uri] if args.key?(:kdc_db_key_uri)
          @key_password_uri = args[:key_password_uri] if args.key?(:key_password_uri)
          @keystore_password_uri = args[:keystore_password_uri] if args.key?(:keystore_password_uri)
          @keystore_uri = args[:keystore_uri] if args.key?(:keystore_uri)
          @kms_key_uri = args[:kms_key_uri] if args.key?(:kms_key_uri)
          @realm = args[:realm] if args.key?(:realm)
          @root_principal_password_uri = args[:root_principal_password_uri] if args.key?(:root_principal_password_uri)
          @tgt_lifetime_hours = args[:tgt_lifetime_hours] if args.key?(:tgt_lifetime_hours)
          @truststore_password_uri = args[:truststore_password_uri] if args.key?(:truststore_password_uri)
          @truststore_uri = args[:truststore_uri] if args.key?(:truststore_uri)
        end
      end
      
      # Specifies the cluster auto-delete schedule configuration.
      class LifecycleConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The time when cluster will be auto-deleted.
        # Corresponds to the JSON property `autoDeleteTime`
        # @return [String]
        attr_accessor :auto_delete_time
      
        # Optional. The lifetime duration of cluster. The cluster will be auto-deleted
        # at the end of this period. Valid range: 10m, 14d.Example: "1d", to delete the
        # cluster 1 day after its creation..
        # Corresponds to the JSON property `autoDeleteTtl`
        # @return [String]
        attr_accessor :auto_delete_ttl
      
        # Optional. The duration to keep the cluster alive while idling. Passing this
        # threshold will cause the cluster to be deleted. Valid range: 10m, 14d.Example:
        # "10m", the minimum value, to delete the cluster when it has had no jobs
        # running for 10 minutes.
        # Corresponds to the JSON property `idleDeleteTtl`
        # @return [String]
        attr_accessor :idle_delete_ttl
      
        # Output only. The time when cluster became idle (most recent job finished) and
        # became eligible for deletion due to idleness.
        # Corresponds to the JSON property `idleStartTime`
        # @return [String]
        attr_accessor :idle_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_delete_time = args[:auto_delete_time] if args.key?(:auto_delete_time)
          @auto_delete_ttl = args[:auto_delete_ttl] if args.key?(:auto_delete_ttl)
          @idle_delete_ttl = args[:idle_delete_ttl] if args.key?(:idle_delete_ttl)
          @idle_start_time = args[:idle_start_time] if args.key?(:idle_start_time)
        end
      end
      
      # A response to a request to list autoscaling policies in a project.
      class ListAutoscalingPoliciesResponse
        include Google::Apis::Core::Hashable
      
        # Output only. This token is included in the response if there are more results
        # to fetch.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Output only. Autoscaling policies list.
        # Corresponds to the JSON property `policies`
        # @return [Array<Google::Apis::DataprocV1beta2::AutoscalingPolicy>]
        attr_accessor :policies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @policies = args[:policies] if args.key?(:policies)
        end
      end
      
      # The list of all clusters in a project.
      class ListClustersResponse
        include Google::Apis::Core::Hashable
      
        # Output only. The clusters in the project.
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::DataprocV1beta2::Cluster>]
        attr_accessor :clusters
      
        # Output only. This token is included in the response if there are more results
        # to fetch. To fetch additional results, provide this value as the page_token in
        # a subsequent <code>ListClustersRequest</code>.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A list of jobs in a project.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. Jobs list.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::DataprocV1beta2::Job>]
        attr_accessor :jobs
      
        # Optional. This token is included in the response if there are more results to
        # fetch. To fetch additional results, provide this value as the page_token in a
        # subsequent <code>ListJobsRequest</code>.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
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
        # @return [Array<Google::Apis::DataprocV1beta2::Operation>]
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
      
      # A response to a request to list workflow templates in a project.
      class ListWorkflowTemplatesResponse
        include Google::Apis::Core::Hashable
      
        # Output only. This token is included in the response if there are more results
        # to fetch. To fetch additional results, provide this value as the page_token in
        # a subsequent <code>ListWorkflowTemplatesRequest</code>.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Output only. WorkflowTemplates list.
        # Corresponds to the JSON property `templates`
        # @return [Array<Google::Apis::DataprocV1beta2::WorkflowTemplate>]
        attr_accessor :templates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @templates = args[:templates] if args.key?(:templates)
        end
      end
      
      # The runtime logging config of the job.
      class LoggingConfig
        include Google::Apis::Core::Hashable
      
        # The per-package log levels for the driver. This may include "root" package
        # name to configure rootLogger. Examples:  'com.google = FATAL', 'root = INFO', '
        # org.apache = DEBUG'
        # Corresponds to the JSON property `driverLogLevels`
        # @return [Hash<String,String>]
        attr_accessor :driver_log_levels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @driver_log_levels = args[:driver_log_levels] if args.key?(:driver_log_levels)
        end
      end
      
      # Cluster that is managed by the workflow.
      class ManagedCluster
        include Google::Apis::Core::Hashable
      
        # Required. The cluster name prefix. A unique cluster name will be formed by
        # appending a random suffix.The name must contain only lower-case letters (a-z),
        # numbers (0-9), and hyphens (-). Must begin with a letter. Cannot begin or end
        # with hyphen. Must consist of between 2 and 35 characters.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # The cluster config.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DataprocV1beta2::ClusterConfig]
        attr_accessor :config
      
        # Optional. The labels to associate with this cluster.Label keys must be between
        # 1 and 63 characters long, and must conform to the following PCRE regular
        # expression: \p`Ll`\p`Lo``0,62`Label values must be between 1 and 63 characters
        # long, and must conform to the following PCRE regular expression: \p`Ll`\p`Lo`\
        # p`N`_-`0,63`No more than 32 labels can be associated with a given cluster.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @config = args[:config] if args.key?(:config)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # Specifies the resources used to actively manage an instance group.
      class ManagedGroupConfig
        include Google::Apis::Core::Hashable
      
        # Output only. The name of the Instance Group Manager for this group.
        # Corresponds to the JSON property `instanceGroupManagerName`
        # @return [String]
        attr_accessor :instance_group_manager_name
      
        # Output only. The name of the Instance Template used for the Managed Instance
        # Group.
        # Corresponds to the JSON property `instanceTemplateName`
        # @return [String]
        attr_accessor :instance_template_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_group_manager_name = args[:instance_group_manager_name] if args.key?(:instance_group_manager_name)
          @instance_template_name = args[:instance_template_name] if args.key?(:instance_template_name)
        end
      end
      
      # Specifies an executable to run on a fully configured node and a timeout period
      # for executable completion.
      class NodeInitializationAction
        include Google::Apis::Core::Hashable
      
        # Required. Cloud Storage URI of executable file.
        # Corresponds to the JSON property `executableFile`
        # @return [String]
        attr_accessor :executable_file
      
        # Optional. Amount of time executable has to complete. Default is 10 minutes.
        # Cluster creation fails with an explanatory error message (the name of the
        # executable that caused the error and the exceeded timeout period) if the
        # executable is not completed at end of the timeout period.
        # Corresponds to the JSON property `executionTimeout`
        # @return [String]
        attr_accessor :execution_timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @executable_file = args[:executable_file] if args.key?(:executable_file)
          @execution_timeout = args[:execution_timeout] if args.key?(:execution_timeout)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is false, it means the operation is still in progress. If true,
        # the operation is completed, and either error or response is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DataprocV1beta2::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the name should be
        # a resource name ending with operations/`unique_id`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success. If the original
        # method returns no data on success, such as Delete, the response is google.
        # protobuf.Empty. If the original method is standard Get/Create/Update, the
        # response should be the resource. For other methods, the response should have
        # the type XxxResponse, where Xxx is the original method name. For example, if
        # the original method name is TakeSnapshot(), the inferred response type is
        # TakeSnapshotResponse.
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
      
      # A job executed by the workflow.
      class OrderedJob
        include Google::Apis::Core::Hashable
      
        # A Cloud Dataproc job for running Apache Hadoop MapReduce (https://hadoop.
        # apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/
        # MapReduceTutorial.html) jobs on Apache Hadoop YARN (https://hadoop.apache.org/
        # docs/r2.7.1/hadoop-yarn/hadoop-yarn-site/YARN.html).
        # Corresponds to the JSON property `hadoopJob`
        # @return [Google::Apis::DataprocV1beta2::HadoopJob]
        attr_accessor :hadoop_job
      
        # A Cloud Dataproc job for running Apache Hive (https://hive.apache.org/)
        # queries on YARN.
        # Corresponds to the JSON property `hiveJob`
        # @return [Google::Apis::DataprocV1beta2::HiveJob]
        attr_accessor :hive_job
      
        # Optional. The labels to associate with this job.Label keys must be between 1
        # and 63 characters long, and must conform to the following regular expression: \
        # p`Ll`\p`Lo``0,62`Label values must be between 1 and 63 characters long, and
        # must conform to the following regular expression: \p`Ll`\p`Lo`\p`N`_-`0,63`No
        # more than 32 labels can be associated with a given job.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # A Cloud Dataproc job for running Apache Pig (https://pig.apache.org/) queries
        # on YARN.
        # Corresponds to the JSON property `pigJob`
        # @return [Google::Apis::DataprocV1beta2::PigJob]
        attr_accessor :pig_job
      
        # Optional. The optional list of prerequisite job step_ids. If not specified,
        # the job will start at the beginning of workflow.
        # Corresponds to the JSON property `prerequisiteStepIds`
        # @return [Array<String>]
        attr_accessor :prerequisite_step_ids
      
        # A Cloud Dataproc job for running Apache PySpark (https://spark.apache.org/docs/
        # 0.9.0/python-programming-guide.html) applications on YARN.
        # Corresponds to the JSON property `pysparkJob`
        # @return [Google::Apis::DataprocV1beta2::PySparkJob]
        attr_accessor :pyspark_job
      
        # Job scheduling options.
        # Corresponds to the JSON property `scheduling`
        # @return [Google::Apis::DataprocV1beta2::JobScheduling]
        attr_accessor :scheduling
      
        # A Cloud Dataproc job for running Apache Spark (http://spark.apache.org/)
        # applications on YARN. The specification of the main method to call to drive
        # the job. Specify either the jar file that contains the main class or the main
        # class name. To pass both a main jar and a main class in that jar, add the jar
        # to CommonJob.jar_file_uris, and then specify the main class name in main_class.
        # Corresponds to the JSON property `sparkJob`
        # @return [Google::Apis::DataprocV1beta2::SparkJob]
        attr_accessor :spark_job
      
        # A Cloud Dataproc job for running Apache Spark SQL (http://spark.apache.org/sql/
        # ) queries.
        # Corresponds to the JSON property `sparkSqlJob`
        # @return [Google::Apis::DataprocV1beta2::SparkSqlJob]
        attr_accessor :spark_sql_job
      
        # Required. The step id. The id must be unique among all jobs within the
        # template.The step id is used as prefix for job id, as job goog-dataproc-
        # workflow-step-id label, and in prerequisiteStepIds field from other steps.The
        # id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and
        # hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of
        # between 3 and 50 characters.
        # Corresponds to the JSON property `stepId`
        # @return [String]
        attr_accessor :step_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hadoop_job = args[:hadoop_job] if args.key?(:hadoop_job)
          @hive_job = args[:hive_job] if args.key?(:hive_job)
          @labels = args[:labels] if args.key?(:labels)
          @pig_job = args[:pig_job] if args.key?(:pig_job)
          @prerequisite_step_ids = args[:prerequisite_step_ids] if args.key?(:prerequisite_step_ids)
          @pyspark_job = args[:pyspark_job] if args.key?(:pyspark_job)
          @scheduling = args[:scheduling] if args.key?(:scheduling)
          @spark_job = args[:spark_job] if args.key?(:spark_job)
          @spark_sql_job = args[:spark_sql_job] if args.key?(:spark_sql_job)
          @step_id = args[:step_id] if args.key?(:step_id)
        end
      end
      
      # Configuration for parameter validation.
      class ParameterValidation
        include Google::Apis::Core::Hashable
      
        # Validation based on regular expressions.
        # Corresponds to the JSON property `regex`
        # @return [Google::Apis::DataprocV1beta2::RegexValidation]
        attr_accessor :regex
      
        # Validation based on a list of allowed values.
        # Corresponds to the JSON property `values`
        # @return [Google::Apis::DataprocV1beta2::ValueValidation]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @regex = args[:regex] if args.key?(:regex)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A Cloud Dataproc job for running Apache Pig (https://pig.apache.org/) queries
      # on YARN.
      class PigJob
        include Google::Apis::Core::Hashable
      
        # Optional. Whether to continue executing queries if a query fails. The default
        # value is false. Setting to true can be useful when executing independent
        # parallel queries.
        # Corresponds to the JSON property `continueOnFailure`
        # @return [Boolean]
        attr_accessor :continue_on_failure
        alias_method :continue_on_failure?, :continue_on_failure
      
        # Optional. HCFS URIs of jar files to add to the CLASSPATH of the Pig Client and
        # Hadoop MapReduce (MR) tasks. Can contain Pig UDFs.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # Optional. A mapping of property names to values, used to configure Pig.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/
        # pig/conf/pig.properties, and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The HCFS URI of the script that contains the Pig queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1beta2::QueryList]
        attr_accessor :query_list
      
        # Optional. Mapping of query variable names to values (equivalent to the Pig
        # command: name=[value]).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @continue_on_failure = args[:continue_on_failure] if args.key?(:continue_on_failure)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @properties = args[:properties] if args.key?(:properties)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to specify
      # access control policies for Cloud Platform resources.A Policy is a collection
      # of bindings. A binding binds one or more members to a single role. Members can
      # be user accounts, service accounts, Google groups, and domains (such as G
      # Suite). A role is a named list of permissions (defined by IAM or configured by
      # users). A binding can optionally specify a condition, which is a logic
      # expression that further constrains the role binding based on attributes about
      # the request and/or target resource.JSON Example
      # `
      # "bindings": [
      # `
      # "role": "role/resourcemanager.organizationAdmin",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/resourcemanager.organizationViewer",
      # "members": ["user:eve@example.com"],
      # "condition": `
      # "title": "expirable access",
      # "description": "Does not grant access after Sep 2020",
      # "expression": "request.time <
      # timestamp('2020-10-01T00:00:00.000Z')",
      # `
      # `
      # ]
      # `
      # YAML Example
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-project-id@appspot.gserviceaccount.com
      # role: roles/resourcemanager.organizationAdmin
      # - members:
      # - user:eve@example.com
      # role: roles/resourcemanager.organizationViewer
      # condition:
      # title: expirable access
      # description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
      # For a description of IAM and its features, see the IAM developer's guide (
      # https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Associates a list of members to a role. Optionally may specify a condition
        # that determines when binding is in effect. bindings with no members will
        # result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::DataprocV1beta2::Binding>]
        attr_accessor :bindings
      
        # etag is used for optimistic concurrency control as a way to help prevent
        # simultaneous updates of a policy from overwriting each other. It is strongly
        # suggested that systems make use of the etag in the read-modify-write cycle to
        # perform policy updates in order to avoid race conditions: An etag is returned
        # in the response to getIamPolicy, and systems are expected to put that etag in
        # the request to setIamPolicy to ensure that their change will be applied to the
        # same version of the policy.If no etag is provided in the call to setIamPolicy,
        # then the existing policy is overwritten. Due to blind-set semantics of an etag-
        # less policy, 'setIamPolicy' will not fail even if either of incoming or stored
        # policy does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.Valid values are 0, 1, and 3. Requests
        # specifying an invalid value will be rejected.Operations affecting conditional
        # bindings must specify version 3. This can be either setting a conditional
        # policy, modifying a conditional binding, or removing a conditional binding
        # from the stored conditional policy. Operations on non-conditional policies may
        # specify any valid value or leave the field unset.If no etag is provided in the
        # call to setIamPolicy, any version compliance checks on the incoming and/or
        # stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A Cloud Dataproc job for running Presto (https://prestosql.io/) queries
      class PrestoJob
        include Google::Apis::Core::Hashable
      
        # Optional. Presto client tags to attach to this query
        # Corresponds to the JSON property `clientTags`
        # @return [Array<String>]
        attr_accessor :client_tags
      
        # Optional. Whether to continue executing queries if a query fails. The default
        # value is false. Setting to true can be useful when executing independent
        # parallel queries.
        # Corresponds to the JSON property `continueOnFailure`
        # @return [Boolean]
        attr_accessor :continue_on_failure
        alias_method :continue_on_failure?, :continue_on_failure
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # Optional. The format in which query output will be displayed. See the Presto
        # documentation for supported output formats
        # Corresponds to the JSON property `outputFormat`
        # @return [String]
        attr_accessor :output_format
      
        # Optional. A mapping of property names to values. Used to set Presto session
        # properties (https://prestodb.io/docs/current/sql/set-session.html) Equivalent
        # to using the --session flag in the Presto CLI
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The HCFS URI of the script that contains SQL queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1beta2::QueryList]
        attr_accessor :query_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_tags = args[:client_tags] if args.key?(:client_tags)
          @continue_on_failure = args[:continue_on_failure] if args.key?(:continue_on_failure)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @output_format = args[:output_format] if args.key?(:output_format)
          @properties = args[:properties] if args.key?(:properties)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
        end
      end
      
      # A Cloud Dataproc job for running Apache PySpark (https://spark.apache.org/docs/
      # 0.9.0/python-programming-guide.html) applications on YARN.
      class PySparkJob
        include Google::Apis::Core::Hashable
      
        # Optional. HCFS URIs of archives to be extracted in the working directory of .
        # jar, .tar, .tar.gz, .tgz, and .zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # Optional. The arguments to pass to the driver. Do not include arguments, such
        # as --conf, that can be set as job properties, since a collision may occur that
        # causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Optional. HCFS URIs of files to be copied to the working directory of Python
        # drivers and distributed tasks. Useful for naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # Optional. HCFS URIs of jar files to add to the CLASSPATHs of the Python driver
        # and tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # Required. The HCFS URI of the main Python file to use as the driver. Must be a
        # .py file.
        # Corresponds to the JSON property `mainPythonFileUri`
        # @return [String]
        attr_accessor :main_python_file_uri
      
        # Optional. A mapping of property names to values, used to configure PySpark.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf
        # and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # Optional. HCFS file URIs of Python files to pass to the PySpark framework.
        # Supported file types: .py, .egg, and .zip.
        # Corresponds to the JSON property `pythonFileUris`
        # @return [Array<String>]
        attr_accessor :python_file_uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @args = args[:args] if args.key?(:args)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @main_python_file_uri = args[:main_python_file_uri] if args.key?(:main_python_file_uri)
          @properties = args[:properties] if args.key?(:properties)
          @python_file_uris = args[:python_file_uris] if args.key?(:python_file_uris)
        end
      end
      
      # A list of queries to run on a cluster.
      class QueryList
        include Google::Apis::Core::Hashable
      
        # Required. The queries to execute. You do not need to terminate a query with a
        # semicolon. Multiple queries can be specified in one string by separating each
        # with a semicolon. Here is an example of an Cloud Dataproc API snippet that
        # uses a QueryList to specify a HiveJob:
        # "hiveJob": `
        # "queryList": `
        # "queries": [
        # "query1",
        # "query2",
        # "query3;query4",
        # ]
        # `
        # `
        # Corresponds to the JSON property `queries`
        # @return [Array<String>]
        attr_accessor :queries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @queries = args[:queries] if args.key?(:queries)
        end
      end
      
      # Validation based on regular expressions.
      class RegexValidation
        include Google::Apis::Core::Hashable
      
        # Required. RE2 regular expressions used to validate the parameter's value. The
        # value must match the regex in its entirety (substring matches are not
        # sufficient).
        # Corresponds to the JSON property `regexes`
        # @return [Array<String>]
        attr_accessor :regexes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @regexes = args[:regexes] if args.key?(:regexes)
        end
      end
      
      # Reservation Affinity for consuming Zonal reservation.
      class ReservationAffinity
        include Google::Apis::Core::Hashable
      
        # Optional. Type of reservation to consume
        # Corresponds to the JSON property `consumeReservationType`
        # @return [String]
        attr_accessor :consume_reservation_type
      
        # Optional. Corresponds to the label key of reservation resource.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Optional. Corresponds to the label values of reservation resource.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consume_reservation_type = args[:consume_reservation_type] if args.key?(:consume_reservation_type)
          @key = args[:key] if args.key?(:key)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Security related configuration, including encryption, Kerberos, etc.
      class SecurityConfig
        include Google::Apis::Core::Hashable
      
        # Specifies Kerberos related configuration.
        # Corresponds to the JSON property `kerberosConfig`
        # @return [Google::Apis::DataprocV1beta2::KerberosConfig]
        attr_accessor :kerberos_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kerberos_config = args[:kerberos_config] if args.key?(:kerberos_config)
        end
      end
      
      # Request message for SetIamPolicy method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to specify
        # access control policies for Cloud Platform resources.A Policy is a collection
        # of bindings. A binding binds one or more members to a single role. Members can
        # be user accounts, service accounts, Google groups, and domains (such as G
        # Suite). A role is a named list of permissions (defined by IAM or configured by
        # users). A binding can optionally specify a condition, which is a logic
        # expression that further constrains the role binding based on attributes about
        # the request and/or target resource.JSON Example
        # `
        # "bindings": [
        # `
        # "role": "role/resourcemanager.organizationAdmin",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/resourcemanager.organizationViewer",
        # "members": ["user:eve@example.com"],
        # "condition": `
        # "title": "expirable access",
        # "description": "Does not grant access after Sep 2020",
        # "expression": "request.time <
        # timestamp('2020-10-01T00:00:00.000Z')",
        # `
        # `
        # ]
        # `
        # YAML Example
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-project-id@appspot.gserviceaccount.com
        # role: roles/resourcemanager.organizationAdmin
        # - members:
        # - user:eve@example.com
        # role: roles/resourcemanager.organizationViewer
        # condition:
        # title: expirable access
        # description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
        # For a description of IAM and its features, see the IAM developer's guide (
        # https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::DataprocV1beta2::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # Specifies the selection and config of software inside the cluster.
      class SoftwareConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The version of software inside the cluster. It must be one of the
        # supported Cloud Dataproc Versions, such as "1.2" (including a subminor version,
        # such as "1.2.29"), or the "preview" version. If unspecified, it defaults to
        # the latest Debian version.
        # Corresponds to the JSON property `imageVersion`
        # @return [String]
        attr_accessor :image_version
      
        # The set of optional components to activate on the cluster.
        # Corresponds to the JSON property `optionalComponents`
        # @return [Array<String>]
        attr_accessor :optional_components
      
        # Optional. The properties to set on daemon config files.Property keys are
        # specified in prefix:property format, for example core:hadoop.tmp.dir. The
        # following are supported prefixes and their mappings:
        # capacity-scheduler: capacity-scheduler.xml
        # core: core-site.xml
        # distcp: distcp-default.xml
        # hdfs: hdfs-site.xml
        # hive: hive-site.xml
        # mapred: mapred-site.xml
        # pig: pig.properties
        # spark: spark-defaults.conf
        # yarn: yarn-site.xmlFor more information, see Cluster properties.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_version = args[:image_version] if args.key?(:image_version)
          @optional_components = args[:optional_components] if args.key?(:optional_components)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A Cloud Dataproc job for running Apache Spark (http://spark.apache.org/)
      # applications on YARN. The specification of the main method to call to drive
      # the job. Specify either the jar file that contains the main class or the main
      # class name. To pass both a main jar and a main class in that jar, add the jar
      # to CommonJob.jar_file_uris, and then specify the main class name in main_class.
      class SparkJob
        include Google::Apis::Core::Hashable
      
        # Optional. HCFS URIs of archives to be extracted in the working directory of
        # Spark drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, and .
        # zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # Optional. The arguments to pass to the driver. Do not include arguments, such
        # as --conf, that can be set as job properties, since a collision may occur that
        # causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Optional. HCFS URIs of files to be copied to the working directory of Spark
        # drivers and distributed tasks. Useful for naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # Optional. HCFS URIs of jar files to add to the CLASSPATHs of the Spark driver
        # and tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # The name of the driver's main class. The jar file that contains the class must
        # be in the default CLASSPATH or specified in jar_file_uris.
        # Corresponds to the JSON property `mainClass`
        # @return [String]
        attr_accessor :main_class
      
        # The HCFS URI of the jar file that contains the main class.
        # Corresponds to the JSON property `mainJarFileUri`
        # @return [String]
        attr_accessor :main_jar_file_uri
      
        # Optional. A mapping of property names to values, used to configure Spark.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf
        # and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @args = args[:args] if args.key?(:args)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @main_class = args[:main_class] if args.key?(:main_class)
          @main_jar_file_uri = args[:main_jar_file_uri] if args.key?(:main_jar_file_uri)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A Cloud Dataproc job for running Apache SparkR (https://spark.apache.org/docs/
      # latest/sparkr.html) applications on YARN.
      class SparkRJob
        include Google::Apis::Core::Hashable
      
        # Optional. HCFS URIs of archives to be extracted in the working directory of
        # Spark drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, and .
        # zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # Optional. The arguments to pass to the driver. Do not include arguments, such
        # as --conf, that can be set as job properties, since a collision may occur that
        # causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Optional. HCFS URIs of files to be copied to the working directory of R
        # drivers and distributed tasks. Useful for naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # Required. The HCFS URI of the main R file to use as the driver. Must be a .R
        # file.
        # Corresponds to the JSON property `mainRFileUri`
        # @return [String]
        attr_accessor :main_r_file_uri
      
        # Optional. A mapping of property names to values, used to configure SparkR.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf
        # and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @args = args[:args] if args.key?(:args)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @main_r_file_uri = args[:main_r_file_uri] if args.key?(:main_r_file_uri)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A Cloud Dataproc job for running Apache Spark SQL (http://spark.apache.org/sql/
      # ) queries.
      class SparkSqlJob
        include Google::Apis::Core::Hashable
      
        # Optional. HCFS URIs of jar files to be added to the Spark CLASSPATH.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1beta2::LoggingConfig]
        attr_accessor :logging_config
      
        # Optional. A mapping of property names to values, used to configure Spark SQL's
        # SparkConf. Properties that conflict with values set by the Cloud Dataproc API
        # may be overwritten.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The HCFS URI of the script that contains SQL queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1beta2::QueryList]
        attr_accessor :query_list
      
        # Optional. Mapping of query variable names to values (equivalent to the Spark
        # SQL command: SET name="value";).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
          @properties = args[:properties] if args.key?(:properties)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
        end
      end
      
      # The Status type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by gRPC
      # (https://github.com/grpc). Each Status message contains three pieces of data:
      # error code, error message, and error details.You can find out more about this
      # error model and how to work with it in the API Design Guide (https://cloud.
      # google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
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
      
      # A request to submit a job.
      class SubmitJobRequest
        include Google::Apis::Core::Hashable
      
        # A Cloud Dataproc job resource.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::DataprocV1beta2::Job]
        attr_accessor :job
      
        # Optional. A unique id used to identify the request. If the server receives two
        # SubmitJobRequest requests with the same id, then the second request will be
        # ignored and the first Job created and stored in the backend is returned.It is
        # recommended to always set this value to a UUID (https://en.wikipedia.org/wiki/
        # Universally_unique_identifier).The id must contain only letters (a-z, A-Z),
        # numbers (0-9), underscores (_), and hyphens (-). The maximum length is 40
        # characters.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job = args[:job] if args.key?(:job)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # A configurable parameter that replaces one or more fields in the template.
      # Parameterizable fields: - Labels - File uris - Job properties - Job arguments -
      # Script variables - Main class (in HadoopJob and SparkJob) - Zone (in
      # ClusterSelector)
      class TemplateParameter
        include Google::Apis::Core::Hashable
      
        # Optional. Brief description of the parameter. Must not exceed 1024 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. Paths to all fields that the parameter replaces. A field is allowed
        # to appear in at most one parameter's list of field paths.A field path is
        # similar in syntax to a google.protobuf.FieldMask. For example, a field path
        # that references the zone field of a workflow template's cluster selector would
        # be specified as placement.clusterSelector.zone.Also, field paths can reference
        # fields using the following syntax:
        # Values in maps can be referenced by key:
        # labels'key'
        # placement.clusterSelector.clusterLabels'key'
        # placement.managedCluster.labels'key'
        # placement.clusterSelector.clusterLabels'key'
        # jobs'step-id'.labels'key'
        # Jobs in the jobs list can be referenced by step-id:
        # jobs'step-id'.hadoopJob.mainJarFileUri
        # jobs'step-id'.hiveJob.queryFileUri
        # jobs'step-id'.pySparkJob.mainPythonFileUri
        # jobs'step-id'.hadoopJob.jarFileUris0
        # jobs'step-id'.hadoopJob.archiveUris0
        # jobs'step-id'.hadoopJob.fileUris0
        # jobs'step-id'.pySparkJob.pythonFileUris0
        # Items in repeated fields can be referenced by a zero-based index:
        # jobs'step-id'.sparkJob.args0
        # Other examples:
        # jobs'step-id'.hadoopJob.properties'key'
        # jobs'step-id'.hadoopJob.args0
        # jobs'step-id'.hiveJob.scriptVariables'key'
        # jobs'step-id'.hadoopJob.mainJarFileUri
        # placement.clusterSelector.zoneIt may not be possible to parameterize maps and
        # repeated fields in their entirety since only individual map values and
        # individual items in repeated fields can be referenced. For example, the
        # following field paths are invalid:
        # placement.clusterSelector.clusterLabels
        # jobs'step-id'.sparkJob.args
        # Corresponds to the JSON property `fields`
        # @return [Array<String>]
        attr_accessor :fields
      
        # Required. Parameter name. The parameter name is used as the key, and paired
        # with the parameter value, which are passed to the template when the template
        # is instantiated. The name must contain only capital letters (A-Z), numbers (0-
        # 9), and underscores (_), and must not start with a number. The maximum length
        # is 40 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for parameter validation.
        # Corresponds to the JSON property `validation`
        # @return [Google::Apis::DataprocV1beta2::ParameterValidation]
        attr_accessor :validation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @validation = args[:validation] if args.key?(:validation)
        end
      end
      
      # Request message for TestIamPermissions method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the resource. Permissions with wildcards (
        # such as '*' or 'storage.*') are not allowed. For more information see IAM
        # Overview (https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for TestIamPermissions method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of TestPermissionsRequest.permissions that the caller is allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Validation based on a list of allowed values.
      class ValueValidation
        include Google::Apis::Core::Hashable
      
        # Required. List of allowed values for the parameter.
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
      
      # The workflow graph.
      class WorkflowGraph
        include Google::Apis::Core::Hashable
      
        # Output only. The workflow nodes.
        # Corresponds to the JSON property `nodes`
        # @return [Array<Google::Apis::DataprocV1beta2::WorkflowNode>]
        attr_accessor :nodes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nodes = args[:nodes] if args.key?(:nodes)
        end
      end
      
      # A Cloud Dataproc workflow template resource.
      class WorkflowMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The name of the target cluster.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Output only. The UUID of target cluster.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        # The cluster operation triggered by a workflow.
        # Corresponds to the JSON property `createCluster`
        # @return [Google::Apis::DataprocV1beta2::ClusterOperation]
        attr_accessor :create_cluster
      
        # The cluster operation triggered by a workflow.
        # Corresponds to the JSON property `deleteCluster`
        # @return [Google::Apis::DataprocV1beta2::ClusterOperation]
        attr_accessor :delete_cluster
      
        # Output only. Workflow end time.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The workflow graph.
        # Corresponds to the JSON property `graph`
        # @return [Google::Apis::DataprocV1beta2::WorkflowGraph]
        attr_accessor :graph
      
        # Map from parameter names to values that were used for those parameters.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,String>]
        attr_accessor :parameters
      
        # Output only. Workflow start time.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Output only. The workflow state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The resource name of the workflow template as described in https:/
        # /cloud.google.com/apis/design/resource_names.
        # For projects.regions.workflowTemplates, the resource name of the  template has
        # the following format:  projects/`project_id`/regions/`region`/
        # workflowTemplates/`template_id`
        # For projects.locations.workflowTemplates, the resource name of the  template
        # has the following format:  projects/`project_id`/locations/`location`/
        # workflowTemplates/`template_id`
        # Corresponds to the JSON property `template`
        # @return [String]
        attr_accessor :template
      
        # Output only. The version of template at the time of workflow instantiation.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
          @create_cluster = args[:create_cluster] if args.key?(:create_cluster)
          @delete_cluster = args[:delete_cluster] if args.key?(:delete_cluster)
          @end_time = args[:end_time] if args.key?(:end_time)
          @graph = args[:graph] if args.key?(:graph)
          @parameters = args[:parameters] if args.key?(:parameters)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @template = args[:template] if args.key?(:template)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # The workflow node.
      class WorkflowNode
        include Google::Apis::Core::Hashable
      
        # Output only. The error detail.
        # Corresponds to the JSON property `error`
        # @return [String]
        attr_accessor :error
      
        # Output only. The job id; populated after the node enters RUNNING state.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # Output only. Node's prerequisite nodes.
        # Corresponds to the JSON property `prerequisiteStepIds`
        # @return [Array<String>]
        attr_accessor :prerequisite_step_ids
      
        # Output only. The node state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The name of the node.
        # Corresponds to the JSON property `stepId`
        # @return [String]
        attr_accessor :step_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @job_id = args[:job_id] if args.key?(:job_id)
          @prerequisite_step_ids = args[:prerequisite_step_ids] if args.key?(:prerequisite_step_ids)
          @state = args[:state] if args.key?(:state)
          @step_id = args[:step_id] if args.key?(:step_id)
        end
      end
      
      # A Cloud Dataproc workflow template resource.
      class WorkflowTemplate
        include Google::Apis::Core::Hashable
      
        # Output only. The time template was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Required. The template id.The id must contain only letters (a-z, A-Z), numbers
        # (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore
        # or hyphen. Must consist of between 3 and 50 characters..
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Required. The Directed Acyclic Graph of Jobs to submit.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::DataprocV1beta2::OrderedJob>]
        attr_accessor :jobs
      
        # Optional. The labels to associate with this template. These labels will be
        # propagated to all jobs and clusters created by the workflow instance.Label
        # keys must contain 1 to 63 characters, and must conform to RFC 1035 (https://
        # www.ietf.org/rfc/rfc1035.txt).Label values may be empty, but, if present, must
        # contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/
        # rfc/rfc1035.txt).No more than 32 labels can be associated with a template.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The resource name of the workflow template, as described in https:
        # //cloud.google.com/apis/design/resource_names.
        # For projects.regions.workflowTemplates, the resource name of the  template has
        # the following format:  projects/`project_id`/regions/`region`/
        # workflowTemplates/`template_id`
        # For projects.locations.workflowTemplates, the resource name of the  template
        # has the following format:  projects/`project_id`/locations/`location`/
        # workflowTemplates/`template_id`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Template parameters whose values are substituted into the template.
        # Values for parameters must be provided when the template is instantiated.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::DataprocV1beta2::TemplateParameter>]
        attr_accessor :parameters
      
        # Specifies workflow execution target.Either managed_cluster or cluster_selector
        # is required.
        # Corresponds to the JSON property `placement`
        # @return [Google::Apis::DataprocV1beta2::WorkflowTemplatePlacement]
        attr_accessor :placement
      
        # Output only. The time template was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Optional. Used to perform a consistent read-modify-write.This field should be
        # left blank for a CreateWorkflowTemplate request. It is required for an
        # UpdateWorkflowTemplate request, and must match the current server version. A
        # typical update template flow would fetch the current template with a
        # GetWorkflowTemplate request, which will return the current template with the
        # version field filled in with the current server version. The user updates
        # other fields in the template, then returns it as part of the
        # UpdateWorkflowTemplate request.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @id = args[:id] if args.key?(:id)
          @jobs = args[:jobs] if args.key?(:jobs)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
          @placement = args[:placement] if args.key?(:placement)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Specifies workflow execution target.Either managed_cluster or cluster_selector
      # is required.
      class WorkflowTemplatePlacement
        include Google::Apis::Core::Hashable
      
        # A selector that chooses target cluster for jobs based on metadata.
        # Corresponds to the JSON property `clusterSelector`
        # @return [Google::Apis::DataprocV1beta2::ClusterSelector]
        attr_accessor :cluster_selector
      
        # Cluster that is managed by the workflow.
        # Corresponds to the JSON property `managedCluster`
        # @return [Google::Apis::DataprocV1beta2::ManagedCluster]
        attr_accessor :managed_cluster
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_selector = args[:cluster_selector] if args.key?(:cluster_selector)
          @managed_cluster = args[:managed_cluster] if args.key?(:managed_cluster)
        end
      end
      
      # A YARN application created by a job. Application information is a subset of <
      # code>org.apache.hadoop.yarn.proto.YarnProtos.ApplicationReportProto</code>.
      # Beta Feature: This report is available for testing purposes only. It may be
      # changed before final release.
      class YarnApplication
        include Google::Apis::Core::Hashable
      
        # Output only. The application name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The numerical progress of the application, from 1 to 100.
        # Corresponds to the JSON property `progress`
        # @return [Float]
        attr_accessor :progress
      
        # Output only. The application state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Optional. Output only. The HTTP URL of the ApplicationMaster, HistoryServer,
        # or TimelineServer that provides application-specific information. The URL uses
        # the internal hostname, and requires a proxy server for resolution and,
        # possibly, access.
        # Corresponds to the JSON property `trackingUrl`
        # @return [String]
        attr_accessor :tracking_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @progress = args[:progress] if args.key?(:progress)
          @state = args[:state] if args.key?(:state)
          @tracking_url = args[:tracking_url] if args.key?(:tracking_url)
        end
      end
    end
  end
end
