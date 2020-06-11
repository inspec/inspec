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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module CloudtasksV2beta2
      # Cloud Tasks API
      #
      # Manages the execution of large numbers of distributed requests.
      #
      # @example
      #    require 'google/apis/cloudtasks_v2beta2'
      #
      #    Cloudtasks = Google::Apis::CloudtasksV2beta2 # Alias the module
      #    service = Cloudtasks::CloudTasksService.new
      #
      # @see https://cloud.google.com/tasks/
      class CloudTasksService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudtasks.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets information about a location.
        # @param [String] name
        #   Resource name for the location.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+name}', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::Location::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Location
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists information about the supported locations for this service.
        # @param [String] name
        #   The resource that owns the locations collection, if applicable.
        # @param [String] filter
        #   The standard list filter.
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+name}/locations', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::ListLocationsResponse::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a queue.
        # Queues created with this method allow tasks to live for a maximum of 31
        # days. After a task is 31 days old, the task will be deleted regardless of
        # whether
        # it was dispatched or not.
        # WARNING: Using this method may have unintended side effects if you are
        # using an App Engine `queue.yaml` or `queue.xml` file to manage your queues.
        # Read
        # [Overview of Queue Management and
        # queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using
        # this method.
        # @param [String] parent
        #   Required. The location name in which the queue will be created.
        #   For example: `projects/PROJECT_ID/locations/LOCATION_ID`
        #   The list of allowed locations can be obtained by calling Cloud
        #   Tasks' implementation of
        #   ListLocations.
        # @param [Google::Apis::CloudtasksV2beta2::Queue] queue_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_queue(parent, queue_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+parent}/queues', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.request_object = queue_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a queue.
        # This command will delete the queue even if it has tasks in it.
        # Note: If you delete a queue, a queue with the same name can't be created
        # for 7 days.
        # WARNING: Using this method may have unintended side effects if you are
        # using an App Engine `queue.yaml` or `queue.xml` file to manage your queues.
        # Read
        # [Overview of Queue Management and
        # queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using
        # this method.
        # @param [String] name
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_queue(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2beta2/{+name}', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::Empty::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a queue.
        # @param [String] name
        #   Required. The resource name of the queue. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_queue(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+name}', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a Queue.
        # Returns an empty policy if the resource exists and does not have a policy
        # set.
        # Authorization requires the following
        # [Google IAM](https://cloud.google.com/iam) permission on the specified
        # resource parent:
        # * `cloudtasks.queues.getIamPolicy`
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudtasksV2beta2::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_queue_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Policy::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists queues.
        # Queues are returned in lexicographical order.
        # @param [String] parent
        #   Required. The location name.
        #   For example: `projects/PROJECT_ID/locations/LOCATION_ID`
        # @param [String] filter
        #   `filter` can be used to specify a subset of queues. Any Queue
        #   field can be used as a filter and several operators as supported.
        #   For example: `<=, <, >=, >, !=, =, :`. The filter syntax is the same as
        #   described in
        #   [Stackdriver's Advanced Logs
        #   Filters](https://cloud.google.com/logging/docs/view/advanced_filters).
        #   Sample filter "app_engine_http_target: *".
        #   Note that using filters might cause fewer queues than the
        #   requested_page size to be returned.
        # @param [Fixnum] page_size
        #   Requested page size.
        #   The maximum page size is 9800. If unspecified, the page size will
        #   be the maximum. Fewer queues than requested might be returned,
        #   even if more queues exist; use the
        #   next_page_token in the
        #   response to determine if more queues exist.
        # @param [String] page_token
        #   A token identifying the page of results to return.
        #   To request the first page results, page_token must be empty. To
        #   request the next page of results, page_token must be the value of
        #   next_page_token returned
        #   from the previous call to ListQueues
        #   method. It is an error to switch the value of the
        #   filter while iterating through pages.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::ListQueuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::ListQueuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_queues(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+parent}/queues', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::ListQueuesResponse::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::ListQueuesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a queue.
        # This method creates the queue if it does not exist and updates
        # the queue if it does exist.
        # Queues created with this method allow tasks to live for a maximum of 31
        # days. After a task is 31 days old, the task will be deleted regardless of
        # whether
        # it was dispatched or not.
        # WARNING: Using this method may have unintended side effects if you are
        # using an App Engine `queue.yaml` or `queue.xml` file to manage your queues.
        # Read
        # [Overview of Queue Management and
        # queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using
        # this method.
        # @param [String] name
        #   Caller-specified and required in CreateQueue,
        #   after which it becomes output only.
        #   The queue name.
        #   The queue name must have the following format:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        #   * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
        #   hyphens (-), colons (:), or periods (.).
        #   For more information, see
        #   [Identifying
        #   projects](https://cloud.google.com/resource-manager/docs/creating-managing-
        #   projects#identifying_projects)
        #   * `LOCATION_ID` is the canonical ID for the queue's location.
        #   The list of available locations can be obtained by calling
        #   ListLocations.
        #   For more information, see https://cloud.google.com/about/locations/.
        #   * `QUEUE_ID` can contain letters ([A-Za-z]), numbers ([0-9]), or
        #   hyphens (-). The maximum length is 100 characters.
        # @param [Google::Apis::CloudtasksV2beta2::Queue] queue_object
        # @param [String] update_mask
        #   A mask used to specify which fields of the queue are being updated.
        #   If empty, then all fields will be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_queue(name, queue_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2beta2/{+name}', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.request_object = queue_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pauses the queue.
        # If a queue is paused then the system will stop dispatching tasks
        # until the queue is resumed via
        # ResumeQueue. Tasks can still be added
        # when the queue is paused. A queue is paused if its
        # state is PAUSED.
        # @param [String] name
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/location/LOCATION_ID/queues/QUEUE_ID`
        # @param [Google::Apis::CloudtasksV2beta2::PauseQueueRequest] pause_queue_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pause_queue(name, pause_queue_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:pause', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::PauseQueueRequest::Representation
          command.request_object = pause_queue_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Purges a queue by deleting all of its tasks.
        # All tasks created before this method is called are permanently deleted.
        # Purge operations can take up to one minute to take effect. Tasks
        # might be dispatched before the purge takes effect. A purge is irreversible.
        # @param [String] name
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/location/LOCATION_ID/queues/QUEUE_ID`
        # @param [Google::Apis::CloudtasksV2beta2::PurgeQueueRequest] purge_queue_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def purge_queue(name, purge_queue_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:purge', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::PurgeQueueRequest::Representation
          command.request_object = purge_queue_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Resume a queue.
        # This method resumes a queue after it has been
        # PAUSED or
        # DISABLED. The state of a queue is stored
        # in the queue's state; after calling this method it
        # will be set to RUNNING.
        # WARNING: Resuming many high-QPS queues at the same time can
        # lead to target overloading. If you are resuming high-QPS
        # queues, follow the 500/50/5 pattern described in
        # [Managing Cloud Tasks Scaling
        # Risks](https://cloud.google.com/tasks/docs/manage-cloud-task-scaling).
        # @param [String] name
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/location/LOCATION_ID/queues/QUEUE_ID`
        # @param [Google::Apis::CloudtasksV2beta2::ResumeQueueRequest] resume_queue_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Queue] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Queue]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def resume_queue(name, resume_queue_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:resume', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::ResumeQueueRequest::Representation
          command.request_object = resume_queue_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Queue::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Queue
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy for a Queue. Replaces any existing
        # policy.
        # Note: The Cloud Console does not check queue-level IAM permissions yet.
        # Project-level permissions are required to use the Cloud Console.
        # Authorization requires the following
        # [Google IAM](https://cloud.google.com/iam) permission on the specified
        # resource parent:
        # * `cloudtasks.queues.setIamPolicy`
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudtasksV2beta2::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_queue_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Policy::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on a Queue.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudtasksV2beta2::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_queue_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Acknowledges a pull task.
        # The worker, that is, the entity that
        # leased this task must call this method
        # to indicate that the work associated with the task has finished.
        # The worker must acknowledge a task within the
        # lease_duration or the lease
        # will expire and the task will become available to be leased
        # again. After the task is acknowledged, it will not be returned
        # by a later LeaseTasks,
        # GetTask, or
        # ListTasks.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [Google::Apis::CloudtasksV2beta2::AcknowledgeTaskRequest] acknowledge_task_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_task(name, acknowledge_task_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:acknowledge', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::AcknowledgeTaskRequest::Representation
          command.request_object = acknowledge_task_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Empty::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancel a pull task's lease.
        # The worker can use this method to cancel a task's lease by
        # setting its schedule_time to now. This will
        # make the task available to be leased to the next caller of
        # LeaseTasks.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [Google::Apis::CloudtasksV2beta2::CancelLeaseRequest] cancel_lease_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_task_lease(name, cancel_lease_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:cancelLease', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::CancelLeaseRequest::Representation
          command.request_object = cancel_lease_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Task::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Task
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a task and adds it to a queue.
        # Tasks cannot be updated after creation; there is no UpdateTask command.
        # * For App Engine queues, the maximum task size is
        # 100KB.
        # * For pull queues, the maximum task size is 1MB.
        # @param [String] parent
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        #   The queue must already exist.
        # @param [Google::Apis::CloudtasksV2beta2::CreateTaskRequest] create_task_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_task(parent, create_task_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+parent}/tasks', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::CreateTaskRequest::Representation
          command.request_object = create_task_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Task::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Task
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a task.
        # A task can be deleted if it is scheduled or dispatched. A task
        # cannot be deleted if it has completed successfully or permanently
        # failed.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_queue_task(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2beta2/{+name}', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::Empty::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a task.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [String] response_view
        #   The response_view specifies which subset of the Task will be
        #   returned.
        #   By default response_view is BASIC; not all
        #   information is retrieved by default because some data, such as
        #   payloads, might be desirable to return only when needed because
        #   of its large size or because of the sensitivity of data that it
        #   contains.
        #   Authorization for FULL requires
        #   `cloudtasks.tasks.fullView` [Google IAM](https://cloud.google.com/iam/)
        #   permission on the Task resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_queue_task(name, response_view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+name}', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::Task::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Task
          command.params['name'] = name unless name.nil?
          command.query['responseView'] = response_view unless response_view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leases tasks from a pull queue for
        # lease_duration.
        # This method is invoked by the worker to obtain a lease. The
        # worker must acknowledge the task via
        # AcknowledgeTask after they have
        # performed the work associated with the task.
        # The payload is intended to store data that
        # the worker needs to perform the work associated with the task. To
        # return the payloads in the response, set
        # response_view to
        # FULL.
        # A maximum of 10 qps of LeaseTasks
        # requests are allowed per
        # queue. RESOURCE_EXHAUSTED
        # is returned when this limit is
        # exceeded. RESOURCE_EXHAUSTED
        # is also returned when
        # max_tasks_dispatched_per_second
        # is exceeded.
        # @param [String] parent
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        # @param [Google::Apis::CloudtasksV2beta2::LeaseTasksRequest] lease_tasks_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::LeaseTasksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::LeaseTasksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lease_tasks(parent, lease_tasks_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+parent}/tasks:lease', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::LeaseTasksRequest::Representation
          command.request_object = lease_tasks_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::LeaseTasksResponse::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::LeaseTasksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the tasks in a queue.
        # By default, only the BASIC view is retrieved
        # due to performance considerations;
        # response_view controls the
        # subset of information which is returned.
        # The tasks may be returned in any order. The ordering may change at any
        # time.
        # @param [String] parent
        #   Required. The queue name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
        # @param [Fixnum] page_size
        #   Maximum page size.
        #   Fewer tasks than requested might be returned, even if more tasks exist; use
        #   next_page_token in the response to
        #   determine if more tasks exist.
        #   The maximum page size is 1000. If unspecified, the page size will be the
        #   maximum.
        # @param [String] page_token
        #   A token identifying the page of results to return.
        #   To request the first page results, page_token must be empty. To
        #   request the next page of results, page_token must be the value of
        #   next_page_token returned
        #   from the previous call to ListTasks
        #   method.
        #   The page token is valid for only 2 hours.
        # @param [String] response_view
        #   The response_view specifies which subset of the Task will be
        #   returned.
        #   By default response_view is BASIC; not all
        #   information is retrieved by default because some data, such as
        #   payloads, might be desirable to return only when needed because
        #   of its large size or because of the sensitivity of data that it
        #   contains.
        #   Authorization for FULL requires
        #   `cloudtasks.tasks.fullView` [Google IAM](https://cloud.google.com/iam/)
        #   permission on the Task resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::ListTasksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::ListTasksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_queue_tasks(parent, page_size: nil, page_token: nil, response_view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta2/{+parent}/tasks', options)
          command.response_representation = Google::Apis::CloudtasksV2beta2::ListTasksResponse::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::ListTasksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['responseView'] = response_view unless response_view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Renew the current lease of a pull task.
        # The worker can use this method to extend the lease by a new
        # duration, starting from now. The new task lease will be
        # returned in the task's schedule_time.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [Google::Apis::CloudtasksV2beta2::RenewLeaseRequest] renew_lease_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def renew_task_lease(name, renew_lease_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:renewLease', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::RenewLeaseRequest::Representation
          command.request_object = renew_lease_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Task::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Task
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Forces a task to run now.
        # When this method is called, Cloud Tasks will dispatch the task, even if
        # the task is already running, the queue has reached its RateLimits or
        # is PAUSED.
        # This command is meant to be used for manual debugging. For
        # example, RunTask can be used to retry a failed
        # task after a fix has been made or to manually force a task to be
        # dispatched now.
        # The dispatched task is returned. That is, the task that is returned
        # contains the status after the task is dispatched but
        # before the task is received by its target.
        # If Cloud Tasks receives a successful response from the task's
        # target, then the task will be deleted; otherwise the task's
        # schedule_time will be reset to the time that
        # RunTask was called plus the retry delay specified
        # in the queue's RetryConfig.
        # RunTask returns
        # NOT_FOUND when it is called on a
        # task that has already succeeded or permanently failed.
        # RunTask cannot be called on a
        # pull task.
        # @param [String] name
        #   Required. The task name. For example:
        #   `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID`
        # @param [Google::Apis::CloudtasksV2beta2::RunTaskRequest] run_task_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtasksV2beta2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtasksV2beta2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_task(name, run_task_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta2/{+name}:run', options)
          command.request_representation = Google::Apis::CloudtasksV2beta2::RunTaskRequest::Representation
          command.request_object = run_task_request_object
          command.response_representation = Google::Apis::CloudtasksV2beta2::Task::Representation
          command.response_class = Google::Apis::CloudtasksV2beta2::Task
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
