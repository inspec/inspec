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
    module DatafusionV1beta1
      
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
        # @return [Array<Google::Apis::DatafusionV1beta1::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # 
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
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
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
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
      
        # 
        # Corresponds to the JSON property `ignoreChildExemptions`
        # @return [Boolean]
        attr_accessor :ignore_child_exemptions
        alias_method :ignore_child_exemptions?, :ignore_child_exemptions
      
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
          @ignore_child_exemptions = args[:ignore_child_exemptions] if args.key?(:ignore_child_exemptions)
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
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::DatafusionV1beta1::Expr]
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
      
      # Write a Cloud Audit log
      class CloudAuditOptions
        include Google::Apis::Core::Hashable
      
        # Authorization-related information used by Cloud Audit Logging.
        # Corresponds to the JSON property `authorizationLoggingOptions`
        # @return [Google::Apis::DatafusionV1beta1::AuthorizationLoggingOptions]
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
      
        # Trusted attributes supplied by any service that owns resources and uses
        # the IAM system for access control.
        # Corresponds to the JSON property `sys`
        # @return [String]
        attr_accessor :sys
      
        # The objects of the condition.
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
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Increment a streamz counter with the specified metric and field names.
      # Metric names should start with a '/', generally be lowercase-only,
      # and end in "_count". Field names should not contain an initial slash.
      # The actual exported metric names will have "/iam/policy" prepended.
      # Field names correspond to IAM request parameters and field values are
      # their respective values.
      # Supported field names:
      # - "authority", which is "[token]" if IAMContext.token is present,
      # otherwise the value of IAMContext.authority_selector if present, and
      # otherwise a representation of IAMContext.principal; or
      # - "iam_principal", a representation of IAMContext.principal even if a
      # token or authority selector is present; or
      # - "" (empty string), resulting in a counter with no fields.
      # Examples:
      # counter ` metric: "/debug_access_count"  field: "iam_principal" `
      # ==> increment counter /iam/policy/debug_access_count
      # `iam_principal=[value of IAMContext.principal]`
      class CounterOptions
        include Google::Apis::Core::Hashable
      
        # Custom fields.
        # Corresponds to the JSON property `customFields`
        # @return [Array<Google::Apis::DatafusionV1beta1::CustomField>]
        attr_accessor :custom_fields
      
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
          @custom_fields = args[:custom_fields] if args.key?(:custom_fields)
          @field = args[:field] if args.key?(:field)
          @metric = args[:metric] if args.key?(:metric)
        end
      end
      
      # Custom fields.
      # These can be used to create a counter with arbitrary field/value
      # pairs.
      # See: go/rpcsp-custom-fields.
      class CustomField
        include Google::Apis::Core::Hashable
      
        # Name is the field name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value is the field value. It is important that in contrast to the
        # CounterOptions.field, the value here is a constant that is not
        # derived from the IAMContext.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Write a Data Access (Gin) log
      class DataAccessOptions
        include Google::Apis::Core::Hashable
      
        # Whether Gin logging should happen in a fail-closed manner at the caller.
        # This is relevant only in the LocalIAM implementation, for now.
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
      
      # Represents a Data Fusion instance.
      class Instance
        include Google::Apis::Core::Hashable
      
        # Output only. Endpoint on which the REST APIs is accessible.
        # Corresponds to the JSON property `apiEndpoint`
        # @return [String]
        attr_accessor :api_endpoint
      
        # Available versions that the instance can be upgraded to using
        # UpdateInstanceRequest.
        # Corresponds to the JSON property `availableVersion`
        # @return [Array<Google::Apis::DatafusionV1beta1::Version>]
        attr_accessor :available_version
      
        # Output only. The time the instance was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # An optional description of this instance.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Display name for an instance.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Option to enable Stackdriver Logging.
        # Corresponds to the JSON property `enableStackdriverLogging`
        # @return [Boolean]
        attr_accessor :enable_stackdriver_logging
        alias_method :enable_stackdriver_logging?, :enable_stackdriver_logging
      
        # Option to enable Stackdriver Monitoring.
        # Corresponds to the JSON property `enableStackdriverMonitoring`
        # @return [Boolean]
        attr_accessor :enable_stackdriver_monitoring
        alias_method :enable_stackdriver_monitoring?, :enable_stackdriver_monitoring
      
        # The resource labels for instance to use to annotate any related underlying
        # resources such as GCE VMs. The character '=' is not allowed to be used
        # within the labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The name of this instance is in the form of
        # projects/`project`/locations/`location`/instances/`instance`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Network configuration for a Data Fusion instance. These configurations
        # are used for peering with the customer network. Configurations are optional
        # when a public Data Fusion instance is to be created. However, providing
        # these configurations allows several benefits, such as reduced network latency
        # while accessing the customer resources from managed Data Fusion instance
        # nodes, as well as access to the customer on-prem resources.
        # Corresponds to the JSON property `networkConfig`
        # @return [Google::Apis::DatafusionV1beta1::NetworkConfig]
        attr_accessor :network_config
      
        # Map of additional options used to configure the behavior of
        # Data Fusion instance.
        # Corresponds to the JSON property `options`
        # @return [Hash<String,String>]
        attr_accessor :options
      
        # Specifies whether the Data Fusion instance should be private. If set to
        # true, all Data Fusion nodes will have private IP addresses and will not be
        # able to access the public internet.
        # Corresponds to the JSON property `privateInstance`
        # @return [Boolean]
        attr_accessor :private_instance
        alias_method :private_instance?, :private_instance
      
        # Output only. Service account which will be used to access resources in
        # the customer project."
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # Output only. Endpoint on which the Data Fusion UI is accessible.
        # Corresponds to the JSON property `serviceEndpoint`
        # @return [String]
        attr_accessor :service_endpoint
      
        # Output only. The current state of this Data Fusion instance.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Additional information about the current state of this Data
        # Fusion instance if available.
        # Corresponds to the JSON property `stateMessage`
        # @return [String]
        attr_accessor :state_message
      
        # Required. Instance type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Output only. The time the instance was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Current version of the Data Fusion. Only specifiable in Update.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # Name of the zone in which the Data Fusion instance will be created.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_endpoint = args[:api_endpoint] if args.key?(:api_endpoint)
          @available_version = args[:available_version] if args.key?(:available_version)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enable_stackdriver_logging = args[:enable_stackdriver_logging] if args.key?(:enable_stackdriver_logging)
          @enable_stackdriver_monitoring = args[:enable_stackdriver_monitoring] if args.key?(:enable_stackdriver_monitoring)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @network_config = args[:network_config] if args.key?(:network_config)
          @options = args[:options] if args.key?(:options)
          @private_instance = args[:private_instance] if args.key?(:private_instance)
          @service_account = args[:service_account] if args.key?(:service_account)
          @service_endpoint = args[:service_endpoint] if args.key?(:service_endpoint)
          @state = args[:state] if args.key?(:state)
          @state_message = args[:state_message] if args.key?(:state_message)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version = args[:version] if args.key?(:version)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Response message for the list instance request.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # Represents a list of Data Fusion instances.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::DatafusionV1beta1::Instance>]
        attr_accessor :instances
      
        # Token to retrieve the next page of results or empty if there are no more
        # results in the list.
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
        # @return [Array<Google::Apis::DatafusionV1beta1::Location>]
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
        # @return [Array<Google::Apis::DatafusionV1beta1::Operation>]
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
      
      # Specifies what kind of log the caller must write
      class LogConfig
        include Google::Apis::Core::Hashable
      
        # Write a Cloud Audit log
        # Corresponds to the JSON property `cloudAudit`
        # @return [Google::Apis::DatafusionV1beta1::CloudAuditOptions]
        attr_accessor :cloud_audit
      
        # Increment a streamz counter with the specified metric and field names.
        # Metric names should start with a '/', generally be lowercase-only,
        # and end in "_count". Field names should not contain an initial slash.
        # The actual exported metric names will have "/iam/policy" prepended.
        # Field names correspond to IAM request parameters and field values are
        # their respective values.
        # Supported field names:
        # - "authority", which is "[token]" if IAMContext.token is present,
        # otherwise the value of IAMContext.authority_selector if present, and
        # otherwise a representation of IAMContext.principal; or
        # - "iam_principal", a representation of IAMContext.principal even if a
        # token or authority selector is present; or
        # - "" (empty string), resulting in a counter with no fields.
        # Examples:
        # counter ` metric: "/debug_access_count"  field: "iam_principal" `
        # ==> increment counter /iam/policy/debug_access_count
        # `iam_principal=[value of IAMContext.principal]`
        # Corresponds to the JSON property `counter`
        # @return [Google::Apis::DatafusionV1beta1::CounterOptions]
        attr_accessor :counter
      
        # Write a Data Access (Gin) log
        # Corresponds to the JSON property `dataAccess`
        # @return [Google::Apis::DatafusionV1beta1::DataAccessOptions]
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
      
      # Network configuration for a Data Fusion instance. These configurations
      # are used for peering with the customer network. Configurations are optional
      # when a public Data Fusion instance is to be created. However, providing
      # these configurations allows several benefits, such as reduced network latency
      # while accessing the customer resources from managed Data Fusion instance
      # nodes, as well as access to the customer on-prem resources.
      class NetworkConfig
        include Google::Apis::Core::Hashable
      
        # The IP range in CIDR notation to use for the managed Data Fusion instance
        # nodes. This range must not overlap with any other ranges used in the Data
        # Fusion instance network.
        # Corresponds to the JSON property `ipAllocation`
        # @return [String]
        attr_accessor :ip_allocation
      
        # Name of the network in the customer project with which the Tenant Project
        # will be peered for executing pipelines. In case of shared VPC where the
        # network resides in another host project the network should specified in
        # the form of projects/`host-project-id`/global/networks/`network`
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_allocation = args[:ip_allocation] if args.key?(:ip_allocation)
          @network = args[:network] if args.key?(:network)
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
        # @return [Google::Apis::DatafusionV1beta1::Status]
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
      
      # Represents the metadata of a long-running operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The time the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The time the operation finished running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Identifies whether the user has requested cancellation
        # of the operation. Operations that have successfully been cancelled
        # have Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # Corresponds to the JSON property `requestedCancellation`
        # @return [Boolean]
        attr_accessor :requested_cancellation
        alias_method :requested_cancellation?, :requested_cancellation
      
        # Human-readable status of the operation if any.
        # Corresponds to the JSON property `statusDetail`
        # @return [String]
        attr_accessor :status_detail
      
        # Server-defined resource path for the target of the operation.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # Name of the verb executed by the operation.
        # Corresponds to the JSON property `verb`
        # @return [String]
        attr_accessor :verb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @requested_cancellation = args[:requested_cancellation] if args.key?(:requested_cancellation)
          @status_detail = args[:status_detail] if args.key?(:status_detail)
          @target = args[:target] if args.key?(:target)
          @verb = args[:verb] if args.key?(:verb)
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
        # @return [Array<Google::Apis::DatafusionV1beta1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::DatafusionV1beta1::Binding>]
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
      
        # 
        # Corresponds to the JSON property `iamOwned`
        # @return [Boolean]
        attr_accessor :iam_owned
        alias_method :iam_owned?, :iam_owned
      
        # If more than one rule is specified, the rules are applied in the following
        # manner:
        # - All matching LOG rules are always applied.
        # - If any DENY/DENY_WITH_LOG rule matches, permission is denied.
        # Logging will be applied if one or more matching rule requires logging.
        # - Otherwise, if any ALLOW/ALLOW_WITH_LOG rule matches, permission is
        # granted.
        # Logging will be applied if one or more matching rule requires logging.
        # - Otherwise, if no rule applies, permission is denied.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::DatafusionV1beta1::Rule>]
        attr_accessor :rules
      
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
          @iam_owned = args[:iam_owned] if args.key?(:iam_owned)
          @rules = args[:rules] if args.key?(:rules)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Request message for restarting a Data Fusion instance.
      class RestartInstanceRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
        # @return [Array<Google::Apis::DatafusionV1beta1::Condition>]
        attr_accessor :conditions
      
        # Human-readable description of the rule.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If one or more 'in' clauses are specified, the rule matches if
        # the PRINCIPAL/AUTHORITY_SELECTOR is in at least one of these entries.
        # Corresponds to the JSON property `in`
        # @return [Array<String>]
        attr_accessor :in
      
        # The config returned to callers of tech.iam.IAM.CheckPolicy for any entries
        # that match the LOG action.
        # Corresponds to the JSON property `logConfig`
        # @return [Array<Google::Apis::DatafusionV1beta1::LogConfig>]
        attr_accessor :log_config
      
        # If one or more 'not_in' clauses are specified, the rule matches
        # if the PRINCIPAL/AUTHORITY_SELECTOR is in none of the entries.
        # The format for in and not_in entries can be found at in the Local IAM
        # documentation (see go/local-iam#features).
        # Corresponds to the JSON property `notIn`
        # @return [Array<String>]
        attr_accessor :not_in
      
        # A permission is a string of form '<service>.<resource type>.<verb>'
        # (e.g., 'storage.buckets.list'). A value of '*' matches all permissions,
        # and a verb part of '*' (e.g., 'storage.buckets.*') matches all verbs.
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
          @in = args[:in] if args.key?(:in)
          @log_config = args[:log_config] if args.key?(:log_config)
          @not_in = args[:not_in] if args.key?(:not_in)
          @permissions = args[:permissions] if args.key?(:permissions)
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
        # @return [Google::Apis::DatafusionV1beta1::Policy]
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
      
      # Request message for upgrading a Data Fusion instance.
      # To change the instance properties, instance update should be used.
      class UpgradeInstanceRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The Data Fusion version.
      class Version
        include Google::Apis::Core::Hashable
      
        # The version number of the Data Fusion instance, such as '6.0.1.0'.
        # Corresponds to the JSON property `versionNumber`
        # @return [String]
        attr_accessor :version_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version_number = args[:version_number] if args.key?(:version_number)
        end
      end
    end
  end
end
