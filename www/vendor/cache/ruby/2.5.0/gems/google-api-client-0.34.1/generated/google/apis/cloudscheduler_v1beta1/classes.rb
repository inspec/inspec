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
    module CloudschedulerV1beta1
      
      # App Engine target. The job will be pushed to a job handler by means
      # of an HTTP request via an http_method such
      # as HTTP POST, HTTP GET, etc. The job is acknowledged by means of an
      # HTTP response code in the range [200 - 299]. Error 503 is
      # considered an App Engine system error instead of an application
      # error. Requests returning error 503 will be retried regardless of
      # retry configuration and not counted against retry counts. Any other
      # response code, or a failure to receive a response before the
      # deadline, constitutes a failed attempt.
      class AppEngineHttpTarget
        include Google::Apis::Core::Hashable
      
        # App Engine Routing.
        # For more information about services, versions, and instances see
        # [An Overview of App
        # Engine](https://cloud.google.com/appengine/docs/python/an-overview-of-app-
        # engine),
        # [Microservices Architecture on Google App
        # Engine](https://cloud.google.com/appengine/docs/python/microservices-on-app-
        # engine),
        # [App Engine Standard request
        # routing](https://cloud.google.com/appengine/docs/standard/python/how-requests-
        # are-routed),
        # and [App Engine Flex request
        # routing](https://cloud.google.com/appengine/docs/flexible/python/how-requests-
        # are-routed).
        # Corresponds to the JSON property `appEngineRouting`
        # @return [Google::Apis::CloudschedulerV1beta1::AppEngineRouting]
        attr_accessor :app_engine_routing
      
        # Body.
        # HTTP request body. A request body is allowed only if the HTTP method is
        # POST or PUT. It will result in invalid argument error to set a body on a
        # job with an incompatible HttpMethod.
        # Corresponds to the JSON property `body`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :body
      
        # HTTP request headers.
        # This map contains the header field names and values. Headers can be set
        # when the job is created.
        # Cloud Scheduler sets some headers to default values:
        # * `User-Agent`: By default, this header is
        # `"AppEngine-Google; (+http://code.google.com/appengine)"`.
        # This header can be modified, but Cloud Scheduler will append
        # `"AppEngine-Google; (+http://code.google.com/appengine)"` to the
        # modified `User-Agent`.
        # * `X-CloudScheduler`: This header will be set to true.
        # If the job has an body, Cloud Scheduler sets
        # the following headers:
        # * `Content-Type`: By default, the `Content-Type` header is set to
        # `"application/octet-stream"`. The default can be overridden by explictly
        # setting `Content-Type` to a particular media type when the job is
        # created.
        # For example, `Content-Type` can be set to `"application/json"`.
        # * `Content-Length`: This is computed by Cloud Scheduler. This value is
        # output only. It cannot be changed.
        # The headers below are output only. They cannot be set or overridden:
        # * `X-Google-*`: For Google internal use only.
        # * `X-AppEngine-*`: For Google internal use only.
        # In addition, some App Engine headers, which contain
        # job-specific information, are also be sent to the job handler.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # The HTTP method to use for the request. PATCH and OPTIONS are not
        # permitted.
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # The relative URI.
        # The relative URL must begin with "/" and must be a valid HTTP relative URL.
        # It can contain a path, query string arguments, and `#` fragments.
        # If the relative URL is empty, then the root path "/" will be used.
        # No spaces are allowed, and the maximum length allowed is 2083 characters.
        # Corresponds to the JSON property `relativeUri`
        # @return [String]
        attr_accessor :relative_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_routing = args[:app_engine_routing] if args.key?(:app_engine_routing)
          @body = args[:body] if args.key?(:body)
          @headers = args[:headers] if args.key?(:headers)
          @http_method = args[:http_method] if args.key?(:http_method)
          @relative_uri = args[:relative_uri] if args.key?(:relative_uri)
        end
      end
      
      # App Engine Routing.
      # For more information about services, versions, and instances see
      # [An Overview of App
      # Engine](https://cloud.google.com/appengine/docs/python/an-overview-of-app-
      # engine),
      # [Microservices Architecture on Google App
      # Engine](https://cloud.google.com/appengine/docs/python/microservices-on-app-
      # engine),
      # [App Engine Standard request
      # routing](https://cloud.google.com/appengine/docs/standard/python/how-requests-
      # are-routed),
      # and [App Engine Flex request
      # routing](https://cloud.google.com/appengine/docs/flexible/python/how-requests-
      # are-routed).
      class AppEngineRouting
        include Google::Apis::Core::Hashable
      
        # Output only. The host that the job is sent to.
        # For more information about how App Engine requests are routed, see
        # [here](https://cloud.google.com/appengine/docs/standard/python/how-requests-
        # are-routed).
        # The host is constructed as:
        # * `host = [application_domain_name]`</br>
        # `| [service] + '.' + [application_domain_name]`</br>
        # `| [version] + '.' + [application_domain_name]`</br>
        # `| [version_dot_service]+ '.' + [application_domain_name]`</br>
        # `| [instance] + '.' + [application_domain_name]`</br>
        # `| [instance_dot_service] + '.' + [application_domain_name]`</br>
        # `| [instance_dot_version] + '.' + [application_domain_name]`</br>
        # `| [instance_dot_version_dot_service] + '.' + [application_domain_name]`
        # * `application_domain_name` = The domain name of the app, for
        # example <app-id>.appspot.com, which is associated with the
        # job's project ID.
        # * `service =` service
        # * `version =` version
        # * `version_dot_service =`
        # version `+ '.' +`
        # service
        # * `instance =` instance
        # * `instance_dot_service =`
        # instance `+ '.' +`
        # service
        # * `instance_dot_version =`
        # instance `+ '.' +`
        # version
        # * `instance_dot_version_dot_service =`
        # instance `+ '.' +`
        # version `+ '.' +`
        # service
        # If service is empty, then the job will be sent
        # to the service which is the default service when the job is attempted.
        # If version is empty, then the job will be sent
        # to the version which is the default version when the job is attempted.
        # If instance is empty, then the job will be
        # sent to an instance which is available when the job is attempted.
        # If service,
        # version, or
        # instance is invalid, then the job will be sent
        # to the default version of the default service when the job is attempted.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # App instance.
        # By default, the job is sent to an instance which is available when
        # the job is attempted.
        # Requests can only be sent to a specific instance if
        # [manual scaling is used in App Engine
        # Standard](https://cloud.google.com/appengine/docs/python/an-overview-of-app-
        # engine?hl=en_US#scaling_types_and_instance_classes).
        # App Engine Flex does not support instances. For more information, see
        # [App Engine Standard request
        # routing](https://cloud.google.com/appengine/docs/standard/python/how-requests-
        # are-routed)
        # and [App Engine Flex request
        # routing](https://cloud.google.com/appengine/docs/flexible/python/how-requests-
        # are-routed).
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # App service.
        # By default, the job is sent to the service which is the default
        # service when the job is attempted.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        # App version.
        # By default, the job is sent to the version which is the default
        # version when the job is attempted.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @instance = args[:instance] if args.key?(:instance)
          @service = args[:service] if args.key?(:service)
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
      
      # Http target. The job will be pushed to the job handler by means of
      # an HTTP request via an http_method such as HTTP
      # POST, HTTP GET, etc. The job is acknowledged by means of an HTTP
      # response code in the range [200 - 299]. A failure to receive a response
      # constitutes a failed execution. For a redirected request, the response
      # returned by the redirected request is considered.
      class HttpTarget
        include Google::Apis::Core::Hashable
      
        # HTTP request body. A request body is allowed only if the HTTP
        # method is POST, PUT, or PATCH. It is an error to set body on a job with an
        # incompatible HttpMethod.
        # Corresponds to the JSON property `body`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :body
      
        # The user can specify HTTP request headers to send with the job's
        # HTTP request. This map contains the header field names and
        # values. Repeated headers are not supported, but a header value can
        # contain commas. These headers represent a subset of the headers
        # that will accompany the job's HTTP request. Some HTTP request
        # headers will be ignored or replaced. A partial list of headers that
        # will be ignored or replaced is below:
        # - Host: This will be computed by Cloud Scheduler and derived from
        # uri.
        # * `Content-Length`: This will be computed by Cloud Scheduler.
        # * `User-Agent`: This will be set to `"Google-Cloud-Scheduler"`.
        # * `X-Google-*`: Google internal use only.
        # * `X-AppEngine-*`: Google internal use only.
        # The total size of headers must be less than 80KB.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # Which HTTP method to use for the request.
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # Contains information needed for generating an
        # [OAuth token](https://developers.google.com/identity/protocols/OAuth2).
        # This type of authorization should generally only be used when calling Google
        # APIs hosted on *.googleapis.com.
        # Corresponds to the JSON property `oauthToken`
        # @return [Google::Apis::CloudschedulerV1beta1::OAuthToken]
        attr_accessor :oauth_token
      
        # Contains information needed for generating an
        # [OpenID Connect
        # token](https://developers.google.com/identity/protocols/OpenIDConnect).
        # This type of authorization can be used for many scenarios, including
        # calling Cloud Run, or endpoints where you intend to validate the token
        # yourself.
        # Corresponds to the JSON property `oidcToken`
        # @return [Google::Apis::CloudschedulerV1beta1::OidcToken]
        attr_accessor :oidc_token
      
        # Required. The full URI path that the request will be sent to. This string
        # must begin with either "http://" or "https://". Some examples of
        # valid values for uri are:
        # `http://acme.com` and `https://acme.com/sales:8080`. Cloud Scheduler will
        # encode some characters for safety and compatibility. The maximum allowed
        # URL length is 2083 characters after encoding.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @headers = args[:headers] if args.key?(:headers)
          @http_method = args[:http_method] if args.key?(:http_method)
          @oauth_token = args[:oauth_token] if args.key?(:oauth_token)
          @oidc_token = args[:oidc_token] if args.key?(:oidc_token)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Configuration for a job.
      # The maximum allowed size for a job is 100KB.
      class Job
        include Google::Apis::Core::Hashable
      
        # App Engine target. The job will be pushed to a job handler by means
        # of an HTTP request via an http_method such
        # as HTTP POST, HTTP GET, etc. The job is acknowledged by means of an
        # HTTP response code in the range [200 - 299]. Error 503 is
        # considered an App Engine system error instead of an application
        # error. Requests returning error 503 will be retried regardless of
        # retry configuration and not counted against retry counts. Any other
        # response code, or a failure to receive a response before the
        # deadline, constitutes a failed attempt.
        # Corresponds to the JSON property `appEngineHttpTarget`
        # @return [Google::Apis::CloudschedulerV1beta1::AppEngineHttpTarget]
        attr_accessor :app_engine_http_target
      
        # The deadline for job attempts. If the request handler does not respond by
        # this deadline then the request is cancelled and the attempt is marked as a
        # `DEADLINE_EXCEEDED` failure. The failed attempt can be viewed in
        # execution logs. Cloud Scheduler will retry the job according
        # to the RetryConfig.
        # The allowed duration for this deadline is:
        # * For HTTP targets, between 15 seconds and 30 minutes.
        # * For App Engine HTTP targets, between 15
        # seconds and 24 hours.
        # * For PubSub targets, this field is ignored.
        # Corresponds to the JSON property `attemptDeadline`
        # @return [String]
        attr_accessor :attempt_deadline
      
        # Optionally caller-specified in CreateJob or
        # UpdateJob.
        # A human-readable description for the job. This string must not contain
        # more than 500 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Http target. The job will be pushed to the job handler by means of
        # an HTTP request via an http_method such as HTTP
        # POST, HTTP GET, etc. The job is acknowledged by means of an HTTP
        # response code in the range [200 - 299]. A failure to receive a response
        # constitutes a failed execution. For a redirected request, the response
        # returned by the redirected request is considered.
        # Corresponds to the JSON property `httpTarget`
        # @return [Google::Apis::CloudschedulerV1beta1::HttpTarget]
        attr_accessor :http_target
      
        # Output only. The time the last job attempt started.
        # Corresponds to the JSON property `lastAttemptTime`
        # @return [String]
        attr_accessor :last_attempt_time
      
        # Optionally caller-specified in CreateJob, after
        # which it becomes output only.
        # The job name. For example:
        # `projects/PROJECT_ID/locations/LOCATION_ID/jobs/JOB_ID`.
        # * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
        # hyphens (-), colons (:), or periods (.).
        # For more information, see
        # [Identifying
        # projects](https://cloud.google.com/resource-manager/docs/creating-managing-
        # projects#identifying_projects)
        # * `LOCATION_ID` is the canonical ID for the job's location.
        # The list of available locations can be obtained by calling
        # ListLocations.
        # For more information, see https://cloud.google.com/about/locations/.
        # * `JOB_ID` can contain only letters ([A-Za-z]), numbers ([0-9]),
        # hyphens (-), or underscores (_). The maximum length is 500 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Pub/Sub target. The job will be delivered by publishing a message to
        # the given Pub/Sub topic.
        # Corresponds to the JSON property `pubsubTarget`
        # @return [Google::Apis::CloudschedulerV1beta1::PubsubTarget]
        attr_accessor :pubsub_target
      
        # Settings that determine the retry behavior.
        # By default, if a job does not complete successfully (meaning that
        # an acknowledgement is not received from the handler, then it will be retried
        # with exponential backoff according to the settings in RetryConfig.
        # Corresponds to the JSON property `retryConfig`
        # @return [Google::Apis::CloudschedulerV1beta1::RetryConfig]
        attr_accessor :retry_config
      
        # Required, except when used with UpdateJob.
        # Describes the schedule on which the job will be executed.
        # The schedule can be either of the following types:
        # * [Crontab](http://en.wikipedia.org/wiki/Cron#Overview)
        # * English-like
        # [schedule](https://cloud.google.com/scheduler/docs/configuring/cron-job-
        # schedules)
        # As a general rule, execution `n + 1` of a job will not begin
        # until execution `n` has finished. Cloud Scheduler will never
        # allow two simultaneously outstanding executions. For example,
        # this implies that if the `n+1`th execution is scheduled to run at
        # 16:00 but the `n`th execution takes until 16:15, the `n+1`th
        # execution will not start until `16:15`.
        # A scheduled start time will be delayed if the previous
        # execution has not ended when its scheduled time occurs.
        # If retry_count > 0 and a job attempt fails,
        # the job will be tried a total of retry_count
        # times, with exponential backoff, until the next scheduled start
        # time.
        # Corresponds to the JSON property `schedule`
        # @return [String]
        attr_accessor :schedule
      
        # Output only. The next time the job is scheduled. Note that this may be a
        # retry of a previously failed attempt or the next execution time
        # according to the schedule.
        # Corresponds to the JSON property `scheduleTime`
        # @return [String]
        attr_accessor :schedule_time
      
        # Output only. State of the job.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::CloudschedulerV1beta1::Status]
        attr_accessor :status
      
        # Specifies the time zone to be used in interpreting
        # schedule. The value of this field must be a time
        # zone name from the [tz database](http://en.wikipedia.org/wiki/Tz_database).
        # Note that some time zones include a provision for
        # daylight savings time. The rules for daylight saving time are
        # determined by the chosen tz. For UTC use the string "utc". If a
        # time zone is not specified, the default will be in UTC (also known
        # as GMT).
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        # Output only. The creation time of the job.
        # Corresponds to the JSON property `userUpdateTime`
        # @return [String]
        attr_accessor :user_update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_http_target = args[:app_engine_http_target] if args.key?(:app_engine_http_target)
          @attempt_deadline = args[:attempt_deadline] if args.key?(:attempt_deadline)
          @description = args[:description] if args.key?(:description)
          @http_target = args[:http_target] if args.key?(:http_target)
          @last_attempt_time = args[:last_attempt_time] if args.key?(:last_attempt_time)
          @name = args[:name] if args.key?(:name)
          @pubsub_target = args[:pubsub_target] if args.key?(:pubsub_target)
          @retry_config = args[:retry_config] if args.key?(:retry_config)
          @schedule = args[:schedule] if args.key?(:schedule)
          @schedule_time = args[:schedule_time] if args.key?(:schedule_time)
          @state = args[:state] if args.key?(:state)
          @status = args[:status] if args.key?(:status)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
          @user_update_time = args[:user_update_time] if args.key?(:user_update_time)
        end
      end
      
      # Response message for listing jobs using ListJobs.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # The list of jobs.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::CloudschedulerV1beta1::Job>]
        attr_accessor :jobs
      
        # A token to retrieve next page of results. Pass this value in the
        # page_token field in the subsequent call to
        # ListJobs to retrieve the next page of results.
        # If this is empty it indicates that there are no more results
        # through which to paginate.
        # The page token is valid for only 2 hours.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::CloudschedulerV1beta1::Location>]
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
      
      # Contains information needed for generating an
      # [OAuth token](https://developers.google.com/identity/protocols/OAuth2).
      # This type of authorization should generally only be used when calling Google
      # APIs hosted on *.googleapis.com.
      class OAuthToken
        include Google::Apis::Core::Hashable
      
        # OAuth scope to be used for generating OAuth access token.
        # If not specified, "https://www.googleapis.com/auth/cloud-platform"
        # will be used.
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        # [Service account email](https://cloud.google.com/iam/docs/service-accounts)
        # to be used for generating OAuth token.
        # The service account must be within the same project as the job. The caller
        # must have iam.serviceAccounts.actAs permission for the service account.
        # Corresponds to the JSON property `serviceAccountEmail`
        # @return [String]
        attr_accessor :service_account_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @scope = args[:scope] if args.key?(:scope)
          @service_account_email = args[:service_account_email] if args.key?(:service_account_email)
        end
      end
      
      # Contains information needed for generating an
      # [OpenID Connect
      # token](https://developers.google.com/identity/protocols/OpenIDConnect).
      # This type of authorization can be used for many scenarios, including
      # calling Cloud Run, or endpoints where you intend to validate the token
      # yourself.
      class OidcToken
        include Google::Apis::Core::Hashable
      
        # Audience to be used when generating OIDC token. If not specified, the URI
        # specified in target will be used.
        # Corresponds to the JSON property `audience`
        # @return [String]
        attr_accessor :audience
      
        # [Service account email](https://cloud.google.com/iam/docs/service-accounts)
        # to be used for generating OIDC token.
        # The service account must be within the same project as the job. The caller
        # must have iam.serviceAccounts.actAs permission for the service account.
        # Corresponds to the JSON property `serviceAccountEmail`
        # @return [String]
        attr_accessor :service_account_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audience = args[:audience] if args.key?(:audience)
          @service_account_email = args[:service_account_email] if args.key?(:service_account_email)
        end
      end
      
      # Request message for PauseJob.
      class PauseJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A message that is published by publishers and consumed by subscribers. The
      # message must contain either a non-empty data field or at least one attribute.
      # Note that client libraries represent this object differently
      # depending on the language. See the corresponding
      # <a href="https://cloud.google.com/pubsub/docs/reference/libraries">client
      # library documentation</a> for more information. See
      # <a href="https://cloud.google.com/pubsub/quotas">Quotas and limits</a>
      # for more information about message limits.
      class PubsubMessage
        include Google::Apis::Core::Hashable
      
        # Optional attributes for this message.
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # The message data field. If this field is empty, the message must contain
        # at least one attribute.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # ID of this message, assigned by the server when the message is published.
        # Guaranteed to be unique within the topic. This value may be read by a
        # subscriber that receives a `PubsubMessage` via a `Pull` call or a push
        # delivery. It must not be populated by the publisher in a `Publish` call.
        # Corresponds to the JSON property `messageId`
        # @return [String]
        attr_accessor :message_id
      
        # The time at which the message was published, populated by the server when
        # it receives the `Publish` call. It must not be populated by the
        # publisher in a `Publish` call.
        # Corresponds to the JSON property `publishTime`
        # @return [String]
        attr_accessor :publish_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @data = args[:data] if args.key?(:data)
          @message_id = args[:message_id] if args.key?(:message_id)
          @publish_time = args[:publish_time] if args.key?(:publish_time)
        end
      end
      
      # Pub/Sub target. The job will be delivered by publishing a message to
      # the given Pub/Sub topic.
      class PubsubTarget
        include Google::Apis::Core::Hashable
      
        # Attributes for PubsubMessage.
        # Pubsub message must contain either non-empty data, or at least one
        # attribute.
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # The message payload for PubsubMessage.
        # Pubsub message must contain either non-empty data, or at least one
        # attribute.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Required. The name of the Cloud Pub/Sub topic to which messages will
        # be published when a job is delivered. The topic name must be in the
        # same format as required by PubSub's
        # [PublishRequest.name](https://cloud.google.com/pubsub/docs/reference/rpc/
        # google.pubsub.v1#publishrequest),
        # for example `projects/PROJECT_ID/topics/TOPIC_ID`.
        # The topic must be in the same project as the Cloud Scheduler job.
        # Corresponds to the JSON property `topicName`
        # @return [String]
        attr_accessor :topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @data = args[:data] if args.key?(:data)
          @topic_name = args[:topic_name] if args.key?(:topic_name)
        end
      end
      
      # Request message for ResumeJob.
      class ResumeJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Settings that determine the retry behavior.
      # By default, if a job does not complete successfully (meaning that
      # an acknowledgement is not received from the handler, then it will be retried
      # with exponential backoff according to the settings in RetryConfig.
      class RetryConfig
        include Google::Apis::Core::Hashable
      
        # The maximum amount of time to wait before retrying a job after
        # it fails.
        # The default value of this field is 1 hour.
        # Corresponds to the JSON property `maxBackoffDuration`
        # @return [String]
        attr_accessor :max_backoff_duration
      
        # The time between retries will double `max_doublings` times.
        # A job's retry interval starts at
        # min_backoff_duration, then doubles
        # `max_doublings` times, then increases linearly, and finally
        # retries retries at intervals of
        # max_backoff_duration up to
        # retry_count times.
        # For example, if min_backoff_duration is
        # 10s, max_backoff_duration is 300s, and
        # `max_doublings` is 3, then the a job will first be retried in 10s. The
        # retry interval will double three times, and then increase linearly by
        # 2^3 * 10s.  Finally, the job will retry at intervals of
        # max_backoff_duration until the job has
        # been attempted retry_count times. Thus, the
        # requests will retry at 10s, 20s, 40s, 80s, 160s, 240s, 300s, 300s, ....
        # The default value of this field is 5.
        # Corresponds to the JSON property `maxDoublings`
        # @return [Fixnum]
        attr_accessor :max_doublings
      
        # The time limit for retrying a failed job, measured from time when an
        # execution was first attempted. If specified with
        # retry_count, the job will be retried until both
        # limits are reached.
        # The default value for max_retry_duration is zero, which means retry
        # duration is unlimited.
        # Corresponds to the JSON property `maxRetryDuration`
        # @return [String]
        attr_accessor :max_retry_duration
      
        # The minimum amount of time to wait before retrying a job after
        # it fails.
        # The default value of this field is 5 seconds.
        # Corresponds to the JSON property `minBackoffDuration`
        # @return [String]
        attr_accessor :min_backoff_duration
      
        # The number of attempts that the system will make to run a job using the
        # exponential backoff procedure described by
        # max_doublings.
        # The default value of retry_count is zero.
        # If retry_count is zero, a job attempt will *not* be retried if
        # it fails. Instead the Cloud Scheduler system will wait for the
        # next scheduled execution time.
        # If retry_count is set to a non-zero number then Cloud Scheduler
        # will retry failed attempts, using exponential backoff,
        # retry_count times, or until the next scheduled execution time,
        # whichever comes first.
        # Values greater than 5 and negative values are not allowed.
        # Corresponds to the JSON property `retryCount`
        # @return [Fixnum]
        attr_accessor :retry_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_backoff_duration = args[:max_backoff_duration] if args.key?(:max_backoff_duration)
          @max_doublings = args[:max_doublings] if args.key?(:max_doublings)
          @max_retry_duration = args[:max_retry_duration] if args.key?(:max_retry_duration)
          @min_backoff_duration = args[:min_backoff_duration] if args.key?(:min_backoff_duration)
          @retry_count = args[:retry_count] if args.key?(:retry_count)
        end
      end
      
      # Request message for forcing a job to run now using
      # RunJob.
      class RunJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
    end
  end
end
