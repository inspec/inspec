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
    module AlertcenterV1beta1
      # G Suite Alert Center API
      #
      # Manages alerts on issues affecting your domain.
      #
      # @example
      #    require 'google/apis/alertcenter_v1beta1'
      #
      #    Alertcenter = Google::Apis::AlertcenterV1beta1 # Alias the module
      #    service = Alertcenter::AlertCenterService.new
      #
      # @see https://developers.google.com/admin-sdk/alertcenter/
      class AlertCenterService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://alertcenter.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Performs batch delete operation on alerts.
        # @param [Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsRequest] batch_delete_alerts_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_delete_alerts(batch_delete_alerts_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/alerts:batchDelete', options)
          command.request_representation = Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsRequest::Representation
          command.request_object = batch_delete_alerts_request_object
          command.response_representation = Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsResponse::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::BatchDeleteAlertsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Performs batch undelete operation on alerts.
        # @param [Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsRequest] batch_undelete_alerts_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_undelete_alerts(batch_undelete_alerts_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/alerts:batchUndelete', options)
          command.request_representation = Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsRequest::Representation
          command.request_object = batch_undelete_alerts_request_object
          command.response_representation = Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsResponse::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::BatchUndeleteAlertsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks the specified alert for deletion. An alert that has been marked for
        # deletion is removed from Alert Center after 30 days.
        # Marking an alert for deletion has no effect on an alert which has
        # already been marked for deletion. Attempting to mark a nonexistent alert
        # for deletion results in a `NOT_FOUND` error.
        # @param [String] alert_id
        #   Required. The identifier of the alert to delete.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert is associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_alert(alert_id, customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/alerts/{alertId}', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::Empty::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::Empty
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified alert. Attempting to get a nonexistent alert returns
        # `NOT_FOUND` error.
        # @param [String] alert_id
        #   Required. The identifier of the alert to retrieve.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert is associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::Alert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::Alert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_alert(alert_id, customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/alerts/{alertId}', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::Alert::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::Alert
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the metadata of an alert. Attempting to get metadata for
        # a non-existent alert returns `NOT_FOUND` error.
        # @param [String] alert_id
        #   Required. The identifier of the alert this metadata belongs to.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert metadata is associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::AlertMetadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::AlertMetadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_alert_metadata(alert_id, customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/alerts/{alertId}/metadata', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::AlertMetadata::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::AlertMetadata
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the alerts.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alerts are associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] filter
        #   Optional. A query string for filtering alert results.
        #   For more details, see [Query
        #   filters](/admin-sdk/alertcenter/guides/query-filters) and [Supported
        #   query filter
        #   fields](/admin-sdk/alertcenter/reference/filter-fields#alerts.list).
        # @param [String] order_by
        #   Optional. The sort order of the list results.
        #   If not specified results may be returned in arbitrary order.
        #   You can sort the results in descending order based on the creation
        #   timestamp using `order_by="create_time desc"`.
        #   Currently, supported sorting are `create_time asc`, `create_time desc`,
        #   `update_time desc`
        # @param [Fixnum] page_size
        #   Optional. The requested page size. Server may return fewer items than
        #   requested. If unspecified, server picks an appropriate default.
        # @param [String] page_token
        #   Optional. A token identifying a page of results the server should return.
        #   If empty, a new iteration is started. To continue an iteration, pass in
        #   the value from the previous ListAlertsResponse's
        #   next_page_token field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::ListAlertsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::ListAlertsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_alerts(customer_id: nil, filter: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/alerts', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::ListAlertsResponse::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::ListAlertsResponse
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restores, or "undeletes", an alert that was marked for deletion within the
        # past 30 days. Attempting to undelete an alert which was marked for deletion
        # over 30 days ago (which has been removed from the Alert Center database) or
        # a nonexistent alert returns a `NOT_FOUND` error. Attempting to
        # undelete an alert which has not been marked for deletion has no effect.
        # @param [String] alert_id
        #   Required. The identifier of the alert to undelete.
        # @param [Google::Apis::AlertcenterV1beta1::UndeleteAlertRequest] undelete_alert_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::Alert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::Alert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_alert(alert_id, undelete_alert_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/alerts/{alertId}:undelete', options)
          command.request_representation = Google::Apis::AlertcenterV1beta1::UndeleteAlertRequest::Representation
          command.request_object = undelete_alert_request_object
          command.response_representation = Google::Apis::AlertcenterV1beta1::Alert::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::Alert
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates new feedback for an alert. Attempting to create a feedback for
        # a non-existent alert returns `NOT_FOUND` error. Attempting to create a
        # feedback for an alert that is marked for deletion returns
        # `FAILED_PRECONDITION' error.
        # @param [String] alert_id
        #   Required. The identifier of the alert this feedback belongs to.
        # @param [Google::Apis::AlertcenterV1beta1::AlertFeedback] alert_feedback_object
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert is associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::AlertFeedback] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::AlertFeedback]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_alert_feedback(alert_id, alert_feedback_object = nil, customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/alerts/{alertId}/feedback', options)
          command.request_representation = Google::Apis::AlertcenterV1beta1::AlertFeedback::Representation
          command.request_object = alert_feedback_object
          command.response_representation = Google::Apis::AlertcenterV1beta1::AlertFeedback::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::AlertFeedback
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the feedback for an alert. Attempting to list feedbacks for
        # a non-existent alert returns `NOT_FOUND` error.
        # @param [String] alert_id
        #   Required. The alert identifier.
        #   The "-" wildcard could be used to represent all alerts.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert feedback are associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] filter
        #   Optional. A query string for filtering alert feedback results.
        #   For more details, see [Query
        #   filters](/admin-sdk/alertcenter/guides/query-filters) and [Supported
        #   query filter
        #   fields](/admin-sdk/alertcenter/reference/filter-fields#alerts.feedback.list).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::ListAlertFeedbackResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::ListAlertFeedbackResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_alert_feedbacks(alert_id, customer_id: nil, filter: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/alerts/{alertId}/feedback', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::ListAlertFeedbackResponse::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::ListAlertFeedbackResponse
          command.params['alertId'] = alert_id unless alert_id.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns customer-level settings.
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert settings are associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::Settings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::Settings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_settings(customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/settings', options)
          command.response_representation = Google::Apis::AlertcenterV1beta1::Settings::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::Settings
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the customer-level settings.
        # @param [Google::Apis::AlertcenterV1beta1::Settings] settings_object
        # @param [String] customer_id
        #   Optional. The unique identifier of the G Suite organization account of the
        #   customer the alert settings are associated with.
        #   Inferred from the caller identity if not provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AlertcenterV1beta1::Settings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AlertcenterV1beta1::Settings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_settings(settings_object = nil, customer_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/settings', options)
          command.request_representation = Google::Apis::AlertcenterV1beta1::Settings::Representation
          command.request_object = settings_object
          command.response_representation = Google::Apis::AlertcenterV1beta1::Settings::Representation
          command.response_class = Google::Apis::AlertcenterV1beta1::Settings
          command.query['customerId'] = customer_id unless customer_id.nil?
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
