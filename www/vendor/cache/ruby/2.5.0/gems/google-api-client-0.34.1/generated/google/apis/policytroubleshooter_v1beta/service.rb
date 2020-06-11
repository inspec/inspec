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
    module PolicytroubleshooterV1beta
      # Policy Troubleshooter API
      #
      # 
      #
      # @example
      #    require 'google/apis/policytroubleshooter_v1beta'
      #
      #    Policytroubleshooter = Google::Apis::PolicytroubleshooterV1beta # Alias the module
      #    service = Policytroubleshooter::PolicyTroubleshooterService.new
      #
      # @see https://cloud.google.com/iam/
      class PolicyTroubleshooterService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://policytroubleshooter.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Perform a check on whether a member is granted a permission
        # on a resource and how that grant/deny is determined accordinga
        # to the resource's effective IAM policy interpretation.
        # @param [Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyRequest] google_cloud_policytroubleshooter_v1beta_troubleshoot_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def troubleshoot_iam(google_cloud_policytroubleshooter_v1beta_troubleshoot_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta/iam:troubleshoot', options)
          command.request_representation = Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyRequest::Representation
          command.request_object = google_cloud_policytroubleshooter_v1beta_troubleshoot_iam_policy_request_object
          command.response_representation = Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse::Representation
          command.response_class = Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse
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
