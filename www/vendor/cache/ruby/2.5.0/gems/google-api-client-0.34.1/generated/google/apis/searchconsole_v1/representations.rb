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
    module SearchconsoleV1
      
      class BlockedResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileFriendlyIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunMobileFriendlyTestRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunMobileFriendlyTestResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BlockedResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :mime_type, as: 'mimeType'
        end
      end
      
      class MobileFriendlyIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rule, as: 'rule'
        end
      end
      
      class ResourceIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blocked_resource, as: 'blockedResource', class: Google::Apis::SearchconsoleV1::BlockedResource, decorator: Google::Apis::SearchconsoleV1::BlockedResource::Representation
      
        end
      end
      
      class RunMobileFriendlyTestRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_screenshot, as: 'requestScreenshot'
          property :url, as: 'url'
        end
      end
      
      class RunMobileFriendlyTestResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mobile_friendliness, as: 'mobileFriendliness'
          collection :mobile_friendly_issues, as: 'mobileFriendlyIssues', class: Google::Apis::SearchconsoleV1::MobileFriendlyIssue, decorator: Google::Apis::SearchconsoleV1::MobileFriendlyIssue::Representation
      
          collection :resource_issues, as: 'resourceIssues', class: Google::Apis::SearchconsoleV1::ResourceIssue, decorator: Google::Apis::SearchconsoleV1::ResourceIssue::Representation
      
          property :screenshot, as: 'screenshot', class: Google::Apis::SearchconsoleV1::Image, decorator: Google::Apis::SearchconsoleV1::Image::Representation
      
          property :test_status, as: 'testStatus', class: Google::Apis::SearchconsoleV1::TestStatus, decorator: Google::Apis::SearchconsoleV1::TestStatus::Representation
      
        end
      end
      
      class TestStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details'
          property :status, as: 'status'
        end
      end
    end
  end
end
