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
    module CloudtasksV2beta3
      
      # App Engine HTTP queue.
      # The task will be delivered to the App Engine application hostname
      # specified by its AppEngineHttpQueue and AppEngineHttpRequest.
      # The documentation for AppEngineHttpRequest explains how the
      # task's host URL is constructed.
      # Using AppEngineHttpQueue requires
      # [`appengine.applications.get`](https://cloud.google.com/appengine/docs/admin-
      # api/access-control)
      # Google IAM permission for the project
      # and the following scope:
      # `https://www.googleapis.com/auth/cloud-platform`
      class AppEngineHttpQueue
        include Google::Apis::Core::Hashable
      
        # App Engine Routing.
        # Defines routing characteristics specific to App Engine - service, version,
        # and instance.
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
        # Corresponds to the JSON property `appEngineRoutingOverride`
        # @return [Google::Apis::CloudtasksV2beta3::AppEngineRouting]
        attr_accessor :app_engine_routing_override
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_routing_override = args[:app_engine_routing_override] if args.key?(:app_engine_routing_override)
        end
      end
      
      # App Engine HTTP request.
      # The message defines the HTTP request that is sent to an App Engine app when
      # the task is dispatched.
      # Using AppEngineHttpRequest requires
      # [`appengine.applications.get`](https://cloud.google.com/appengine/docs/admin-
      # api/access-control)
      # Google IAM permission for the project
      # and the following scope:
      # `https://www.googleapis.com/auth/cloud-platform`
      # The task will be delivered to the App Engine app which belongs to the same
      # project as the queue. For more information, see
      # [How Requests are
      # Routed](https://cloud.google.com/appengine/docs/standard/python/how-requests-
      # are-routed)
      # and how routing is affected by
      # [dispatch
      # files](https://cloud.google.com/appengine/docs/python/config/dispatchref).
      # Traffic is encrypted during transport and never leaves Google datacenters.
      # Because this traffic is carried over a communication mechanism internal to
      # Google, you cannot explicitly set the protocol (for example, HTTP or HTTPS).
      # The request to the handler, however, will appear to have used the HTTP
      # protocol.
      # The AppEngineRouting used to construct the URL that the task is
      # delivered to can be set at the queue-level or task-level:
      # * If set,
      # app_engine_routing_override
      # is used for all tasks in the queue, no matter what the setting
      # is for the
      # task-level app_engine_routing.
      # The `url` that the task will be sent to is:
      # * `url =` host `+`
      # relative_uri
      # Tasks can be dispatched to secure app handlers, unsecure app handlers, and
      # URIs restricted with
      # [`login:
      # admin`](https://cloud.google.com/appengine/docs/standard/python/config/appref).
      # Because tasks are not run as any user, they cannot be dispatched to URIs
      # restricted with
      # [`login:
      # required`](https://cloud.google.com/appengine/docs/standard/python/config/
      # appref)
      # Task dispatches also do not follow redirects.
      # The task attempt has succeeded if the app's request handler returns an HTTP
      # response code in the range [`200` - `299`]. The task attempt has failed if
      # the app's handler returns a non-2xx response code or Cloud Tasks does
      # not receive response before the deadline. Failed
      # tasks will be retried according to the
      # retry configuration. `503` (Service Unavailable) is
      # considered an App Engine system error instead of an application error and
      # will cause Cloud Tasks' traffic congestion control to temporarily throttle
      # the queue's dispatches. Unlike other types of task targets, a `429` (Too Many
      # Requests) response from an app handler does not cause traffic congestion
      # control to throttle the queue.
      class AppEngineHttpRequest
        include Google::Apis::Core::Hashable
      
        # App Engine Routing.
        # Defines routing characteristics specific to App Engine - service, version,
        # and instance.
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
        # @return [Google::Apis::CloudtasksV2beta3::AppEngineRouting]
        attr_accessor :app_engine_routing
      
        # HTTP request body.
        # A request body is allowed only if the HTTP method is POST or PUT. It is
        # an error to set a body on a task with an incompatible HttpMethod.
        # Corresponds to the JSON property `body`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :body
      
        # HTTP request headers.
        # This map contains the header field names and values.
        # Headers can be set when the
        # task is created.
        # Repeated headers are not supported but a header value can contain commas.
        # Cloud Tasks sets some headers to default values:
        # * `User-Agent`: By default, this header is
        # `"AppEngine-Google; (+http://code.google.com/appengine)"`.
        # This header can be modified, but Cloud Tasks will append
        # `"AppEngine-Google; (+http://code.google.com/appengine)"` to the
        # modified `User-Agent`.
        # If the task has a body, Cloud
        # Tasks sets the following headers:
        # * `Content-Type`: By default, the `Content-Type` header is set to
        # `"application/octet-stream"`. The default can be overridden by explicitly
        # setting `Content-Type` to a particular media type when the
        # task is created.
        # For example, `Content-Type` can be set to `"application/json"`.
        # * `Content-Length`: This is computed by Cloud Tasks. This value is
        # output only.   It cannot be changed.
        # The headers below cannot be set or overridden:
        # * `Host`
        # * `X-Google-*`
        # * `X-AppEngine-*`
        # In addition, Cloud Tasks sets some headers when the task is dispatched,
        # such as headers containing information about the task; see
        # [request
        # headers](https://cloud.google.com/appengine/docs/python/taskqueue/push/
        # creating-handlers#reading_request_headers).
        # These headers are set only when the task is dispatched, so they are not
        # visible when the task is returned in a Cloud Tasks response.
        # Although there is no specific limit for the maximum number of headers or
        # the size, there is a limit on the maximum size of the Task. For more
        # information, see the CreateTask documentation.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # The HTTP method to use for the request. The default is POST.
        # The app's request handler for the task's target URL must be able to handle
        # HTTP requests with this http_method, otherwise the task attempt will fail
        # with error code 405 (Method Not Allowed). See
        # [Writing a push task request
        # handler](https://cloud.google.com/appengine/docs/java/taskqueue/push/creating-
        # handlers#writing_a_push_task_request_handler)
        # and the documentation for the request handlers in the language your app is
        # written in e.g.
        # [Python Request
        # Handler](https://cloud.google.com/appengine/docs/python/tools/webapp/
        # requesthandlerclass).
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # The relative URI.
        # The relative URI must begin with "/" and must be a valid HTTP relative URI.
        # It can contain a path and query string arguments.
        # If the relative URI is empty, then the root path "/" will be used.
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
      # Defines routing characteristics specific to App Engine - service, version,
      # and instance.
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
      
        # Output only. The host that the task is sent to.
        # The host is constructed from the domain name of the app associated with
        # the queue's project ID (for example <app-id>.appspot.com), and the
        # service, version,
        # and instance. Tasks which were created using
        # the App Engine SDK might have a custom domain name.
        # For more information, see
        # [How Requests are
        # Routed](https://cloud.google.com/appengine/docs/standard/python/how-requests-
        # are-routed).
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # App instance.
        # By default, the task is sent to an instance which is available when
        # the task is attempted.
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
        # By default, the task is sent to the service which is the default
        # service when the task is attempted.
        # For some queues or tasks which were created using the App Engine
        # Task Queue API, host is not parsable
        # into service,
        # version, and
        # instance. For example, some tasks
        # which were created using the App Engine SDK use a custom domain
        # name; custom domains are not parsed by Cloud Tasks. If
        # host is not parsable, then
        # service,
        # version, and
        # instance are the empty string.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        # App version.
        # By default, the task is sent to the version which is the default
        # version when the task is attempted.
        # For some queues or tasks which were created using the App Engine
        # Task Queue API, host is not parsable
        # into service,
        # version, and
        # instance. For example, some tasks
        # which were created using the App Engine SDK use a custom domain
        # name; custom domains are not parsed by Cloud Tasks. If
        # host is not parsable, then
        # service,
        # version, and
        # instance are the empty string.
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
      
      # The status of a task attempt.
      class Attempt
        include Google::Apis::Core::Hashable
      
        # Output only. The time that this attempt was dispatched.
        # `dispatch_time` will be truncated to the nearest microsecond.
        # Corresponds to the JSON property `dispatchTime`
        # @return [String]
        attr_accessor :dispatch_time
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `responseStatus`
        # @return [Google::Apis::CloudtasksV2beta3::Status]
        attr_accessor :response_status
      
        # Output only. The time that this attempt response was received.
        # `response_time` will be truncated to the nearest microsecond.
        # Corresponds to the JSON property `responseTime`
        # @return [String]
        attr_accessor :response_time
      
        # Output only. The time that this attempt was scheduled.
        # `schedule_time` will be truncated to the nearest microsecond.
        # Corresponds to the JSON property `scheduleTime`
        # @return [String]
        attr_accessor :schedule_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dispatch_time = args[:dispatch_time] if args.key?(:dispatch_time)
          @response_status = args[:response_status] if args.key?(:response_status)
          @response_time = args[:response_time] if args.key?(:response_time)
          @schedule_time = args[:schedule_time] if args.key?(:schedule_time)
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
        # @return [Google::Apis::CloudtasksV2beta3::Expr]
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
      
      # Request message for CreateTask.
      class CreateTaskRequest
        include Google::Apis::Core::Hashable
      
        # The response_view specifies which subset of the Task will be
        # returned.
        # By default response_view is BASIC; not all
        # information is retrieved by default because some data, such as
        # payloads, might be desirable to return only when needed because
        # of its large size or because of the sensitivity of data that it
        # contains.
        # Authorization for FULL requires
        # `cloudtasks.tasks.fullView` [Google IAM](https://cloud.google.com/iam/)
        # permission on the Task resource.
        # Corresponds to the JSON property `responseView`
        # @return [String]
        attr_accessor :response_view
      
        # A unit of scheduled work.
        # Corresponds to the JSON property `task`
        # @return [Google::Apis::CloudtasksV2beta3::Task]
        attr_accessor :task
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @response_view = args[:response_view] if args.key?(:response_view)
          @task = args[:task] if args.key?(:task)
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
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::CloudtasksV2beta3::GetPolicyOptions]
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
      
      # HTTP request.
      # The task will be pushed to the worker as an HTTP request. If the worker
      # or the redirected worker acknowledges the task by returning a successful HTTP
      # response code ([`200` - `299`]), the task will removed from the queue. If
      # any other HTTP response code is returned or no response is received, the
      # task will be retried according to the following:
      # * User-specified throttling: retry configuration,
      # rate limits, and the queue's state.
      # * System throttling: To prevent the worker from overloading, Cloud Tasks may
      # temporarily reduce the queue's effective rate. User-specified settings
      # will not be changed.
      # System throttling happens because:
      # * Cloud Tasks backs off on all errors. Normally the backoff specified in
      # rate limits will be used. But if the worker returns
      # `429` (Too Many Requests), `503` (Service Unavailable), or the rate of
      # errors is high, Cloud Tasks will use a higher backoff rate. The retry
      # specified in the `Retry-After` HTTP response header is considered.
      # * To prevent traffic spikes and to smooth sudden large traffic spikes,
      # dispatches ramp up slowly when the queue is newly created or idle and
      # if large numbers of tasks suddenly become available to dispatch (due to
      # spikes in create task rates, the queue being unpaused, or many tasks
      # that are scheduled at the same time).
      class HttpRequest
        include Google::Apis::Core::Hashable
      
        # HTTP request body.
        # A request body is allowed only if the
        # HTTP method is POST, PUT, or PATCH. It is an
        # error to set body on a task with an incompatible HttpMethod.
        # Corresponds to the JSON property `body`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :body
      
        # HTTP request headers.
        # This map contains the header field names and values.
        # Headers can be set when the
        # task is created.
        # These headers represent a subset of the headers that will accompany the
        # task's HTTP request. Some HTTP request headers will be ignored or replaced.
        # A partial list of headers that will be ignored or replaced is:
        # * Host: This will be computed by Cloud Tasks and derived from
        # HttpRequest.url.
        # * Content-Length: This will be computed by Cloud Tasks.
        # * User-Agent: This will be set to `"Google-Cloud-Tasks"`.
        # * X-Google-*: Google use only.
        # * X-AppEngine-*: Google use only.
        # `Content-Type` won't be set by Cloud Tasks. You can explicitly set
        # `Content-Type` to a media type when the
        # task is created.
        # For example, `Content-Type` can be set to `"application/octet-stream"` or
        # `"application/json"`.
        # Headers which can have multiple values (according to RFC2616) can be
        # specified using comma-separated values.
        # The size of the headers must be less than 80KB.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # The HTTP method to use for the request. The default is POST.
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # Contains information needed for generating an
        # [OAuth token](https://developers.google.com/identity/protocols/OAuth2).
        # This type of authorization should generally only be used when calling Google
        # APIs hosted on *.googleapis.com.
        # Corresponds to the JSON property `oauthToken`
        # @return [Google::Apis::CloudtasksV2beta3::OAuthToken]
        attr_accessor :oauth_token
      
        # Contains information needed for generating an
        # [OpenID Connect
        # token](https://developers.google.com/identity/protocols/OpenIDConnect).
        # This type of authorization can be used for many scenarios, including
        # calling Cloud Run, or endpoints where you intend to validate the token
        # yourself.
        # Corresponds to the JSON property `oidcToken`
        # @return [Google::Apis::CloudtasksV2beta3::OidcToken]
        attr_accessor :oidc_token
      
        # Required. The full url path that the request will be sent to.
        # This string must begin with either "http://" or "https://". Some examples
        # are: `http://acme.com` and `https://acme.com/sales:8080`. Cloud Tasks will
        # encode some characters for safety and compatibility. The maximum allowed
        # URL length is 2083 characters after encoding.
        # The `Location` header response from a redirect response [`300` - `399`]
        # may be followed. The redirect is not counted as a separate attempt.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
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
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::CloudtasksV2beta3::Location>]
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
      
      # Response message for ListQueues.
      class ListQueuesResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve next page of results.
        # To return the next page of results, call
        # ListQueues with this value as the
        # page_token.
        # If the next_page_token is empty, there are no more results.
        # The page token is valid for only 2 hours.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of queues.
        # Corresponds to the JSON property `queues`
        # @return [Array<Google::Apis::CloudtasksV2beta3::Queue>]
        attr_accessor :queues
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @queues = args[:queues] if args.key?(:queues)
        end
      end
      
      # Response message for listing tasks using ListTasks.
      class ListTasksResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve next page of results.
        # To return the next page of results, call
        # ListTasks with this value as the
        # page_token.
        # If the next_page_token is empty, there are no more results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of tasks.
        # Corresponds to the JSON property `tasks`
        # @return [Array<Google::Apis::CloudtasksV2beta3::Task>]
        attr_accessor :tasks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tasks = args[:tasks] if args.key?(:tasks)
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
        # The service account must be within the same project as the queue. The
        # caller must have iam.serviceAccounts.actAs permission for the service
        # account.
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
        # The service account must be within the same project as the queue. The
        # caller must have iam.serviceAccounts.actAs permission for the service
        # account.
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
      
      # Request message for PauseQueue.
      class PauseQueueRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
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
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudtasksV2beta3::Binding>]
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
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Request message for PurgeQueue.
      class PurgeQueueRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A queue is a container of related tasks. Queues are configured to manage
      # how those tasks are dispatched. Configurable properties include rate limits,
      # retry options, queue types, and others.
      class Queue
        include Google::Apis::Core::Hashable
      
        # App Engine HTTP queue.
        # The task will be delivered to the App Engine application hostname
        # specified by its AppEngineHttpQueue and AppEngineHttpRequest.
        # The documentation for AppEngineHttpRequest explains how the
        # task's host URL is constructed.
        # Using AppEngineHttpQueue requires
        # [`appengine.applications.get`](https://cloud.google.com/appengine/docs/admin-
        # api/access-control)
        # Google IAM permission for the project
        # and the following scope:
        # `https://www.googleapis.com/auth/cloud-platform`
        # Corresponds to the JSON property `appEngineHttpQueue`
        # @return [Google::Apis::CloudtasksV2beta3::AppEngineHttpQueue]
        attr_accessor :app_engine_http_queue
      
        # Caller-specified and required in CreateQueue,
        # after which it becomes output only.
        # The queue name.
        # The queue name must have the following format:
        # `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        # * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
        # hyphens (-), colons (:), or periods (.).
        # For more information, see
        # [Identifying
        # projects](https://cloud.google.com/resource-manager/docs/creating-managing-
        # projects#identifying_projects)
        # * `LOCATION_ID` is the canonical ID for the queue's location.
        # The list of available locations can be obtained by calling
        # ListLocations.
        # For more information, see https://cloud.google.com/about/locations/.
        # * `QUEUE_ID` can contain letters ([A-Za-z]), numbers ([0-9]), or
        # hyphens (-). The maximum length is 100 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The last time this queue was purged.
        # All tasks that were created before this time
        # were purged.
        # A queue can be purged using PurgeQueue, the
        # [App Engine Task Queue SDK, or the Cloud
        # Console](https://cloud.google.com/appengine/docs/standard/python/taskqueue/
        # push/deleting-tasks-and-queues#purging_all_tasks_from_a_queue).
        # Purge time will be truncated to the nearest microsecond. Purge
        # time will be unset if the queue has never been purged.
        # Corresponds to the JSON property `purgeTime`
        # @return [String]
        attr_accessor :purge_time
      
        # Rate limits.
        # This message determines the maximum rate that tasks can be dispatched by a
        # queue, regardless of whether the dispatch is a first task attempt or a retry.
        # Note: The debugging command, RunTask, will run a task
        # even if the queue has reached its RateLimits.
        # Corresponds to the JSON property `rateLimits`
        # @return [Google::Apis::CloudtasksV2beta3::RateLimits]
        attr_accessor :rate_limits
      
        # Retry config.
        # These settings determine when a failed task attempt is retried.
        # Corresponds to the JSON property `retryConfig`
        # @return [Google::Apis::CloudtasksV2beta3::RetryConfig]
        attr_accessor :retry_config
      
        # Configuration options for writing logs to
        # [Stackdriver Logging](https://cloud.google.com/logging/docs/).
        # Corresponds to the JSON property `stackdriverLoggingConfig`
        # @return [Google::Apis::CloudtasksV2beta3::StackdriverLoggingConfig]
        attr_accessor :stackdriver_logging_config
      
        # Output only. The state of the queue.
        # `state` can only be changed by called
        # PauseQueue,
        # ResumeQueue, or uploading
        # [queue.yaml/xml](https://cloud.google.com/appengine/docs/python/config/
        # queueref).
        # UpdateQueue cannot be used to change `state`.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_http_queue = args[:app_engine_http_queue] if args.key?(:app_engine_http_queue)
          @name = args[:name] if args.key?(:name)
          @purge_time = args[:purge_time] if args.key?(:purge_time)
          @rate_limits = args[:rate_limits] if args.key?(:rate_limits)
          @retry_config = args[:retry_config] if args.key?(:retry_config)
          @stackdriver_logging_config = args[:stackdriver_logging_config] if args.key?(:stackdriver_logging_config)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Rate limits.
      # This message determines the maximum rate that tasks can be dispatched by a
      # queue, regardless of whether the dispatch is a first task attempt or a retry.
      # Note: The debugging command, RunTask, will run a task
      # even if the queue has reached its RateLimits.
      class RateLimits
        include Google::Apis::Core::Hashable
      
        # Output only. The max burst size.
        # Max burst size limits how fast tasks in queue are processed when
        # many tasks are in the queue and the rate is high. This field
        # allows the queue to have a high rate so processing starts shortly
        # after a task is enqueued, but still limits resource usage when
        # many tasks are enqueued in a short period of time.
        # The [token bucket](https://wikipedia.org/wiki/Token_Bucket)
        # algorithm is used to control the rate of task dispatches. Each
        # queue has a token bucket that holds tokens, up to the maximum
        # specified by `max_burst_size`. Each time a task is dispatched, a
        # token is removed from the bucket. Tasks will be dispatched until
        # the queue's bucket runs out of tokens. The bucket will be
        # continuously refilled with new tokens based on
        # max_dispatches_per_second.
        # Cloud Tasks will pick the value of `max_burst_size` based on the
        # value of
        # max_dispatches_per_second.
        # For App Engine queues that were created or updated using
        # `queue.yaml/xml`, `max_burst_size` is equal to
        # [bucket_size](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#bucket_size).
        # Since `max_burst_size` is output only, if
        # UpdateQueue is called on a queue
        # created by `queue.yaml/xml`, `max_burst_size` will be reset based
        # on the value of
        # max_dispatches_per_second,
        # regardless of whether
        # max_dispatches_per_second
        # is updated.
        # Corresponds to the JSON property `maxBurstSize`
        # @return [Fixnum]
        attr_accessor :max_burst_size
      
        # The maximum number of concurrent tasks that Cloud Tasks allows
        # to be dispatched for this queue. After this threshold has been
        # reached, Cloud Tasks stops dispatching tasks until the number of
        # concurrent requests decreases.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # The maximum allowed value is 5,000.
        # This field has the same meaning as
        # [max_concurrent_requests in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#max_concurrent_requests).
        # Corresponds to the JSON property `maxConcurrentDispatches`
        # @return [Fixnum]
        attr_accessor :max_concurrent_dispatches
      
        # The maximum rate at which tasks are dispatched from this queue.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # * For App Engine queues, the maximum allowed value
        # is 500.
        # This field has the same meaning as
        # [rate in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#rate).
        # Corresponds to the JSON property `maxDispatchesPerSecond`
        # @return [Float]
        attr_accessor :max_dispatches_per_second
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_burst_size = args[:max_burst_size] if args.key?(:max_burst_size)
          @max_concurrent_dispatches = args[:max_concurrent_dispatches] if args.key?(:max_concurrent_dispatches)
          @max_dispatches_per_second = args[:max_dispatches_per_second] if args.key?(:max_dispatches_per_second)
        end
      end
      
      # Request message for ResumeQueue.
      class ResumeQueueRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Retry config.
      # These settings determine when a failed task attempt is retried.
      class RetryConfig
        include Google::Apis::Core::Hashable
      
        # Number of attempts per task.
        # Cloud Tasks will attempt the task `max_attempts` times (that is, if the
        # first attempt fails, then there will be `max_attempts - 1` retries). Must
        # be >= -1.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # -1 indicates unlimited attempts.
        # This field has the same meaning as
        # [task_retry_limit in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#retry_parameters).
        # Corresponds to the JSON property `maxAttempts`
        # @return [Fixnum]
        attr_accessor :max_attempts
      
        # A task will be scheduled for retry between
        # min_backoff and
        # max_backoff duration after it fails,
        # if the queue's RetryConfig specifies that the task should be
        # retried.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # `max_backoff` will be truncated to the nearest second.
        # This field has the same meaning as
        # [max_backoff_seconds in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#retry_parameters).
        # Corresponds to the JSON property `maxBackoff`
        # @return [String]
        attr_accessor :max_backoff
      
        # The time between retries will double `max_doublings` times.
        # A task's retry interval starts at
        # min_backoff, then doubles
        # `max_doublings` times, then increases linearly, and finally
        # retries retries at intervals of
        # max_backoff up to
        # max_attempts times.
        # For example, if min_backoff is 10s,
        # max_backoff is 300s, and
        # `max_doublings` is 3, then the a task will first be retried in
        # 10s. The retry interval will double three times, and then
        # increase linearly by 2^3 * 10s.  Finally, the task will retry at
        # intervals of max_backoff until the
        # task has been attempted max_attempts
        # times. Thus, the requests will retry at 10s, 20s, 40s, 80s, 160s,
        # 240s, 300s, 300s, ....
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # This field has the same meaning as
        # [max_doublings in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#retry_parameters).
        # Corresponds to the JSON property `maxDoublings`
        # @return [Fixnum]
        attr_accessor :max_doublings
      
        # If positive, `max_retry_duration` specifies the time limit for
        # retrying a failed task, measured from when the task was first
        # attempted. Once `max_retry_duration` time has passed *and* the
        # task has been attempted max_attempts
        # times, no further attempts will be made and the task will be
        # deleted.
        # If zero, then the task age is unlimited.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # `max_retry_duration` will be truncated to the nearest second.
        # This field has the same meaning as
        # [task_age_limit in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#retry_parameters).
        # Corresponds to the JSON property `maxRetryDuration`
        # @return [String]
        attr_accessor :max_retry_duration
      
        # A task will be scheduled for retry between
        # min_backoff and
        # max_backoff duration after it fails,
        # if the queue's RetryConfig specifies that the task should be
        # retried.
        # If unspecified when the queue is created, Cloud Tasks will pick the
        # default.
        # `min_backoff` will be truncated to the nearest second.
        # This field has the same meaning as
        # [min_backoff_seconds in
        # queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/
        # queueref#retry_parameters).
        # Corresponds to the JSON property `minBackoff`
        # @return [String]
        attr_accessor :min_backoff
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_attempts = args[:max_attempts] if args.key?(:max_attempts)
          @max_backoff = args[:max_backoff] if args.key?(:max_backoff)
          @max_doublings = args[:max_doublings] if args.key?(:max_doublings)
          @max_retry_duration = args[:max_retry_duration] if args.key?(:max_retry_duration)
          @min_backoff = args[:min_backoff] if args.key?(:min_backoff)
        end
      end
      
      # Request message for forcing a task to run now using
      # RunTask.
      class RunTaskRequest
        include Google::Apis::Core::Hashable
      
        # The response_view specifies which subset of the Task will be
        # returned.
        # By default response_view is BASIC; not all
        # information is retrieved by default because some data, such as
        # payloads, might be desirable to return only when needed because
        # of its large size or because of the sensitivity of data that it
        # contains.
        # Authorization for FULL requires
        # `cloudtasks.tasks.fullView` [Google IAM](https://cloud.google.com/iam/)
        # permission on the Task resource.
        # Corresponds to the JSON property `responseView`
        # @return [String]
        attr_accessor :response_view
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @response_view = args[:response_view] if args.key?(:response_view)
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
        # @return [Google::Apis::CloudtasksV2beta3::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # Configuration options for writing logs to
      # [Stackdriver Logging](https://cloud.google.com/logging/docs/).
      class StackdriverLoggingConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the fraction of operations to write to
        # [Stackdriver Logging](https://cloud.google.com/logging/docs/).
        # This field may contain any value between 0.0 and 1.0, inclusive.
        # 0.0 is the default and means that no operations are logged.
        # Corresponds to the JSON property `samplingRatio`
        # @return [Float]
        attr_accessor :sampling_ratio
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sampling_ratio = args[:sampling_ratio] if args.key?(:sampling_ratio)
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
      
      # A unit of scheduled work.
      class Task
        include Google::Apis::Core::Hashable
      
        # App Engine HTTP request.
        # The message defines the HTTP request that is sent to an App Engine app when
        # the task is dispatched.
        # Using AppEngineHttpRequest requires
        # [`appengine.applications.get`](https://cloud.google.com/appengine/docs/admin-
        # api/access-control)
        # Google IAM permission for the project
        # and the following scope:
        # `https://www.googleapis.com/auth/cloud-platform`
        # The task will be delivered to the App Engine app which belongs to the same
        # project as the queue. For more information, see
        # [How Requests are
        # Routed](https://cloud.google.com/appengine/docs/standard/python/how-requests-
        # are-routed)
        # and how routing is affected by
        # [dispatch
        # files](https://cloud.google.com/appengine/docs/python/config/dispatchref).
        # Traffic is encrypted during transport and never leaves Google datacenters.
        # Because this traffic is carried over a communication mechanism internal to
        # Google, you cannot explicitly set the protocol (for example, HTTP or HTTPS).
        # The request to the handler, however, will appear to have used the HTTP
        # protocol.
        # The AppEngineRouting used to construct the URL that the task is
        # delivered to can be set at the queue-level or task-level:
        # * If set,
        # app_engine_routing_override
        # is used for all tasks in the queue, no matter what the setting
        # is for the
        # task-level app_engine_routing.
        # The `url` that the task will be sent to is:
        # * `url =` host `+`
        # relative_uri
        # Tasks can be dispatched to secure app handlers, unsecure app handlers, and
        # URIs restricted with
        # [`login:
        # admin`](https://cloud.google.com/appengine/docs/standard/python/config/appref).
        # Because tasks are not run as any user, they cannot be dispatched to URIs
        # restricted with
        # [`login:
        # required`](https://cloud.google.com/appengine/docs/standard/python/config/
        # appref)
        # Task dispatches also do not follow redirects.
        # The task attempt has succeeded if the app's request handler returns an HTTP
        # response code in the range [`200` - `299`]. The task attempt has failed if
        # the app's handler returns a non-2xx response code or Cloud Tasks does
        # not receive response before the deadline. Failed
        # tasks will be retried according to the
        # retry configuration. `503` (Service Unavailable) is
        # considered an App Engine system error instead of an application error and
        # will cause Cloud Tasks' traffic congestion control to temporarily throttle
        # the queue's dispatches. Unlike other types of task targets, a `429` (Too Many
        # Requests) response from an app handler does not cause traffic congestion
        # control to throttle the queue.
        # Corresponds to the JSON property `appEngineHttpRequest`
        # @return [Google::Apis::CloudtasksV2beta3::AppEngineHttpRequest]
        attr_accessor :app_engine_http_request
      
        # Output only. The time that the task was created.
        # `create_time` will be truncated to the nearest second.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The number of attempts dispatched.
        # This count includes attempts which have been dispatched but haven't
        # received a response.
        # Corresponds to the JSON property `dispatchCount`
        # @return [Fixnum]
        attr_accessor :dispatch_count
      
        # The deadline for requests sent to the worker. If the worker does not
        # respond by this deadline then the request is cancelled and the attempt
        # is marked as a `DEADLINE_EXCEEDED` failure. Cloud Tasks will retry the
        # task according to the RetryConfig.
        # Note that when the request is cancelled, Cloud Tasks will stop listing for
        # the response, but whether the worker stops processing depends on the
        # worker. For example, if the worker is stuck, it may not react to cancelled
        # requests.
        # The default and maximum values depend on the type of request:
        # * For HTTP tasks, the default is 10 minutes. The deadline
        # must be in the interval [15 seconds, 30 minutes].
        # * For App Engine tasks, 0 indicates that the
        # request has the default deadline. The default deadline depends on the
        # [scaling
        # type](https://cloud.google.com/appengine/docs/standard/go/how-instances-are-
        # managed#instance_scaling)
        # of the service: 10 minutes for standard apps with automatic scaling, 24
        # hours for standard apps with manual and basic scaling, and 60 minutes for
        # flex apps. If the request deadline is set, it must be in the interval [15
        # seconds, 24 hours 15 seconds]. Regardless of the task's
        # `dispatch_deadline`, the app handler will not run for longer than than
        # the service's timeout. We recommend setting the `dispatch_deadline` to
        # at most a few seconds more than the app handler's timeout. For more
        # information see
        # [Timeouts](https://cloud.google.com/tasks/docs/creating-appengine-handlers#
        # timeouts).
        # `dispatch_deadline` will be truncated to the nearest millisecond. The
        # deadline is an approximate deadline.
        # Corresponds to the JSON property `dispatchDeadline`
        # @return [String]
        attr_accessor :dispatch_deadline
      
        # The status of a task attempt.
        # Corresponds to the JSON property `firstAttempt`
        # @return [Google::Apis::CloudtasksV2beta3::Attempt]
        attr_accessor :first_attempt
      
        # HTTP request.
        # The task will be pushed to the worker as an HTTP request. If the worker
        # or the redirected worker acknowledges the task by returning a successful HTTP
        # response code ([`200` - `299`]), the task will removed from the queue. If
        # any other HTTP response code is returned or no response is received, the
        # task will be retried according to the following:
        # * User-specified throttling: retry configuration,
        # rate limits, and the queue's state.
        # * System throttling: To prevent the worker from overloading, Cloud Tasks may
        # temporarily reduce the queue's effective rate. User-specified settings
        # will not be changed.
        # System throttling happens because:
        # * Cloud Tasks backs off on all errors. Normally the backoff specified in
        # rate limits will be used. But if the worker returns
        # `429` (Too Many Requests), `503` (Service Unavailable), or the rate of
        # errors is high, Cloud Tasks will use a higher backoff rate. The retry
        # specified in the `Retry-After` HTTP response header is considered.
        # * To prevent traffic spikes and to smooth sudden large traffic spikes,
        # dispatches ramp up slowly when the queue is newly created or idle and
        # if large numbers of tasks suddenly become available to dispatch (due to
        # spikes in create task rates, the queue being unpaused, or many tasks
        # that are scheduled at the same time).
        # Corresponds to the JSON property `httpRequest`
        # @return [Google::Apis::CloudtasksV2beta3::HttpRequest]
        attr_accessor :http_request
      
        # The status of a task attempt.
        # Corresponds to the JSON property `lastAttempt`
        # @return [Google::Apis::CloudtasksV2beta3::Attempt]
        attr_accessor :last_attempt
      
        # Optionally caller-specified in CreateTask.
        # The task name.
        # The task name must have the following format:
        # `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
        # hyphens (-), colons (:), or periods (.).
        # For more information, see
        # [Identifying
        # projects](https://cloud.google.com/resource-manager/docs/creating-managing-
        # projects#identifying_projects)
        # * `LOCATION_ID` is the canonical ID for the task's location.
        # The list of available locations can be obtained by calling
        # ListLocations.
        # For more information, see https://cloud.google.com/about/locations/.
        # * `QUEUE_ID` can contain letters ([A-Za-z]), numbers ([0-9]), or
        # hyphens (-). The maximum length is 100 characters.
        # * `TASK_ID` can contain only letters ([A-Za-z]), numbers ([0-9]),
        # hyphens (-), or underscores (_). The maximum length is 500 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The number of attempts which have received a response.
        # Corresponds to the JSON property `responseCount`
        # @return [Fixnum]
        attr_accessor :response_count
      
        # The time when the task is scheduled to be attempted.
        # For App Engine queues, this is when the task will be attempted or retried.
        # `schedule_time` will be truncated to the nearest microsecond.
        # Corresponds to the JSON property `scheduleTime`
        # @return [String]
        attr_accessor :schedule_time
      
        # Output only. The view specifies which subset of the Task has
        # been returned.
        # Corresponds to the JSON property `view`
        # @return [String]
        attr_accessor :view
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_http_request = args[:app_engine_http_request] if args.key?(:app_engine_http_request)
          @create_time = args[:create_time] if args.key?(:create_time)
          @dispatch_count = args[:dispatch_count] if args.key?(:dispatch_count)
          @dispatch_deadline = args[:dispatch_deadline] if args.key?(:dispatch_deadline)
          @first_attempt = args[:first_attempt] if args.key?(:first_attempt)
          @http_request = args[:http_request] if args.key?(:http_request)
          @last_attempt = args[:last_attempt] if args.key?(:last_attempt)
          @name = args[:name] if args.key?(:name)
          @response_count = args[:response_count] if args.key?(:response_count)
          @schedule_time = args[:schedule_time] if args.key?(:schedule_time)
          @view = args[:view] if args.key?(:view)
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
