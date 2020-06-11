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
    module BigtableadminV2
      
      # A configuration object describing how Cloud Bigtable should treat traffic
      # from a particular end user application.
      class AppProfile
        include Google::Apis::Core::Hashable
      
        # Optional long form description of the use case for this AppProfile.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Strongly validated etag for optimistic concurrency control. Preserve the
        # value returned from `GetAppProfile` when calling `UpdateAppProfile` to
        # fail the request if there has been a modification in the mean time. The
        # `update_mask` of the request need not include `etag` for this protection
        # to apply.
        # See [Wikipedia](https://en.wikipedia.org/wiki/HTTP_ETag) and
        # [RFC 7232](https://tools.ietf.org/html/rfc7232#section-2.3) for more
        # details.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Read/write requests are routed to the nearest cluster in the instance, and
        # will fail over to the nearest cluster that is available in the event of
        # transient errors or delays. Clusters in a region are considered
        # equidistant. Choosing this option sacrifices read-your-writes consistency
        # to improve availability.
        # Corresponds to the JSON property `multiClusterRoutingUseAny`
        # @return [Google::Apis::BigtableadminV2::MultiClusterRoutingUseAny]
        attr_accessor :multi_cluster_routing_use_any
      
        # (`OutputOnly`)
        # The unique name of the app profile. Values are of the form
        # `projects/<project>/instances/<instance>/appProfiles/_a-zA-Z0-9*`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Unconditionally routes all read/write requests to a specific cluster.
        # This option preserves read-your-writes consistency but does not improve
        # availability.
        # Corresponds to the JSON property `singleClusterRouting`
        # @return [Google::Apis::BigtableadminV2::SingleClusterRouting]
        attr_accessor :single_cluster_routing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @multi_cluster_routing_use_any = args[:multi_cluster_routing_use_any] if args.key?(:multi_cluster_routing_use_any)
          @name = args[:name] if args.key?(:name)
          @single_cluster_routing = args[:single_cluster_routing] if args.key?(:single_cluster_routing)
        end
      end
      
      # Specifies the audit configuration for a service.
      # The configuration determines which permission types are logged, and what
      # identities, if any, are exempted from logging.
      # An AuditConfig must have one or more AuditLogConfigs.
      # If there are AuditConfigs for both `allServices` and a specific service,
      # the union of the two AuditConfigs is used for that service: the log_types
      # specified in each AuditConfig are enabled, and the exempted_members in each
      # AuditLogConfig are exempted.
      # Example Policy with multiple AuditConfigs:
      # `
      # "audit_configs": [
      # `
      # "service": "allServices"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `,
      # `
      # "log_type": "ADMIN_READ",
      # `
      # ]
      # `,
      # `
      # "service": "sampleservice.googleapis.com"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # "exempted_members": [
      # "user:aliya@example.com"
      # ]
      # `
      # ]
      # `
      # ]
      # `
      # For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
      # logging. It also exempts jose@example.com from DATA_READ logging, and
      # aliya@example.com from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::BigtableadminV2::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # Specifies a service that will be enabled for audit logging.
        # For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
        # `allServices` is a special value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions.
      # Example:
      # `
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `
      # ]
      # `
      # This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
      # jose@example.com from DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of
        # permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::BigtableadminV2::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
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
      
      # Request message for
      # google.bigtable.admin.v2.BigtableTableAdmin.CheckConsistency
      class CheckConsistencyRequest
        include Google::Apis::Core::Hashable
      
        # The token created using GenerateConsistencyToken for the Table.
        # Corresponds to the JSON property `consistencyToken`
        # @return [String]
        attr_accessor :consistency_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consistency_token = args[:consistency_token] if args.key?(:consistency_token)
        end
      end
      
      # Response message for
      # google.bigtable.admin.v2.BigtableTableAdmin.CheckConsistency
      class CheckConsistencyResponse
        include Google::Apis::Core::Hashable
      
        # True only if the token is consistent. A token is consistent if replication
        # has caught up with the restrictions specified in the request.
        # Corresponds to the JSON property `consistent`
        # @return [Boolean]
        attr_accessor :consistent
        alias_method :consistent?, :consistent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consistent = args[:consistent] if args.key?(:consistent)
        end
      end
      
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
      
      # The state of a table's data in a particular cluster.
      class ClusterState
        include Google::Apis::Core::Hashable
      
        # Output only. The state of replication for the table in this cluster.
        # Corresponds to the JSON property `replicationState`
        # @return [String]
        attr_accessor :replication_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @replication_state = args[:replication_state] if args.key?(:replication_state)
        end
      end
      
      # A set of columns within a table which share a common configuration.
      class ColumnFamily
        include Google::Apis::Core::Hashable
      
        # Rule for determining which cells to delete during garbage collection.
        # Corresponds to the JSON property `gcRule`
        # @return [Google::Apis::BigtableadminV2::GcRule]
        attr_accessor :gc_rule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gc_rule = args[:gc_rule] if args.key?(:gc_rule)
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
        # @return [Google::Apis::BigtableadminV2::CreateClusterRequest]
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
        # @return [Hash<String,Google::Apis::BigtableadminV2::TableProgress>]
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
        # @return [Google::Apis::BigtableadminV2::Cluster]
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
        # @return [Google::Apis::BigtableadminV2::CreateInstanceRequest]
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
        # @return [Hash<String,Google::Apis::BigtableadminV2::Cluster>]
        attr_accessor :clusters
      
        # A collection of Bigtable Tables and
        # the resources that serve them.
        # All tables in an instance are served from all
        # Clusters in the instance.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::BigtableadminV2::Instance]
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
      
      # Request message for
      # google.bigtable.admin.v2.BigtableTableAdmin.CreateTable
      class CreateTableRequest
        include Google::Apis::Core::Hashable
      
        # The optional list of row keys that will be used to initially split the
        # table into several tablets (tablets are similar to HBase regions).
        # Given two split keys, `s1` and `s2`, three tablets will be created,
        # spanning the key ranges: `[, s1), [s1, s2), [s2, )`.
        # Example:
        # * Row keys := `["a", "apple", "custom", "customer_1", "customer_2",`
        # `"other", "zz"]`
        # * initial_split_keys := `["apple", "customer_1", "customer_2", "other"]`
        # * Key assignment:
        # - Tablet 1 `[, apple)                => `"a"`.`
        # - Tablet 2 `[apple, customer_1)      => `"apple", "custom"`.`
        # - Tablet 3 `[customer_1, customer_2) => `"customer_1"`.`
        # - Tablet 4 `[customer_2, other)      => `"customer_2"`.`
        # - Tablet 5 `[other, )                => `"other", "zz"`.`
        # Corresponds to the JSON property `initialSplits`
        # @return [Array<Google::Apis::BigtableadminV2::Split>]
        attr_accessor :initial_splits
      
        # A collection of user data indexed by row, column, and timestamp.
        # Each table is served using the resources of its parent cluster.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::BigtableadminV2::Table]
        attr_accessor :table
      
        # The name by which the new table should be referred to within the parent
        # instance, e.g., `foobar` rather than `<parent>/tables/foobar`.
        # Maximum 50 characters.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @initial_splits = args[:initial_splits] if args.key?(:initial_splits)
          @table = args[:table] if args.key?(:table)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Request message for
      # google.bigtable.admin.v2.BigtableTableAdmin.DropRowRange
      class DropRowRangeRequest
        include Google::Apis::Core::Hashable
      
        # Delete all rows in the table. Setting this to false is a no-op.
        # Corresponds to the JSON property `deleteAllDataFromTable`
        # @return [Boolean]
        attr_accessor :delete_all_data_from_table
        alias_method :delete_all_data_from_table?, :delete_all_data_from_table
      
        # Delete all rows that start with this row key prefix. Prefix cannot be
        # zero length.
        # Corresponds to the JSON property `rowKeyPrefix`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :row_key_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delete_all_data_from_table = args[:delete_all_data_from_table] if args.key?(:delete_all_data_from_table)
          @row_key_prefix = args[:row_key_prefix] if args.key?(:row_key_prefix)
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
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
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
      
      # Rule for determining which cells to delete during garbage collection.
      class GcRule
        include Google::Apis::Core::Hashable
      
        # A GcRule which deletes cells matching all of the given rules.
        # Corresponds to the JSON property `intersection`
        # @return [Google::Apis::BigtableadminV2::Intersection]
        attr_accessor :intersection
      
        # Delete cells in a column older than the given age.
        # Values must be at least one millisecond, and will be truncated to
        # microsecond granularity.
        # Corresponds to the JSON property `maxAge`
        # @return [String]
        attr_accessor :max_age
      
        # Delete all cells in a column except the most recent N.
        # Corresponds to the JSON property `maxNumVersions`
        # @return [Fixnum]
        attr_accessor :max_num_versions
      
        # A GcRule which deletes cells matching any of the given rules.
        # Corresponds to the JSON property `union`
        # @return [Google::Apis::BigtableadminV2::Union]
        attr_accessor :union
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intersection = args[:intersection] if args.key?(:intersection)
          @max_age = args[:max_age] if args.key?(:max_age)
          @max_num_versions = args[:max_num_versions] if args.key?(:max_num_versions)
          @union = args[:union] if args.key?(:union)
        end
      end
      
      # Request message for
      # google.bigtable.admin.v2.BigtableTableAdmin.GenerateConsistencyToken
      class GenerateConsistencyTokenRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for
      # google.bigtable.admin.v2.BigtableTableAdmin.GenerateConsistencyToken
      class GenerateConsistencyTokenResponse
        include Google::Apis::Core::Hashable
      
        # The generated consistency token.
        # Corresponds to the JSON property `consistencyToken`
        # @return [String]
        attr_accessor :consistency_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consistency_token = args[:consistency_token] if args.key?(:consistency_token)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::BigtableadminV2::GetPolicyOptions]
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
      
        # Optional. The policy format version to be returned.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Requests for policies with any conditional bindings must specify version 3.
        # Policies without any conditional bindings may specify any valid value or
        # leave the field unset.
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
      
      # A GcRule which deletes cells matching all of the given rules.
      class Intersection
        include Google::Apis::Core::Hashable
      
        # Only delete cells which would be deleted by every element of `rules`.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::BigtableadminV2::GcRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Response message for BigtableInstanceAdmin.ListAppProfiles.
      class ListAppProfilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of requested app profiles.
        # Corresponds to the JSON property `appProfiles`
        # @return [Array<Google::Apis::BigtableadminV2::AppProfile>]
        attr_accessor :app_profiles
      
        # Locations from which AppProfile information could not be retrieved,
        # due to an outage or some other transient condition.
        # AppProfiles from these locations may be missing from `app_profiles`.
        # Values are of the form `projects/<project>/locations/<zone_id>`
        # Corresponds to the JSON property `failedLocations`
        # @return [Array<String>]
        attr_accessor :failed_locations
      
        # Set if not all app profiles could be returned in a single response.
        # Pass this value to `page_token` in another request to get the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_profiles = args[:app_profiles] if args.key?(:app_profiles)
          @failed_locations = args[:failed_locations] if args.key?(:failed_locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for BigtableInstanceAdmin.ListClusters.
      class ListClustersResponse
        include Google::Apis::Core::Hashable
      
        # The list of requested clusters.
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::BigtableadminV2::Cluster>]
        attr_accessor :clusters
      
        # Locations from which Cluster information could not be retrieved,
        # due to an outage or some other transient condition.
        # Clusters from these locations may be missing from `clusters`,
        # or may only have partial information returned.
        # Values are of the form `projects/<project>/locations/<zone_id>`
        # Corresponds to the JSON property `failedLocations`
        # @return [Array<String>]
        attr_accessor :failed_locations
      
        # DEPRECATED: This field is unused and ignored.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @failed_locations = args[:failed_locations] if args.key?(:failed_locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for BigtableInstanceAdmin.ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # Locations from which Instance information could not be retrieved,
        # due to an outage or some other transient condition.
        # Instances whose Clusters are all in one of the failed locations
        # may be missing from `instances`, and Instances with at least one
        # Cluster in a failed location may only have partial information returned.
        # Values are of the form `projects/<project>/locations/<zone_id>`
        # Corresponds to the JSON property `failedLocations`
        # @return [Array<String>]
        attr_accessor :failed_locations
      
        # The list of requested instances.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::BigtableadminV2::Instance>]
        attr_accessor :instances
      
        # DEPRECATED: This field is unused and ignored.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failed_locations = args[:failed_locations] if args.key?(:failed_locations)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::BigtableadminV2::Location>]
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
        # @return [Array<Google::Apis::BigtableadminV2::Operation>]
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
      
      # Response message for
      # google.bigtable.admin.v2.BigtableTableAdmin.ListTables
      class ListTablesResponse
        include Google::Apis::Core::Hashable
      
        # Set if not all tables could be returned in a single response.
        # Pass this value to `page_token` in another request to get the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The tables present in the requested instance.
        # Corresponds to the JSON property `tables`
        # @return [Array<Google::Apis::BigtableadminV2::Table>]
        attr_accessor :tables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tables = args[:tables] if args.key?(:tables)
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
      
      # A create, update, or delete of a particular column family.
      class Modification
        include Google::Apis::Core::Hashable
      
        # A set of columns within a table which share a common configuration.
        # Corresponds to the JSON property `create`
        # @return [Google::Apis::BigtableadminV2::ColumnFamily]
        attr_accessor :create
      
        # Drop (delete) the column family with the given ID, or fail if no such
        # family exists.
        # Corresponds to the JSON property `drop`
        # @return [Boolean]
        attr_accessor :drop
        alias_method :drop?, :drop
      
        # The ID of the column family to be modified.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A set of columns within a table which share a common configuration.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::BigtableadminV2::ColumnFamily]
        attr_accessor :update
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create = args[:create] if args.key?(:create)
          @drop = args[:drop] if args.key?(:drop)
          @id = args[:id] if args.key?(:id)
          @update = args[:update] if args.key?(:update)
        end
      end
      
      # Request message for
      # google.bigtable.admin.v2.BigtableTableAdmin.ModifyColumnFamilies
      class ModifyColumnFamiliesRequest
        include Google::Apis::Core::Hashable
      
        # Modifications to be atomically applied to the specified table's families.
        # Entries are applied in order, meaning that earlier modifications can be
        # masked by later ones (in the case of repeated updates to the same family,
        # for example).
        # Corresponds to the JSON property `modifications`
        # @return [Array<Google::Apis::BigtableadminV2::Modification>]
        attr_accessor :modifications
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @modifications = args[:modifications] if args.key?(:modifications)
        end
      end
      
      # Read/write requests are routed to the nearest cluster in the instance, and
      # will fail over to the nearest cluster that is available in the event of
      # transient errors or delays. Clusters in a region are considered
      # equidistant. Choosing this option sacrifices read-your-writes consistency
      # to improve availability.
      class MultiClusterRoutingUseAny
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
        # @return [Google::Apis::BigtableadminV2::Status]
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
      
      # Request message for BigtableInstanceAdmin.PartialUpdateInstance.
      class PartialUpdateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # A collection of Bigtable Tables and
        # the resources that serve them.
        # All tables in an instance are served from all
        # Clusters in the instance.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::BigtableadminV2::Instance]
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
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` is a collection of `bindings`. A `binding` binds one or more
      # `members` to a single `role`. Members can be user accounts, service accounts,
      # Google groups, and domains (such as G Suite). A `role` is a named list of
      # permissions (defined by IAM or configured by users). A `binding` can
      # optionally specify a `condition`, which is a logic expression that further
      # constrains the role binding based on attributes about the request and/or
      # target resource.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/resourcemanager.organizationAdmin",
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
      # **YAML Example**
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
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::BigtableadminV2::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::BigtableadminV2::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten. Due to blind-set semantics of an etag-less policy,
        # 'setIamPolicy' will not fail even if either of incoming or stored policy
        # does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Operations affecting conditional bindings must specify version 3. This can
        # be either setting a conditional policy, modifying a conditional binding,
        # or removing a conditional binding from the stored conditional policy.
        # Operations on non-conditional policies may specify any valid value or
        # leave the field unset.
        # If no etag is provided in the call to `setIamPolicy`, any version
        # compliance checks on the incoming and/or stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` is a collection of `bindings`. A `binding` binds one or more
        # `members` to a single `role`. Members can be user accounts, service accounts,
        # Google groups, and domains (such as G Suite). A `role` is a named list of
        # permissions (defined by IAM or configured by users). A `binding` can
        # optionally specify a `condition`, which is a logic expression that further
        # constrains the role binding based on attributes about the request and/or
        # target resource.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/resourcemanager.organizationAdmin",
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
        # **YAML Example**
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
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::BigtableadminV2::Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the
        # following default mask is used:
        # paths: "bindings, etag"
        # This field is only used by Cloud IAM.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Unconditionally routes all read/write requests to a specific cluster.
      # This option preserves read-your-writes consistency but does not improve
      # availability.
      class SingleClusterRouting
        include Google::Apis::Core::Hashable
      
        # Whether or not `CheckAndMutateRow` and `ReadModifyWriteRow` requests are
        # allowed by this app profile. It is unsafe to send these requests to
        # the same table/row/column in multiple clusters.
        # Corresponds to the JSON property `allowTransactionalWrites`
        # @return [Boolean]
        attr_accessor :allow_transactional_writes
        alias_method :allow_transactional_writes?, :allow_transactional_writes
      
        # The cluster to which read/write requests should be routed.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_transactional_writes = args[:allow_transactional_writes] if args.key?(:allow_transactional_writes)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
        end
      end
      
      # An initial split point for a newly created table.
      class Split
        include Google::Apis::Core::Hashable
      
        # Row key to use as an initial tablet boundary.
        # Corresponds to the JSON property `key`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
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
      
      # A collection of user data indexed by row, column, and timestamp.
      # Each table is served using the resources of its parent cluster.
      class Table
        include Google::Apis::Core::Hashable
      
        # Output only. Map from cluster ID to per-cluster table state.
        # If it could not be determined whether or not the table has data in a
        # particular cluster (for example, if its zone is unavailable), then
        # there will be an entry for the cluster with UNKNOWN `replication_status`.
        # Views: `REPLICATION_VIEW`, `FULL`
        # Corresponds to the JSON property `clusterStates`
        # @return [Hash<String,Google::Apis::BigtableadminV2::ClusterState>]
        attr_accessor :cluster_states
      
        # (`CreationOnly`)
        # The column families configured for this table, mapped by column family ID.
        # Views: `SCHEMA_VIEW`, `FULL`
        # Corresponds to the JSON property `columnFamilies`
        # @return [Hash<String,Google::Apis::BigtableadminV2::ColumnFamily>]
        attr_accessor :column_families
      
        # (`CreationOnly`)
        # The granularity (i.e. `MILLIS`) at which timestamps are stored in
        # this table. Timestamps not matching the granularity will be rejected.
        # If unspecified at creation time, the value will be set to `MILLIS`.
        # Views: `SCHEMA_VIEW`, `FULL`.
        # Corresponds to the JSON property `granularity`
        # @return [String]
        attr_accessor :granularity
      
        # Output only. The unique name of the table. Values are of the form
        # `projects/<project>/instances/<instance>/tables/_a-zA-Z0-9*`.
        # Views: `NAME_ONLY`, `SCHEMA_VIEW`, `REPLICATION_VIEW`, `FULL`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_states = args[:cluster_states] if args.key?(:cluster_states)
          @column_families = args[:column_families] if args.key?(:column_families)
          @granularity = args[:granularity] if args.key?(:granularity)
          @name = args[:name] if args.key?(:name)
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
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
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
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
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
      
      # A GcRule which deletes cells matching any of the given rules.
      class Union
        include Google::Apis::Core::Hashable
      
        # Delete cells which would be deleted by any element of `rules`.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::BigtableadminV2::GcRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
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
        # @return [Google::Apis::BigtableadminV2::Cluster]
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
        # @return [Google::Apis::BigtableadminV2::PartialUpdateInstanceRequest]
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
