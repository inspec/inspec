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
    module CloudassetV1
      
      # Cloud asset. This includes all Google Cloud Platform resources,
      # Cloud IAM policies, and other non-GCP assets.
      class Asset
        include Google::Apis::Core::Hashable
      
        # An `AccessLevel` is a label that can be applied to requests to GCP services,
        # along with a list of requirements necessary for the label to be applied.
        # Corresponds to the JSON property `accessLevel`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessLevel]
        attr_accessor :access_level
      
        # `AccessPolicy` is a container for `AccessLevels` (which define the necessary
        # attributes to use GCP services) and `ServicePerimeters` (which define regions
        # of services able to freely pass data within a perimeter). An access policy is
        # globally visible within an organization, and the restrictions it specifies
        # apply to all projects within an organization.
        # Corresponds to the JSON property `accessPolicy`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1AccessPolicy]
        attr_accessor :access_policy
      
        # Asset's ancestry path in Cloud Resource Manager (CRM) hierarchy,
        # represented as a list of relative resource names. Ancestry path starts with
        # the closest CRM ancestor and ends at root. If the asset is a CRM
        # project/folder/organization, this starts from the asset itself.
        # Example: ["projects/123456789", "folders/5432", "organizations/1234"]
        # Corresponds to the JSON property `ancestors`
        # @return [Array<String>]
        attr_accessor :ancestors
      
        # Type of the asset. Example: "compute.googleapis.com/Disk".
        # Corresponds to the JSON property `assetType`
        # @return [String]
        attr_accessor :asset_type
      
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
        # Corresponds to the JSON property `iamPolicy`
        # @return [Google::Apis::CloudassetV1::Policy]
        attr_accessor :iam_policy
      
        # The full name of the asset. For example:
        # `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/
        # instance1`.
        # See [Resource
        # Names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        # for more information.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Representation of the Cloud Organization Policy set on an asset. For each
        # asset, there could be multiple Organization policies with different
        # constraints.
        # Corresponds to the JSON property `orgPolicy`
        # @return [Array<Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1Policy>]
        attr_accessor :org_policy
      
        # Representation of a cloud resource.
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::CloudassetV1::Resource]
        attr_accessor :resource
      
        # `ServicePerimeter` describes a set of GCP resources which can freely import
        # and export data amongst themselves, but not export outside of the
        # `ServicePerimeter`. If a request with a source within this `ServicePerimeter`
        # has a target outside of the `ServicePerimeter`, the request will be blocked.
        # Otherwise the request is allowed. There are two types of Service Perimeter -
        # Regular and Bridge. Regular Service Perimeters cannot overlap, a single GCP
        # project can only belong to a single regular Service Perimeter. Service
        # Perimeter Bridges can contain only GCP projects as members, a single GCP
        # project may belong to multiple Service Perimeter Bridges.
        # Corresponds to the JSON property `servicePerimeter`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeter]
        attr_accessor :service_perimeter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_level = args[:access_level] if args.key?(:access_level)
          @access_policy = args[:access_policy] if args.key?(:access_policy)
          @ancestors = args[:ancestors] if args.key?(:ancestors)
          @asset_type = args[:asset_type] if args.key?(:asset_type)
          @iam_policy = args[:iam_policy] if args.key?(:iam_policy)
          @name = args[:name] if args.key?(:name)
          @org_policy = args[:org_policy] if args.key?(:org_policy)
          @resource = args[:resource] if args.key?(:resource)
          @service_perimeter = args[:service_perimeter] if args.key?(:service_perimeter)
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
        # @return [Array<Google::Apis::CloudassetV1::AuditLogConfig>]
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
      
      # Batch get assets history response.
      class BatchGetAssetsHistoryResponse
        include Google::Apis::Core::Hashable
      
        # A list of assets with valid time windows.
        # Corresponds to the JSON property `assets`
        # @return [Array<Google::Apis::CloudassetV1::TemporalAsset>]
        attr_accessor :assets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assets = args[:assets] if args.key?(:assets)
        end
      end
      
      # A BigQuery destination.
      class BigQueryDestination
        include Google::Apis::Core::Hashable
      
        # Required. The BigQuery dataset in format
        # "projects/projectId/datasets/datasetId", to which the snapshot result
        # should be exported. If this dataset does not exist, the export call returns
        # an error.
        # Corresponds to the JSON property `dataset`
        # @return [String]
        attr_accessor :dataset
      
        # If the destination table already exists and this flag is `TRUE`, the
        # table will be overwritten by the contents of assets snapshot. If the flag
        # is not set and the destination table already exists, the export call
        # returns an error.
        # Corresponds to the JSON property `force`
        # @return [Boolean]
        attr_accessor :force
        alias_method :force?, :force
      
        # Required. The BigQuery table to which the snapshot result should be
        # written. If this table does not exist, a new table with the given name
        # will be created.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset = args[:dataset] if args.key?(:dataset)
          @force = args[:force] if args.key?(:force)
          @table = args[:table] if args.key?(:table)
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
        # @return [Google::Apis::CloudassetV1::Expr]
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
      
      # Export asset request.
      class ExportAssetsRequest
        include Google::Apis::Core::Hashable
      
        # A list of asset types of which to take a snapshot for. For example:
        # "compute.googleapis.com/Disk". If specified, only matching assets will be
        # returned. See [Introduction to Cloud Asset
        # Inventory](https://cloud.google.com/asset-inventory/docs/overview)
        # for all supported asset types.
        # Corresponds to the JSON property `assetTypes`
        # @return [Array<String>]
        attr_accessor :asset_types
      
        # Asset content type. If not specified, no content but the asset name will be
        # returned.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # Output configuration for export assets destination.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::CloudassetV1::OutputConfig]
        attr_accessor :output_config
      
        # Timestamp to take an asset snapshot. This can only be set to a timestamp
        # between 2018-10-02 UTC (inclusive) and the current time. If not specified,
        # the current time will be used. Due to delays in resource data collection
        # and indexing, there is a volatile window during which running the same
        # query may get different results.
        # Corresponds to the JSON property `readTime`
        # @return [String]
        attr_accessor :read_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset_types = args[:asset_types] if args.key?(:asset_types)
          @content_type = args[:content_type] if args.key?(:content_type)
          @output_config = args[:output_config] if args.key?(:output_config)
          @read_time = args[:read_time] if args.key?(:read_time)
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
      
      # A Cloud Storage location.
      class GcsDestination
        include Google::Apis::Core::Hashable
      
        # The uri of the Cloud Storage object. It's the same uri that is used by
        # gsutil. For example: "gs://bucket_name/object_name". See [Viewing and
        # Editing Object
        # Metadata](https://cloud.google.com/storage/docs/viewing-editing-metadata)
        # for more information.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        # The uri prefix of all generated Cloud Storage objects. For example:
        # "gs://bucket_name/object_name_prefix". Each object uri is in format:
        # "gs://bucket_name/object_name_prefix/<asset type>/<shard number> and only
        # contains assets for that type. <shard number> starts from 0. For example:
        # "gs://bucket_name/object_name_prefix/compute.googleapis.com/Disk/0" is
        # the first shard of output objects containing all
        # compute.googleapis.com/Disk assets. An INVALID_ARGUMENT error will be
        # returned if file with the same name "gs://bucket_name/object_name_prefix"
        # already exists.
        # Corresponds to the JSON property `uriPrefix`
        # @return [String]
        attr_accessor :uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
          @uri_prefix = args[:uri_prefix] if args.key?(:uri_prefix)
        end
      end
      
      # Used in `policy_type` to specify how `boolean_policy` will behave at this
      # resource.
      class GoogleCloudOrgpolicyV1BooleanPolicy
        include Google::Apis::Core::Hashable
      
        # If `true`, then the `Policy` is enforced. If `false`, then any
        # configuration is acceptable.
        # Suppose you have a `Constraint`
        # `constraints/compute.disableSerialPortAccess` with `constraint_default`
        # set to `ALLOW`. A `Policy` for that `Constraint` exhibits the following
        # behavior:
        # - If the `Policy` at this resource has enforced set to `false`, serial
        # port connection attempts will be allowed.
        # - If the `Policy` at this resource has enforced set to `true`, serial
        # port connection attempts will be refused.
        # - If the `Policy` at this resource is `RestoreDefault`, serial port
        # connection attempts will be allowed.
        # - If no `Policy` is set at this resource or anywhere higher in the
        # resource hierarchy, serial port connection attempts will be allowed.
        # - If no `Policy` is set at this resource, but one exists higher in the
        # resource hierarchy, the behavior is as if the`Policy` were set at
        # this resource.
        # The following examples demonstrate the different possible layerings:
        # Example 1 (nearest `Constraint` wins):
        # `organizations/foo` has a `Policy` with:
        # `enforced: false`
        # `projects/bar` has no `Policy` set.
        # The constraint at `projects/bar` and `organizations/foo` will not be
        # enforced.
        # Example 2 (enforcement gets replaced):
        # `organizations/foo` has a `Policy` with:
        # `enforced: false`
        # `projects/bar` has a `Policy` with:
        # `enforced: true`
        # The constraint at `organizations/foo` is not enforced.
        # The constraint at `projects/bar` is enforced.
        # Example 3 (RestoreDefault):
        # `organizations/foo` has a `Policy` with:
        # `enforced: true`
        # `projects/bar` has a `Policy` with:
        # `RestoreDefault: ```
        # The constraint at `organizations/foo` is enforced.
        # The constraint at `projects/bar` is not enforced, because
        # `constraint_default` for the `Constraint` is `ALLOW`.
        # Corresponds to the JSON property `enforced`
        # @return [Boolean]
        attr_accessor :enforced
        alias_method :enforced?, :enforced
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enforced = args[:enforced] if args.key?(:enforced)
        end
      end
      
      # Used in `policy_type` to specify how `list_policy` behaves at this
      # resource.
      # `ListPolicy` can define specific values and subtrees of Cloud Resource
      # Manager resource hierarchy (`Organizations`, `Folders`, `Projects`) that
      # are allowed or denied by setting the `allowed_values` and `denied_values`
      # fields. This is achieved by using the `under:` and optional `is:` prefixes.
      # The `under:` prefix is used to denote resource subtree values.
      # The `is:` prefix is used to denote specific values, and is required only
      # if the value contains a ":". Values prefixed with "is:" are treated the
      # same as values with no prefix.
      # Ancestry subtrees must be in one of the following formats:
      # - "projects/<project-id>", e.g. "projects/tokyo-rain-123"
      # - "folders/<folder-id>", e.g. "folders/1234"
      # - "organizations/<organization-id>", e.g. "organizations/1234"
      # The `supports_under` field of the associated `Constraint`  defines whether
      # ancestry prefixes can be used. You can set `allowed_values` and
      # `denied_values` in the same `Policy` if `all_values` is
      # `ALL_VALUES_UNSPECIFIED`. `ALLOW` or `DENY` are used to allow or deny all
      # values. If `all_values` is set to either `ALLOW` or `DENY`,
      # `allowed_values` and `denied_values` must be unset.
      class GoogleCloudOrgpolicyV1ListPolicy
        include Google::Apis::Core::Hashable
      
        # The policy all_values state.
        # Corresponds to the JSON property `allValues`
        # @return [String]
        attr_accessor :all_values
      
        # List of values allowed  at this resource. Can only be set if `all_values`
        # is set to `ALL_VALUES_UNSPECIFIED`.
        # Corresponds to the JSON property `allowedValues`
        # @return [Array<String>]
        attr_accessor :allowed_values
      
        # List of values denied at this resource. Can only be set if `all_values`
        # is set to `ALL_VALUES_UNSPECIFIED`.
        # Corresponds to the JSON property `deniedValues`
        # @return [Array<String>]
        attr_accessor :denied_values
      
        # Determines the inheritance behavior for this `Policy`.
        # By default, a `ListPolicy` set at a resource supercedes any `Policy` set
        # anywhere up the resource hierarchy. However, if `inherit_from_parent` is
        # set to `true`, then the values from the effective `Policy` of the parent
        # resource are inherited, meaning the values set in this `Policy` are
        # added to the values inherited up the hierarchy.
        # Setting `Policy` hierarchies that inherit both allowed values and denied
        # values isn't recommended in most circumstances to keep the configuration
        # simple and understandable. However, it is possible to set a `Policy` with
        # `allowed_values` set that inherits a `Policy` with `denied_values` set.
        # In this case, the values that are allowed must be in `allowed_values` and
        # not present in `denied_values`.
        # For example, suppose you have a `Constraint`
        # `constraints/serviceuser.services`, which has a `constraint_type` of
        # `list_constraint`, and with `constraint_default` set to `ALLOW`.
        # Suppose that at the Organization level, a `Policy` is applied that
        # restricts the allowed API activations to ``E1`, `E2``. Then, if a
        # `Policy` is applied to a project below the Organization that has
        # `inherit_from_parent` set to `false` and field all_values set to DENY,
        # then an attempt to activate any API will be denied.
        # The following examples demonstrate different possible layerings for
        # `projects/bar` parented by `organizations/foo`:
        # Example 1 (no inherited values):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values:"E2"`
        # `projects/bar` has `inherit_from_parent` `false` and values:
        # `allowed_values: "E3" allowed_values: "E4"`
        # The accepted values at `organizations/foo` are `E1`, `E2`.
        # The accepted values at `projects/bar` are `E3`, and `E4`.
        # Example 2 (inherited values):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values:"E2"`
        # `projects/bar` has a `Policy` with values:
        # `value: "E3" value: "E4" inherit_from_parent: true`
        # The accepted values at `organizations/foo` are `E1`, `E2`.
        # The accepted values at `projects/bar` are `E1`, `E2`, `E3`, and `E4`.
        # Example 3 (inheriting both allowed and denied values):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values: "E2"`
        # `projects/bar` has a `Policy` with:
        # `denied_values: "E1"`
        # The accepted values at `organizations/foo` are `E1`, `E2`.
        # The value accepted at `projects/bar` is `E2`.
        # Example 4 (RestoreDefault):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values:"E2"`
        # `projects/bar` has a `Policy` with values:
        # `RestoreDefault: ```
        # The accepted values at `organizations/foo` are `E1`, `E2`.
        # The accepted values at `projects/bar` are either all or none depending on
        # the value of `constraint_default` (if `ALLOW`, all; if
        # `DENY`, none).
        # Example 5 (no policy inherits parent policy):
        # `organizations/foo` has no `Policy` set.
        # `projects/bar` has no `Policy` set.
        # The accepted values at both levels are either all or none depending on
        # the value of `constraint_default` (if `ALLOW`, all; if
        # `DENY`, none).
        # Example 6 (ListConstraint allowing all):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values: "E2"`
        # `projects/bar` has a `Policy` with:
        # `all: ALLOW`
        # The accepted values at `organizations/foo` are `E1`, E2`.
        # Any value is accepted at `projects/bar`.
        # Example 7 (ListConstraint allowing none):
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "E1" allowed_values: "E2"`
        # `projects/bar` has a `Policy` with:
        # `all: DENY`
        # The accepted values at `organizations/foo` are `E1`, E2`.
        # No value is accepted at `projects/bar`.
        # Example 10 (allowed and denied subtrees of Resource Manager hierarchy):
        # Given the following resource hierarchy
        # O1->`F1, F2`; F1->`P1`; F2->`P2, P3`,
        # `organizations/foo` has a `Policy` with values:
        # `allowed_values: "under:organizations/O1"`
        # `projects/bar` has a `Policy` with:
        # `allowed_values: "under:projects/P3"`
        # `denied_values: "under:folders/F2"`
        # The accepted values at `organizations/foo` are `organizations/O1`,
        # `folders/F1`, `folders/F2`, `projects/P1`, `projects/P2`,
        # `projects/P3`.
        # The accepted values at `projects/bar` are `organizations/O1`,
        # `folders/F1`, `projects/P1`.
        # Corresponds to the JSON property `inheritFromParent`
        # @return [Boolean]
        attr_accessor :inherit_from_parent
        alias_method :inherit_from_parent?, :inherit_from_parent
      
        # Optional. The Google Cloud Console will try to default to a configuration
        # that matches the value specified in this `Policy`. If `suggested_value`
        # is not set, it will inherit the value specified higher in the hierarchy,
        # unless `inherit_from_parent` is `false`.
        # Corresponds to the JSON property `suggestedValue`
        # @return [String]
        attr_accessor :suggested_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all_values = args[:all_values] if args.key?(:all_values)
          @allowed_values = args[:allowed_values] if args.key?(:allowed_values)
          @denied_values = args[:denied_values] if args.key?(:denied_values)
          @inherit_from_parent = args[:inherit_from_parent] if args.key?(:inherit_from_parent)
          @suggested_value = args[:suggested_value] if args.key?(:suggested_value)
        end
      end
      
      # Defines a Cloud Organization `Policy` which is used to specify `Constraints`
      # for configurations of Cloud Platform resources.
      class GoogleCloudOrgpolicyV1Policy
        include Google::Apis::Core::Hashable
      
        # Used in `policy_type` to specify how `boolean_policy` will behave at this
        # resource.
        # Corresponds to the JSON property `booleanPolicy`
        # @return [Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1BooleanPolicy]
        attr_accessor :boolean_policy
      
        # The name of the `Constraint` the `Policy` is configuring, for example,
        # `constraints/serviceuser.services`.
        # Immutable after creation.
        # Corresponds to the JSON property `constraint`
        # @return [String]
        attr_accessor :constraint
      
        # An opaque tag indicating the current version of the `Policy`, used for
        # concurrency control.
        # When the `Policy` is returned from either a `GetPolicy` or a
        # `ListOrgPolicy` request, this `etag` indicates the version of the current
        # `Policy` to use when executing a read-modify-write loop.
        # When the `Policy` is returned from a `GetEffectivePolicy` request, the
        # `etag` will be unset.
        # When the `Policy` is used in a `SetOrgPolicy` method, use the `etag` value
        # that was returned from a `GetOrgPolicy` request as part of a
        # read-modify-write loop for concurrency control. Not setting the `etag`in a
        # `SetOrgPolicy` request will result in an unconditional write of the
        # `Policy`.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Used in `policy_type` to specify how `list_policy` behaves at this
        # resource.
        # `ListPolicy` can define specific values and subtrees of Cloud Resource
        # Manager resource hierarchy (`Organizations`, `Folders`, `Projects`) that
        # are allowed or denied by setting the `allowed_values` and `denied_values`
        # fields. This is achieved by using the `under:` and optional `is:` prefixes.
        # The `under:` prefix is used to denote resource subtree values.
        # The `is:` prefix is used to denote specific values, and is required only
        # if the value contains a ":". Values prefixed with "is:" are treated the
        # same as values with no prefix.
        # Ancestry subtrees must be in one of the following formats:
        # - "projects/<project-id>", e.g. "projects/tokyo-rain-123"
        # - "folders/<folder-id>", e.g. "folders/1234"
        # - "organizations/<organization-id>", e.g. "organizations/1234"
        # The `supports_under` field of the associated `Constraint`  defines whether
        # ancestry prefixes can be used. You can set `allowed_values` and
        # `denied_values` in the same `Policy` if `all_values` is
        # `ALL_VALUES_UNSPECIFIED`. `ALLOW` or `DENY` are used to allow or deny all
        # values. If `all_values` is set to either `ALLOW` or `DENY`,
        # `allowed_values` and `denied_values` must be unset.
        # Corresponds to the JSON property `listPolicy`
        # @return [Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1ListPolicy]
        attr_accessor :list_policy
      
        # Ignores policies set above this resource and restores the
        # `constraint_default` enforcement behavior of the specific `Constraint` at
        # this resource.
        # Suppose that `constraint_default` is set to `ALLOW` for the
        # `Constraint` `constraints/serviceuser.services`. Suppose that organization
        # foo.com sets a `Policy` at their Organization resource node that restricts
        # the allowed service activations to deny all service activations. They
        # could then set a `Policy` with the `policy_type` `restore_default` on
        # several experimental projects, restoring the `constraint_default`
        # enforcement of the `Constraint` for only those projects, allowing those
        # projects to have all services activated.
        # Corresponds to the JSON property `restoreDefault`
        # @return [Google::Apis::CloudassetV1::GoogleCloudOrgpolicyV1RestoreDefault]
        attr_accessor :restore_default
      
        # The time stamp the `Policy` was previously updated. This is set by the
        # server, not specified by the caller, and represents the last time a call to
        # `SetOrgPolicy` was made for that `Policy`. Any value set by the client will
        # be ignored.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Version of the `Policy`. Default version is 0;
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_policy = args[:boolean_policy] if args.key?(:boolean_policy)
          @constraint = args[:constraint] if args.key?(:constraint)
          @etag = args[:etag] if args.key?(:etag)
          @list_policy = args[:list_policy] if args.key?(:list_policy)
          @restore_default = args[:restore_default] if args.key?(:restore_default)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Ignores policies set above this resource and restores the
      # `constraint_default` enforcement behavior of the specific `Constraint` at
      # this resource.
      # Suppose that `constraint_default` is set to `ALLOW` for the
      # `Constraint` `constraints/serviceuser.services`. Suppose that organization
      # foo.com sets a `Policy` at their Organization resource node that restricts
      # the allowed service activations to deny all service activations. They
      # could then set a `Policy` with the `policy_type` `restore_default` on
      # several experimental projects, restoring the `constraint_default`
      # enforcement of the `Constraint` for only those projects, allowing those
      # projects to have all services activated.
      class GoogleCloudOrgpolicyV1RestoreDefault
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An `AccessLevel` is a label that can be applied to requests to GCP services,
      # along with a list of requirements necessary for the label to be applied.
      class GoogleIdentityAccesscontextmanagerV1AccessLevel
        include Google::Apis::Core::Hashable
      
        # `BasicLevel` is an `AccessLevel` using a set of recommended features.
        # Corresponds to the JSON property `basic`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1BasicLevel]
        attr_accessor :basic
      
        # Output only. Time the `AccessLevel` was created in UTC.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Description of the `AccessLevel` and its use. Does not affect behavior.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. Resource name for the Access Level. The `short_name` component
        # must begin with a letter and only include alphanumeric and '_'. Format:
        # `accessPolicies/`policy_id`/accessLevels/`short_name``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Human readable title. Must be unique within the Policy.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Output only. Time the `AccessLevel` was updated in UTC.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @basic = args[:basic] if args.key?(:basic)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @title = args[:title] if args.key?(:title)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # `AccessPolicy` is a container for `AccessLevels` (which define the necessary
      # attributes to use GCP services) and `ServicePerimeters` (which define regions
      # of services able to freely pass data within a perimeter). An access policy is
      # globally visible within an organization, and the restrictions it specifies
      # apply to all projects within an organization.
      class GoogleIdentityAccesscontextmanagerV1AccessPolicy
        include Google::Apis::Core::Hashable
      
        # Output only. Time the `AccessPolicy` was created in UTC.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Resource name of the `AccessPolicy`. Format:
        # `accessPolicies/`policy_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The parent of this `AccessPolicy` in the Cloud Resource
        # Hierarchy. Currently immutable once created. Format:
        # `organizations/`organization_id``
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Required. Human readable title. Does not affect behavior.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Output only. Time the `AccessPolicy` was updated in UTC.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @parent = args[:parent] if args.key?(:parent)
          @title = args[:title] if args.key?(:title)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # `BasicLevel` is an `AccessLevel` using a set of recommended features.
      class GoogleIdentityAccesscontextmanagerV1BasicLevel
        include Google::Apis::Core::Hashable
      
        # How the `conditions` list should be combined to determine if a request is
        # granted this `AccessLevel`. If AND is used, each `Condition` in
        # `conditions` must be satisfied for the `AccessLevel` to be applied. If OR
        # is used, at least one `Condition` in `conditions` must be satisfied for the
        # `AccessLevel` to be applied. Default behavior is AND.
        # Corresponds to the JSON property `combiningFunction`
        # @return [String]
        attr_accessor :combining_function
      
        # Required. A list of requirements for the `AccessLevel` to be granted.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1Condition>]
        attr_accessor :conditions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @combining_function = args[:combining_function] if args.key?(:combining_function)
          @conditions = args[:conditions] if args.key?(:conditions)
        end
      end
      
      # A condition necessary for an `AccessLevel` to be granted. The Condition is an
      # AND over its fields. So a Condition is true if: 1) the request IP is from one
      # of the listed subnetworks AND 2) the originating device complies with the
      # listed device policy AND 3) all listed access levels are granted AND 4) the
      # request was sent at a time allowed by the DateTimeRestriction.
      class GoogleIdentityAccesscontextmanagerV1Condition
        include Google::Apis::Core::Hashable
      
        # `DevicePolicy` specifies device specific restrictions necessary to acquire a
        # given access level. A `DevicePolicy` specifies requirements for requests from
        # devices to be granted access levels, it does not do any enforcement on the
        # device. `DevicePolicy` acts as an AND over all specified fields, and each
        # repeated field is an OR over its elements. Any unset fields are ignored. For
        # example, if the proto is ` os_type : DESKTOP_WINDOWS, os_type :
        # DESKTOP_LINUX, encryption_status: ENCRYPTED`, then the DevicePolicy will be
        # true for requests originating from encrypted Linux desktops and encrypted
        # Windows desktops.
        # Corresponds to the JSON property `devicePolicy`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1DevicePolicy]
        attr_accessor :device_policy
      
        # CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for
        # a CIDR IP address block, the specified IP address portion must be properly
        # truncated (i.e. all the host bits must be zero) or the input is considered
        # malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is
        # not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas
        # "2001:db8::1/32" is not. The originating IP of a request must be in one of
        # the listed subnets in order for this Condition to be true. If empty, all IP
        # addresses are allowed.
        # Corresponds to the JSON property `ipSubnetworks`
        # @return [Array<String>]
        attr_accessor :ip_subnetworks
      
        # The request must be made by one of the provided user or service
        # accounts. Groups are not supported.
        # Syntax:
        # `user:`emailid``
        # `serviceAccount:`emailid``
        # If not specified, a request may come from any user.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Whether to negate the Condition. If true, the Condition becomes a NAND over
        # its non-empty fields, each field must be false for the Condition overall to
        # be satisfied. Defaults to false.
        # Corresponds to the JSON property `negate`
        # @return [Boolean]
        attr_accessor :negate
        alias_method :negate?, :negate
      
        # The request must originate from one of the provided countries/regions.
        # Must be valid ISO 3166-1 alpha-2 codes.
        # Corresponds to the JSON property `regions`
        # @return [Array<String>]
        attr_accessor :regions
      
        # A list of other access levels defined in the same `Policy`, referenced by
        # resource name. Referencing an `AccessLevel` which does not exist is an
        # error. All access levels listed must be granted for the Condition
        # to be true. Example:
        # "`accessPolicies/MY_POLICY/accessLevels/LEVEL_NAME"`
        # Corresponds to the JSON property `requiredAccessLevels`
        # @return [Array<String>]
        attr_accessor :required_access_levels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_policy = args[:device_policy] if args.key?(:device_policy)
          @ip_subnetworks = args[:ip_subnetworks] if args.key?(:ip_subnetworks)
          @members = args[:members] if args.key?(:members)
          @negate = args[:negate] if args.key?(:negate)
          @regions = args[:regions] if args.key?(:regions)
          @required_access_levels = args[:required_access_levels] if args.key?(:required_access_levels)
        end
      end
      
      # `DevicePolicy` specifies device specific restrictions necessary to acquire a
      # given access level. A `DevicePolicy` specifies requirements for requests from
      # devices to be granted access levels, it does not do any enforcement on the
      # device. `DevicePolicy` acts as an AND over all specified fields, and each
      # repeated field is an OR over its elements. Any unset fields are ignored. For
      # example, if the proto is ` os_type : DESKTOP_WINDOWS, os_type :
      # DESKTOP_LINUX, encryption_status: ENCRYPTED`, then the DevicePolicy will be
      # true for requests originating from encrypted Linux desktops and encrypted
      # Windows desktops.
      class GoogleIdentityAccesscontextmanagerV1DevicePolicy
        include Google::Apis::Core::Hashable
      
        # Allowed device management levels, an empty list allows all management
        # levels.
        # Corresponds to the JSON property `allowedDeviceManagementLevels`
        # @return [Array<String>]
        attr_accessor :allowed_device_management_levels
      
        # Allowed encryptions statuses, an empty list allows all statuses.
        # Corresponds to the JSON property `allowedEncryptionStatuses`
        # @return [Array<String>]
        attr_accessor :allowed_encryption_statuses
      
        # Allowed OS versions, an empty list allows all types and all versions.
        # Corresponds to the JSON property `osConstraints`
        # @return [Array<Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1OsConstraint>]
        attr_accessor :os_constraints
      
        # Whether the device needs to be approved by the customer admin.
        # Corresponds to the JSON property `requireAdminApproval`
        # @return [Boolean]
        attr_accessor :require_admin_approval
        alias_method :require_admin_approval?, :require_admin_approval
      
        # Whether the device needs to be corp owned.
        # Corresponds to the JSON property `requireCorpOwned`
        # @return [Boolean]
        attr_accessor :require_corp_owned
        alias_method :require_corp_owned?, :require_corp_owned
      
        # Whether or not screenlock is required for the DevicePolicy to be true.
        # Defaults to `false`.
        # Corresponds to the JSON property `requireScreenlock`
        # @return [Boolean]
        attr_accessor :require_screenlock
        alias_method :require_screenlock?, :require_screenlock
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed_device_management_levels = args[:allowed_device_management_levels] if args.key?(:allowed_device_management_levels)
          @allowed_encryption_statuses = args[:allowed_encryption_statuses] if args.key?(:allowed_encryption_statuses)
          @os_constraints = args[:os_constraints] if args.key?(:os_constraints)
          @require_admin_approval = args[:require_admin_approval] if args.key?(:require_admin_approval)
          @require_corp_owned = args[:require_corp_owned] if args.key?(:require_corp_owned)
          @require_screenlock = args[:require_screenlock] if args.key?(:require_screenlock)
        end
      end
      
      # A restriction on the OS type and version of devices making requests.
      class GoogleIdentityAccesscontextmanagerV1OsConstraint
        include Google::Apis::Core::Hashable
      
        # The minimum allowed OS version. If not set, any version of this OS
        # satisfies the constraint. Format: `"major.minor.patch"`.
        # Examples: `"10.5.301"`, `"9.2.1"`.
        # Corresponds to the JSON property `minimumVersion`
        # @return [String]
        attr_accessor :minimum_version
      
        # Required. The allowed OS type.
        # Corresponds to the JSON property `osType`
        # @return [String]
        attr_accessor :os_type
      
        # Only allows requests from devices with a verified Chrome OS.
        # Verifications includes requirements that the device is enterprise-managed,
        # conformant to domain policies, and the caller has permission to call
        # the API targeted by the request.
        # Corresponds to the JSON property `requireVerifiedChromeOs`
        # @return [Boolean]
        attr_accessor :require_verified_chrome_os
        alias_method :require_verified_chrome_os?, :require_verified_chrome_os
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @minimum_version = args[:minimum_version] if args.key?(:minimum_version)
          @os_type = args[:os_type] if args.key?(:os_type)
          @require_verified_chrome_os = args[:require_verified_chrome_os] if args.key?(:require_verified_chrome_os)
        end
      end
      
      # `ServicePerimeter` describes a set of GCP resources which can freely import
      # and export data amongst themselves, but not export outside of the
      # `ServicePerimeter`. If a request with a source within this `ServicePerimeter`
      # has a target outside of the `ServicePerimeter`, the request will be blocked.
      # Otherwise the request is allowed. There are two types of Service Perimeter -
      # Regular and Bridge. Regular Service Perimeters cannot overlap, a single GCP
      # project can only belong to a single regular Service Perimeter. Service
      # Perimeter Bridges can contain only GCP projects as members, a single GCP
      # project may belong to multiple Service Perimeter Bridges.
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeter
        include Google::Apis::Core::Hashable
      
        # Output only. Time the `ServicePerimeter` was created in UTC.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Description of the `ServicePerimeter` and its use. Does not affect
        # behavior.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. Resource name for the ServicePerimeter.  The `short_name`
        # component must begin with a letter and only include alphanumeric and '_'.
        # Format: `accessPolicies/`policy_id`/servicePerimeters/`short_name``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Perimeter type indicator. A single project is
        # allowed to be a member of single regular perimeter, but multiple service
        # perimeter bridges. A project cannot be a included in a perimeter bridge
        # without being included in regular perimeter. For perimeter bridges,
        # the restricted service list as well as access level lists must be
        # empty.
        # Corresponds to the JSON property `perimeterType`
        # @return [String]
        attr_accessor :perimeter_type
      
        # `ServicePerimeterConfig` specifies a set of GCP resources that describe
        # specific Service Perimeter configuration.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::CloudassetV1::GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig]
        attr_accessor :status
      
        # Human readable title. Must be unique within the Policy.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Output only. Time the `ServicePerimeter` was updated in UTC.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @perimeter_type = args[:perimeter_type] if args.key?(:perimeter_type)
          @status = args[:status] if args.key?(:status)
          @title = args[:title] if args.key?(:title)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # `ServicePerimeterConfig` specifies a set of GCP resources that describe
      # specific Service Perimeter configuration.
      class GoogleIdentityAccesscontextmanagerV1ServicePerimeterConfig
        include Google::Apis::Core::Hashable
      
        # A list of `AccessLevel` resource names that allow resources within the
        # `ServicePerimeter` to be accessed from the internet. `AccessLevels` listed
        # must be in the same policy as this `ServicePerimeter`. Referencing a
        # nonexistent `AccessLevel` is a syntax error. If no `AccessLevel` names are
        # listed, resources within the perimeter can only be accessed via GCP calls
        # with request origins within the perimeter. Example:
        # `"accessPolicies/MY_POLICY/accessLevels/MY_LEVEL"`.
        # For Service Perimeter Bridge, must be empty.
        # Corresponds to the JSON property `accessLevels`
        # @return [Array<String>]
        attr_accessor :access_levels
      
        # A list of GCP resources that are inside of the service perimeter.
        # Currently only projects are allowed. Format: `projects/`project_number``
        # Corresponds to the JSON property `resources`
        # @return [Array<String>]
        attr_accessor :resources
      
        # GCP services that are subject to the Service Perimeter restrictions. For
        # example, if `storage.googleapis.com` is specified, access to the storage
        # buckets inside the perimeter must meet the perimeter's access restrictions.
        # Corresponds to the JSON property `restrictedServices`
        # @return [Array<String>]
        attr_accessor :restricted_services
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_levels = args[:access_levels] if args.key?(:access_levels)
          @resources = args[:resources] if args.key?(:resources)
          @restricted_services = args[:restricted_services] if args.key?(:restricted_services)
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
        # @return [Google::Apis::CloudassetV1::Status]
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
      
      # Output configuration for export assets destination.
      class OutputConfig
        include Google::Apis::Core::Hashable
      
        # A BigQuery destination.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::CloudassetV1::BigQueryDestination]
        attr_accessor :bigquery_destination
      
        # A Cloud Storage location.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::CloudassetV1::GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
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
        # @return [Array<Google::Apis::CloudassetV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudassetV1::Binding>]
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
      
      # Representation of a cloud resource.
      class Resource
        include Google::Apis::Core::Hashable
      
        # The content of the resource, in which some sensitive fields are scrubbed
        # away and may not be present.
        # Corresponds to the JSON property `data`
        # @return [Hash<String,Object>]
        attr_accessor :data
      
        # The URL of the discovery document containing the resource's JSON schema.
        # For example:
        # `"https://www.googleapis.com/discovery/v1/apis/compute/v1/rest"`.
        # It will be left unspecified for resources without a discovery-based API,
        # such as Cloud Bigtable.
        # Corresponds to the JSON property `discoveryDocumentUri`
        # @return [String]
        attr_accessor :discovery_document_uri
      
        # The JSON schema name listed in the discovery document.
        # Example: "Project". It will be left unspecified for resources (such as
        # Cloud Bigtable) without a discovery-based API.
        # Corresponds to the JSON property `discoveryName`
        # @return [String]
        attr_accessor :discovery_name
      
        # The full name of the immediate parent of this resource. See
        # [Resource
        # Names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        # for more information.
        # For GCP assets, it is the parent resource defined in the [Cloud IAM policy
        # hierarchy](https://cloud.google.com/iam/docs/overview#policy_hierarchy).
        # For example:
        # `"//cloudresourcemanager.googleapis.com/projects/my_project_123"`.
        # For third-party assets, it is up to the users to define.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # The REST URL for accessing the resource. An HTTP GET operation using this
        # URL returns the resource itself.
        # Example:
        # `https://cloudresourcemanager.googleapis.com/v1/projects/my-project-123`.
        # It will be left unspecified for resources without a REST API.
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        # The API version. Example: "v1".
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @discovery_document_uri = args[:discovery_document_uri] if args.key?(:discovery_document_uri)
          @discovery_name = args[:discovery_name] if args.key?(:discovery_name)
          @parent = args[:parent] if args.key?(:parent)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
          @version = args[:version] if args.key?(:version)
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
      
      # Temporal asset. In addition to the asset, the temporal asset includes the
      # status of the asset and valid from and to time of it.
      class TemporalAsset
        include Google::Apis::Core::Hashable
      
        # Cloud asset. This includes all Google Cloud Platform resources,
        # Cloud IAM policies, and other non-GCP assets.
        # Corresponds to the JSON property `asset`
        # @return [Google::Apis::CloudassetV1::Asset]
        attr_accessor :asset
      
        # If the asset is deleted or not.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # A time window of (start_time, end_time].
        # Corresponds to the JSON property `window`
        # @return [Google::Apis::CloudassetV1::TimeWindow]
        attr_accessor :window
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset = args[:asset] if args.key?(:asset)
          @deleted = args[:deleted] if args.key?(:deleted)
          @window = args[:window] if args.key?(:window)
        end
      end
      
      # A time window of (start_time, end_time].
      class TimeWindow
        include Google::Apis::Core::Hashable
      
        # End time of the time window (inclusive).
        # Current timestamp if not specified.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Start time of the time window (exclusive).
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
    end
  end
end
