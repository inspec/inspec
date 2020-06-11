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
    module CloudresourcemanagerV1beta1
      
      # Identifying information for a single ancestor of a project.
      class Ancestor
        include Google::Apis::Core::Hashable
      
        # A container to reference an id for any resource type. A `resource` in Google
        # Cloud Platform is a generic term for something you (a developer) may want to
        # interact with through one of our API's. Some examples are an App Engine app,
        # a Compute Engine instance, a Cloud SQL database, and so on.
        # Corresponds to the JSON property `resourceId`
        # @return [Google::Apis::CloudresourcemanagerV1beta1::ResourceId]
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
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::AuditLogConfig>]
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
        # @return [Google::Apis::CloudresourcemanagerV1beta1::Expr]
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
        # etc.
        # Corresponds to the JSON property `ancestor`
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::Ancestor>]
        attr_accessor :ancestor
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ancestor = args[:ancestor] if args.key?(:ancestor)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::CloudresourcemanagerV1beta1::GetPolicyOptions]
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
      
      # The response returned from the `ListOrganizations` method.
      class ListOrganizationsResponse
        include Google::Apis::Core::Hashable
      
        # A pagination token to be used to retrieve the next page of results. If the
        # result is too large to fit within the page size specified in the request,
        # this field will be set with a token that can be used to fetch the next page
        # of results. If this field is empty, it indicates that this response
        # contains the last page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of Organizations that matched the list query, possibly paginated.
        # Corresponds to the JSON property `organizations`
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::Organization>]
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
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::Project>]
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
      
        # An immutable id for the Organization that is assigned on creation. This
        # should be omitted when creating a new Organization.
        # This field is read-only.
        # Corresponds to the JSON property `organizationId`
        # @return [String]
        attr_accessor :organization_id
      
        # The entity that owns an Organization. The lifetime of the Organization and
        # all of its descendants are bound to the `OrganizationOwner`. If the
        # `OrganizationOwner` is deleted, the Organization and all its descendants will
        # be deleted.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::CloudresourcemanagerV1beta1::OrganizationOwner]
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
          @organization_id = args[:organization_id] if args.key?(:organization_id)
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
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudresourcemanagerV1beta1::Binding>]
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
        # @return [Google::Apis::CloudresourcemanagerV1beta1::ResourceId]
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
        # At present, the valid types are "project", "folder", and "organization".
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
        # @return [Google::Apis::CloudresourcemanagerV1beta1::Policy]
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
