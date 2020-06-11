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
    module IamV1
      
      # Audit log information specific to Cloud IAM admin APIs. This message is
      # serialized as an `Any` type in the `ServiceData` message of an
      # `AuditLog` message.
      class AdminAuditData
        include Google::Apis::Core::Hashable
      
        # A PermissionDelta message to record the added_permissions and
        # removed_permissions inside a role.
        # Corresponds to the JSON property `permissionDelta`
        # @return [Google::Apis::IamV1::PermissionDelta]
        attr_accessor :permission_delta
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission_delta = args[:permission_delta] if args.key?(:permission_delta)
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
        # @return [Array<Google::Apis::IamV1::AuditLogConfig>]
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
      
      # Audit log information specific to Cloud IAM. This message is serialized
      # as an `Any` type in the `ServiceData` message of an
      # `AuditLog` message.
      class AuditData
        include Google::Apis::Core::Hashable
      
        # The difference delta between two policies.
        # Corresponds to the JSON property `policyDelta`
        # @return [Google::Apis::IamV1::PolicyDelta]
        attr_accessor :policy_delta
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy_delta = args[:policy_delta] if args.key?(:policy_delta)
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
      
      # Contains information about an auditable service.
      class AuditableService
        include Google::Apis::Core::Hashable
      
        # Public name of the service.
        # For example, the service name for Cloud IAM is 'iam.googleapis.com'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
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
        # @return [Google::Apis::IamV1::Expr]
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
      
      # One delta entry for Binding. Each individual change (only one member in each
      # entry) to a binding will be a separate entry.
      class BindingDelta
        include Google::Apis::Core::Hashable
      
        # The action that was performed on a Binding.
        # Required
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::IamV1::Expr]
        attr_accessor :condition
      
        # A single identity requesting access for a Cloud Platform resource.
        # Follows the same format of Binding.members.
        # Required
        # Corresponds to the JSON property `member`
        # @return [String]
        attr_accessor :member
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Required
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @condition = args[:condition] if args.key?(:condition)
          @member = args[:member] if args.key?(:member)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # The request to create a new role.
      class CreateRoleRequest
        include Google::Apis::Core::Hashable
      
        # A role in the Identity and Access Management API.
        # Corresponds to the JSON property `role`
        # @return [Google::Apis::IamV1::Role]
        attr_accessor :role
      
        # The role ID to use for this role.
        # Corresponds to the JSON property `roleId`
        # @return [String]
        attr_accessor :role_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @role = args[:role] if args.key?(:role)
          @role_id = args[:role_id] if args.key?(:role_id)
        end
      end
      
      # The service account key create request.
      class CreateServiceAccountKeyRequest
        include Google::Apis::Core::Hashable
      
        # Which type of key and algorithm to use for the key.
        # The default is currently a 2K RSA key.  However this may change in the
        # future.
        # Corresponds to the JSON property `keyAlgorithm`
        # @return [String]
        attr_accessor :key_algorithm
      
        # The output format of the private key. The default value is
        # `TYPE_GOOGLE_CREDENTIALS_FILE`, which is the Google Credentials File
        # format.
        # Corresponds to the JSON property `privateKeyType`
        # @return [String]
        attr_accessor :private_key_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_algorithm = args[:key_algorithm] if args.key?(:key_algorithm)
          @private_key_type = args[:private_key_type] if args.key?(:private_key_type)
        end
      end
      
      # The service account create request.
      class CreateServiceAccountRequest
        include Google::Apis::Core::Hashable
      
        # Required. The account id that is used to generate the service account
        # email address and a stable unique id. It is unique within a project,
        # must be 6-30 characters long, and match the regular expression
        # `[a-z]([-a-z0-9]*[a-z0-9])` to comply with RFC1035.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # A service account in the Identity and Access Management API.
        # To create a service account, specify the `project_id` and the `account_id`
        # for the account.  The `account_id` is unique within the project, and is used
        # to generate the service account email address and a stable
        # `unique_id`.
        # If the account already exists, the account's resource name is returned
        # in the format of projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`. The caller
        # can use the name in other methods to access the account.
        # All other methods can identify the service account using the format
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        # the account. The `ACCOUNT` value can be the `email` address or the
        # `unique_id` of the service account.
        # Corresponds to the JSON property `serviceAccount`
        # @return [Google::Apis::IamV1::ServiceAccount]
        attr_accessor :service_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @service_account = args[:service_account] if args.key?(:service_account)
        end
      end
      
      # The service account disable request.
      class DisableServiceAccountRequest
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
      
      # The service account enable request.
      class EnableServiceAccountRequest
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
      
      # The request to lint a Cloud IAM policy object. LintPolicy is currently
      # functional only for `lint_object` of type `condition`.
      class LintPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Associates `members` with a `role`.
        # Corresponds to the JSON property `binding`
        # @return [Google::Apis::IamV1::Binding]
        attr_accessor :binding
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::IamV1::Expr]
        attr_accessor :condition
      
        # `context` contains additional *permission-controlled* data that any
        # lint unit may depend on, in form of ``key: value`` pairs. Currently, this
        # field is non-operational and it will not be used during the lint operation.
        # Corresponds to the JSON property `context`
        # @return [Hash<String,Object>]
        attr_accessor :context
      
        # The full resource name of the policy this lint request is about.
        # The name follows the Google Cloud Platform (GCP) resource format.
        # For example, a GCP project with ID `my-project` will be named
        # `//cloudresourcemanager.googleapis.com/projects/my-project`.
        # The resource name is not used to read the policy instance from the Cloud
        # IAM database. The candidate policy for lint has to be provided in the same
        # request object.
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
        # @return [Google::Apis::IamV1::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binding = args[:binding] if args.key?(:binding)
          @condition = args[:condition] if args.key?(:condition)
          @context = args[:context] if args.key?(:context)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # The response of a lint operation. An empty response indicates
      # the operation was able to fully execute and no lint issue was found.
      class LintPolicyResponse
        include Google::Apis::Core::Hashable
      
        # List of lint results sorted by a composite <severity, binding_ordinal> key,
        # descending order of severity and ascending order of binding_ordinal.
        # There is no certain order among the same keys.
        # For cross-binding results (only if the input object to lint is
        # instance of google.iam.v1.Policy), there will be a
        # google.iam.admin.v1.LintResult for each of the involved bindings,
        # and the associated debug_message may enumerate the other involved
        # binding ordinal number(s).
        # Corresponds to the JSON property `lintResults`
        # @return [Array<Google::Apis::IamV1::LintResult>]
        attr_accessor :lint_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lint_results = args[:lint_results] if args.key?(:lint_results)
        end
      end
      
      # Structured response of a single validation unit.
      class LintResult
        include Google::Apis::Core::Hashable
      
        # 0-based index ordinality of the binding in the input object associated
        # with this result.
        # This field is populated only if the input object to lint is of type
        # google.iam.v1.Policy, which can comprise more than one binding.
        # It is set to -1 if the result is not associated with any particular
        # binding and only targets the policy as a whole, such as results about
        # policy size violations.
        # Corresponds to the JSON property `bindingOrdinal`
        # @return [Fixnum]
        attr_accessor :binding_ordinal
      
        # Human readable debug message associated with the issue.
        # Corresponds to the JSON property `debugMessage`
        # @return [String]
        attr_accessor :debug_message
      
        # The name of the field for which this lint result is about.
        # For nested messages, `field_name` consists of names of the embedded fields
        # separated by period character. The top-level qualifier is the input object
        # to lint in the request. For instance, if the lint request is on a
        # google.iam.v1.Policy and this lint result is about a condition
        # expression of one of the input policy bindings, the field would be
        # populated as `policy.bindings.condition.expression`.
        # This field does not identify the ordinality of the repetitive fields (for
        # instance bindings in a policy).
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The validation unit level.
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # 0-based character position of problematic construct within the object
        # identified by `field_name`. Currently, this is populated only for condition
        # expression.
        # Corresponds to the JSON property `locationOffset`
        # @return [Fixnum]
        attr_accessor :location_offset
      
        # The validation unit severity.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # The validation unit name, for instance
        # "lintValidationUnits/ConditionComplexityCheck".
        # Corresponds to the JSON property `validationUnitName`
        # @return [String]
        attr_accessor :validation_unit_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binding_ordinal = args[:binding_ordinal] if args.key?(:binding_ordinal)
          @debug_message = args[:debug_message] if args.key?(:debug_message)
          @field_name = args[:field_name] if args.key?(:field_name)
          @level = args[:level] if args.key?(:level)
          @location_offset = args[:location_offset] if args.key?(:location_offset)
          @severity = args[:severity] if args.key?(:severity)
          @validation_unit_name = args[:validation_unit_name] if args.key?(:validation_unit_name)
        end
      end
      
      # The response containing the roles defined under a resource.
      class ListRolesResponse
        include Google::Apis::Core::Hashable
      
        # To retrieve the next page of results, set
        # `ListRolesRequest.page_token` to this value.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The Roles defined on this resource.
        # Corresponds to the JSON property `roles`
        # @return [Array<Google::Apis::IamV1::Role>]
        attr_accessor :roles
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @roles = args[:roles] if args.key?(:roles)
        end
      end
      
      # The service account keys list response.
      class ListServiceAccountKeysResponse
        include Google::Apis::Core::Hashable
      
        # The public keys for the service account.
        # Corresponds to the JSON property `keys`
        # @return [Array<Google::Apis::IamV1::ServiceAccountKey>]
        attr_accessor :keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @keys = args[:keys] if args.key?(:keys)
        end
      end
      
      # The service account list response.
      class ListServiceAccountsResponse
        include Google::Apis::Core::Hashable
      
        # The list of matching service accounts.
        # Corresponds to the JSON property `accounts`
        # @return [Array<Google::Apis::IamV1::ServiceAccount>]
        attr_accessor :accounts
      
        # To retrieve the next page of results, set
        # ListServiceAccountsRequest.page_token
        # to this value.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accounts = args[:accounts] if args.key?(:accounts)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The patch service account request.
      class PatchServiceAccountRequest
        include Google::Apis::Core::Hashable
      
        # A service account in the Identity and Access Management API.
        # To create a service account, specify the `project_id` and the `account_id`
        # for the account.  The `account_id` is unique within the project, and is used
        # to generate the service account email address and a stable
        # `unique_id`.
        # If the account already exists, the account's resource name is returned
        # in the format of projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`. The caller
        # can use the name in other methods to access the account.
        # All other methods can identify the service account using the format
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        # the account. The `ACCOUNT` value can be the `email` address or the
        # `unique_id` of the service account.
        # Corresponds to the JSON property `serviceAccount`
        # @return [Google::Apis::IamV1::ServiceAccount]
        attr_accessor :service_account
      
        # 
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service_account = args[:service_account] if args.key?(:service_account)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # A permission which can be included by a role.
      class Permission
        include Google::Apis::Core::Hashable
      
        # The service API associated with the permission is not enabled.
        # Corresponds to the JSON property `apiDisabled`
        # @return [Boolean]
        attr_accessor :api_disabled
        alias_method :api_disabled?, :api_disabled
      
        # The current custom role support level.
        # Corresponds to the JSON property `customRolesSupportLevel`
        # @return [String]
        attr_accessor :custom_roles_support_level
      
        # A brief description of what this Permission is used for.
        # This permission can ONLY be used in predefined roles.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The name of this Permission.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # 
        # Corresponds to the JSON property `onlyInPredefinedRoles`
        # @return [Boolean]
        attr_accessor :only_in_predefined_roles
        alias_method :only_in_predefined_roles?, :only_in_predefined_roles
      
        # The preferred name for this permission. If present, then this permission is
        # an alias of, and equivalent to, the listed primary_permission.
        # Corresponds to the JSON property `primaryPermission`
        # @return [String]
        attr_accessor :primary_permission
      
        # The current launch stage of the permission.
        # Corresponds to the JSON property `stage`
        # @return [String]
        attr_accessor :stage
      
        # The title of this Permission.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_disabled = args[:api_disabled] if args.key?(:api_disabled)
          @custom_roles_support_level = args[:custom_roles_support_level] if args.key?(:custom_roles_support_level)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @only_in_predefined_roles = args[:only_in_predefined_roles] if args.key?(:only_in_predefined_roles)
          @primary_permission = args[:primary_permission] if args.key?(:primary_permission)
          @stage = args[:stage] if args.key?(:stage)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A PermissionDelta message to record the added_permissions and
      # removed_permissions inside a role.
      class PermissionDelta
        include Google::Apis::Core::Hashable
      
        # Added permissions.
        # Corresponds to the JSON property `addedPermissions`
        # @return [Array<String>]
        attr_accessor :added_permissions
      
        # Removed permissions.
        # Corresponds to the JSON property `removedPermissions`
        # @return [Array<String>]
        attr_accessor :removed_permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @added_permissions = args[:added_permissions] if args.key?(:added_permissions)
          @removed_permissions = args[:removed_permissions] if args.key?(:removed_permissions)
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
        # @return [Array<Google::Apis::IamV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::IamV1::Binding>]
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
      
      # The difference delta between two policies.
      class PolicyDelta
        include Google::Apis::Core::Hashable
      
        # The delta for Bindings between two policies.
        # Corresponds to the JSON property `bindingDeltas`
        # @return [Array<Google::Apis::IamV1::BindingDelta>]
        attr_accessor :binding_deltas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binding_deltas = args[:binding_deltas] if args.key?(:binding_deltas)
        end
      end
      
      # A request to get the list of auditable services for a resource.
      class QueryAuditableServicesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name to query from the list of auditable
        # services.
        # The name follows the Google Cloud Platform resource format.
        # For example, a Cloud Platform project with id `my-project` will be named
        # `//cloudresourcemanager.googleapis.com/projects/my-project`.
        # Corresponds to the JSON property `fullResourceName`
        # @return [String]
        attr_accessor :full_resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
        end
      end
      
      # A response containing a list of auditable services for a resource.
      class QueryAuditableServicesResponse
        include Google::Apis::Core::Hashable
      
        # The auditable services for a resource.
        # Corresponds to the JSON property `services`
        # @return [Array<Google::Apis::IamV1::AuditableService>]
        attr_accessor :services
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @services = args[:services] if args.key?(:services)
        end
      end
      
      # The grantable role query request.
      class QueryGrantableRolesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name to query from the list of grantable roles.
        # The name follows the Google Cloud Platform resource format.
        # For example, a Cloud Platform project with id `my-project` will be named
        # `//cloudresourcemanager.googleapis.com/projects/my-project`.
        # Corresponds to the JSON property `fullResourceName`
        # @return [String]
        attr_accessor :full_resource_name
      
        # Optional limit on the number of roles to include in the response.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Optional pagination token returned in an earlier
        # QueryGrantableRolesResponse.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # 
        # Corresponds to the JSON property `view`
        # @return [String]
        attr_accessor :view
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @view = args[:view] if args.key?(:view)
        end
      end
      
      # The grantable role query response.
      class QueryGrantableRolesResponse
        include Google::Apis::Core::Hashable
      
        # To retrieve the next page of results, set
        # `QueryGrantableRolesRequest.page_token` to this value.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of matching roles.
        # Corresponds to the JSON property `roles`
        # @return [Array<Google::Apis::IamV1::Role>]
        attr_accessor :roles
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @roles = args[:roles] if args.key?(:roles)
        end
      end
      
      # A request to get permissions which can be tested on a resource.
      class QueryTestablePermissionsRequest
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name to query from the list of testable
        # permissions.
        # The name follows the Google Cloud Platform resource format.
        # For example, a Cloud Platform project with id `my-project` will be named
        # `//cloudresourcemanager.googleapis.com/projects/my-project`.
        # Corresponds to the JSON property `fullResourceName`
        # @return [String]
        attr_accessor :full_resource_name
      
        # Optional limit on the number of permissions to include in the response.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Optional pagination token returned in an earlier
        # QueryTestablePermissionsRequest.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_resource_name = args[:full_resource_name] if args.key?(:full_resource_name)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # The response containing permissions which can be tested on a resource.
      class QueryTestablePermissionsResponse
        include Google::Apis::Core::Hashable
      
        # To retrieve the next page of results, set
        # `QueryTestableRolesRequest.page_token` to this value.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The Permissions testable on the requested resource.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::IamV1::Permission>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # A role in the Identity and Access Management API.
      class Role
        include Google::Apis::Core::Hashable
      
        # The current deleted state of the role. This field is read only.
        # It will be ignored in calls to CreateRole and UpdateRole.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Optional. A human-readable description for the role.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Used to perform a consistent read-modify-write.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # The names of the permissions this role grants when bound in an IAM policy.
        # Corresponds to the JSON property `includedPermissions`
        # @return [Array<String>]
        attr_accessor :included_permissions
      
        # The name of the role.
        # When Role is used in CreateRole, the role name must not be set.
        # When Role is used in output and other input such as UpdateRole, the role
        # name is the complete path, e.g., roles/logging.viewer for predefined roles
        # and organizations/`ORGANIZATION_ID`/roles/logging.viewer for custom roles.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The current launch stage of the role. If the `ALPHA` launch stage has been
        # selected for a role, the `stage` field will not be included in the
        # returned definition for the role.
        # Corresponds to the JSON property `stage`
        # @return [String]
        attr_accessor :stage
      
        # Optional. A human-readable title for the role.  Typically this
        # is limited to 100 UTF-8 bytes.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deleted = args[:deleted] if args.key?(:deleted)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @included_permissions = args[:included_permissions] if args.key?(:included_permissions)
          @name = args[:name] if args.key?(:name)
          @stage = args[:stage] if args.key?(:stage)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A service account in the Identity and Access Management API.
      # To create a service account, specify the `project_id` and the `account_id`
      # for the account.  The `account_id` is unique within the project, and is used
      # to generate the service account email address and a stable
      # `unique_id`.
      # If the account already exists, the account's resource name is returned
      # in the format of projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`. The caller
      # can use the name in other methods to access the account.
      # All other methods can identify the service account using the format
      # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
      # Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
      # the account. The `ACCOUNT` value can be the `email` address or the
      # `unique_id` of the service account.
      class ServiceAccount
        include Google::Apis::Core::Hashable
      
        # Optional. A user-specified opaque description of the service account.
        # Must be less than or equal to 256 UTF-8 bytes.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # @OutputOnly A bool indicate if the service account is disabled.
        # The field is currently in alpha phase.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        # Optional. A user-specified name for the service account.
        # Must be less than or equal to 100 UTF-8 bytes.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # @OutputOnly The email address of the service account.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Optional. Note: `etag` is an inoperable legacy field that is only returned
        # for backwards compatibility.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # The resource name of the service account in the following format:
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # Requests using `-` as a wildcard for the `PROJECT_ID` will infer the
        # project from the `account` and the `ACCOUNT` value can be the `email`
        # address or the `unique_id` of the service account.
        # In responses the resource name will always be in the format
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # @OutputOnly The OAuth2 client id for the service account.
        # This is used in conjunction with the OAuth2 clientconfig API to make
        # three legged OAuth2 (3LO) flows to access the data of Google users.
        # Corresponds to the JSON property `oauth2ClientId`
        # @return [String]
        attr_accessor :oauth2_client_id
      
        # @OutputOnly The id of the project that owns the service account.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # @OutputOnly The unique and stable id of the service account.
        # Corresponds to the JSON property `uniqueId`
        # @return [String]
        attr_accessor :unique_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @disabled = args[:disabled] if args.key?(:disabled)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @etag = args[:etag] if args.key?(:etag)
          @name = args[:name] if args.key?(:name)
          @oauth2_client_id = args[:oauth2_client_id] if args.key?(:oauth2_client_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @unique_id = args[:unique_id] if args.key?(:unique_id)
        end
      end
      
      # Represents a service account key.
      # A service account has two sets of key-pairs: user-managed, and
      # system-managed.
      # User-managed key-pairs can be created and deleted by users.  Users are
      # responsible for rotating these keys periodically to ensure security of
      # their service accounts.  Users retain the private key of these key-pairs,
      # and Google retains ONLY the public key.
      # System-managed keys are automatically rotated by Google, and are used for
      # signing for a maximum of two weeks. The rotation process is probabilistic,
      # and usage of the new key will gradually ramp up and down over the key's
      # lifetime. We recommend caching the public key set for a service account for
      # no more than 24 hours to ensure you have access to the latest keys.
      # Public keys for all service accounts are also published at the OAuth2
      # Service Account API.
      class ServiceAccountKey
        include Google::Apis::Core::Hashable
      
        # Specifies the algorithm (and possibly key size) for the key.
        # Corresponds to the JSON property `keyAlgorithm`
        # @return [String]
        attr_accessor :key_algorithm
      
        # The key origin.
        # Corresponds to the JSON property `keyOrigin`
        # @return [String]
        attr_accessor :key_origin
      
        # The key type.
        # Corresponds to the JSON property `keyType`
        # @return [String]
        attr_accessor :key_type
      
        # The resource name of the service account key in the following format
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`/keys/`key``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The private key data. Only provided in `CreateServiceAccountKey`
        # responses. Make sure to keep the private key data secure because it
        # allows for the assertion of the service account identity.
        # When base64 decoded, the private key data can be used to authenticate with
        # Google API client libraries and with
        # <a href="/sdk/gcloud/reference/auth/activate-service-account">gcloud
        # auth activate-service-account</a>.
        # Corresponds to the JSON property `privateKeyData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :private_key_data
      
        # The output format for the private key.
        # Only provided in `CreateServiceAccountKey` responses, not
        # in `GetServiceAccountKey` or `ListServiceAccountKey` responses.
        # Google never exposes system-managed private keys, and never retains
        # user-managed private keys.
        # Corresponds to the JSON property `privateKeyType`
        # @return [String]
        attr_accessor :private_key_type
      
        # The public key data. Only provided in `GetServiceAccountKey` responses.
        # Corresponds to the JSON property `publicKeyData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :public_key_data
      
        # The key can be used after this timestamp.
        # Corresponds to the JSON property `validAfterTime`
        # @return [String]
        attr_accessor :valid_after_time
      
        # The key can be used before this timestamp.
        # For system-managed key pairs, this timestamp is the end time for the
        # private key signing operation. The public key could still be used
        # for verification for a few hours after this time.
        # Corresponds to the JSON property `validBeforeTime`
        # @return [String]
        attr_accessor :valid_before_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_algorithm = args[:key_algorithm] if args.key?(:key_algorithm)
          @key_origin = args[:key_origin] if args.key?(:key_origin)
          @key_type = args[:key_type] if args.key?(:key_type)
          @name = args[:name] if args.key?(:name)
          @private_key_data = args[:private_key_data] if args.key?(:private_key_data)
          @private_key_type = args[:private_key_type] if args.key?(:private_key_type)
          @public_key_data = args[:public_key_data] if args.key?(:public_key_data)
          @valid_after_time = args[:valid_after_time] if args.key?(:valid_after_time)
          @valid_before_time = args[:valid_before_time] if args.key?(:valid_before_time)
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
        # @return [Google::Apis::IamV1::Policy]
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
      
      # The service account sign blob request.
      class SignBlobRequest
        include Google::Apis::Core::Hashable
      
        # The bytes to sign.
        # Corresponds to the JSON property `bytesToSign`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :bytes_to_sign
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bytes_to_sign = args[:bytes_to_sign] if args.key?(:bytes_to_sign)
        end
      end
      
      # The service account sign blob response.
      class SignBlobResponse
        include Google::Apis::Core::Hashable
      
        # The id of the key used to sign the blob.
        # Corresponds to the JSON property `keyId`
        # @return [String]
        attr_accessor :key_id
      
        # The signed blob.
        # Corresponds to the JSON property `signature`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_id = args[:key_id] if args.key?(:key_id)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # The service account sign JWT request.
      class SignJwtRequest
        include Google::Apis::Core::Hashable
      
        # The JWT payload to sign, a JSON JWT Claim set.
        # Corresponds to the JSON property `payload`
        # @return [String]
        attr_accessor :payload
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload = args[:payload] if args.key?(:payload)
        end
      end
      
      # The service account sign JWT response.
      class SignJwtResponse
        include Google::Apis::Core::Hashable
      
        # The id of the key used to sign the JWT.
        # Corresponds to the JSON property `keyId`
        # @return [String]
        attr_accessor :key_id
      
        # The signed JWT.
        # Corresponds to the JSON property `signedJwt`
        # @return [String]
        attr_accessor :signed_jwt
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_id = args[:key_id] if args.key?(:key_id)
          @signed_jwt = args[:signed_jwt] if args.key?(:signed_jwt)
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
      
      # The request to undelete an existing role.
      class UndeleteRoleRequest
        include Google::Apis::Core::Hashable
      
        # Used to perform a consistent read-modify-write.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
        end
      end
      
      # The service account undelete request.
      class UndeleteServiceAccountRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # 
      class UndeleteServiceAccountResponse
        include Google::Apis::Core::Hashable
      
        # A service account in the Identity and Access Management API.
        # To create a service account, specify the `project_id` and the `account_id`
        # for the account.  The `account_id` is unique within the project, and is used
        # to generate the service account email address and a stable
        # `unique_id`.
        # If the account already exists, the account's resource name is returned
        # in the format of projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`. The caller
        # can use the name in other methods to access the account.
        # All other methods can identify the service account using the format
        # `projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT``.
        # Using `-` as a wildcard for the `PROJECT_ID` will infer the project from
        # the account. The `ACCOUNT` value can be the `email` address or the
        # `unique_id` of the service account.
        # Corresponds to the JSON property `restoredAccount`
        # @return [Google::Apis::IamV1::ServiceAccount]
        attr_accessor :restored_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @restored_account = args[:restored_account] if args.key?(:restored_account)
        end
      end
      
      # The service account key upload request.
      class UploadServiceAccountKeyRequest
        include Google::Apis::Core::Hashable
      
        # A field that allows clients to upload their own public key. If set,
        # use this public key data to create a service account key for given
        # service account.
        # Please note, the expected format for this field is X509_PEM.
        # Corresponds to the JSON property `publicKeyData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :public_key_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @public_key_data = args[:public_key_data] if args.key?(:public_key_data)
        end
      end
    end
  end
end
