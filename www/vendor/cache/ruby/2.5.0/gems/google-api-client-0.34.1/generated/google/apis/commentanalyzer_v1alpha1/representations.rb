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
    module CommentanalyzerV1alpha1
      
      class AnalyzeCommentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnalyzeCommentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArticleAndParentComment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttributeParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttributeScores
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Score
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpanScore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestCommentScoreRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestCommentScoreResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnalyzeCommentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_token, as: 'clientToken'
          property :comment, as: 'comment', class: Google::Apis::CommentanalyzerV1alpha1::TextEntry, decorator: Google::Apis::CommentanalyzerV1alpha1::TextEntry::Representation
      
          property :community_id, as: 'communityId'
          property :context, as: 'context', class: Google::Apis::CommentanalyzerV1alpha1::Context, decorator: Google::Apis::CommentanalyzerV1alpha1::Context::Representation
      
          property :do_not_store, as: 'doNotStore'
          collection :languages, as: 'languages'
          hash :requested_attributes, as: 'requestedAttributes', class: Google::Apis::CommentanalyzerV1alpha1::AttributeParameters, decorator: Google::Apis::CommentanalyzerV1alpha1::AttributeParameters::Representation
      
          property :session_id, as: 'sessionId'
          property :span_annotations, as: 'spanAnnotations'
        end
      end
      
      class AnalyzeCommentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attribute_scores, as: 'attributeScores', class: Google::Apis::CommentanalyzerV1alpha1::AttributeScores, decorator: Google::Apis::CommentanalyzerV1alpha1::AttributeScores::Representation
      
          property :client_token, as: 'clientToken'
          collection :detected_languages, as: 'detectedLanguages'
          collection :languages, as: 'languages'
        end
      end
      
      class ArticleAndParentComment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :article, as: 'article', class: Google::Apis::CommentanalyzerV1alpha1::TextEntry, decorator: Google::Apis::CommentanalyzerV1alpha1::TextEntry::Representation
      
          property :parent_comment, as: 'parentComment', class: Google::Apis::CommentanalyzerV1alpha1::TextEntry, decorator: Google::Apis::CommentanalyzerV1alpha1::TextEntry::Representation
      
        end
      end
      
      class AttributeParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score_threshold, as: 'scoreThreshold'
          property :score_type, as: 'scoreType'
        end
      end
      
      class AttributeScores
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :span_scores, as: 'spanScores', class: Google::Apis::CommentanalyzerV1alpha1::SpanScore, decorator: Google::Apis::CommentanalyzerV1alpha1::SpanScore::Representation
      
          property :summary_score, as: 'summaryScore', class: Google::Apis::CommentanalyzerV1alpha1::Score, decorator: Google::Apis::CommentanalyzerV1alpha1::Score::Representation
      
        end
      end
      
      class Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :article_and_parent_comment, as: 'articleAndParentComment', class: Google::Apis::CommentanalyzerV1alpha1::ArticleAndParentComment, decorator: Google::Apis::CommentanalyzerV1alpha1::ArticleAndParentComment::Representation
      
          collection :entries, as: 'entries', class: Google::Apis::CommentanalyzerV1alpha1::TextEntry, decorator: Google::Apis::CommentanalyzerV1alpha1::TextEntry::Representation
      
        end
      end
      
      class Score
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class SpanScore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :begin, as: 'begin'
          property :end, as: 'end'
          property :score, as: 'score', class: Google::Apis::CommentanalyzerV1alpha1::Score, decorator: Google::Apis::CommentanalyzerV1alpha1::Score::Representation
      
        end
      end
      
      class SuggestCommentScoreRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attribute_scores, as: 'attributeScores', class: Google::Apis::CommentanalyzerV1alpha1::AttributeScores, decorator: Google::Apis::CommentanalyzerV1alpha1::AttributeScores::Representation
      
          property :client_token, as: 'clientToken'
          property :comment, as: 'comment', class: Google::Apis::CommentanalyzerV1alpha1::TextEntry, decorator: Google::Apis::CommentanalyzerV1alpha1::TextEntry::Representation
      
          property :community_id, as: 'communityId'
          property :context, as: 'context', class: Google::Apis::CommentanalyzerV1alpha1::Context, decorator: Google::Apis::CommentanalyzerV1alpha1::Context::Representation
      
          collection :languages, as: 'languages'
          property :session_id, as: 'sessionId'
        end
      end
      
      class SuggestCommentScoreResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_token, as: 'clientToken'
          collection :detected_languages, as: 'detectedLanguages'
          collection :requested_languages, as: 'requestedLanguages'
        end
      end
      
      class TextEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :text, as: 'text'
          property :type, as: 'type'
        end
      end
    end
  end
end
