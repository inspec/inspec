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
    module RecommenderV1beta1
      # Recommender API
      #
      # 
      #
      # @example
      #    require 'google/apis/recommender_v1beta1'
      #
      #    Recommender = Google::Apis::RecommenderV1beta1 # Alias the module
      #    service = Recommender::RecommenderService.new
      #
      # @see https://cloud.google.com/recommender/docs/
      class RecommenderService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://recommender.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets the requested recommendation. Requires the recommender.*.get
        # IAM permission for the specified recommender.
        # @param [String] name
        #   Name of the recommendation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_recommender_recommendation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation::Representation
          command.response_class = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists recommendations for a Cloud project. Requires the recommender.*.list
        # IAM permission for the specified recommender.
        # @param [String] parent
        #   Required. The container resource on which to execute the request.
        #   Acceptable formats:
        #   1.
        #   "projects/[PROJECT_NUMBER]/locations/[LOCATION]/recommenders/[RECOMMENDER_ID]",
        #   LOCATION here refers to GCP Locations:
        #   https://cloud.google.com/about/locations/
        # @param [String] filter
        #   Filter expression to restrict the recommendations returned. Supported
        #   filter fields: state_info.state
        #   Eg: `state_info.state:"DISMISSED" or state_info.state:"FAILED"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request.
        #   Non-positive values are ignored. If not specified, the server will
        #   determine the number of results to return.
        # @param [String] page_token
        #   Optional. If present, retrieves the next batch of results from the
        #   preceding call to this method. `page_token` must be the value of
        #   `next_page_token` from the previous response. The values of other method
        #   parameters must be identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ListRecommendationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ListRecommendationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_recommender_recommendations(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/recommendations', options)
          command.response_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ListRecommendationsResponse::Representation
          command.response_class = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ListRecommendationsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Mark the Recommendation State as Claimed. Users can use this method to
        # indicate to the Recommender API that they are starting to apply the
        # recommendation themselves. This stops the recommendation content from being
        # updated.
        # MarkRecommendationClaimed can be applied to recommendations in CLAIMED,
        # SUCCEEDED, FAILED, or ACTIVE state.
        # Requires the recommender.*.update IAM permission for the specified
        # recommender.
        # @param [String] name
        #   Name of the recommendation.
        # @param [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationClaimedRequest] google_cloud_recommender_v1beta1_mark_recommendation_claimed_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def mark_project_location_recommender_recommendation_claimed(name, google_cloud_recommender_v1beta1_mark_recommendation_claimed_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:markClaimed', options)
          command.request_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationClaimedRequest::Representation
          command.request_object = google_cloud_recommender_v1beta1_mark_recommendation_claimed_request_object
          command.response_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation::Representation
          command.response_class = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Mark the Recommendation State as Failed. Users can use this method to
        # indicate to the Recommender API that they have applied the recommendation
        # themselves, and the operation failed. This stops the recommendation content
        # from being updated.
        # MarkRecommendationFailed can be applied to recommendations in ACTIVE,
        # CLAIMED, SUCCEEDED, or FAILED state.
        # Requires the recommender.*.update IAM permission for the specified
        # recommender.
        # @param [String] name
        #   Name of the recommendation.
        # @param [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationFailedRequest] google_cloud_recommender_v1beta1_mark_recommendation_failed_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def mark_project_location_recommender_recommendation_failed(name, google_cloud_recommender_v1beta1_mark_recommendation_failed_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:markFailed', options)
          command.request_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationFailedRequest::Representation
          command.request_object = google_cloud_recommender_v1beta1_mark_recommendation_failed_request_object
          command.response_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation::Representation
          command.response_class = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Mark the Recommendation State as Succeeded. Users can use this method to
        # indicate to the Recommender API that they have applied the recommendation
        # themselves, and the operation was successful. This stops the recommendation
        # content from being updated.
        # MarkRecommendationSucceeded can be applied to recommendations in ACTIVE,
        # CLAIMED, SUCCEEDED, or FAILED state.
        # Requires the recommender.*.update IAM permission for the specified
        # recommender.
        # @param [String] name
        #   Name of the recommendation.
        # @param [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationSucceededRequest] google_cloud_recommender_v1beta1_mark_recommendation_succeeded_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def mark_project_location_recommender_recommendation_succeeded(name, google_cloud_recommender_v1beta1_mark_recommendation_succeeded_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:markSucceeded', options)
          command.request_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1MarkRecommendationSucceededRequest::Representation
          command.request_object = google_cloud_recommender_v1beta1_mark_recommendation_succeeded_request_object
          command.response_representation = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation::Representation
          command.response_class = Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation
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
