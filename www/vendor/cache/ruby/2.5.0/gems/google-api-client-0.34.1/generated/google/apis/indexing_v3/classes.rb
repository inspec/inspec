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
    module IndexingV3
      
      # Output for PublishUrlNotification
      class PublishUrlNotificationResponse
        include Google::Apis::Core::Hashable
      
        # Summary of the most recent Indexing API notifications successfully received,
        # for a given URL.
        # Corresponds to the JSON property `urlNotificationMetadata`
        # @return [Google::Apis::IndexingV3::UrlNotificationMetadata]
        attr_accessor :url_notification_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url_notification_metadata = args[:url_notification_metadata] if args.key?(:url_notification_metadata)
        end
      end
      
      # `UrlNotification` is the resource used in all Indexing API calls.
      # It describes one event in the life cycle of a Web Document.
      class UrlNotification
        include Google::Apis::Core::Hashable
      
        # Creation timestamp for this notification.
        # Users should _not_ specify it, the field is ignored at the request time.
        # Corresponds to the JSON property `notifyTime`
        # @return [String]
        attr_accessor :notify_time
      
        # The URL life cycle event that Google is being notified about.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The object of this notification. The URL must be owned by the publisher
        # of this notification and, in case of `URL_UPDATED` notifications, it _must_
        # be crawlable by Google.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @notify_time = args[:notify_time] if args.key?(:notify_time)
          @type = args[:type] if args.key?(:type)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Summary of the most recent Indexing API notifications successfully received,
      # for a given URL.
      class UrlNotificationMetadata
        include Google::Apis::Core::Hashable
      
        # `UrlNotification` is the resource used in all Indexing API calls.
        # It describes one event in the life cycle of a Web Document.
        # Corresponds to the JSON property `latestRemove`
        # @return [Google::Apis::IndexingV3::UrlNotification]
        attr_accessor :latest_remove
      
        # `UrlNotification` is the resource used in all Indexing API calls.
        # It describes one event in the life cycle of a Web Document.
        # Corresponds to the JSON property `latestUpdate`
        # @return [Google::Apis::IndexingV3::UrlNotification]
        attr_accessor :latest_update
      
        # URL to which this metadata refers.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latest_remove = args[:latest_remove] if args.key?(:latest_remove)
          @latest_update = args[:latest_update] if args.key?(:latest_update)
          @url = args[:url] if args.key?(:url)
        end
      end
    end
  end
end
