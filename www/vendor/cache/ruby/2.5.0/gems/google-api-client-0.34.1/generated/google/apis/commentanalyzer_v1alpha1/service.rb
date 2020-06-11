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
    module CommentanalyzerV1alpha1
      # Perspective Comment Analyzer API
      #
      # The Perspective Comment Analyzer API provides information about the potential
      #  impact of a comment on a conversation (e.g. it can provide a score for the "
      #  toxicity" of a comment). Users can leverage the "SuggestCommentScore" method
      #  to submit corrections to improve Perspective over time. Users can set the "
      #  doNotStore" flag to ensure that all submitted comments are automatically
      #  deleted after scores are returned.
      #
      # @example
      #    require 'google/apis/commentanalyzer_v1alpha1'
      #
      #    Commentanalyzer = Google::Apis::CommentanalyzerV1alpha1 # Alias the module
      #    service = Commentanalyzer::CommentAnalyzerService.new
      #
      # @see https://github.com/conversationai/perspectiveapi/blob/master/README.md
      class CommentAnalyzerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://commentanalyzer.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Analyzes the provided text and returns scores for requested attributes.
        # @param [Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentRequest] analyze_comment_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def analyze_comment(analyze_comment_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/comments:analyze', options)
          command.request_representation = Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentRequest::Representation
          command.request_object = analyze_comment_request_object
          command.response_representation = Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentResponse::Representation
          command.response_class = Google::Apis::CommentanalyzerV1alpha1::AnalyzeCommentResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Suggest comment scores as training data.
        # @param [Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreRequest] suggest_comment_score_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def suggestscore_comment(suggest_comment_score_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/comments:suggestscore', options)
          command.request_representation = Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreRequest::Representation
          command.request_object = suggest_comment_score_request_object
          command.response_representation = Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreResponse::Representation
          command.response_class = Google::Apis::CommentanalyzerV1alpha1::SuggestCommentScoreResponse
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
