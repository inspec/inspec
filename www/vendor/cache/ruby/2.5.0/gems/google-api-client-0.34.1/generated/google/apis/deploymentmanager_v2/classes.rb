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
    module DeploymentmanagerV2
      
      # Specifies the audit configuration for a service. The configuration determines
      # which permission types are logged, and what identities, if any, are exempted
      # from logging. An AuditConfig must have one or more AuditLogConfigs.
      # If there are AuditConfigs for both `allServices` and a specific service, the
      # union of the two AuditConfigs is used for that service: the log_types
      # specified in each AuditConfig are enabled, and the exempted_members in each
      # AuditLogConfig are exempted.
      # Example Policy with multiple AuditConfigs:
      # ` "audit_configs": [ ` "service": "allServices" "audit_log_configs": [ ` "
      # log_type": "DATA_READ", "exempted_members": [ "user:foo@gmail.com" ] `, ` "
      # log_type": "DATA_WRITE", `, ` "log_type": "ADMIN_READ", ` ] `, ` "service": "
      # fooservice.googleapis.com" "audit_log_configs": [ ` "log_type": "DATA_READ", `,
      # ` "log_type": "DATA_WRITE", "exempted_members": [ "user:bar@gmail.com" ] ` ] `
      # ] `
      # For fooservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
      # logging. It also exempts foo@gmail.com from DATA_READ logging, and bar@gmail.
      # com from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::DeploymentmanagerV2::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # 
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # Specifies a service that will be enabled for audit logging. For example, `
        # storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices` is a special
        # value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions. Example:
      # ` "audit_log_configs": [ ` "log_type": "DATA_READ", "exempted_members": [ "
      # user:foo@gmail.com" ] `, ` "log_type": "DATA_WRITE", ` ] `
      # This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting foo@gmail.
      # com from DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of permission.
        # Follows the same format of [Binding.members][].
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
      
      # Authorization-related information used by Cloud Audit Logging.
      class AuthorizationLoggingOptions
        include Google::Apis::Core::Hashable
      
        # The type of the permission that was checked.
        # Corresponds to the JSON property `permissionType`
        # @return [String]
        attr_accessor :permission_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission_type = args[:permission_type] if args.key?(:permission_type)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence" description: "Determines whether the request
        # has a user account" expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::DeploymentmanagerV2::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource. `
        # members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is on the
        # internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone who is
        # authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google account.
        # For example, `alice@gmail.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group. For
        # example, `admins@example.com`.
        # * `domain:`domain``: A Google Apps domain name that represents all the users
        # of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`. For example, `roles/viewer`, `roles/editor`
        # , or `roles/owner`.
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
      
      # A condition to be met.
      class Condition
        include Google::Apis::Core::Hashable
      
        # Trusted attributes supplied by the IAM system.
        # Corresponds to the JSON property `iam`
        # @return [String]
        attr_accessor :iam
      
        # An operator to apply the subject with.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        # Trusted attributes discharged by the service.
        # Corresponds to the JSON property `svc`
        # @return [String]
        attr_accessor :svc
      
        # Trusted attributes supplied by any service that owns resources and uses the
        # IAM system for access control.
        # Corresponds to the JSON property `sys`
        # @return [String]
        attr_accessor :sys
      
        # DEPRECATED. Use 'values' instead.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        # The objects of the condition. This is mutually exclusive with 'value'.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @iam = args[:iam] if args.key?(:iam)
          @op = args[:op] if args.key?(:op)
          @svc = args[:svc] if args.key?(:svc)
          @sys = args[:sys] if args.key?(:sys)
          @value = args[:value] if args.key?(:value)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # 
      class ConfigFile
        include Google::Apis::Core::Hashable
      
        # The contents of the file.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
        end
      end
      
      # 
      class Deployment
        include Google::Apis::Core::Hashable
      
        # An optional user-provided description of the deployment.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Provides a fingerprint to use in requests to modify a deployment, such as
        # update(), stop(), and cancelPreview() requests. A fingerprint is a randomly
        # generated value that must be provided with update(), stop(), and cancelPreview(
        # ) requests to perform optimistic locking. This ensures optimistic concurrency
        # so that only one request happens at a time.
        # The fingerprint is initially generated by Deployment Manager and changes after
        # every request to modify data. To get the latest fingerprint value, perform a
        # get() request to a deployment.
        # Corresponds to the JSON property `fingerprint`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :fingerprint
      
        # 
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Output only. Creation timestamp in RFC3339 text format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # Map of labels; provided by the client when the resource is created or updated.
        # Specifically: Label keys must be between 1 and 63 characters long and must
        # conform to the following regular expression: [a-z]([-a-z0-9]*[a-z0-9])? Label
        # values must be between 0 and 63 characters long and must conform to the
        # regular expression ([a-z]([-a-z0-9]*[a-z0-9])?)?
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::DeploymentmanagerV2::DeploymentLabelEntry>]
        attr_accessor :labels
      
        # Output only. URL of the manifest representing the last manifest that was
        # successfully deployed.
        # Corresponds to the JSON property `manifest`
        # @return [String]
        attr_accessor :manifest
      
        # Name of the resource; provided by the client when the resource is created. The
        # name must be 1-63 characters long, and comply with RFC1035. Specifically, the
        # name must be 1-63 characters long and match the regular expression [a-z]([-a-
        # z0-9]*[a-z0-9])? which means the first character must be a lowercase letter,
        # and all following characters must be a dash, lowercase letter, or digit,
        # except the last character, which cannot be a dash.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An Operation resource, used to manage asynchronous API requests. (==
        # resource_for v1.globalOperations ==) (== resource_for beta.globalOperations ==)
        # (== resource_for v1.regionOperations ==) (== resource_for beta.
        # regionOperations ==) (== resource_for v1.zoneOperations ==) (== resource_for
        # beta.zoneOperations ==)
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        attr_accessor :operation
      
        # Output only. Server defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # 
        # Corresponds to the JSON property `target`
        # @return [Google::Apis::DeploymentmanagerV2::TargetConfiguration]
        attr_accessor :target
      
        # 
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::DeploymentmanagerV2::DeploymentUpdate]
        attr_accessor :update
      
        # Output only. Update timestamp in RFC3339 text format.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @id = args[:id] if args.key?(:id)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @labels = args[:labels] if args.key?(:labels)
          @manifest = args[:manifest] if args.key?(:manifest)
          @name = args[:name] if args.key?(:name)
          @operation = args[:operation] if args.key?(:operation)
          @self_link = args[:self_link] if args.key?(:self_link)
          @target = args[:target] if args.key?(:target)
          @update = args[:update] if args.key?(:update)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # 
      class DeploymentLabelEntry
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # 
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
      
      # 
      class DeploymentUpdate
        include Google::Apis::Core::Hashable
      
        # Output only. An optional user-provided description of the deployment after the
        # current update has been applied.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. Map of labels; provided by the client when the resource is
        # created or updated. Specifically: Label keys must be between 1 and 63
        # characters long and must conform to the following regular expression: [a-z]([-
        # a-z0-9]*[a-z0-9])? Label values must be between 0 and 63 characters long and
        # must conform to the regular expression ([a-z]([-a-z0-9]*[a-z0-9])?)?
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::DeploymentmanagerV2::DeploymentUpdateLabelEntry>]
        attr_accessor :labels
      
        # Output only. URL of the manifest representing the update configuration of this
        # deployment.
        # Corresponds to the JSON property `manifest`
        # @return [String]
        attr_accessor :manifest
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @labels = args[:labels] if args.key?(:labels)
          @manifest = args[:manifest] if args.key?(:manifest)
        end
      end
      
      # 
      class DeploymentUpdateLabelEntry
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # 
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
      
      # 
      class DeploymentsCancelPreviewRequest
        include Google::Apis::Core::Hashable
      
        # Specifies a fingerprint for cancelPreview() requests. A fingerprint is a
        # randomly generated value that must be provided in cancelPreview() requests to
        # perform optimistic locking. This ensures optimistic concurrency so that the
        # deployment does not have conflicting requests (e.g. if someone attempts to
        # make a new update request while another user attempts to cancel a preview,
        # this would prevent one of the requests).
        # The fingerprint is initially generated by Deployment Manager and changes after
        # every request to modify a deployment. To get the latest fingerprint value,
        # perform a get() request on the deployment.
        # Corresponds to the JSON property `fingerprint`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :fingerprint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
        end
      end
      
      # A response containing a partial list of deployments and a page token used to
      # build the next request if the request has been truncated.
      class ListDeploymentsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. The deployments contained in this response.
        # Corresponds to the JSON property `deployments`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Deployment>]
        attr_accessor :deployments
      
        # Output only. A token used to continue a truncated list request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployments = args[:deployments] if args.key?(:deployments)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class DeploymentsStopRequest
        include Google::Apis::Core::Hashable
      
        # Specifies a fingerprint for stop() requests. A fingerprint is a randomly
        # generated value that must be provided in stop() requests to perform optimistic
        # locking. This ensures optimistic concurrency so that the deployment does not
        # have conflicting requests (e.g. if someone attempts to make a new update
        # request while another user attempts to stop an ongoing update request, this
        # would prevent a collision).
        # The fingerprint is initially generated by Deployment Manager and changes after
        # every request to modify a deployment. To get the latest fingerprint value,
        # perform a get() request on the deployment.
        # Corresponds to the JSON property `fingerprint`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :fingerprint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence" description: "Determines whether the request
      # has a user account" expression: "size(request.user) > 0"
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
      
      # 
      class GlobalSetPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Flatten Policy to create a backward compatible wire-format. Deprecated. Use '
        # policy' to specify bindings.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Binding>]
        attr_accessor :bindings
      
        # Flatten Policy to create a backward compatible wire-format. Deprecated. Use '
        # policy' to specify the etag.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Defines an Identity and Access Management (IAM) policy. It is used to specify
        # access control policies for Cloud Platform resources.
        # A `Policy` consists of a list of `bindings`. A `binding` binds a list of `
        # members` to a `role`, where the members can be user accounts, Google groups,
        # Google domains, and service accounts. A `role` is a named list of permissions
        # defined by IAM.
        # **JSON Example**
        # ` "bindings": [ ` "role": "roles/owner", "members": [ "user:mike@example.com",
        # "group:admins@example.com", "domain:google.com", "serviceAccount:my-other-app@
        # appspot.gserviceaccount.com" ] `, ` "role": "roles/viewer", "members": ["user:
        # sean@example.com"] ` ] `
        # **YAML Example**
        # bindings: - members: - user:mike@example.com - group:admins@example.com -
        # domain:google.com - serviceAccount:my-other-app@appspot.gserviceaccount.com
        # role: roles/owner - members: - user:sean@example.com role: roles/viewer
        # For a description of IAM and its features, see the [IAM developer's guide](
        # https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::DeploymentmanagerV2::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # 
      class ImportFile
        include Google::Apis::Core::Hashable
      
        # The contents of the file.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The name of the file.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Specifies what kind of log the caller must write
      class LogConfig
        include Google::Apis::Core::Hashable
      
        # Write a Cloud Audit log
        # Corresponds to the JSON property `cloudAudit`
        # @return [Google::Apis::DeploymentmanagerV2::LogConfigCloudAuditOptions]
        attr_accessor :cloud_audit
      
        # Increment a streamz counter with the specified metric and field names.
        # Metric names should start with a '/', generally be lowercase-only, and end in "
        # _count". Field names should not contain an initial slash. The actual exported
        # metric names will have "/iam/policy" prepended.
        # Field names correspond to IAM request parameters and field values are their
        # respective values.
        # Supported field names: - "authority", which is "[token]" if IAMContext.token
        # is present, otherwise the value of IAMContext.authority_selector if present,
        # and otherwise a representation of IAMContext.principal; or - "iam_principal",
        # a representation of IAMContext.principal even if a token or authority selector
        # is present; or - "" (empty string), resulting in a counter with no fields.
        # Examples: counter ` metric: "/debug_access_count" field: "iam_principal" ` ==>
        # increment counter /iam/policy/backend_debug_access_count `iam_principal=[value
        # of IAMContext.principal]`
        # At this time we do not support multiple field names (though this may be
        # supported in the future).
        # Corresponds to the JSON property `counter`
        # @return [Google::Apis::DeploymentmanagerV2::LogConfigCounterOptions]
        attr_accessor :counter
      
        # Write a Data Access (Gin) log
        # Corresponds to the JSON property `dataAccess`
        # @return [Google::Apis::DeploymentmanagerV2::LogConfigDataAccessOptions]
        attr_accessor :data_access
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_audit = args[:cloud_audit] if args.key?(:cloud_audit)
          @counter = args[:counter] if args.key?(:counter)
          @data_access = args[:data_access] if args.key?(:data_access)
        end
      end
      
      # Write a Cloud Audit log
      class LogConfigCloudAuditOptions
        include Google::Apis::Core::Hashable
      
        # Authorization-related information used by Cloud Audit Logging.
        # Corresponds to the JSON property `authorizationLoggingOptions`
        # @return [Google::Apis::DeploymentmanagerV2::AuthorizationLoggingOptions]
        attr_accessor :authorization_logging_options
      
        # The log_name to populate in the Cloud Audit Record.
        # Corresponds to the JSON property `logName`
        # @return [String]
        attr_accessor :log_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authorization_logging_options = args[:authorization_logging_options] if args.key?(:authorization_logging_options)
          @log_name = args[:log_name] if args.key?(:log_name)
        end
      end
      
      # Increment a streamz counter with the specified metric and field names.
      # Metric names should start with a '/', generally be lowercase-only, and end in "
      # _count". Field names should not contain an initial slash. The actual exported
      # metric names will have "/iam/policy" prepended.
      # Field names correspond to IAM request parameters and field values are their
      # respective values.
      # Supported field names: - "authority", which is "[token]" if IAMContext.token
      # is present, otherwise the value of IAMContext.authority_selector if present,
      # and otherwise a representation of IAMContext.principal; or - "iam_principal",
      # a representation of IAMContext.principal even if a token or authority selector
      # is present; or - "" (empty string), resulting in a counter with no fields.
      # Examples: counter ` metric: "/debug_access_count" field: "iam_principal" ` ==>
      # increment counter /iam/policy/backend_debug_access_count `iam_principal=[value
      # of IAMContext.principal]`
      # At this time we do not support multiple field names (though this may be
      # supported in the future).
      class LogConfigCounterOptions
        include Google::Apis::Core::Hashable
      
        # The field value to attribute.
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        # The metric to update.
        # Corresponds to the JSON property `metric`
        # @return [String]
        attr_accessor :metric
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field = args[:field] if args.key?(:field)
          @metric = args[:metric] if args.key?(:metric)
        end
      end
      
      # Write a Data Access (Gin) log
      class LogConfigDataAccessOptions
        include Google::Apis::Core::Hashable
      
        # Whether Gin logging should happen in a fail-closed manner at the caller. This
        # is relevant only in the LocalIAM implementation, for now.
        # NOTE: Logging to Gin in a fail-closed manner is currently unsupported while
        # work is being done to satisfy the requirements of go/345. Currently, setting
        # LOG_FAIL_CLOSED mode will have no effect, but still exists because there is
        # active work being done to support it (b/115874152).
        # Corresponds to the JSON property `logMode`
        # @return [String]
        attr_accessor :log_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @log_mode = args[:log_mode] if args.key?(:log_mode)
        end
      end
      
      # 
      class Manifest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DeploymentmanagerV2::ConfigFile]
        attr_accessor :config
      
        # Output only. The fully-expanded configuration file, including any templates
        # and references.
        # Corresponds to the JSON property `expandedConfig`
        # @return [String]
        attr_accessor :expanded_config
      
        # 
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Output only. The imported files for this manifest.
        # Corresponds to the JSON property `imports`
        # @return [Array<Google::Apis::DeploymentmanagerV2::ImportFile>]
        attr_accessor :imports
      
        # Output only. Creation timestamp in RFC3339 text format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # Output only. The YAML layout for this manifest.
        # Corresponds to the JSON property `layout`
        # @return [String]
        attr_accessor :layout
      
        # Output only.
        # The name of the manifest.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Self link for the manifest.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @expanded_config = args[:expanded_config] if args.key?(:expanded_config)
          @id = args[:id] if args.key?(:id)
          @imports = args[:imports] if args.key?(:imports)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @layout = args[:layout] if args.key?(:layout)
          @name = args[:name] if args.key?(:name)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # A response containing a partial list of manifests and a page token used to
      # build the next request if the request has been truncated.
      class ListManifestsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. Manifests contained in this list response.
        # Corresponds to the JSON property `manifests`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Manifest>]
        attr_accessor :manifests
      
        # Output only. A token used to continue a truncated list request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @manifests = args[:manifests] if args.key?(:manifests)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # An Operation resource, used to manage asynchronous API requests. (==
      # resource_for v1.globalOperations ==) (== resource_for beta.globalOperations ==)
      # (== resource_for v1.regionOperations ==) (== resource_for beta.
      # regionOperations ==) (== resource_for v1.zoneOperations ==) (== resource_for
      # beta.zoneOperations ==)
      class Operation
        include Google::Apis::Core::Hashable
      
        # [Output Only] The value of `requestId` if you provided it in the request. Not
        # present otherwise.
        # Corresponds to the JSON property `clientOperationId`
        # @return [String]
        attr_accessor :client_operation_id
      
        # [Deprecated] This field is deprecated.
        # Corresponds to the JSON property `creationTimestamp`
        # @return [String]
        attr_accessor :creation_timestamp
      
        # [Output Only] A textual description of the operation, which is set when the
        # operation is created.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # [Output Only] The time that this operation was completed. This value is in
        # RFC3339 text format.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # [Output Only] If errors are generated during processing of the operation, this
        # field will be populated.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DeploymentmanagerV2::Operation::Error]
        attr_accessor :error
      
        # [Output Only] If the operation fails, this field contains the HTTP error
        # message that was returned, such as NOT FOUND.
        # Corresponds to the JSON property `httpErrorMessage`
        # @return [String]
        attr_accessor :http_error_message
      
        # [Output Only] If the operation fails, this field contains the HTTP error
        # status code that was returned. For example, a 404 means the resource was not
        # found.
        # Corresponds to the JSON property `httpErrorStatusCode`
        # @return [Fixnum]
        attr_accessor :http_error_status_code
      
        # [Output Only] The unique identifier for the resource. This identifier is
        # defined by the server.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # [Output Only] The time that this operation was requested. This value is in
        # RFC3339 text format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # [Output Only] Type of the resource. Always compute#operation for Operation
        # resources.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # [Output Only] Name of the resource.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Output Only] The type of operation, such as insert, update, or delete, and so
        # on.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # [Output Only] An optional progress indicator that ranges from 0 to 100. There
        # is no requirement that this be linear or support any granularity of operations.
        # This should not be used to guess when the operation will be complete. This
        # number should monotonically increase as the operation progresses.
        # Corresponds to the JSON property `progress`
        # @return [Fixnum]
        attr_accessor :progress
      
        # [Output Only] The URL of the region where the operation resides. Only
        # available when performing regional operations. You must specify this field as
        # part of the HTTP request URL. It is not settable as a field in the request
        # body.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # [Output Only] Server-defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output Only] The time that this operation was started by the server. This
        # value is in RFC3339 text format.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # [Output Only] The status of the operation, which can be one of the following:
        # PENDING, RUNNING, or DONE.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # [Output Only] An optional textual description of the current status of the
        # operation.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # [Output Only] The unique target ID, which identifies a specific incarnation of
        # the target resource.
        # Corresponds to the JSON property `targetId`
        # @return [Fixnum]
        attr_accessor :target_id
      
        # [Output Only] The URL of the resource that the operation modifies. For
        # operations related to creating a snapshot, this points to the persistent disk
        # that the snapshot was created from.
        # Corresponds to the JSON property `targetLink`
        # @return [String]
        attr_accessor :target_link
      
        # [Output Only] User who requested the operation, for example: user@example.com.
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        # [Output Only] If warning messages are generated during processing of the
        # operation, this field will be populated.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Operation::Warning>]
        attr_accessor :warnings
      
        # [Output Only] The URL of the zone where the operation resides. Only available
        # when performing per-zone operations. You must specify this field as part of
        # the HTTP request URL. It is not settable as a field in the request body.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_operation_id = args[:client_operation_id] if args.key?(:client_operation_id)
          @creation_timestamp = args[:creation_timestamp] if args.key?(:creation_timestamp)
          @description = args[:description] if args.key?(:description)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error = args[:error] if args.key?(:error)
          @http_error_message = args[:http_error_message] if args.key?(:http_error_message)
          @http_error_status_code = args[:http_error_status_code] if args.key?(:http_error_status_code)
          @id = args[:id] if args.key?(:id)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @progress = args[:progress] if args.key?(:progress)
          @region = args[:region] if args.key?(:region)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @status_message = args[:status_message] if args.key?(:status_message)
          @target_id = args[:target_id] if args.key?(:target_id)
          @target_link = args[:target_link] if args.key?(:target_link)
          @user = args[:user] if args.key?(:user)
          @warnings = args[:warnings] if args.key?(:warnings)
          @zone = args[:zone] if args.key?(:zone)
        end
        
        # [Output Only] If errors are generated during processing of the operation, this
        # field will be populated.
        class Error
          include Google::Apis::Core::Hashable
        
          # [Output Only] The array of errors encountered while processing this operation.
          # Corresponds to the JSON property `errors`
          # @return [Array<Google::Apis::DeploymentmanagerV2::Operation::Error::Error>]
          attr_accessor :errors
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @errors = args[:errors] if args.key?(:errors)
          end
          
          # 
          class Error
            include Google::Apis::Core::Hashable
          
            # [Output Only] The error type identifier for this error.
            # Corresponds to the JSON property `code`
            # @return [String]
            attr_accessor :code
          
            # [Output Only] Indicates the field in the request that caused the error. This
            # property is optional.
            # Corresponds to the JSON property `location`
            # @return [String]
            attr_accessor :location
          
            # [Output Only] An optional, human-readable error message.
            # Corresponds to the JSON property `message`
            # @return [String]
            attr_accessor :message
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @code = args[:code] if args.key?(:code)
              @location = args[:location] if args.key?(:location)
              @message = args[:message] if args.key?(:message)
            end
          end
        end
        
        # 
        class Warning
          include Google::Apis::Core::Hashable
        
          # [Output Only] A warning code, if applicable. For example, Compute Engine
          # returns NO_RESULTS_ON_PAGE if there are no results in the response.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # [Output Only] Metadata about this warning in key: value format. For example:
          # "data": [ ` "key": "scope", "value": "zones/us-east1-d" `
          # Corresponds to the JSON property `data`
          # @return [Array<Google::Apis::DeploymentmanagerV2::Operation::Warning::Datum>]
          attr_accessor :data
        
          # [Output Only] A human-readable description of the warning code.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @data = args[:data] if args.key?(:data)
            @message = args[:message] if args.key?(:message)
          end
          
          # 
          class Datum
            include Google::Apis::Core::Hashable
          
            # [Output Only] A key that provides more detail on the warning being returned.
            # For example, for warnings where there are no results in a list request for a
            # particular zone, this key might be scope and the key value might be the zone
            # name. Other examples might be a key indicating a deprecated resource and a
            # suggested replacement, or a warning about invalid network settings (for
            # example, if an instance attempts to perform IP forwarding but is not enabled
            # for IP forwarding).
            # Corresponds to the JSON property `key`
            # @return [String]
            attr_accessor :key
          
            # [Output Only] A warning data value corresponding to the key.
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
        end
      end
      
      # A response containing a partial list of operations and a page token used to
      # build the next request if the request has been truncated.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. A token used to continue a truncated list request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Output only. Operations contained in this list response.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Operation>]
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
      
      # Defines an Identity and Access Management (IAM) policy. It is used to specify
      # access control policies for Cloud Platform resources.
      # A `Policy` consists of a list of `bindings`. A `binding` binds a list of `
      # members` to a `role`, where the members can be user accounts, Google groups,
      # Google domains, and service accounts. A `role` is a named list of permissions
      # defined by IAM.
      # **JSON Example**
      # ` "bindings": [ ` "role": "roles/owner", "members": [ "user:mike@example.com",
      # "group:admins@example.com", "domain:google.com", "serviceAccount:my-other-app@
      # appspot.gserviceaccount.com" ] `, ` "role": "roles/viewer", "members": ["user:
      # sean@example.com"] ` ] `
      # **YAML Example**
      # bindings: - members: - user:mike@example.com - group:admins@example.com -
      # domain:google.com - serviceAccount:my-other-app@appspot.gserviceaccount.com
      # role: roles/owner - members: - user:sean@example.com role: roles/viewer
      # For a description of IAM and its features, see the [IAM developer's guide](
      # https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::DeploymentmanagerV2::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. `bindings` with no members will
        # result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help prevent
        # simultaneous updates of a policy from overwriting each other. It is strongly
        # suggested that systems make use of the `etag` in the read-modify-write cycle
        # to perform policy updates in order to avoid race conditions: An `etag` is
        # returned in the response to `getIamPolicy`, and systems are expected to put
        # that etag in the request to `setIamPolicy` to ensure that their change will be
        # applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten blindly.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # 
        # Corresponds to the JSON property `iamOwned`
        # @return [Boolean]
        attr_accessor :iam_owned
        alias_method :iam_owned?, :iam_owned
      
        # If more than one rule is specified, the rules are applied in the following
        # manner: - All matching LOG rules are always applied. - If any DENY/
        # DENY_WITH_LOG rule matches, permission is denied. Logging will be applied if
        # one or more matching rule requires logging. - Otherwise, if any ALLOW/
        # ALLOW_WITH_LOG rule matches, permission is granted. Logging will be applied if
        # one or more matching rule requires logging. - Otherwise, if no rule applies,
        # permission is denied.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Rule>]
        attr_accessor :rules
      
        # Deprecated.
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
          @iam_owned = args[:iam_owned] if args.key?(:iam_owned)
          @rules = args[:rules] if args.key?(:rules)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # 
      class Resource
        include Google::Apis::Core::Hashable
      
        # The access controls set on the resource.
        # Corresponds to the JSON property `accessControl`
        # @return [Google::Apis::DeploymentmanagerV2::ResourceAccessControl]
        attr_accessor :access_control
      
        # Output only. The evaluated properties of the resource with references expanded.
        # Returned as serialized YAML.
        # Corresponds to the JSON property `finalProperties`
        # @return [String]
        attr_accessor :final_properties
      
        # 
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Output only. Creation timestamp in RFC3339 text format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # Output only. URL of the manifest representing the current configuration of
        # this resource.
        # Corresponds to the JSON property `manifest`
        # @return [String]
        attr_accessor :manifest
      
        # Output only. The name of the resource as it appears in the YAML config.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The current properties of the resource before any references have
        # been filled in. Returned as serialized YAML.
        # Corresponds to the JSON property `properties`
        # @return [String]
        attr_accessor :properties
      
        # Output only. The type of the resource, for example compute.v1.instance, or
        # cloudfunctions.v1beta1.function.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # 
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::DeploymentmanagerV2::ResourceUpdate]
        attr_accessor :update
      
        # Output only. Update timestamp in RFC3339 text format.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Output only. The URL of the actual resource.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # Output only. If warning messages are generated during processing of this
        # resource, this field will be populated.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Resource::Warning>]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_control = args[:access_control] if args.key?(:access_control)
          @final_properties = args[:final_properties] if args.key?(:final_properties)
          @id = args[:id] if args.key?(:id)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @manifest = args[:manifest] if args.key?(:manifest)
          @name = args[:name] if args.key?(:name)
          @properties = args[:properties] if args.key?(:properties)
          @type = args[:type] if args.key?(:type)
          @update = args[:update] if args.key?(:update)
          @update_time = args[:update_time] if args.key?(:update_time)
          @url = args[:url] if args.key?(:url)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
        
        # 
        class Warning
          include Google::Apis::Core::Hashable
        
          # [Output Only] A warning code, if applicable. For example, Compute Engine
          # returns NO_RESULTS_ON_PAGE if there are no results in the response.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # [Output Only] Metadata about this warning in key: value format. For example:
          # "data": [ ` "key": "scope", "value": "zones/us-east1-d" `
          # Corresponds to the JSON property `data`
          # @return [Array<Google::Apis::DeploymentmanagerV2::Resource::Warning::Datum>]
          attr_accessor :data
        
          # [Output Only] A human-readable description of the warning code.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @data = args[:data] if args.key?(:data)
            @message = args[:message] if args.key?(:message)
          end
          
          # 
          class Datum
            include Google::Apis::Core::Hashable
          
            # [Output Only] A key that provides more detail on the warning being returned.
            # For example, for warnings where there are no results in a list request for a
            # particular zone, this key might be scope and the key value might be the zone
            # name. Other examples might be a key indicating a deprecated resource and a
            # suggested replacement, or a warning about invalid network settings (for
            # example, if an instance attempts to perform IP forwarding but is not enabled
            # for IP forwarding).
            # Corresponds to the JSON property `key`
            # @return [String]
            attr_accessor :key
          
            # [Output Only] A warning data value corresponding to the key.
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
        end
      end
      
      # The access controls set on the resource.
      class ResourceAccessControl
        include Google::Apis::Core::Hashable
      
        # The GCP IAM Policy to set on the resource.
        # Corresponds to the JSON property `gcpIamPolicy`
        # @return [String]
        attr_accessor :gcp_iam_policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcp_iam_policy = args[:gcp_iam_policy] if args.key?(:gcp_iam_policy)
        end
      end
      
      # 
      class ResourceUpdate
        include Google::Apis::Core::Hashable
      
        # The access controls set on the resource.
        # Corresponds to the JSON property `accessControl`
        # @return [Google::Apis::DeploymentmanagerV2::ResourceAccessControl]
        attr_accessor :access_control
      
        # Output only. If errors are generated during update of the resource, this field
        # will be populated.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error]
        attr_accessor :error
      
        # Output only. The expanded properties of the resource with reference values
        # expanded. Returned as serialized YAML.
        # Corresponds to the JSON property `finalProperties`
        # @return [String]
        attr_accessor :final_properties
      
        # Output only. The intent of the resource: PREVIEW, UPDATE, or CANCEL.
        # Corresponds to the JSON property `intent`
        # @return [String]
        attr_accessor :intent
      
        # Output only. URL of the manifest representing the update configuration of this
        # resource.
        # Corresponds to the JSON property `manifest`
        # @return [String]
        attr_accessor :manifest
      
        # Output only. The set of updated properties for this resource, before
        # references are expanded. Returned as serialized YAML.
        # Corresponds to the JSON property `properties`
        # @return [String]
        attr_accessor :properties
      
        # Output only. The state of the resource.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. If warning messages are generated during processing of this
        # resource, this field will be populated.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning>]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_control = args[:access_control] if args.key?(:access_control)
          @error = args[:error] if args.key?(:error)
          @final_properties = args[:final_properties] if args.key?(:final_properties)
          @intent = args[:intent] if args.key?(:intent)
          @manifest = args[:manifest] if args.key?(:manifest)
          @properties = args[:properties] if args.key?(:properties)
          @state = args[:state] if args.key?(:state)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
        
        # Output only. If errors are generated during update of the resource, this field
        # will be populated.
        class Error
          include Google::Apis::Core::Hashable
        
          # [Output Only] The array of errors encountered while processing this operation.
          # Corresponds to the JSON property `errors`
          # @return [Array<Google::Apis::DeploymentmanagerV2::ResourceUpdate::Error::Error>]
          attr_accessor :errors
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @errors = args[:errors] if args.key?(:errors)
          end
          
          # 
          class Error
            include Google::Apis::Core::Hashable
          
            # [Output Only] The error type identifier for this error.
            # Corresponds to the JSON property `code`
            # @return [String]
            attr_accessor :code
          
            # [Output Only] Indicates the field in the request that caused the error. This
            # property is optional.
            # Corresponds to the JSON property `location`
            # @return [String]
            attr_accessor :location
          
            # [Output Only] An optional, human-readable error message.
            # Corresponds to the JSON property `message`
            # @return [String]
            attr_accessor :message
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @code = args[:code] if args.key?(:code)
              @location = args[:location] if args.key?(:location)
              @message = args[:message] if args.key?(:message)
            end
          end
        end
        
        # 
        class Warning
          include Google::Apis::Core::Hashable
        
          # [Output Only] A warning code, if applicable. For example, Compute Engine
          # returns NO_RESULTS_ON_PAGE if there are no results in the response.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # [Output Only] Metadata about this warning in key: value format. For example:
          # "data": [ ` "key": "scope", "value": "zones/us-east1-d" `
          # Corresponds to the JSON property `data`
          # @return [Array<Google::Apis::DeploymentmanagerV2::ResourceUpdate::Warning::Datum>]
          attr_accessor :data
        
          # [Output Only] A human-readable description of the warning code.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @data = args[:data] if args.key?(:data)
            @message = args[:message] if args.key?(:message)
          end
          
          # 
          class Datum
            include Google::Apis::Core::Hashable
          
            # [Output Only] A key that provides more detail on the warning being returned.
            # For example, for warnings where there are no results in a list request for a
            # particular zone, this key might be scope and the key value might be the zone
            # name. Other examples might be a key indicating a deprecated resource and a
            # suggested replacement, or a warning about invalid network settings (for
            # example, if an instance attempts to perform IP forwarding but is not enabled
            # for IP forwarding).
            # Corresponds to the JSON property `key`
            # @return [String]
            attr_accessor :key
          
            # [Output Only] A warning data value corresponding to the key.
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
        end
      end
      
      # A response containing a partial list of resources and a page token used to
      # build the next request if the request has been truncated.
      class ListResourcesResponse
        include Google::Apis::Core::Hashable
      
        # A token used to continue a truncated list request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Resources contained in this list response.
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Resource>]
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
      
      # A rule to be applied in a Policy.
      class Rule
        include Google::Apis::Core::Hashable
      
        # Required
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Additional restrictions that must be met. All conditions must pass for the
        # rule to match.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Condition>]
        attr_accessor :conditions
      
        # Human-readable description of the rule.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If one or more 'in' clauses are specified, the rule matches if the PRINCIPAL/
        # AUTHORITY_SELECTOR is in at least one of these entries.
        # Corresponds to the JSON property `ins`
        # @return [Array<String>]
        attr_accessor :ins
      
        # The config returned to callers of tech.iam.IAM.CheckPolicy for any entries
        # that match the LOG action.
        # Corresponds to the JSON property `logConfigs`
        # @return [Array<Google::Apis::DeploymentmanagerV2::LogConfig>]
        attr_accessor :log_configs
      
        # If one or more 'not_in' clauses are specified, the rule matches if the
        # PRINCIPAL/AUTHORITY_SELECTOR is in none of the entries.
        # Corresponds to the JSON property `notIns`
        # @return [Array<String>]
        attr_accessor :not_ins
      
        # A permission is a string of form '..' (e.g., 'storage.buckets.list'). A value
        # of '*' matches all permissions, and a verb part of '*' (e.g., 'storage.buckets.
        # *') matches all verbs.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @conditions = args[:conditions] if args.key?(:conditions)
          @description = args[:description] if args.key?(:description)
          @ins = args[:ins] if args.key?(:ins)
          @log_configs = args[:log_configs] if args.key?(:log_configs)
          @not_ins = args[:not_ins] if args.key?(:not_ins)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # 
      class TargetConfiguration
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DeploymentmanagerV2::ConfigFile]
        attr_accessor :config
      
        # Specifies any files to import for this configuration. This can be used to
        # import templates or other files. For example, you might import a text file in
        # order to use the file in a template.
        # Corresponds to the JSON property `imports`
        # @return [Array<Google::Apis::DeploymentmanagerV2::ImportFile>]
        attr_accessor :imports
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @imports = args[:imports] if args.key?(:imports)
        end
      end
      
      # 
      class TestPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the 'resource'. Permissions with wildcards
        # (such as '*' or 'storage.*') are not allowed.
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
      
      # 
      class TestPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is allowed.
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
      
      # A resource type supported by Deployment Manager.
      class Type
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Output only. Creation timestamp in RFC3339 text format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # Name of the type.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An Operation resource, used to manage asynchronous API requests. (==
        # resource_for v1.globalOperations ==) (== resource_for beta.globalOperations ==)
        # (== resource_for v1.regionOperations ==) (== resource_for beta.
        # regionOperations ==) (== resource_for v1.zoneOperations ==) (== resource_for
        # beta.zoneOperations ==)
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::DeploymentmanagerV2::Operation]
        attr_accessor :operation
      
        # Output only. Server defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @name = args[:name] if args.key?(:name)
          @operation = args[:operation] if args.key?(:operation)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # A response that returns all Types supported by Deployment Manager
      class ListTypesResponse
        include Google::Apis::Core::Hashable
      
        # A token used to continue a truncated list request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Output only. A list of resource types supported by Deployment Manager.
        # Corresponds to the JSON property `types`
        # @return [Array<Google::Apis::DeploymentmanagerV2::Type>]
        attr_accessor :types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @types = args[:types] if args.key?(:types)
        end
      end
    end
  end
end
