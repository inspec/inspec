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
    module FcmV1
      
      class AndroidConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidFcmOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidNotification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApnsConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApnsFcmOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Color
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FcmOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LightSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Message
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendMessageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebpushConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebpushFcmOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :collapse_key, as: 'collapseKey'
          hash :data, as: 'data'
          property :fcm_options, as: 'fcmOptions', class: Google::Apis::FcmV1::AndroidFcmOptions, decorator: Google::Apis::FcmV1::AndroidFcmOptions::Representation
      
          property :notification, as: 'notification', class: Google::Apis::FcmV1::AndroidNotification, decorator: Google::Apis::FcmV1::AndroidNotification::Representation
      
          property :priority, as: 'priority'
          property :restricted_package_name, as: 'restrictedPackageName'
          property :ttl, as: 'ttl'
        end
      end
      
      class AndroidFcmOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_label, as: 'analyticsLabel'
        end
      end
      
      class AndroidNotification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          collection :body_loc_args, as: 'bodyLocArgs'
          property :body_loc_key, as: 'bodyLocKey'
          property :channel_id, as: 'channelId'
          property :click_action, as: 'clickAction'
          property :color, as: 'color'
          property :default_light_settings, as: 'defaultLightSettings'
          property :default_sound, as: 'defaultSound'
          property :default_vibrate_timings, as: 'defaultVibrateTimings'
          property :event_time, as: 'eventTime'
          property :icon, as: 'icon'
          property :image, as: 'image'
          property :light_settings, as: 'lightSettings', class: Google::Apis::FcmV1::LightSettings, decorator: Google::Apis::FcmV1::LightSettings::Representation
      
          property :local_only, as: 'localOnly'
          property :notification_count, as: 'notificationCount'
          property :notification_priority, as: 'notificationPriority'
          property :sound, as: 'sound'
          property :sticky, as: 'sticky'
          property :tag, as: 'tag'
          property :ticker, as: 'ticker'
          property :title, as: 'title'
          collection :title_loc_args, as: 'titleLocArgs'
          property :title_loc_key, as: 'titleLocKey'
          collection :vibrate_timings, as: 'vibrateTimings'
          property :visibility, as: 'visibility'
        end
      end
      
      class ApnsConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fcm_options, as: 'fcmOptions', class: Google::Apis::FcmV1::ApnsFcmOptions, decorator: Google::Apis::FcmV1::ApnsFcmOptions::Representation
      
          hash :headers, as: 'headers'
          hash :payload, as: 'payload'
        end
      end
      
      class ApnsFcmOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_label, as: 'analyticsLabel'
          property :image, as: 'image'
        end
      end
      
      class Color
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alpha, as: 'alpha'
          property :blue, as: 'blue'
          property :green, as: 'green'
          property :red, as: 'red'
        end
      end
      
      class FcmOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_label, as: 'analyticsLabel'
        end
      end
      
      class LightSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::FcmV1::Color, decorator: Google::Apis::FcmV1::Color::Representation
      
          property :light_off_duration, as: 'lightOffDuration'
          property :light_on_duration, as: 'lightOnDuration'
        end
      end
      
      class Message
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android, as: 'android', class: Google::Apis::FcmV1::AndroidConfig, decorator: Google::Apis::FcmV1::AndroidConfig::Representation
      
          property :apns, as: 'apns', class: Google::Apis::FcmV1::ApnsConfig, decorator: Google::Apis::FcmV1::ApnsConfig::Representation
      
          property :condition, as: 'condition'
          hash :data, as: 'data'
          property :fcm_options, as: 'fcmOptions', class: Google::Apis::FcmV1::FcmOptions, decorator: Google::Apis::FcmV1::FcmOptions::Representation
      
          property :name, as: 'name'
          property :notification, as: 'notification', class: Google::Apis::FcmV1::Notification, decorator: Google::Apis::FcmV1::Notification::Representation
      
          property :token, as: 'token'
          property :topic, as: 'topic'
          property :webpush, as: 'webpush', class: Google::Apis::FcmV1::WebpushConfig, decorator: Google::Apis::FcmV1::WebpushConfig::Representation
      
        end
      end
      
      class Notification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          property :image, as: 'image'
          property :title, as: 'title'
        end
      end
      
      class SendMessageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message', class: Google::Apis::FcmV1::Message, decorator: Google::Apis::FcmV1::Message::Representation
      
          property :validate_only, as: 'validateOnly'
        end
      end
      
      class WebpushConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :data, as: 'data'
          property :fcm_options, as: 'fcmOptions', class: Google::Apis::FcmV1::WebpushFcmOptions, decorator: Google::Apis::FcmV1::WebpushFcmOptions::Representation
      
          hash :headers, as: 'headers'
          hash :notification, as: 'notification'
        end
      end
      
      class WebpushFcmOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :link, as: 'link'
        end
      end
    end
  end
end
