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
    module DialogflowV2
      
      class GoogleCloudDialogflowV2Agent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchCreateEntitiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchDeleteEntitiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchDeleteEntityTypesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchDeleteIntentsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntitiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntityTypesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntityTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchUpdateIntentsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2BatchUpdateIntentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2DetectIntentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2DetectIntentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2EntityType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2EntityTypeBatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2EntityTypeEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2EventInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ExportAgentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ExportAgentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ImportAgentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2InputAudioConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2Intent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentBatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentFollowupIntentInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCardButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageCardButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageCarouselSelect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageCarouselSelectItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageListSelect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageListSelectItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageQuickReplies
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageSelectItemInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageSimpleResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageSimpleResponses
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageSuggestions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentMessageText
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentTrainingPhrase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2IntentTrainingPhrasePart
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ListContextsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ListEntityTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ListIntentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2ListSessionEntityTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2OriginalDetectIntentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2OutputAudioConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2QueryInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2QueryParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2QueryResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2RestoreAgentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2SearchAgentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2Sentiment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2SentimentAnalysisRequestConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2SentimentAnalysisResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2SessionEntityType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2SynthesizeSpeechConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2TextInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2TrainAgentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2VoiceSelectionParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2WebhookRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2WebhookResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1AnnotatedConversationDataset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1BatchUpdateEntityTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1BatchUpdateIntentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1EntityType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1EntityTypeEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1EventInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1ExportAgentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1Intent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCardButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageColumnProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageListSelect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageListSelectItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageQuickReplies
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmText
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCard
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardCell
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageText
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeAnswers
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1LabelConversationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1QueryResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1Sentiment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1SentimentAnalysisResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1SessionEntityType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1WebhookRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2beta1WebhookResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleProtobufEmpty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleRpcStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeLatLng
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudDialogflowV2Agent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :avatar_uri, as: 'avatarUri'
          property :classification_threshold, as: 'classificationThreshold'
          property :default_language_code, as: 'defaultLanguageCode'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :enable_logging, as: 'enableLogging'
          property :match_mode, as: 'matchMode'
          property :parent, as: 'parent'
          collection :supported_language_codes, as: 'supportedLanguageCodes'
          property :tier, as: 'tier'
          property :time_zone, as: 'timeZone'
        end
      end
      
      class GoogleCloudDialogflowV2BatchCreateEntitiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity::Representation
      
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudDialogflowV2BatchDeleteEntitiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_values, as: 'entityValues'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudDialogflowV2BatchDeleteEntityTypesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_type_names, as: 'entityTypeNames'
        end
      end
      
      class GoogleCloudDialogflowV2BatchDeleteIntentsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :intents, as: 'intents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntitiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity::Representation
      
          property :language_code, as: 'languageCode'
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntityTypesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_type_batch_inline, as: 'entityTypeBatchInline', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeBatch, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeBatch::Representation
      
          property :entity_type_batch_uri, as: 'entityTypeBatchUri'
          property :language_code, as: 'languageCode'
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GoogleCloudDialogflowV2BatchUpdateEntityTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_types, as: 'entityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2BatchUpdateIntentsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :intent_batch_inline, as: 'intentBatchInline', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentBatch, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentBatch::Representation
      
          property :intent_batch_uri, as: 'intentBatchUri'
          property :intent_view, as: 'intentView'
          property :language_code, as: 'languageCode'
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GoogleCloudDialogflowV2BatchUpdateIntentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :intents, as: 'intents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lifespan_count, as: 'lifespanCount'
          property :name, as: 'name'
          hash :parameters, as: 'parameters'
        end
      end
      
      class GoogleCloudDialogflowV2DetectIntentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input_audio, :base64 => true, as: 'inputAudio'
          property :output_audio_config, as: 'outputAudioConfig', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OutputAudioConfig, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OutputAudioConfig::Representation
      
          property :query_input, as: 'queryInput', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryInput, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryInput::Representation
      
          property :query_params, as: 'queryParams', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryParameters, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryParameters::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2DetectIntentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_audio, :base64 => true, as: 'outputAudio'
          property :output_audio_config, as: 'outputAudioConfig', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OutputAudioConfig, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OutputAudioConfig::Representation
      
          property :query_result, as: 'queryResult', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryResult::Representation
      
          property :response_id, as: 'responseId'
          property :webhook_status, as: 'webhookStatus', class: Google::Apis::DialogflowV2::GoogleRpcStatus, decorator: Google::Apis::DialogflowV2::GoogleRpcStatus::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2EntityType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_expansion_mode, as: 'autoExpansionMode'
          property :display_name, as: 'displayName'
          property :enable_fuzzy_extraction, as: 'enableFuzzyExtraction'
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudDialogflowV2EntityTypeBatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_types, as: 'entityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2EntityTypeEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :synonyms, as: 'synonyms'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudDialogflowV2EventInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :name, as: 'name'
          hash :parameters, as: 'parameters'
        end
      end
      
      class GoogleCloudDialogflowV2ExportAgentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_uri, as: 'agentUri'
        end
      end
      
      class GoogleCloudDialogflowV2ExportAgentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_content, :base64 => true, as: 'agentContent'
          property :agent_uri, as: 'agentUri'
        end
      end
      
      class GoogleCloudDialogflowV2ImportAgentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_content, :base64 => true, as: 'agentContent'
          property :agent_uri, as: 'agentUri'
        end
      end
      
      class GoogleCloudDialogflowV2InputAudioConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_encoding, as: 'audioEncoding'
          property :language_code, as: 'languageCode'
          property :model_variant, as: 'modelVariant'
          collection :phrase_hints, as: 'phraseHints'
          property :sample_rate_hertz, as: 'sampleRateHertz'
          property :single_utterance, as: 'singleUtterance'
        end
      end
      
      class GoogleCloudDialogflowV2Intent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          collection :default_response_platforms, as: 'defaultResponsePlatforms'
          property :display_name, as: 'displayName'
          collection :events, as: 'events'
          collection :followup_intent_info, as: 'followupIntentInfo', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentFollowupIntentInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentFollowupIntentInfo::Representation
      
          collection :input_context_names, as: 'inputContextNames'
          property :is_fallback, as: 'isFallback'
          collection :messages, as: 'messages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage::Representation
      
          property :ml_disabled, as: 'mlDisabled'
          property :name, as: 'name'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context::Representation
      
          collection :parameters, as: 'parameters', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentParameter, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentParameter::Representation
      
          property :parent_followup_intent_name, as: 'parentFollowupIntentName'
          property :priority, as: 'priority'
          property :reset_contexts, as: 'resetContexts'
          property :root_followup_intent_name, as: 'rootFollowupIntentName'
          collection :training_phrases, as: 'trainingPhrases', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentTrainingPhrase, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentTrainingPhrase::Representation
      
          property :webhook_state, as: 'webhookState'
        end
      end
      
      class GoogleCloudDialogflowV2IntentBatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :intents, as: 'intents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2IntentFollowupIntentInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :followup_intent_name, as: 'followupIntentName'
          property :parent_followup_intent_name, as: 'parentFollowupIntentName'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :basic_card, as: 'basicCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCard::Representation
      
          property :card, as: 'card', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCard::Representation
      
          property :carousel_select, as: 'carouselSelect', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCarouselSelect, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCarouselSelect::Representation
      
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage::Representation
      
          property :link_out_suggestion, as: 'linkOutSuggestion', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion::Representation
      
          property :list_select, as: 'listSelect', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageListSelect, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageListSelect::Representation
      
          hash :payload, as: 'payload'
          property :platform, as: 'platform'
          property :quick_replies, as: 'quickReplies', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageQuickReplies, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageQuickReplies::Representation
      
          property :simple_responses, as: 'simpleResponses', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSimpleResponses, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSimpleResponses::Representation
      
          property :suggestions, as: 'suggestions', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSuggestions, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSuggestions::Representation
      
          property :text, as: 'text', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageText, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageText::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCardButton, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCardButton::Representation
      
          property :formatted_text, as: 'formattedText'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage::Representation
      
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCardButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :open_uri_action, as: 'openUriAction', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCardButton, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCardButton::Representation
      
          property :image_uri, as: 'imageUri'
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageCardButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :postback, as: 'postback'
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageCarouselSelect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCarouselSelectItem, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageCarouselSelectItem::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageCarouselSelectItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage::Representation
      
          property :info, as: 'info', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSelectItemInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSelectItemInfo::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accessibility_text, as: 'accessibilityText'
          property :image_uri, as: 'imageUri'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_name, as: 'destinationName'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageListSelect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageListSelectItem, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageListSelectItem::Representation
      
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageListSelectItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageImage::Representation
      
          property :info, as: 'info', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSelectItemInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSelectItemInfo::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageQuickReplies
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :quick_replies, as: 'quickReplies'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageSelectItemInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          collection :synonyms, as: 'synonyms'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageSimpleResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_text, as: 'displayText'
          property :ssml, as: 'ssml'
          property :text_to_speech, as: 'textToSpeech'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageSimpleResponses
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :simple_responses, as: 'simpleResponses', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSimpleResponse, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSimpleResponse::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageSuggestions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggestions, as: 'suggestions', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessageSuggestion::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2IntentMessageText
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2IntentParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_value, as: 'defaultValue'
          property :display_name, as: 'displayName'
          property :entity_type_display_name, as: 'entityTypeDisplayName'
          property :is_list, as: 'isList'
          property :mandatory, as: 'mandatory'
          property :name, as: 'name'
          collection :prompts, as: 'prompts'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudDialogflowV2IntentTrainingPhrase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :parts, as: 'parts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentTrainingPhrasePart, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentTrainingPhrasePart::Representation
      
          property :times_added_count, as: 'timesAddedCount'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudDialogflowV2IntentTrainingPhrasePart
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias, as: 'alias'
          property :entity_type, as: 'entityType'
          property :text, as: 'text'
          property :user_defined, as: 'userDefined'
        end
      end
      
      class GoogleCloudDialogflowV2ListContextsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :contexts, as: 'contexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudDialogflowV2ListEntityTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_types, as: 'entityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityType::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudDialogflowV2ListIntentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :intents, as: 'intents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudDialogflowV2ListSessionEntityTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :session_entity_types, as: 'sessionEntityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2OriginalDetectIntentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :payload, as: 'payload'
          property :source, as: 'source'
          property :version, as: 'version'
        end
      end
      
      class GoogleCloudDialogflowV2OutputAudioConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_encoding, as: 'audioEncoding'
          property :sample_rate_hertz, as: 'sampleRateHertz'
          property :synthesize_speech_config, as: 'synthesizeSpeechConfig', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SynthesizeSpeechConfig, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SynthesizeSpeechConfig::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2QueryInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_config, as: 'audioConfig', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2InputAudioConfig, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2InputAudioConfig::Representation
      
          property :event, as: 'event', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EventInput, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EventInput::Representation
      
          property :text, as: 'text', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2TextInput, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2TextInput::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2QueryParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :contexts, as: 'contexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context::Representation
      
          property :geo_location, as: 'geoLocation', class: Google::Apis::DialogflowV2::GoogleTypeLatLng, decorator: Google::Apis::DialogflowV2::GoogleTypeLatLng::Representation
      
          hash :payload, as: 'payload'
          property :reset_contexts, as: 'resetContexts'
          property :sentiment_analysis_request_config, as: 'sentimentAnalysisRequestConfig', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SentimentAnalysisRequestConfig, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SentimentAnalysisRequestConfig::Representation
      
          collection :session_entity_types, as: 'sessionEntityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType::Representation
      
          property :time_zone, as: 'timeZone'
        end
      end
      
      class GoogleCloudDialogflowV2QueryResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :all_required_params_present, as: 'allRequiredParamsPresent'
          hash :diagnostic_info, as: 'diagnosticInfo'
          collection :fulfillment_messages, as: 'fulfillmentMessages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage::Representation
      
          property :fulfillment_text, as: 'fulfillmentText'
          property :intent, as: 'intent', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Intent::Representation
      
          property :intent_detection_confidence, as: 'intentDetectionConfidence'
          property :language_code, as: 'languageCode'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context::Representation
      
          hash :parameters, as: 'parameters'
          property :query_text, as: 'queryText'
          property :sentiment_analysis_result, as: 'sentimentAnalysisResult', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SentimentAnalysisResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SentimentAnalysisResult::Representation
      
          property :speech_recognition_confidence, as: 'speechRecognitionConfidence'
          hash :webhook_payload, as: 'webhookPayload'
          property :webhook_source, as: 'webhookSource'
        end
      end
      
      class GoogleCloudDialogflowV2RestoreAgentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_content, :base64 => true, as: 'agentContent'
          property :agent_uri, as: 'agentUri'
        end
      end
      
      class GoogleCloudDialogflowV2SearchAgentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :agents, as: 'agents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Agent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Agent::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudDialogflowV2Sentiment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :magnitude, as: 'magnitude'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudDialogflowV2SentimentAnalysisRequestConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analyze_query_text_sentiment, as: 'analyzeQueryTextSentiment'
        end
      end
      
      class GoogleCloudDialogflowV2SentimentAnalysisResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :query_text_sentiment, as: 'queryTextSentiment', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Sentiment, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Sentiment::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2SessionEntityType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EntityTypeEntity::Representation
      
          property :entity_override_mode, as: 'entityOverrideMode'
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudDialogflowV2SynthesizeSpeechConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :effects_profile_id, as: 'effectsProfileId'
          property :pitch, as: 'pitch'
          property :speaking_rate, as: 'speakingRate'
          property :voice, as: 'voice', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2VoiceSelectionParams, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2VoiceSelectionParams::Representation
      
          property :volume_gain_db, as: 'volumeGainDb'
        end
      end
      
      class GoogleCloudDialogflowV2TextInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2TrainAgentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleCloudDialogflowV2VoiceSelectionParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :ssml_gender, as: 'ssmlGender'
        end
      end
      
      class GoogleCloudDialogflowV2WebhookRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :original_detect_intent_request, as: 'originalDetectIntentRequest', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OriginalDetectIntentRequest, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2OriginalDetectIntentRequest::Representation
      
          property :query_result, as: 'queryResult', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2QueryResult::Representation
      
          property :response_id, as: 'responseId'
          property :session, as: 'session'
        end
      end
      
      class GoogleCloudDialogflowV2WebhookResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :followup_event_input, as: 'followupEventInput', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EventInput, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2EventInput::Representation
      
          collection :fulfillment_messages, as: 'fulfillmentMessages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2IntentMessage::Representation
      
          property :fulfillment_text, as: 'fulfillmentText'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2Context::Representation
      
          hash :payload, as: 'payload'
          collection :session_entity_types, as: 'sessionEntityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2SessionEntityType::Representation
      
          property :source, as: 'source'
        end
      end
      
      class GoogleCloudDialogflowV2beta1AnnotatedConversationDataset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :completed_example_count, :numeric_string => true, as: 'completedExampleCount'
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :example_count, :numeric_string => true, as: 'exampleCount'
          property :name, as: 'name'
          property :question_type_name, as: 'questionTypeName'
        end
      end
      
      class GoogleCloudDialogflowV2beta1BatchUpdateEntityTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entity_types, as: 'entityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityType::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1BatchUpdateIntentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :intents, as: 'intents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Intent::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lifespan_count, as: 'lifespanCount'
          property :name, as: 'name'
          hash :parameters, as: 'parameters'
        end
      end
      
      class GoogleCloudDialogflowV2beta1EntityType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_expansion_mode, as: 'autoExpansionMode'
          property :display_name, as: 'displayName'
          property :enable_fuzzy_extraction, as: 'enableFuzzyExtraction'
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityTypeEntity::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudDialogflowV2beta1EntityTypeEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :synonyms, as: 'synonyms'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudDialogflowV2beta1EventInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :name, as: 'name'
          hash :parameters, as: 'parameters'
        end
      end
      
      class GoogleCloudDialogflowV2beta1ExportAgentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_content, :base64 => true, as: 'agentContent'
          property :agent_uri, as: 'agentUri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1Intent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          collection :default_response_platforms, as: 'defaultResponsePlatforms'
          property :display_name, as: 'displayName'
          property :end_interaction, as: 'endInteraction'
          collection :events, as: 'events'
          collection :followup_intent_info, as: 'followupIntentInfo', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo::Representation
      
          collection :input_context_names, as: 'inputContextNames'
          property :is_fallback, as: 'isFallback'
          collection :messages, as: 'messages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage::Representation
      
          property :ml_disabled, as: 'mlDisabled'
          property :ml_enabled, as: 'mlEnabled'
          property :name, as: 'name'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context::Representation
      
          collection :parameters, as: 'parameters', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentParameter, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentParameter::Representation
      
          property :parent_followup_intent_name, as: 'parentFollowupIntentName'
          property :priority, as: 'priority'
          property :reset_contexts, as: 'resetContexts'
          property :root_followup_intent_name, as: 'rootFollowupIntentName'
          collection :training_phrases, as: 'trainingPhrases', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentTrainingPhrase, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentTrainingPhrase::Representation
      
          property :webhook_state, as: 'webhookState'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :followup_intent_name, as: 'followupIntentName'
          property :parent_followup_intent_name, as: 'parentFollowupIntentName'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :basic_card, as: 'basicCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCard::Representation
      
          property :browse_carousel_card, as: 'browseCarouselCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard::Representation
      
          property :card, as: 'card', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCard::Representation
      
          property :carousel_select, as: 'carouselSelect', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect::Representation
      
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :link_out_suggestion, as: 'linkOutSuggestion', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion::Representation
      
          property :list_select, as: 'listSelect', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageListSelect, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageListSelect::Representation
      
          property :media_content, as: 'mediaContent', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageMediaContent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageMediaContent::Representation
      
          hash :payload, as: 'payload'
          property :platform, as: 'platform'
          property :quick_replies, as: 'quickReplies', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageQuickReplies, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageQuickReplies::Representation
      
          property :rbm_carousel_rich_card, as: 'rbmCarouselRichCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard::Representation
      
          property :rbm_standalone_rich_card, as: 'rbmStandaloneRichCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard::Representation
      
          property :rbm_text, as: 'rbmText', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmText, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmText::Representation
      
          property :simple_responses, as: 'simpleResponses', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses::Representation
      
          property :suggestions, as: 'suggestions', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSuggestions, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSuggestions::Representation
      
          property :table_card, as: 'tableCard', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCard, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCard::Representation
      
          property :telephony_play_audio, as: 'telephonyPlayAudio', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio::Representation
      
          property :telephony_synthesize_speech, as: 'telephonySynthesizeSpeech', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech::Representation
      
          property :telephony_transfer_call, as: 'telephonyTransferCall', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall::Representation
      
          property :text, as: 'text', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageText, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageText::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton::Representation
      
          property :formatted_text, as: 'formattedText'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :open_uri_action, as: 'openUriAction', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_display_options, as: 'imageDisplayOptions'
          collection :items, as: 'items', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :footer, as: 'footer'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :open_uri_action, as: 'openUriAction', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
          property :url_type_hint, as: 'urlTypeHint'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCardButton, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCardButton::Representation
      
          property :image_uri, as: 'imageUri'
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCardButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :postback, as: 'postback'
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :info, as: 'info', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageColumnProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header'
          property :horizontal_alignment, as: 'horizontalAlignment'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accessibility_text, as: 'accessibilityText'
          property :image_uri, as: 'imageUri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_name, as: 'destinationName'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageListSelect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageListSelectItem, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageListSelectItem::Representation
      
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageListSelectItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :info, as: 'info', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :media_objects, as: 'mediaObjects', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject::Representation
      
          property :media_type, as: 'mediaType'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_url, as: 'contentUrl'
          property :description, as: 'description'
          property :icon, as: 'icon', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :large_image, as: 'largeImage', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageQuickReplies
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :quick_replies, as: 'quickReplies'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :media, as: 'media', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia::Representation
      
          collection :suggestions, as: 'suggestions', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion::Representation
      
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_uri, as: 'fileUri'
          property :height, as: 'height'
          property :thumbnail_uri, as: 'thumbnailUri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :card_contents, as: 'cardContents', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent::Representation
      
          property :card_width, as: 'cardWidth'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :card_content, as: 'cardContent', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent::Representation
      
          property :card_orientation, as: 'cardOrientation'
          property :thumbnail_image_alignment, as: 'thumbnailImageAlignment'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dial, as: 'dial', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial::Representation
      
          property :open_url, as: 'openUrl', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri::Representation
      
          property :postback_data, as: 'postbackData'
          property :share_location, as: 'shareLocation', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :phone_number, as: 'phoneNumber'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :postback_data, as: 'postbackData'
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction::Representation
      
          property :reply, as: 'reply', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageRbmText
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rbm_suggestion, as: 'rbmSuggestion', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          collection :synonyms, as: 'synonyms'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_text, as: 'displayText'
          property :ssml, as: 'ssml'
          property :text_to_speech, as: 'textToSpeech'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :simple_responses, as: 'simpleResponses', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggestions, as: 'suggestions', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSuggestion, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageSuggestion::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCard
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton::Representation
      
          collection :column_properties, as: 'columnProperties', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageColumnProperties, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageColumnProperties::Representation
      
          property :image, as: 'image', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageImage::Representation
      
          collection :rows, as: 'rows', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCardRow, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCardRow::Representation
      
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardCell
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cells, as: 'cells', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCardCell, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessageTableCardCell::Representation
      
          property :divider_after, as: 'dividerAfter'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audio_uri, as: 'audioUri'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ssml, as: 'ssml'
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :phone_number, as: 'phoneNumber'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentMessageText
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :text, as: 'text'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_value, as: 'defaultValue'
          property :display_name, as: 'displayName'
          property :entity_type_display_name, as: 'entityTypeDisplayName'
          property :is_list, as: 'isList'
          property :mandatory, as: 'mandatory'
          property :name, as: 'name'
          collection :prompts, as: 'prompts'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :parts, as: 'parts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart::Representation
      
          property :times_added_count, as: 'timesAddedCount'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias, as: 'alias'
          property :entity_type, as: 'entityType'
          property :text, as: 'text'
          property :user_defined, as: 'userDefined'
        end
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeAnswers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :answers, as: 'answers', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :answer, as: 'answer'
          property :faq_question, as: 'faqQuestion'
          property :match_confidence, as: 'matchConfidence'
          property :match_confidence_level, as: 'matchConfidenceLevel'
          property :source, as: 'source'
        end
      end
      
      class GoogleCloudDialogflowV2beta1KnowledgeOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state'
        end
      end
      
      class GoogleCloudDialogflowV2beta1LabelConversationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annotated_conversation_dataset, as: 'annotatedConversationDataset', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1AnnotatedConversationDataset, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1AnnotatedConversationDataset::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :payload, as: 'payload'
          property :source, as: 'source'
          property :version, as: 'version'
        end
      end
      
      class GoogleCloudDialogflowV2beta1QueryResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :all_required_params_present, as: 'allRequiredParamsPresent'
          hash :diagnostic_info, as: 'diagnosticInfo'
          collection :fulfillment_messages, as: 'fulfillmentMessages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage::Representation
      
          property :fulfillment_text, as: 'fulfillmentText'
          property :intent, as: 'intent', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Intent, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Intent::Representation
      
          property :intent_detection_confidence, as: 'intentDetectionConfidence'
          property :knowledge_answers, as: 'knowledgeAnswers', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1KnowledgeAnswers, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1KnowledgeAnswers::Representation
      
          property :language_code, as: 'languageCode'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context::Representation
      
          hash :parameters, as: 'parameters'
          property :query_text, as: 'queryText'
          property :sentiment_analysis_result, as: 'sentimentAnalysisResult', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1SentimentAnalysisResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1SentimentAnalysisResult::Representation
      
          property :speech_recognition_confidence, as: 'speechRecognitionConfidence'
          hash :webhook_payload, as: 'webhookPayload'
          property :webhook_source, as: 'webhookSource'
        end
      end
      
      class GoogleCloudDialogflowV2beta1Sentiment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :magnitude, as: 'magnitude'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudDialogflowV2beta1SentimentAnalysisResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :query_text_sentiment, as: 'queryTextSentiment', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Sentiment, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Sentiment::Representation
      
        end
      end
      
      class GoogleCloudDialogflowV2beta1SessionEntityType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entities, as: 'entities', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityTypeEntity, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EntityTypeEntity::Representation
      
          property :entity_override_mode, as: 'entityOverrideMode'
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudDialogflowV2beta1WebhookRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alternative_query_results, as: 'alternativeQueryResults', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1QueryResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1QueryResult::Representation
      
          property :original_detect_intent_request, as: 'originalDetectIntentRequest', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest::Representation
      
          property :query_result, as: 'queryResult', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1QueryResult, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1QueryResult::Representation
      
          property :response_id, as: 'responseId'
          property :session, as: 'session'
        end
      end
      
      class GoogleCloudDialogflowV2beta1WebhookResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_interaction, as: 'endInteraction'
          property :followup_event_input, as: 'followupEventInput', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EventInput, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1EventInput::Representation
      
          collection :fulfillment_messages, as: 'fulfillmentMessages', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1IntentMessage::Representation
      
          property :fulfillment_text, as: 'fulfillmentText'
          collection :output_contexts, as: 'outputContexts', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1Context::Representation
      
          hash :payload, as: 'payload'
          collection :session_entity_types, as: 'sessionEntityTypes', class: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1SessionEntityType, decorator: Google::Apis::DialogflowV2::GoogleCloudDialogflowV2beta1SessionEntityType::Representation
      
          property :source, as: 'source'
        end
      end
      
      class GoogleLongrunningListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::DialogflowV2::GoogleLongrunningOperation, decorator: Google::Apis::DialogflowV2::GoogleLongrunningOperation::Representation
      
        end
      end
      
      class GoogleLongrunningOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::DialogflowV2::GoogleRpcStatus, decorator: Google::Apis::DialogflowV2::GoogleRpcStatus::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class GoogleProtobufEmpty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleRpcStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class GoogleTypeLatLng
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
    end
  end
end
