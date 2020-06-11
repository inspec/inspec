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
    module TasksV1
      # Tasks API
      #
      # Manages your tasks and task lists.
      #
      # @example
      #    require 'google/apis/tasks_v1'
      #
      #    Tasks = Google::Apis::TasksV1 # Alias the module
      #    service = Tasks::TasksService.new
      #
      # @see https://developers.google.com/google-apps/tasks/firstapp
      class TasksService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'tasks/v1/')
          @batch_path = 'batch/tasks/v1'
        end
        
        # Deletes the authenticated user's specified task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_tasklist(tasklist, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'users/@me/lists/{tasklist}', options)
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the authenticated user's specified task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::TaskList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::TaskList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_tasklist(tasklist, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/@me/lists/{tasklist}', options)
          command.response_representation = Google::Apis::TasksV1::TaskList::Representation
          command.response_class = Google::Apis::TasksV1::TaskList
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new task list and adds it to the authenticated user's task lists.
        # @param [Google::Apis::TasksV1::TaskList] task_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::TaskList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::TaskList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_tasklist(task_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'users/@me/lists', options)
          command.request_representation = Google::Apis::TasksV1::TaskList::Representation
          command.request_object = task_list_object
          command.response_representation = Google::Apis::TasksV1::TaskList::Representation
          command.response_class = Google::Apis::TasksV1::TaskList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns all the authenticated user's task lists.
        # @param [Fixnum] max_results
        #   Maximum number of task lists returned on one page. Optional. The default is 20
        #   (max allowed: 100).
        # @param [String] page_token
        #   Token specifying the result page to return. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::TaskLists] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::TaskLists]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tasklists(max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/@me/lists', options)
          command.response_representation = Google::Apis::TasksV1::TaskLists::Representation
          command.response_class = Google::Apis::TasksV1::TaskLists
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the authenticated user's specified task list. This method supports
        # patch semantics.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [Google::Apis::TasksV1::TaskList] task_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::TaskList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::TaskList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_tasklist(tasklist, task_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'users/@me/lists/{tasklist}', options)
          command.request_representation = Google::Apis::TasksV1::TaskList::Representation
          command.request_object = task_list_object
          command.response_representation = Google::Apis::TasksV1::TaskList::Representation
          command.response_class = Google::Apis::TasksV1::TaskList
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the authenticated user's specified task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [Google::Apis::TasksV1::TaskList] task_list_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::TaskList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::TaskList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_tasklist(tasklist, task_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'users/@me/lists/{tasklist}', options)
          command.request_representation = Google::Apis::TasksV1::TaskList::Representation
          command.request_object = task_list_object
          command.response_representation = Google::Apis::TasksV1::TaskList::Representation
          command.response_class = Google::Apis::TasksV1::TaskList
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears all completed tasks from the specified task list. The affected tasks
        # will be marked as 'hidden' and no longer be returned by default when
        # retrieving all tasks for a task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def clear_task(tasklist, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'lists/{tasklist}/clear', options)
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified task from the task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] task
        #   Task identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_task(tasklist, task, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'lists/{tasklist}/tasks/{task}', options)
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.params['task'] = task unless task.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the specified task.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] task
        #   Task identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_task(tasklist, task, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'lists/{tasklist}/tasks/{task}', options)
          command.response_representation = Google::Apis::TasksV1::Task::Representation
          command.response_class = Google::Apis::TasksV1::Task
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.params['task'] = task unless task.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new task on the specified task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [Google::Apis::TasksV1::Task] task_object
        # @param [String] parent
        #   Parent task identifier. If the task is created at the top level, this
        #   parameter is omitted. Optional.
        # @param [String] previous
        #   Previous sibling task identifier. If the task is created at the first position
        #   among its siblings, this parameter is omitted. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_task(tasklist, task_object = nil, parent: nil, previous: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'lists/{tasklist}/tasks', options)
          command.request_representation = Google::Apis::TasksV1::Task::Representation
          command.request_object = task_object
          command.response_representation = Google::Apis::TasksV1::Task::Representation
          command.response_class = Google::Apis::TasksV1::Task
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['previous'] = previous unless previous.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns all tasks in the specified task list.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] completed_max
        #   Upper bound for a task's completion date (as a RFC 3339 timestamp) to filter
        #   by. Optional. The default is not to filter by completion date.
        # @param [String] completed_min
        #   Lower bound for a task's completion date (as a RFC 3339 timestamp) to filter
        #   by. Optional. The default is not to filter by completion date.
        # @param [String] due_max
        #   Upper bound for a task's due date (as a RFC 3339 timestamp) to filter by.
        #   Optional. The default is not to filter by due date.
        # @param [String] due_min
        #   Lower bound for a task's due date (as a RFC 3339 timestamp) to filter by.
        #   Optional. The default is not to filter by due date.
        # @param [Fixnum] max_results
        #   Maximum number of task lists returned on one page. Optional. The default is 20
        #   (max allowed: 100).
        # @param [String] page_token
        #   Token specifying the result page to return. Optional.
        # @param [Boolean] show_completed
        #   Flag indicating whether completed tasks are returned in the result. Optional.
        #   The default is True.
        # @param [Boolean] show_deleted
        #   Flag indicating whether deleted tasks are returned in the result. Optional.
        #   The default is False.
        # @param [Boolean] show_hidden
        #   Flag indicating whether hidden tasks are returned in the result. Optional. The
        #   default is False.
        # @param [String] updated_min
        #   Lower bound for a task's last modification time (as a RFC 3339 timestamp) to
        #   filter by. Optional. The default is not to filter by last modification time.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Tasks] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Tasks]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tasks(tasklist, completed_max: nil, completed_min: nil, due_max: nil, due_min: nil, max_results: nil, page_token: nil, show_completed: nil, show_deleted: nil, show_hidden: nil, updated_min: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'lists/{tasklist}/tasks', options)
          command.response_representation = Google::Apis::TasksV1::Tasks::Representation
          command.response_class = Google::Apis::TasksV1::Tasks
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.query['completedMax'] = completed_max unless completed_max.nil?
          command.query['completedMin'] = completed_min unless completed_min.nil?
          command.query['dueMax'] = due_max unless due_max.nil?
          command.query['dueMin'] = due_min unless due_min.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showCompleted'] = show_completed unless show_completed.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['showHidden'] = show_hidden unless show_hidden.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves the specified task to another position in the task list. This can
        # include putting it as a child task under a new parent and/or move it to a
        # different position among its sibling tasks.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] task
        #   Task identifier.
        # @param [String] parent
        #   New parent task identifier. If the task is moved to the top level, this
        #   parameter is omitted. Optional.
        # @param [String] previous
        #   New previous sibling task identifier. If the task is moved to the first
        #   position among its siblings, this parameter is omitted. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def move_task(tasklist, task, parent: nil, previous: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'lists/{tasklist}/tasks/{task}/move', options)
          command.response_representation = Google::Apis::TasksV1::Task::Representation
          command.response_class = Google::Apis::TasksV1::Task
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.params['task'] = task unless task.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['previous'] = previous unless previous.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified task. This method supports patch semantics.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] task
        #   Task identifier.
        # @param [Google::Apis::TasksV1::Task] task_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_task(tasklist, task, task_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'lists/{tasklist}/tasks/{task}', options)
          command.request_representation = Google::Apis::TasksV1::Task::Representation
          command.request_object = task_object
          command.response_representation = Google::Apis::TasksV1::Task::Representation
          command.response_class = Google::Apis::TasksV1::Task
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.params['task'] = task unless task.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified task.
        # @param [String] tasklist
        #   Task list identifier.
        # @param [String] task
        #   Task identifier.
        # @param [Google::Apis::TasksV1::Task] task_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::TasksV1::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::TasksV1::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_task(tasklist, task, task_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'lists/{tasklist}/tasks/{task}', options)
          command.request_representation = Google::Apis::TasksV1::Task::Representation
          command.request_object = task_object
          command.response_representation = Google::Apis::TasksV1::Task::Representation
          command.response_class = Google::Apis::TasksV1::Task
          command.params['tasklist'] = tasklist unless tasklist.nil?
          command.params['task'] = task unless task.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
