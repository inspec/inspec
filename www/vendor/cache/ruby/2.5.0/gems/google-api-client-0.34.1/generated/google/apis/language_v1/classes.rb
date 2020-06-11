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
    module LanguageV1
      
      # The entity analysis request message.
      class AnalyzeEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        # The encoding type used by the API to calculate offsets.
        # Corresponds to the JSON property `encodingType`
        # @return [String]
        attr_accessor :encoding_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @encoding_type = args[:encoding_type] if args.key?(:encoding_type)
        end
      end
      
      # The entity analysis response message.
      class AnalyzeEntitiesResponse
        include Google::Apis::Core::Hashable
      
        # The recognized entities in the input document.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::LanguageV1::Entity>]
        attr_accessor :entities
      
        # The language of the text, which will be the same as the language specified
        # in the request or, if not specified, the automatically-detected language.
        # See Document.language field for more details.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @language = args[:language] if args.key?(:language)
        end
      end
      
      # The entity-level sentiment analysis request message.
      class AnalyzeEntitySentimentRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        # The encoding type used by the API to calculate offsets.
        # Corresponds to the JSON property `encodingType`
        # @return [String]
        attr_accessor :encoding_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @encoding_type = args[:encoding_type] if args.key?(:encoding_type)
        end
      end
      
      # The entity-level sentiment analysis response message.
      class AnalyzeEntitySentimentResponse
        include Google::Apis::Core::Hashable
      
        # The recognized entities in the input document with associated sentiments.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::LanguageV1::Entity>]
        attr_accessor :entities
      
        # The language of the text, which will be the same as the language specified
        # in the request or, if not specified, the automatically-detected language.
        # See Document.language field for more details.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @language = args[:language] if args.key?(:language)
        end
      end
      
      # The sentiment analysis request message.
      class AnalyzeSentimentRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        # The encoding type used by the API to calculate sentence offsets.
        # Corresponds to the JSON property `encodingType`
        # @return [String]
        attr_accessor :encoding_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @encoding_type = args[:encoding_type] if args.key?(:encoding_type)
        end
      end
      
      # The sentiment analysis response message.
      class AnalyzeSentimentResponse
        include Google::Apis::Core::Hashable
      
        # Represents the feeling associated with the entire text or entities in
        # the text.
        # Corresponds to the JSON property `documentSentiment`
        # @return [Google::Apis::LanguageV1::Sentiment]
        attr_accessor :document_sentiment
      
        # The language of the text, which will be the same as the language specified
        # in the request or, if not specified, the automatically-detected language.
        # See Document.language field for more details.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The sentiment for all the sentences in the document.
        # Corresponds to the JSON property `sentences`
        # @return [Array<Google::Apis::LanguageV1::Sentence>]
        attr_accessor :sentences
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_sentiment = args[:document_sentiment] if args.key?(:document_sentiment)
          @language = args[:language] if args.key?(:language)
          @sentences = args[:sentences] if args.key?(:sentences)
        end
      end
      
      # The syntax analysis request message.
      class AnalyzeSyntaxRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        # The encoding type used by the API to calculate offsets.
        # Corresponds to the JSON property `encodingType`
        # @return [String]
        attr_accessor :encoding_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @encoding_type = args[:encoding_type] if args.key?(:encoding_type)
        end
      end
      
      # The syntax analysis response message.
      class AnalyzeSyntaxResponse
        include Google::Apis::Core::Hashable
      
        # The language of the text, which will be the same as the language specified
        # in the request or, if not specified, the automatically-detected language.
        # See Document.language field for more details.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Sentences in the input document.
        # Corresponds to the JSON property `sentences`
        # @return [Array<Google::Apis::LanguageV1::Sentence>]
        attr_accessor :sentences
      
        # Tokens, along with their syntactic information, in the input document.
        # Corresponds to the JSON property `tokens`
        # @return [Array<Google::Apis::LanguageV1::Token>]
        attr_accessor :tokens
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language = args[:language] if args.key?(:language)
          @sentences = args[:sentences] if args.key?(:sentences)
          @tokens = args[:tokens] if args.key?(:tokens)
        end
      end
      
      # The request message for the text annotation API, which can perform multiple
      # analysis types (sentiment, entities, and syntax) in one call.
      class AnnotateTextRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        # The encoding type used by the API to calculate offsets.
        # Corresponds to the JSON property `encodingType`
        # @return [String]
        attr_accessor :encoding_type
      
        # All available features for sentiment, syntax, and semantic analysis.
        # Setting each one to true will enable that specific analysis for the input.
        # Corresponds to the JSON property `features`
        # @return [Google::Apis::LanguageV1::Features]
        attr_accessor :features
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @encoding_type = args[:encoding_type] if args.key?(:encoding_type)
          @features = args[:features] if args.key?(:features)
        end
      end
      
      # The text annotations response message.
      class AnnotateTextResponse
        include Google::Apis::Core::Hashable
      
        # Categories identified in the input document.
        # Corresponds to the JSON property `categories`
        # @return [Array<Google::Apis::LanguageV1::ClassificationCategory>]
        attr_accessor :categories
      
        # Represents the feeling associated with the entire text or entities in
        # the text.
        # Corresponds to the JSON property `documentSentiment`
        # @return [Google::Apis::LanguageV1::Sentiment]
        attr_accessor :document_sentiment
      
        # Entities, along with their semantic information, in the input document.
        # Populated if the user enables
        # AnnotateTextRequest.Features.extract_entities.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::LanguageV1::Entity>]
        attr_accessor :entities
      
        # The language of the text, which will be the same as the language specified
        # in the request or, if not specified, the automatically-detected language.
        # See Document.language field for more details.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Sentences in the input document. Populated if the user enables
        # AnnotateTextRequest.Features.extract_syntax.
        # Corresponds to the JSON property `sentences`
        # @return [Array<Google::Apis::LanguageV1::Sentence>]
        attr_accessor :sentences
      
        # Tokens, along with their syntactic information, in the input document.
        # Populated if the user enables
        # AnnotateTextRequest.Features.extract_syntax.
        # Corresponds to the JSON property `tokens`
        # @return [Array<Google::Apis::LanguageV1::Token>]
        attr_accessor :tokens
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @document_sentiment = args[:document_sentiment] if args.key?(:document_sentiment)
          @entities = args[:entities] if args.key?(:entities)
          @language = args[:language] if args.key?(:language)
          @sentences = args[:sentences] if args.key?(:sentences)
          @tokens = args[:tokens] if args.key?(:tokens)
        end
      end
      
      # Represents a category returned from the text classifier.
      class ClassificationCategory
        include Google::Apis::Core::Hashable
      
        # The classifier's confidence of the category. Number represents how certain
        # the classifier is that this category represents the given text.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The name of the category representing the document, from the [predefined
        # taxonomy](/natural-language/docs/categories).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The document classification request message.
      class ClassifyTextRequest
        include Google::Apis::Core::Hashable
      
        # ################################################################ #
        # Represents the input to API methods.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::LanguageV1::Document]
        attr_accessor :document
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
        end
      end
      
      # The document classification response message.
      class ClassifyTextResponse
        include Google::Apis::Core::Hashable
      
        # Categories representing the input document.
        # Corresponds to the JSON property `categories`
        # @return [Array<Google::Apis::LanguageV1::ClassificationCategory>]
        attr_accessor :categories
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
        end
      end
      
      # Represents dependency parse tree information for a token. (For more
      # information on dependency labels, see
      # http://www.aclweb.org/anthology/P13-2017
      class DependencyEdge
        include Google::Apis::Core::Hashable
      
        # Represents the head of this token in the dependency tree.
        # This is the index of the token which has an arc going to this token.
        # The index is the position of the token in the array of tokens returned
        # by the API method. If this token is a root token, then the
        # `head_token_index` is its own index.
        # Corresponds to the JSON property `headTokenIndex`
        # @return [Fixnum]
        attr_accessor :head_token_index
      
        # The parse label for the token.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @head_token_index = args[:head_token_index] if args.key?(:head_token_index)
          @label = args[:label] if args.key?(:label)
        end
      end
      
      # ################################################################ #
      # Represents the input to API methods.
      class Document
        include Google::Apis::Core::Hashable
      
        # The content of the input in string format.
        # Cloud audit logging exempt since it is based on user data.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage URI where the file content is located.
        # This URI must be of the form: gs://bucket_name/object_name. For more
        # details, see https://cloud.google.com/storage/docs/reference-uris.
        # NOTE: Cloud Storage object versioning is not supported.
        # Corresponds to the JSON property `gcsContentUri`
        # @return [String]
        attr_accessor :gcs_content_uri
      
        # The language of the document (if not specified, the language is
        # automatically detected). Both ISO and BCP-47 language codes are
        # accepted.<br>
        # [Language Support](/natural-language/docs/languages)
        # lists currently supported languages for each API method.
        # If the language (either specified by the caller or automatically detected)
        # is not supported by the called API method, an `INVALID_ARGUMENT` error
        # is returned.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Required. If the type is not set or is `TYPE_UNSPECIFIED`,
        # returns an `INVALID_ARGUMENT` error.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_content_uri = args[:gcs_content_uri] if args.key?(:gcs_content_uri)
          @language = args[:language] if args.key?(:language)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a phrase in the text that is a known entity, such as
      # a person, an organization, or location. The API associates information, such
      # as salience and mentions, with entities.
      class Entity
        include Google::Apis::Core::Hashable
      
        # The mentions of this entity in the input document. The API currently
        # supports proper noun mentions.
        # Corresponds to the JSON property `mentions`
        # @return [Array<Google::Apis::LanguageV1::EntityMention>]
        attr_accessor :mentions
      
        # Metadata associated with the entity.
        # For most entity types, the metadata is a Wikipedia URL (`wikipedia_url`)
        # and Knowledge Graph MID (`mid`), if they are available. For the metadata
        # associated with other entity types, see the Type table below.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # The representative name for the entity.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The salience score associated with the entity in the [0, 1.0] range.
        # The salience score for an entity provides information about the
        # importance or centrality of that entity to the entire document text.
        # Scores closer to 0 are less salient, while scores closer to 1.0 are highly
        # salient.
        # Corresponds to the JSON property `salience`
        # @return [Float]
        attr_accessor :salience
      
        # Represents the feeling associated with the entire text or entities in
        # the text.
        # Corresponds to the JSON property `sentiment`
        # @return [Google::Apis::LanguageV1::Sentiment]
        attr_accessor :sentiment
      
        # The entity type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mentions = args[:mentions] if args.key?(:mentions)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @salience = args[:salience] if args.key?(:salience)
          @sentiment = args[:sentiment] if args.key?(:sentiment)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a mention for an entity in the text. Currently, proper noun
      # mentions are supported.
      class EntityMention
        include Google::Apis::Core::Hashable
      
        # Represents the feeling associated with the entire text or entities in
        # the text.
        # Corresponds to the JSON property `sentiment`
        # @return [Google::Apis::LanguageV1::Sentiment]
        attr_accessor :sentiment
      
        # Represents an output piece of text.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::LanguageV1::TextSpan]
        attr_accessor :text
      
        # The type of the entity mention.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sentiment = args[:sentiment] if args.key?(:sentiment)
          @text = args[:text] if args.key?(:text)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # All available features for sentiment, syntax, and semantic analysis.
      # Setting each one to true will enable that specific analysis for the input.
      class Features
        include Google::Apis::Core::Hashable
      
        # Classify the full document into categories.
        # Corresponds to the JSON property `classifyText`
        # @return [Boolean]
        attr_accessor :classify_text
        alias_method :classify_text?, :classify_text
      
        # Extract document-level sentiment.
        # Corresponds to the JSON property `extractDocumentSentiment`
        # @return [Boolean]
        attr_accessor :extract_document_sentiment
        alias_method :extract_document_sentiment?, :extract_document_sentiment
      
        # Extract entities.
        # Corresponds to the JSON property `extractEntities`
        # @return [Boolean]
        attr_accessor :extract_entities
        alias_method :extract_entities?, :extract_entities
      
        # Extract entities and their associated sentiment.
        # Corresponds to the JSON property `extractEntitySentiment`
        # @return [Boolean]
        attr_accessor :extract_entity_sentiment
        alias_method :extract_entity_sentiment?, :extract_entity_sentiment
      
        # Extract syntax information.
        # Corresponds to the JSON property `extractSyntax`
        # @return [Boolean]
        attr_accessor :extract_syntax
        alias_method :extract_syntax?, :extract_syntax
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @classify_text = args[:classify_text] if args.key?(:classify_text)
          @extract_document_sentiment = args[:extract_document_sentiment] if args.key?(:extract_document_sentiment)
          @extract_entities = args[:extract_entities] if args.key?(:extract_entities)
          @extract_entity_sentiment = args[:extract_entity_sentiment] if args.key?(:extract_entity_sentiment)
          @extract_syntax = args[:extract_syntax] if args.key?(:extract_syntax)
        end
      end
      
      # Represents part of speech information for a token. Parts of speech
      # are as defined in
      # http://www.lrec-conf.org/proceedings/lrec2012/pdf/274_Paper.pdf
      class PartOfSpeech
        include Google::Apis::Core::Hashable
      
        # The grammatical aspect.
        # Corresponds to the JSON property `aspect`
        # @return [String]
        attr_accessor :aspect
      
        # The grammatical case.
        # Corresponds to the JSON property `case`
        # @return [String]
        attr_accessor :case
      
        # The grammatical form.
        # Corresponds to the JSON property `form`
        # @return [String]
        attr_accessor :form
      
        # The grammatical gender.
        # Corresponds to the JSON property `gender`
        # @return [String]
        attr_accessor :gender
      
        # The grammatical mood.
        # Corresponds to the JSON property `mood`
        # @return [String]
        attr_accessor :mood
      
        # The grammatical number.
        # Corresponds to the JSON property `number`
        # @return [String]
        attr_accessor :number
      
        # The grammatical person.
        # Corresponds to the JSON property `person`
        # @return [String]
        attr_accessor :person
      
        # The grammatical properness.
        # Corresponds to the JSON property `proper`
        # @return [String]
        attr_accessor :proper
      
        # The grammatical reciprocity.
        # Corresponds to the JSON property `reciprocity`
        # @return [String]
        attr_accessor :reciprocity
      
        # The part of speech tag.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        # The grammatical tense.
        # Corresponds to the JSON property `tense`
        # @return [String]
        attr_accessor :tense
      
        # The grammatical voice.
        # Corresponds to the JSON property `voice`
        # @return [String]
        attr_accessor :voice
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aspect = args[:aspect] if args.key?(:aspect)
          @case = args[:case] if args.key?(:case)
          @form = args[:form] if args.key?(:form)
          @gender = args[:gender] if args.key?(:gender)
          @mood = args[:mood] if args.key?(:mood)
          @number = args[:number] if args.key?(:number)
          @person = args[:person] if args.key?(:person)
          @proper = args[:proper] if args.key?(:proper)
          @reciprocity = args[:reciprocity] if args.key?(:reciprocity)
          @tag = args[:tag] if args.key?(:tag)
          @tense = args[:tense] if args.key?(:tense)
          @voice = args[:voice] if args.key?(:voice)
        end
      end
      
      # Represents a sentence in the input document.
      class Sentence
        include Google::Apis::Core::Hashable
      
        # Represents the feeling associated with the entire text or entities in
        # the text.
        # Corresponds to the JSON property `sentiment`
        # @return [Google::Apis::LanguageV1::Sentiment]
        attr_accessor :sentiment
      
        # Represents an output piece of text.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::LanguageV1::TextSpan]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sentiment = args[:sentiment] if args.key?(:sentiment)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Represents the feeling associated with the entire text or entities in
      # the text.
      class Sentiment
        include Google::Apis::Core::Hashable
      
        # A non-negative number in the [0, +inf) range, which represents
        # the absolute magnitude of sentiment regardless of score (positive or
        # negative).
        # Corresponds to the JSON property `magnitude`
        # @return [Float]
        attr_accessor :magnitude
      
        # Sentiment score between -1.0 (negative sentiment) and 1.0
        # (positive sentiment).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @magnitude = args[:magnitude] if args.key?(:magnitude)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Represents an output piece of text.
      class TextSpan
        include Google::Apis::Core::Hashable
      
        # The API calculates the beginning offset of the content in the original
        # document according to the EncodingType specified in the API request.
        # Corresponds to the JSON property `beginOffset`
        # @return [Fixnum]
        attr_accessor :begin_offset
      
        # The content of the output text.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @begin_offset = args[:begin_offset] if args.key?(:begin_offset)
          @content = args[:content] if args.key?(:content)
        end
      end
      
      # Represents the smallest syntactic building block of the text.
      class Token
        include Google::Apis::Core::Hashable
      
        # Represents dependency parse tree information for a token. (For more
        # information on dependency labels, see
        # http://www.aclweb.org/anthology/P13-2017
        # Corresponds to the JSON property `dependencyEdge`
        # @return [Google::Apis::LanguageV1::DependencyEdge]
        attr_accessor :dependency_edge
      
        # [Lemma](https://en.wikipedia.org/wiki/Lemma_%28morphology%29) of the token.
        # Corresponds to the JSON property `lemma`
        # @return [String]
        attr_accessor :lemma
      
        # Represents part of speech information for a token. Parts of speech
        # are as defined in
        # http://www.lrec-conf.org/proceedings/lrec2012/pdf/274_Paper.pdf
        # Corresponds to the JSON property `partOfSpeech`
        # @return [Google::Apis::LanguageV1::PartOfSpeech]
        attr_accessor :part_of_speech
      
        # Represents an output piece of text.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::LanguageV1::TextSpan]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dependency_edge = args[:dependency_edge] if args.key?(:dependency_edge)
          @lemma = args[:lemma] if args.key?(:lemma)
          @part_of_speech = args[:part_of_speech] if args.key?(:part_of_speech)
          @text = args[:text] if args.key?(:text)
        end
      end
    end
  end
end
