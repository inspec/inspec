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
    module DialogflowV2beta1
      
      # The response message for EntityTypes.BatchUpdateEntityTypes.
      class GoogleCloudDialogflowV2BatchUpdateEntityTypesResponse
        include Google::Apis::Core::Hashable
      
        # The collection of updated or created entity types.
        # Corresponds to the JSON property `entityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2EntityType>]
        attr_accessor :entity_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_types = args[:entity_types] if args.key?(:entity_types)
        end
      end
      
      # The response message for Intents.BatchUpdateIntents.
      class GoogleCloudDialogflowV2BatchUpdateIntentsResponse
        include Google::Apis::Core::Hashable
      
        # The collection of updated or created intents.
        # Corresponds to the JSON property `intents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Intent>]
        attr_accessor :intents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intents = args[:intents] if args.key?(:intents)
        end
      end
      
      # Represents a context.
      class GoogleCloudDialogflowV2Context
        include Google::Apis::Core::Hashable
      
        # Optional. The number of conversational query requests after which the
        # context expires. If set to `0` (the default) the context expires
        # immediately. Contexts expire automatically after 20 minutes if there
        # are no matching queries.
        # Corresponds to the JSON property `lifespanCount`
        # @return [Fixnum]
        attr_accessor :lifespan_count
      
        # Required. The unique identifier of the context. Format:
        # `projects/<Project ID>/agent/sessions/<Session ID>/contexts/<Context ID>`.
        # The `Context ID` is always converted to lowercase, may only contain
        # characters in [a-zA-Z0-9_-%] and may be at most 250 bytes long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of parameters associated with this context.
        # Refer to [this
        # doc](https://cloud.google.com/dialogflow/docs/intents-actions-parameters)
        # for syntax.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lifespan_count = args[:lifespan_count] if args.key?(:lifespan_count)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # Represents an entity type.
      # Entity types serve as a tool for extracting parameter values from natural
      # language queries.
      class GoogleCloudDialogflowV2EntityType
        include Google::Apis::Core::Hashable
      
        # Optional. Indicates whether the entity type can be automatically
        # expanded.
        # Corresponds to the JSON property `autoExpansionMode`
        # @return [String]
        attr_accessor :auto_expansion_mode
      
        # Required. The name of the entity type.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Enables fuzzy entity extraction during classification.
        # Corresponds to the JSON property `enableFuzzyExtraction`
        # @return [Boolean]
        attr_accessor :enable_fuzzy_extraction
        alias_method :enable_fuzzy_extraction?, :enable_fuzzy_extraction
      
        # Optional. The collection of entity entries associated with the entity type.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2EntityTypeEntity>]
        attr_accessor :entities
      
        # Required. Indicates the kind of entity type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The unique identifier of the entity type.
        # Required for EntityTypes.UpdateEntityType and
        # EntityTypes.BatchUpdateEntityTypes methods.
        # Format: `projects/<Project ID>/agent/entityTypes/<Entity Type ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_expansion_mode = args[:auto_expansion_mode] if args.key?(:auto_expansion_mode)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enable_fuzzy_extraction = args[:enable_fuzzy_extraction] if args.key?(:enable_fuzzy_extraction)
          @entities = args[:entities] if args.key?(:entities)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An **entity entry** for an associated entity type.
      class GoogleCloudDialogflowV2EntityTypeEntity
        include Google::Apis::Core::Hashable
      
        # Required. A collection of value synonyms. For example, if the entity type
        # is *vegetable*, and `value` is *scallions*, a synonym could be *green
        # onions*.
        # For `KIND_LIST` entity types:
        # *   This collection must contain exactly one synonym equal to `value`.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        # Required. The primary value associated with this entity entry.
        # For example, if the entity type is *vegetable*, the value could be
        # *scallions*.
        # For `KIND_MAP` entity types:
        # *   A canonical value to be used in place of synonyms.
        # For `KIND_LIST` entity types:
        # *   A string that can contain references to other entity types (with or
        # without aliases).
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Events allow for matching intents by event name instead of the natural
      # language input. For instance, input `<event: ` name: "welcome_event",
      # parameters: ` name: "Sam" ` `>` can trigger a personalized welcome response.
      # The parameter `name` may be used by the agent in the response:
      # `"Hello #welcome_event.name! What can I do for you today?"`.
      class GoogleCloudDialogflowV2EventInput
        include Google::Apis::Core::Hashable
      
        # Required. The language of this query. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes. Note that queries in
        # the same session do not necessarily need to specify the same language.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Required. The unique identifier of the event.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of parameters associated with the event.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # The response message for Agents.ExportAgent.
      class GoogleCloudDialogflowV2ExportAgentResponse
        include Google::Apis::Core::Hashable
      
        # Zip compressed raw byte content for agent.
        # Corresponds to the JSON property `agentContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :agent_content
      
        # The URI to a file containing the exported agent. This field is populated
        # only if `agent_uri` is specified in `ExportAgentRequest`.
        # Corresponds to the JSON property `agentUri`
        # @return [String]
        attr_accessor :agent_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_content = args[:agent_content] if args.key?(:agent_content)
          @agent_uri = args[:agent_uri] if args.key?(:agent_uri)
        end
      end
      
      # Represents an intent.
      # Intents convert a number of user expressions or patterns into an action. An
      # action is an extraction of a user command or sentence semantics.
      class GoogleCloudDialogflowV2Intent
        include Google::Apis::Core::Hashable
      
        # Optional. The name of the action associated with the intent.
        # Note: The action name must not contain whitespaces.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Optional. The list of platforms for which the first responses will be
        # copied from the messages in PLATFORM_UNSPECIFIED (i.e. default platform).
        # Corresponds to the JSON property `defaultResponsePlatforms`
        # @return [Array<String>]
        attr_accessor :default_response_platforms
      
        # Required. The name of this intent.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. The collection of event names that trigger the intent.
        # If the collection of input contexts is not empty, all of the contexts must
        # be present in the active user session for an event to trigger this intent.
        # Corresponds to the JSON property `events`
        # @return [Array<String>]
        attr_accessor :events
      
        # Read-only. Information about all followup intents that have this intent as
        # a direct or indirect parent. We populate this field only in the output.
        # Corresponds to the JSON property `followupIntentInfo`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentFollowupIntentInfo>]
        attr_accessor :followup_intent_info
      
        # Optional. The list of context names required for this intent to be
        # triggered.
        # Format: `projects/<Project ID>/agent/sessions/-/contexts/<Context ID>`.
        # Corresponds to the JSON property `inputContextNames`
        # @return [Array<String>]
        attr_accessor :input_context_names
      
        # Optional. Indicates whether this is a fallback intent.
        # Corresponds to the JSON property `isFallback`
        # @return [Boolean]
        attr_accessor :is_fallback
        alias_method :is_fallback?, :is_fallback
      
        # Optional. The collection of rich messages corresponding to the
        # `Response` field in the Dialogflow console.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessage>]
        attr_accessor :messages
      
        # Optional. Indicates whether Machine Learning is disabled for the intent.
        # Note: If `ml_diabled` setting is set to true, then this intent is not
        # taken into account during inference in `ML ONLY` match mode. Also,
        # auto-markup in the UI is turned off.
        # Corresponds to the JSON property `mlDisabled`
        # @return [Boolean]
        attr_accessor :ml_disabled
        alias_method :ml_disabled?, :ml_disabled
      
        # The unique identifier of this intent.
        # Required for Intents.UpdateIntent and Intents.BatchUpdateIntents
        # methods.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of contexts that are activated when the intent
        # is matched. Context messages in this collection should not set the
        # parameters field. Setting the `lifespan_count` to 0 will reset the context
        # when the intent is matched.
        # Format: `projects/<Project ID>/agent/sessions/-/contexts/<Context ID>`.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Context>]
        attr_accessor :output_contexts
      
        # Optional. The collection of parameters associated with the intent.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentParameter>]
        attr_accessor :parameters
      
        # Read-only after creation. The unique identifier of the parent intent in the
        # chain of followup intents. You can set this field when creating an intent,
        # for example with CreateIntent or BatchUpdateIntents, in order to
        # make this intent a followup intent.
        # It identifies the parent followup intent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `parentFollowupIntentName`
        # @return [String]
        attr_accessor :parent_followup_intent_name
      
        # Optional. The priority of this intent. Higher numbers represent higher
        # priorities.
        # - If the supplied value is unspecified or 0, the service
        # translates the value to 500,000, which corresponds to the
        # `Normal` priority in the console.
        # - If the supplied value is negative, the intent is ignored
        # in runtime detect intent requests.
        # Corresponds to the JSON property `priority`
        # @return [Fixnum]
        attr_accessor :priority
      
        # Optional. Indicates whether to delete all contexts in the current
        # session when this intent is matched.
        # Corresponds to the JSON property `resetContexts`
        # @return [Boolean]
        attr_accessor :reset_contexts
        alias_method :reset_contexts?, :reset_contexts
      
        # Read-only. The unique identifier of the root intent in the chain of
        # followup intents. It identifies the correct followup intents chain for
        # this intent. We populate this field only in the output.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `rootFollowupIntentName`
        # @return [String]
        attr_accessor :root_followup_intent_name
      
        # Optional. The collection of examples that the agent is
        # trained on.
        # Corresponds to the JSON property `trainingPhrases`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentTrainingPhrase>]
        attr_accessor :training_phrases
      
        # Optional. Indicates whether webhooks are enabled for the intent.
        # Corresponds to the JSON property `webhookState`
        # @return [String]
        attr_accessor :webhook_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @default_response_platforms = args[:default_response_platforms] if args.key?(:default_response_platforms)
          @display_name = args[:display_name] if args.key?(:display_name)
          @events = args[:events] if args.key?(:events)
          @followup_intent_info = args[:followup_intent_info] if args.key?(:followup_intent_info)
          @input_context_names = args[:input_context_names] if args.key?(:input_context_names)
          @is_fallback = args[:is_fallback] if args.key?(:is_fallback)
          @messages = args[:messages] if args.key?(:messages)
          @ml_disabled = args[:ml_disabled] if args.key?(:ml_disabled)
          @name = args[:name] if args.key?(:name)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @parameters = args[:parameters] if args.key?(:parameters)
          @parent_followup_intent_name = args[:parent_followup_intent_name] if args.key?(:parent_followup_intent_name)
          @priority = args[:priority] if args.key?(:priority)
          @reset_contexts = args[:reset_contexts] if args.key?(:reset_contexts)
          @root_followup_intent_name = args[:root_followup_intent_name] if args.key?(:root_followup_intent_name)
          @training_phrases = args[:training_phrases] if args.key?(:training_phrases)
          @webhook_state = args[:webhook_state] if args.key?(:webhook_state)
        end
      end
      
      # Represents a single followup intent in the chain.
      class GoogleCloudDialogflowV2IntentFollowupIntentInfo
        include Google::Apis::Core::Hashable
      
        # The unique identifier of the followup intent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `followupIntentName`
        # @return [String]
        attr_accessor :followup_intent_name
      
        # The unique identifier of the followup intent's parent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `parentFollowupIntentName`
        # @return [String]
        attr_accessor :parent_followup_intent_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @followup_intent_name = args[:followup_intent_name] if args.key?(:followup_intent_name)
          @parent_followup_intent_name = args[:parent_followup_intent_name] if args.key?(:parent_followup_intent_name)
        end
      end
      
      # Corresponds to the `Response` field in the Dialogflow console.
      class GoogleCloudDialogflowV2IntentMessage
        include Google::Apis::Core::Hashable
      
        # The basic card message. Useful for displaying information.
        # Corresponds to the JSON property `basicCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageBasicCard]
        attr_accessor :basic_card
      
        # The card response message.
        # Corresponds to the JSON property `card`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageCard]
        attr_accessor :card
      
        # The card for presenting a carousel of options to select from.
        # Corresponds to the JSON property `carouselSelect`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageCarouselSelect]
        attr_accessor :carousel_select
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageImage]
        attr_accessor :image
      
        # The suggestion chip message that allows the user to jump out to the app
        # or website associated with this agent.
        # Corresponds to the JSON property `linkOutSuggestion`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion]
        attr_accessor :link_out_suggestion
      
        # The card for presenting a list of options to select from.
        # Corresponds to the JSON property `listSelect`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageListSelect]
        attr_accessor :list_select
      
        # Returns a response containing a custom, platform-specific payload.
        # See the Intent.Message.Platform type for a description of the
        # structure that may be required for your platform.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # Optional. The platform that this message is intended for.
        # Corresponds to the JSON property `platform`
        # @return [String]
        attr_accessor :platform
      
        # The quick replies response message.
        # Corresponds to the JSON property `quickReplies`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageQuickReplies]
        attr_accessor :quick_replies
      
        # The collection of simple response candidates.
        # This message in `QueryResult.fulfillment_messages` and
        # `WebhookResponse.fulfillment_messages` should contain only one
        # `SimpleResponse`.
        # Corresponds to the JSON property `simpleResponses`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSimpleResponses]
        attr_accessor :simple_responses
      
        # The collection of suggestions.
        # Corresponds to the JSON property `suggestions`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSuggestions]
        attr_accessor :suggestions
      
        # The text response message.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageText]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @basic_card = args[:basic_card] if args.key?(:basic_card)
          @card = args[:card] if args.key?(:card)
          @carousel_select = args[:carousel_select] if args.key?(:carousel_select)
          @image = args[:image] if args.key?(:image)
          @link_out_suggestion = args[:link_out_suggestion] if args.key?(:link_out_suggestion)
          @list_select = args[:list_select] if args.key?(:list_select)
          @payload = args[:payload] if args.key?(:payload)
          @platform = args[:platform] if args.key?(:platform)
          @quick_replies = args[:quick_replies] if args.key?(:quick_replies)
          @simple_responses = args[:simple_responses] if args.key?(:simple_responses)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # The basic card message. Useful for displaying information.
      class GoogleCloudDialogflowV2IntentMessageBasicCard
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of card buttons.
        # Corresponds to the JSON property `buttons`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageBasicCardButton>]
        attr_accessor :buttons
      
        # Required, unless image is present. The body text of the card.
        # Corresponds to the JSON property `formattedText`
        # @return [String]
        attr_accessor :formatted_text
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageImage]
        attr_accessor :image
      
        # Optional. The subtitle of the card.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The title of the card.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buttons = args[:buttons] if args.key?(:buttons)
          @formatted_text = args[:formatted_text] if args.key?(:formatted_text)
          @image = args[:image] if args.key?(:image)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The button object that appears at the bottom of a card.
      class GoogleCloudDialogflowV2IntentMessageBasicCardButton
        include Google::Apis::Core::Hashable
      
        # Opens the given URI.
        # Corresponds to the JSON property `openUriAction`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction]
        attr_accessor :open_uri_action
      
        # Required. The title of the button.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @open_uri_action = args[:open_uri_action] if args.key?(:open_uri_action)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Opens the given URI.
      class GoogleCloudDialogflowV2IntentMessageBasicCardButtonOpenUriAction
        include Google::Apis::Core::Hashable
      
        # Required. The HTTP or HTTPS scheme URI.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The card response message.
      class GoogleCloudDialogflowV2IntentMessageCard
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of card buttons.
        # Corresponds to the JSON property `buttons`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageCardButton>]
        attr_accessor :buttons
      
        # Optional. The public URI to an image file for the card.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Optional. The subtitle of the card.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The title of the card.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buttons = args[:buttons] if args.key?(:buttons)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Contains information about a button.
      class GoogleCloudDialogflowV2IntentMessageCardButton
        include Google::Apis::Core::Hashable
      
        # Optional. The text to send back to the Dialogflow API or a URI to
        # open.
        # Corresponds to the JSON property `postback`
        # @return [String]
        attr_accessor :postback
      
        # Optional. The text to show on the button.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @postback = args[:postback] if args.key?(:postback)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # The card for presenting a carousel of options to select from.
      class GoogleCloudDialogflowV2IntentMessageCarouselSelect
        include Google::Apis::Core::Hashable
      
        # Required. Carousel items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageCarouselSelectItem>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # An item in the carousel.
      class GoogleCloudDialogflowV2IntentMessageCarouselSelectItem
        include Google::Apis::Core::Hashable
      
        # Optional. The body text of the card.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageImage]
        attr_accessor :image
      
        # Additional info about the select item for when it is triggered in a
        # dialog.
        # Corresponds to the JSON property `info`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSelectItemInfo]
        attr_accessor :info
      
        # Required. Title of the carousel item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @image = args[:image] if args.key?(:image)
          @info = args[:info] if args.key?(:info)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The image response message.
      class GoogleCloudDialogflowV2IntentMessageImage
        include Google::Apis::Core::Hashable
      
        # Optional. A text description of the image to be used for accessibility,
        # e.g., screen readers.
        # Corresponds to the JSON property `accessibilityText`
        # @return [String]
        attr_accessor :accessibility_text
      
        # Optional. The public URI to an image file.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accessibility_text = args[:accessibility_text] if args.key?(:accessibility_text)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # The suggestion chip message that allows the user to jump out to the app
      # or website associated with this agent.
      class GoogleCloudDialogflowV2IntentMessageLinkOutSuggestion
        include Google::Apis::Core::Hashable
      
        # Required. The name of the app or site this chip is linking to.
        # Corresponds to the JSON property `destinationName`
        # @return [String]
        attr_accessor :destination_name
      
        # Required. The URI of the app or site to open when the user taps the
        # suggestion chip.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination_name = args[:destination_name] if args.key?(:destination_name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The card for presenting a list of options to select from.
      class GoogleCloudDialogflowV2IntentMessageListSelect
        include Google::Apis::Core::Hashable
      
        # Required. List items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageListSelectItem>]
        attr_accessor :items
      
        # Optional. Subtitle of the list.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The overall title of the list.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # An item in the list.
      class GoogleCloudDialogflowV2IntentMessageListSelectItem
        include Google::Apis::Core::Hashable
      
        # Optional. The main text describing the item.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageImage]
        attr_accessor :image
      
        # Additional info about the select item for when it is triggered in a
        # dialog.
        # Corresponds to the JSON property `info`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSelectItemInfo]
        attr_accessor :info
      
        # Required. The title of the list item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @image = args[:image] if args.key?(:image)
          @info = args[:info] if args.key?(:info)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The quick replies response message.
      class GoogleCloudDialogflowV2IntentMessageQuickReplies
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of quick replies.
        # Corresponds to the JSON property `quickReplies`
        # @return [Array<String>]
        attr_accessor :quick_replies
      
        # Optional. The title of the collection of quick replies.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quick_replies = args[:quick_replies] if args.key?(:quick_replies)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Additional info about the select item for when it is triggered in a
      # dialog.
      class GoogleCloudDialogflowV2IntentMessageSelectItemInfo
        include Google::Apis::Core::Hashable
      
        # Required. A unique key that will be sent back to the agent if this
        # response is given.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Optional. A list of synonyms that can also be used to trigger this
        # item in dialog.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
        end
      end
      
      # The simple response message containing speech or text.
      class GoogleCloudDialogflowV2IntentMessageSimpleResponse
        include Google::Apis::Core::Hashable
      
        # Optional. The text to display.
        # Corresponds to the JSON property `displayText`
        # @return [String]
        attr_accessor :display_text
      
        # One of text_to_speech or ssml must be provided. Structured spoken
        # response to the user in the SSML format. Mutually exclusive with
        # text_to_speech.
        # Corresponds to the JSON property `ssml`
        # @return [String]
        attr_accessor :ssml
      
        # One of text_to_speech or ssml must be provided. The plain text of the
        # speech output. Mutually exclusive with ssml.
        # Corresponds to the JSON property `textToSpeech`
        # @return [String]
        attr_accessor :text_to_speech
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_text = args[:display_text] if args.key?(:display_text)
          @ssml = args[:ssml] if args.key?(:ssml)
          @text_to_speech = args[:text_to_speech] if args.key?(:text_to_speech)
        end
      end
      
      # The collection of simple response candidates.
      # This message in `QueryResult.fulfillment_messages` and
      # `WebhookResponse.fulfillment_messages` should contain only one
      # `SimpleResponse`.
      class GoogleCloudDialogflowV2IntentMessageSimpleResponses
        include Google::Apis::Core::Hashable
      
        # Required. The list of simple responses.
        # Corresponds to the JSON property `simpleResponses`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSimpleResponse>]
        attr_accessor :simple_responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @simple_responses = args[:simple_responses] if args.key?(:simple_responses)
        end
      end
      
      # The suggestion chip message that the user can tap to quickly post a reply
      # to the conversation.
      class GoogleCloudDialogflowV2IntentMessageSuggestion
        include Google::Apis::Core::Hashable
      
        # Required. The text shown the in the suggestion chip.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The collection of suggestions.
      class GoogleCloudDialogflowV2IntentMessageSuggestions
        include Google::Apis::Core::Hashable
      
        # Required. The list of suggested replies.
        # Corresponds to the JSON property `suggestions`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessageSuggestion>]
        attr_accessor :suggestions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
        end
      end
      
      # The text response message.
      class GoogleCloudDialogflowV2IntentMessageText
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of the agent's responses.
        # Corresponds to the JSON property `text`
        # @return [Array<String>]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Represents intent parameters.
      class GoogleCloudDialogflowV2IntentParameter
        include Google::Apis::Core::Hashable
      
        # Optional. The default value to use when the `value` yields an empty
        # result.
        # Default values can be extracted from contexts by using the following
        # syntax: `#context_name.parameter_name`.
        # Corresponds to the JSON property `defaultValue`
        # @return [String]
        attr_accessor :default_value
      
        # Required. The name of the parameter.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. The name of the entity type, prefixed with `@`, that
        # describes values of the parameter. If the parameter is
        # required, this must be provided.
        # Corresponds to the JSON property `entityTypeDisplayName`
        # @return [String]
        attr_accessor :entity_type_display_name
      
        # Optional. Indicates whether the parameter represents a list of values.
        # Corresponds to the JSON property `isList`
        # @return [Boolean]
        attr_accessor :is_list
        alias_method :is_list?, :is_list
      
        # Optional. Indicates whether the parameter is required. That is,
        # whether the intent cannot be completed without collecting the parameter
        # value.
        # Corresponds to the JSON property `mandatory`
        # @return [Boolean]
        attr_accessor :mandatory
        alias_method :mandatory?, :mandatory
      
        # The unique identifier of this parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of prompts that the agent can present to the
        # user in order to collect a value for the parameter.
        # Corresponds to the JSON property `prompts`
        # @return [Array<String>]
        attr_accessor :prompts
      
        # Optional. The definition of the parameter value. It can be:
        # - a constant string,
        # - a parameter value defined as `$parameter_name`,
        # - an original parameter value defined as `$parameter_name.original`,
        # - a parameter value from some context defined as
        # `#context_name.parameter_name`.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_value = args[:default_value] if args.key?(:default_value)
          @display_name = args[:display_name] if args.key?(:display_name)
          @entity_type_display_name = args[:entity_type_display_name] if args.key?(:entity_type_display_name)
          @is_list = args[:is_list] if args.key?(:is_list)
          @mandatory = args[:mandatory] if args.key?(:mandatory)
          @name = args[:name] if args.key?(:name)
          @prompts = args[:prompts] if args.key?(:prompts)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents an example that the agent is trained on.
      class GoogleCloudDialogflowV2IntentTrainingPhrase
        include Google::Apis::Core::Hashable
      
        # Output only. The unique identifier of this training phrase.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The ordered list of training phrase parts.
        # The parts are concatenated in order to form the training phrase.
        # Note: The API does not automatically annotate training phrases like the
        # Dialogflow Console does.
        # Note: Do not forget to include whitespace at part boundaries,
        # so the training phrase is well formatted when the parts are concatenated.
        # If the training phrase does not need to be annotated with parameters,
        # you just need a single part with only the Part.text field set.
        # If you want to annotate the training phrase, you must create multiple
        # parts, where the fields of each part are populated in one of two ways:
        # -   `Part.text` is set to a part of the phrase that has no parameters.
        # -   `Part.text` is set to a part of the phrase that you want to annotate,
        # and the `entity_type`, `alias`, and `user_defined` fields are all
        # set.
        # Corresponds to the JSON property `parts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentTrainingPhrasePart>]
        attr_accessor :parts
      
        # Optional. Indicates how many times this example was added to
        # the intent. Each time a developer adds an existing sample by editing an
        # intent or training, this counter is increased.
        # Corresponds to the JSON property `timesAddedCount`
        # @return [Fixnum]
        attr_accessor :times_added_count
      
        # Required. The type of the training phrase.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @parts = args[:parts] if args.key?(:parts)
          @times_added_count = args[:times_added_count] if args.key?(:times_added_count)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a part of a training phrase.
      class GoogleCloudDialogflowV2IntentTrainingPhrasePart
        include Google::Apis::Core::Hashable
      
        # Optional. The parameter name for the value extracted from the
        # annotated part of the example.
        # This field is required for annotated parts of the training phrase.
        # Corresponds to the JSON property `alias`
        # @return [String]
        attr_accessor :alias
      
        # Optional. The entity type name prefixed with `@`.
        # This field is required for annotated parts of the training phrase.
        # Corresponds to the JSON property `entityType`
        # @return [String]
        attr_accessor :entity_type
      
        # Required. The text for this part.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        # Optional. Indicates whether the text was manually annotated.
        # This field is set to true when the Dialogflow Console is used to
        # manually annotate the part. When creating an annotated part with the
        # API, you must set this to true.
        # Corresponds to the JSON property `userDefined`
        # @return [Boolean]
        attr_accessor :user_defined
        alias_method :user_defined?, :user_defined
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias = args[:alias] if args.key?(:alias)
          @entity_type = args[:entity_type] if args.key?(:entity_type)
          @text = args[:text] if args.key?(:text)
          @user_defined = args[:user_defined] if args.key?(:user_defined)
        end
      end
      
      # Represents the contents of the original request that was passed to
      # the `[Streaming]DetectIntent` call.
      class GoogleCloudDialogflowV2OriginalDetectIntentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. This field is set to the value of the `QueryParameters.payload`
        # field passed in the request. Some integrations that query a Dialogflow
        # agent may provide additional information in the payload.
        # In particular for the Telephony Gateway this field has the form:
        # <pre>`
        # "telephony": `
        # "caller_id": "+18558363987"
        # `
        # `</pre>
        # Note: The caller ID field (`caller_id`) will be redacted for Standard
        # Edition agents and populated with the caller ID in [E.164
        # format](https://en.wikipedia.org/wiki/E.164) for Enterprise Edition agents.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # The source of this request, e.g., `google`, `facebook`, `slack`. It is set
        # by Dialogflow-owned servers.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Optional. The version of the protocol used for this request.
        # This field is AoG-specific.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload = args[:payload] if args.key?(:payload)
          @source = args[:source] if args.key?(:source)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Represents the result of conversational query or event processing.
      class GoogleCloudDialogflowV2QueryResult
        include Google::Apis::Core::Hashable
      
        # The action name from the matched intent.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # This field is set to:
        # - `false` if the matched intent has required parameters and not all of
        # the required parameter values have been collected.
        # - `true` if all required parameter values have been collected, or if the
        # matched intent doesn't contain any required parameters.
        # Corresponds to the JSON property `allRequiredParamsPresent`
        # @return [Boolean]
        attr_accessor :all_required_params_present
        alias_method :all_required_params_present?, :all_required_params_present
      
        # The free-form diagnostic info. For example, this field could contain
        # webhook call latency. The string keys of the Struct's fields map can change
        # without notice.
        # Corresponds to the JSON property `diagnosticInfo`
        # @return [Hash<String,Object>]
        attr_accessor :diagnostic_info
      
        # The collection of rich messages to present to the user.
        # Corresponds to the JSON property `fulfillmentMessages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessage>]
        attr_accessor :fulfillment_messages
      
        # The text to be pronounced to the user or shown on the screen.
        # Note: This is a legacy field, `fulfillment_messages` should be preferred.
        # Corresponds to the JSON property `fulfillmentText`
        # @return [String]
        attr_accessor :fulfillment_text
      
        # Represents an intent.
        # Intents convert a number of user expressions or patterns into an action. An
        # action is an extraction of a user command or sentence semantics.
        # Corresponds to the JSON property `intent`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Intent]
        attr_accessor :intent
      
        # The intent detection confidence. Values range from 0.0
        # (completely uncertain) to 1.0 (completely certain).
        # This value is for informational purpose only and is only used to
        # help match the best intent within the classification threshold.
        # This value may change for the same end-user expression at any time due to a
        # model retraining or change in implementation.
        # If there are `multiple knowledge_answers` messages, this value is set to
        # the greatest `knowledgeAnswers.match_confidence` value in the list.
        # Corresponds to the JSON property `intentDetectionConfidence`
        # @return [Float]
        attr_accessor :intent_detection_confidence
      
        # The language that was triggered during intent detection.
        # See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # The collection of output contexts. If applicable,
        # `output_contexts.parameters` contains entries with name
        # `<parameter name>.original` containing the original parameter values
        # before the query.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Context>]
        attr_accessor :output_contexts
      
        # The collection of extracted parameters.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        # The original conversational query text:
        # - If natural language text was provided as input, `query_text` contains
        # a copy of the input.
        # - If natural language speech audio was provided as input, `query_text`
        # contains the speech recognition result. If speech recognizer produced
        # multiple alternatives, a particular one is picked.
        # - If automatic spell correction is enabled, `query_text` will contain the
        # corrected user input.
        # Corresponds to the JSON property `queryText`
        # @return [String]
        attr_accessor :query_text
      
        # The result of sentiment analysis as configured by
        # `sentiment_analysis_request_config`.
        # Corresponds to the JSON property `sentimentAnalysisResult`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2SentimentAnalysisResult]
        attr_accessor :sentiment_analysis_result
      
        # The Speech recognition confidence between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. The default of 0.0 is a sentinel value indicating that confidence
        # was not set.
        # This field is not guaranteed to be accurate or set. In particular this
        # field isn't set for StreamingDetectIntent since the streaming endpoint has
        # separate confidence estimates per portion of the audio in
        # StreamingRecognitionResult.
        # Corresponds to the JSON property `speechRecognitionConfidence`
        # @return [Float]
        attr_accessor :speech_recognition_confidence
      
        # If the query was fulfilled by a webhook call, this field is set to the
        # value of the `payload` field returned in the webhook response.
        # Corresponds to the JSON property `webhookPayload`
        # @return [Hash<String,Object>]
        attr_accessor :webhook_payload
      
        # If the query was fulfilled by a webhook call, this field is set to the
        # value of the `source` field returned in the webhook response.
        # Corresponds to the JSON property `webhookSource`
        # @return [String]
        attr_accessor :webhook_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @all_required_params_present = args[:all_required_params_present] if args.key?(:all_required_params_present)
          @diagnostic_info = args[:diagnostic_info] if args.key?(:diagnostic_info)
          @fulfillment_messages = args[:fulfillment_messages] if args.key?(:fulfillment_messages)
          @fulfillment_text = args[:fulfillment_text] if args.key?(:fulfillment_text)
          @intent = args[:intent] if args.key?(:intent)
          @intent_detection_confidence = args[:intent_detection_confidence] if args.key?(:intent_detection_confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @parameters = args[:parameters] if args.key?(:parameters)
          @query_text = args[:query_text] if args.key?(:query_text)
          @sentiment_analysis_result = args[:sentiment_analysis_result] if args.key?(:sentiment_analysis_result)
          @speech_recognition_confidence = args[:speech_recognition_confidence] if args.key?(:speech_recognition_confidence)
          @webhook_payload = args[:webhook_payload] if args.key?(:webhook_payload)
          @webhook_source = args[:webhook_source] if args.key?(:webhook_source)
        end
      end
      
      # The sentiment, such as positive/negative feeling or association, for a unit
      # of analysis, such as the query text.
      class GoogleCloudDialogflowV2Sentiment
        include Google::Apis::Core::Hashable
      
        # A non-negative number in the [0, +inf) range, which represents the absolute
        # magnitude of sentiment, regardless of score (positive or negative).
        # Corresponds to the JSON property `magnitude`
        # @return [Float]
        attr_accessor :magnitude
      
        # Sentiment score between -1.0 (negative sentiment) and 1.0 (positive
        # sentiment).
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
      
      # The result of sentiment analysis as configured by
      # `sentiment_analysis_request_config`.
      class GoogleCloudDialogflowV2SentimentAnalysisResult
        include Google::Apis::Core::Hashable
      
        # The sentiment, such as positive/negative feeling or association, for a unit
        # of analysis, such as the query text.
        # Corresponds to the JSON property `queryTextSentiment`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Sentiment]
        attr_accessor :query_text_sentiment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_text_sentiment = args[:query_text_sentiment] if args.key?(:query_text_sentiment)
        end
      end
      
      # Represents a session entity type.
      # Extends or replaces a developer entity type at the user session level (we
      # refer to the entity types defined at the agent level as "developer entity
      # types").
      # Note: session entity types apply to all queries, regardless of the language.
      class GoogleCloudDialogflowV2SessionEntityType
        include Google::Apis::Core::Hashable
      
        # Required. The collection of entities associated with this session entity
        # type.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2EntityTypeEntity>]
        attr_accessor :entities
      
        # Required. Indicates whether the additional data should override or
        # supplement the developer entity type definition.
        # Corresponds to the JSON property `entityOverrideMode`
        # @return [String]
        attr_accessor :entity_override_mode
      
        # Required. The unique identifier of this session entity type. Format:
        # `projects/<Project ID>/agent/sessions/<Session ID>/entityTypes/<Entity Type
        # Display Name>`.
        # `<Entity Type Display Name>` must be the display name of an existing entity
        # type in the same agent that will be overridden or supplemented.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @entity_override_mode = args[:entity_override_mode] if args.key?(:entity_override_mode)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The request message for a webhook call.
      class GoogleCloudDialogflowV2WebhookRequest
        include Google::Apis::Core::Hashable
      
        # Represents the contents of the original request that was passed to
        # the `[Streaming]DetectIntent` call.
        # Corresponds to the JSON property `originalDetectIntentRequest`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2OriginalDetectIntentRequest]
        attr_accessor :original_detect_intent_request
      
        # Represents the result of conversational query or event processing.
        # Corresponds to the JSON property `queryResult`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2QueryResult]
        attr_accessor :query_result
      
        # The unique identifier of the response. Contains the same value as
        # `[Streaming]DetectIntentResponse.response_id`.
        # Corresponds to the JSON property `responseId`
        # @return [String]
        attr_accessor :response_id
      
        # The unique identifier of detectIntent request session.
        # Can be used to identify end-user inside webhook implementation.
        # Format: `projects/<Project ID>/agent/sessions/<Session ID>`, or
        # `projects/<Project ID>/agent/environments/<Environment ID>/users/<User
        # ID>/sessions/<Session ID>`.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @original_detect_intent_request = args[:original_detect_intent_request] if args.key?(:original_detect_intent_request)
          @query_result = args[:query_result] if args.key?(:query_result)
          @response_id = args[:response_id] if args.key?(:response_id)
          @session = args[:session] if args.key?(:session)
        end
      end
      
      # The response message for a webhook call.
      class GoogleCloudDialogflowV2WebhookResponse
        include Google::Apis::Core::Hashable
      
        # Events allow for matching intents by event name instead of the natural
        # language input. For instance, input `<event: ` name: "welcome_event",
        # parameters: ` name: "Sam" ` `>` can trigger a personalized welcome response.
        # The parameter `name` may be used by the agent in the response:
        # `"Hello #welcome_event.name! What can I do for you today?"`.
        # Corresponds to the JSON property `followupEventInput`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2EventInput]
        attr_accessor :followup_event_input
      
        # Optional. The collection of rich messages to present to the user. This
        # value is passed directly to `QueryResult.fulfillment_messages`.
        # Corresponds to the JSON property `fulfillmentMessages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2IntentMessage>]
        attr_accessor :fulfillment_messages
      
        # Optional. The text to be shown on the screen. This value is passed directly
        # to `QueryResult.fulfillment_text`.
        # Corresponds to the JSON property `fulfillmentText`
        # @return [String]
        attr_accessor :fulfillment_text
      
        # Optional. The collection of output contexts. This value is passed directly
        # to `QueryResult.output_contexts`.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2Context>]
        attr_accessor :output_contexts
      
        # Optional. This value is passed directly to `QueryResult.webhook_payload`.
        # See the related `fulfillment_messages[i].payload field`, which may be used
        # as an alternative to this field.
        # This field can be used for Actions on Google responses.
        # It should have a structure similar to the JSON message shown here. For more
        # information, see
        # [Actions on Google Webhook
        # Format](https://developers.google.com/actions/dialogflow/webhook)
        # <pre>`
        # "google": `
        # "expectUserResponse": true,
        # "richResponse": `
        # "items": [
        # `
        # "simpleResponse": `
        # "textToSpeech": "this is a simple response"
        # `
        # `
        # ]
        # `
        # `
        # `</pre>
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # Optional. Additional session entity types to replace or extend developer
        # entity types with. The entity synonyms apply to all languages and persist
        # for the session of this query. Setting the session entity types inside
        # webhook overwrites the session entity types that have been set through
        # `DetectIntentRequest.query_params.session_entity_types`.
        # Corresponds to the JSON property `sessionEntityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2SessionEntityType>]
        attr_accessor :session_entity_types
      
        # Optional. This value is passed directly to `QueryResult.webhook_source`.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @followup_event_input = args[:followup_event_input] if args.key?(:followup_event_input)
          @fulfillment_messages = args[:fulfillment_messages] if args.key?(:fulfillment_messages)
          @fulfillment_text = args[:fulfillment_text] if args.key?(:fulfillment_text)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @payload = args[:payload] if args.key?(:payload)
          @session_entity_types = args[:session_entity_types] if args.key?(:session_entity_types)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Represents a conversational agent.
      class GoogleCloudDialogflowV2beta1Agent
        include Google::Apis::Core::Hashable
      
        # Optional. API version displayed in Dialogflow console. If not specified,
        # V2 API is assumed. Clients are free to query different service endpoints
        # for different API versions. However, bots connectors and webhook calls will
        # follow the specified API version.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # Optional. The URI of the agent's avatar.
        # Avatars are used throughout the Dialogflow console and in the self-hosted
        # [Web
        # Demo](https://cloud.google.com/dialogflow/docs/integrations/web-demo)
        # integration.
        # Corresponds to the JSON property `avatarUri`
        # @return [String]
        attr_accessor :avatar_uri
      
        # Optional. To filter out false positive results and still get variety in
        # matched natural language inputs for your agent, you can tune the machine
        # learning classification threshold. If the returned score value is less than
        # the threshold value, then a fallback intent will be triggered or, if there
        # are no fallback intents defined, no intent will be triggered. The score
        # values range from 0.0 (completely uncertain) to 1.0 (completely certain).
        # If set to 0.0, the default of 0.3 is used.
        # Corresponds to the JSON property `classificationThreshold`
        # @return [Float]
        attr_accessor :classification_threshold
      
        # Required. The default language of the agent as a language tag. See
        # [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes. This field cannot be
        # set by the `Update` method.
        # Corresponds to the JSON property `defaultLanguageCode`
        # @return [String]
        attr_accessor :default_language_code
      
        # Optional. The description of this agent.
        # The maximum length is 500 characters. If exceeded, the request is rejected.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. The name of this agent.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Determines whether this agent should log conversation queries.
        # Corresponds to the JSON property `enableLogging`
        # @return [Boolean]
        attr_accessor :enable_logging
        alias_method :enable_logging?, :enable_logging
      
        # Optional. Determines how intents are detected from user queries.
        # Corresponds to the JSON property `matchMode`
        # @return [String]
        attr_accessor :match_mode
      
        # Required. The project of this agent.
        # Format: `projects/<Project ID>`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Optional. The list of all languages supported by this agent (except for the
        # `default_language_code`).
        # Corresponds to the JSON property `supportedLanguageCodes`
        # @return [Array<String>]
        attr_accessor :supported_language_codes
      
        # Optional. The agent tier. If not specified, TIER_STANDARD is assumed.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        # Required. The time zone of this agent from the
        # [time zone database](https://www.iana.org/time-zones), e.g.,
        # America/New_York, Europe/Paris.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @avatar_uri = args[:avatar_uri] if args.key?(:avatar_uri)
          @classification_threshold = args[:classification_threshold] if args.key?(:classification_threshold)
          @default_language_code = args[:default_language_code] if args.key?(:default_language_code)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enable_logging = args[:enable_logging] if args.key?(:enable_logging)
          @match_mode = args[:match_mode] if args.key?(:match_mode)
          @parent = args[:parent] if args.key?(:parent)
          @supported_language_codes = args[:supported_language_codes] if args.key?(:supported_language_codes)
          @tier = args[:tier] if args.key?(:tier)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Represents an annotated conversation dataset.
      # ConversationDataset can have multiple AnnotatedConversationDataset, each of
      # them represents one result from one annotation task.
      # AnnotatedConversationDataset can only be generated from annotation task,
      # which will be triggered by LabelConversation.
      class GoogleCloudDialogflowV2beta1AnnotatedConversationDataset
        include Google::Apis::Core::Hashable
      
        # Output only. Number of examples that have annotations in the annotated
        # conversation dataset.
        # Corresponds to the JSON property `completedExampleCount`
        # @return [Fixnum]
        attr_accessor :completed_example_count
      
        # Output only. Creation time of this annotated conversation dataset.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. The description of the annotated conversation dataset.
        # Maximum of 10000 bytes.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. The display name of the annotated conversation dataset.
        # It's specified when user starts an annotation task. Maximum of 64 bytes.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. Number of examples in the annotated conversation dataset.
        # Corresponds to the JSON property `exampleCount`
        # @return [Fixnum]
        attr_accessor :example_count
      
        # Output only. AnnotatedConversationDataset resource name. Format:
        # `projects/<Project ID>/conversationDatasets/<Conversation Dataset
        # ID>/annotatedConversationDatasets/<Annotated Conversation Dataset ID>`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Question type name that identifies a labeling task.
        # A question is a single task that a worker answers. A question type is set
        # of related questions. Each question belongs to a particular question type.
        # It can be used in CrowdCompute UI to filter and manage labeling tasks.
        # Corresponds to the JSON property `questionTypeName`
        # @return [String]
        attr_accessor :question_type_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completed_example_count = args[:completed_example_count] if args.key?(:completed_example_count)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @example_count = args[:example_count] if args.key?(:example_count)
          @name = args[:name] if args.key?(:name)
          @question_type_name = args[:question_type_name] if args.key?(:question_type_name)
        end
      end
      
      # The request message for EntityTypes.BatchCreateEntities.
      class GoogleCloudDialogflowV2beta1BatchCreateEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The entities to create.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityTypeEntity>]
        attr_accessor :entities
      
        # Optional. The language of entity synonyms defined in `entities`. If not
        # specified, the agent's default language is used.
        # [Many
        # languages](https://cloud.google.com/dialogflow/docs/reference/language)
        # are supported. Note: languages must be enabled in the agent before they can
        # be used.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # The request message for EntityTypes.BatchDeleteEntities.
      class GoogleCloudDialogflowV2beta1BatchDeleteEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The canonical `values` of the entities to delete. Note that
        # these are not fully-qualified names, i.e. they don't start with
        # `projects/<Project ID>`.
        # Corresponds to the JSON property `entityValues`
        # @return [Array<String>]
        attr_accessor :entity_values
      
        # Optional. The language of entity synonyms defined in `entities`. If not
        # specified, the agent's default language is used.
        # [Many
        # languages](https://cloud.google.com/dialogflow/docs/reference/language)
        # are supported. Note: languages must be enabled in the agent before they can
        # be used.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_values = args[:entity_values] if args.key?(:entity_values)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # The request message for EntityTypes.BatchDeleteEntityTypes.
      class GoogleCloudDialogflowV2beta1BatchDeleteEntityTypesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The names entity types to delete. All names must point to the
        # same agent as `parent`.
        # Corresponds to the JSON property `entityTypeNames`
        # @return [Array<String>]
        attr_accessor :entity_type_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_type_names = args[:entity_type_names] if args.key?(:entity_type_names)
        end
      end
      
      # The request message for Intents.BatchDeleteIntents.
      class GoogleCloudDialogflowV2beta1BatchDeleteIntentsRequest
        include Google::Apis::Core::Hashable
      
        # Required. The collection of intents to delete. Only intent `name` must be
        # filled in.
        # Corresponds to the JSON property `intents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Intent>]
        attr_accessor :intents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intents = args[:intents] if args.key?(:intents)
        end
      end
      
      # The request message for EntityTypes.BatchUpdateEntities.
      class GoogleCloudDialogflowV2beta1BatchUpdateEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The entities to update or create.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityTypeEntity>]
        attr_accessor :entities
      
        # Optional. The language of entity synonyms defined in `entities`. If not
        # specified, the agent's default language is used.
        # [Many
        # languages](https://cloud.google.com/dialogflow/docs/reference/language)
        # are supported. Note: languages must be enabled in the agent before they can
        # be used.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. The mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @language_code = args[:language_code] if args.key?(:language_code)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The request message for EntityTypes.BatchUpdateEntityTypes.
      class GoogleCloudDialogflowV2beta1BatchUpdateEntityTypesRequest
        include Google::Apis::Core::Hashable
      
        # This message is a wrapper around a collection of entity types.
        # Corresponds to the JSON property `entityTypeBatchInline`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityTypeBatch]
        attr_accessor :entity_type_batch_inline
      
        # The URI to a Google Cloud Storage file containing entity types to update
        # or create. The file format can either be a serialized proto (of
        # EntityBatch type) or a JSON object. Note: The URI must start with
        # "gs://".
        # Corresponds to the JSON property `entityTypeBatchUri`
        # @return [String]
        attr_accessor :entity_type_batch_uri
      
        # Optional. The language of entity synonyms defined in `entity_types`. If not
        # specified, the agent's default language is used.
        # [Many
        # languages](https://cloud.google.com/dialogflow/docs/reference/language)
        # are supported. Note: languages must be enabled in the agent before they can
        # be used.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. The mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_type_batch_inline = args[:entity_type_batch_inline] if args.key?(:entity_type_batch_inline)
          @entity_type_batch_uri = args[:entity_type_batch_uri] if args.key?(:entity_type_batch_uri)
          @language_code = args[:language_code] if args.key?(:language_code)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The response message for EntityTypes.BatchUpdateEntityTypes.
      class GoogleCloudDialogflowV2beta1BatchUpdateEntityTypesResponse
        include Google::Apis::Core::Hashable
      
        # The collection of updated or created entity types.
        # Corresponds to the JSON property `entityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityType>]
        attr_accessor :entity_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_types = args[:entity_types] if args.key?(:entity_types)
        end
      end
      
      # The request message for Intents.BatchUpdateIntents.
      class GoogleCloudDialogflowV2beta1BatchUpdateIntentsRequest
        include Google::Apis::Core::Hashable
      
        # This message is a wrapper around a collection of intents.
        # Corresponds to the JSON property `intentBatchInline`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentBatch]
        attr_accessor :intent_batch_inline
      
        # The URI to a Google Cloud Storage file containing intents to update or
        # create. The file format can either be a serialized proto (of IntentBatch
        # type) or JSON object. Note: The URI must start with "gs://".
        # Corresponds to the JSON property `intentBatchUri`
        # @return [String]
        attr_accessor :intent_batch_uri
      
        # Optional. The resource view to apply to the returned intent.
        # Corresponds to the JSON property `intentView`
        # @return [String]
        attr_accessor :intent_view
      
        # Optional. The language of training phrases, parameters and rich messages
        # defined in `intents`. If not specified, the agent's default language is
        # used. [Many
        # languages](https://cloud.google.com/dialogflow/docs/reference/language)
        # are supported. Note: languages must be enabled in the agent before they can
        # be used.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. The mask to control which fields get updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intent_batch_inline = args[:intent_batch_inline] if args.key?(:intent_batch_inline)
          @intent_batch_uri = args[:intent_batch_uri] if args.key?(:intent_batch_uri)
          @intent_view = args[:intent_view] if args.key?(:intent_view)
          @language_code = args[:language_code] if args.key?(:language_code)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The response message for Intents.BatchUpdateIntents.
      class GoogleCloudDialogflowV2beta1BatchUpdateIntentsResponse
        include Google::Apis::Core::Hashable
      
        # The collection of updated or created intents.
        # Corresponds to the JSON property `intents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Intent>]
        attr_accessor :intents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intents = args[:intents] if args.key?(:intents)
        end
      end
      
      # Represents a context.
      class GoogleCloudDialogflowV2beta1Context
        include Google::Apis::Core::Hashable
      
        # Optional. The number of conversational query requests after which the
        # context expires. If set to `0` (the default) the context expires
        # immediately. Contexts expire automatically after 20 minutes if there
        # are no matching queries.
        # Corresponds to the JSON property `lifespanCount`
        # @return [Fixnum]
        attr_accessor :lifespan_count
      
        # Required. The unique identifier of the context. Format:
        # `projects/<Project ID>/agent/sessions/<Session ID>/contexts/<Context ID>`,
        # or `projects/<Project ID>/agent/environments/<Environment ID>/users/<User
        # ID>/sessions/<Session ID>/contexts/<Context ID>`.
        # The `Context ID` is always converted to lowercase, may only contain
        # characters in a-zA-Z0-9_-% and may be at most 250 bytes long.
        # If `Environment ID` is not specified, we assume default 'draft'
        # environment. If `User ID` is not specified, we assume default '-' user.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of parameters associated with this context.
        # Refer to [this
        # doc](https://cloud.google.com/dialogflow/docs/intents-actions-parameters)
        # for syntax.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lifespan_count = args[:lifespan_count] if args.key?(:lifespan_count)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # The request to detect user's intent.
      class GoogleCloudDialogflowV2beta1DetectIntentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The natural language speech audio to be processed. This field
        # should be populated iff `query_input` is set to an input audio config.
        # A single request can contain up to 1 minute of speech audio data.
        # Corresponds to the JSON property `inputAudio`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :input_audio
      
        # Instructs the speech synthesizer how to generate the output audio content.
        # Corresponds to the JSON property `outputAudioConfig`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1OutputAudioConfig]
        attr_accessor :output_audio_config
      
        # Represents the query input. It can contain either:
        # 1.  An audio config which
        # instructs the speech recognizer how to process the speech audio.
        # 2.  A conversational query in the form of text.
        # 3.  An event that specifies which intent to trigger.
        # Corresponds to the JSON property `queryInput`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryInput]
        attr_accessor :query_input
      
        # Represents the parameters of the conversational query.
        # Corresponds to the JSON property `queryParams`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryParameters]
        attr_accessor :query_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @input_audio = args[:input_audio] if args.key?(:input_audio)
          @output_audio_config = args[:output_audio_config] if args.key?(:output_audio_config)
          @query_input = args[:query_input] if args.key?(:query_input)
          @query_params = args[:query_params] if args.key?(:query_params)
        end
      end
      
      # The message returned from the DetectIntent method.
      class GoogleCloudDialogflowV2beta1DetectIntentResponse
        include Google::Apis::Core::Hashable
      
        # If Knowledge Connectors are enabled, there could be more than one result
        # returned for a given query or event, and this field will contain all
        # results except for the top one, which is captured in query_result. The
        # alternative results are ordered by decreasing
        # `QueryResult.intent_detection_confidence`. If Knowledge Connectors are
        # disabled, this field will be empty until multiple responses for regular
        # intents are supported, at which point those additional results will be
        # surfaced here.
        # Corresponds to the JSON property `alternativeQueryResults`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryResult>]
        attr_accessor :alternative_query_results
      
        # The audio data bytes encoded as specified in the request.
        # Note: The output audio is generated based on the values of default platform
        # text responses found in the `query_result.fulfillment_messages` field. If
        # multiple default text responses exist, they will be concatenated when
        # generating audio. If no default platform text responses exist, the
        # generated audio content will be empty.
        # Corresponds to the JSON property `outputAudio`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :output_audio
      
        # Instructs the speech synthesizer how to generate the output audio content.
        # Corresponds to the JSON property `outputAudioConfig`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1OutputAudioConfig]
        attr_accessor :output_audio_config
      
        # Represents the result of conversational query or event processing.
        # Corresponds to the JSON property `queryResult`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryResult]
        attr_accessor :query_result
      
        # The unique identifier of the response. It can be used to
        # locate a response in the training example set or for reporting issues.
        # Corresponds to the JSON property `responseId`
        # @return [String]
        attr_accessor :response_id
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `webhookStatus`
        # @return [Google::Apis::DialogflowV2beta1::GoogleRpcStatus]
        attr_accessor :webhook_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_query_results = args[:alternative_query_results] if args.key?(:alternative_query_results)
          @output_audio = args[:output_audio] if args.key?(:output_audio)
          @output_audio_config = args[:output_audio_config] if args.key?(:output_audio_config)
          @query_result = args[:query_result] if args.key?(:query_result)
          @response_id = args[:response_id] if args.key?(:response_id)
          @webhook_status = args[:webhook_status] if args.key?(:webhook_status)
        end
      end
      
      # A document resource.
      # Note: The `projects.agent.knowledgeBases.documents` resource is deprecated;
      # only use `projects.knowledgeBases.documents`.
      class GoogleCloudDialogflowV2beta1Document
        include Google::Apis::Core::Hashable
      
        # The raw content of the document. This field is only permitted for
        # EXTRACTIVE_QA and FAQ knowledge types.
        # Note: This field is in the process of being deprecated, please use
        # raw_content instead.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The URI where the file content is located.
        # For documents stored in Google Cloud Storage, these URIs must have
        # the form `gs://<bucket-name>/<object-name>`.
        # NOTE: External URLs must correspond to public webpages, i.e., they must
        # be indexed by Google Search. In particular, URLs for showing documents in
        # Google Cloud Storage (i.e. the URL in your browser) are not supported.
        # Instead use the `gs://` format URI described above.
        # Corresponds to the JSON property `contentUri`
        # @return [String]
        attr_accessor :content_uri
      
        # Required. The display name of the document. The name must be 1024 bytes or
        # less; otherwise, the creation request fails.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Required. The knowledge type of document content.
        # Corresponds to the JSON property `knowledgeTypes`
        # @return [Array<String>]
        attr_accessor :knowledge_types
      
        # Required. The MIME type of this document.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The document resource name.
        # The name must be empty when creating a document.
        # Format: `projects/<Project ID>/knowledgeBases/<Knowledge Base
        # ID>/documents/<Document ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The raw content of the document. This field is only permitted for
        # EXTRACTIVE_QA and FAQ knowledge types.
        # Corresponds to the JSON property `rawContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw_content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @content_uri = args[:content_uri] if args.key?(:content_uri)
          @display_name = args[:display_name] if args.key?(:display_name)
          @knowledge_types = args[:knowledge_types] if args.key?(:knowledge_types)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @name = args[:name] if args.key?(:name)
          @raw_content = args[:raw_content] if args.key?(:raw_content)
        end
      end
      
      # Represents an entity type.
      # Entity types serve as a tool for extracting parameter values from natural
      # language queries.
      class GoogleCloudDialogflowV2beta1EntityType
        include Google::Apis::Core::Hashable
      
        # Optional. Indicates whether the entity type can be automatically
        # expanded.
        # Corresponds to the JSON property `autoExpansionMode`
        # @return [String]
        attr_accessor :auto_expansion_mode
      
        # Required. The name of the entity type.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Enables fuzzy entity extraction during classification.
        # Corresponds to the JSON property `enableFuzzyExtraction`
        # @return [Boolean]
        attr_accessor :enable_fuzzy_extraction
        alias_method :enable_fuzzy_extraction?, :enable_fuzzy_extraction
      
        # Optional. The collection of entity entries associated with the entity type.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityTypeEntity>]
        attr_accessor :entities
      
        # Required. Indicates the kind of entity type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The unique identifier of the entity type.
        # Required for EntityTypes.UpdateEntityType and
        # EntityTypes.BatchUpdateEntityTypes methods.
        # Format: `projects/<Project ID>/agent/entityTypes/<Entity Type ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_expansion_mode = args[:auto_expansion_mode] if args.key?(:auto_expansion_mode)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enable_fuzzy_extraction = args[:enable_fuzzy_extraction] if args.key?(:enable_fuzzy_extraction)
          @entities = args[:entities] if args.key?(:entities)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # This message is a wrapper around a collection of entity types.
      class GoogleCloudDialogflowV2beta1EntityTypeBatch
        include Google::Apis::Core::Hashable
      
        # A collection of entity types.
        # Corresponds to the JSON property `entityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityType>]
        attr_accessor :entity_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_types = args[:entity_types] if args.key?(:entity_types)
        end
      end
      
      # An **entity entry** for an associated entity type.
      class GoogleCloudDialogflowV2beta1EntityTypeEntity
        include Google::Apis::Core::Hashable
      
        # Required. A collection of value synonyms. For example, if the entity type
        # is *vegetable*, and `value` is *scallions*, a synonym could be *green
        # onions*.
        # For `KIND_LIST` entity types:
        # *   This collection must contain exactly one synonym equal to `value`.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        # Required. The primary value associated with this entity entry.
        # For example, if the entity type is *vegetable*, the value could be
        # *scallions*.
        # For `KIND_MAP` entity types:
        # *   A canonical value to be used in place of synonyms.
        # For `KIND_LIST` entity types:
        # *   A string that can contain references to other entity types (with or
        # without aliases).
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Events allow for matching intents by event name instead of the natural
      # language input. For instance, input `<event: ` name: "welcome_event",
      # parameters: ` name: "Sam" ` `>` can trigger a personalized welcome response.
      # The parameter `name` may be used by the agent in the response:
      # `"Hello #welcome_event.name! What can I do for you today?"`.
      class GoogleCloudDialogflowV2beta1EventInput
        include Google::Apis::Core::Hashable
      
        # Required. The language of this query. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes. Note that queries in
        # the same session do not necessarily need to specify the same language.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Required. The unique identifier of the event.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of parameters associated with the event.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @name = args[:name] if args.key?(:name)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # The request message for Agents.ExportAgent.
      class GoogleCloudDialogflowV2beta1ExportAgentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The
        # [Google Cloud Storage](https://cloud.google.com/storage/docs/)
        # URI to export the agent to.
        # The format of this URI must be `gs://<bucket-name>/<object-name>`.
        # If left unspecified, the serialized agent is returned inline.
        # Corresponds to the JSON property `agentUri`
        # @return [String]
        attr_accessor :agent_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_uri = args[:agent_uri] if args.key?(:agent_uri)
        end
      end
      
      # The response message for Agents.ExportAgent.
      class GoogleCloudDialogflowV2beta1ExportAgentResponse
        include Google::Apis::Core::Hashable
      
        # Zip compressed raw byte content for agent.
        # Corresponds to the JSON property `agentContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :agent_content
      
        # The URI to a file containing the exported agent. This field is populated
        # only if `agent_uri` is specified in `ExportAgentRequest`.
        # Corresponds to the JSON property `agentUri`
        # @return [String]
        attr_accessor :agent_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_content = args[:agent_content] if args.key?(:agent_content)
          @agent_uri = args[:agent_uri] if args.key?(:agent_uri)
        end
      end
      
      # Google Cloud Storage location for single input.
      class GoogleCloudDialogflowV2beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Required. The Google Cloud Storage URIs for the inputs. A URI is of the
        # form:
        # gs://bucket/object-prefix-or-name
        # Whether a prefix or name is used depends on the use case.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The request message for Agents.ImportAgent.
      class GoogleCloudDialogflowV2beta1ImportAgentRequest
        include Google::Apis::Core::Hashable
      
        # Zip compressed raw byte content for agent.
        # Corresponds to the JSON property `agentContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :agent_content
      
        # The URI to a Google Cloud Storage file containing the agent to import.
        # Note: The URI must start with "gs://".
        # Corresponds to the JSON property `agentUri`
        # @return [String]
        attr_accessor :agent_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_content = args[:agent_content] if args.key?(:agent_content)
          @agent_uri = args[:agent_uri] if args.key?(:agent_uri)
        end
      end
      
      # Instructs the speech recognizer on how to process the audio content.
      class GoogleCloudDialogflowV2beta1InputAudioConfig
        include Google::Apis::Core::Hashable
      
        # Required. Audio encoding of the audio content to process.
        # Corresponds to the JSON property `audioEncoding`
        # @return [String]
        attr_accessor :audio_encoding
      
        # Optional. If `true`, Dialogflow returns SpeechWordInfo in
        # StreamingRecognitionResult with information about the recognized speech
        # words, e.g. start and end time offsets. If false or unspecified, Speech
        # doesn't return any word-level information.
        # Corresponds to the JSON property `enableWordInfo`
        # @return [Boolean]
        attr_accessor :enable_word_info
        alias_method :enable_word_info?, :enable_word_info
      
        # Required. The language of the supplied audio. Dialogflow does not do
        # translations. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes. Note that queries in
        # the same session do not necessarily need to specify the same language.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. Which Speech model to select for the given request. Select the
        # model best suited to your domain to get best results. If a model is not
        # explicitly specified, then we auto-select a model based on the parameters
        # in the InputAudioConfig.
        # If enhanced speech model is enabled for the agent and an enhanced
        # version of the specified model for the language does not exist, then the
        # speech is recognized using the standard version of the specified model.
        # Refer to
        # [Cloud Speech API
        # documentation](https://cloud.google.com/speech-to-text/docs/basics#select-
        # model)
        # for more details.
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # Optional. Which variant of the Speech model to use.
        # Corresponds to the JSON property `modelVariant`
        # @return [String]
        attr_accessor :model_variant
      
        # Optional. A list of strings containing words and phrases that the speech
        # recognizer should recognize with higher likelihood.
        # See [the Cloud Speech
        # documentation](https://cloud.google.com/speech-to-text/docs/basics#phrase-
        # hints)
        # for more details.
        # Corresponds to the JSON property `phraseHints`
        # @return [Array<String>]
        attr_accessor :phrase_hints
      
        # Required. Sample rate (in Hertz) of the audio content sent in the query.
        # Refer to
        # [Cloud Speech API
        # documentation](https://cloud.google.com/speech-to-text/docs/basics) for
        # more details.
        # Corresponds to the JSON property `sampleRateHertz`
        # @return [Fixnum]
        attr_accessor :sample_rate_hertz
      
        # Optional. If `false` (default), recognition does not cease until the
        # client closes the stream.
        # If `true`, the recognizer will detect a single spoken utterance in input
        # audio. Recognition ceases when it detects the audio's voice has
        # stopped or paused. In this case, once a detected intent is received, the
        # client should close the stream and start a new request with a new stream as
        # needed.
        # Note: This setting is relevant only for streaming methods.
        # Note: When specified, InputAudioConfig.single_utterance takes precedence
        # over StreamingDetectIntentRequest.single_utterance.
        # Corresponds to the JSON property `singleUtterance`
        # @return [Boolean]
        attr_accessor :single_utterance
        alias_method :single_utterance?, :single_utterance
      
        # Optional. Context information to assist speech recognition.
        # See [the Cloud Speech
        # documentation](https://cloud.google.com/speech-to-text/docs/basics#phrase-
        # hints)
        # for more details.
        # Corresponds to the JSON property `speechContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SpeechContext>]
        attr_accessor :speech_contexts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_encoding = args[:audio_encoding] if args.key?(:audio_encoding)
          @enable_word_info = args[:enable_word_info] if args.key?(:enable_word_info)
          @language_code = args[:language_code] if args.key?(:language_code)
          @model = args[:model] if args.key?(:model)
          @model_variant = args[:model_variant] if args.key?(:model_variant)
          @phrase_hints = args[:phrase_hints] if args.key?(:phrase_hints)
          @sample_rate_hertz = args[:sample_rate_hertz] if args.key?(:sample_rate_hertz)
          @single_utterance = args[:single_utterance] if args.key?(:single_utterance)
          @speech_contexts = args[:speech_contexts] if args.key?(:speech_contexts)
        end
      end
      
      # Represents an intent.
      # Intents convert a number of user expressions or patterns into an action. An
      # action is an extraction of a user command or sentence semantics.
      class GoogleCloudDialogflowV2beta1Intent
        include Google::Apis::Core::Hashable
      
        # Optional. The name of the action associated with the intent.
        # Note: The action name must not contain whitespaces.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Optional. The list of platforms for which the first responses will be
        # copied from the messages in PLATFORM_UNSPECIFIED (i.e. default platform).
        # Corresponds to the JSON property `defaultResponsePlatforms`
        # @return [Array<String>]
        attr_accessor :default_response_platforms
      
        # Required. The name of this intent.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Indicates that this intent ends an interaction. Some integrations
        # (e.g., Actions on Google or Dialogflow phone gateway) use this information
        # to close interaction with an end user. Default is false.
        # Corresponds to the JSON property `endInteraction`
        # @return [Boolean]
        attr_accessor :end_interaction
        alias_method :end_interaction?, :end_interaction
      
        # Optional. The collection of event names that trigger the intent.
        # If the collection of input contexts is not empty, all of the contexts must
        # be present in the active user session for an event to trigger this intent.
        # Corresponds to the JSON property `events`
        # @return [Array<String>]
        attr_accessor :events
      
        # Read-only. Information about all followup intents that have this intent as
        # a direct or indirect parent. We populate this field only in the output.
        # Corresponds to the JSON property `followupIntentInfo`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo>]
        attr_accessor :followup_intent_info
      
        # Optional. The list of context names required for this intent to be
        # triggered.
        # Format: `projects/<Project ID>/agent/sessions/-/contexts/<Context ID>`.
        # Corresponds to the JSON property `inputContextNames`
        # @return [Array<String>]
        attr_accessor :input_context_names
      
        # Optional. Indicates whether this is a fallback intent.
        # Corresponds to the JSON property `isFallback`
        # @return [Boolean]
        attr_accessor :is_fallback
        alias_method :is_fallback?, :is_fallback
      
        # Optional. The collection of rich messages corresponding to the
        # `Response` field in the Dialogflow console.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessage>]
        attr_accessor :messages
      
        # Optional. Indicates whether Machine Learning is disabled for the intent.
        # Note: If `ml_disabled` setting is set to true, then this intent is not
        # taken into account during inference in `ML ONLY` match mode. Also,
        # auto-markup in the UI is turned off.
        # Corresponds to the JSON property `mlDisabled`
        # @return [Boolean]
        attr_accessor :ml_disabled
        alias_method :ml_disabled?, :ml_disabled
      
        # Optional. Indicates whether Machine Learning is enabled for the intent.
        # Note: If `ml_enabled` setting is set to false, then this intent is not
        # taken into account during inference in `ML ONLY` match mode. Also,
        # auto-markup in the UI is turned off.
        # DEPRECATED! Please use `ml_disabled` field instead.
        # NOTE: If both `ml_enabled` and `ml_disabled` are either not set or false,
        # then the default value is determined as follows:
        # - Before April 15th, 2018 the default is:
        # ml_enabled = false / ml_disabled = true.
        # - After April 15th, 2018 the default is:
        # ml_enabled = true / ml_disabled = false.
        # Corresponds to the JSON property `mlEnabled`
        # @return [Boolean]
        attr_accessor :ml_enabled
        alias_method :ml_enabled?, :ml_enabled
      
        # The unique identifier of this intent.
        # Required for Intents.UpdateIntent and Intents.BatchUpdateIntents
        # methods.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of contexts that are activated when the intent
        # is matched. Context messages in this collection should not set the
        # parameters field. Setting the `lifespan_count` to 0 will reset the context
        # when the intent is matched.
        # Format: `projects/<Project ID>/agent/sessions/-/contexts/<Context ID>`.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Context>]
        attr_accessor :output_contexts
      
        # Optional. The collection of parameters associated with the intent.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentParameter>]
        attr_accessor :parameters
      
        # Read-only after creation. The unique identifier of the parent intent in the
        # chain of followup intents. You can set this field when creating an intent,
        # for example with CreateIntent or BatchUpdateIntents, in order to
        # make this intent a followup intent.
        # It identifies the parent followup intent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `parentFollowupIntentName`
        # @return [String]
        attr_accessor :parent_followup_intent_name
      
        # The priority of this intent. Higher numbers represent higher
        # priorities.
        # - If the supplied value is unspecified or 0, the service
        # translates the value to 500,000, which corresponds to the
        # `Normal` priority in the console.
        # - If the supplied value is negative, the intent is ignored
        # in runtime detect intent requests.
        # Corresponds to the JSON property `priority`
        # @return [Fixnum]
        attr_accessor :priority
      
        # Optional. Indicates whether to delete all contexts in the current
        # session when this intent is matched.
        # Corresponds to the JSON property `resetContexts`
        # @return [Boolean]
        attr_accessor :reset_contexts
        alias_method :reset_contexts?, :reset_contexts
      
        # Read-only. The unique identifier of the root intent in the chain of
        # followup intents. It identifies the correct followup intents chain for
        # this intent. We populate this field only in the output.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `rootFollowupIntentName`
        # @return [String]
        attr_accessor :root_followup_intent_name
      
        # Optional. The collection of examples that the agent is
        # trained on.
        # Corresponds to the JSON property `trainingPhrases`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentTrainingPhrase>]
        attr_accessor :training_phrases
      
        # Optional. Indicates whether webhooks are enabled for the intent.
        # Corresponds to the JSON property `webhookState`
        # @return [String]
        attr_accessor :webhook_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @default_response_platforms = args[:default_response_platforms] if args.key?(:default_response_platforms)
          @display_name = args[:display_name] if args.key?(:display_name)
          @end_interaction = args[:end_interaction] if args.key?(:end_interaction)
          @events = args[:events] if args.key?(:events)
          @followup_intent_info = args[:followup_intent_info] if args.key?(:followup_intent_info)
          @input_context_names = args[:input_context_names] if args.key?(:input_context_names)
          @is_fallback = args[:is_fallback] if args.key?(:is_fallback)
          @messages = args[:messages] if args.key?(:messages)
          @ml_disabled = args[:ml_disabled] if args.key?(:ml_disabled)
          @ml_enabled = args[:ml_enabled] if args.key?(:ml_enabled)
          @name = args[:name] if args.key?(:name)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @parameters = args[:parameters] if args.key?(:parameters)
          @parent_followup_intent_name = args[:parent_followup_intent_name] if args.key?(:parent_followup_intent_name)
          @priority = args[:priority] if args.key?(:priority)
          @reset_contexts = args[:reset_contexts] if args.key?(:reset_contexts)
          @root_followup_intent_name = args[:root_followup_intent_name] if args.key?(:root_followup_intent_name)
          @training_phrases = args[:training_phrases] if args.key?(:training_phrases)
          @webhook_state = args[:webhook_state] if args.key?(:webhook_state)
        end
      end
      
      # This message is a wrapper around a collection of intents.
      class GoogleCloudDialogflowV2beta1IntentBatch
        include Google::Apis::Core::Hashable
      
        # A collection of intents.
        # Corresponds to the JSON property `intents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Intent>]
        attr_accessor :intents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intents = args[:intents] if args.key?(:intents)
        end
      end
      
      # Represents a single followup intent in the chain.
      class GoogleCloudDialogflowV2beta1IntentFollowupIntentInfo
        include Google::Apis::Core::Hashable
      
        # The unique identifier of the followup intent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `followupIntentName`
        # @return [String]
        attr_accessor :followup_intent_name
      
        # The unique identifier of the followup intent's parent.
        # Format: `projects/<Project ID>/agent/intents/<Intent ID>`.
        # Corresponds to the JSON property `parentFollowupIntentName`
        # @return [String]
        attr_accessor :parent_followup_intent_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @followup_intent_name = args[:followup_intent_name] if args.key?(:followup_intent_name)
          @parent_followup_intent_name = args[:parent_followup_intent_name] if args.key?(:parent_followup_intent_name)
        end
      end
      
      # Corresponds to the `Response` field in the Dialogflow console.
      class GoogleCloudDialogflowV2beta1IntentMessage
        include Google::Apis::Core::Hashable
      
        # The basic card message. Useful for displaying information.
        # Corresponds to the JSON property `basicCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBasicCard]
        attr_accessor :basic_card
      
        # Browse Carousel Card for Actions on Google.
        # https://developers.google.com/actions/assistant/responses#browsing_carousel
        # Corresponds to the JSON property `browseCarouselCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard]
        attr_accessor :browse_carousel_card
      
        # The card response message.
        # Corresponds to the JSON property `card`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageCard]
        attr_accessor :card
      
        # The card for presenting a carousel of options to select from.
        # Corresponds to the JSON property `carouselSelect`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect]
        attr_accessor :carousel_select
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # The suggestion chip message that allows the user to jump out to the app
        # or website associated with this agent.
        # Corresponds to the JSON property `linkOutSuggestion`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion]
        attr_accessor :link_out_suggestion
      
        # The card for presenting a list of options to select from.
        # Corresponds to the JSON property `listSelect`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageListSelect]
        attr_accessor :list_select
      
        # The media content card for Actions on Google.
        # Corresponds to the JSON property `mediaContent`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageMediaContent]
        attr_accessor :media_content
      
        # Returns a response containing a custom, platform-specific payload.
        # See the Intent.Message.Platform type for a description of the
        # structure that may be required for your platform.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # Optional. The platform that this message is intended for.
        # Corresponds to the JSON property `platform`
        # @return [String]
        attr_accessor :platform
      
        # The quick replies response message.
        # Corresponds to the JSON property `quickReplies`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageQuickReplies]
        attr_accessor :quick_replies
      
        # Carousel Rich Business Messaging (RBM) rich card.
        # Rich cards allow you to respond to users with more vivid content, e.g.
        # with media and suggestions.
        # For more details about RBM rich cards, please see:
        # https://developers.google.com/rcs-business-messaging/rbm/guides/build/send-
        # messages#rich-cards.
        # If you want to show a single card with more control over the layout,
        # please use RbmStandaloneCard instead.
        # Corresponds to the JSON property `rbmCarouselRichCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard]
        attr_accessor :rbm_carousel_rich_card
      
        # Standalone Rich Business Messaging (RBM) rich card.
        # Rich cards allow you to respond to users with more vivid content, e.g.
        # with media and suggestions.
        # For more details about RBM rich cards, please see:
        # https://developers.google.com/rcs-business-messaging/rbm/guides/build/send-
        # messages#rich-cards.
        # You can group multiple rich cards into one using RbmCarouselCard but
        # carousel cards will give you less control over the card layout.
        # Corresponds to the JSON property `rbmStandaloneRichCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard]
        attr_accessor :rbm_standalone_rich_card
      
        # Rich Business Messaging (RBM) text response with suggestions.
        # Corresponds to the JSON property `rbmText`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmText]
        attr_accessor :rbm_text
      
        # The collection of simple response candidates.
        # This message in `QueryResult.fulfillment_messages` and
        # `WebhookResponse.fulfillment_messages` should contain only one
        # `SimpleResponse`.
        # Corresponds to the JSON property `simpleResponses`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses]
        attr_accessor :simple_responses
      
        # The collection of suggestions.
        # Corresponds to the JSON property `suggestions`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSuggestions]
        attr_accessor :suggestions
      
        # Table card for Actions on Google.
        # Corresponds to the JSON property `tableCard`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTableCard]
        attr_accessor :table_card
      
        # Plays audio from a file in Telephony Gateway.
        # Corresponds to the JSON property `telephonyPlayAudio`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio]
        attr_accessor :telephony_play_audio
      
        # Synthesizes speech and plays back the synthesized audio to the caller in
        # Telephony Gateway.
        # Telephony Gateway takes the synthesizer settings from
        # `DetectIntentResponse.output_audio_config` which can either be set
        # at request-level or can come from the agent-level synthesizer config.
        # Corresponds to the JSON property `telephonySynthesizeSpeech`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech]
        attr_accessor :telephony_synthesize_speech
      
        # Transfers the call in Telephony Gateway.
        # Corresponds to the JSON property `telephonyTransferCall`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall]
        attr_accessor :telephony_transfer_call
      
        # The text response message.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageText]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @basic_card = args[:basic_card] if args.key?(:basic_card)
          @browse_carousel_card = args[:browse_carousel_card] if args.key?(:browse_carousel_card)
          @card = args[:card] if args.key?(:card)
          @carousel_select = args[:carousel_select] if args.key?(:carousel_select)
          @image = args[:image] if args.key?(:image)
          @link_out_suggestion = args[:link_out_suggestion] if args.key?(:link_out_suggestion)
          @list_select = args[:list_select] if args.key?(:list_select)
          @media_content = args[:media_content] if args.key?(:media_content)
          @payload = args[:payload] if args.key?(:payload)
          @platform = args[:platform] if args.key?(:platform)
          @quick_replies = args[:quick_replies] if args.key?(:quick_replies)
          @rbm_carousel_rich_card = args[:rbm_carousel_rich_card] if args.key?(:rbm_carousel_rich_card)
          @rbm_standalone_rich_card = args[:rbm_standalone_rich_card] if args.key?(:rbm_standalone_rich_card)
          @rbm_text = args[:rbm_text] if args.key?(:rbm_text)
          @simple_responses = args[:simple_responses] if args.key?(:simple_responses)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
          @table_card = args[:table_card] if args.key?(:table_card)
          @telephony_play_audio = args[:telephony_play_audio] if args.key?(:telephony_play_audio)
          @telephony_synthesize_speech = args[:telephony_synthesize_speech] if args.key?(:telephony_synthesize_speech)
          @telephony_transfer_call = args[:telephony_transfer_call] if args.key?(:telephony_transfer_call)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # The basic card message. Useful for displaying information.
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCard
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of card buttons.
        # Corresponds to the JSON property `buttons`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton>]
        attr_accessor :buttons
      
        # Required, unless image is present. The body text of the card.
        # Corresponds to the JSON property `formattedText`
        # @return [String]
        attr_accessor :formatted_text
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # Optional. The subtitle of the card.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The title of the card.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buttons = args[:buttons] if args.key?(:buttons)
          @formatted_text = args[:formatted_text] if args.key?(:formatted_text)
          @image = args[:image] if args.key?(:image)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The button object that appears at the bottom of a card.
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton
        include Google::Apis::Core::Hashable
      
        # Opens the given URI.
        # Corresponds to the JSON property `openUriAction`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction]
        attr_accessor :open_uri_action
      
        # Required. The title of the button.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @open_uri_action = args[:open_uri_action] if args.key?(:open_uri_action)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Opens the given URI.
      class GoogleCloudDialogflowV2beta1IntentMessageBasicCardButtonOpenUriAction
        include Google::Apis::Core::Hashable
      
        # Required. The HTTP or HTTPS scheme URI.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Browse Carousel Card for Actions on Google.
      # https://developers.google.com/actions/assistant/responses#browsing_carousel
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCard
        include Google::Apis::Core::Hashable
      
        # Optional. Settings for displaying the image. Applies to every image in
        # items.
        # Corresponds to the JSON property `imageDisplayOptions`
        # @return [String]
        attr_accessor :image_display_options
      
        # Required. List of items in the Browse Carousel Card. Minimum of two
        # items, maximum of ten.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_display_options = args[:image_display_options] if args.key?(:image_display_options)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # Browsing carousel tile
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItem
        include Google::Apis::Core::Hashable
      
        # Optional. Description of the carousel item. Maximum of four lines of
        # text.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. Text that appears at the bottom of the Browse Carousel
        # Card. Maximum of one line of text.
        # Corresponds to the JSON property `footer`
        # @return [String]
        attr_accessor :footer
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # Actions on Google action to open a given url.
        # Corresponds to the JSON property `openUriAction`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction]
        attr_accessor :open_uri_action
      
        # Required. Title of the carousel item. Maximum of two lines of text.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @footer = args[:footer] if args.key?(:footer)
          @image = args[:image] if args.key?(:image)
          @open_uri_action = args[:open_uri_action] if args.key?(:open_uri_action)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Actions on Google action to open a given url.
      class GoogleCloudDialogflowV2beta1IntentMessageBrowseCarouselCardBrowseCarouselCardItemOpenUrlAction
        include Google::Apis::Core::Hashable
      
        # Required. URL
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # Optional. Specifies the type of viewer that is used when opening
        # the URL. Defaults to opening via web browser.
        # Corresponds to the JSON property `urlTypeHint`
        # @return [String]
        attr_accessor :url_type_hint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url = args[:url] if args.key?(:url)
          @url_type_hint = args[:url_type_hint] if args.key?(:url_type_hint)
        end
      end
      
      # The card response message.
      class GoogleCloudDialogflowV2beta1IntentMessageCard
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of card buttons.
        # Corresponds to the JSON property `buttons`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageCardButton>]
        attr_accessor :buttons
      
        # Optional. The public URI to an image file for the card.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Optional. The subtitle of the card.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The title of the card.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buttons = args[:buttons] if args.key?(:buttons)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Optional. Contains information about a button.
      class GoogleCloudDialogflowV2beta1IntentMessageCardButton
        include Google::Apis::Core::Hashable
      
        # Optional. The text to send back to the Dialogflow API or a URI to
        # open.
        # Corresponds to the JSON property `postback`
        # @return [String]
        attr_accessor :postback
      
        # Optional. The text to show on the button.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @postback = args[:postback] if args.key?(:postback)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # The card for presenting a carousel of options to select from.
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelect
        include Google::Apis::Core::Hashable
      
        # Required. Carousel items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # An item in the carousel.
      class GoogleCloudDialogflowV2beta1IntentMessageCarouselSelectItem
        include Google::Apis::Core::Hashable
      
        # Optional. The body text of the card.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # Additional info about the select item for when it is triggered in a
        # dialog.
        # Corresponds to the JSON property `info`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo]
        attr_accessor :info
      
        # Required. Title of the carousel item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @image = args[:image] if args.key?(:image)
          @info = args[:info] if args.key?(:info)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Column properties for TableCard.
      class GoogleCloudDialogflowV2beta1IntentMessageColumnProperties
        include Google::Apis::Core::Hashable
      
        # Required. Column heading.
        # Corresponds to the JSON property `header`
        # @return [String]
        attr_accessor :header
      
        # Optional. Defines text alignment for all cells in this column.
        # Corresponds to the JSON property `horizontalAlignment`
        # @return [String]
        attr_accessor :horizontal_alignment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @header = args[:header] if args.key?(:header)
          @horizontal_alignment = args[:horizontal_alignment] if args.key?(:horizontal_alignment)
        end
      end
      
      # The image response message.
      class GoogleCloudDialogflowV2beta1IntentMessageImage
        include Google::Apis::Core::Hashable
      
        # A text description of the image to be used for accessibility,
        # e.g., screen readers. Required if image_uri is set for CarouselSelect.
        # Corresponds to the JSON property `accessibilityText`
        # @return [String]
        attr_accessor :accessibility_text
      
        # Optional. The public URI to an image file.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accessibility_text = args[:accessibility_text] if args.key?(:accessibility_text)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # The suggestion chip message that allows the user to jump out to the app
      # or website associated with this agent.
      class GoogleCloudDialogflowV2beta1IntentMessageLinkOutSuggestion
        include Google::Apis::Core::Hashable
      
        # Required. The name of the app or site this chip is linking to.
        # Corresponds to the JSON property `destinationName`
        # @return [String]
        attr_accessor :destination_name
      
        # Required. The URI of the app or site to open when the user taps the
        # suggestion chip.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination_name = args[:destination_name] if args.key?(:destination_name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The card for presenting a list of options to select from.
      class GoogleCloudDialogflowV2beta1IntentMessageListSelect
        include Google::Apis::Core::Hashable
      
        # Required. List items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageListSelectItem>]
        attr_accessor :items
      
        # Optional. Subtitle of the list.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Optional. The overall title of the list.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # An item in the list.
      class GoogleCloudDialogflowV2beta1IntentMessageListSelectItem
        include Google::Apis::Core::Hashable
      
        # Optional. The main text describing the item.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # Additional info about the select item for when it is triggered in a
        # dialog.
        # Corresponds to the JSON property `info`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo]
        attr_accessor :info
      
        # Required. The title of the list item.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @image = args[:image] if args.key?(:image)
          @info = args[:info] if args.key?(:info)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The media content card for Actions on Google.
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContent
        include Google::Apis::Core::Hashable
      
        # Required. List of media objects.
        # Corresponds to the JSON property `mediaObjects`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject>]
        attr_accessor :media_objects
      
        # Optional. What type of media is the content (ie "audio").
        # Corresponds to the JSON property `mediaType`
        # @return [String]
        attr_accessor :media_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_objects = args[:media_objects] if args.key?(:media_objects)
          @media_type = args[:media_type] if args.key?(:media_type)
        end
      end
      
      # Response media object for media content card.
      class GoogleCloudDialogflowV2beta1IntentMessageMediaContentResponseMediaObject
        include Google::Apis::Core::Hashable
      
        # Required. Url where the media is stored.
        # Corresponds to the JSON property `contentUrl`
        # @return [String]
        attr_accessor :content_url
      
        # Optional. Description of media card.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The image response message.
        # Corresponds to the JSON property `icon`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :icon
      
        # The image response message.
        # Corresponds to the JSON property `largeImage`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :large_image
      
        # Required. Name of media card.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_url = args[:content_url] if args.key?(:content_url)
          @description = args[:description] if args.key?(:description)
          @icon = args[:icon] if args.key?(:icon)
          @large_image = args[:large_image] if args.key?(:large_image)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The quick replies response message.
      class GoogleCloudDialogflowV2beta1IntentMessageQuickReplies
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of quick replies.
        # Corresponds to the JSON property `quickReplies`
        # @return [Array<String>]
        attr_accessor :quick_replies
      
        # Optional. The title of the collection of quick replies.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quick_replies = args[:quick_replies] if args.key?(:quick_replies)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Rich Business Messaging (RBM) Card content
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent
        include Google::Apis::Core::Hashable
      
        # Optional. Description of the card (at most 2000 bytes).
        # At least one of the title, description or media must be set.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Rich Business Messaging (RBM) Media displayed in Cards
        # The following media-types are currently supported:
        # ## Image Types
        # image/jpeg
        # image/jpg'
        # image/gif
        # image/png
        # ## Video Types
        # video/h263
        # video/m4v
        # video/mp4
        # video/mpeg
        # video/mpeg4
        # video/webm
        # Corresponds to the JSON property `media`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia]
        attr_accessor :media
      
        # Optional. List of suggestions to include in the card.
        # Corresponds to the JSON property `suggestions`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion>]
        attr_accessor :suggestions
      
        # Optional. Title of the card (at most 200 bytes).
        # At least one of the title, description or media must be set.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @media = args[:media] if args.key?(:media)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Rich Business Messaging (RBM) Media displayed in Cards
      # The following media-types are currently supported:
      # ## Image Types
      # image/jpeg
      # image/jpg'
      # image/gif
      # image/png
      # ## Video Types
      # video/h263
      # video/m4v
      # video/mp4
      # video/mpeg
      # video/mpeg4
      # video/webm
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCardContentRbmMedia
        include Google::Apis::Core::Hashable
      
        # Required. Publicly reachable URI of the file. The RBM platform
        # determines the MIME type of the file from the content-type field in
        # the HTTP headers when the platform fetches the file. The content-type
        # field must be present and accurate in the HTTP response from the URL.
        # Corresponds to the JSON property `fileUri`
        # @return [String]
        attr_accessor :file_uri
      
        # Required for cards with vertical orientation. The height of the media
        # within a rich card with a vertical layout. (https://goo.gl/NeFCjz).
        # For a standalone card with horizontal layout, height is not
        # customizable, and this field is ignored.
        # Corresponds to the JSON property `height`
        # @return [String]
        attr_accessor :height
      
        # Optional. Publicly reachable URI of the thumbnail.If you don't
        # provide a thumbnail URI, the RBM platform displays a blank
        # placeholder thumbnail until the user's device downloads the file.
        # Depending on the user's setting, the file may not download
        # automatically and may require the user to tap a download button.
        # Corresponds to the JSON property `thumbnailUri`
        # @return [String]
        attr_accessor :thumbnail_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_uri = args[:file_uri] if args.key?(:file_uri)
          @height = args[:height] if args.key?(:height)
          @thumbnail_uri = args[:thumbnail_uri] if args.key?(:thumbnail_uri)
        end
      end
      
      # Carousel Rich Business Messaging (RBM) rich card.
      # Rich cards allow you to respond to users with more vivid content, e.g.
      # with media and suggestions.
      # For more details about RBM rich cards, please see:
      # https://developers.google.com/rcs-business-messaging/rbm/guides/build/send-
      # messages#rich-cards.
      # If you want to show a single card with more control over the layout,
      # please use RbmStandaloneCard instead.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmCarouselCard
        include Google::Apis::Core::Hashable
      
        # Required. The cards in the carousel. A carousel must have at least
        # 2 cards and at most 10.
        # Corresponds to the JSON property `cardContents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent>]
        attr_accessor :card_contents
      
        # Required. The width of the cards in the carousel.
        # Corresponds to the JSON property `cardWidth`
        # @return [String]
        attr_accessor :card_width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @card_contents = args[:card_contents] if args.key?(:card_contents)
          @card_width = args[:card_width] if args.key?(:card_width)
        end
      end
      
      # Standalone Rich Business Messaging (RBM) rich card.
      # Rich cards allow you to respond to users with more vivid content, e.g.
      # with media and suggestions.
      # For more details about RBM rich cards, please see:
      # https://developers.google.com/rcs-business-messaging/rbm/guides/build/send-
      # messages#rich-cards.
      # You can group multiple rich cards into one using RbmCarouselCard but
      # carousel cards will give you less control over the card layout.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmStandaloneCard
        include Google::Apis::Core::Hashable
      
        # Rich Business Messaging (RBM) Card content
        # Corresponds to the JSON property `cardContent`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmCardContent]
        attr_accessor :card_content
      
        # Required. Orientation of the card.
        # Corresponds to the JSON property `cardOrientation`
        # @return [String]
        attr_accessor :card_orientation
      
        # Required if orientation is horizontal.
        # Image preview alignment for standalone cards with horizontal layout.
        # Corresponds to the JSON property `thumbnailImageAlignment`
        # @return [String]
        attr_accessor :thumbnail_image_alignment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @card_content = args[:card_content] if args.key?(:card_content)
          @card_orientation = args[:card_orientation] if args.key?(:card_orientation)
          @thumbnail_image_alignment = args[:thumbnail_image_alignment] if args.key?(:thumbnail_image_alignment)
        end
      end
      
      # Rich Business Messaging (RBM) suggested client-side action that the user
      # can choose from the card.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction
        include Google::Apis::Core::Hashable
      
        # Opens the user's default dialer app with the specified phone number
        # but does not dial automatically (https://goo.gl/ergbB2).
        # Corresponds to the JSON property `dial`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial]
        attr_accessor :dial
      
        # Opens the user's default web browser app to the specified uri
        # (https://goo.gl/6GLJD2). If the user has an app installed that is
        # registered as the default handler for the URL, then this app will be
        # opened instead, and its icon will be used in the suggested action UI.
        # Corresponds to the JSON property `openUrl`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri]
        attr_accessor :open_url
      
        # Opaque payload that the Dialogflow receives in a user event
        # when the user taps the suggested action. This data will be also
        # forwarded to webhook to allow performing custom business logic.
        # Corresponds to the JSON property `postbackData`
        # @return [String]
        attr_accessor :postback_data
      
        # Opens the device's location chooser so the user can pick a location
        # to send back to the agent (https://goo.gl/GXotJW).
        # Corresponds to the JSON property `shareLocation`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation]
        attr_accessor :share_location
      
        # Text to display alongside the action.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dial = args[:dial] if args.key?(:dial)
          @open_url = args[:open_url] if args.key?(:open_url)
          @postback_data = args[:postback_data] if args.key?(:postback_data)
          @share_location = args[:share_location] if args.key?(:share_location)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Opens the user's default dialer app with the specified phone number
      # but does not dial automatically (https://goo.gl/ergbB2).
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionDial
        include Google::Apis::Core::Hashable
      
        # Required. The phone number to fill in the default dialer app.
        # This field should be in [E.164](https://en.wikipedia.org/wiki/E.164)
        # format. An example of a correctly formatted phone number:
        # +15556767888.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
        end
      end
      
      # Opens the user's default web browser app to the specified uri
      # (https://goo.gl/6GLJD2). If the user has an app installed that is
      # registered as the default handler for the URL, then this app will be
      # opened instead, and its icon will be used in the suggested action UI.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionOpenUri
        include Google::Apis::Core::Hashable
      
        # Required. The uri to open on the user device
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Opens the device's location chooser so the user can pick a location
      # to send back to the agent (https://goo.gl/GXotJW).
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedActionRbmSuggestedActionShareLocation
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Rich Business Messaging (RBM) suggested reply that the user can click
      # instead of typing in their own response.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply
        include Google::Apis::Core::Hashable
      
        # Opaque payload that the Dialogflow receives in a user event
        # when the user taps the suggested reply. This data will be also
        # forwarded to webhook to allow performing custom business logic.
        # Corresponds to the JSON property `postbackData`
        # @return [String]
        attr_accessor :postback_data
      
        # Suggested reply text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @postback_data = args[:postback_data] if args.key?(:postback_data)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Rich Business Messaging (RBM) suggestion. Suggestions allow user to
      # easily select/click a predefined response or perform an action (like
      # opening a web uri).
      class GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion
        include Google::Apis::Core::Hashable
      
        # Rich Business Messaging (RBM) suggested client-side action that the user
        # can choose from the card.
        # Corresponds to the JSON property `action`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedAction]
        attr_accessor :action
      
        # Rich Business Messaging (RBM) suggested reply that the user can click
        # instead of typing in their own response.
        # Corresponds to the JSON property `reply`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestedReply]
        attr_accessor :reply
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @reply = args[:reply] if args.key?(:reply)
        end
      end
      
      # Rich Business Messaging (RBM) text response with suggestions.
      class GoogleCloudDialogflowV2beta1IntentMessageRbmText
        include Google::Apis::Core::Hashable
      
        # Optional. One or more suggestions to show to the user.
        # Corresponds to the JSON property `rbmSuggestion`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageRbmSuggestion>]
        attr_accessor :rbm_suggestion
      
        # Required. Text sent and displayed to the user.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rbm_suggestion = args[:rbm_suggestion] if args.key?(:rbm_suggestion)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Additional info about the select item for when it is triggered in a
      # dialog.
      class GoogleCloudDialogflowV2beta1IntentMessageSelectItemInfo
        include Google::Apis::Core::Hashable
      
        # Required. A unique key that will be sent back to the agent if this
        # response is given.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Optional. A list of synonyms that can also be used to trigger this
        # item in dialog.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
        end
      end
      
      # The simple response message containing speech or text.
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse
        include Google::Apis::Core::Hashable
      
        # Optional. The text to display.
        # Corresponds to the JSON property `displayText`
        # @return [String]
        attr_accessor :display_text
      
        # One of text_to_speech or ssml must be provided. Structured spoken
        # response to the user in the SSML format. Mutually exclusive with
        # text_to_speech.
        # Corresponds to the JSON property `ssml`
        # @return [String]
        attr_accessor :ssml
      
        # One of text_to_speech or ssml must be provided. The plain text of the
        # speech output. Mutually exclusive with ssml.
        # Corresponds to the JSON property `textToSpeech`
        # @return [String]
        attr_accessor :text_to_speech
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_text = args[:display_text] if args.key?(:display_text)
          @ssml = args[:ssml] if args.key?(:ssml)
          @text_to_speech = args[:text_to_speech] if args.key?(:text_to_speech)
        end
      end
      
      # The collection of simple response candidates.
      # This message in `QueryResult.fulfillment_messages` and
      # `WebhookResponse.fulfillment_messages` should contain only one
      # `SimpleResponse`.
      class GoogleCloudDialogflowV2beta1IntentMessageSimpleResponses
        include Google::Apis::Core::Hashable
      
        # Required. The list of simple responses.
        # Corresponds to the JSON property `simpleResponses`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSimpleResponse>]
        attr_accessor :simple_responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @simple_responses = args[:simple_responses] if args.key?(:simple_responses)
        end
      end
      
      # The suggestion chip message that the user can tap to quickly post a reply
      # to the conversation.
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestion
        include Google::Apis::Core::Hashable
      
        # Required. The text shown the in the suggestion chip.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The collection of suggestions.
      class GoogleCloudDialogflowV2beta1IntentMessageSuggestions
        include Google::Apis::Core::Hashable
      
        # Required. The list of suggested replies.
        # Corresponds to the JSON property `suggestions`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageSuggestion>]
        attr_accessor :suggestions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
        end
      end
      
      # Table card for Actions on Google.
      class GoogleCloudDialogflowV2beta1IntentMessageTableCard
        include Google::Apis::Core::Hashable
      
        # Optional. List of buttons for the card.
        # Corresponds to the JSON property `buttons`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageBasicCardButton>]
        attr_accessor :buttons
      
        # Optional. Display properties for the columns in this table.
        # Corresponds to the JSON property `columnProperties`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageColumnProperties>]
        attr_accessor :column_properties
      
        # The image response message.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageImage]
        attr_accessor :image
      
        # Optional. Rows in this table of data.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTableCardRow>]
        attr_accessor :rows
      
        # Optional. Subtitle to the title.
        # Corresponds to the JSON property `subtitle`
        # @return [String]
        attr_accessor :subtitle
      
        # Required. Title of the card.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buttons = args[:buttons] if args.key?(:buttons)
          @column_properties = args[:column_properties] if args.key?(:column_properties)
          @image = args[:image] if args.key?(:image)
          @rows = args[:rows] if args.key?(:rows)
          @subtitle = args[:subtitle] if args.key?(:subtitle)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Cell of TableCardRow.
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardCell
        include Google::Apis::Core::Hashable
      
        # Required. Text in this cell.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Row of TableCard.
      class GoogleCloudDialogflowV2beta1IntentMessageTableCardRow
        include Google::Apis::Core::Hashable
      
        # Optional. List of cells that make up this row.
        # Corresponds to the JSON property `cells`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessageTableCardCell>]
        attr_accessor :cells
      
        # Optional. Whether to add a visual divider after this row.
        # Corresponds to the JSON property `dividerAfter`
        # @return [Boolean]
        attr_accessor :divider_after
        alias_method :divider_after?, :divider_after
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cells = args[:cells] if args.key?(:cells)
          @divider_after = args[:divider_after] if args.key?(:divider_after)
        end
      end
      
      # Plays audio from a file in Telephony Gateway.
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyPlayAudio
        include Google::Apis::Core::Hashable
      
        # Required. URI to a Google Cloud Storage object containing the audio to
        # play, e.g., "gs://bucket/object". The object must contain a single
        # channel (mono) of linear PCM audio (2 bytes / sample) at 8kHz.
        # This object must be readable by the `service-<Project
        # Number>@gcp-sa-dialogflow.iam.gserviceaccount.com` service account
        # where <Project Number> is the number of the Telephony Gateway project
        # (usually the same as the Dialogflow agent project). If the Google Cloud
        # Storage bucket is in the Telephony Gateway project, this permission is
        # added by default when enabling the Dialogflow V2 API.
        # For audio from other sources, consider using the
        # `TelephonySynthesizeSpeech` message with SSML.
        # Corresponds to the JSON property `audioUri`
        # @return [String]
        attr_accessor :audio_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_uri = args[:audio_uri] if args.key?(:audio_uri)
        end
      end
      
      # Synthesizes speech and plays back the synthesized audio to the caller in
      # Telephony Gateway.
      # Telephony Gateway takes the synthesizer settings from
      # `DetectIntentResponse.output_audio_config` which can either be set
      # at request-level or can come from the agent-level synthesizer config.
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonySynthesizeSpeech
        include Google::Apis::Core::Hashable
      
        # The SSML to be synthesized. For more information, see
        # [SSML](https://developers.google.com/actions/reference/ssml).
        # Corresponds to the JSON property `ssml`
        # @return [String]
        attr_accessor :ssml
      
        # The raw text to be synthesized.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ssml = args[:ssml] if args.key?(:ssml)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Transfers the call in Telephony Gateway.
      class GoogleCloudDialogflowV2beta1IntentMessageTelephonyTransferCall
        include Google::Apis::Core::Hashable
      
        # Required. The phone number to transfer the call to
        # in [E.164 format](https://en.wikipedia.org/wiki/E.164).
        # We currently only allow transferring to US numbers (+1xxxyyyzzzz).
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
        end
      end
      
      # The text response message.
      class GoogleCloudDialogflowV2beta1IntentMessageText
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of the agent's responses.
        # Corresponds to the JSON property `text`
        # @return [Array<String>]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Represents intent parameters.
      class GoogleCloudDialogflowV2beta1IntentParameter
        include Google::Apis::Core::Hashable
      
        # Optional. The default value to use when the `value` yields an empty
        # result.
        # Default values can be extracted from contexts by using the following
        # syntax: `#context_name.parameter_name`.
        # Corresponds to the JSON property `defaultValue`
        # @return [String]
        attr_accessor :default_value
      
        # Required. The name of the parameter.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. The name of the entity type, prefixed with `@`, that
        # describes values of the parameter. If the parameter is
        # required, this must be provided.
        # Corresponds to the JSON property `entityTypeDisplayName`
        # @return [String]
        attr_accessor :entity_type_display_name
      
        # Optional. Indicates whether the parameter represents a list of values.
        # Corresponds to the JSON property `isList`
        # @return [Boolean]
        attr_accessor :is_list
        alias_method :is_list?, :is_list
      
        # Optional. Indicates whether the parameter is required. That is,
        # whether the intent cannot be completed without collecting the parameter
        # value.
        # Corresponds to the JSON property `mandatory`
        # @return [Boolean]
        attr_accessor :mandatory
        alias_method :mandatory?, :mandatory
      
        # The unique identifier of this parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The collection of prompts that the agent can present to the
        # user in order to collect a value for the parameter.
        # Corresponds to the JSON property `prompts`
        # @return [Array<String>]
        attr_accessor :prompts
      
        # Optional. The definition of the parameter value. It can be:
        # - a constant string,
        # - a parameter value defined as `$parameter_name`,
        # - an original parameter value defined as `$parameter_name.original`,
        # - a parameter value from some context defined as
        # `#context_name.parameter_name`.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_value = args[:default_value] if args.key?(:default_value)
          @display_name = args[:display_name] if args.key?(:display_name)
          @entity_type_display_name = args[:entity_type_display_name] if args.key?(:entity_type_display_name)
          @is_list = args[:is_list] if args.key?(:is_list)
          @mandatory = args[:mandatory] if args.key?(:mandatory)
          @name = args[:name] if args.key?(:name)
          @prompts = args[:prompts] if args.key?(:prompts)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents an example that the agent is trained on.
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrase
        include Google::Apis::Core::Hashable
      
        # Output only. The unique identifier of this training phrase.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The ordered list of training phrase parts.
        # The parts are concatenated in order to form the training phrase.
        # Note: The API does not automatically annotate training phrases like the
        # Dialogflow Console does.
        # Note: Do not forget to include whitespace at part boundaries,
        # so the training phrase is well formatted when the parts are concatenated.
        # If the training phrase does not need to be annotated with parameters,
        # you just need a single part with only the Part.text field set.
        # If you want to annotate the training phrase, you must create multiple
        # parts, where the fields of each part are populated in one of two ways:
        # -   `Part.text` is set to a part of the phrase that has no parameters.
        # -   `Part.text` is set to a part of the phrase that you want to annotate,
        # and the `entity_type`, `alias`, and `user_defined` fields are all
        # set.
        # Corresponds to the JSON property `parts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart>]
        attr_accessor :parts
      
        # Optional. Indicates how many times this example was added to
        # the intent. Each time a developer adds an existing sample by editing an
        # intent or training, this counter is increased.
        # Corresponds to the JSON property `timesAddedCount`
        # @return [Fixnum]
        attr_accessor :times_added_count
      
        # Required. The type of the training phrase.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @parts = args[:parts] if args.key?(:parts)
          @times_added_count = args[:times_added_count] if args.key?(:times_added_count)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a part of a training phrase.
      class GoogleCloudDialogflowV2beta1IntentTrainingPhrasePart
        include Google::Apis::Core::Hashable
      
        # Optional. The parameter name for the value extracted from the
        # annotated part of the example.
        # This field is required for annotated parts of the training phrase.
        # Corresponds to the JSON property `alias`
        # @return [String]
        attr_accessor :alias
      
        # Optional. The entity type name prefixed with `@`.
        # This field is required for annotated parts of the training phrase.
        # Corresponds to the JSON property `entityType`
        # @return [String]
        attr_accessor :entity_type
      
        # Required. The text for this part.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        # Optional. Indicates whether the text was manually annotated.
        # This field is set to true when the Dialogflow Console is used to
        # manually annotate the part. When creating an annotated part with the
        # API, you must set this to true.
        # Corresponds to the JSON property `userDefined`
        # @return [Boolean]
        attr_accessor :user_defined
        alias_method :user_defined?, :user_defined
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias = args[:alias] if args.key?(:alias)
          @entity_type = args[:entity_type] if args.key?(:entity_type)
          @text = args[:text] if args.key?(:text)
          @user_defined = args[:user_defined] if args.key?(:user_defined)
        end
      end
      
      # Represents the result of querying a Knowledge base.
      class GoogleCloudDialogflowV2beta1KnowledgeAnswers
        include Google::Apis::Core::Hashable
      
        # A list of answers from Knowledge Connector.
        # Corresponds to the JSON property `answers`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer>]
        attr_accessor :answers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answers = args[:answers] if args.key?(:answers)
        end
      end
      
      # An answer from Knowledge Connector.
      class GoogleCloudDialogflowV2beta1KnowledgeAnswersAnswer
        include Google::Apis::Core::Hashable
      
        # The piece of text from the `source` knowledge base document that answers
        # this conversational query.
        # Corresponds to the JSON property `answer`
        # @return [String]
        attr_accessor :answer
      
        # The corresponding FAQ question if the answer was extracted from a FAQ
        # Document, empty otherwise.
        # Corresponds to the JSON property `faqQuestion`
        # @return [String]
        attr_accessor :faq_question
      
        # The system's confidence score that this Knowledge answer is a good match
        # for this conversational query.
        # The range is from 0.0 (completely uncertain) to 1.0 (completely certain).
        # Note: The confidence score is likely to vary somewhat (possibly even for
        # identical requests), as the underlying model is under constant
        # improvement. It may be deprecated in the future. We recommend using
        # `match_confidence_level` which should be generally more stable.
        # Corresponds to the JSON property `matchConfidence`
        # @return [Float]
        attr_accessor :match_confidence
      
        # The system's confidence level that this knowledge answer is a good match
        # for this conversational query.
        # NOTE: The confidence level for a given `<query, answer>` pair may change
        # without notice, as it depends on models that are constantly being
        # improved. However, it will change less frequently than the confidence
        # score below, and should be preferred for referencing the quality of an
        # answer.
        # Corresponds to the JSON property `matchConfidenceLevel`
        # @return [String]
        attr_accessor :match_confidence_level
      
        # Indicates which Knowledge Document this answer was extracted from.
        # Format: `projects/<Project ID>/knowledgeBases/<Knowledge Base
        # ID>/documents/<Document ID>`.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer = args[:answer] if args.key?(:answer)
          @faq_question = args[:faq_question] if args.key?(:faq_question)
          @match_confidence = args[:match_confidence] if args.key?(:match_confidence)
          @match_confidence_level = args[:match_confidence_level] if args.key?(:match_confidence_level)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Represents knowledge base resource.
      # Note: The `projects.agent.knowledgeBases` resource is deprecated;
      # only use `projects.knowledgeBases`.
      class GoogleCloudDialogflowV2beta1KnowledgeBase
        include Google::Apis::Core::Hashable
      
        # Required. The display name of the knowledge base. The name must be 1024
        # bytes or less; otherwise, the creation request fails.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Language which represents the KnowledgeBase. When the KnowledgeBase is
        # created/updated, this is populated for all non en-us languages. If not
        # populated, the default language en-us applies.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # The knowledge base resource name.
        # The name must be empty when creating a knowledge base.
        # Format: `projects/<Project ID>/knowledgeBases/<Knowledge Base ID>`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @language_code = args[:language_code] if args.key?(:language_code)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata in google::longrunning::Operation for Knowledge operations.
      class GoogleCloudDialogflowV2beta1KnowledgeOperationMetadata
        include Google::Apis::Core::Hashable
      
        # Required. The current state of this operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The response for
      # ConversationDatasets.LabelConversation
      class GoogleCloudDialogflowV2beta1LabelConversationResponse
        include Google::Apis::Core::Hashable
      
        # Represents an annotated conversation dataset.
        # ConversationDataset can have multiple AnnotatedConversationDataset, each of
        # them represents one result from one annotation task.
        # AnnotatedConversationDataset can only be generated from annotation task,
        # which will be triggered by LabelConversation.
        # Corresponds to the JSON property `annotatedConversationDataset`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1AnnotatedConversationDataset]
        attr_accessor :annotated_conversation_dataset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotated_conversation_dataset = args[:annotated_conversation_dataset] if args.key?(:annotated_conversation_dataset)
        end
      end
      
      # The response message for Contexts.ListContexts.
      class GoogleCloudDialogflowV2beta1ListContextsResponse
        include Google::Apis::Core::Hashable
      
        # The list of contexts. There will be a maximum number of items
        # returned based on the page_size field in the request.
        # Corresponds to the JSON property `contexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Context>]
        attr_accessor :contexts
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contexts = args[:contexts] if args.key?(:contexts)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for Documents.ListDocuments.
      class GoogleCloudDialogflowV2beta1ListDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The list of documents.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Document>]
        attr_accessor :documents
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for EntityTypes.ListEntityTypes.
      class GoogleCloudDialogflowV2beta1ListEntityTypesResponse
        include Google::Apis::Core::Hashable
      
        # The list of agent entity types. There will be a maximum number of items
        # returned based on the page_size field in the request.
        # Corresponds to the JSON property `entityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityType>]
        attr_accessor :entity_types
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_types = args[:entity_types] if args.key?(:entity_types)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Intents.ListIntents.
      class GoogleCloudDialogflowV2beta1ListIntentsResponse
        include Google::Apis::Core::Hashable
      
        # The list of agent intents. There will be a maximum number of items
        # returned based on the page_size field in the request.
        # Corresponds to the JSON property `intents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Intent>]
        attr_accessor :intents
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @intents = args[:intents] if args.key?(:intents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for KnowledgeBases.ListKnowledgeBases.
      class GoogleCloudDialogflowV2beta1ListKnowledgeBasesResponse
        include Google::Apis::Core::Hashable
      
        # The list of knowledge bases.
        # Corresponds to the JSON property `knowledgeBases`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1KnowledgeBase>]
        attr_accessor :knowledge_bases
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @knowledge_bases = args[:knowledge_bases] if args.key?(:knowledge_bases)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for SessionEntityTypes.ListSessionEntityTypes.
      class GoogleCloudDialogflowV2beta1ListSessionEntityTypesResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of session entity types. There will be a maximum number of items
        # returned based on the page_size field in the request.
        # Corresponds to the JSON property `sessionEntityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SessionEntityType>]
        attr_accessor :session_entity_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @session_entity_types = args[:session_entity_types] if args.key?(:session_entity_types)
        end
      end
      
      # Represents the contents of the original request that was passed to
      # the `[Streaming]DetectIntent` call.
      class GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. This field is set to the value of the `QueryParameters.payload`
        # field passed in the request. Some integrations that query a Dialogflow
        # agent may provide additional information in the payload.
        # In particular for the Telephony Gateway this field has the form:
        # <pre>`
        # "telephony": `
        # "caller_id": "+18558363987"
        # `
        # `</pre>
        # Note: The caller ID field (`caller_id`) will be redacted for Standard
        # Edition agents and populated with the caller ID in [E.164
        # format](https://en.wikipedia.org/wiki/E.164) for Enterprise Edition agents.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # The source of this request, e.g., `google`, `facebook`, `slack`. It is set
        # by Dialogflow-owned servers.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Optional. The version of the protocol used for this request.
        # This field is AoG-specific.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload = args[:payload] if args.key?(:payload)
          @source = args[:source] if args.key?(:source)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Instructs the speech synthesizer how to generate the output audio content.
      class GoogleCloudDialogflowV2beta1OutputAudioConfig
        include Google::Apis::Core::Hashable
      
        # Required. Audio encoding of the synthesized audio content.
        # Corresponds to the JSON property `audioEncoding`
        # @return [String]
        attr_accessor :audio_encoding
      
        # Optional. The synthesis sample rate (in hertz) for this audio. If not
        # provided, then the synthesizer will use the default sample rate based on
        # the audio encoding. If this is different from the voice's natural sample
        # rate, then the synthesizer will honor this request by converting to the
        # desired sample rate (which might result in worse audio quality).
        # Corresponds to the JSON property `sampleRateHertz`
        # @return [Fixnum]
        attr_accessor :sample_rate_hertz
      
        # Configuration of how speech should be synthesized.
        # Corresponds to the JSON property `synthesizeSpeechConfig`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SynthesizeSpeechConfig]
        attr_accessor :synthesize_speech_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_encoding = args[:audio_encoding] if args.key?(:audio_encoding)
          @sample_rate_hertz = args[:sample_rate_hertz] if args.key?(:sample_rate_hertz)
          @synthesize_speech_config = args[:synthesize_speech_config] if args.key?(:synthesize_speech_config)
        end
      end
      
      # Represents the query input. It can contain either:
      # 1.  An audio config which
      # instructs the speech recognizer how to process the speech audio.
      # 2.  A conversational query in the form of text.
      # 3.  An event that specifies which intent to trigger.
      class GoogleCloudDialogflowV2beta1QueryInput
        include Google::Apis::Core::Hashable
      
        # Instructs the speech recognizer on how to process the audio content.
        # Corresponds to the JSON property `audioConfig`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1InputAudioConfig]
        attr_accessor :audio_config
      
        # Events allow for matching intents by event name instead of the natural
        # language input. For instance, input `<event: ` name: "welcome_event",
        # parameters: ` name: "Sam" ` `>` can trigger a personalized welcome response.
        # The parameter `name` may be used by the agent in the response:
        # `"Hello #welcome_event.name! What can I do for you today?"`.
        # Corresponds to the JSON property `event`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EventInput]
        attr_accessor :event
      
        # Represents the natural language text to be processed.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1TextInput]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_config = args[:audio_config] if args.key?(:audio_config)
          @event = args[:event] if args.key?(:event)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Represents the parameters of the conversational query.
      class GoogleCloudDialogflowV2beta1QueryParameters
        include Google::Apis::Core::Hashable
      
        # Optional. The collection of contexts to be activated before this query is
        # executed.
        # Corresponds to the JSON property `contexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Context>]
        attr_accessor :contexts
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `geoLocation`
        # @return [Google::Apis::DialogflowV2beta1::GoogleTypeLatLng]
        attr_accessor :geo_location
      
        # Optional. KnowledgeBases to get alternative results from. If not set, the
        # KnowledgeBases enabled in the agent (through UI) will be used.
        # Format:  `projects/<Project ID>/knowledgeBases/<Knowledge Base ID>`.
        # Corresponds to the JSON property `knowledgeBaseNames`
        # @return [Array<String>]
        attr_accessor :knowledge_base_names
      
        # Optional. This field can be used to pass custom data into the webhook
        # associated with the agent. Arbitrary JSON objects are supported.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # Optional. Specifies whether to delete all contexts in the current session
        # before the new ones are activated.
        # Corresponds to the JSON property `resetContexts`
        # @return [Boolean]
        attr_accessor :reset_contexts
        alias_method :reset_contexts?, :reset_contexts
      
        # Configures the types of sentiment analysis to perform.
        # Corresponds to the JSON property `sentimentAnalysisRequestConfig`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SentimentAnalysisRequestConfig]
        attr_accessor :sentiment_analysis_request_config
      
        # Optional. Additional session entity types to replace or extend developer
        # entity types with. The entity synonyms apply to all languages and persist
        # for the session of this query.
        # Corresponds to the JSON property `sessionEntityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SessionEntityType>]
        attr_accessor :session_entity_types
      
        # Optional. The time zone of this conversational query from the
        # [time zone database](https://www.iana.org/time-zones), e.g.,
        # America/New_York, Europe/Paris. If not provided, the time zone specified in
        # agent settings is used.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contexts = args[:contexts] if args.key?(:contexts)
          @geo_location = args[:geo_location] if args.key?(:geo_location)
          @knowledge_base_names = args[:knowledge_base_names] if args.key?(:knowledge_base_names)
          @payload = args[:payload] if args.key?(:payload)
          @reset_contexts = args[:reset_contexts] if args.key?(:reset_contexts)
          @sentiment_analysis_request_config = args[:sentiment_analysis_request_config] if args.key?(:sentiment_analysis_request_config)
          @session_entity_types = args[:session_entity_types] if args.key?(:session_entity_types)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Represents the result of conversational query or event processing.
      class GoogleCloudDialogflowV2beta1QueryResult
        include Google::Apis::Core::Hashable
      
        # The action name from the matched intent.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # This field is set to:
        # - `false` if the matched intent has required parameters and not all of
        # the required parameter values have been collected.
        # - `true` if all required parameter values have been collected, or if the
        # matched intent doesn't contain any required parameters.
        # Corresponds to the JSON property `allRequiredParamsPresent`
        # @return [Boolean]
        attr_accessor :all_required_params_present
        alias_method :all_required_params_present?, :all_required_params_present
      
        # The free-form diagnostic info. For example, this field could contain
        # webhook call latency. The string keys of the Struct's fields map can change
        # without notice.
        # Corresponds to the JSON property `diagnosticInfo`
        # @return [Hash<String,Object>]
        attr_accessor :diagnostic_info
      
        # The collection of rich messages to present to the user.
        # Corresponds to the JSON property `fulfillmentMessages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessage>]
        attr_accessor :fulfillment_messages
      
        # The text to be pronounced to the user or shown on the screen.
        # Note: This is a legacy field, `fulfillment_messages` should be preferred.
        # Corresponds to the JSON property `fulfillmentText`
        # @return [String]
        attr_accessor :fulfillment_text
      
        # Represents an intent.
        # Intents convert a number of user expressions or patterns into an action. An
        # action is an extraction of a user command or sentence semantics.
        # Corresponds to the JSON property `intent`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Intent]
        attr_accessor :intent
      
        # The intent detection confidence. Values range from 0.0
        # (completely uncertain) to 1.0 (completely certain).
        # This value is for informational purpose only and is only used to
        # help match the best intent within the classification threshold.
        # This value may change for the same end-user expression at any time due to a
        # model retraining or change in implementation.
        # If there are `multiple knowledge_answers` messages, this value is set to
        # the greatest `knowledgeAnswers.match_confidence` value in the list.
        # Corresponds to the JSON property `intentDetectionConfidence`
        # @return [Float]
        attr_accessor :intent_detection_confidence
      
        # Represents the result of querying a Knowledge base.
        # Corresponds to the JSON property `knowledgeAnswers`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1KnowledgeAnswers]
        attr_accessor :knowledge_answers
      
        # The language that was triggered during intent detection.
        # See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # The collection of output contexts. If applicable,
        # `output_contexts.parameters` contains entries with name
        # `<parameter name>.original` containing the original parameter values
        # before the query.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Context>]
        attr_accessor :output_contexts
      
        # The collection of extracted parameters.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        # The original conversational query text:
        # - If natural language text was provided as input, `query_text` contains
        # a copy of the input.
        # - If natural language speech audio was provided as input, `query_text`
        # contains the speech recognition result. If speech recognizer produced
        # multiple alternatives, a particular one is picked.
        # - If automatic spell correction is enabled, `query_text` will contain the
        # corrected user input.
        # Corresponds to the JSON property `queryText`
        # @return [String]
        attr_accessor :query_text
      
        # The result of sentiment analysis as configured by
        # `sentiment_analysis_request_config`.
        # Corresponds to the JSON property `sentimentAnalysisResult`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SentimentAnalysisResult]
        attr_accessor :sentiment_analysis_result
      
        # The Speech recognition confidence between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. The default of 0.0 is a sentinel value indicating that confidence
        # was not set.
        # This field is not guaranteed to be accurate or set. In particular this
        # field isn't set for StreamingDetectIntent since the streaming endpoint has
        # separate confidence estimates per portion of the audio in
        # StreamingRecognitionResult.
        # Corresponds to the JSON property `speechRecognitionConfidence`
        # @return [Float]
        attr_accessor :speech_recognition_confidence
      
        # If the query was fulfilled by a webhook call, this field is set to the
        # value of the `payload` field returned in the webhook response.
        # Corresponds to the JSON property `webhookPayload`
        # @return [Hash<String,Object>]
        attr_accessor :webhook_payload
      
        # If the query was fulfilled by a webhook call, this field is set to the
        # value of the `source` field returned in the webhook response.
        # Corresponds to the JSON property `webhookSource`
        # @return [String]
        attr_accessor :webhook_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @all_required_params_present = args[:all_required_params_present] if args.key?(:all_required_params_present)
          @diagnostic_info = args[:diagnostic_info] if args.key?(:diagnostic_info)
          @fulfillment_messages = args[:fulfillment_messages] if args.key?(:fulfillment_messages)
          @fulfillment_text = args[:fulfillment_text] if args.key?(:fulfillment_text)
          @intent = args[:intent] if args.key?(:intent)
          @intent_detection_confidence = args[:intent_detection_confidence] if args.key?(:intent_detection_confidence)
          @knowledge_answers = args[:knowledge_answers] if args.key?(:knowledge_answers)
          @language_code = args[:language_code] if args.key?(:language_code)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @parameters = args[:parameters] if args.key?(:parameters)
          @query_text = args[:query_text] if args.key?(:query_text)
          @sentiment_analysis_result = args[:sentiment_analysis_result] if args.key?(:sentiment_analysis_result)
          @speech_recognition_confidence = args[:speech_recognition_confidence] if args.key?(:speech_recognition_confidence)
          @webhook_payload = args[:webhook_payload] if args.key?(:webhook_payload)
          @webhook_source = args[:webhook_source] if args.key?(:webhook_source)
        end
      end
      
      # Request message for Documents.ReloadDocument.
      class GoogleCloudDialogflowV2beta1ReloadDocumentRequest
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage location for single input.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1GcsSource]
        attr_accessor :gcs_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
        end
      end
      
      # The request message for Agents.RestoreAgent.
      class GoogleCloudDialogflowV2beta1RestoreAgentRequest
        include Google::Apis::Core::Hashable
      
        # Zip compressed raw byte content for agent.
        # Corresponds to the JSON property `agentContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :agent_content
      
        # The URI to a Google Cloud Storage file containing the agent to restore.
        # Note: The URI must start with "gs://".
        # Corresponds to the JSON property `agentUri`
        # @return [String]
        attr_accessor :agent_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_content = args[:agent_content] if args.key?(:agent_content)
          @agent_uri = args[:agent_uri] if args.key?(:agent_uri)
        end
      end
      
      # The response message for Agents.SearchAgents.
      class GoogleCloudDialogflowV2beta1SearchAgentsResponse
        include Google::Apis::Core::Hashable
      
        # The list of agents. There will be a maximum number of items returned based
        # on the page_size field in the request.
        # Corresponds to the JSON property `agents`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Agent>]
        attr_accessor :agents
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agents = args[:agents] if args.key?(:agents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The sentiment, such as positive/negative feeling or association, for a unit
      # of analysis, such as the query text.
      class GoogleCloudDialogflowV2beta1Sentiment
        include Google::Apis::Core::Hashable
      
        # A non-negative number in the [0, +inf) range, which represents the absolute
        # magnitude of sentiment, regardless of score (positive or negative).
        # Corresponds to the JSON property `magnitude`
        # @return [Float]
        attr_accessor :magnitude
      
        # Sentiment score between -1.0 (negative sentiment) and 1.0 (positive
        # sentiment).
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
      
      # Configures the types of sentiment analysis to perform.
      class GoogleCloudDialogflowV2beta1SentimentAnalysisRequestConfig
        include Google::Apis::Core::Hashable
      
        # Optional. Instructs the service to perform sentiment analysis on
        # `query_text`. If not provided, sentiment analysis is not performed on
        # `query_text`.
        # Corresponds to the JSON property `analyzeQueryTextSentiment`
        # @return [Boolean]
        attr_accessor :analyze_query_text_sentiment
        alias_method :analyze_query_text_sentiment?, :analyze_query_text_sentiment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analyze_query_text_sentiment = args[:analyze_query_text_sentiment] if args.key?(:analyze_query_text_sentiment)
        end
      end
      
      # The result of sentiment analysis as configured by
      # `sentiment_analysis_request_config`.
      class GoogleCloudDialogflowV2beta1SentimentAnalysisResult
        include Google::Apis::Core::Hashable
      
        # The sentiment, such as positive/negative feeling or association, for a unit
        # of analysis, such as the query text.
        # Corresponds to the JSON property `queryTextSentiment`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Sentiment]
        attr_accessor :query_text_sentiment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_text_sentiment = args[:query_text_sentiment] if args.key?(:query_text_sentiment)
        end
      end
      
      # Represents a session entity type.
      # Extends or replaces a developer entity type at the user session level (we
      # refer to the entity types defined at the agent level as "developer entity
      # types").
      # Note: session entity types apply to all queries, regardless of the language.
      class GoogleCloudDialogflowV2beta1SessionEntityType
        include Google::Apis::Core::Hashable
      
        # Required. The collection of entities associated with this session entity
        # type.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EntityTypeEntity>]
        attr_accessor :entities
      
        # Required. Indicates whether the additional data should override or
        # supplement the developer entity type definition.
        # Corresponds to the JSON property `entityOverrideMode`
        # @return [String]
        attr_accessor :entity_override_mode
      
        # Required. The unique identifier of this session entity type. Format:
        # `projects/<Project ID>/agent/sessions/<Session ID>/entityTypes/<Entity Type
        # Display Name>`, or
        # `projects/<Project ID>/agent/environments/<Environment ID>/users/<User
        # ID>/sessions/<Session ID>/entityTypes/<Entity Type Display Name>`.
        # If `Environment ID` is not specified, we assume default 'draft'
        # environment. If `User ID` is not specified, we assume default '-' user.
        # `<Entity Type Display Name>` must be the display name of an existing entity
        # type in the same agent that will be overridden or supplemented.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @entity_override_mode = args[:entity_override_mode] if args.key?(:entity_override_mode)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Hints for the speech recognizer to help with recognition in a specific
      # conversation state.
      class GoogleCloudDialogflowV2beta1SpeechContext
        include Google::Apis::Core::Hashable
      
        # Optional. Boost for this context compared to other contexts:
        # * If the boost is positive, Dialogflow will increase the probability that
        # the phrases in this context are recognized over similar sounding phrases.
        # * If the boost is unspecified or non-positive, Dialogflow will not apply
        # any boost.
        # Dialogflow recommends that you use boosts in the range (0, 20] and that you
        # find a value that fits your use case with binary search.
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Optional. A list of strings containing words and phrases that the speech
        # recognizer should recognize with higher likelihood.
        # This list can be used to:
        # * improve accuracy for words and phrases you expect the user to say,
        # e.g. typical commands for your Dialogflow agent
        # * add additional words to the speech recognizer vocabulary
        # * ...
        # See the [Cloud Speech
        # documentation](https://cloud.google.com/speech-to-text/quotas) for usage
        # limits.
        # Corresponds to the JSON property `phrases`
        # @return [Array<String>]
        attr_accessor :phrases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @phrases = args[:phrases] if args.key?(:phrases)
        end
      end
      
      # Configuration of how speech should be synthesized.
      class GoogleCloudDialogflowV2beta1SynthesizeSpeechConfig
        include Google::Apis::Core::Hashable
      
        # Optional. An identifier which selects 'audio effects' profiles that are
        # applied on (post synthesized) text to speech. Effects are applied on top of
        # each other in the order they are given.
        # Corresponds to the JSON property `effectsProfileId`
        # @return [Array<String>]
        attr_accessor :effects_profile_id
      
        # Optional. Speaking pitch, in the range [-20.0, 20.0]. 20 means increase 20
        # semitones from the original pitch. -20 means decrease 20 semitones from the
        # original pitch.
        # Corresponds to the JSON property `pitch`
        # @return [Float]
        attr_accessor :pitch
      
        # Optional. Speaking rate/speed, in the range [0.25, 4.0]. 1.0 is the normal
        # native speed supported by the specific voice. 2.0 is twice as fast, and
        # 0.5 is half as fast. If unset(0.0), defaults to the native 1.0 speed. Any
        # other values < 0.25 or > 4.0 will return an error.
        # Corresponds to the JSON property `speakingRate`
        # @return [Float]
        attr_accessor :speaking_rate
      
        # Description of which voice to use for speech synthesis.
        # Corresponds to the JSON property `voice`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1VoiceSelectionParams]
        attr_accessor :voice
      
        # Optional. Volume gain (in dB) of the normal native volume supported by the
        # specific voice, in the range [-96.0, 16.0]. If unset, or set to a value of
        # 0.0 (dB), will play at normal native signal amplitude. A value of -6.0 (dB)
        # will play at approximately half the amplitude of the normal native signal
        # amplitude. A value of +6.0 (dB) will play at approximately twice the
        # amplitude of the normal native signal amplitude. We strongly recommend not
        # to exceed +10 (dB) as there's usually no effective increase in loudness for
        # any value greater than that.
        # Corresponds to the JSON property `volumeGainDb`
        # @return [Float]
        attr_accessor :volume_gain_db
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @effects_profile_id = args[:effects_profile_id] if args.key?(:effects_profile_id)
          @pitch = args[:pitch] if args.key?(:pitch)
          @speaking_rate = args[:speaking_rate] if args.key?(:speaking_rate)
          @voice = args[:voice] if args.key?(:voice)
          @volume_gain_db = args[:volume_gain_db] if args.key?(:volume_gain_db)
        end
      end
      
      # Represents the natural language text to be processed.
      class GoogleCloudDialogflowV2beta1TextInput
        include Google::Apis::Core::Hashable
      
        # Required. The language of this conversational query. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language)
        # for a list of the currently supported language codes. Note that queries in
        # the same session do not necessarily need to specify the same language.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Required. The UTF-8 encoded natural language text to be processed.
        # Text length must not exceed 256 characters.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # The request message for Agents.TrainAgent.
      class GoogleCloudDialogflowV2beta1TrainAgentRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents a single validation error.
      class GoogleCloudDialogflowV2beta1ValidationError
        include Google::Apis::Core::Hashable
      
        # The names of the entries that the error is associated with.
        # Format:
        # - "projects/<Project ID>/agent", if the error is associated with the entire
        # agent.
        # - "projects/<Project ID>/agent/intents/<Intent ID>", if the error is
        # associated with certain intents.
        # - "projects/<Project
        # ID>/agent/intents/<Intent Id>/trainingPhrases/<Training Phrase ID>", if the
        # error is associated with certain intent training phrases.
        # - "projects/<Project ID>/agent/intents/<Intent Id>/parameters/<Parameter
        # ID>", if the error is associated with certain intent parameters.
        # - "projects/<Project ID>/agent/entities/<Entity ID>", if the error is
        # associated with certain entities.
        # Corresponds to the JSON property `entries`
        # @return [Array<String>]
        attr_accessor :entries
      
        # The detailed error messsage.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # The severity of the error.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
          @error_message = args[:error_message] if args.key?(:error_message)
          @severity = args[:severity] if args.key?(:severity)
        end
      end
      
      # Represents the output of agent validation.
      class GoogleCloudDialogflowV2beta1ValidationResult
        include Google::Apis::Core::Hashable
      
        # Contains all validation errors.
        # Corresponds to the JSON property `validationErrors`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1ValidationError>]
        attr_accessor :validation_errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @validation_errors = args[:validation_errors] if args.key?(:validation_errors)
        end
      end
      
      # Description of which voice to use for speech synthesis.
      class GoogleCloudDialogflowV2beta1VoiceSelectionParams
        include Google::Apis::Core::Hashable
      
        # Optional. The name of the voice. If not set, the service will choose a
        # voice based on the other parameters such as language_code and gender.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The preferred gender of the voice. If not set, the service will
        # choose a voice based on the other parameters such as language_code and
        # name. Note that this is only a preference, not requirement. If a
        # voice of the appropriate gender is not available, the synthesizer should
        # substitute a voice with a different gender rather than failing the request.
        # Corresponds to the JSON property `ssmlGender`
        # @return [String]
        attr_accessor :ssml_gender
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @ssml_gender = args[:ssml_gender] if args.key?(:ssml_gender)
        end
      end
      
      # The request message for a webhook call.
      class GoogleCloudDialogflowV2beta1WebhookRequest
        include Google::Apis::Core::Hashable
      
        # Alternative query results from KnowledgeService.
        # Corresponds to the JSON property `alternativeQueryResults`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryResult>]
        attr_accessor :alternative_query_results
      
        # Represents the contents of the original request that was passed to
        # the `[Streaming]DetectIntent` call.
        # Corresponds to the JSON property `originalDetectIntentRequest`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1OriginalDetectIntentRequest]
        attr_accessor :original_detect_intent_request
      
        # Represents the result of conversational query or event processing.
        # Corresponds to the JSON property `queryResult`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1QueryResult]
        attr_accessor :query_result
      
        # The unique identifier of the response. Contains the same value as
        # `[Streaming]DetectIntentResponse.response_id`.
        # Corresponds to the JSON property `responseId`
        # @return [String]
        attr_accessor :response_id
      
        # The unique identifier of detectIntent request session.
        # Can be used to identify end-user inside webhook implementation.
        # Format: `projects/<Project ID>/agent/sessions/<Session ID>`, or
        # `projects/<Project ID>/agent/environments/<Environment ID>/users/<User
        # ID>/sessions/<Session ID>`.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_query_results = args[:alternative_query_results] if args.key?(:alternative_query_results)
          @original_detect_intent_request = args[:original_detect_intent_request] if args.key?(:original_detect_intent_request)
          @query_result = args[:query_result] if args.key?(:query_result)
          @response_id = args[:response_id] if args.key?(:response_id)
          @session = args[:session] if args.key?(:session)
        end
      end
      
      # The response message for a webhook call.
      class GoogleCloudDialogflowV2beta1WebhookResponse
        include Google::Apis::Core::Hashable
      
        # Optional. Indicates that this intent ends an interaction. Some integrations
        # (e.g., Actions on Google or Dialogflow phone gateway) use this information
        # to close interaction with an end user. Default is false.
        # Corresponds to the JSON property `endInteraction`
        # @return [Boolean]
        attr_accessor :end_interaction
        alias_method :end_interaction?, :end_interaction
      
        # Events allow for matching intents by event name instead of the natural
        # language input. For instance, input `<event: ` name: "welcome_event",
        # parameters: ` name: "Sam" ` `>` can trigger a personalized welcome response.
        # The parameter `name` may be used by the agent in the response:
        # `"Hello #welcome_event.name! What can I do for you today?"`.
        # Corresponds to the JSON property `followupEventInput`
        # @return [Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1EventInput]
        attr_accessor :followup_event_input
      
        # Optional. The collection of rich messages to present to the user. This
        # value is passed directly to `QueryResult.fulfillment_messages`.
        # Corresponds to the JSON property `fulfillmentMessages`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1IntentMessage>]
        attr_accessor :fulfillment_messages
      
        # Optional. The text to be shown on the screen. This value is passed directly
        # to `QueryResult.fulfillment_text`.
        # Corresponds to the JSON property `fulfillmentText`
        # @return [String]
        attr_accessor :fulfillment_text
      
        # Optional. The collection of output contexts. This value is passed directly
        # to `QueryResult.output_contexts`.
        # Corresponds to the JSON property `outputContexts`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1Context>]
        attr_accessor :output_contexts
      
        # Optional. This value is passed directly to `QueryResult.webhook_payload`.
        # See the related `fulfillment_messages[i].payload field`, which may be used
        # as an alternative to this field.
        # This field can be used for Actions on Google responses.
        # It should have a structure similar to the JSON message shown here. For more
        # information, see
        # [Actions on Google Webhook
        # Format](https://developers.google.com/actions/dialogflow/webhook)
        # <pre>`
        # "google": `
        # "expectUserResponse": true,
        # "richResponse": `
        # "items": [
        # `
        # "simpleResponse": `
        # "textToSpeech": "this is a simple response"
        # `
        # `
        # ]
        # `
        # `
        # `</pre>
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        # Optional. Additional session entity types to replace or extend developer
        # entity types with. The entity synonyms apply to all languages and persist
        # for the session of this query. Setting the session entity types inside
        # webhook overwrites the session entity types that have been set through
        # `DetectIntentRequest.query_params.session_entity_types`.
        # Corresponds to the JSON property `sessionEntityTypes`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleCloudDialogflowV2beta1SessionEntityType>]
        attr_accessor :session_entity_types
      
        # Optional. This value is passed directly to `QueryResult.webhook_source`.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_interaction = args[:end_interaction] if args.key?(:end_interaction)
          @followup_event_input = args[:followup_event_input] if args.key?(:followup_event_input)
          @fulfillment_messages = args[:fulfillment_messages] if args.key?(:fulfillment_messages)
          @fulfillment_text = args[:fulfillment_text] if args.key?(:fulfillment_text)
          @output_contexts = args[:output_contexts] if args.key?(:output_contexts)
          @payload = args[:payload] if args.key?(:payload)
          @session_entity_types = args[:session_entity_types] if args.key?(:session_entity_types)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # The response message for Operations.ListOperations.
      class GoogleLongrunningListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::DialogflowV2beta1::GoogleLongrunningOperation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DialogflowV2beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
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
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      class GoogleTypeLatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
    end
  end
end
