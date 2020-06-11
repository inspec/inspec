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
      
      class DeleteEventsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorGroupStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRequestContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEventsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListGroupStatsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportErrorEventResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportedErrorEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimedCount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrackingIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteEventsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ErrorContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_request, as: 'httpRequest', class: Google::Apis::ClouderrorreportingV1beta1::HttpRequestContext, decorator: Google::Apis::ClouderrorreportingV1beta1::HttpRequestContext::Representation
      
          property :report_location, as: 'reportLocation', class: Google::Apis::ClouderrorreportingV1beta1::SourceLocation, decorator: Google::Apis::ClouderrorreportingV1beta1::SourceLocation::Representation
      
          collection :source_references, as: 'sourceReferences', class: Google::Apis::ClouderrorreportingV1beta1::SourceReference, decorator: Google::Apis::ClouderrorreportingV1beta1::SourceReference::Representation
      
          property :user, as: 'user'
        end
      end
      
      class ErrorEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::ClouderrorreportingV1beta1::ErrorContext, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorContext::Representation
      
          property :event_time, as: 'eventTime'
          property :message, as: 'message'
          property :service_context, as: 'serviceContext', class: Google::Apis::ClouderrorreportingV1beta1::ServiceContext, decorator: Google::Apis::ClouderrorreportingV1beta1::ServiceContext::Representation
      
        end
      end
      
      class ErrorGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :group_id, as: 'groupId'
          property :name, as: 'name'
          collection :tracking_issues, as: 'trackingIssues', class: Google::Apis::ClouderrorreportingV1beta1::TrackingIssue, decorator: Google::Apis::ClouderrorreportingV1beta1::TrackingIssue::Representation
      
        end
      end
      
      class ErrorGroupStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :affected_services, as: 'affectedServices', class: Google::Apis::ClouderrorreportingV1beta1::ServiceContext, decorator: Google::Apis::ClouderrorreportingV1beta1::ServiceContext::Representation
      
          property :affected_users_count, :numeric_string => true, as: 'affectedUsersCount'
          property :count, :numeric_string => true, as: 'count'
          property :first_seen_time, as: 'firstSeenTime'
          property :group, as: 'group', class: Google::Apis::ClouderrorreportingV1beta1::ErrorGroup, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorGroup::Representation
      
          property :last_seen_time, as: 'lastSeenTime'
          property :num_affected_services, as: 'numAffectedServices'
          property :representative, as: 'representative', class: Google::Apis::ClouderrorreportingV1beta1::ErrorEvent, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorEvent::Representation
      
          collection :timed_counts, as: 'timedCounts', class: Google::Apis::ClouderrorreportingV1beta1::TimedCount, decorator: Google::Apis::ClouderrorreportingV1beta1::TimedCount::Representation
      
        end
      end
      
      class HttpRequestContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :method_prop, as: 'method'
          property :referrer, as: 'referrer'
          property :remote_ip, as: 'remoteIp'
          property :response_status_code, as: 'responseStatusCode'
          property :url, as: 'url'
          property :user_agent, as: 'userAgent'
        end
      end
      
      class ListEventsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :error_events, as: 'errorEvents', class: Google::Apis::ClouderrorreportingV1beta1::ErrorEvent, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorEvent::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :time_range_begin, as: 'timeRangeBegin'
        end
      end
      
      class ListGroupStatsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :error_group_stats, as: 'errorGroupStats', class: Google::Apis::ClouderrorreportingV1beta1::ErrorGroupStats, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorGroupStats::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :time_range_begin, as: 'timeRangeBegin'
        end
      end
      
      class ReportErrorEventResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ReportedErrorEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::ClouderrorreportingV1beta1::ErrorContext, decorator: Google::Apis::ClouderrorreportingV1beta1::ErrorContext::Representation
      
          property :event_time, as: 'eventTime'
          property :message, as: 'message'
          property :service_context, as: 'serviceContext', class: Google::Apis::ClouderrorreportingV1beta1::ServiceContext, decorator: Google::Apis::ClouderrorreportingV1beta1::ServiceContext::Representation
      
        end
      end
      
      class ServiceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_type, as: 'resourceType'
          property :service, as: 'service'
          property :version, as: 'version'
        end
      end
      
      class SourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_path, as: 'filePath'
          property :function_name, as: 'functionName'
          property :line_number, as: 'lineNumber'
        end
      end
      
      class SourceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repository, as: 'repository'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class TimedCount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class TrackingIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
    end
  end
end
