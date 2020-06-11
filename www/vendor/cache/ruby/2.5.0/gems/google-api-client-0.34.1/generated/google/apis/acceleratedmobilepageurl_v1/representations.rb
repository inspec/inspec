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
    module AcceleratedmobilepageurlV1
      
      class AmpUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AmpUrlError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchGetAmpUrlsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchGetAmpUrlsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AmpUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amp_url, as: 'ampUrl'
          property :cdn_amp_url, as: 'cdnAmpUrl'
          property :original_url, as: 'originalUrl'
        end
      end
      
      class AmpUrlError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_code, as: 'errorCode'
          property :error_message, as: 'errorMessage'
          property :original_url, as: 'originalUrl'
        end
      end
      
      class BatchGetAmpUrlsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lookup_strategy, as: 'lookupStrategy'
          collection :urls, as: 'urls'
        end
      end
      
      class BatchGetAmpUrlsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :amp_urls, as: 'ampUrls', class: Google::Apis::AcceleratedmobilepageurlV1::AmpUrl, decorator: Google::Apis::AcceleratedmobilepageurlV1::AmpUrl::Representation
      
          collection :url_errors, as: 'urlErrors', class: Google::Apis::AcceleratedmobilepageurlV1::AmpUrlError, decorator: Google::Apis::AcceleratedmobilepageurlV1::AmpUrlError::Representation
      
        end
      end
    end
  end
end
