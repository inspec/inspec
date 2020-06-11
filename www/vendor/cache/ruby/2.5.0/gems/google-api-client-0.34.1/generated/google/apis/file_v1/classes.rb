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
    module FileV1
      
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
      
      # File share configuration for the instance.
      class FileShareConfig
        include Google::Apis::Core::Hashable
      
        # File share capacity in gigabytes (GB).
        # Cloud Filestore defines 1 GB as 1024^3 bytes.
        # Corresponds to the JSON property `capacityGb`
        # @return [Fixnum]
        attr_accessor :capacity_gb
      
        # The name of the file share (must be 16 characters or less).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @capacity_gb = args[:capacity_gb] if args.key?(:capacity_gb)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Instance represents the interface for SLM services to actuate the state
      # of control plane resources.
      # Example Instance in JSON, where
      # consumer-project=snapchat,
      # producer-project=cloud-sql:
      # ```json
      # Instance:
      # `
      # "name":
      # "projects/snapchat/locations/us-east1/instances/prod-instance",
      # "create_time": `
      # "seconds": 1526406431,
      # `,
      # "labels": `
      # "env": "prod",
      # "foo": "bar"
      # `,
      # "state": READY,
      # "software_versions": `
      # "software_update": "cloud-sql-09-28-2018",
      # `,
      # "maintenance_policy_names": `
      # "UpdatePolicy":
      # "projects/snapchat/locations/us-east1/maintenancePolicies/prod-update-
      # policy",
      # `
      # "rollout_metadata": `
      # "projects/cloud-sql/locations/global/rolloutTypes/software_update": `
      # "release":
      # "projects/cloud-sql/locations/global/releases/cloud-sql-09-28-2018",
      # "rollout":
      # "projects/cloud-sql/locations/us-east1/rollouts/cloud-sql-09-28-2018-
      # canary",
      # `,
      # "projects/cloud-sql/locations/global/rolloutTypes/instance_restart": `
      # "release":
      # "projects/cloud-sql/locations/global/releases/cloud-sql-09-20-repair",
      # "rollout":
      # "projects/cloud-sql/locations/us-east1/rollouts/cloud-sql-09-20-repair-
      # 100-percent",
      # `
      # `
      # "tenant_project_id": "cloud-sql-test-tenant",
      # "producer_metadata": `
      # "cloud-sql-tier": "basic",
      # "cloud-sql-instance-size": "1G",
      # `,
      # "provisioned_resources": [
      # `
      # "resource-type": "compute-instance",
      # "resource-url":
      # "https://www.googleapis.com/compute/v1/projects/cloud-sql/zones/us-east1-
      # b/instances/vm-1",
      # `
      # ],
      # "maintenance_schedules": `
      # "csa_rollout": `
      # "start_time": `
      # "seconds": 1526406431,
      # `,
      # "end_time": `
      # "seconds": 1535406431,
      # `,
      # `,
      # "ncsa_rollout": `
      # "start_time": `
      # "seconds": 1526406431,
      # `,
      # "end_time": `
      # "seconds": 1535406431,
      # `,
      # `
      # `,
      # "consumer_defined_name": "my-sql-instance1",
      # `
      # ```
      class GoogleCloudSaasacceleratorManagementProvidersV1Instance
        include Google::Apis::Core::Hashable
      
        # consumer_defined_name is the name that is set by the consumer. On the other
        # hand Name field represents system-assigned id of an instance so consumers
        # are not necessarily aware of it.
        # consumer_defined_name is used for notification/UI purposes for consumer to
        # recognize their instances.
        # Corresponds to the JSON property `consumerDefinedName`
        # @return [String]
        attr_accessor :consumer_defined_name
      
        # Output only. Timestamp when the resource was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. Resource labels to represent user provided metadata. Each label
        # is a key-value pair, where both the key and the value are arbitrary strings
        # provided by the user.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The MaintenancePolicies that have been attached to the instance.
        # The key must be of the type name of the oneof policy name defined in
        # MaintenancePolicy, and the referenced policy must define the same policy
        # type. For complete details of MaintenancePolicy, please refer to
        # go/cloud-saas-mw-ug.
        # Corresponds to the JSON property `maintenancePolicyNames`
        # @return [Hash<String,String>]
        attr_accessor :maintenance_policy_names
      
        # The MaintenanceSchedule contains the scheduling information of published
        # maintenance schedule.
        # Corresponds to the JSON property `maintenanceSchedules`
        # @return [Hash<String,Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSchedule>]
        attr_accessor :maintenance_schedules
      
        # Unique name of the resource. It uses the form:
        # `projects/`project_id`/locations/`location_id`/instances/`instance_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Custom string attributes used primarily to expose
        # producer-specific information in monitoring dashboards.
        # See go/get-instance-metadata.
        # Corresponds to the JSON property `producerMetadata`
        # @return [Hash<String,String>]
        attr_accessor :producer_metadata
      
        # Output only. The list of data plane resources provisioned for this
        # instance, e.g. compute VMs. See go/get-instance-metadata.
        # Corresponds to the JSON property `provisionedResources`
        # @return [Array<Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource>]
        attr_accessor :provisioned_resources
      
        # The map between RolloutType and the corresponding RolloutMetadata.
        # This is only mutated by rollout service. For actuation implementation,
        # this information is pass-through for Rollout management. Producer shall
        # not modify by itself.
        # For update of a single entry in this map, the update field mask shall
        # follow this sementics: go/advanced-field-masks
        # Corresponds to the JSON property `rolloutMetadata`
        # @return [Hash<String,Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1RolloutMetadata>]
        attr_accessor :rollout_metadata
      
        # SloMetadata contains resources required for proper SLO classification of the
        # instance.
        # Corresponds to the JSON property `sloMetadata`
        # @return [Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata]
        attr_accessor :slo_metadata
      
        # Software versions that are used to deploy this instance. This can be
        # mutated by rollout services.
        # Corresponds to the JSON property `softwareVersions`
        # @return [Hash<String,String>]
        attr_accessor :software_versions
      
        # Output only. Current lifecycle state of the resource (e.g. if it's being
        # created or ready to use).
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. ID of the associated GCP tenant project.
        # See go/get-instance-metadata.
        # Corresponds to the JSON property `tenantProjectId`
        # @return [String]
        attr_accessor :tenant_project_id
      
        # Output only. Timestamp when the resource was last modified.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_defined_name = args[:consumer_defined_name] if args.key?(:consumer_defined_name)
          @create_time = args[:create_time] if args.key?(:create_time)
          @labels = args[:labels] if args.key?(:labels)
          @maintenance_policy_names = args[:maintenance_policy_names] if args.key?(:maintenance_policy_names)
          @maintenance_schedules = args[:maintenance_schedules] if args.key?(:maintenance_schedules)
          @name = args[:name] if args.key?(:name)
          @producer_metadata = args[:producer_metadata] if args.key?(:producer_metadata)
          @provisioned_resources = args[:provisioned_resources] if args.key?(:provisioned_resources)
          @rollout_metadata = args[:rollout_metadata] if args.key?(:rollout_metadata)
          @slo_metadata = args[:slo_metadata] if args.key?(:slo_metadata)
          @software_versions = args[:software_versions] if args.key?(:software_versions)
          @state = args[:state] if args.key?(:state)
          @tenant_project_id = args[:tenant_project_id] if args.key?(:tenant_project_id)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Maintenance schedule which is exposed to customer and potentially end user,
      # indicating published upcoming future maintenance schedule
      class GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSchedule
        include Google::Apis::Core::Hashable
      
        # Can this scheduled update be rescheduled?
        # By default, it's true and API needs to do explicitly check whether it's
        # set, if it's set as false explicitly, it's false
        # Corresponds to the JSON property `canReschedule`
        # @return [Boolean]
        attr_accessor :can_reschedule
        alias_method :can_reschedule?, :can_reschedule
      
        # The scheduled end time for the maintenance.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The rollout management policy this maintenance schedule is associated
        # with. When doing reschedule update request, the reschedule should be
        # against this given policy.
        # Corresponds to the JSON property `rolloutManagementPolicy`
        # @return [String]
        attr_accessor :rollout_management_policy
      
        # The scheduled start time for the maintenance.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @can_reschedule = args[:can_reschedule] if args.key?(:can_reschedule)
          @end_time = args[:end_time] if args.key?(:end_time)
          @rollout_management_policy = args[:rollout_management_policy] if args.key?(:rollout_management_policy)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Node information for custom per-node SLO implementations.
      # SSA does not support per-node SLO, but producers can populate per-node
      # information in SloMetadata for custom precomputations.
      # SSA Eligibility Exporter will emit per-node metric based on this information.
      class GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata
        include Google::Apis::Core::Hashable
      
        # By default node is eligible if instance is eligible.
        # But individual node might be excluded from SLO by adding entry here.
        # For semantic see SloMetadata.exclusions.
        # If both instance and node level exclusions are present for time period,
        # the node level's reason will be reported by Eligibility Exporter.
        # Corresponds to the JSON property `exclusions`
        # @return [Array<Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion>]
        attr_accessor :exclusions
      
        # The location of the node, if different from instance location.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The id of the node.
        # This should be equal to SaasInstanceNode.node_id.
        # Corresponds to the JSON property `nodeId`
        # @return [String]
        attr_accessor :node_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusions = args[:exclusions] if args.key?(:exclusions)
          @location = args[:location] if args.key?(:location)
          @node_id = args[:node_id] if args.key?(:node_id)
        end
      end
      
      # NotificationMetadata is the notification state for an instance.
      class GoogleCloudSaasacceleratorManagementProvidersV1NotificationMetadata
        include Google::Apis::Core::Hashable
      
        # Whether the instance update has been rescheduled.
        # Corresponds to the JSON property `rescheduled`
        # @return [Boolean]
        attr_accessor :rescheduled
        alias_method :rescheduled?, :rescheduled
      
        # The scheduled end time for the maintenance window during which update
        # can be performed on the instance.
        # Corresponds to the JSON property `scheduledEndTime`
        # @return [String]
        attr_accessor :scheduled_end_time
      
        # The scheduled start time for the maintenance window during which
        # update can be performed on the instance.
        # Corresponds to the JSON property `scheduledStartTime`
        # @return [String]
        attr_accessor :scheduled_start_time
      
        # The target release to be applied to the instance.
        # Corresponds to the JSON property `targetRelease`
        # @return [String]
        attr_accessor :target_release
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rescheduled = args[:rescheduled] if args.key?(:rescheduled)
          @scheduled_end_time = args[:scheduled_end_time] if args.key?(:scheduled_end_time)
          @scheduled_start_time = args[:scheduled_start_time] if args.key?(:scheduled_start_time)
          @target_release = args[:target_release] if args.key?(:target_release)
        end
      end
      
      # Describes provisioned dataplane resources.
      class GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource
        include Google::Apis::Core::Hashable
      
        # Type of the resource. This can be either a GCP resource or a custom one
        # (e.g. another cloud provider's VM). For GCP compute resources use singular
        # form of the names listed in GCP compute API documentation
        # (https://cloud.google.com/compute/docs/reference/rest/v1/), prefixed with
        # 'compute-', for example: 'compute-instance', 'compute-disk',
        # 'compute-autoscaler'.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        # URL identifying the resource, e.g.
        # "https://www.googleapis.com/compute/v1/projects/...)".
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
        end
      end
      
      # RolloutMetadata for an actuation instance. It maps to a single RolloutType.
      class GoogleCloudSaasacceleratorManagementProvidersV1RolloutMetadata
        include Google::Apis::Core::Hashable
      
        # NotificationMetadata is the notification state for an instance.
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1NotificationMetadata]
        attr_accessor :notification
      
        # The last Release that has been applied to the instance.
        # Corresponds to the JSON property `releaseName`
        # @return [String]
        attr_accessor :release_name
      
        # The last rollout that has been applied to the instance.
        # Corresponds to the JSON property `rolloutName`
        # @return [String]
        attr_accessor :rollout_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @notification = args[:notification] if args.key?(:notification)
          @release_name = args[:release_name] if args.key?(:release_name)
          @rollout_name = args[:rollout_name] if args.key?(:rollout_name)
        end
      end
      
      # SloExclusion represents an excusion in SLI calculation applies to all SLOs.
      class GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion
        include Google::Apis::Core::Hashable
      
        # Exclusion duration. No restrictions on the possible values.
        # When an ongoing operation is taking longer than initially expected,
        # an existing entry in the exclusion list can be updated by extending the
        # duration. This is supported by the subsystem exporting eligibility data
        # as long as such extension is committed at least 10 minutes before the
        # original exclusion expiration - otherwise it is possible that there will
        # be "gaps" in the exclusion application in the exported timeseries.
        # Corresponds to the JSON property `exclusionDuration`
        # @return [String]
        attr_accessor :exclusion_duration
      
        # Start time of the exclusion. No alignment (e.g. to a full minute) needed.
        # Corresponds to the JSON property `exclusionStartTime`
        # @return [String]
        attr_accessor :exclusion_start_time
      
        # Human-readable reason for the exclusion.
        # This should be a static string (e.g. "Disruptive update in progress")
        # and should not contain dynamically generated data (e.g. instance name).
        # Can be left empty.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # Name of an SLI that this exclusion applies to. Can be left empty,
        # signaling that the instance should be excluded from all SLIs defined
        # in the service SLO configuration.
        # Corresponds to the JSON property `sliName`
        # @return [String]
        attr_accessor :sli_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusion_duration = args[:exclusion_duration] if args.key?(:exclusion_duration)
          @exclusion_start_time = args[:exclusion_start_time] if args.key?(:exclusion_start_time)
          @reason = args[:reason] if args.key?(:reason)
          @sli_name = args[:sli_name] if args.key?(:sli_name)
        end
      end
      
      # SloMetadata contains resources required for proper SLO classification of the
      # instance.
      class GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata
        include Google::Apis::Core::Hashable
      
        # List of SLO exclusion windows. When multiple entries in the list match
        # (matching the exclusion time-window against current time point)
        # the exclusion reason used in the first matching entry will be published.
        # It is not needed to include expired exclusion in this list, as only the
        # currently applicable exclusions are taken into account by the eligibility
        # exporting subsystem (the historical state of exclusions will be reflected
        # in the historically produced timeseries regardless of the current state).
        # This field can be used to mark the instance as temporary ineligible
        # for the purpose of SLO calculation. For permanent instance SLO exclusion,
        # a dedicated tier name can be used that does not have targets specified
        # in the service SLO configuration.
        # Corresponds to the JSON property `exclusions`
        # @return [Array<Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion>]
        attr_accessor :exclusions
      
        # Optional: list of nodes.
        # Some producers need to use per-node metadata to calculate SLO.
        # This field allows such producers to publish per-node SLO meta data,
        # which will be consumed by SSA Eligibility Exporter and published in the
        # form of per node metric to Monarch.
        # Corresponds to the JSON property `nodes`
        # @return [Array<Google::Apis::FileV1::GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata>]
        attr_accessor :nodes
      
        # Name of the SLO tier the Instance belongs to. This name will be expected to
        # match the tiers specified in the service SLO configuration.
        # Field is mandatory and must not be empty.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusions = args[:exclusions] if args.key?(:exclusions)
          @nodes = args[:nodes] if args.key?(:nodes)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # A Cloud Filestore instance.
      class Instance
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the instance was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. A description of the instance (2048 characters or less).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Server-specified ETag for the instance resource to prevent simultaneous
        # updates from overwriting each other.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # File system shares on the instance.
        # For this version, only a single file share is supported.
        # Corresponds to the JSON property `fileShares`
        # @return [Array<Google::Apis::FileV1::FileShareConfig>]
        attr_accessor :file_shares
      
        # Resource labels to represent user provided metadata.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The resource name of the instance, in the format
        # projects/`project_id`/locations/`location_id`/instances/`instance_id`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # VPC networks to which the instance is connected.
        # For this version, only a single network is supported.
        # Corresponds to the JSON property `networks`
        # @return [Array<Google::Apis::FileV1::NetworkConfig>]
        attr_accessor :networks
      
        # Output only. The instance state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Additional information about the instance state, if available.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # The service tier of the instance.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @file_shares = args[:file_shares] if args.key?(:file_shares)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @networks = args[:networks] if args.key?(:networks)
          @state = args[:state] if args.key?(:state)
          @status_message = args[:status_message] if args.key?(:status_message)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # ListInstancesResponse is the result of ListInstancesRequest.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # A list of instances in the project for the specified location.
        # If the `location` value in the request is "-", the response contains a list
        # of instances from all locations. If any location is unreachable, the
        # response will only return instances in reachable locations and the
        # "unreachable" field will be populated with a list of unreachable locations.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::FileV1::Instance>]
        attr_accessor :instances
      
        # The token you can use to retrieve the next page of results. Not returned
        # if there are no more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::FileV1::Location>]
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
        # @return [Array<Google::Apis::FileV1::Operation>]
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
      
      # Network configuration for the instance.
      class NetworkConfig
        include Google::Apis::Core::Hashable
      
        # Output only. IPv4 addresses in the format
        # `octet 1`.`octet 2`.`octet 3`.`octet 4` or IPv6 addresses in the format
        # `block 1`:`block 2`:`block 3`:`block 4`:`block 5`:`block 6`:`block
        # 7`:`block 8`.
        # Corresponds to the JSON property `ipAddresses`
        # @return [Array<String>]
        attr_accessor :ip_addresses
      
        # Internet protocol versions for which the instance has IP addresses
        # assigned. For this version, only MODE_IPV4 is supported.
        # Corresponds to the JSON property `modes`
        # @return [Array<String>]
        attr_accessor :modes
      
        # The name of the Google Compute Engine
        # [VPC network](/compute/docs/networks-and-firewalls#networks) to which the
        # instance is connected.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # A /29 CIDR block in one of the
        # [internal IP address
        # ranges](https://www.arin.net/knowledge/address_filters.html) that
        # identifies the range of IP addresses reserved for this instance. For
        # example, 10.0.0.0/29 or 192.168.0.0/29. The range you specify can't overlap
        # with either existing subnets or assigned IP address ranges for other Cloud
        # Filestore instances in the selected VPC network.
        # Corresponds to the JSON property `reservedIpRange`
        # @return [String]
        attr_accessor :reserved_ip_range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_addresses = args[:ip_addresses] if args.key?(:ip_addresses)
          @modes = args[:modes] if args.key?(:modes)
          @network = args[:network] if args.key?(:network)
          @reserved_ip_range = args[:reserved_ip_range] if args.key?(:reserved_ip_range)
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
        # @return [Google::Apis::FileV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
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
      
      # Represents the metadata of the long-running operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # [Output only] API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # [Output only] Identifies whether the user has requested cancellation
        # of the operation. Operations that have successfully been cancelled
        # have Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # [Output only] The time the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # [Output only] The time the operation finished running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # [Output only] Human-readable status of the operation, if any.
        # Corresponds to the JSON property `statusDetail`
        # @return [String]
        attr_accessor :status_detail
      
        # [Output only] Server-defined resource path for the target of the operation.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # [Output only] Name of the verb executed by the operation.
        # Corresponds to the JSON property `verb`
        # @return [String]
        attr_accessor :verb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @cancel_requested = args[:cancel_requested] if args.key?(:cancel_requested)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @status_detail = args[:status_detail] if args.key?(:status_detail)
          @target = args[:target] if args.key?(:target)
          @verb = args[:verb] if args.key?(:verb)
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
    end
  end
end
