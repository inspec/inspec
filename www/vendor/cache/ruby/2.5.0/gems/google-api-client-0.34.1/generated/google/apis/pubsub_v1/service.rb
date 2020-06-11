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
    module PubsubV1
      # Cloud Pub/Sub API
      #
      # Provides reliable, many-to-many, asynchronous messaging between applications.
      #
      # @example
      #    require 'google/apis/pubsub_v1'
      #
      #    Pubsub = Google::Apis::PubsubV1 # Alias the module
      #    service = Pubsub::PubsubService.new
      #
      # @see https://cloud.google.com/pubsub/docs
      class PubsubService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://pubsub.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a snapshot from the requested subscription. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot.
        # <br><br>If the snapshot already exists, returns `ALREADY_EXISTS`.
        # If the requested subscription doesn't exist, returns `NOT_FOUND`.
        # If the backlog in the subscription is too old -- and the resulting snapshot
        # would expire in less than 1 hour -- then `FAILED_PRECONDITION` is returned.
        # See also the `Snapshot.expire_time` field. If the name is not provided in
        # the request, the server will assign a random
        # name for this snapshot on the same project as the subscription, conforming
        # to the
        # [resource name
        # format](https://cloud.google.com/pubsub/docs/admin#resource_names). The
        # generated name is populated in the returned Snapshot object. Note that for
        # REST API requests, you must specify a name in the request.
        # @param [String] name
        #   Optional user-provided name for this snapshot.
        #   If the name is not provided in the request, the server will assign a random
        #   name for this snapshot on the same project as the subscription.
        #   Note that for REST API requests, you must specify a name.  See the
        #   <a href="https://cloud.google.com/pubsub/docs/admin#resource_names">
        #   resource name rules</a>.
        #   Format is `projects/`project`/snapshots/`snap``.
        # @param [Google::Apis::PubsubV1::CreateSnapshotRequest] create_snapshot_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Snapshot] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Snapshot]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_snapshot(name, create_snapshot_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::CreateSnapshotRequest::Representation
          command.request_object = create_snapshot_request_object
          command.response_representation = Google::Apis::PubsubV1::Snapshot::Representation
          command.response_class = Google::Apis::PubsubV1::Snapshot
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes an existing snapshot. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot.<br><br>
        # When the snapshot is deleted, all messages retained in the snapshot
        # are immediately dropped. After a snapshot is deleted, a new one may be
        # created with the same name, but the new one has no association with the old
        # snapshot or its subscription, unless the same subscription is specified.
        # @param [String] snapshot
        #   The name of the snapshot to delete.
        #   Format is `projects/`project`/snapshots/`snap``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_snapshot(snapshot, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+snapshot}', options)
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['snapshot'] = snapshot unless snapshot.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the configuration details of a snapshot. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow you to manage message acknowledgments in bulk. That
        # is, you can set the acknowledgment state of messages in an existing
        # subscription to the state captured by a snapshot.
        # @param [String] snapshot
        #   The name of the snapshot to get.
        #   Format is `projects/`project`/snapshots/`snap``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Snapshot] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Snapshot]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_snapshot(snapshot, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+snapshot}', options)
          command.response_representation = Google::Apis::PubsubV1::Snapshot::Representation
          command.response_class = Google::Apis::PubsubV1::Snapshot
          command.params['snapshot'] = snapshot unless snapshot.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a resource.
        # Returns an empty policy if the resource exists and does not have a policy
        # set.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_snapshot_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the existing snapshots. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot.
        # @param [String] project
        #   The name of the project in which to list snapshots.
        #   Format is `projects/`project-id``.
        # @param [Fixnum] page_size
        #   Maximum number of snapshots to return.
        # @param [String] page_token
        #   The value returned by the last `ListSnapshotsResponse`; indicates that this
        #   is a continuation of a prior `ListSnapshots` call, and that the system
        #   should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::ListSnapshotsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::ListSnapshotsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_snapshots(project, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+project}/snapshots', options)
          command.response_representation = Google::Apis::PubsubV1::ListSnapshotsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::ListSnapshotsResponse
          command.params['project'] = project unless project.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing snapshot. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot.
        # @param [String] name
        #   The name of the snapshot.
        # @param [Google::Apis::PubsubV1::UpdateSnapshotRequest] update_snapshot_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Snapshot] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Snapshot]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_snapshot(name, update_snapshot_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::UpdateSnapshotRequest::Representation
          command.request_object = update_snapshot_request_object
          command.response_representation = Google::Apis::PubsubV1::Snapshot::Representation
          command.response_class = Google::Apis::PubsubV1::Snapshot
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_snapshot_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::PubsubV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_snapshot_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::PubsubV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::PubsubV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Acknowledges the messages associated with the `ack_ids` in the
        # `AcknowledgeRequest`. The Pub/Sub system can remove the relevant messages
        # from the subscription.
        # Acknowledging a message whose ack deadline has expired may succeed,
        # but such a message may be redelivered later. Acknowledging a message more
        # than once will not result in an error.
        # @param [String] subscription
        #   The subscription whose message is being acknowledged.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [Google::Apis::PubsubV1::AcknowledgeRequest] acknowledge_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def acknowledge_subscription(subscription, acknowledge_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+subscription}:acknowledge', options)
          command.request_representation = Google::Apis::PubsubV1::AcknowledgeRequest::Representation
          command.request_object = acknowledge_request_object
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a subscription to a given topic. See the
        # <a href="https://cloud.google.com/pubsub/docs/admin#resource_names">
        # resource name rules</a>.
        # If the subscription already exists, returns `ALREADY_EXISTS`.
        # If the corresponding topic doesn't exist, returns `NOT_FOUND`.
        # If the name is not provided in the request, the server will assign a random
        # name for this subscription on the same project as the topic, conforming
        # to the
        # [resource name
        # format](https://cloud.google.com/pubsub/docs/admin#resource_names). The
        # generated name is populated in the returned Subscription object. Note that
        # for REST API requests, you must specify a name in the request.
        # @param [String] name
        #   The name of the subscription. It must have the format
        #   `"projects/`project`/subscriptions/`subscription`"`. ``subscription`` must
        #   start with a letter, and contain only letters (`[A-Za-z]`), numbers
        #   (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`),
        #   plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters
        #   in length, and it must not start with `"goog"`.
        # @param [Google::Apis::PubsubV1::Subscription] subscription_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_subscription(name, subscription_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::Subscription::Representation
          command.request_object = subscription_object
          command.response_representation = Google::Apis::PubsubV1::Subscription::Representation
          command.response_class = Google::Apis::PubsubV1::Subscription
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing subscription. All messages retained in the subscription
        # are immediately dropped. Calls to `Pull` after deletion will return
        # `NOT_FOUND`. After a subscription is deleted, a new one may be created with
        # the same name, but the new one has no association with the old
        # subscription or its topic unless the same topic is specified.
        # @param [String] subscription
        #   The subscription to delete.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_subscription(subscription, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+subscription}', options)
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the configuration details of a subscription.
        # @param [String] subscription
        #   The name of the subscription to get.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_subscription(subscription, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+subscription}', options)
          command.response_representation = Google::Apis::PubsubV1::Subscription::Representation
          command.response_class = Google::Apis::PubsubV1::Subscription
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a resource.
        # Returns an empty policy if the resource exists and does not have a policy
        # set.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_subscription_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists matching subscriptions.
        # @param [String] project
        #   The name of the project in which to list subscriptions.
        #   Format is `projects/`project-id``.
        # @param [Fixnum] page_size
        #   Maximum number of subscriptions to return.
        # @param [String] page_token
        #   The value returned by the last `ListSubscriptionsResponse`; indicates that
        #   this is a continuation of a prior `ListSubscriptions` call, and that the
        #   system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::ListSubscriptionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::ListSubscriptionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_subscriptions(project, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+project}/subscriptions', options)
          command.response_representation = Google::Apis::PubsubV1::ListSubscriptionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::ListSubscriptionsResponse
          command.params['project'] = project unless project.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the ack deadline for a specific message. This method is useful
        # to indicate that more time is needed to process a message by the
        # subscriber, or to make the message available for redelivery if the
        # processing was interrupted. Note that this does not modify the
        # subscription-level `ackDeadlineSeconds` used for subsequent messages.
        # @param [String] subscription
        #   The name of the subscription.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [Google::Apis::PubsubV1::ModifyAckDeadlineRequest] modify_ack_deadline_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_subscription_ack_deadline(subscription, modify_ack_deadline_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+subscription}:modifyAckDeadline', options)
          command.request_representation = Google::Apis::PubsubV1::ModifyAckDeadlineRequest::Representation
          command.request_object = modify_ack_deadline_request_object
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies the `PushConfig` for a specified subscription.
        # This may be used to change a push subscription to a pull one (signified by
        # an empty `PushConfig`) or vice versa, or change the endpoint URL and other
        # attributes of a push subscription. Messages will accumulate for delivery
        # continuously through the call regardless of changes to the `PushConfig`.
        # @param [String] subscription
        #   The name of the subscription.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [Google::Apis::PubsubV1::ModifyPushConfigRequest] modify_push_config_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_subscription_push_config(subscription, modify_push_config_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+subscription}:modifyPushConfig', options)
          command.request_representation = Google::Apis::PubsubV1::ModifyPushConfigRequest::Representation
          command.request_object = modify_push_config_request_object
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing subscription. Note that certain properties of a
        # subscription, such as its topic, are not modifiable.
        # @param [String] name
        #   The name of the subscription. It must have the format
        #   `"projects/`project`/subscriptions/`subscription`"`. ``subscription`` must
        #   start with a letter, and contain only letters (`[A-Za-z]`), numbers
        #   (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`),
        #   plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters
        #   in length, and it must not start with `"goog"`.
        # @param [Google::Apis::PubsubV1::UpdateSubscriptionRequest] update_subscription_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Subscription] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Subscription]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_subscription(name, update_subscription_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::UpdateSubscriptionRequest::Representation
          command.request_object = update_subscription_request_object
          command.response_representation = Google::Apis::PubsubV1::Subscription::Representation
          command.response_class = Google::Apis::PubsubV1::Subscription
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pulls messages from the server. The server may return `UNAVAILABLE` if
        # there are too many concurrent pull requests pending for the given
        # subscription.
        # @param [String] subscription
        #   The subscription from which messages should be pulled.
        #   Format is `projects/`project`/subscriptions/`sub``.
        # @param [Google::Apis::PubsubV1::PullRequest] pull_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::PullResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::PullResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def pull_subscription(subscription, pull_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+subscription}:pull', options)
          command.request_representation = Google::Apis::PubsubV1::PullRequest::Representation
          command.request_object = pull_request_object
          command.response_representation = Google::Apis::PubsubV1::PullResponse::Representation
          command.response_class = Google::Apis::PubsubV1::PullResponse
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Seeks an existing subscription to a point in time or to a given snapshot,
        # whichever is provided in the request. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot. Note that both the subscription and the snapshot
        # must be on the same topic.
        # @param [String] subscription
        #   The subscription to affect.
        # @param [Google::Apis::PubsubV1::SeekRequest] seek_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::SeekResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::SeekResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def seek_subscription(subscription, seek_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+subscription}:seek', options)
          command.request_representation = Google::Apis::PubsubV1::SeekRequest::Representation
          command.request_object = seek_request_object
          command.response_representation = Google::Apis::PubsubV1::SeekResponse::Representation
          command.response_class = Google::Apis::PubsubV1::SeekResponse
          command.params['subscription'] = subscription unless subscription.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_subscription_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::PubsubV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_subscription_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::PubsubV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::PubsubV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates the given topic with the given name. See the
        # <a href="https://cloud.google.com/pubsub/docs/admin#resource_names">
        # resource name rules</a>.
        # @param [String] name
        #   The name of the topic. It must have the format
        #   `"projects/`project`/topics/`topic`"`. ``topic`` must start with a letter,
        #   and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`),
        #   underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent
        #   signs (`%`). It must be between 3 and 255 characters in length, and it
        #   must not start with `"goog"`.
        # @param [Google::Apis::PubsubV1::Topic] topic_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_topic(name, topic_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::Topic::Representation
          command.request_object = topic_object
          command.response_representation = Google::Apis::PubsubV1::Topic::Representation
          command.response_class = Google::Apis::PubsubV1::Topic
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the topic with the given name. Returns `NOT_FOUND` if the topic
        # does not exist. After a topic is deleted, a new topic may be created with
        # the same name; this is an entirely new topic with none of the old
        # configuration or subscriptions. Existing subscriptions to this topic are
        # not deleted, but their `topic` field is set to `_deleted-topic_`.
        # @param [String] topic
        #   Name of the topic to delete.
        #   Format is `projects/`project`/topics/`topic``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_topic(topic, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+topic}', options)
          command.response_representation = Google::Apis::PubsubV1::Empty::Representation
          command.response_class = Google::Apis::PubsubV1::Empty
          command.params['topic'] = topic unless topic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the configuration of a topic.
        # @param [String] topic
        #   The name of the topic to get.
        #   Format is `projects/`project`/topics/`topic``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_topic(topic, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+topic}', options)
          command.response_representation = Google::Apis::PubsubV1::Topic::Representation
          command.response_class = Google::Apis::PubsubV1::Topic
          command.params['topic'] = topic unless topic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a resource.
        # Returns an empty policy if the resource exists and does not have a policy
        # set.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_topic_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists matching topics.
        # @param [String] project
        #   The name of the project in which to list topics.
        #   Format is `projects/`project-id``.
        # @param [Fixnum] page_size
        #   Maximum number of topics to return.
        # @param [String] page_token
        #   The value returned by the last `ListTopicsResponse`; indicates that this is
        #   a continuation of a prior `ListTopics` call, and that the system should
        #   return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::ListTopicsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::ListTopicsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_topics(project, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+project}/topics', options)
          command.response_representation = Google::Apis::PubsubV1::ListTopicsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::ListTopicsResponse
          command.params['project'] = project unless project.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing topic. Note that certain properties of a
        # topic are not modifiable.
        # @param [String] name
        #   The name of the topic. It must have the format
        #   `"projects/`project`/topics/`topic`"`. ``topic`` must start with a letter,
        #   and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`),
        #   underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent
        #   signs (`%`). It must be between 3 and 255 characters in length, and it
        #   must not start with `"goog"`.
        # @param [Google::Apis::PubsubV1::UpdateTopicRequest] update_topic_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_topic(name, update_topic_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::PubsubV1::UpdateTopicRequest::Representation
          command.request_object = update_topic_request_object
          command.response_representation = Google::Apis::PubsubV1::Topic::Representation
          command.response_class = Google::Apis::PubsubV1::Topic
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds one or more messages to the topic. Returns `NOT_FOUND` if the topic
        # does not exist.
        # @param [String] topic
        #   The messages in the request will be published on this topic.
        #   Format is `projects/`project`/topics/`topic``.
        # @param [Google::Apis::PubsubV1::PublishRequest] publish_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::PublishResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::PublishResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_topic(topic, publish_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+topic}:publish', options)
          command.request_representation = Google::Apis::PubsubV1::PublishRequest::Representation
          command.request_object = publish_request_object
          command.response_representation = Google::Apis::PubsubV1::PublishResponse::Representation
          command.response_class = Google::Apis::PubsubV1::PublishResponse
          command.params['topic'] = topic unless topic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified resource. Replaces any
        # existing policy.
        # Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and PERMISSION_DENIED
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_topic_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::PubsubV1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::PubsubV1::Policy::Representation
          command.response_class = Google::Apis::PubsubV1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified resource.
        # If the resource does not exist, this will return an empty set of
        # permissions, not a NOT_FOUND error.
        # Note: This operation is designed to be used for building permission-aware
        # UIs and command-line tools, not for authorization checking. This operation
        # may "fail open" without warning.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::PubsubV1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_topic_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::PubsubV1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::PubsubV1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the names of the snapshots on this topic. Snapshots are used in
        # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
        # operations, which allow
        # you to manage message acknowledgments in bulk. That is, you can set the
        # acknowledgment state of messages in an existing subscription to the state
        # captured by a snapshot.
        # @param [String] topic
        #   The name of the topic that snapshots are attached to.
        #   Format is `projects/`project`/topics/`topic``.
        # @param [Fixnum] page_size
        #   Maximum number of snapshot names to return.
        # @param [String] page_token
        #   The value returned by the last `ListTopicSnapshotsResponse`; indicates
        #   that this is a continuation of a prior `ListTopicSnapshots` call, and
        #   that the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::ListTopicSnapshotsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::ListTopicSnapshotsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_topic_snapshots(topic, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+topic}/snapshots', options)
          command.response_representation = Google::Apis::PubsubV1::ListTopicSnapshotsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::ListTopicSnapshotsResponse
          command.params['topic'] = topic unless topic.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the names of the subscriptions on this topic.
        # @param [String] topic
        #   The name of the topic that subscriptions are attached to.
        #   Format is `projects/`project`/topics/`topic``.
        # @param [Fixnum] page_size
        #   Maximum number of subscription names to return.
        # @param [String] page_token
        #   The value returned by the last `ListTopicSubscriptionsResponse`; indicates
        #   that this is a continuation of a prior `ListTopicSubscriptions` call, and
        #   that the system should return the next page of data.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PubsubV1::ListTopicSubscriptionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PubsubV1::ListTopicSubscriptionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_topic_subscriptions(topic, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+topic}/subscriptions', options)
          command.response_representation = Google::Apis::PubsubV1::ListTopicSubscriptionsResponse::Representation
          command.response_class = Google::Apis::PubsubV1::ListTopicSubscriptionsResponse
          command.params['topic'] = topic unless topic.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
