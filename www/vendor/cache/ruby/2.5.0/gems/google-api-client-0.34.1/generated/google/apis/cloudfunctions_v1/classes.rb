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
    module CloudfunctionsV1
      
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
        # @return [Array<Google::Apis::CloudfunctionsV1::AuditLogConfig>]
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
        # @return [Google::Apis::CloudfunctionsV1::Expr]
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
      
      # Request for the `CallFunction` method.
      class CallFunctionRequest
        include Google::Apis::Core::Hashable
      
        # Required. Input to be passed to the function.
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
        end
      end
      
      # Response of `CallFunction` method.
      class CallFunctionResponse
        include Google::Apis::Core::Hashable
      
        # Either system or user-function generated error. Set if execution
        # was not successful.
        # Corresponds to the JSON property `error`
        # @return [String]
        attr_accessor :error
      
        # Execution id of function invocation.
        # Corresponds to the JSON property `executionId`
        # @return [String]
        attr_accessor :execution_id
      
        # Result populated for successful execution of synchronous function. Will
        # not be populated if function does not return a result through context.
        # Corresponds to the JSON property `result`
        # @return [String]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @execution_id = args[:execution_id] if args.key?(:execution_id)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # Describes a Cloud Function that contains user computation executed in
      # response to an event. It encapsulate function and triggers configurations.
      class CloudFunction
        include Google::Apis::Core::Hashable
      
        # The amount of memory in MB available for a function.
        # Defaults to 256MB.
        # Corresponds to the JSON property `availableMemoryMb`
        # @return [Fixnum]
        attr_accessor :available_memory_mb
      
        # User-provided description of a function.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The name of the function (as defined in source code) that will be
        # executed. Defaults to the resource name suffix, if not specified. For
        # backward compatibility, if function with given name is not found, then the
        # system will try to use function named "function".
        # For Node.js this is name of a function exported by the module specified
        # in `source_location`.
        # Corresponds to the JSON property `entryPoint`
        # @return [String]
        attr_accessor :entry_point
      
        # Environment variables that shall be available during function execution.
        # Corresponds to the JSON property `environmentVariables`
        # @return [Hash<String,String>]
        attr_accessor :environment_variables
      
        # Describes EventTrigger, used to request events be sent from another
        # service.
        # Corresponds to the JSON property `eventTrigger`
        # @return [Google::Apis::CloudfunctionsV1::EventTrigger]
        attr_accessor :event_trigger
      
        # Describes HttpsTrigger, could be used to connect web hooks to function.
        # Corresponds to the JSON property `httpsTrigger`
        # @return [Google::Apis::CloudfunctionsV1::HttpsTrigger]
        attr_accessor :https_trigger
      
        # Labels associated with this Cloud Function.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The limit on the maximum number of function instances that may coexist at a
        # given time.
        # Corresponds to the JSON property `maxInstances`
        # @return [Fixnum]
        attr_accessor :max_instances
      
        # A user-defined name of the function. Function names must be unique
        # globally and match pattern `projects/*/locations/*/functions/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The VPC Network that this cloud function can connect to. It can be
        # either the fully-qualified URI, or the short name of the network resource.
        # If the short network name is used, the network must belong to the same
        # project. Otherwise, it must belong to a project within the same
        # organization. The format of this field is either
        # `projects/`project`/global/networks/`network`` or ``network``, where
        # `project` is a project id where the network is defined, and `network` is
        # the short name of the network.
        # This field is mutually exclusive with `vpc_connector` and will be replaced
        # by it.
        # See [the VPC documentation](https://cloud.google.com/compute/docs/vpc) for
        # more information on connecting Cloud projects.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # The runtime in which to run the function. Required when deploying a new
        # function, optional when updating an existing function. For a complete
        # list of possible choices, see the
        # [`gcloud` command
        # reference](/sdk/gcloud/reference/functions/deploy#--runtime).
        # Corresponds to the JSON property `runtime`
        # @return [String]
        attr_accessor :runtime
      
        # The email of the function's service account. If empty, defaults to
        # ``project_id`@appspot.gserviceaccount.com`.
        # Corresponds to the JSON property `serviceAccountEmail`
        # @return [String]
        attr_accessor :service_account_email
      
        # The Google Cloud Storage URL, starting with gs://, pointing to the zip
        # archive which contains the function.
        # Corresponds to the JSON property `sourceArchiveUrl`
        # @return [String]
        attr_accessor :source_archive_url
      
        # Describes SourceRepository, used to represent parameters related to
        # source repository where a function is hosted.
        # Corresponds to the JSON property `sourceRepository`
        # @return [Google::Apis::CloudfunctionsV1::SourceRepository]
        attr_accessor :source_repository
      
        # The Google Cloud Storage signed URL used for source uploading, generated
        # by google.cloud.functions.v1.GenerateUploadUrl
        # Corresponds to the JSON property `sourceUploadUrl`
        # @return [String]
        attr_accessor :source_upload_url
      
        # Output only. Status of the function deployment.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The function execution timeout. Execution is considered failed and
        # can be terminated if the function is not completed at the end of the
        # timeout period. Defaults to 60 seconds.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        # Output only. The last update timestamp of a Cloud Function.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Output only. The version identifier of the Cloud Function. Each deployment
        # attempt
        # results in a new version of a function being created.
        # Corresponds to the JSON property `versionId`
        # @return [Fixnum]
        attr_accessor :version_id
      
        # The VPC Network Connector that this cloud function can connect to. It can
        # be either the fully-qualified URI, or the short name of the network
        # connector resource. The format of this field is
        # `projects/*/locations/*/connectors/*`
        # This field is mutually exclusive with `network` field and will eventually
        # replace it.
        # See [the VPC documentation](https://cloud.google.com/compute/docs/vpc) for
        # more information on connecting Cloud projects.
        # Corresponds to the JSON property `vpcConnector`
        # @return [String]
        attr_accessor :vpc_connector
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_memory_mb = args[:available_memory_mb] if args.key?(:available_memory_mb)
          @description = args[:description] if args.key?(:description)
          @entry_point = args[:entry_point] if args.key?(:entry_point)
          @environment_variables = args[:environment_variables] if args.key?(:environment_variables)
          @event_trigger = args[:event_trigger] if args.key?(:event_trigger)
          @https_trigger = args[:https_trigger] if args.key?(:https_trigger)
          @labels = args[:labels] if args.key?(:labels)
          @max_instances = args[:max_instances] if args.key?(:max_instances)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @runtime = args[:runtime] if args.key?(:runtime)
          @service_account_email = args[:service_account_email] if args.key?(:service_account_email)
          @source_archive_url = args[:source_archive_url] if args.key?(:source_archive_url)
          @source_repository = args[:source_repository] if args.key?(:source_repository)
          @source_upload_url = args[:source_upload_url] if args.key?(:source_upload_url)
          @status = args[:status] if args.key?(:status)
          @timeout = args[:timeout] if args.key?(:timeout)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version_id = args[:version_id] if args.key?(:version_id)
          @vpc_connector = args[:vpc_connector] if args.key?(:vpc_connector)
        end
      end
      
      # Describes EventTrigger, used to request events be sent from another
      # service.
      class EventTrigger
        include Google::Apis::Core::Hashable
      
        # Required. The type of event to observe. For example:
        # `providers/cloud.storage/eventTypes/object.change` and
        # `providers/cloud.pubsub/eventTypes/topic.publish`.
        # Event types match pattern `providers/*/eventTypes/*.*`.
        # The pattern contains:
        # 1. namespace: For example, `cloud.storage` and
        # `google.firebase.analytics`.
        # 2. resource type: The type of resource on which event occurs. For
        # example, the Google Cloud Storage API includes the type `object`.
        # 3. action: The action that generates the event. For example, action for
        # a Google Cloud Storage Object is 'change'.
        # These parts are lower case.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        # Describes the policy in case of function's execution failure.
        # If empty, then defaults to ignoring failures (i.e. not retrying them).
        # Corresponds to the JSON property `failurePolicy`
        # @return [Google::Apis::CloudfunctionsV1::FailurePolicy]
        attr_accessor :failure_policy
      
        # Required. The resource(s) from which to observe events, for example,
        # `projects/_/buckets/myBucket`.
        # Not all syntactically correct values are accepted by all services. For
        # example:
        # 1. The authorization model must support it. Google Cloud Functions
        # only allows EventTriggers to be deployed that observe resources in the
        # same project as the `CloudFunction`.
        # 2. The resource type must match the pattern expected for an
        # `event_type`. For example, an `EventTrigger` that has an
        # `event_type` of "google.pubsub.topic.publish" should have a resource
        # that matches Google Cloud Pub/Sub topics.
        # Additionally, some services may support short names when creating an
        # `EventTrigger`. These will always be returned in the normalized "long"
        # format.
        # See each *service's* documentation for supported formats.
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        # The hostname of the service that should be observed.
        # If no string is provided, the default service implementing the API will
        # be used. For example, `storage.googleapis.com` is the default for all
        # event types in the `google.storage` namespace.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @event_type = args[:event_type] if args.key?(:event_type)
          @failure_policy = args[:failure_policy] if args.key?(:failure_policy)
          @resource = args[:resource] if args.key?(:resource)
          @service = args[:service] if args.key?(:service)
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
      
      # Describes the policy in case of function's execution failure.
      # If empty, then defaults to ignoring failures (i.e. not retrying them).
      class FailurePolicy
        include Google::Apis::Core::Hashable
      
        # Describes the retry policy in case of function's execution failure.
        # A function execution will be retried on any failure.
        # A failed execution will be retried up to 7 days with an exponential backoff
        # (capped at 10 seconds).
        # Retried execution is charged as any other execution.
        # Corresponds to the JSON property `retry`
        # @return [Google::Apis::CloudfunctionsV1::Retry]
        attr_accessor :retry
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @retry = args[:retry] if args.key?(:retry)
        end
      end
      
      # Request of `GenerateDownloadUrl` method.
      class GenerateDownloadUrlRequest
        include Google::Apis::Core::Hashable
      
        # The optional version of function. If not set, default, current version
        # is used.
        # Corresponds to the JSON property `versionId`
        # @return [Fixnum]
        attr_accessor :version_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version_id = args[:version_id] if args.key?(:version_id)
        end
      end
      
      # Response of `GenerateDownloadUrl` method.
      class GenerateDownloadUrlResponse
        include Google::Apis::Core::Hashable
      
        # The generated Google Cloud Storage signed URL that should be used for
        # function source code download.
        # Corresponds to the JSON property `downloadUrl`
        # @return [String]
        attr_accessor :download_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @download_url = args[:download_url] if args.key?(:download_url)
        end
      end
      
      # Request of `GenerateSourceUploadUrl` method.
      class GenerateUploadUrlRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response of `GenerateSourceUploadUrl` method.
      class GenerateUploadUrlResponse
        include Google::Apis::Core::Hashable
      
        # The generated Google Cloud Storage signed URL that should be used for a
        # function source code upload. The uploaded file should be a zip archive
        # which contains a function.
        # Corresponds to the JSON property `uploadUrl`
        # @return [String]
        attr_accessor :upload_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @upload_url = args[:upload_url] if args.key?(:upload_url)
        end
      end
      
      # Describes HttpsTrigger, could be used to connect web hooks to function.
      class HttpsTrigger
        include Google::Apis::Core::Hashable
      
        # Output only. The deployed url for the function.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Response for the `ListFunctions` method.
      class ListFunctionsResponse
        include Google::Apis::Core::Hashable
      
        # The functions that match the request.
        # Corresponds to the JSON property `functions`
        # @return [Array<Google::Apis::CloudfunctionsV1::CloudFunction>]
        attr_accessor :functions
      
        # If not empty, indicates that there may be more functions that match
        # the request; this value should be passed in a new
        # google.cloud.functions.v1.ListFunctionsRequest
        # to get more functions.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @functions = args[:functions] if args.key?(:functions)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::CloudfunctionsV1::Location>]
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
        # @return [Array<Google::Apis::CloudfunctionsV1::Operation>]
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
        # @return [Google::Apis::CloudfunctionsV1::Status]
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
      
      # Metadata describing an Operation
      class OperationMetadataV1
        include Google::Apis::Core::Hashable
      
        # The original request that started the operation.
        # Corresponds to the JSON property `request`
        # @return [Hash<String,Object>]
        attr_accessor :request
      
        # Target of the operation - for example
        # projects/project-1/locations/region-1/functions/function-1
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # Type of operation.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The last update timestamp of the operation.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Version id of the function created or updated by an API call.
        # This field is only populated for Create and Update operations.
        # Corresponds to the JSON property `versionId`
        # @return [Fixnum]
        attr_accessor :version_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request = args[:request] if args.key?(:request)
          @target = args[:target] if args.key?(:target)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version_id = args[:version_id] if args.key?(:version_id)
        end
      end
      
      # Metadata describing an Operation
      class OperationMetadataV1Beta2
        include Google::Apis::Core::Hashable
      
        # The original request that started the operation.
        # Corresponds to the JSON property `request`
        # @return [Hash<String,Object>]
        attr_accessor :request
      
        # Target of the operation - for example
        # projects/project-1/locations/region-1/functions/function-1
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # Type of operation.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The last update timestamp of the operation.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Version id of the function created or updated by an API call.
        # This field is only populated for Create and Update operations.
        # Corresponds to the JSON property `versionId`
        # @return [Fixnum]
        attr_accessor :version_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request = args[:request] if args.key?(:request)
          @target = args[:target] if args.key?(:target)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
          @version_id = args[:version_id] if args.key?(:version_id)
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
        # @return [Array<Google::Apis::CloudfunctionsV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudfunctionsV1::Binding>]
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
      
      # Describes the retry policy in case of function's execution failure.
      # A function execution will be retried on any failure.
      # A failed execution will be retried up to 7 days with an exponential backoff
      # (capped at 10 seconds).
      # Retried execution is charged as any other execution.
      class Retry
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
        # @return [Google::Apis::CloudfunctionsV1::Policy]
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
      
      # Describes SourceRepository, used to represent parameters related to
      # source repository where a function is hosted.
      class SourceRepository
        include Google::Apis::Core::Hashable
      
        # Output only. The URL pointing to the hosted repository where the function
        # were defined at the time of deployment. It always points to a specific
        # commit in the format described above.
        # Corresponds to the JSON property `deployedUrl`
        # @return [String]
        attr_accessor :deployed_url
      
        # The URL pointing to the hosted repository where the function is defined.
        # There are supported Cloud Source Repository URLs in the following
        # formats:
        # To refer to a specific commit:
        # `https://source.developers.google.com/projects/*/repos/*/revisions/*/paths/*`
        # To refer to a moveable alias (branch):
        # `https://source.developers.google.com/projects/*/repos/*/moveable-aliases/*/
        # paths/*`
        # In particular, to refer to HEAD use `master` moveable alias.
        # To refer to a specific fixed alias (tag):
        # `https://source.developers.google.com/projects/*/repos/*/fixed-aliases/*/paths/
        # *`
        # You may omit `paths/*` if you want to use the main directory.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployed_url = args[:deployed_url] if args.key?(:deployed_url)
          @url = args[:url] if args.key?(:url)
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
    end
  end
end
