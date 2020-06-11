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
    module FirebasedynamiclinksV1
      # Firebase Dynamic Links API
      #
      # Programmatically creates and manages Firebase Dynamic Links.
      #
      # @example
      #    require 'google/apis/firebasedynamiclinks_v1'
      #
      #    Firebasedynamiclinks = Google::Apis::FirebasedynamiclinksV1 # Alias the module
      #    service = Firebasedynamiclinks::FirebaseDynamicLinksService.new
      #
      # @see https://firebase.google.com/docs/dynamic-links/
      class FirebaseDynamicLinksService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://firebasedynamiclinks.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a managed short Dynamic Link given either a valid long Dynamic Link
        # or details such as Dynamic Link domain, Android and iOS app information.
        # The created short Dynamic Link will not expire.
        # This differs from CreateShortDynamicLink in the following ways:
        # - The request will also contain a name for the link (non unique name
        # for the front end).
        # - The response must be authenticated with an auth token (generated with
        # the admin service account).
        # - The link will appear in the FDL list of links in the console front end.
        # The Dynamic Link domain in the request must be owned by requester's
        # Firebase project.
        # @param [Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkRequest] create_managed_short_link_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_managed_short_link(create_managed_short_link_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/managedShortLinks:create', options)
          command.request_representation = Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkRequest::Representation
          command.request_object = create_managed_short_link_request_object
          command.response_representation = Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkResponse::Representation
          command.response_class = Google::Apis::FirebasedynamiclinksV1::CreateManagedShortLinkResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a short Dynamic Link given either a valid long Dynamic Link or
        # details such as Dynamic Link domain, Android and iOS app information.
        # The created short Dynamic Link will not expire.
        # Repeated calls with the same long Dynamic Link or Dynamic Link information
        # will produce the same short Dynamic Link.
        # The Dynamic Link domain in the request must be owned by requester's
        # Firebase project.
        # @param [Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkRequest] create_short_dynamic_link_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_short_link_short_dynamic_link(create_short_dynamic_link_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/shortLinks', options)
          command.request_representation = Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkRequest::Representation
          command.request_object = create_short_dynamic_link_request_object
          command.response_representation = Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkResponse::Representation
          command.response_class = Google::Apis::FirebasedynamiclinksV1::CreateShortDynamicLinkResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetches analytics stats of a short Dynamic Link for a given
        # duration. Metrics include number of clicks, redirects, installs,
        # app first opens, and app reopens.
        # @param [String] dynamic_link
        #   Dynamic Link URL. e.g. https://abcd.app.goo.gl/wxyz
        # @param [Fixnum] duration_days
        #   The span of time requested in days.
        # @param [String] sdk_version
        #   Google SDK version. Version takes the form "$major.$minor.$patch"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasedynamiclinksV1::DynamicLinkStats] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasedynamiclinksV1::DynamicLinkStats]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_link_stats(dynamic_link, duration_days: nil, sdk_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{dynamicLink}/linkStats', options)
          command.response_representation = Google::Apis::FirebasedynamiclinksV1::DynamicLinkStats::Representation
          command.response_class = Google::Apis::FirebasedynamiclinksV1::DynamicLinkStats
          command.params['dynamicLink'] = dynamic_link unless dynamic_link.nil?
          command.query['durationDays'] = duration_days unless duration_days.nil?
          command.query['sdkVersion'] = sdk_version unless sdk_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get iOS strong/weak-match info for post-install attribution.
        # @param [Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionRequest] get_ios_post_install_attribution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def install_attribution(get_ios_post_install_attribution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/installAttribution', options)
          command.request_representation = Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionRequest::Representation
          command.request_object = get_ios_post_install_attribution_request_object
          command.response_representation = Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionResponse::Representation
          command.response_class = Google::Apis::FirebasedynamiclinksV1::GetIosPostInstallAttributionResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get iOS reopen attribution for app universal link open deeplinking.
        # @param [Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionRequest] get_ios_reopen_attribution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reopen_attribution(get_ios_reopen_attribution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/reopenAttribution', options)
          command.request_representation = Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionRequest::Representation
          command.request_object = get_ios_reopen_attribution_request_object
          command.response_representation = Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionResponse::Representation
          command.response_class = Google::Apis::FirebasedynamiclinksV1::GetIosReopenAttributionResponse
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
