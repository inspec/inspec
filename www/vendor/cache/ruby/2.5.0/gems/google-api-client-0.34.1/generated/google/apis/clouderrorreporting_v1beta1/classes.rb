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
    module ClouderrorreportingV1beta1
      
      # Response message for deleting error events.
      class DeleteEventsResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A description of the context in which an error occurred.
      # This data should be provided by the application when reporting an error,
      # unless the
      # error report has been generated automatically from Google App Engine logs.
      class ErrorContext
        include Google::Apis::Core::Hashable
      
        # HTTP request data that is related to a reported error.
        # This data should be provided by the application when reporting an error,
        # unless the
        # error report has been generated automatically from Google App Engine logs.
        # Corresponds to the JSON property `httpRequest`
        # @return [Google::Apis::ClouderrorreportingV1beta1::HttpRequestContext]
        attr_accessor :http_request
      
        # Indicates a location in the source code of the service for which errors are
        # reported. `functionName` must be provided by the application when reporting
        # an error, unless the error report contains a `message` with a supported
        # exception stack trace. All fields are optional for the later case.
        # Corresponds to the JSON property `reportLocation`
        # @return [Google::Apis::ClouderrorreportingV1beta1::SourceLocation]
        attr_accessor :report_location
      
        # Source code that was used to build the executable which has
        # caused the given error message.
        # Corresponds to the JSON property `sourceReferences`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::SourceReference>]
        attr_accessor :source_references
      
        # The user who caused or was affected by the crash.
        # This can be a user ID, an email address, or an arbitrary token that
        # uniquely identifies the user.
        # When sending an error report, leave this field empty if the user was not
        # logged in. In this case the
        # Error Reporting system will use other data, such as remote IP address, to
        # distinguish affected users. See `affected_users_count` in
        # `ErrorGroupStats`.
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_request = args[:http_request] if args.key?(:http_request)
          @report_location = args[:report_location] if args.key?(:report_location)
          @source_references = args[:source_references] if args.key?(:source_references)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # An error event which is returned by the Error Reporting system.
      class ErrorEvent
        include Google::Apis::Core::Hashable
      
        # A description of the context in which an error occurred.
        # This data should be provided by the application when reporting an error,
        # unless the
        # error report has been generated automatically from Google App Engine logs.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorContext]
        attr_accessor :context
      
        # Time when the event occurred as provided in the error report.
        # If the report did not contain a timestamp, the time the error was received
        # by the Error Reporting system is used.
        # Corresponds to the JSON property `eventTime`
        # @return [String]
        attr_accessor :event_time
      
        # The stack trace that was reported or logged by the service.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # Describes a running service that sends errors.
        # Its version changes over time and multiple versions can run in parallel.
        # Corresponds to the JSON property `serviceContext`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ServiceContext]
        attr_accessor :service_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @event_time = args[:event_time] if args.key?(:event_time)
          @message = args[:message] if args.key?(:message)
          @service_context = args[:service_context] if args.key?(:service_context)
        end
      end
      
      # Description of a group of similar error events.
      class ErrorGroup
        include Google::Apis::Core::Hashable
      
        # Group IDs are unique for a given project. If the same kind of error
        # occurs in different service contexts, it will receive the same group ID.
        # Corresponds to the JSON property `groupId`
        # @return [String]
        attr_accessor :group_id
      
        # The group resource name.
        # Example: <code>projects/my-project-123/groups/my-groupid</code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Associated tracking issues.
        # Corresponds to the JSON property `trackingIssues`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::TrackingIssue>]
        attr_accessor :tracking_issues
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group_id = args[:group_id] if args.key?(:group_id)
          @name = args[:name] if args.key?(:name)
          @tracking_issues = args[:tracking_issues] if args.key?(:tracking_issues)
        end
      end
      
      # Data extracted for a specific group based on certain filter criteria,
      # such as a given time period and/or service filter.
      class ErrorGroupStats
        include Google::Apis::Core::Hashable
      
        # Service contexts with a non-zero error count for the given filter
        # criteria. This list can be truncated if multiple services are affected.
        # Refer to `num_affected_services` for the total count.
        # Corresponds to the JSON property `affectedServices`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::ServiceContext>]
        attr_accessor :affected_services
      
        # Approximate number of affected users in the given group that
        # match the filter criteria.
        # Users are distinguished by data in the `ErrorContext` of the
        # individual error events, such as their login name or their remote
        # IP address in case of HTTP requests.
        # The number of affected users can be zero even if the number of
        # errors is non-zero if no data was provided from which the
        # affected user could be deduced.
        # Users are counted based on data in the request
        # context that was provided in the error report. If more users are
        # implicitly affected, such as due to a crash of the whole service,
        # this is not reflected here.
        # Corresponds to the JSON property `affectedUsersCount`
        # @return [Fixnum]
        attr_accessor :affected_users_count
      
        # Approximate total number of events in the given group that match
        # the filter criteria.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Approximate first occurrence that was ever seen for this group
        # and which matches the given filter criteria, ignoring the
        # time_range that was specified in the request.
        # Corresponds to the JSON property `firstSeenTime`
        # @return [String]
        attr_accessor :first_seen_time
      
        # Description of a group of similar error events.
        # Corresponds to the JSON property `group`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup]
        attr_accessor :group
      
        # Approximate last occurrence that was ever seen for this group and
        # which matches the given filter criteria, ignoring the time_range
        # that was specified in the request.
        # Corresponds to the JSON property `lastSeenTime`
        # @return [String]
        attr_accessor :last_seen_time
      
        # The total number of services with a non-zero error count for the given
        # filter criteria.
        # Corresponds to the JSON property `numAffectedServices`
        # @return [Fixnum]
        attr_accessor :num_affected_services
      
        # An error event which is returned by the Error Reporting system.
        # Corresponds to the JSON property `representative`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorEvent]
        attr_accessor :representative
      
        # Approximate number of occurrences over time.
        # Timed counts returned by ListGroups are guaranteed to be:
        # - Inside the requested time interval
        # - Non-overlapping, and
        # - Ordered by ascending time.
        # Corresponds to the JSON property `timedCounts`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::TimedCount>]
        attr_accessor :timed_counts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @affected_services = args[:affected_services] if args.key?(:affected_services)
          @affected_users_count = args[:affected_users_count] if args.key?(:affected_users_count)
          @count = args[:count] if args.key?(:count)
          @first_seen_time = args[:first_seen_time] if args.key?(:first_seen_time)
          @group = args[:group] if args.key?(:group)
          @last_seen_time = args[:last_seen_time] if args.key?(:last_seen_time)
          @num_affected_services = args[:num_affected_services] if args.key?(:num_affected_services)
          @representative = args[:representative] if args.key?(:representative)
          @timed_counts = args[:timed_counts] if args.key?(:timed_counts)
        end
      end
      
      # HTTP request data that is related to a reported error.
      # This data should be provided by the application when reporting an error,
      # unless the
      # error report has been generated automatically from Google App Engine logs.
      class HttpRequestContext
        include Google::Apis::Core::Hashable
      
        # The type of HTTP request, such as `GET`, `POST`, etc.
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # The referrer information that is provided with the request.
        # Corresponds to the JSON property `referrer`
        # @return [String]
        attr_accessor :referrer
      
        # The IP address from which the request originated.
        # This can be IPv4, IPv6, or a token which is derived from the
        # IP address, depending on the data that has been provided
        # in the error report.
        # Corresponds to the JSON property `remoteIp`
        # @return [String]
        attr_accessor :remote_ip
      
        # The HTTP response status code for the request.
        # Corresponds to the JSON property `responseStatusCode`
        # @return [Fixnum]
        attr_accessor :response_status_code
      
        # The URL of the request.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # The user agent information that is provided with the request.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @referrer = args[:referrer] if args.key?(:referrer)
          @remote_ip = args[:remote_ip] if args.key?(:remote_ip)
          @response_status_code = args[:response_status_code] if args.key?(:response_status_code)
          @url = args[:url] if args.key?(:url)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
        end
      end
      
      # Contains a set of requested error events.
      class ListEventsResponse
        include Google::Apis::Core::Hashable
      
        # The error events which match the given request.
        # Corresponds to the JSON property `errorEvents`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::ErrorEvent>]
        attr_accessor :error_events
      
        # If non-empty, more results are available.
        # Pass this token, along with the same query parameters as the first
        # request, to view the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The timestamp specifies the start time to which the request was restricted.
        # Corresponds to the JSON property `timeRangeBegin`
        # @return [String]
        attr_accessor :time_range_begin
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_events = args[:error_events] if args.key?(:error_events)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @time_range_begin = args[:time_range_begin] if args.key?(:time_range_begin)
        end
      end
      
      # Contains a set of requested error group stats.
      class ListGroupStatsResponse
        include Google::Apis::Core::Hashable
      
        # The error group stats which match the given request.
        # Corresponds to the JSON property `errorGroupStats`
        # @return [Array<Google::Apis::ClouderrorreportingV1beta1::ErrorGroupStats>]
        attr_accessor :error_group_stats
      
        # If non-empty, more results are available.
        # Pass this token, along with the same query parameters as the first
        # request, to view the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The timestamp specifies the start time to which the request was restricted.
        # The start time is set based on the requested time range. It may be adjusted
        # to a later time if a project has exceeded the storage quota and older data
        # has been deleted.
        # Corresponds to the JSON property `timeRangeBegin`
        # @return [String]
        attr_accessor :time_range_begin
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_group_stats = args[:error_group_stats] if args.key?(:error_group_stats)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @time_range_begin = args[:time_range_begin] if args.key?(:time_range_begin)
        end
      end
      
      # Response for reporting an individual error event.
      # Data may be added to this message in the future.
      class ReportErrorEventResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An error event which is reported to the Error Reporting system.
      class ReportedErrorEvent
        include Google::Apis::Core::Hashable
      
        # A description of the context in which an error occurred.
        # This data should be provided by the application when reporting an error,
        # unless the
        # error report has been generated automatically from Google App Engine logs.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorContext]
        attr_accessor :context
      
        # Optional. Time when the event occurred.
        # If not provided, the time when the event was received by the
        # Error Reporting system will be used.
        # Corresponds to the JSON property `eventTime`
        # @return [String]
        attr_accessor :event_time
      
        # Required. The error message.
        # If no `context.reportLocation` is provided, the message must contain a
        # header (typically consisting of the exception type name and an error
        # message) and an exception stack trace in one of the supported programming
        # languages and formats.
        # Supported languages are Java, Python, JavaScript, Ruby, C#, PHP, and Go.
        # Supported stack trace formats are:
        # * **Java**: Must be the return value of
        # [`Throwable.printStackTrace()`](https://docs.oracle.com/javase/7/docs/api/java/
        # lang/Throwable.html#printStackTrace%28%29).
        # * **Python**: Must be the return value of
        # [`traceback.format_exc()`](https://docs.python.org/2/library/traceback.html#
        # traceback.format_exc).
        # * **JavaScript**: Must be the value of
        # [`error.stack`](https://github.com/v8/v8/wiki/Stack-Trace-API) as returned
        # by V8.
        # * **Ruby**: Must contain frames returned by
        # [`Exception.backtrace`](https://ruby-doc.org/core-2.2.0/Exception.html#method-
        # i-backtrace).
        # * **C#**: Must be the return value of
        # [`Exception.ToString()`](https://msdn.microsoft.com/en-us/library/system.
        # exception.tostring.aspx).
        # * **PHP**: Must start with `PHP (Notice|Parse error|Fatal error|Warning)`
        # and contain the result of
        # [`(string)$exception`](http://php.net/manual/en/exception.tostring.php).
        # * **Go**: Must be the return value of
        # [`runtime.Stack()`](https://golang.org/pkg/runtime/debug/#Stack).
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # Describes a running service that sends errors.
        # Its version changes over time and multiple versions can run in parallel.
        # Corresponds to the JSON property `serviceContext`
        # @return [Google::Apis::ClouderrorreportingV1beta1::ServiceContext]
        attr_accessor :service_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @event_time = args[:event_time] if args.key?(:event_time)
          @message = args[:message] if args.key?(:message)
          @service_context = args[:service_context] if args.key?(:service_context)
        end
      end
      
      # Describes a running service that sends errors.
      # Its version changes over time and multiple versions can run in parallel.
      class ServiceContext
        include Google::Apis::Core::Hashable
      
        # Type of the MonitoredResource. List of possible values:
        # https://cloud.google.com/monitoring/api/resources
        # Value is set automatically for incoming errors and must not be set when
        # reporting errors.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        # An identifier of the service, such as the name of the
        # executable, job, or Google App Engine service name. This field is expected
        # to have a low number of values that are relatively stable over time, as
        # opposed to `version`, which can be changed whenever new code is deployed.
        # Contains the service name for error reports extracted from Google
        # App Engine logs or `default` if the App Engine default service is used.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        # Represents the source code version that the developer provided,
        # which could represent a version label or a Git SHA-1 hash, for example.
        # For App Engine standard environment, the version is set to the version of
        # the app.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
          @service = args[:service] if args.key?(:service)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Indicates a location in the source code of the service for which errors are
      # reported. `functionName` must be provided by the application when reporting
      # an error, unless the error report contains a `message` with a supported
      # exception stack trace. All fields are optional for the later case.
      class SourceLocation
        include Google::Apis::Core::Hashable
      
        # The source code filename, which can include a truncated relative
        # path, or a full path from a production machine.
        # Corresponds to the JSON property `filePath`
        # @return [String]
        attr_accessor :file_path
      
        # Human-readable name of a function or method.
        # The value can include optional context like the class or package name.
        # For example, `my.package.MyClass.method` in case of Java.
        # Corresponds to the JSON property `functionName`
        # @return [String]
        attr_accessor :function_name
      
        # 1-based. 0 indicates that the line number is unknown.
        # Corresponds to the JSON property `lineNumber`
        # @return [Fixnum]
        attr_accessor :line_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_path = args[:file_path] if args.key?(:file_path)
          @function_name = args[:function_name] if args.key?(:function_name)
          @line_number = args[:line_number] if args.key?(:line_number)
        end
      end
      
      # A reference to a particular snapshot of the source tree used to build and
      # deploy an application.
      class SourceReference
        include Google::Apis::Core::Hashable
      
        # Optional. A URI string identifying the repository.
        # Example: "https://github.com/GoogleCloudPlatform/kubernetes.git"
        # Corresponds to the JSON property `repository`
        # @return [String]
        attr_accessor :repository
      
        # The canonical and persistent identifier of the deployed revision.
        # Example (git): "0035781c50ec7aa23385dc841529ce8a4b70db1b"
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @repository = args[:repository] if args.key?(:repository)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # The number of errors in a given time period.
      # All numbers are approximate since the error events are sampled
      # before counting them.
      class TimedCount
        include Google::Apis::Core::Hashable
      
        # Approximate number of occurrences in the given time period.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # End of the time period to which `count` refers (excluded).
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Start of the time period to which `count` refers (included).
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Information related to tracking the progress on resolving the error.
      class TrackingIssue
        include Google::Apis::Core::Hashable
      
        # A URL pointing to a related entry in an issue tracking system.
        # Example: https://github.com/user/project/issues/4
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
    end
  end
end
