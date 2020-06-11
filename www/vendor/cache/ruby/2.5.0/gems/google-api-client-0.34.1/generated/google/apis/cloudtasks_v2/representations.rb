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
    module CloudtasksV2
      
      class AppEngineHttpRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppEngineRouting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attempt
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateTaskRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListQueuesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTasksResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PauseQueueRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PurgeQueueRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Queue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RateLimits
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResumeQueueRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RetryConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunTaskRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Task
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppEngineHttpRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_engine_routing, as: 'appEngineRouting', class: Google::Apis::CloudtasksV2::AppEngineRouting, decorator: Google::Apis::CloudtasksV2::AppEngineRouting::Representation
      
          property :body, :base64 => true, as: 'body'
          hash :headers, as: 'headers'
          property :http_method, as: 'httpMethod'
          property :relative_uri, as: 'relativeUri'
        end
      end
      
      class AppEngineRouting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :instance, as: 'instance'
          property :service, as: 'service'
          property :version, as: 'version'
        end
      end
      
      class Attempt
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dispatch_time, as: 'dispatchTime'
          property :response_status, as: 'responseStatus', class: Google::Apis::CloudtasksV2::Status, decorator: Google::Apis::CloudtasksV2::Status::Representation
      
          property :response_time, as: 'responseTime'
          property :schedule_time, as: 'scheduleTime'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::CloudtasksV2::Expr, decorator: Google::Apis::CloudtasksV2::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class CreateTaskRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :response_view, as: 'responseView'
          property :task, as: 'task', class: Google::Apis::CloudtasksV2::Task, decorator: Google::Apis::CloudtasksV2::Task::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::CloudtasksV2::GetPolicyOptions, decorator: Google::Apis::CloudtasksV2::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::CloudtasksV2::Location, decorator: Google::Apis::CloudtasksV2::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListQueuesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :queues, as: 'queues', class: Google::Apis::CloudtasksV2::Queue, decorator: Google::Apis::CloudtasksV2::Queue::Representation
      
        end
      end
      
      class ListTasksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :tasks, as: 'tasks', class: Google::Apis::CloudtasksV2::Task, decorator: Google::Apis::CloudtasksV2::Task::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class PauseQueueRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::CloudtasksV2::Binding, decorator: Google::Apis::CloudtasksV2::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class PurgeQueueRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Queue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_engine_routing_override, as: 'appEngineRoutingOverride', class: Google::Apis::CloudtasksV2::AppEngineRouting, decorator: Google::Apis::CloudtasksV2::AppEngineRouting::Representation
      
          property :name, as: 'name'
          property :purge_time, as: 'purgeTime'
          property :rate_limits, as: 'rateLimits', class: Google::Apis::CloudtasksV2::RateLimits, decorator: Google::Apis::CloudtasksV2::RateLimits::Representation
      
          property :retry_config, as: 'retryConfig', class: Google::Apis::CloudtasksV2::RetryConfig, decorator: Google::Apis::CloudtasksV2::RetryConfig::Representation
      
          property :state, as: 'state'
        end
      end
      
      class RateLimits
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_burst_size, as: 'maxBurstSize'
          property :max_concurrent_dispatches, as: 'maxConcurrentDispatches'
          property :max_dispatches_per_second, as: 'maxDispatchesPerSecond'
        end
      end
      
      class ResumeQueueRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class RetryConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_attempts, as: 'maxAttempts'
          property :max_backoff, as: 'maxBackoff'
          property :max_doublings, as: 'maxDoublings'
          property :max_retry_duration, as: 'maxRetryDuration'
          property :min_backoff, as: 'minBackoff'
        end
      end
      
      class RunTaskRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :response_view, as: 'responseView'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudtasksV2::Policy, decorator: Google::Apis::CloudtasksV2::Policy::Representation
      
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class Task
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_engine_http_request, as: 'appEngineHttpRequest', class: Google::Apis::CloudtasksV2::AppEngineHttpRequest, decorator: Google::Apis::CloudtasksV2::AppEngineHttpRequest::Representation
      
          property :create_time, as: 'createTime'
          property :dispatch_count, as: 'dispatchCount'
          property :dispatch_deadline, as: 'dispatchDeadline'
          property :first_attempt, as: 'firstAttempt', class: Google::Apis::CloudtasksV2::Attempt, decorator: Google::Apis::CloudtasksV2::Attempt::Representation
      
          property :last_attempt, as: 'lastAttempt', class: Google::Apis::CloudtasksV2::Attempt, decorator: Google::Apis::CloudtasksV2::Attempt::Representation
      
          property :name, as: 'name'
          property :response_count, as: 'responseCount'
          property :schedule_time, as: 'scheduleTime'
          property :view, as: 'view'
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
    end
  end
end
