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
      
      # A site's Ad Experience Report summary on a single platform.
      class PlatformSummary
        include Google::Apis::Core::Hashable
      
        # The site's Ad Experience Report status on this platform.
        # Corresponds to the JSON property `betterAdsStatus`
        # @return [String]
        attr_accessor :better_ads_status
      
        # The time at which
        # [enforcement](https://support.google.com/webtools/answer/7308033) against
        # the site began or will begin on this platform.
        # Not set when the
        # filter_status
        # is OFF.
        # Corresponds to the JSON property `enforcementTime`
        # @return [String]
        attr_accessor :enforcement_time
      
        # The site's [enforcement
        # status](https://support.google.com/webtools/answer/7308033) on this
        # platform.
        # Corresponds to the JSON property `filterStatus`
        # @return [String]
        attr_accessor :filter_status
      
        # The time at which the site's status last changed on this platform.
        # Corresponds to the JSON property `lastChangeTime`
        # @return [String]
        attr_accessor :last_change_time
      
        # The site's regions on this platform.
        # No longer populated, because there is no longer any semantic difference
        # between sites in different regions.
        # Corresponds to the JSON property `region`
        # @return [Array<String>]
        attr_accessor :region
      
        # A link to the full Ad Experience Report for the site on this platform..
        # Not set in
        # ViolatingSitesResponse.
        # Note that you must complete the [Search Console verification
        # process](https://support.google.com/webmasters/answer/9008080) for the site
        # before you can access the full report.
        # Corresponds to the JSON property `reportUrl`
        # @return [String]
        attr_accessor :report_url
      
        # Whether the site is currently under review on this platform.
        # Corresponds to the JSON property `underReview`
        # @return [Boolean]
        attr_accessor :under_review
        alias_method :under_review?, :under_review
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @better_ads_status = args[:better_ads_status] if args.key?(:better_ads_status)
          @enforcement_time = args[:enforcement_time] if args.key?(:enforcement_time)
          @filter_status = args[:filter_status] if args.key?(:filter_status)
          @last_change_time = args[:last_change_time] if args.key?(:last_change_time)
          @region = args[:region] if args.key?(:region)
          @report_url = args[:report_url] if args.key?(:report_url)
          @under_review = args[:under_review] if args.key?(:under_review)
        end
      end
      
      # Response message for GetSiteSummary.
      class SiteSummaryResponse
        include Google::Apis::Core::Hashable
      
        # A site's Ad Experience Report summary on a single platform.
        # Corresponds to the JSON property `desktopSummary`
        # @return [Google::Apis::AdexperiencereportV1::PlatformSummary]
        attr_accessor :desktop_summary
      
        # A site's Ad Experience Report summary on a single platform.
        # Corresponds to the JSON property `mobileSummary`
        # @return [Google::Apis::AdexperiencereportV1::PlatformSummary]
        attr_accessor :mobile_summary
      
        # The name of the reviewed site, e.g. `google.com`.
        # Corresponds to the JSON property `reviewedSite`
        # @return [String]
        attr_accessor :reviewed_site
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @desktop_summary = args[:desktop_summary] if args.key?(:desktop_summary)
          @mobile_summary = args[:mobile_summary] if args.key?(:mobile_summary)
          @reviewed_site = args[:reviewed_site] if args.key?(:reviewed_site)
        end
      end
      
      # Response message for ListViolatingSites.
      class ViolatingSitesResponse
        include Google::Apis::Core::Hashable
      
        # The list of violating sites.
        # Corresponds to the JSON property `violatingSites`
        # @return [Array<Google::Apis::AdexperiencereportV1::SiteSummaryResponse>]
        attr_accessor :violating_sites
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @violating_sites = args[:violating_sites] if args.key?(:violating_sites)
        end
      end
    end
  end
end
