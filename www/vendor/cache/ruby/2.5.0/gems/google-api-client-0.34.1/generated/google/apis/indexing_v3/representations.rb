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
      
      class PublishUrlNotificationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlNotification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlNotificationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishUrlNotificationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url_notification_metadata, as: 'urlNotificationMetadata', class: Google::Apis::IndexingV3::UrlNotificationMetadata, decorator: Google::Apis::IndexingV3::UrlNotificationMetadata::Representation
      
        end
      end
      
      class UrlNotification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :notify_time, as: 'notifyTime'
          property :type, as: 'type'
          property :url, as: 'url'
        end
      end
      
      class UrlNotificationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latest_remove, as: 'latestRemove', class: Google::Apis::IndexingV3::UrlNotification, decorator: Google::Apis::IndexingV3::UrlNotification::Representation
      
          property :latest_update, as: 'latestUpdate', class: Google::Apis::IndexingV3::UrlNotification, decorator: Google::Apis::IndexingV3::UrlNotification::Representation
      
          property :url, as: 'url'
        end
      end
    end
  end
end
