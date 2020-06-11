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
      
      # AMP URL response for a requested URL.
      class AmpUrl
        include Google::Apis::Core::Hashable
      
        # The AMP URL pointing to the publisher's web server.
        # Corresponds to the JSON property `ampUrl`
        # @return [String]
        attr_accessor :amp_url
      
        # The [AMP Cache URL](/amp/cache/overview#amp-cache-url-format) pointing to
        # the cached document in the Google AMP Cache.
        # Corresponds to the JSON property `cdnAmpUrl`
        # @return [String]
        attr_accessor :cdn_amp_url
      
        # The original non-AMP URL.
        # Corresponds to the JSON property `originalUrl`
        # @return [String]
        attr_accessor :original_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amp_url = args[:amp_url] if args.key?(:amp_url)
          @cdn_amp_url = args[:cdn_amp_url] if args.key?(:cdn_amp_url)
          @original_url = args[:original_url] if args.key?(:original_url)
        end
      end
      
      # AMP URL Error resource for a requested URL that couldn't be found.
      class AmpUrlError
        include Google::Apis::Core::Hashable
      
        # The error code of an API call.
        # Corresponds to the JSON property `errorCode`
        # @return [String]
        attr_accessor :error_code
      
        # An optional descriptive error message.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # The original non-AMP URL.
        # Corresponds to the JSON property `originalUrl`
        # @return [String]
        attr_accessor :original_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_code = args[:error_code] if args.key?(:error_code)
          @error_message = args[:error_message] if args.key?(:error_message)
          @original_url = args[:original_url] if args.key?(:original_url)
        end
      end
      
      # AMP URL request for a batch of URLs.
      class BatchGetAmpUrlsRequest
        include Google::Apis::Core::Hashable
      
        # The lookup_strategy being requested.
        # Corresponds to the JSON property `lookupStrategy`
        # @return [String]
        attr_accessor :lookup_strategy
      
        # List of URLs to look up for the paired AMP URLs.
        # The URLs are case-sensitive. Up to 50 URLs per lookup
        # (see [Usage Limits](/amp/cache/reference/limits)).
        # Corresponds to the JSON property `urls`
        # @return [Array<String>]
        attr_accessor :urls
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lookup_strategy = args[:lookup_strategy] if args.key?(:lookup_strategy)
          @urls = args[:urls] if args.key?(:urls)
        end
      end
      
      # Batch AMP URL response.
      class BatchGetAmpUrlsResponse
        include Google::Apis::Core::Hashable
      
        # For each URL in BatchAmpUrlsRequest, the URL response. The response might
        # not be in the same order as URLs in the batch request.
        # If BatchAmpUrlsRequest contains duplicate URLs, AmpUrl is generated
        # only once.
        # Corresponds to the JSON property `ampUrls`
        # @return [Array<Google::Apis::AcceleratedmobilepageurlV1::AmpUrl>]
        attr_accessor :amp_urls
      
        # The errors for requested URLs that have no AMP URL.
        # Corresponds to the JSON property `urlErrors`
        # @return [Array<Google::Apis::AcceleratedmobilepageurlV1::AmpUrlError>]
        attr_accessor :url_errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amp_urls = args[:amp_urls] if args.key?(:amp_urls)
          @url_errors = args[:url_errors] if args.key?(:url_errors)
        end
      end
    end
  end
end
