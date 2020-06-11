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
    module CloudprofilerV2
      # Stackdriver Profiler API
      #
      # Manages continuous profiling information.
      #
      # @example
      #    require 'google/apis/cloudprofiler_v2'
      #
      #    Cloudprofiler = Google::Apis::CloudprofilerV2 # Alias the module
      #    service = Cloudprofiler::CloudProfilerService.new
      #
      # @see https://cloud.google.com/profiler/
      class CloudProfilerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudprofiler.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # CreateProfile creates a new profile resource in the online mode.
        # The server ensures that the new profiles are created at a constant rate per
        # deployment, so the creation request may hang for some time until the next
        # profile session is available.
        # The request may fail with ABORTED error if the creation is not available
        # within ~1m, the response will indicate the duration of the backoff the
        # client should take before attempting creating a profile again. The backoff
        # duration is returned in google.rpc.RetryInfo extension on the response
        # status. To a gRPC client, the extension will be return as a
        # binary-serialized proto in the trailing metadata item named
        # "google.rpc.retryinfo-bin".
        # @param [String] parent
        #   Parent project to create the profile in.
        # @param [Google::Apis::CloudprofilerV2::CreateProfileRequest] create_profile_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprofilerV2::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprofilerV2::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_profile(parent, create_profile_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/profiles', options)
          command.request_representation = Google::Apis::CloudprofilerV2::CreateProfileRequest::Representation
          command.request_object = create_profile_request_object
          command.response_representation = Google::Apis::CloudprofilerV2::Profile::Representation
          command.response_class = Google::Apis::CloudprofilerV2::Profile
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # CreateOfflineProfile creates a new profile resource in the offline mode.
        # The client provides the profile to create along with the profile bytes, the
        # server records it.
        # @param [String] parent
        #   Parent project to create the profile in.
        # @param [Google::Apis::CloudprofilerV2::Profile] profile_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprofilerV2::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprofilerV2::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_profile_offline(parent, profile_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/profiles:createOffline', options)
          command.request_representation = Google::Apis::CloudprofilerV2::Profile::Representation
          command.request_object = profile_object
          command.response_representation = Google::Apis::CloudprofilerV2::Profile::Representation
          command.response_class = Google::Apis::CloudprofilerV2::Profile
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # UpdateProfile updates the profile bytes and labels on the profile resource
        # created in the online mode. Updating the bytes for profiles created in the
        # offline mode is currently not supported: the profile content must be
        # provided at the time of the profile creation.
        # @param [String] name
        #   Output only. Opaque, server-assigned, unique ID for this profile.
        # @param [Google::Apis::CloudprofilerV2::Profile] profile_object
        # @param [String] update_mask
        #   Field mask used to specify the fields to be overwritten. Currently only
        #   profile_bytes and labels fields are supported by UpdateProfile, so only
        #   those fields can be specified in the mask. When no mask is provided, all
        #   fields are overwritten.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprofilerV2::Profile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprofilerV2::Profile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_profile(name, profile_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::CloudprofilerV2::Profile::Representation
          command.request_object = profile_object
          command.response_representation = Google::Apis::CloudprofilerV2::Profile::Representation
          command.response_class = Google::Apis::CloudprofilerV2::Profile
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
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
