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
    module BigtableadminV1
      
      # A resizable group of nodes in a particular cloud location, capable
      # of serving all Tables in the parent
      # Instance.
      class Cluster
        include Google::Apis::Core::Hashable
      
        # (`CreationOnly`)
        # The type of storage used by this cluster to serve its
        # parent instance's tables, unless explicitly overridden.
        # Corresponds to the JSON property `defaultStorageType`
        # @return [String]
        attr_accessor :default_storage_type
      
        # (`CreationOnly`)
        # The location where this cluster's nodes and storage reside. For best
        # performance, clients should be located as close as possible to this
        # cluster. Currently only zones are supported, so values should be of the
        # form `projects/<project>/locations/<zone>`.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # (`OutputOnly`)
        # The unique name of the cluster. Values are of the form
        # `projects/<project>/instances/<instance>/clusters/a-z*`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The number of nodes allocated to this cluster. More nodes enable higher
        # throughput and more consistent performance.
        # Corresponds to the JSON property `serveNodes`
        # @return [Fixnum]
        attr_accessor :serve_nodes
      
        # (`OutputOnly`)
        # The current state of the cluster.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_storage_type = args[:default_storage_type] if args.key?(:default_storage_type)
          @location = args[:location] if args.key?(:location)
          @name = args[:name] if args.key?(:name)
          @serve_nodes = args[:serve_nodes] if args.key?(:serve_nodes)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The metadata for the Operation returned by CreateCluster.
      class CreateClusterMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which the operation failed or was completed successfully.
        # Corresponds to the JSON property `finishTime`
        # @return [String]
        attr_accessor :finish_time
      
        # Request message for BigtableInstanceAdmin.CreateCluster.
        # Corresponds to the JSON property `originalRequest`
        # @return [Google::Apis::BigtableadminV1::CreateClusterRequest]
        attr_accessor :original_request
      
        # The time at which the original request was received.
        # Corresponds to the JSON property `requestTime`
        # @return [String]
        attr_accessor :request_time
      
        # Keys: the full `name` of each table that existed in the instance when
        # CreateCluster was first called, i.e.
        # `projects/<project>/instances/<instance>/tables/<table>`. Any table added
        # to the instance by a later API call will be created in the new cluster by
        # that API call, not this one.
        # Values: information on how much of a table's data has been copied to the
        # newly-created cluster so far.
        # Corresponds to the JSON property `tables`
        # @return [Hash<String,Google::Apis::BigtableadminV1::TableProgress>]
        attr_accessor :tables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finish_time = args[:finish_time] if args.key?(:finish_time)
          @original_request = args[:original_request] if args.key?(:original_request)
          @request_time = args[:request_time] if args.key?(:request_time)
          @tables = args[:tables] if args.key?(:tables)
        end
      end
      
      # Request message for BigtableInstanceAdmin.CreateCluster.
      class CreateClusterRequest
        include Google::Apis::Core::Hashable
      
        # A resizable group of nodes in a particular cloud location, capable
        # of serving all Tables in the parent
        # Instance.
        # Corresponds to the JSON property `cluster`
        # @return [Google::Apis::BigtableadminV1::Cluster]
        attr_accessor :cluster
      
        # The ID to be used when referring to the new cluster within its instance,
        # e.g., just `mycluster` rather than
        # `projects/myproject/instances/myinstance/clusters/mycluster`.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The unique name of the instance in which to create the new cluster.
        # Values are of the form
        # `projects/<project>/instances/<instance>`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster = args[:cluster] if args.key?(:cluster)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # The metadata for the Operation returned by CreateInstance.
      class CreateInstanceMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which the operation failed or was completed successfully.
        # Corresponds to the JSON property `finishTime`
        # @return [String]
        attr_accessor :finish_time
      
        # Request message for BigtableInstanceAdmin.CreateInstance.
        # Corresponds to the JSON property `originalRequest`
        # @return [Google::Apis::BigtableadminV1::CreateInstanceRequest]
        attr_accessor :original_request
      
        # The time at which the original request was received.
        # Corresponds to the JSON property `requestTime`
        # @return [String]
        attr_accessor :request_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finish_time = args[:finish_time] if args.key?(:finish_time)
          @original_request = args[:original_request] if args.key?(:original_request)
          @request_time = args[:request_time] if args.key?(:request_time)
        end
      end
      
      # Request message for BigtableInstanceAdmin.CreateInstance.
      class CreateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # The clusters to be created within the instance, mapped by desired
        # cluster ID, e.g., just `mycluster` rather than
        # `projects/myproject/instances/myinstance/clusters/mycluster`.
        # Fields marked `OutputOnly` must be left blank.
        # Currently, at most two clusters can be specified.
        # Corresponds to the JSON property `clusters`
        # @return [Hash<String,Google::Apis::BigtableadminV1::Cluster>]
        attr_accessor :clusters
      
        # A collection of Bigtable Tables and
        # the resources that serve them.
        # All tables in an instance are served from all
        # Clusters in the instance.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::BigtableadminV1::Instance]
        attr_accessor :instance
      
        # The ID to be used when referring to the new instance within its project,
        # e.g., just `myinstance` rather than
        # `projects/myproject/instances/myinstance`.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The unique name of the project in which to create the new instance.
        # Values are of the form `projects/<project>`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @instance = args[:instance] if args.key?(:instance)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # A collection of Bigtable Tables and
      # the resources that serve them.
      # All tables in an instance are served from all
      # Clusters in the instance.
      class Instance
        include Google::Apis::Core::Hashable
      
        # The descriptive name for this instance as it appears in UIs.
        # Can be changed at any time, but should be kept globally unique
        # to avoid confusion.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Labels are a flexible and lightweight mechanism for organizing cloud
        # resources into groups that reflect a customer's organizational needs and
        # deployment strategies. They can be used to filter resources and aggregate
        # metrics.
        # * Label keys must be between 1 and 63 characters long and must conform to
        # the regular expression: `\p`Ll`\p`Lo``0,62``.
        # * Label values must be between 0 and 63 characters long and must conform to
        # the regular expression: `[\p`Ll`\p`Lo`\p`N`_-]`0,63``.
        # * No more than 64 labels can be associated with a given resource.
        # * Keys and values must both be under 128 bytes.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # (`OutputOnly`)
        # The unique name of the instance. Values are of the form
        # `projects/<project>/instances/a-z+[a-z0-9]`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # (`OutputOnly`)
        # The current state of the instance.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The type of the instance. Defaults to `PRODUCTION`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Request message for BigtableInstanceAdmin.PartialUpdateInstance.
      class PartialUpdateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # A collection of Bigtable Tables and
        # the resources that serve them.
        # All tables in an instance are served from all
        # Clusters in the instance.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::BigtableadminV1::Instance]
        attr_accessor :instance
      
        # The subset of Instance fields which should be replaced.
        # Must be explicitly set.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance = args[:instance] if args.key?(:instance)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Progress info for copying a table's data to the new cluster.
      class TableProgress
        include Google::Apis::Core::Hashable
      
        # Estimate of the number of bytes copied so far for this table.
        # This will eventually reach 'estimated_size_bytes' unless the table copy
        # is CANCELLED.
        # Corresponds to the JSON property `estimatedCopiedBytes`
        # @return [Fixnum]
        attr_accessor :estimated_copied_bytes
      
        # Estimate of the size of the table to be copied.
        # Corresponds to the JSON property `estimatedSizeBytes`
        # @return [Fixnum]
        attr_accessor :estimated_size_bytes
      
        # 
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @estimated_copied_bytes = args[:estimated_copied_bytes] if args.key?(:estimated_copied_bytes)
          @estimated_size_bytes = args[:estimated_size_bytes] if args.key?(:estimated_size_bytes)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The metadata for the Operation returned by UpdateAppProfile.
      class UpdateAppProfileMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The metadata for the Operation returned by UpdateCluster.
      class UpdateClusterMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which the operation failed or was completed successfully.
        # Corresponds to the JSON property `finishTime`
        # @return [String]
        attr_accessor :finish_time
      
        # A resizable group of nodes in a particular cloud location, capable
        # of serving all Tables in the parent
        # Instance.
        # Corresponds to the JSON property `originalRequest`
        # @return [Google::Apis::BigtableadminV1::Cluster]
        attr_accessor :original_request
      
        # The time at which the original request was received.
        # Corresponds to the JSON property `requestTime`
        # @return [String]
        attr_accessor :request_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finish_time = args[:finish_time] if args.key?(:finish_time)
          @original_request = args[:original_request] if args.key?(:original_request)
          @request_time = args[:request_time] if args.key?(:request_time)
        end
      end
      
      # The metadata for the Operation returned by UpdateInstance.
      class UpdateInstanceMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which the operation failed or was completed successfully.
        # Corresponds to the JSON property `finishTime`
        # @return [String]
        attr_accessor :finish_time
      
        # Request message for BigtableInstanceAdmin.PartialUpdateInstance.
        # Corresponds to the JSON property `originalRequest`
        # @return [Google::Apis::BigtableadminV1::PartialUpdateInstanceRequest]
        attr_accessor :original_request
      
        # The time at which the original request was received.
        # Corresponds to the JSON property `requestTime`
        # @return [String]
        attr_accessor :request_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finish_time = args[:finish_time] if args.key?(:finish_time)
          @original_request = args[:original_request] if args.key?(:original_request)
          @request_time = args[:request_time] if args.key?(:request_time)
        end
      end
    end
  end
end
