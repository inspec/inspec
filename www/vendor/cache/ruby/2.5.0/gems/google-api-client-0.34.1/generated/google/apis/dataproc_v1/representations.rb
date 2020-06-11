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
    module DataprocV1
      
      class AcceleratorConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BasicAutoscalingAlgorithm
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BasicYarnAutoscalingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Cluster
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterOperationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterSelector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiagnoseClusterRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiagnoseClusterResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EncryptionConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GceClusterConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HadoopJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HiveJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupAutoscalingPolicyConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstantiateWorkflowTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobPlacement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobScheduling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KerberosConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LifecycleConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAutoscalingPoliciesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListClustersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListWorkflowTemplatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoggingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedCluster
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedGroupConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeInitializationAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderedJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParameterValidation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PigJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PySparkJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegexValidation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SoftwareConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SparkJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SparkSqlJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubmitJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TemplateParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ValueValidation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkflowGraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkflowMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkflowNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkflowTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkflowTemplatePlacement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class YarnApplication
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator_count, as: 'acceleratorCount'
          property :accelerator_type_uri, as: 'acceleratorTypeUri'
        end
      end
      
      class AutoscalingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy_uri, as: 'policyUri'
        end
      end
      
      class AutoscalingPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :basic_algorithm, as: 'basicAlgorithm', class: Google::Apis::DataprocV1::BasicAutoscalingAlgorithm, decorator: Google::Apis::DataprocV1::BasicAutoscalingAlgorithm::Representation
      
          property :id, as: 'id'
          property :name, as: 'name'
          property :secondary_worker_config, as: 'secondaryWorkerConfig', class: Google::Apis::DataprocV1::InstanceGroupAutoscalingPolicyConfig, decorator: Google::Apis::DataprocV1::InstanceGroupAutoscalingPolicyConfig::Representation
      
          property :worker_config, as: 'workerConfig', class: Google::Apis::DataprocV1::InstanceGroupAutoscalingPolicyConfig, decorator: Google::Apis::DataprocV1::InstanceGroupAutoscalingPolicyConfig::Representation
      
        end
      end
      
      class BasicAutoscalingAlgorithm
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cooldown_period, as: 'cooldownPeriod'
          property :yarn_config, as: 'yarnConfig', class: Google::Apis::DataprocV1::BasicYarnAutoscalingConfig, decorator: Google::Apis::DataprocV1::BasicYarnAutoscalingConfig::Representation
      
        end
      end
      
      class BasicYarnAutoscalingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :graceful_decommission_timeout, as: 'gracefulDecommissionTimeout'
          property :scale_down_factor, as: 'scaleDownFactor'
          property :scale_down_min_worker_fraction, as: 'scaleDownMinWorkerFraction'
          property :scale_up_factor, as: 'scaleUpFactor'
          property :scale_up_min_worker_fraction, as: 'scaleUpMinWorkerFraction'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::DataprocV1::Expr, decorator: Google::Apis::DataprocV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class CancelJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Cluster
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_name, as: 'clusterName'
          property :cluster_uuid, as: 'clusterUuid'
          property :config, as: 'config', class: Google::Apis::DataprocV1::ClusterConfig, decorator: Google::Apis::DataprocV1::ClusterConfig::Representation
      
          hash :labels, as: 'labels'
          property :metrics, as: 'metrics', class: Google::Apis::DataprocV1::ClusterMetrics, decorator: Google::Apis::DataprocV1::ClusterMetrics::Representation
      
          property :project_id, as: 'projectId'
          property :status, as: 'status', class: Google::Apis::DataprocV1::ClusterStatus, decorator: Google::Apis::DataprocV1::ClusterStatus::Representation
      
          collection :status_history, as: 'statusHistory', class: Google::Apis::DataprocV1::ClusterStatus, decorator: Google::Apis::DataprocV1::ClusterStatus::Representation
      
        end
      end
      
      class ClusterConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_config, as: 'autoscalingConfig', class: Google::Apis::DataprocV1::AutoscalingConfig, decorator: Google::Apis::DataprocV1::AutoscalingConfig::Representation
      
          property :config_bucket, as: 'configBucket'
          property :encryption_config, as: 'encryptionConfig', class: Google::Apis::DataprocV1::EncryptionConfig, decorator: Google::Apis::DataprocV1::EncryptionConfig::Representation
      
          property :gce_cluster_config, as: 'gceClusterConfig', class: Google::Apis::DataprocV1::GceClusterConfig, decorator: Google::Apis::DataprocV1::GceClusterConfig::Representation
      
          collection :initialization_actions, as: 'initializationActions', class: Google::Apis::DataprocV1::NodeInitializationAction, decorator: Google::Apis::DataprocV1::NodeInitializationAction::Representation
      
          property :lifecycle_config, as: 'lifecycleConfig', class: Google::Apis::DataprocV1::LifecycleConfig, decorator: Google::Apis::DataprocV1::LifecycleConfig::Representation
      
          property :master_config, as: 'masterConfig', class: Google::Apis::DataprocV1::InstanceGroupConfig, decorator: Google::Apis::DataprocV1::InstanceGroupConfig::Representation
      
          property :secondary_worker_config, as: 'secondaryWorkerConfig', class: Google::Apis::DataprocV1::InstanceGroupConfig, decorator: Google::Apis::DataprocV1::InstanceGroupConfig::Representation
      
          property :security_config, as: 'securityConfig', class: Google::Apis::DataprocV1::SecurityConfig, decorator: Google::Apis::DataprocV1::SecurityConfig::Representation
      
          property :software_config, as: 'softwareConfig', class: Google::Apis::DataprocV1::SoftwareConfig, decorator: Google::Apis::DataprocV1::SoftwareConfig::Representation
      
          property :worker_config, as: 'workerConfig', class: Google::Apis::DataprocV1::InstanceGroupConfig, decorator: Google::Apis::DataprocV1::InstanceGroupConfig::Representation
      
        end
      end
      
      class ClusterMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :hdfs_metrics, as: 'hdfsMetrics'
          hash :yarn_metrics, as: 'yarnMetrics'
        end
      end
      
      class ClusterOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error'
          property :operation_id, as: 'operationId'
        end
      end
      
      class ClusterOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_name, as: 'clusterName'
          property :cluster_uuid, as: 'clusterUuid'
          property :description, as: 'description'
          hash :labels, as: 'labels'
          property :operation_type, as: 'operationType'
          property :status, as: 'status', class: Google::Apis::DataprocV1::ClusterOperationStatus, decorator: Google::Apis::DataprocV1::ClusterOperationStatus::Representation
      
          collection :status_history, as: 'statusHistory', class: Google::Apis::DataprocV1::ClusterOperationStatus, decorator: Google::Apis::DataprocV1::ClusterOperationStatus::Representation
      
          collection :warnings, as: 'warnings'
        end
      end
      
      class ClusterOperationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details'
          property :inner_state, as: 'innerState'
          property :state, as: 'state'
          property :state_start_time, as: 'stateStartTime'
        end
      end
      
      class ClusterSelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :cluster_labels, as: 'clusterLabels'
          property :zone, as: 'zone'
        end
      end
      
      class ClusterStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detail, as: 'detail'
          property :state, as: 'state'
          property :state_start_time, as: 'stateStartTime'
          property :substate, as: 'substate'
        end
      end
      
      class DiagnoseClusterRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class DiagnoseClusterResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_uri, as: 'outputUri'
        end
      end
      
      class DiskConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boot_disk_size_gb, as: 'bootDiskSizeGb'
          property :boot_disk_type, as: 'bootDiskType'
          property :num_local_ssds, as: 'numLocalSsds'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EncryptionConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gce_pd_kms_key_name, as: 'gcePdKmsKeyName'
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class GceClusterConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :internal_ip_only, as: 'internalIpOnly'
          hash :metadata, as: 'metadata'
          property :network_uri, as: 'networkUri'
          property :service_account, as: 'serviceAccount'
          collection :service_account_scopes, as: 'serviceAccountScopes'
          property :subnetwork_uri, as: 'subnetworkUri'
          collection :tags, as: 'tags'
          property :zone_uri, as: 'zoneUri'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::DataprocV1::GetPolicyOptions, decorator: Google::Apis::DataprocV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class HadoopJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :archive_uris, as: 'archiveUris'
          collection :args, as: 'args'
          collection :file_uris, as: 'fileUris'
          collection :jar_file_uris, as: 'jarFileUris'
          property :logging_config, as: 'loggingConfig', class: Google::Apis::DataprocV1::LoggingConfig, decorator: Google::Apis::DataprocV1::LoggingConfig::Representation
      
          property :main_class, as: 'mainClass'
          property :main_jar_file_uri, as: 'mainJarFileUri'
          hash :properties, as: 'properties'
        end
      end
      
      class HiveJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :continue_on_failure, as: 'continueOnFailure'
          collection :jar_file_uris, as: 'jarFileUris'
          hash :properties, as: 'properties'
          property :query_file_uri, as: 'queryFileUri'
          property :query_list, as: 'queryList', class: Google::Apis::DataprocV1::QueryList, decorator: Google::Apis::DataprocV1::QueryList::Representation
      
          hash :script_variables, as: 'scriptVariables'
        end
      end
      
      class InstanceGroupAutoscalingPolicyConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_instances, as: 'maxInstances'
          property :min_instances, as: 'minInstances'
          property :weight, as: 'weight'
        end
      end
      
      class InstanceGroupConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accelerators, as: 'accelerators', class: Google::Apis::DataprocV1::AcceleratorConfig, decorator: Google::Apis::DataprocV1::AcceleratorConfig::Representation
      
          property :disk_config, as: 'diskConfig', class: Google::Apis::DataprocV1::DiskConfig, decorator: Google::Apis::DataprocV1::DiskConfig::Representation
      
          property :image_uri, as: 'imageUri'
          collection :instance_names, as: 'instanceNames'
          property :is_preemptible, as: 'isPreemptible'
          property :machine_type_uri, as: 'machineTypeUri'
          property :managed_group_config, as: 'managedGroupConfig', class: Google::Apis::DataprocV1::ManagedGroupConfig, decorator: Google::Apis::DataprocV1::ManagedGroupConfig::Representation
      
          property :num_instances, as: 'numInstances'
        end
      end
      
      class InstantiateWorkflowTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :parameters, as: 'parameters'
          property :request_id, as: 'requestId'
          property :version, as: 'version'
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :driver_control_files_uri, as: 'driverControlFilesUri'
          property :driver_output_resource_uri, as: 'driverOutputResourceUri'
          property :hadoop_job, as: 'hadoopJob', class: Google::Apis::DataprocV1::HadoopJob, decorator: Google::Apis::DataprocV1::HadoopJob::Representation
      
          property :hive_job, as: 'hiveJob', class: Google::Apis::DataprocV1::HiveJob, decorator: Google::Apis::DataprocV1::HiveJob::Representation
      
          property :job_uuid, as: 'jobUuid'
          hash :labels, as: 'labels'
          property :pig_job, as: 'pigJob', class: Google::Apis::DataprocV1::PigJob, decorator: Google::Apis::DataprocV1::PigJob::Representation
      
          property :placement, as: 'placement', class: Google::Apis::DataprocV1::JobPlacement, decorator: Google::Apis::DataprocV1::JobPlacement::Representation
      
          property :pyspark_job, as: 'pysparkJob', class: Google::Apis::DataprocV1::PySparkJob, decorator: Google::Apis::DataprocV1::PySparkJob::Representation
      
          property :reference, as: 'reference', class: Google::Apis::DataprocV1::JobReference, decorator: Google::Apis::DataprocV1::JobReference::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::DataprocV1::JobScheduling, decorator: Google::Apis::DataprocV1::JobScheduling::Representation
      
          property :spark_job, as: 'sparkJob', class: Google::Apis::DataprocV1::SparkJob, decorator: Google::Apis::DataprocV1::SparkJob::Representation
      
          property :spark_sql_job, as: 'sparkSqlJob', class: Google::Apis::DataprocV1::SparkSqlJob, decorator: Google::Apis::DataprocV1::SparkSqlJob::Representation
      
          property :status, as: 'status', class: Google::Apis::DataprocV1::JobStatus, decorator: Google::Apis::DataprocV1::JobStatus::Representation
      
          collection :status_history, as: 'statusHistory', class: Google::Apis::DataprocV1::JobStatus, decorator: Google::Apis::DataprocV1::JobStatus::Representation
      
          collection :yarn_applications, as: 'yarnApplications', class: Google::Apis::DataprocV1::YarnApplication, decorator: Google::Apis::DataprocV1::YarnApplication::Representation
      
        end
      end
      
      class JobPlacement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_name, as: 'clusterName'
          property :cluster_uuid, as: 'clusterUuid'
        end
      end
      
      class JobReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_id, as: 'jobId'
          property :project_id, as: 'projectId'
        end
      end
      
      class JobScheduling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_failures_per_hour, as: 'maxFailuresPerHour'
        end
      end
      
      class JobStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details'
          property :state, as: 'state'
          property :state_start_time, as: 'stateStartTime'
          property :substate, as: 'substate'
        end
      end
      
      class KerberosConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cross_realm_trust_admin_server, as: 'crossRealmTrustAdminServer'
          property :cross_realm_trust_kdc, as: 'crossRealmTrustKdc'
          property :cross_realm_trust_realm, as: 'crossRealmTrustRealm'
          property :cross_realm_trust_shared_password_uri, as: 'crossRealmTrustSharedPasswordUri'
          property :enable_kerberos, as: 'enableKerberos'
          property :kdc_db_key_uri, as: 'kdcDbKeyUri'
          property :key_password_uri, as: 'keyPasswordUri'
          property :keystore_password_uri, as: 'keystorePasswordUri'
          property :keystore_uri, as: 'keystoreUri'
          property :kms_key_uri, as: 'kmsKeyUri'
          property :realm, as: 'realm'
          property :root_principal_password_uri, as: 'rootPrincipalPasswordUri'
          property :tgt_lifetime_hours, as: 'tgtLifetimeHours'
          property :truststore_password_uri, as: 'truststorePasswordUri'
          property :truststore_uri, as: 'truststoreUri'
        end
      end
      
      class LifecycleConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete_time, as: 'autoDeleteTime'
          property :auto_delete_ttl, as: 'autoDeleteTtl'
          property :idle_delete_ttl, as: 'idleDeleteTtl'
          property :idle_start_time, as: 'idleStartTime'
        end
      end
      
      class ListAutoscalingPoliciesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :policies, as: 'policies', class: Google::Apis::DataprocV1::AutoscalingPolicy, decorator: Google::Apis::DataprocV1::AutoscalingPolicy::Representation
      
        end
      end
      
      class ListClustersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :clusters, as: 'clusters', class: Google::Apis::DataprocV1::Cluster, decorator: Google::Apis::DataprocV1::Cluster::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::DataprocV1::Job, decorator: Google::Apis::DataprocV1::Job::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::DataprocV1::Operation, decorator: Google::Apis::DataprocV1::Operation::Representation
      
        end
      end
      
      class ListWorkflowTemplatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :templates, as: 'templates', class: Google::Apis::DataprocV1::WorkflowTemplate, decorator: Google::Apis::DataprocV1::WorkflowTemplate::Representation
      
        end
      end
      
      class LoggingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :driver_log_levels, as: 'driverLogLevels'
        end
      end
      
      class ManagedCluster
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_name, as: 'clusterName'
          property :config, as: 'config', class: Google::Apis::DataprocV1::ClusterConfig, decorator: Google::Apis::DataprocV1::ClusterConfig::Representation
      
          hash :labels, as: 'labels'
        end
      end
      
      class ManagedGroupConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_group_manager_name, as: 'instanceGroupManagerName'
          property :instance_template_name, as: 'instanceTemplateName'
        end
      end
      
      class NodeInitializationAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :executable_file, as: 'executableFile'
          property :execution_timeout, as: 'executionTimeout'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::DataprocV1::Status, decorator: Google::Apis::DataprocV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OrderedJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hadoop_job, as: 'hadoopJob', class: Google::Apis::DataprocV1::HadoopJob, decorator: Google::Apis::DataprocV1::HadoopJob::Representation
      
          property :hive_job, as: 'hiveJob', class: Google::Apis::DataprocV1::HiveJob, decorator: Google::Apis::DataprocV1::HiveJob::Representation
      
          hash :labels, as: 'labels'
          property :pig_job, as: 'pigJob', class: Google::Apis::DataprocV1::PigJob, decorator: Google::Apis::DataprocV1::PigJob::Representation
      
          collection :prerequisite_step_ids, as: 'prerequisiteStepIds'
          property :pyspark_job, as: 'pysparkJob', class: Google::Apis::DataprocV1::PySparkJob, decorator: Google::Apis::DataprocV1::PySparkJob::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::DataprocV1::JobScheduling, decorator: Google::Apis::DataprocV1::JobScheduling::Representation
      
          property :spark_job, as: 'sparkJob', class: Google::Apis::DataprocV1::SparkJob, decorator: Google::Apis::DataprocV1::SparkJob::Representation
      
          property :spark_sql_job, as: 'sparkSqlJob', class: Google::Apis::DataprocV1::SparkSqlJob, decorator: Google::Apis::DataprocV1::SparkSqlJob::Representation
      
          property :step_id, as: 'stepId'
        end
      end
      
      class ParameterValidation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :regex, as: 'regex', class: Google::Apis::DataprocV1::RegexValidation, decorator: Google::Apis::DataprocV1::RegexValidation::Representation
      
          property :values, as: 'values', class: Google::Apis::DataprocV1::ValueValidation, decorator: Google::Apis::DataprocV1::ValueValidation::Representation
      
        end
      end
      
      class PigJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :continue_on_failure, as: 'continueOnFailure'
          collection :jar_file_uris, as: 'jarFileUris'
          property :logging_config, as: 'loggingConfig', class: Google::Apis::DataprocV1::LoggingConfig, decorator: Google::Apis::DataprocV1::LoggingConfig::Representation
      
          hash :properties, as: 'properties'
          property :query_file_uri, as: 'queryFileUri'
          property :query_list, as: 'queryList', class: Google::Apis::DataprocV1::QueryList, decorator: Google::Apis::DataprocV1::QueryList::Representation
      
          hash :script_variables, as: 'scriptVariables'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::DataprocV1::Binding, decorator: Google::Apis::DataprocV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class PySparkJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :archive_uris, as: 'archiveUris'
          collection :args, as: 'args'
          collection :file_uris, as: 'fileUris'
          collection :jar_file_uris, as: 'jarFileUris'
          property :logging_config, as: 'loggingConfig', class: Google::Apis::DataprocV1::LoggingConfig, decorator: Google::Apis::DataprocV1::LoggingConfig::Representation
      
          property :main_python_file_uri, as: 'mainPythonFileUri'
          hash :properties, as: 'properties'
          collection :python_file_uris, as: 'pythonFileUris'
        end
      end
      
      class QueryList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :queries, as: 'queries'
        end
      end
      
      class RegexValidation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :regexes, as: 'regexes'
        end
      end
      
      class SecurityConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kerberos_config, as: 'kerberosConfig', class: Google::Apis::DataprocV1::KerberosConfig, decorator: Google::Apis::DataprocV1::KerberosConfig::Representation
      
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::DataprocV1::Policy, decorator: Google::Apis::DataprocV1::Policy::Representation
      
        end
      end
      
      class SoftwareConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_version, as: 'imageVersion'
          collection :optional_components, as: 'optionalComponents'
          hash :properties, as: 'properties'
        end
      end
      
      class SparkJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :archive_uris, as: 'archiveUris'
          collection :args, as: 'args'
          collection :file_uris, as: 'fileUris'
          collection :jar_file_uris, as: 'jarFileUris'
          property :logging_config, as: 'loggingConfig', class: Google::Apis::DataprocV1::LoggingConfig, decorator: Google::Apis::DataprocV1::LoggingConfig::Representation
      
          property :main_class, as: 'mainClass'
          property :main_jar_file_uri, as: 'mainJarFileUri'
          hash :properties, as: 'properties'
        end
      end
      
      class SparkSqlJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jar_file_uris, as: 'jarFileUris'
          property :logging_config, as: 'loggingConfig', class: Google::Apis::DataprocV1::LoggingConfig, decorator: Google::Apis::DataprocV1::LoggingConfig::Representation
      
          hash :properties, as: 'properties'
          property :query_file_uri, as: 'queryFileUri'
          property :query_list, as: 'queryList', class: Google::Apis::DataprocV1::QueryList, decorator: Google::Apis::DataprocV1::QueryList::Representation
      
          hash :script_variables, as: 'scriptVariables'
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
      
      class SubmitJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job, as: 'job', class: Google::Apis::DataprocV1::Job, decorator: Google::Apis::DataprocV1::Job::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class TemplateParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          collection :fields, as: 'fields'
          property :name, as: 'name'
          property :validation, as: 'validation', class: Google::Apis::DataprocV1::ParameterValidation, decorator: Google::Apis::DataprocV1::ParameterValidation::Representation
      
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class ValueValidation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values'
        end
      end
      
      class WorkflowGraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :nodes, as: 'nodes', class: Google::Apis::DataprocV1::WorkflowNode, decorator: Google::Apis::DataprocV1::WorkflowNode::Representation
      
        end
      end
      
      class WorkflowMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_name, as: 'clusterName'
          property :cluster_uuid, as: 'clusterUuid'
          property :create_cluster, as: 'createCluster', class: Google::Apis::DataprocV1::ClusterOperation, decorator: Google::Apis::DataprocV1::ClusterOperation::Representation
      
          property :delete_cluster, as: 'deleteCluster', class: Google::Apis::DataprocV1::ClusterOperation, decorator: Google::Apis::DataprocV1::ClusterOperation::Representation
      
          property :end_time, as: 'endTime'
          property :graph, as: 'graph', class: Google::Apis::DataprocV1::WorkflowGraph, decorator: Google::Apis::DataprocV1::WorkflowGraph::Representation
      
          hash :parameters, as: 'parameters'
          property :start_time, as: 'startTime'
          property :state, as: 'state'
          property :template, as: 'template'
          property :version, as: 'version'
        end
      end
      
      class WorkflowNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error'
          property :job_id, as: 'jobId'
          collection :prerequisite_step_ids, as: 'prerequisiteStepIds'
          property :state, as: 'state'
          property :step_id, as: 'stepId'
        end
      end
      
      class WorkflowTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :id, as: 'id'
          collection :jobs, as: 'jobs', class: Google::Apis::DataprocV1::OrderedJob, decorator: Google::Apis::DataprocV1::OrderedJob::Representation
      
          hash :labels, as: 'labels'
          property :name, as: 'name'
          collection :parameters, as: 'parameters', class: Google::Apis::DataprocV1::TemplateParameter, decorator: Google::Apis::DataprocV1::TemplateParameter::Representation
      
          property :placement, as: 'placement', class: Google::Apis::DataprocV1::WorkflowTemplatePlacement, decorator: Google::Apis::DataprocV1::WorkflowTemplatePlacement::Representation
      
          property :update_time, as: 'updateTime'
          property :version, as: 'version'
        end
      end
      
      class WorkflowTemplatePlacement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_selector, as: 'clusterSelector', class: Google::Apis::DataprocV1::ClusterSelector, decorator: Google::Apis::DataprocV1::ClusterSelector::Representation
      
          property :managed_cluster, as: 'managedCluster', class: Google::Apis::DataprocV1::ManagedCluster, decorator: Google::Apis::DataprocV1::ManagedCluster::Representation
      
        end
      end
      
      class YarnApplication
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :progress, as: 'progress'
          property :state, as: 'state'
          property :tracking_url, as: 'trackingUrl'
        end
      end
    end
  end
end
