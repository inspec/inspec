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
    module AdexperiencereportV1
      
      class PlatformSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteSummaryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ViolatingSitesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlatformSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :better_ads_status, as: 'betterAdsStatus'
          property :enforcement_time, as: 'enforcementTime'
          property :filter_status, as: 'filterStatus'
          property :last_change_time, as: 'lastChangeTime'
          collection :region, as: 'region'
          property :report_url, as: 'reportUrl'
          property :under_review, as: 'underReview'
        end
      end
      
      class SiteSummaryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :desktop_summary, as: 'desktopSummary', class: Google::Apis::AdexperiencereportV1::PlatformSummary, decorator: Google::Apis::AdexperiencereportV1::PlatformSummary::Representation
      
          property :mobile_summary, as: 'mobileSummary', class: Google::Apis::AdexperiencereportV1::PlatformSummary, decorator: Google::Apis::AdexperiencereportV1::PlatformSummary::Representation
      
          property :reviewed_site, as: 'reviewedSite'
        end
      end
      
      class ViolatingSitesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :violating_sites, as: 'violatingSites', class: Google::Apis::AdexperiencereportV1::SiteSummaryResponse, decorator: Google::Apis::AdexperiencereportV1::SiteSummaryResponse::Representation
      
        end
      end
    end
  end
end
