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
    module CloudresourcemanagerV1
      
      # Identifying information for a single ancestor of a project.
      class Ancestor
        include Google::Apis::Core::Hashable
      
        # A container to reference an id for any resource type. A `resource` in Google
        # Cloud Platform is a generic term for something you (a developer) may want to
        # interact with through one of our API's. Some examples are an App Engine app,
        # a Compute Engine instance, a Cloud SQL database, and so on.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::CloudresourcemanagerV1::ResourceId]
        attr_accessor :resource_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
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
        # @return [Array<Google::Apis::CloudresourcemanagerV1::AuditLogConfig>]
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
        # @return [Google::Apis::CloudresourcemanagerV1::Expr]
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
      
      # A `Constraint` that is either enforced or not.
      # For example a constraint `constraints/compute.disableSerialPortAccess`.
      # If it is enforced on a VM instance, serial port connections will not be
      # opened to that instance.
      class BooleanConstraint
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Used in `policy_type` to specify how `boolean_policy` will behave at this
      # resource.
      class BooleanPolicy
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
      
      # The request sent to the ClearOrgPolicy method.
      class ClearOrgPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Name of the `Constraint` of the `Policy` to clear.
        # Corresponds to the JSON property `constraint`
        # @return [String]
        attr_accessor :constraint
      
        # The current version, for concurrency control. Not sending an `etag`
        # will cause the `Policy` to be cleared blindly.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @constraint = args[:constraint] if args.key?(:constraint)
          @etag = args[:etag] if args.key?(:etag)
        end
      end
      
      # A `Constraint` describes a way in which a resource's configuration can be
      # restricted. For example, it controls which cloud services can be activated
      # across an organization, or whether a Compute Engine instance can have
      # serial port connections established. `Constraints` can be configured by the
      # organization's policy adminstrator to fit the needs of the organzation by
      # setting Policies for `Constraints` at different locations in the
      # organization's resource hierarchy. Policies are inherited down the resource
      # hierarchy from higher levels, but can also be overridden. For details about
      # the inheritance rules please read about
      # Policies.
      # `Constraints` have a default behavior determined by the `constraint_default`
      # field, which is the enforcement behavior that is used in the absence of a
      # `Policy` being defined or inherited for the resource in question.
      class Constraint
        include Google::Apis::Core::Hashable
      
        # A `Constraint` that is either enforced or not.
        # For example a constraint `constraints/compute.disableSerialPortAccess`.
        # If it is enforced on a VM instance, serial port connections will not be
        # opened to that instance.
        # Corresponds to the JSON property `booleanConstraint`
        # @return [Google::Apis::CloudresourcemanagerV1::BooleanConstraint]
        attr_accessor :boolean_constraint
      
        # The evaluation behavior of this constraint in the absense of 'Policy'.
        # Corresponds to the JSON property `constraintDefault`
        # @return [String]
        attr_accessor :constraint_default
      
        # Detailed description of what this `Constraint` controls as well as how and
        # where it is enforced.
        # Mutable.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The human readable name.
        # Mutable.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A `Constraint` that allows or disallows a list of string values, which are
        # configured by an Organization's policy administrator with a `Policy`.
        # Corresponds to the JSON property `listConstraint`
        # @return [Google::Apis::CloudresourcemanagerV1::ListConstraint]
        attr_accessor :list_constraint
      
        # Immutable value, required to globally be unique. For example,
        # `constraints/serviceuser.services`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Version of the `Constraint`. Default version is 0;
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_constraint = args[:boolean_constraint] if args.key?(:boolean_constraint)
          @constraint_default = args[:constraint_default] if args.key?(:constraint_default)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @list_constraint = args[:list_constraint] if args.key?(:list_constraint)
          @name = args[:name] if args.key?(:name)
          @version = args[:version] if args.key?(:version)
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
      
      # Metadata describing a long running folder operation
      class FolderOperation
        include Google::Apis::Core::Hashable
      
        # The resource name of the folder or organization we are either creating
        # the folder under or moving the folder to.
        # Corresponds to the JSON property `destinationParent`
        # @return [String]
        attr_accessor :destination_parent
      
        # The display name of the folder.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The type of this operation.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The resource name of the folder's parent.
        # Only applicable when the operation_type is MOVE.
        # Corresponds to the JSON property `sourceParent`
        # @return [String]
        attr_accessor :source_parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination_parent = args[:destination_parent] if args.key?(:destination_parent)
          @display_name = args[:display_name] if args.key?(:display_name)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @source_parent = args[:source_parent] if args.key?(:source_parent)
        end
      end
      
      # A classification of the Folder Operation error.
      class FolderOperationError
        include Google::Apis::Core::Hashable
      
        # The type of operation error experienced.
        # Corresponds to the JSON property `errorMessageId`
        # @return [String]
        attr_accessor :error_message_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message_id = args[:error_message_id] if args.key?(:error_message_id)
        end
      end
      
      # The request sent to the
      # GetAncestry
      # method.
      class GetAncestryRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response from the GetAncestry method.
      class GetAncestryResponse
        include Google::Apis::Core::Hashable
      
        # Ancestors are ordered from bottom to top of the resource hierarchy. The
        # first ancestor is the project itself, followed by the project's parent,
        # etc..
        # Corresponds to the JSON property `ancestor`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Ancestor>]
        attr_accessor :ancestor
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ancestor = args[:ancestor] if args.key?(:ancestor)
        end
      end
      
      # The request sent to the GetEffectiveOrgPolicy method.
      class GetEffectiveOrgPolicyRequest
        include Google::Apis::Core::Hashable
      
        # The name of the `Constraint` to compute the effective `Policy`.
        # Corresponds to the JSON property `constraint`
        # @return [String]
        attr_accessor :constraint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @constraint = args[:constraint] if args.key?(:constraint)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::CloudresourcemanagerV1::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # The request sent to the GetOrgPolicy method.
      class GetOrgPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Name of the `Constraint` to get the `Policy`.
        # Corresponds to the JSON property `constraint`
        # @return [String]
        attr_accessor :constraint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @constraint = args[:constraint] if args.key?(:constraint)
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
      
      # A Lien represents an encumbrance on the actions that can be performed on a
      # resource.
      class Lien
        include Google::Apis::Core::Hashable
      
        # The creation time of this Lien.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # A system-generated unique identifier for this Lien.
        # Example: `liens/1234abcd`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A stable, user-visible/meaningful string identifying the origin of the
        # Lien, intended to be inspected programmatically. Maximum length of 200
        # characters.
        # Example: 'compute.googleapis.com'
        # Corresponds to the JSON property `origin`
        # @return [String]
        attr_accessor :origin
      
        # A reference to the resource this Lien is attached to. The server will
        # validate the parent against those for which Liens are supported.
        # Example: `projects/1234`
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Concise user-visible strings indicating why an action cannot be performed
        # on a resource. Maximum length of 200 characters.
        # Example: 'Holds production API key'
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # The types of operations which should be blocked as a result of this Lien.
        # Each value should correspond to an IAM permission. The server will
        # validate the permissions against those for which Liens are supported.
        # An empty list is meaningless and will be rejected.
        # Example: ['resourcemanager.projects.delete']
        # Corresponds to the JSON property `restrictions`
        # @return [Array<String>]
        attr_accessor :restrictions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @origin = args[:origin] if args.key?(:origin)
          @parent = args[:parent] if args.key?(:parent)
          @reason = args[:reason] if args.key?(:reason)
          @restrictions = args[:restrictions] if args.key?(:restrictions)
        end
      end
      
      # The request sent to the [ListAvailableOrgPolicyConstraints]
      # google.cloud.OrgPolicy.v1.ListAvailableOrgPolicyConstraints] method.
      class ListAvailableOrgPolicyConstraintsRequest
        include Google::Apis::Core::Hashable
      
        # Size of the pages to be returned. This is currently unsupported and will
        # be ignored. The server may at any point start using this field to limit
        # page size.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Page token used to retrieve the next page. This is currently unsupported
        # and will be ignored. The server may at any point start using this field.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # The response returned from the ListAvailableOrgPolicyConstraints method.
      # Returns all `Constraints` that could be set at this level of the hierarchy
      # (contrast with the response from `ListPolicies`, which returns all policies
      # which are set).
      class ListAvailableOrgPolicyConstraintsResponse
        include Google::Apis::Core::Hashable
      
        # The collection of constraints that are settable on the request resource.
        # Corresponds to the JSON property `constraints`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Constraint>]
        attr_accessor :constraints
      
        # Page token used to retrieve the next page. This is currently not used.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @constraints = args[:constraints] if args.key?(:constraints)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A `Constraint` that allows or disallows a list of string values, which are
      # configured by an Organization's policy administrator with a `Policy`.
      class ListConstraint
        include Google::Apis::Core::Hashable
      
        # Optional. The Google Cloud Console will try to default to a configuration
        # that matches the value specified in this `Constraint`.
        # Corresponds to the JSON property `suggestedValue`
        # @return [String]
        attr_accessor :suggested_value
      
        # Indicates whether subtrees of Cloud Resource Manager resource hierarchy
        # can be used in `Policy.allowed_values` and `Policy.denied_values`. For
        # example, `"under:folders/123"` would match any resource under the
        # 'folders/123' folder.
        # Corresponds to the JSON property `supportsUnder`
        # @return [Boolean]
        attr_accessor :supports_under
        alias_method :supports_under?, :supports_under
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_value = args[:suggested_value] if args.key?(:suggested_value)
          @supports_under = args[:supports_under] if args.key?(:supports_under)
        end
      end
      
      # The response message for Liens.ListLiens.
      class ListLiensResponse
        include Google::Apis::Core::Hashable
      
        # A list of Liens.
        # Corresponds to the JSON property `liens`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Lien>]
        attr_accessor :liens
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @liens = args[:liens] if args.key?(:liens)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The request sent to the ListOrgPolicies method.
      class ListOrgPoliciesRequest
        include Google::Apis::Core::Hashable
      
        # Size of the pages to be returned. This is currently unsupported and will
        # be ignored. The server may at any point start using this field to limit
        # page size.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Page token used to retrieve the next page. This is currently unsupported
        # and will be ignored. The server may at any point start using this field.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # The response returned from the ListOrgPolicies method. It will be empty
      # if no `Policies` are set on the resource.
      class ListOrgPoliciesResponse
        include Google::Apis::Core::Hashable
      
        # Page token used to retrieve the next page. This is currently not used, but
        # the server may at any point start supplying a valid token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The `Policies` that are set on the resource. It will be empty if no
        # `Policies` are set.
        # Corresponds to the JSON property `policies`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::OrgPolicy>]
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
      class ListPolicy
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
      
      # A page of the response received from the
      # ListProjects
      # method.
      # A paginated response where more pages are available has
      # `next_page_token` set. This token can be used in a subsequent request to
      # retrieve the next request page.
      class ListProjectsResponse
        include Google::Apis::Core::Hashable
      
        # Pagination token.
        # If the result set is too large to fit in a single response, this token
        # is returned. It encodes the position of the current result cursor.
        # Feeding this value into a new list request with the `page_token` parameter
        # gives the next page of the results.
        # When `next_page_token` is not filled in, there is no next page and
        # the list returned is the last page in the result set.
        # Pagination tokens have a limited lifetime.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of Projects that matched the list filter. This list can
        # be paginated.
        # Corresponds to the JSON property `projects`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Project>]
        attr_accessor :projects
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @projects = args[:projects] if args.key?(:projects)
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
        # @return [Google::Apis::CloudresourcemanagerV1::Status]
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
      
      # Defines a Cloud Organization `Policy` which is used to specify `Constraints`
      # for configurations of Cloud Platform resources.
      class OrgPolicy
        include Google::Apis::Core::Hashable
      
        # Used in `policy_type` to specify how `boolean_policy` will behave at this
        # resource.
        # Corresponds to the JSON property `booleanPolicy`
        # @return [Google::Apis::CloudresourcemanagerV1::BooleanPolicy]
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
        # @return [Google::Apis::CloudresourcemanagerV1::ListPolicy]
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
        # @return [Google::Apis::CloudresourcemanagerV1::RestoreDefault]
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
      
      # The root node in the resource hierarchy to which a particular entity's
      # (e.g., company) resources belong.
      class Organization
        include Google::Apis::Core::Hashable
      
        # Timestamp when the Organization was created. Assigned by the server.
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # A human-readable string that refers to the Organization in the
        # GCP Console UI. This string is set by the server and cannot be
        # changed. The string will be set to the primary domain (for example,
        # "google.com") of the G Suite customer that owns the organization.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The organization's current lifecycle state. Assigned by the server.
        # Corresponds to the JSON property `lifecycleState`
        # @return [String]
        attr_accessor :lifecycle_state
      
        # Output only. The resource name of the organization. This is the
        # organization's relative path in the API. Its format is
        # "organizations/[organization_id]". For example, "organizations/1234".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The entity that owns an Organization. The lifetime of the Organization and
        # all of its descendants are bound to the `OrganizationOwner`. If the
        # `OrganizationOwner` is deleted, the Organization and all its descendants will
        # be deleted.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::CloudresourcemanagerV1::OrganizationOwner]
        attr_accessor :owner
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @display_name = args[:display_name] if args.key?(:display_name)
          @lifecycle_state = args[:lifecycle_state] if args.key?(:lifecycle_state)
          @name = args[:name] if args.key?(:name)
          @owner = args[:owner] if args.key?(:owner)
        end
      end
      
      # The entity that owns an Organization. The lifetime of the Organization and
      # all of its descendants are bound to the `OrganizationOwner`. If the
      # `OrganizationOwner` is deleted, the Organization and all its descendants will
      # be deleted.
      class OrganizationOwner
        include Google::Apis::Core::Hashable
      
        # The G Suite customer id used in the Directory API.
        # Corresponds to the JSON property `directoryCustomerId`
        # @return [String]
        attr_accessor :directory_customer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directory_customer_id = args[:directory_customer_id] if args.key?(:directory_customer_id)
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
        # @return [Array<Google::Apis::CloudresourcemanagerV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Binding>]
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
      
      # A Project is a high-level Google Cloud Platform entity.  It is a
      # container for ACLs, APIs, App Engine Apps, VMs, and other
      # Google Cloud Platform resources.
      class Project
        include Google::Apis::Core::Hashable
      
        # Creation time.
        # Read-only.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The labels associated with this Project.
        # Label keys must be between 1 and 63 characters long and must conform
        # to the following regular expression: \[a-z\](\[-a-z0-9\]*\[a-z0-9\])?.
        # Label values must be between 0 and 63 characters long and must conform
        # to the regular expression (\[a-z\](\[-a-z0-9\]*\[a-z0-9\])?)?. A label
        # value can be empty.
        # No more than 256 labels can be associated with a given resource.
        # Clients should store labels in a representation such as JSON that does not
        # depend on specific characters being disallowed.
        # Example: <code>"environment" : "dev"</code>
        # Read-write.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The Project lifecycle state.
        # Read-only.
        # Corresponds to the JSON property `lifecycleState`
        # @return [String]
        attr_accessor :lifecycle_state
      
        # The optional user-assigned display name of the Project.
        # When present it must be between 4 to 30 characters.
        # Allowed characters are: lowercase and uppercase letters, numbers,
        # hyphen, single-quote, double-quote, space, and exclamation point.
        # Example: <code>My Project</code>
        # Read-write.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A container to reference an id for any resource type. A `resource` in Google
        # Cloud Platform is a generic term for something you (a developer) may want to
        # interact with through one of our API's. Some examples are an App Engine app,
        # a Compute Engine instance, a Cloud SQL database, and so on.
        # Corresponds to the JSON property `parent`
        # @return [Google::Apis::CloudresourcemanagerV1::ResourceId]
        attr_accessor :parent
      
        # The unique, user-assigned ID of the Project.
        # It must be 6 to 30 lowercase letters, digits, or hyphens.
        # It must start with a letter.
        # Trailing hyphens are prohibited.
        # Example: <code>tokyo-rain-123</code>
        # Read-only after creation.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The number uniquely identifying the project.
        # Example: <code>415104041262</code>
        # Read-only.
        # Corresponds to the JSON property `projectNumber`
        # @return [Fixnum]
        attr_accessor :project_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @labels = args[:labels] if args.key?(:labels)
          @lifecycle_state = args[:lifecycle_state] if args.key?(:lifecycle_state)
          @name = args[:name] if args.key?(:name)
          @parent = args[:parent] if args.key?(:parent)
          @project_id = args[:project_id] if args.key?(:project_id)
          @project_number = args[:project_number] if args.key?(:project_number)
        end
      end
      
      # A status object which is used as the `metadata` field for the Operation
      # returned by CreateProject. It provides insight for when significant phases of
      # Project creation have completed.
      class ProjectCreationStatus
        include Google::Apis::Core::Hashable
      
        # Creation time of the project creation workflow.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # True if the project can be retrieved using GetProject. No other operations
        # on the project are guaranteed to work until the project creation is
        # complete.
        # Corresponds to the JSON property `gettable`
        # @return [Boolean]
        attr_accessor :gettable
        alias_method :gettable?, :gettable
      
        # True if the project creation process is complete.
        # Corresponds to the JSON property `ready`
        # @return [Boolean]
        attr_accessor :ready
        alias_method :ready?, :ready
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @gettable = args[:gettable] if args.key?(:gettable)
          @ready = args[:ready] if args.key?(:ready)
        end
      end
      
      # A container to reference an id for any resource type. A `resource` in Google
      # Cloud Platform is a generic term for something you (a developer) may want to
      # interact with through one of our API's. Some examples are an App Engine app,
      # a Compute Engine instance, a Cloud SQL database, and so on.
      class ResourceId
        include Google::Apis::Core::Hashable
      
        # Required field for the type-specific id. This should correspond to the id
        # used in the type-specific API's.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Required field representing the resource type this id is for.
        # At present, the valid types are: "organization", "folder", and "project".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @type = args[:type] if args.key?(:type)
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
      class RestoreDefault
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The request sent to the `SearchOrganizations` method.
      class SearchOrganizationsRequest
        include Google::Apis::Core::Hashable
      
        # An optional query string used to filter the Organizations to return in
        # the response. Filter rules are case-insensitive.
        # Organizations may be filtered by `owner.directoryCustomerId` or by
        # `domain`, where the domain is a G Suite domain, for example:
        # * Filter `owner.directorycustomerid:123456789` returns Organization
        # resources with `owner.directory_customer_id` equal to `123456789`.
        # * Filter `domain:google.com` returns Organization resources corresponding
        # to the domain `google.com`.
        # This field is optional.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The maximum number of Organizations to return in the response.
        # This field is optional.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A pagination token returned from a previous call to `SearchOrganizations`
        # that indicates from where listing should continue.
        # This field is optional.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # The response returned from the `SearchOrganizations` method.
      class SearchOrganizationsResponse
        include Google::Apis::Core::Hashable
      
        # A pagination token to be used to retrieve the next page of results. If the
        # result is too large to fit within the page size specified in the request,
        # this field will be set with a token that can be used to fetch the next page
        # of results. If this field is empty, it indicates that this response
        # contains the last page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of Organizations that matched the search query, possibly
        # paginated.
        # Corresponds to the JSON property `organizations`
        # @return [Array<Google::Apis::CloudresourcemanagerV1::Organization>]
        attr_accessor :organizations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @organizations = args[:organizations] if args.key?(:organizations)
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
        # @return [Google::Apis::CloudresourcemanagerV1::Policy]
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
      
      # The request sent to the SetOrgPolicyRequest method.
      class SetOrgPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines a Cloud Organization `Policy` which is used to specify `Constraints`
        # for configurations of Cloud Platform resources.
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::CloudresourcemanagerV1::OrgPolicy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
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
      
      # The request sent to the UndeleteProject
      # method.
      class UndeleteProjectRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
    end
  end
end
