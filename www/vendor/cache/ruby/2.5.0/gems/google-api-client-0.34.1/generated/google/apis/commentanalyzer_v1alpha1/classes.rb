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
      
      # The comment analysis request message.
      # LINT.IfChange
      class AnalyzeCommentRequest
        include Google::Apis::Core::Hashable
      
        # Opaque token that is echoed from the request to the response.
        # Corresponds to the JSON property `clientToken`
        # @return [String]
        attr_accessor :client_token
      
        # Represents a body of text.
        # Corresponds to the JSON property `comment`
        # @return [Google::Apis::CommentanalyzerV1alpha1::TextEntry]
        attr_accessor :comment
      
        # Optional identifier associating this AnalyzeCommentRequest with a
        # particular client's community. Different communities may have different
        # norms and rules. Specifying this value enables us to explore building
        # community-specific models for clients.
        # Corresponds to the JSON property `communityId`
        # @return [String]
        attr_accessor :community_id
      
        # Context is typically something that a Comment is referencing or replying to
        # (such as an article, or previous comment).
        # Note: Populate only ONE OF the following fields. The oneof syntax cannot be
        # used because that would require nesting entries inside another message and
        # breaking backwards compatibility. The server will return an error if more
        # than one of the following fields is present.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::CommentanalyzerV1alpha1::Context]
        attr_accessor :context
      
        # Do not store the comment or context sent in this request. By default, the
        # service may store comments/context for debugging purposes.
        # Corresponds to the JSON property `doNotStore`
        # @return [Boolean]
        attr_accessor :do_not_store
        alias_method :do_not_store?, :do_not_store
      
        # The language(s) of the comment and context (if none are specified, the
        # language is automatically detected). If multiple languages are specified,
        # the text is checked in all of them that are supported. Both ISO and BCP-47
        # language codes are accepted.
        # Current Language Restrictions:
        # * Only English text ("en") is supported.
        # If none of the languages specified by the caller are supported, an
        # `UNIMPLEMENTED` error is returned.
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        # Specification of requested attributes. The AttributeParameters serve as
        # configuration for each associated attribute. The map keys are attribute
        # names. The available attributes may be different on each RFE installation,
        # and can be seen by calling ListAttributes (see above).
        # For the prod installation, known as Perspective API, at
        # blade:commentanalyzer-esf and commentanalyzer.googleapis.com, see
        # go/checker-models (internal) and
        # https://github.com/conversationai/perspectiveapi/blob/master/api_reference.md#
        # models.
        # Corresponds to the JSON property `requestedAttributes`
        # @return [Hash<String,Google::Apis::CommentanalyzerV1alpha1::AttributeParameters>]
        attr_accessor :requested_attributes
      
        # Session ID. Used to join related RPCs into a single session. For example,
        # an interactive tool that calls both the AnalyzeComment and
        # SuggestCommentScore RPCs should set all invocations of both RPCs to the
        # same Session ID, typically a random 64-bit integer.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # An advisory parameter that will return span annotations if the model
        # is capable of providing scores with sub-comment resolution. This will
        # likely increase the size of the returned message.
        # Corresponds to the JSON property `spanAnnotations`
        # @return [Boolean]
        attr_accessor :span_annotations
        alias_method :span_annotations?, :span_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_token = args[:client_token] if args.key?(:client_token)
          @comment = args[:comment] if args.key?(:comment)
          @community_id = args[:community_id] if args.key?(:community_id)
          @context = args[:context] if args.key?(:context)
          @do_not_store = args[:do_not_store] if args.key?(:do_not_store)
          @languages = args[:languages] if args.key?(:languages)
          @requested_attributes = args[:requested_attributes] if args.key?(:requested_attributes)
          @session_id = args[:session_id] if args.key?(:session_id)
          @span_annotations = args[:span_annotations] if args.key?(:span_annotations)
        end
      end
      
      # The comment analysis response message.
      class AnalyzeCommentResponse
        include Google::Apis::Core::Hashable
      
        # Scores for the requested attributes. The map keys are attribute names (same
        # as the requested_attribute field in AnalyzeCommentRequest, for example
        # "ATTACK_ON_AUTHOR", "INFLAMMATORY", etc).
        # Corresponds to the JSON property `attributeScores`
        # @return [Hash<String,Google::Apis::CommentanalyzerV1alpha1::AttributeScores>]
        attr_accessor :attribute_scores
      
        # Same token from the original AnalyzeCommentRequest.
        # Corresponds to the JSON property `clientToken`
        # @return [String]
        attr_accessor :client_token
      
        # Contains the languages detected from the text content, sorted in order of
        # likelihood.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<String>]
        attr_accessor :detected_languages
      
        # The language(s) used by CommentAnalyzer service to choose which Model to
        # use when analyzing the comment. Might better be called
        # "effective_languages". The logic used to make the choice is as follows:
        # if Request.languages.empty()
        # effective_languages = detected_languages
        # else
        # effective_languages = Request.languages
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_scores = args[:attribute_scores] if args.key?(:attribute_scores)
          @client_token = args[:client_token] if args.key?(:client_token)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
          @languages = args[:languages] if args.key?(:languages)
        end
      end
      
      # A type of context specific to a comment left on a single-threaded comment
      # message board, where comments are either a top level comment or the child of
      # a top level comment.
      class ArticleAndParentComment
        include Google::Apis::Core::Hashable
      
        # Represents a body of text.
        # Corresponds to the JSON property `article`
        # @return [Google::Apis::CommentanalyzerV1alpha1::TextEntry]
        attr_accessor :article
      
        # Represents a body of text.
        # Corresponds to the JSON property `parentComment`
        # @return [Google::Apis::CommentanalyzerV1alpha1::TextEntry]
        attr_accessor :parent_comment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @article = args[:article] if args.key?(:article)
          @parent_comment = args[:parent_comment] if args.key?(:parent_comment)
        end
      end
      
      # Configurable parameters for attribute scoring.
      class AttributeParameters
        include Google::Apis::Core::Hashable
      
        # Don't return scores for this attribute that are below this threshold. If
        # unset, a default threshold will be applied. A FloatValue wrapper is used to
        # distinguish between 0 vs. default/unset.
        # Corresponds to the JSON property `scoreThreshold`
        # @return [Float]
        attr_accessor :score_threshold
      
        # What type of scores to return. If unset, defaults to probability scores.
        # Corresponds to the JSON property `scoreType`
        # @return [String]
        attr_accessor :score_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score_threshold = args[:score_threshold] if args.key?(:score_threshold)
          @score_type = args[:score_type] if args.key?(:score_type)
        end
      end
      
      # This holds score values for a single attribute. It contains both per-span
      # scores as well as an overall summary score..
      class AttributeScores
        include Google::Apis::Core::Hashable
      
        # Per-span scores.
        # Corresponds to the JSON property `spanScores`
        # @return [Array<Google::Apis::CommentanalyzerV1alpha1::SpanScore>]
        attr_accessor :span_scores
      
        # Analysis scores are described by a value and a ScoreType.
        # Corresponds to the JSON property `summaryScore`
        # @return [Google::Apis::CommentanalyzerV1alpha1::Score]
        attr_accessor :summary_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @span_scores = args[:span_scores] if args.key?(:span_scores)
          @summary_score = args[:summary_score] if args.key?(:summary_score)
        end
      end
      
      # Context is typically something that a Comment is referencing or replying to
      # (such as an article, or previous comment).
      # Note: Populate only ONE OF the following fields. The oneof syntax cannot be
      # used because that would require nesting entries inside another message and
      # breaking backwards compatibility. The server will return an error if more
      # than one of the following fields is present.
      class Context
        include Google::Apis::Core::Hashable
      
        # A type of context specific to a comment left on a single-threaded comment
        # message board, where comments are either a top level comment or the child of
        # a top level comment.
        # Corresponds to the JSON property `articleAndParentComment`
        # @return [Google::Apis::CommentanalyzerV1alpha1::ArticleAndParentComment]
        attr_accessor :article_and_parent_comment
      
        # A list of messages. For example, a linear comments section or forum thread.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::CommentanalyzerV1alpha1::TextEntry>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @article_and_parent_comment = args[:article_and_parent_comment] if args.key?(:article_and_parent_comment)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # Analysis scores are described by a value and a ScoreType.
      class Score
        include Google::Apis::Core::Hashable
      
        # The type of the above value.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Score value. Semantics described by type below.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # This is a single score for a given span of text.
      class SpanScore
        include Google::Apis::Core::Hashable
      
        # "begin" and "end" describe the span of the original text that the attribute
        # score applies to. The values are the UTF-16 codepoint range. "end" is
        # exclusive. For example, with the text "Hi there", the begin/end pair (0,2)
        # describes the text "Hi".
        # If "begin" and "end" are unset, the score applies to the full text.
        # Corresponds to the JSON property `begin`
        # @return [Fixnum]
        attr_accessor :begin
      
        # 
        # Corresponds to the JSON property `end`
        # @return [Fixnum]
        attr_accessor :end
      
        # Analysis scores are described by a value and a ScoreType.
        # Corresponds to the JSON property `score`
        # @return [Google::Apis::CommentanalyzerV1alpha1::Score]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @begin = args[:begin] if args.key?(:begin)
          @end = args[:end] if args.key?(:end)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # The comment score suggestion request message.
      class SuggestCommentScoreRequest
        include Google::Apis::Core::Hashable
      
        # Attribute scores for the comment. The map keys are attribute names, same as
        # the requested_attribute field in AnalyzeCommentRequest (for example
        # "ATTACK_ON_AUTHOR", "INFLAMMATORY", etc.). This field has the same type as
        # the `attribute_scores` field in AnalyzeCommentResponse.
        # To specify an overall attribute score for the entire comment as a whole,
        # use the `summary_score` field of the mapped AttributeScores object. To
        # specify scores on specific subparts of the comment, use the `span_scores`
        # field. All SpanScore objects must have begin and end fields set.
        # All Score objects must be explicitly set (for binary classification, use
        # the score values 0 and 1). If Score objects don't include a ScoreType,
        # `PROBABILITY` is assumed.
        # `attribute_scores` must not be empty. The mapped AttributeScores objects
        # also must not be empty. An `INVALID_ARGUMENT` error is returned for all
        # malformed requests.
        # Corresponds to the JSON property `attributeScores`
        # @return [Hash<String,Google::Apis::CommentanalyzerV1alpha1::AttributeScores>]
        attr_accessor :attribute_scores
      
        # Opaque token that is echoed from the request to the response.
        # Corresponds to the JSON property `clientToken`
        # @return [String]
        attr_accessor :client_token
      
        # Represents a body of text.
        # Corresponds to the JSON property `comment`
        # @return [Google::Apis::CommentanalyzerV1alpha1::TextEntry]
        attr_accessor :comment
      
        # Optional identifier associating this comment score suggestion with a
        # particular sub-community. Different communities may have different norms
        # and rules. Specifying this value enables training community-specific
        # models.
        # Corresponds to the JSON property `communityId`
        # @return [String]
        attr_accessor :community_id
      
        # Context is typically something that a Comment is referencing or replying to
        # (such as an article, or previous comment).
        # Note: Populate only ONE OF the following fields. The oneof syntax cannot be
        # used because that would require nesting entries inside another message and
        # breaking backwards compatibility. The server will return an error if more
        # than one of the following fields is present.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::CommentanalyzerV1alpha1::Context]
        attr_accessor :context
      
        # The language(s) of the comment and context (if none are specified, the
        # language is automatically detected). If multiple languages are specified,
        # the text is checked in all of them that are supported. Both ISO and BCP-47
        # language codes are accepted.
        # Current Language Restrictions:
        # * Only English text ("en") is supported.
        # If none of the languages specified by the caller are supported, an
        # `UNIMPLEMENTED` error is returned.
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        # Session ID. Used to join related RPCs into a single session. For example,
        # an interactive tool that calls both the AnalyzeComment and
        # SuggestCommentScore RPCs should set all invocations of both RPCs to the
        # same Session ID, typically a random 64-bit integer.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_scores = args[:attribute_scores] if args.key?(:attribute_scores)
          @client_token = args[:client_token] if args.key?(:client_token)
          @comment = args[:comment] if args.key?(:comment)
          @community_id = args[:community_id] if args.key?(:community_id)
          @context = args[:context] if args.key?(:context)
          @languages = args[:languages] if args.key?(:languages)
          @session_id = args[:session_id] if args.key?(:session_id)
        end
      end
      
      # The comment score suggestion response message.
      class SuggestCommentScoreResponse
        include Google::Apis::Core::Hashable
      
        # Same token from the original SuggestCommentScoreRequest.
        # Corresponds to the JSON property `clientToken`
        # @return [String]
        attr_accessor :client_token
      
        # The list of languages detected from the comment text.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<String>]
        attr_accessor :detected_languages
      
        # The list of languages provided in the request.
        # Corresponds to the JSON property `requestedLanguages`
        # @return [Array<String>]
        attr_accessor :requested_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_token = args[:client_token] if args.key?(:client_token)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
          @requested_languages = args[:requested_languages] if args.key?(:requested_languages)
        end
      end
      
      # Represents a body of text.
      class TextEntry
        include Google::Apis::Core::Hashable
      
        # UTF-8 encoded text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        # Type of the text field.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
          @type = args[:type] if args.key?(:type)
        end
      end
    end
  end
end
