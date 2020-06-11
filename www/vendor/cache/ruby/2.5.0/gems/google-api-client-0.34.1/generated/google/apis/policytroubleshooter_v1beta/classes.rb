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
    module PolicytroubleshooterV1beta
      
      # AccessTuple defines information required for checking an access attempt.
      # In other words, this is the tuple given to `CheckAccess`.
      class GoogleCloudPolicytroubleshooterV1betaAccessTuple
        include Google::Apis::Core::Hashable
      
        # Required. A full resource name according to
        # https://cloud.google.com/apis/design/resource_names. This is the full
        # resource name of the resource that access is checked against.
        # Corresponds to the JSON property `fullResourceName`
        # @return [String]
        attr_accessor :full_resource_name
      
        # Required. The Cloud IAM permission under which defines the kind of access
        # being explained. Example: "resourcemanager.projects.get" would explain
        # if and why the principal has the resourcemanager.projects.get permission
        # on the resource specified in full_resource_name declared in this structure.
        # See https://cloud.google.com/iam/docs/testing-permissions
        # Corresponds to the JSON property `permission`
        # @return [String]
        attr_accessor :permission
      
        # Required. The principal on behalf of who the access is explained for.
        # The format is one of the principal's email addresses associated with
        # its gaia account. It must be an account that can appear as an actor.
        # For example groups are not supported. Currently, service accounts, users
        # are supported.
        # Corresponds to the JSON property `principal`
        # @return [String]
        attr_accessor :principal
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
          @permission = args[:permission] if args.key?(:permission)
          @principal = args[:principal] if args.key?(:principal)
        end
      end
      
      # Binding Explanation.
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanation
        include Google::Apis::Core::Hashable
      
        # REQUIRED: Access decision for this binding.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr]
        attr_accessor :condition
      
        # For each member in the binding, provides information
        # whether or not the principal from the request is included
        # in the member by which the CheckResult is keyed.
        # May indicate that the caller has no access to this information.
        # example key: 'group:cloud-iam-assist-eng@google.com'
        # example value '`NOT_GRANTED, HIGH`
        # Corresponds to the JSON property `memberships`
        # @return [Hash<String,Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership>]
        attr_accessor :memberships
      
        # Bubbles up role_permission level relavance to BindingExplanation object.
        # If role permission is NORMAL, then binding relevance is NORMAL.
        # If role permission is HIGH, then binding relevance is HIGH.
        # Corresponds to the JSON property `relevance`
        # @return [String]
        attr_accessor :relevance
      
        # The role that this binding grants in the policy.
        # for example "roles/compute.serviceAgent"
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Whether the role of this binding contains the checked permission
        # Corresponds to the JSON property `rolePermission`
        # @return [String]
        attr_accessor :role_permission
      
        # The relevance of this permission with respect to the BindingExplanation.
        # Corresponds to the JSON property `rolePermissionRelevance`
        # @return [String]
        attr_accessor :role_permission_relevance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @condition = args[:condition] if args.key?(:condition)
          @memberships = args[:memberships] if args.key?(:memberships)
          @relevance = args[:relevance] if args.key?(:relevance)
          @role = args[:role] if args.key?(:role)
          @role_permission = args[:role_permission] if args.key?(:role_permission)
          @role_permission_relevance = args[:role_permission_relevance] if args.key?(:role_permission_relevance)
        end
      end
      
      # Encapsulated membership and the relevance of that membership with respect
      # to BindingExplanation.
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership
        include Google::Apis::Core::Hashable
      
        # Membership status.
        # Corresponds to the JSON property `membership`
        # @return [String]
        attr_accessor :membership
      
        # Relevance of this membership with respect to BindingExplanation.
        # Corresponds to the JSON property `relevance`
        # @return [String]
        attr_accessor :relevance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @membership = args[:membership] if args.key?(:membership)
          @relevance = args[:relevance] if args.key?(:relevance)
        end
      end
      
      # An explained IAM policy combines the raw policy in the context
      # of the resource which it is attached to along with detailed
      # evaluation on the evaluation parameters provided through the request.
      class GoogleCloudPolicytroubleshooterV1betaExplainedPolicy
        include Google::Apis::Core::Hashable
      
        # Access decision for this section of the resource's effective policy.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        # Detailed binding evaluation explanations provide information
        # about how each binding contributes to the principal's
        # access or the lack thereof.
        # Corresponds to the JSON property `bindingExplanations`
        # @return [Array<Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanation>]
        attr_accessor :binding_explanations
      
        # Resource that this section of the effective policy attaches to.
        # Corresponds to the JSON property `fullResourceName`
        # @return [String]
        attr_accessor :full_resource_name
      
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
        # @return [Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Policy]
        attr_accessor :policy
      
        # Relevance of this Policy.
        # Corresponds to the JSON property `relevance`
        # @return [String]
        attr_accessor :relevance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @binding_explanations = args[:binding_explanations] if args.key?(:binding_explanations)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
          @policy = args[:policy] if args.key?(:policy)
          @relevance = args[:relevance] if args.key?(:relevance)
        end
      end
      
      # TroubleshootIamPolicyRequest is used in TroubleshootIamPolicy
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # AccessTuple defines information required for checking an access attempt.
        # In other words, this is the tuple given to `CheckAccess`.
        # Corresponds to the JSON property `accessTuple`
        # @return [Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaAccessTuple]
        attr_accessor :access_tuple
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_tuple = args[:access_tuple] if args.key?(:access_tuple)
        end
      end
      
      # TroubleshootIamPolicyResponse is used in TroubleshootIamPolicy.
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse
        include Google::Apis::Core::Hashable
      
        # Reflects whether the probed access was granted, denied
        # or ultimately could not be decided from the caller's point of view.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        # List of explained policies.
        # Each explanation corresponds to one policy along the ancestry path.
        # Corresponds to the JSON property `explainedPolicies`
        # @return [Array<Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaExplainedPolicy>]
        attr_accessor :explained_policies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @explained_policies = args[:explained_policies] if args.key?(:explained_policies)
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
      class GoogleIamV1AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditLogConfig>]
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
      class GoogleIamV1AuditLogConfig
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
      class GoogleIamV1Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr]
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
      class GoogleIamV1Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Binding>]
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
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class GoogleTypeExpr
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
    end
  end
end
