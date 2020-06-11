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
    module ServicecontrolV1
      
      # 
      class AllocateInfo
        include Google::Apis::Core::Hashable
      
        # A list of label keys that were unused by the server in processing the
        # request. Thus, for similar requests repeated in a certain future time
        # window, the caller can choose to ignore these labels in the requests
        # to achieve better client-side cache hits and quota aggregation for rate
        # quota. This field is not populated for allocation quota checks.
        # Corresponds to the JSON property `unusedArguments`
        # @return [Array<String>]
        attr_accessor :unused_arguments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unused_arguments = args[:unused_arguments] if args.key?(:unused_arguments)
        end
      end
      
      # Request message for the AllocateQuota method.
      class AllocateQuotaRequest
        include Google::Apis::Core::Hashable
      
        # Represents information regarding a quota operation.
        # Corresponds to the JSON property `allocateOperation`
        # @return [Google::Apis::ServicecontrolV1::QuotaOperation]
        attr_accessor :allocate_operation
      
        # Specifies which version of service configuration should be used to process
        # the request. If unspecified or no matching version can be found, the latest
        # one will be used.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allocate_operation = args[:allocate_operation] if args.key?(:allocate_operation)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
        end
      end
      
      # Response message for the AllocateQuota method.
      class AllocateQuotaResponse
        include Google::Apis::Core::Hashable
      
        # Indicates the decision of the allocate.
        # Corresponds to the JSON property `allocateErrors`
        # @return [Array<Google::Apis::ServicecontrolV1::QuotaError>]
        attr_accessor :allocate_errors
      
        # WARNING: DO NOT use this field until this warning message is removed.
        # Corresponds to the JSON property `allocateInfo`
        # @return [Google::Apis::ServicecontrolV1::AllocateInfo]
        attr_accessor :allocate_info
      
        # The same operation_id value used in the AllocateQuotaRequest. Used for
        # logging and diagnostics purposes.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Quota metrics to indicate the result of allocation. Depending on the
        # request, one or more of the following metrics will be included:
        # 1. Per quota group or per quota metric incremental usage will be specified
        # using the following delta metric :
        # "serviceruntime.googleapis.com/api/consumer/quota_used_count"
        # 2. The quota limit reached condition will be specified using the following
        # boolean metric :
        # "serviceruntime.googleapis.com/quota/exceeded"
        # Corresponds to the JSON property `quotaMetrics`
        # @return [Array<Google::Apis::ServicecontrolV1::MetricValueSet>]
        attr_accessor :quota_metrics
      
        # ID of the actual config used to process the request.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allocate_errors = args[:allocate_errors] if args.key?(:allocate_errors)
          @allocate_info = args[:allocate_info] if args.key?(:allocate_info)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @quota_metrics = args[:quota_metrics] if args.key?(:quota_metrics)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
        end
      end
      
      # Common audit log format for Google Cloud Platform API operations.
      class AuditLog
        include Google::Apis::Core::Hashable
      
        # Authentication information for the operation.
        # Corresponds to the JSON property `authenticationInfo`
        # @return [Google::Apis::ServicecontrolV1::AuthenticationInfo]
        attr_accessor :authentication_info
      
        # Authorization information. If there are multiple
        # resources or permissions involved, then there is
        # one AuthorizationInfo element for each `resource, permission` tuple.
        # Corresponds to the JSON property `authorizationInfo`
        # @return [Array<Google::Apis::ServicecontrolV1::AuthorizationInfo>]
        attr_accessor :authorization_info
      
        # Other service-specific data about the request, response, and other
        # information associated with the current audited event.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The name of the service method or operation.
        # For API calls, this should be the name of the API method.
        # For example,
        # "google.datastore.v1.Datastore.RunQuery"
        # "google.logging.v1.LoggingService.DeleteLog"
        # Corresponds to the JSON property `methodName`
        # @return [String]
        attr_accessor :method_name
      
        # The number of items returned from a List or Query API method,
        # if applicable.
        # Corresponds to the JSON property `numResponseItems`
        # @return [Fixnum]
        attr_accessor :num_response_items
      
        # The operation request. This may not include all request parameters,
        # such as those that are too large, privacy-sensitive, or duplicated
        # elsewhere in the log record.
        # It should never include user-generated data, such as file contents.
        # When the JSON object represented here has a proto equivalent, the proto
        # name will be indicated in the `@type` property.
        # Corresponds to the JSON property `request`
        # @return [Hash<String,Object>]
        attr_accessor :request
      
        # Metadata about the request.
        # Corresponds to the JSON property `requestMetadata`
        # @return [Google::Apis::ServicecontrolV1::RequestMetadata]
        attr_accessor :request_metadata
      
        # Location information about a resource.
        # Corresponds to the JSON property `resourceLocation`
        # @return [Google::Apis::ServicecontrolV1::ResourceLocation]
        attr_accessor :resource_location
      
        # The resource or collection that is the target of the operation.
        # The name is a scheme-less URI, not including the API service name.
        # For example:
        # "shelves/SHELF_ID/books"
        # "shelves/SHELF_ID/books/BOOK_ID"
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        # The resource's original state before mutation. Present only for
        # operations which have successfully modified the targeted resource(s).
        # In general, this field should contain all changed fields, except those
        # that are already been included in `request`, `response`, `metadata` or
        # `service_data` fields.
        # When the JSON object represented here has a proto equivalent,
        # the proto name will be indicated in the `@type` property.
        # Corresponds to the JSON property `resourceOriginalState`
        # @return [Hash<String,Object>]
        attr_accessor :resource_original_state
      
        # The operation response. This may not include all response elements,
        # such as those that are too large, privacy-sensitive, or duplicated
        # elsewhere in the log record.
        # It should never include user-generated data, such as file contents.
        # When the JSON object represented here has a proto equivalent, the proto
        # name will be indicated in the `@type` property.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        # Deprecated, use `metadata` field instead.
        # Other service-specific data about the request, response, and other
        # activities.
        # Corresponds to the JSON property `serviceData`
        # @return [Hash<String,Object>]
        attr_accessor :service_data
      
        # The name of the API service performing the operation. For example,
        # `"datastore.googleapis.com"`.
        # Corresponds to the JSON property `serviceName`
        # @return [String]
        attr_accessor :service_name
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ServicecontrolV1::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authentication_info = args[:authentication_info] if args.key?(:authentication_info)
          @authorization_info = args[:authorization_info] if args.key?(:authorization_info)
          @metadata = args[:metadata] if args.key?(:metadata)
          @method_name = args[:method_name] if args.key?(:method_name)
          @num_response_items = args[:num_response_items] if args.key?(:num_response_items)
          @request = args[:request] if args.key?(:request)
          @request_metadata = args[:request_metadata] if args.key?(:request_metadata)
          @resource_location = args[:resource_location] if args.key?(:resource_location)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
          @resource_original_state = args[:resource_original_state] if args.key?(:resource_original_state)
          @response = args[:response] if args.key?(:response)
          @service_data = args[:service_data] if args.key?(:service_data)
          @service_name = args[:service_name] if args.key?(:service_name)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # This message defines request authentication attributes. Terminology is
      # based on the JSON Web Token (JWT) standard, but the terms also
      # correlate to concepts in other standards.
      class Auth
        include Google::Apis::Core::Hashable
      
        # A list of access level resource names that allow resources to be
        # accessed by authenticated requester. It is part of Secure GCP processing
        # for the incoming request. An access level string has the format:
        # "//`api_service_name`/accessPolicies/`policy_id`/accessLevels/`short_name`"
        # Example:
        # "//accesscontextmanager.googleapis.com/accessPolicies/MY_POLICY_ID/
        # accessLevels/MY_LEVEL"
        # Corresponds to the JSON property `accessLevels`
        # @return [Array<String>]
        attr_accessor :access_levels
      
        # The intended audience(s) for this authentication information. Reflects
        # the audience (`aud`) claim within a JWT. The audience
        # value(s) depends on the `issuer`, but typically include one or more of
        # the following pieces of information:
        # *  The services intended to receive the credential such as
        # ["pubsub.googleapis.com", "storage.googleapis.com"]
        # *  A set of service-based scopes. For example,
        # ["https://www.googleapis.com/auth/cloud-platform"]
        # *  The client id of an app, such as the Firebase project id for JWTs
        # from Firebase Auth.
        # Consult the documentation for the credential issuer to determine the
        # information provided.
        # Corresponds to the JSON property `audiences`
        # @return [Array<String>]
        attr_accessor :audiences
      
        # Structured claims presented with the credential. JWTs include
        # ``key: value`` pairs for standard and private claims. The following
        # is a subset of the standard required and optional claims that would
        # typically be presented for a Google-based JWT:
        # `'iss': 'accounts.google.com',
        # 'sub': '113289723416554971153',
        # 'aud': ['123456789012', 'pubsub.googleapis.com'],
        # 'azp': '123456789012.apps.googleusercontent.com',
        # 'email': 'jsmith@example.com',
        # 'iat': 1353601026,
        # 'exp': 1353604926`
        # SAML assertions are similarly specified, but with an identity provider
        # dependent structure.
        # Corresponds to the JSON property `claims`
        # @return [Hash<String,Object>]
        attr_accessor :claims
      
        # The authorized presenter of the credential. Reflects the optional
        # Authorized Presenter (`azp`) claim within a JWT or the
        # OAuth client id. For example, a Google Cloud Platform client id looks
        # as follows: "123456789012.apps.googleusercontent.com".
        # Corresponds to the JSON property `presenter`
        # @return [String]
        attr_accessor :presenter
      
        # The authenticated principal. Reflects the issuer (`iss`) and subject
        # (`sub`) claims within a JWT. The issuer and subject should be `/`
        # delimited, with `/` percent-encoded within the subject fragment. For
        # Google accounts, the principal format is:
        # "https://accounts.google.com/`id`"
        # Corresponds to the JSON property `principal`
        # @return [String]
        attr_accessor :principal
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_levels = args[:access_levels] if args.key?(:access_levels)
          @audiences = args[:audiences] if args.key?(:audiences)
          @claims = args[:claims] if args.key?(:claims)
          @presenter = args[:presenter] if args.key?(:presenter)
          @principal = args[:principal] if args.key?(:principal)
        end
      end
      
      # Authentication information for the operation.
      class AuthenticationInfo
        include Google::Apis::Core::Hashable
      
        # The authority selector specified by the requestor, if any.
        # It is not guaranteed that the principal was allowed to use this authority.
        # Corresponds to the JSON property `authoritySelector`
        # @return [String]
        attr_accessor :authority_selector
      
        # The email address of the authenticated user (or service account on behalf
        # of third party principal) making the request. For privacy reasons, the
        # principal email address is redacted for all read-only operations that fail
        # with a "permission denied" error.
        # Corresponds to the JSON property `principalEmail`
        # @return [String]
        attr_accessor :principal_email
      
        # Identity delegation history of an authenticated service account that makes
        # the request. It contains information on the real authorities that try to
        # access GCP resources by delegating on a service account. When multiple
        # authorities present, they are guaranteed to be sorted based on the original
        # ordering of the identity delegation events.
        # Corresponds to the JSON property `serviceAccountDelegationInfo`
        # @return [Array<Google::Apis::ServicecontrolV1::ServiceAccountDelegationInfo>]
        attr_accessor :service_account_delegation_info
      
        # The name of the service account key used to create or exchange
        # credentials for authenticating the service account making the request.
        # This is a scheme-less URI full resource name. For example:
        # "//iam.googleapis.com/projects/`PROJECT_ID`/serviceAccounts/`ACCOUNT`/keys/`
        # key`"
        # Corresponds to the JSON property `serviceAccountKeyName`
        # @return [String]
        attr_accessor :service_account_key_name
      
        # The third party identification (if any) of the authenticated user making
        # the request.
        # When the JSON object represented here has a proto equivalent, the proto
        # name will be indicated in the `@type` property.
        # Corresponds to the JSON property `thirdPartyPrincipal`
        # @return [Hash<String,Object>]
        attr_accessor :third_party_principal
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authority_selector = args[:authority_selector] if args.key?(:authority_selector)
          @principal_email = args[:principal_email] if args.key?(:principal_email)
          @service_account_delegation_info = args[:service_account_delegation_info] if args.key?(:service_account_delegation_info)
          @service_account_key_name = args[:service_account_key_name] if args.key?(:service_account_key_name)
          @third_party_principal = args[:third_party_principal] if args.key?(:third_party_principal)
        end
      end
      
      # Authorization information for the operation.
      class AuthorizationInfo
        include Google::Apis::Core::Hashable
      
        # Whether or not authorization for `resource` and `permission`
        # was granted.
        # Corresponds to the JSON property `granted`
        # @return [Boolean]
        attr_accessor :granted
        alias_method :granted?, :granted
      
        # The required IAM permission.
        # Corresponds to the JSON property `permission`
        # @return [String]
        attr_accessor :permission
      
        # The resource being accessed, as a REST-style string. For example:
        # bigquery.googleapis.com/projects/PROJECTID/datasets/DATASETID
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        # This message defines core attributes for a resource. A resource is an
        # addressable (named) entity provided by the destination service. For
        # example, a file stored on a network storage service.
        # Corresponds to the JSON property `resourceAttributes`
        # @return [Google::Apis::ServicecontrolV1::Resource]
        attr_accessor :resource_attributes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @granted = args[:granted] if args.key?(:granted)
          @permission = args[:permission] if args.key?(:permission)
          @resource = args[:resource] if args.key?(:resource)
          @resource_attributes = args[:resource_attributes] if args.key?(:resource_attributes)
        end
      end
      
      # Defines the errors to be returned in
      # google.api.servicecontrol.v1.CheckResponse.check_errors.
      class CheckError
        include Google::Apis::Core::Hashable
      
        # The error code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Free-form text providing details on the error cause of the error.
        # Corresponds to the JSON property `detail`
        # @return [String]
        attr_accessor :detail
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ServicecontrolV1::Status]
        attr_accessor :status
      
        # Subject to whom this error applies. See the specific code enum for more
        # details on this field. For example:
        # - “project:<project-id or project-number>”
        # - “folder:<folder-id>”
        # - “organization:<organization-id>”
        # Corresponds to the JSON property `subject`
        # @return [String]
        attr_accessor :subject
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @detail = args[:detail] if args.key?(:detail)
          @status = args[:status] if args.key?(:status)
          @subject = args[:subject] if args.key?(:subject)
        end
      end
      
      # Contains additional information about the check operation.
      class CheckInfo
        include Google::Apis::Core::Hashable
      
        # `ConsumerInfo` provides information about the consumer.
        # Corresponds to the JSON property `consumerInfo`
        # @return [Google::Apis::ServicecontrolV1::ConsumerInfo]
        attr_accessor :consumer_info
      
        # A list of fields and label keys that are ignored by the server.
        # The client doesn't need to send them for following requests to improve
        # performance and allow better aggregation.
        # Corresponds to the JSON property `unusedArguments`
        # @return [Array<String>]
        attr_accessor :unused_arguments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_info = args[:consumer_info] if args.key?(:consumer_info)
          @unused_arguments = args[:unused_arguments] if args.key?(:unused_arguments)
        end
      end
      
      # Request message for the Check method.
      class CheckRequest
        include Google::Apis::Core::Hashable
      
        # Represents information regarding an operation.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::ServicecontrolV1::Operation]
        attr_accessor :operation
      
        # Requests the project settings to be returned as part of the check response.
        # Corresponds to the JSON property `requestProjectSettings`
        # @return [Boolean]
        attr_accessor :request_project_settings
        alias_method :request_project_settings?, :request_project_settings
      
        # Specifies which version of service configuration should be used to process
        # the request.
        # If unspecified or no matching version can be found, the
        # latest one will be used.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        # Indicates if service activation check should be skipped for this request.
        # Default behavior is to perform the check and apply relevant quota.
        # WARNING: Setting this flag to "true" will disable quota enforcement.
        # Corresponds to the JSON property `skipActivationCheck`
        # @return [Boolean]
        attr_accessor :skip_activation_check
        alias_method :skip_activation_check?, :skip_activation_check
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation = args[:operation] if args.key?(:operation)
          @request_project_settings = args[:request_project_settings] if args.key?(:request_project_settings)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
          @skip_activation_check = args[:skip_activation_check] if args.key?(:skip_activation_check)
        end
      end
      
      # Response message for the Check method.
      class CheckResponse
        include Google::Apis::Core::Hashable
      
        # Indicate the decision of the check.
        # If no check errors are present, the service should process the operation.
        # Otherwise the service should use the list of errors to determine the
        # appropriate action.
        # Corresponds to the JSON property `checkErrors`
        # @return [Array<Google::Apis::ServicecontrolV1::CheckError>]
        attr_accessor :check_errors
      
        # Contains additional information about the check operation.
        # Corresponds to the JSON property `checkInfo`
        # @return [Google::Apis::ServicecontrolV1::CheckInfo]
        attr_accessor :check_info
      
        # The same operation_id value used in the CheckRequest.
        # Used for logging and diagnostics purposes.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Contains the quota information for a quota check response.
        # Corresponds to the JSON property `quotaInfo`
        # @return [Google::Apis::ServicecontrolV1::QuotaInfo]
        attr_accessor :quota_info
      
        # The actual config id used to process the request.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        # Unimplemented. The current service rollout id used to process the request.
        # Corresponds to the JSON property `serviceRolloutId`
        # @return [String]
        attr_accessor :service_rollout_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @check_errors = args[:check_errors] if args.key?(:check_errors)
          @check_info = args[:check_info] if args.key?(:check_info)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @quota_info = args[:quota_info] if args.key?(:quota_info)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
          @service_rollout_id = args[:service_rollout_id] if args.key?(:service_rollout_id)
        end
      end
      
      # `ConsumerInfo` provides information about the consumer.
      class ConsumerInfo
        include Google::Apis::Core::Hashable
      
        # The consumer identity number, can be Google cloud project number, folder
        # number or organization number e.g. 1234567890. A value of 0 indicates no
        # consumer number is found.
        # Corresponds to the JSON property `consumerNumber`
        # @return [Fixnum]
        attr_accessor :consumer_number
      
        # The Google cloud project number, e.g. 1234567890. A value of 0 indicates
        # no project number is found.
        # NOTE: This field is deprecated after Chemist support flexible consumer
        # id. New code should not depend on this field anymore.
        # Corresponds to the JSON property `projectNumber`
        # @return [Fixnum]
        attr_accessor :project_number
      
        # The type of the consumer which should have been defined in
        # [Google Resource Manager](https://cloud.google.com/resource-manager/).
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_number = args[:consumer_number] if args.key?(:consumer_number)
          @project_number = args[:project_number] if args.key?(:project_number)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Distribution represents a frequency distribution of double-valued sample
      # points. It contains the size of the population of sample points plus
      # additional optional information:
      # - the arithmetic mean of the samples
      # - the minimum and maximum of the samples
      # - the sum-squared-deviation of the samples, used to compute variance
      # - a histogram of the values of the sample points
      class Distribution
        include Google::Apis::Core::Hashable
      
        # The number of samples in each histogram bucket. `bucket_counts` are
        # optional. If present, they must sum to the `count` value.
        # The buckets are defined below in `bucket_option`. There are N buckets.
        # `bucket_counts[0]` is the number of samples in the underflow bucket.
        # `bucket_counts[1]` to `bucket_counts[N-1]` are the numbers of samples
        # in each of the finite buckets. And `bucket_counts[N] is the number
        # of samples in the overflow bucket. See the comments of `bucket_option`
        # below for more details.
        # Any suffix of trailing zeros may be omitted.
        # Corresponds to the JSON property `bucketCounts`
        # @return [Array<Fixnum>]
        attr_accessor :bucket_counts
      
        # The total number of samples in the distribution. Must be >= 0.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Example points. Must be in increasing order of `value` field.
        # Corresponds to the JSON property `exemplars`
        # @return [Array<Google::Apis::ServicecontrolV1::Exemplar>]
        attr_accessor :exemplars
      
        # Describing buckets with arbitrary user-provided width.
        # Corresponds to the JSON property `explicitBuckets`
        # @return [Google::Apis::ServicecontrolV1::ExplicitBuckets]
        attr_accessor :explicit_buckets
      
        # Describing buckets with exponentially growing width.
        # Corresponds to the JSON property `exponentialBuckets`
        # @return [Google::Apis::ServicecontrolV1::ExponentialBuckets]
        attr_accessor :exponential_buckets
      
        # Describing buckets with constant width.
        # Corresponds to the JSON property `linearBuckets`
        # @return [Google::Apis::ServicecontrolV1::LinearBuckets]
        attr_accessor :linear_buckets
      
        # The maximum of the population of values. Ignored if `count` is zero.
        # Corresponds to the JSON property `maximum`
        # @return [Float]
        attr_accessor :maximum
      
        # The arithmetic mean of the samples in the distribution. If `count` is
        # zero then this field must be zero.
        # Corresponds to the JSON property `mean`
        # @return [Float]
        attr_accessor :mean
      
        # The minimum of the population of values. Ignored if `count` is zero.
        # Corresponds to the JSON property `minimum`
        # @return [Float]
        attr_accessor :minimum
      
        # The sum of squared deviations from the mean:
        # Sum[i=1..count]((x_i - mean)^2)
        # where each x_i is a sample values. If `count` is zero then this field
        # must be zero, otherwise validation of the request fails.
        # Corresponds to the JSON property `sumOfSquaredDeviation`
        # @return [Float]
        attr_accessor :sum_of_squared_deviation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_counts = args[:bucket_counts] if args.key?(:bucket_counts)
          @count = args[:count] if args.key?(:count)
          @exemplars = args[:exemplars] if args.key?(:exemplars)
          @explicit_buckets = args[:explicit_buckets] if args.key?(:explicit_buckets)
          @exponential_buckets = args[:exponential_buckets] if args.key?(:exponential_buckets)
          @linear_buckets = args[:linear_buckets] if args.key?(:linear_buckets)
          @maximum = args[:maximum] if args.key?(:maximum)
          @mean = args[:mean] if args.key?(:mean)
          @minimum = args[:minimum] if args.key?(:minimum)
          @sum_of_squared_deviation = args[:sum_of_squared_deviation] if args.key?(:sum_of_squared_deviation)
        end
      end
      
      # Exemplars are example points that may be used to annotate aggregated
      # distribution values. They are metadata that gives information about a
      # particular value added to a Distribution bucket, such as a trace ID that
      # was active when a value was added. They may contain further information,
      # such as a example values and timestamps, origin, etc.
      class Exemplar
        include Google::Apis::Core::Hashable
      
        # Contextual information about the example value. Examples are:
        # Trace: type.googleapis.com/google.monitoring.v3.SpanContext
        # Literal string: type.googleapis.com/google.protobuf.StringValue
        # Labels dropped during aggregation:
        # type.googleapis.com/google.monitoring.v3.DroppedLabels
        # There may be only a single attachment of any given message type in a
        # single exemplar, and this is enforced by the system.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :attachments
      
        # The observation (sampling) time of the above value.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Value of the exemplar point. This value determines to which bucket the
        # exemplar belongs.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments = args[:attachments] if args.key?(:attachments)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Describing buckets with arbitrary user-provided width.
      class ExplicitBuckets
        include Google::Apis::Core::Hashable
      
        # 'bound' is a list of strictly increasing boundaries between
        # buckets. Note that a list of length N-1 defines N buckets because
        # of fenceposting. See comments on `bucket_options` for details.
        # The i'th finite bucket covers the interval
        # [bound[i-1], bound[i])
        # where i ranges from 1 to bound_size() - 1. Note that there are no
        # finite buckets at all if 'bound' only contains a single element; in
        # that special case the single bound defines the boundary between the
        # underflow and overflow buckets.
        # bucket number                   lower bound    upper bound
        # i == 0 (underflow)              -inf           bound[i]
        # 0 < i < bound_size()            bound[i-1]     bound[i]
        # i == bound_size() (overflow)    bound[i-1]     +inf
        # Corresponds to the JSON property `bounds`
        # @return [Array<Float>]
        attr_accessor :bounds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounds = args[:bounds] if args.key?(:bounds)
        end
      end
      
      # Describing buckets with exponentially growing width.
      class ExponentialBuckets
        include Google::Apis::Core::Hashable
      
        # The i'th exponential bucket covers the interval
        # [scale * growth_factor^(i-1), scale * growth_factor^i)
        # where i ranges from 1 to num_finite_buckets inclusive.
        # Must be larger than 1.0.
        # Corresponds to the JSON property `growthFactor`
        # @return [Float]
        attr_accessor :growth_factor
      
        # The number of finite buckets. With the underflow and overflow buckets,
        # the total number of buckets is `num_finite_buckets` + 2.
        # See comments on `bucket_options` for details.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # The i'th exponential bucket covers the interval
        # [scale * growth_factor^(i-1), scale * growth_factor^i)
        # where i ranges from 1 to num_finite_buckets inclusive.
        # Must be > 0.
        # Corresponds to the JSON property `scale`
        # @return [Float]
        attr_accessor :scale
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @growth_factor = args[:growth_factor] if args.key?(:growth_factor)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @scale = args[:scale] if args.key?(:scale)
        end
      end
      
      # First party identity principal.
      class FirstPartyPrincipal
        include Google::Apis::Core::Hashable
      
        # The email address of a Google account.
        # .
        # Corresponds to the JSON property `principalEmail`
        # @return [String]
        attr_accessor :principal_email
      
        # Metadata about the service that uses the service account.
        # .
        # Corresponds to the JSON property `serviceMetadata`
        # @return [Hash<String,Object>]
        attr_accessor :service_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @principal_email = args[:principal_email] if args.key?(:principal_email)
          @service_metadata = args[:service_metadata] if args.key?(:service_metadata)
        end
      end
      
      # A common proto for logging HTTP requests. Only contains semantics
      # defined by the HTTP specification. Product-specific logging
      # information MUST be defined in a separate message.
      class HttpRequest
        include Google::Apis::Core::Hashable
      
        # The number of HTTP response bytes inserted into cache. Set only when a
        # cache fill was attempted.
        # Corresponds to the JSON property `cacheFillBytes`
        # @return [Fixnum]
        attr_accessor :cache_fill_bytes
      
        # Whether or not an entity was served from cache
        # (with or without validation).
        # Corresponds to the JSON property `cacheHit`
        # @return [Boolean]
        attr_accessor :cache_hit
        alias_method :cache_hit?, :cache_hit
      
        # Whether or not a cache lookup was attempted.
        # Corresponds to the JSON property `cacheLookup`
        # @return [Boolean]
        attr_accessor :cache_lookup
        alias_method :cache_lookup?, :cache_lookup
      
        # Whether or not the response was validated with the origin server before
        # being served from cache. This field is only meaningful if `cache_hit` is
        # True.
        # Corresponds to the JSON property `cacheValidatedWithOriginServer`
        # @return [Boolean]
        attr_accessor :cache_validated_with_origin_server
        alias_method :cache_validated_with_origin_server?, :cache_validated_with_origin_server
      
        # The request processing latency on the server, from the time the request was
        # received until the response was sent.
        # Corresponds to the JSON property `latency`
        # @return [String]
        attr_accessor :latency
      
        # Protocol used for the request. Examples: "HTTP/1.1", "HTTP/2", "websocket"
        # Corresponds to the JSON property `protocol`
        # @return [String]
        attr_accessor :protocol
      
        # The referer URL of the request, as defined in
        # [HTTP/1.1 Header Field
        # Definitions](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).
        # Corresponds to the JSON property `referer`
        # @return [String]
        attr_accessor :referer
      
        # The IP address (IPv4 or IPv6) of the client that issued the HTTP
        # request. Examples: `"192.168.1.1"`, `"FE80::0202:B3FF:FE1E:8329"`.
        # Corresponds to the JSON property `remoteIp`
        # @return [String]
        attr_accessor :remote_ip
      
        # The request method. Examples: `"GET"`, `"HEAD"`, `"PUT"`, `"POST"`.
        # Corresponds to the JSON property `requestMethod`
        # @return [String]
        attr_accessor :request_method
      
        # The size of the HTTP request message in bytes, including the request
        # headers and the request body.
        # Corresponds to the JSON property `requestSize`
        # @return [Fixnum]
        attr_accessor :request_size
      
        # The scheme (http, https), the host name, the path, and the query
        # portion of the URL that was requested.
        # Example: `"http://example.com/some/info?color=red"`.
        # Corresponds to the JSON property `requestUrl`
        # @return [String]
        attr_accessor :request_url
      
        # The size of the HTTP response message sent back to the client, in bytes,
        # including the response headers and the response body.
        # Corresponds to the JSON property `responseSize`
        # @return [Fixnum]
        attr_accessor :response_size
      
        # The IP address (IPv4 or IPv6) of the origin server that the request was
        # sent to.
        # Corresponds to the JSON property `serverIp`
        # @return [String]
        attr_accessor :server_ip
      
        # The response code indicating the status of the response.
        # Examples: 200, 404.
        # Corresponds to the JSON property `status`
        # @return [Fixnum]
        attr_accessor :status
      
        # The user agent sent by the client. Example:
        # `"Mozilla/4.0 (compatible; MSIE 6.0; Windows 98; Q312461; .NET
        # CLR 1.0.3705)"`.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_fill_bytes = args[:cache_fill_bytes] if args.key?(:cache_fill_bytes)
          @cache_hit = args[:cache_hit] if args.key?(:cache_hit)
          @cache_lookup = args[:cache_lookup] if args.key?(:cache_lookup)
          @cache_validated_with_origin_server = args[:cache_validated_with_origin_server] if args.key?(:cache_validated_with_origin_server)
          @latency = args[:latency] if args.key?(:latency)
          @protocol = args[:protocol] if args.key?(:protocol)
          @referer = args[:referer] if args.key?(:referer)
          @remote_ip = args[:remote_ip] if args.key?(:remote_ip)
          @request_method = args[:request_method] if args.key?(:request_method)
          @request_size = args[:request_size] if args.key?(:request_size)
          @request_url = args[:request_url] if args.key?(:request_url)
          @response_size = args[:response_size] if args.key?(:response_size)
          @server_ip = args[:server_ip] if args.key?(:server_ip)
          @status = args[:status] if args.key?(:status)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
        end
      end
      
      # Describing buckets with constant width.
      class LinearBuckets
        include Google::Apis::Core::Hashable
      
        # The number of finite buckets. With the underflow and overflow buckets,
        # the total number of buckets is `num_finite_buckets` + 2.
        # See comments on `bucket_options` for details.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # The i'th linear bucket covers the interval
        # [offset + (i-1) * width, offset + i * width)
        # where i ranges from 1 to num_finite_buckets, inclusive.
        # Corresponds to the JSON property `offset`
        # @return [Float]
        attr_accessor :offset
      
        # The i'th linear bucket covers the interval
        # [offset + (i-1) * width, offset + i * width)
        # where i ranges from 1 to num_finite_buckets, inclusive.
        # Must be strictly positive.
        # Corresponds to the JSON property `width`
        # @return [Float]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @offset = args[:offset] if args.key?(:offset)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # An individual log entry.
      class LogEntry
        include Google::Apis::Core::Hashable
      
        # A common proto for logging HTTP requests. Only contains semantics
        # defined by the HTTP specification. Product-specific logging
        # information MUST be defined in a separate message.
        # Corresponds to the JSON property `httpRequest`
        # @return [Google::Apis::ServicecontrolV1::HttpRequest]
        attr_accessor :http_request
      
        # A unique ID for the log entry used for deduplication. If omitted,
        # the implementation will generate one based on operation_id.
        # Corresponds to the JSON property `insertId`
        # @return [String]
        attr_accessor :insert_id
      
        # A set of user-defined (key, value) data that provides additional
        # information about the log entry.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The log to which this log entry belongs. Examples: `"syslog"`,
        # `"book_log"`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Additional information about a potentially long-running operation with which
        # a log entry is associated.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::ServicecontrolV1::LogEntryOperation]
        attr_accessor :operation
      
        # The log entry payload, represented as a protocol buffer that is
        # expressed as a JSON object. The only accepted type currently is
        # AuditLog.
        # Corresponds to the JSON property `protoPayload`
        # @return [Hash<String,Object>]
        attr_accessor :proto_payload
      
        # The severity of the log entry. The default value is
        # `LogSeverity.DEFAULT`.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Additional information about the source code location that produced the log
        # entry.
        # Corresponds to the JSON property `sourceLocation`
        # @return [Google::Apis::ServicecontrolV1::LogEntrySourceLocation]
        attr_accessor :source_location
      
        # The log entry payload, represented as a structure that
        # is expressed as a JSON object.
        # Corresponds to the JSON property `structPayload`
        # @return [Hash<String,Object>]
        attr_accessor :struct_payload
      
        # The log entry payload, represented as a Unicode string (UTF-8).
        # Corresponds to the JSON property `textPayload`
        # @return [String]
        attr_accessor :text_payload
      
        # The time the event described by the log entry occurred. If
        # omitted, defaults to operation start time.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Optional. Resource name of the trace associated with the log entry, if any.
        # If this field contains a relative resource name, you can assume the name is
        # relative to `//tracing.googleapis.com`. Example:
        # `projects/my-projectid/traces/06796866738c859f2f19b7cfb3214824`
        # Corresponds to the JSON property `trace`
        # @return [String]
        attr_accessor :trace
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_request = args[:http_request] if args.key?(:http_request)
          @insert_id = args[:insert_id] if args.key?(:insert_id)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @operation = args[:operation] if args.key?(:operation)
          @proto_payload = args[:proto_payload] if args.key?(:proto_payload)
          @severity = args[:severity] if args.key?(:severity)
          @source_location = args[:source_location] if args.key?(:source_location)
          @struct_payload = args[:struct_payload] if args.key?(:struct_payload)
          @text_payload = args[:text_payload] if args.key?(:text_payload)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @trace = args[:trace] if args.key?(:trace)
        end
      end
      
      # Additional information about a potentially long-running operation with which
      # a log entry is associated.
      class LogEntryOperation
        include Google::Apis::Core::Hashable
      
        # Optional. Set this to True if this is the first log entry in the operation.
        # Corresponds to the JSON property `first`
        # @return [Boolean]
        attr_accessor :first
        alias_method :first?, :first
      
        # Optional. An arbitrary operation identifier. Log entries with the
        # same identifier are assumed to be part of the same operation.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Optional. Set this to True if this is the last log entry in the operation.
        # Corresponds to the JSON property `last`
        # @return [Boolean]
        attr_accessor :last
        alias_method :last?, :last
      
        # Optional. An arbitrary producer identifier. The combination of
        # `id` and `producer` must be globally unique.  Examples for `producer`:
        # `"MyDivision.MyBigCompany.com"`, `"github.com/MyProject/MyApplication"`.
        # Corresponds to the JSON property `producer`
        # @return [String]
        attr_accessor :producer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @first = args[:first] if args.key?(:first)
          @id = args[:id] if args.key?(:id)
          @last = args[:last] if args.key?(:last)
          @producer = args[:producer] if args.key?(:producer)
        end
      end
      
      # Additional information about the source code location that produced the log
      # entry.
      class LogEntrySourceLocation
        include Google::Apis::Core::Hashable
      
        # Optional. Source file name. Depending on the runtime environment, this
        # might be a simple name or a fully-qualified name.
        # Corresponds to the JSON property `file`
        # @return [String]
        attr_accessor :file
      
        # Optional. Human-readable name of the function or method being invoked, with
        # optional context such as the class or package name. This information may be
        # used in contexts such as the logs viewer, where a file and line number are
        # less meaningful. The format can vary by language. For example:
        # `qual.if.ied.Class.method` (Java), `dir/package.func` (Go), `function`
        # (Python).
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # Optional. Line within the source file. 1-based; 0 indicates no line number
        # available.
        # Corresponds to the JSON property `line`
        # @return [Fixnum]
        attr_accessor :line
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file = args[:file] if args.key?(:file)
          @function = args[:function] if args.key?(:function)
          @line = args[:line] if args.key?(:line)
        end
      end
      
      # Represents a single metric value.
      class MetricValue
        include Google::Apis::Core::Hashable
      
        # A boolean value.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # Distribution represents a frequency distribution of double-valued sample
        # points. It contains the size of the population of sample points plus
        # additional optional information:
        # - the arithmetic mean of the samples
        # - the minimum and maximum of the samples
        # - the sum-squared-deviation of the samples, used to compute variance
        # - a histogram of the values of the sample points
        # Corresponds to the JSON property `distributionValue`
        # @return [Google::Apis::ServicecontrolV1::Distribution]
        attr_accessor :distribution_value
      
        # A double precision floating point value.
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # The end of the time period over which this metric value's measurement
        # applies.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # A signed 64-bit integer value.
        # Corresponds to the JSON property `int64Value`
        # @return [Fixnum]
        attr_accessor :int64_value
      
        # The labels describing the metric value.
        # See comments on google.api.servicecontrol.v1.Operation.labels for
        # the overriding relationship.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `moneyValue`
        # @return [Google::Apis::ServicecontrolV1::Money]
        attr_accessor :money_value
      
        # The start of the time period over which this metric value's measurement
        # applies. The time period has different semantics for different metric
        # types (cumulative, delta, and gauge). See the metric definition
        # documentation in the service configuration for details.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # A text string value.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @distribution_value = args[:distribution_value] if args.key?(:distribution_value)
          @double_value = args[:double_value] if args.key?(:double_value)
          @end_time = args[:end_time] if args.key?(:end_time)
          @int64_value = args[:int64_value] if args.key?(:int64_value)
          @labels = args[:labels] if args.key?(:labels)
          @money_value = args[:money_value] if args.key?(:money_value)
          @start_time = args[:start_time] if args.key?(:start_time)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # Represents a set of metric values in the same metric.
      # Each metric value in the set should have a unique combination of start time,
      # end time, and label values.
      class MetricValueSet
        include Google::Apis::Core::Hashable
      
        # The metric name defined in the service configuration.
        # Corresponds to the JSON property `metricName`
        # @return [String]
        attr_accessor :metric_name
      
        # The values in this metric.
        # Corresponds to the JSON property `metricValues`
        # @return [Array<Google::Apis::ServicecontrolV1::MetricValue>]
        attr_accessor :metric_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_name = args[:metric_name] if args.key?(:metric_name)
          @metric_values = args[:metric_values] if args.key?(:metric_values)
        end
      end
      
      # Represents an amount of money with its currency type.
      class Money
        include Google::Apis::Core::Hashable
      
        # The 3-letter currency code defined in ISO 4217.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # Number of nano (10^-9) units of the amount.
        # The value must be between -999,999,999 and +999,999,999 inclusive.
        # If `units` is positive, `nanos` must be positive or zero.
        # If `units` is zero, `nanos` can be positive, zero, or negative.
        # If `units` is negative, `nanos` must be negative or zero.
        # For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # The whole units of the amount.
        # For example if `currencyCode` is `"USD"`, then 1 unit is one US dollar.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @nanos = args[:nanos] if args.key?(:nanos)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Represents information regarding an operation.
      class Operation
        include Google::Apis::Core::Hashable
      
        # Identity of the consumer who is using the service.
        # This field should be filled in for the operations initiated by a
        # consumer, but not for service-initiated operations that are
        # not related to a specific consumer.
        # - This can be in one of the following formats:
        # - project:PROJECT_ID,
        # - project`_`number:PROJECT_NUMBER,
        # - projects/PROJECT_ID or PROJECT_NUMBER,
        # - folders/FOLDER_NUMBER,
        # - organizations/ORGANIZATION_NUMBER,
        # - api`_`key:API_KEY.
        # Corresponds to the JSON property `consumerId`
        # @return [String]
        attr_accessor :consumer_id
      
        # End time of the operation.
        # Required when the operation is used in ServiceController.Report,
        # but optional when the operation is used in ServiceController.Check.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # DO NOT USE. This is an experimental field.
        # Corresponds to the JSON property `importance`
        # @return [String]
        attr_accessor :importance
      
        # Labels describing the operation. Only the following labels are allowed:
        # - Labels describing monitored resources as defined in
        # the service configuration.
        # - Default labels of metric values. When specified, labels defined in the
        # metric value override these default.
        # - The following labels defined by Google Cloud Platform:
        # - `cloud.googleapis.com/location` describing the location where the
        # operation happened,
        # - `servicecontrol.googleapis.com/user_agent` describing the user agent
        # of the API request,
        # - `servicecontrol.googleapis.com/service_agent` describing the service
        # used to handle the API request (e.g. ESP),
        # - `servicecontrol.googleapis.com/platform` describing the platform
        # where the API is served, such as App Engine, Compute Engine, or
        # Kubernetes Engine.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Represents information to be logged.
        # Corresponds to the JSON property `logEntries`
        # @return [Array<Google::Apis::ServicecontrolV1::LogEntry>]
        attr_accessor :log_entries
      
        # Represents information about this operation. Each MetricValueSet
        # corresponds to a metric defined in the service configuration.
        # The data type used in the MetricValueSet must agree with
        # the data type specified in the metric definition.
        # Within a single operation, it is not allowed to have more than one
        # MetricValue instances that have the same metric names and identical
        # label value combinations. If a request has such duplicated MetricValue
        # instances, the entire request is rejected with
        # an invalid argument error.
        # Corresponds to the JSON property `metricValueSets`
        # @return [Array<Google::Apis::ServicecontrolV1::MetricValueSet>]
        attr_accessor :metric_value_sets
      
        # Identity of the operation. This must be unique within the scope of the
        # service that generated the operation. If the service calls
        # Check() and Report() on the same operation, the two calls should carry
        # the same id.
        # UUID version 4 is recommended, though not required.
        # In scenarios where an operation is computed from existing information
        # and an idempotent id is desirable for deduplication purpose, UUID version 5
        # is recommended. See RFC 4122 for details.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Fully qualified name of the operation. Reserved for future use.
        # Corresponds to the JSON property `operationName`
        # @return [String]
        attr_accessor :operation_name
      
        # Represents the properties needed for quota operations.
        # Corresponds to the JSON property `quotaProperties`
        # @return [Google::Apis::ServicecontrolV1::QuotaProperties]
        attr_accessor :quota_properties
      
        # The resources that are involved in the operation.
        # The maximum supported number of entries in this field is 100.
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::ServicecontrolV1::ResourceInfo>]
        attr_accessor :resources
      
        # Required. Start time of the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # User defined labels for the resource that this operation is associated
        # with. Only a combination of 1000 user labels per consumer project are
        # allowed.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_id = args[:consumer_id] if args.key?(:consumer_id)
          @end_time = args[:end_time] if args.key?(:end_time)
          @importance = args[:importance] if args.key?(:importance)
          @labels = args[:labels] if args.key?(:labels)
          @log_entries = args[:log_entries] if args.key?(:log_entries)
          @metric_value_sets = args[:metric_value_sets] if args.key?(:metric_value_sets)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @operation_name = args[:operation_name] if args.key?(:operation_name)
          @quota_properties = args[:quota_properties] if args.key?(:quota_properties)
          @resources = args[:resources] if args.key?(:resources)
          @start_time = args[:start_time] if args.key?(:start_time)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # This message defines attributes for a node that handles a network request.
      # The node can be either a service or an application that sends, forwards,
      # or receives the request. Service peers should fill in
      # `principal` and `labels` as appropriate.
      class Peer
        include Google::Apis::Core::Hashable
      
        # The IP address of the peer.
        # Corresponds to the JSON property `ip`
        # @return [String]
        attr_accessor :ip
      
        # The labels associated with the peer.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The network port of the peer.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # The identity of this peer. Similar to `Request.auth.principal`, but
        # relative to the peer instead of the request. For example, the
        # idenity associated with a load balancer that forwared the request.
        # Corresponds to the JSON property `principal`
        # @return [String]
        attr_accessor :principal
      
        # The CLDR country/region code associated with the above IP address.
        # If the IP address is private, the `region_code` should reflect the
        # physical location where this peer is running.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip = args[:ip] if args.key?(:ip)
          @labels = args[:labels] if args.key?(:labels)
          @port = args[:port] if args.key?(:port)
          @principal = args[:principal] if args.key?(:principal)
          @region_code = args[:region_code] if args.key?(:region_code)
        end
      end
      
      # Represents error information for QuotaOperation.
      class QuotaError
        include Google::Apis::Core::Hashable
      
        # Error code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Free-form text that provides details on the cause of the error.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Subject to whom this error applies. See the specific enum for more details
        # on this field. For example, "clientip:<ip address of client>" or
        # "project:<Google developer project id>".
        # Corresponds to the JSON property `subject`
        # @return [String]
        attr_accessor :subject
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @description = args[:description] if args.key?(:description)
          @subject = args[:subject] if args.key?(:subject)
        end
      end
      
      # Contains the quota information for a quota check response.
      class QuotaInfo
        include Google::Apis::Core::Hashable
      
        # Quota Metrics that have exceeded quota limits.
        # For QuotaGroup-based quota, this is QuotaGroup.name
        # For QuotaLimit-based quota, this is QuotaLimit.name
        # See: google.api.Quota
        # Deprecated: Use quota_metrics to get per quota group limit exceeded status.
        # Corresponds to the JSON property `limitExceeded`
        # @return [Array<String>]
        attr_accessor :limit_exceeded
      
        # Map of quota group name to the actual number of tokens consumed. If the
        # quota check was not successful, then this will not be populated due to no
        # quota consumption.
        # We are not merging this field with 'quota_metrics' field because of the
        # complexity of scaling in Chemist client code base. For simplicity, we will
        # keep this field for Castor (that scales quota usage) and 'quota_metrics'
        # for SuperQuota (that doesn't scale quota usage).
        # Corresponds to the JSON property `quotaConsumed`
        # @return [Hash<String,Fixnum>]
        attr_accessor :quota_consumed
      
        # Quota metrics to indicate the usage. Depending on the check request, one or
        # more of the following metrics will be included:
        # 1. For rate quota, per quota group or per quota metric incremental usage
        # will be specified using the following delta metric:
        # "serviceruntime.googleapis.com/api/consumer/quota_used_count"
        # 2. For allocation quota, per quota metric total usage will be specified
        # using the following gauge metric:
        # "serviceruntime.googleapis.com/allocation/consumer/quota_used_count"
        # 3. For both rate quota and allocation quota, the quota limit reached
        # condition will be specified using the following boolean metric:
        # "serviceruntime.googleapis.com/quota/exceeded"
        # Corresponds to the JSON property `quotaMetrics`
        # @return [Array<Google::Apis::ServicecontrolV1::MetricValueSet>]
        attr_accessor :quota_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @limit_exceeded = args[:limit_exceeded] if args.key?(:limit_exceeded)
          @quota_consumed = args[:quota_consumed] if args.key?(:quota_consumed)
          @quota_metrics = args[:quota_metrics] if args.key?(:quota_metrics)
        end
      end
      
      # Represents information regarding a quota operation.
      class QuotaOperation
        include Google::Apis::Core::Hashable
      
        # Identity of the consumer for whom this quota operation is being performed.
        # This can be in one of the following formats:
        # project:<project_id>,
        # project_number:<project_number>,
        # api_key:<api_key>.
        # Corresponds to the JSON property `consumerId`
        # @return [String]
        attr_accessor :consumer_id
      
        # Labels describing the operation.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Fully qualified name of the API method for which this quota operation is
        # requested. This name is used for matching quota rules or metric rules and
        # billing status rules defined in service configuration.
        # This field should not be set if any of the following is true:
        # (1) the quota operation is performed on non-API resources.
        # (2) quota_metrics is set because the caller is doing quota override.
        # Example of an RPC method name:
        # google.example.library.v1.LibraryService.CreateShelf
        # Corresponds to the JSON property `methodName`
        # @return [String]
        attr_accessor :method_name
      
        # Identity of the operation. This is expected to be unique within the scope
        # of the service that generated the operation, and guarantees idempotency in
        # case of retries.
        # In order to ensure best performance and latency in the Quota backends,
        # operation_ids are optimally associated with time, so that related
        # operations can be accessed fast in storage. For this reason, the
        # recommended token for services that intend to operate at a high QPS is
        # Unix time in nanos + UUID
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Represents information about this operation. Each MetricValueSet
        # corresponds to a metric defined in the service configuration.
        # The data type used in the MetricValueSet must agree with
        # the data type specified in the metric definition.
        # Within a single operation, it is not allowed to have more than one
        # MetricValue instances that have the same metric names and identical
        # label value combinations. If a request has such duplicated MetricValue
        # instances, the entire request is rejected with
        # an invalid argument error.
        # This field is mutually exclusive with method_name.
        # Corresponds to the JSON property `quotaMetrics`
        # @return [Array<Google::Apis::ServicecontrolV1::MetricValueSet>]
        attr_accessor :quota_metrics
      
        # Quota mode for this operation.
        # Corresponds to the JSON property `quotaMode`
        # @return [String]
        attr_accessor :quota_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_id = args[:consumer_id] if args.key?(:consumer_id)
          @labels = args[:labels] if args.key?(:labels)
          @method_name = args[:method_name] if args.key?(:method_name)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @quota_metrics = args[:quota_metrics] if args.key?(:quota_metrics)
          @quota_mode = args[:quota_mode] if args.key?(:quota_mode)
        end
      end
      
      # Represents the properties needed for quota operations.
      class QuotaProperties
        include Google::Apis::Core::Hashable
      
        # Quota mode for this operation.
        # Corresponds to the JSON property `quotaMode`
        # @return [String]
        attr_accessor :quota_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quota_mode = args[:quota_mode] if args.key?(:quota_mode)
        end
      end
      
      # Represents the processing error of one Operation in the request.
      class ReportError
        include Google::Apis::Core::Hashable
      
        # The Operation.operation_id value from the request.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ServicecontrolV1::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Contains additional info about the report operation.
      class ReportInfo
        include Google::Apis::Core::Hashable
      
        # The Operation.operation_id value from the request.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Contains the quota information for a quota check response.
        # Corresponds to the JSON property `quotaInfo`
        # @return [Google::Apis::ServicecontrolV1::QuotaInfo]
        attr_accessor :quota_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @quota_info = args[:quota_info] if args.key?(:quota_info)
        end
      end
      
      # Request message for the Report method.
      class ReportRequest
        include Google::Apis::Core::Hashable
      
        # Operations to be reported.
        # Typically the service should report one operation per request.
        # Putting multiple operations into a single request is allowed, but should
        # be used only when multiple operations are natually available at the time
        # of the report.
        # If multiple operations are in a single request, the total request size
        # should be no larger than 1MB. See ReportResponse.report_errors for
        # partial failure behavior.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::ServicecontrolV1::Operation>]
        attr_accessor :operations
      
        # Specifies which version of service config should be used to process the
        # request.
        # If unspecified or no matching version can be found, the
        # latest one will be used.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operations = args[:operations] if args.key?(:operations)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
        end
      end
      
      # Response message for the Report method.
      class ReportResponse
        include Google::Apis::Core::Hashable
      
        # Partial failures, one for each `Operation` in the request that failed
        # processing. There are three possible combinations of the RPC status:
        # 1. The combination of a successful RPC status and an empty `report_errors`
        # list indicates a complete success where all `Operations` in the
        # request are processed successfully.
        # 2. The combination of a successful RPC status and a non-empty
        # `report_errors` list indicates a partial success where some
        # `Operations` in the request succeeded. Each
        # `Operation` that failed processing has a corresponding item
        # in this list.
        # 3. A failed RPC status indicates a general non-deterministic failure.
        # When this happens, it's impossible to know which of the
        # 'Operations' in the request succeeded or failed.
        # Corresponds to the JSON property `reportErrors`
        # @return [Array<Google::Apis::ServicecontrolV1::ReportError>]
        attr_accessor :report_errors
      
        # Quota usage for each quota release `Operation` request.
        # Fully or partially failed quota release request may or may not be present
        # in `report_quota_info`. For example, a failed quota release request will
        # have the current quota usage info when precise quota library returns the
        # info. A deadline exceeded quota request will not have quota usage info.
        # If there is no quota release request, report_quota_info will be empty.
        # Corresponds to the JSON property `reportInfos`
        # @return [Array<Google::Apis::ServicecontrolV1::ReportInfo>]
        attr_accessor :report_infos
      
        # The actual config id used to process the request.
        # Corresponds to the JSON property `serviceConfigId`
        # @return [String]
        attr_accessor :service_config_id
      
        # Unimplemented. The current service rollout id used to process the request.
        # Corresponds to the JSON property `serviceRolloutId`
        # @return [String]
        attr_accessor :service_rollout_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @report_errors = args[:report_errors] if args.key?(:report_errors)
          @report_infos = args[:report_infos] if args.key?(:report_infos)
          @service_config_id = args[:service_config_id] if args.key?(:service_config_id)
          @service_rollout_id = args[:service_rollout_id] if args.key?(:service_rollout_id)
        end
      end
      
      # This message defines attributes for an HTTP request. If the actual
      # request is not an HTTP request, the runtime system should try to map
      # the actual request to an equivalent HTTP request.
      class Request
        include Google::Apis::Core::Hashable
      
        # This message defines request authentication attributes. Terminology is
        # based on the JSON Web Token (JWT) standard, but the terms also
        # correlate to concepts in other standards.
        # Corresponds to the JSON property `auth`
        # @return [Google::Apis::ServicecontrolV1::Auth]
        attr_accessor :auth
      
        # The HTTP request headers. If multiple headers share the same key, they
        # must be merged according to the HTTP spec. All header keys must be
        # lowercased, because HTTP header keys are case-insensitive.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # The HTTP request `Host` header value.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The unique ID for a request, which can be propagated to downstream
        # systems. The ID should have low probability of collision
        # within a single day for a specific service.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The HTTP request method, such as `GET`, `POST`.
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # The HTTP URL path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The network protocol used with the request, such as "http/1.1",
        # "spdy/3", "h2", "h2c", "webrtc", "tcp", "udp", "quic". See
        # https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-
        # values.xhtml#alpn-protocol-ids
        # for details.
        # Corresponds to the JSON property `protocol`
        # @return [String]
        attr_accessor :protocol
      
        # The HTTP URL query in the format of `name1=value`&name2=value2`, as it
        # appears in the first line of the HTTP request. No decoding is performed.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # A special parameter for request reason. It is used by security systems
        # to associate auditing information with a request.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # The HTTP URL scheme, such as `http` and `https`.
        # Corresponds to the JSON property `scheme`
        # @return [String]
        attr_accessor :scheme
      
        # The HTTP request size in bytes. If unknown, it must be -1.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        # The timestamp when the `destination` service receives the first byte of
        # the request.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth = args[:auth] if args.key?(:auth)
          @headers = args[:headers] if args.key?(:headers)
          @host = args[:host] if args.key?(:host)
          @id = args[:id] if args.key?(:id)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @path = args[:path] if args.key?(:path)
          @protocol = args[:protocol] if args.key?(:protocol)
          @query = args[:query] if args.key?(:query)
          @reason = args[:reason] if args.key?(:reason)
          @scheme = args[:scheme] if args.key?(:scheme)
          @size = args[:size] if args.key?(:size)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # Metadata about the request.
      class RequestMetadata
        include Google::Apis::Core::Hashable
      
        # The IP address of the caller.
        # For caller from internet, this will be public IPv4 or IPv6 address.
        # For caller from a Compute Engine VM with external IP address, this
        # will be the VM's external IP address. For caller from a Compute
        # Engine VM without external IP address, if the VM is in the same
        # organization (or project) as the accessed resource, `caller_ip` will
        # be the VM's internal IPv4 address, otherwise the `caller_ip` will be
        # redacted to "gce-internal-ip".
        # See https://cloud.google.com/compute/docs/vpc/ for more information.
        # Corresponds to the JSON property `callerIp`
        # @return [String]
        attr_accessor :caller_ip
      
        # The network of the caller.
        # Set only if the network host project is part of the same GCP organization
        # (or project) as the accessed resource.
        # See https://cloud.google.com/compute/docs/vpc/ for more information.
        # This is a scheme-less URI full resource name. For example:
        # "//compute.googleapis.com/projects/PROJECT_ID/global/networks/NETWORK_ID"
        # Corresponds to the JSON property `callerNetwork`
        # @return [String]
        attr_accessor :caller_network
      
        # The user agent of the caller.
        # This information is not authenticated and should be treated accordingly.
        # For example:
        # +   `google-api-python-client/1.4.0`:
        # The request was made by the Google API client for Python.
        # +   `Cloud SDK Command Line Tool apitools-client/1.0 gcloud/0.9.62`:
        # The request was made by the Google Cloud SDK CLI (gcloud).
        # +   `AppEngine-Google; (+http://code.google.com/appengine; appid:
        # s~my-project`:
        # The request was made from the `my-project` App Engine app.
        # NOLINT
        # Corresponds to the JSON property `callerSuppliedUserAgent`
        # @return [String]
        attr_accessor :caller_supplied_user_agent
      
        # This message defines attributes for a node that handles a network request.
        # The node can be either a service or an application that sends, forwards,
        # or receives the request. Service peers should fill in
        # `principal` and `labels` as appropriate.
        # Corresponds to the JSON property `destinationAttributes`
        # @return [Google::Apis::ServicecontrolV1::Peer]
        attr_accessor :destination_attributes
      
        # This message defines attributes for an HTTP request. If the actual
        # request is not an HTTP request, the runtime system should try to map
        # the actual request to an equivalent HTTP request.
        # Corresponds to the JSON property `requestAttributes`
        # @return [Google::Apis::ServicecontrolV1::Request]
        attr_accessor :request_attributes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @caller_ip = args[:caller_ip] if args.key?(:caller_ip)
          @caller_network = args[:caller_network] if args.key?(:caller_network)
          @caller_supplied_user_agent = args[:caller_supplied_user_agent] if args.key?(:caller_supplied_user_agent)
          @destination_attributes = args[:destination_attributes] if args.key?(:destination_attributes)
          @request_attributes = args[:request_attributes] if args.key?(:request_attributes)
        end
      end
      
      # This message defines core attributes for a resource. A resource is an
      # addressable (named) entity provided by the destination service. For
      # example, a file stored on a network storage service.
      class Resource
        include Google::Apis::Core::Hashable
      
        # The labels or tags on the resource, such as AWS resource tags and
        # Kubernetes resource labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The stable identifier (name) of a resource on the `service`. A resource
        # can be logically identified as "//`resource.service`/`resource.name`".
        # The differences between a resource name and a URI are:
        # *   Resource name is a logical identifier, independent of network
        # protocol and API version. For example,
        # `//pubsub.googleapis.com/projects/123/topics/news-feed`.
        # *   URI often includes protocol and version information, so it can
        # be used directly by applications. For example,
        # `https://pubsub.googleapis.com/v1/projects/123/topics/news-feed`.
        # See https://cloud.google.com/apis/design/resource_names for details.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The name of the service that this resource belongs to, such as
        # `pubsub.googleapis.com`. The service may be different from the DNS
        # hostname that actually serves the request.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        # The type of the resource. The syntax is platform-specific because
        # different platforms define their resources differently.
        # For Google APIs, the type format must be "`service`/`kind`".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @service = args[:service] if args.key?(:service)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Describes a resource associated with this operation.
      class ResourceInfo
        include Google::Apis::Core::Hashable
      
        # The identifier of the parent of this resource instance.
        # Must be in one of the following formats:
        # - “projects/<project-id or project-number>”
        # - “folders/<folder-id>”
        # - “organizations/<organization-id>”
        # Corresponds to the JSON property `resourceContainer`
        # @return [String]
        attr_accessor :resource_container
      
        # The location of the resource. If not empty, the resource will be checked
        # against location policy. The value must be a valid zone, region or
        # multiregion. For example: "europe-west4" or "northamerica-northeast1-a"
        # Corresponds to the JSON property `resourceLocation`
        # @return [String]
        attr_accessor :resource_location
      
        # Name of the resource. This is used for auditing purposes.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_container = args[:resource_container] if args.key?(:resource_container)
          @resource_location = args[:resource_location] if args.key?(:resource_location)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # Location information about a resource.
      class ResourceLocation
        include Google::Apis::Core::Hashable
      
        # The locations of a resource after the execution of the operation.
        # Requests to create or delete a location based resource must populate
        # the 'current_locations' field and not the 'original_locations' field.
        # For example:
        # "europe-west1-a"
        # "us-east1"
        # "nam3"
        # Corresponds to the JSON property `currentLocations`
        # @return [Array<String>]
        attr_accessor :current_locations
      
        # The locations of a resource prior to the execution of the operation.
        # Requests that mutate the resource's location must populate both the
        # 'original_locations' as well as the 'current_locations' fields.
        # For example:
        # "europe-west1-a"
        # "us-east1"
        # "nam3"
        # Corresponds to the JSON property `originalLocations`
        # @return [Array<String>]
        attr_accessor :original_locations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_locations = args[:current_locations] if args.key?(:current_locations)
          @original_locations = args[:original_locations] if args.key?(:original_locations)
        end
      end
      
      # Identity delegation history of an authenticated service account.
      class ServiceAccountDelegationInfo
        include Google::Apis::Core::Hashable
      
        # First party identity principal.
        # Corresponds to the JSON property `firstPartyPrincipal`
        # @return [Google::Apis::ServicecontrolV1::FirstPartyPrincipal]
        attr_accessor :first_party_principal
      
        # Third party identity principal.
        # Corresponds to the JSON property `thirdPartyPrincipal`
        # @return [Google::Apis::ServicecontrolV1::ThirdPartyPrincipal]
        attr_accessor :third_party_principal
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @first_party_principal = args[:first_party_principal] if args.key?(:first_party_principal)
          @third_party_principal = args[:third_party_principal] if args.key?(:third_party_principal)
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
      
      # Third party identity principal.
      class ThirdPartyPrincipal
        include Google::Apis::Core::Hashable
      
        # Metadata about third party identity.
        # Corresponds to the JSON property `thirdPartyClaims`
        # @return [Hash<String,Object>]
        attr_accessor :third_party_claims
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @third_party_claims = args[:third_party_claims] if args.key?(:third_party_claims)
        end
      end
    end
  end
end
