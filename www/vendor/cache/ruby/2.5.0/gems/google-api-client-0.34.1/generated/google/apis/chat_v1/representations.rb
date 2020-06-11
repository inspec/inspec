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
    module ChatV1
      
      class ActionParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Annotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Button
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Card
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CardAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CardHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeprecatedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FormAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMembershipsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSpacesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Membership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Message
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OnClick
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OpenLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Section
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Space
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextButton
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextParagraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Thread
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserMentionMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WidgetMarkup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActionParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class ActionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :url, as: 'url'
        end
      end
      
      class Annotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :length, as: 'length'
          property :start_index, as: 'startIndex'
          property :type, as: 'type'
          property :user_mention, as: 'userMention', class: Google::Apis::ChatV1::UserMentionMetadata, decorator: Google::Apis::ChatV1::UserMentionMetadata::Representation
      
        end
      end
      
      class Button
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_button, as: 'imageButton', class: Google::Apis::ChatV1::ImageButton, decorator: Google::Apis::ChatV1::ImageButton::Representation
      
          property :text_button, as: 'textButton', class: Google::Apis::ChatV1::TextButton, decorator: Google::Apis::ChatV1::TextButton::Representation
      
        end
      end
      
      class Card
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :card_actions, as: 'cardActions', class: Google::Apis::ChatV1::CardAction, decorator: Google::Apis::ChatV1::CardAction::Representation
      
          property :header, as: 'header', class: Google::Apis::ChatV1::CardHeader, decorator: Google::Apis::ChatV1::CardHeader::Representation
      
          property :name, as: 'name'
          collection :sections, as: 'sections', class: Google::Apis::ChatV1::Section, decorator: Google::Apis::ChatV1::Section::Representation
      
        end
      end
      
      class CardAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_label, as: 'actionLabel'
          property :on_click, as: 'onClick', class: Google::Apis::ChatV1::OnClick, decorator: Google::Apis::ChatV1::OnClick::Representation
      
        end
      end
      
      class CardHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_style, as: 'imageStyle'
          property :image_url, as: 'imageUrl'
          property :subtitle, as: 'subtitle'
          property :title, as: 'title'
        end
      end
      
      class DeprecatedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action', class: Google::Apis::ChatV1::FormAction, decorator: Google::Apis::ChatV1::FormAction::Representation
      
          property :config_complete_redirect_url, as: 'configCompleteRedirectUrl'
          property :event_time, as: 'eventTime'
          property :message, as: 'message', class: Google::Apis::ChatV1::Message, decorator: Google::Apis::ChatV1::Message::Representation
      
          property :space, as: 'space', class: Google::Apis::ChatV1::Space, decorator: Google::Apis::ChatV1::Space::Representation
      
          property :thread_key, as: 'threadKey'
          property :token, as: 'token'
          property :type, as: 'type'
          property :user, as: 'user', class: Google::Apis::ChatV1::User, decorator: Google::Apis::ChatV1::User::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FormAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_method_name, as: 'actionMethodName'
          collection :parameters, as: 'parameters', class: Google::Apis::ChatV1::ActionParameter, decorator: Google::Apis::ChatV1::ActionParameter::Representation
      
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aspect_ratio, as: 'aspectRatio'
          property :image_url, as: 'imageUrl'
          property :on_click, as: 'onClick', class: Google::Apis::ChatV1::OnClick, decorator: Google::Apis::ChatV1::OnClick::Representation
      
        end
      end
      
      class ImageButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :icon, as: 'icon'
          property :icon_url, as: 'iconUrl'
          property :name, as: 'name'
          property :on_click, as: 'onClick', class: Google::Apis::ChatV1::OnClick, decorator: Google::Apis::ChatV1::OnClick::Representation
      
        end
      end
      
      class KeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bottom_label, as: 'bottomLabel'
          property :button, as: 'button', class: Google::Apis::ChatV1::Button, decorator: Google::Apis::ChatV1::Button::Representation
      
          property :content, as: 'content'
          property :content_multiline, as: 'contentMultiline'
          property :icon, as: 'icon'
          property :icon_url, as: 'iconUrl'
          property :on_click, as: 'onClick', class: Google::Apis::ChatV1::OnClick, decorator: Google::Apis::ChatV1::OnClick::Representation
      
          property :top_label, as: 'topLabel'
        end
      end
      
      class ListMembershipsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :memberships, as: 'memberships', class: Google::Apis::ChatV1::Membership, decorator: Google::Apis::ChatV1::Membership::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListSpacesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :spaces, as: 'spaces', class: Google::Apis::ChatV1::Space, decorator: Google::Apis::ChatV1::Space::Representation
      
        end
      end
      
      class Membership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :member, as: 'member', class: Google::Apis::ChatV1::User, decorator: Google::Apis::ChatV1::User::Representation
      
          property :name, as: 'name'
          property :state, as: 'state'
        end
      end
      
      class Message
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_response, as: 'actionResponse', class: Google::Apis::ChatV1::ActionResponse, decorator: Google::Apis::ChatV1::ActionResponse::Representation
      
          collection :annotations, as: 'annotations', class: Google::Apis::ChatV1::Annotation, decorator: Google::Apis::ChatV1::Annotation::Representation
      
          property :argument_text, as: 'argumentText'
          collection :cards, as: 'cards', class: Google::Apis::ChatV1::Card, decorator: Google::Apis::ChatV1::Card::Representation
      
          property :create_time, as: 'createTime'
          property :fallback_text, as: 'fallbackText'
          property :name, as: 'name'
          property :preview_text, as: 'previewText'
          property :sender, as: 'sender', class: Google::Apis::ChatV1::User, decorator: Google::Apis::ChatV1::User::Representation
      
          property :space, as: 'space', class: Google::Apis::ChatV1::Space, decorator: Google::Apis::ChatV1::Space::Representation
      
          property :text, as: 'text'
          property :thread, as: 'thread', class: Google::Apis::ChatV1::Thread, decorator: Google::Apis::ChatV1::Thread::Representation
      
        end
      end
      
      class OnClick
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action', class: Google::Apis::ChatV1::FormAction, decorator: Google::Apis::ChatV1::FormAction::Representation
      
          property :open_link, as: 'openLink', class: Google::Apis::ChatV1::OpenLink, decorator: Google::Apis::ChatV1::OpenLink::Representation
      
        end
      end
      
      class OpenLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
      
      class Section
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header'
          collection :widgets, as: 'widgets', class: Google::Apis::ChatV1::WidgetMarkup, decorator: Google::Apis::ChatV1::WidgetMarkup::Representation
      
        end
      end
      
      class Space
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class TextButton
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :on_click, as: 'onClick', class: Google::Apis::ChatV1::OnClick, decorator: Google::Apis::ChatV1::OnClick::Representation
      
          property :text, as: 'text'
        end
      end
      
      class TextParagraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :text, as: 'text'
        end
      end
      
      class Thread
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class UserMentionMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :user, as: 'user', class: Google::Apis::ChatV1::User, decorator: Google::Apis::ChatV1::User::Representation
      
        end
      end
      
      class WidgetMarkup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buttons, as: 'buttons', class: Google::Apis::ChatV1::Button, decorator: Google::Apis::ChatV1::Button::Representation
      
          property :image, as: 'image', class: Google::Apis::ChatV1::Image, decorator: Google::Apis::ChatV1::Image::Representation
      
          property :key_value, as: 'keyValue', class: Google::Apis::ChatV1::KeyValue, decorator: Google::Apis::ChatV1::KeyValue::Representation
      
          property :text_paragraph, as: 'textParagraph', class: Google::Apis::ChatV1::TextParagraph, decorator: Google::Apis::ChatV1::TextParagraph::Representation
      
        end
      end
    end
  end
end
