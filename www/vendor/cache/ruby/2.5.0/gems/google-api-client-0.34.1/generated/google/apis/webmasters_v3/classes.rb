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
    module WebmastersV3
      
      # 
      class ApiDataRow
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `clicks`
        # @return [Float]
        attr_accessor :clicks
      
        # 
        # Corresponds to the JSON property `ctr`
        # @return [Float]
        attr_accessor :ctr
      
        # 
        # Corresponds to the JSON property `impressions`
        # @return [Float]
        attr_accessor :impressions
      
        # 
        # Corresponds to the JSON property `keys`
        # @return [Array<String>]
        attr_accessor :keys
      
        # 
        # Corresponds to the JSON property `position`
        # @return [Float]
        attr_accessor :position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clicks = args[:clicks] if args.key?(:clicks)
          @ctr = args[:ctr] if args.key?(:ctr)
          @impressions = args[:impressions] if args.key?(:impressions)
          @keys = args[:keys] if args.key?(:keys)
          @position = args[:position] if args.key?(:position)
        end
      end
      
      # 
      class ApiDimensionFilter
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `dimension`
        # @return [String]
        attr_accessor :dimension
      
        # 
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # 
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension = args[:dimension] if args.key?(:dimension)
          @expression = args[:expression] if args.key?(:expression)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # 
      class ApiDimensionFilterGroup
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::WebmastersV3::ApiDimensionFilter>]
        attr_accessor :filters
      
        # 
        # Corresponds to the JSON property `groupType`
        # @return [String]
        attr_accessor :group_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @group_type = args[:group_type] if args.key?(:group_type)
        end
      end
      
      # 
      class SearchAnalyticsQueryRequest
        include Google::Apis::Core::Hashable
      
        # [Optional; Default is "auto"] How data is aggregated. If aggregated by
        # property, all data for the same property is aggregated; if aggregated by page,
        # all data is aggregated by canonical URI. If you filter or group by page,
        # choose AUTO; otherwise you can aggregate either by property or by page,
        # depending on how you want your data calculated; see  the help documentation to
        # learn how data is calculated differently by site versus by page.
        # Note: If you group or filter by page, you cannot aggregate by property.
        # If you specify any value other than AUTO, the aggregation type in the result
        # will match the requested type, or if you request an invalid type, you will get
        # an error. The API will never change your aggregation type if the requested
        # type is invalid.
        # Corresponds to the JSON property `aggregationType`
        # @return [String]
        attr_accessor :aggregation_type
      
        # [Optional] Zero or more filters to apply to the dimension grouping values; for
        # example, 'query contains "buy"' to see only data where the query string
        # contains the substring "buy" (not case-sensitive). You can filter by a
        # dimension without grouping by it.
        # Corresponds to the JSON property `dimensionFilterGroups`
        # @return [Array<Google::Apis::WebmastersV3::ApiDimensionFilterGroup>]
        attr_accessor :dimension_filter_groups
      
        # [Optional] Zero or more dimensions to group results by. Dimensions are the
        # group-by values in the Search Analytics page. Dimensions are combined to
        # create a unique row key for each row. Results are grouped in the order that
        # you supply these dimensions.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<String>]
        attr_accessor :dimensions
      
        # [Required] End date of the requested date range, in YYYY-MM-DD format, in PST (
        # UTC - 8:00). Must be greater than or equal to the start date. This value is
        # included in the range.
        # Corresponds to the JSON property `endDate`
        # @return [String]
        attr_accessor :end_date
      
        # [Optional; Default is 1000] The maximum number of rows to return. Must be a
        # number from 1 to 5,000 (inclusive).
        # Corresponds to the JSON property `rowLimit`
        # @return [Fixnum]
        attr_accessor :row_limit
      
        # [Optional; Default is "web"] The search type to filter for.
        # Corresponds to the JSON property `searchType`
        # @return [String]
        attr_accessor :search_type
      
        # [Required] Start date of the requested date range, in YYYY-MM-DD format, in
        # PST time (UTC - 8:00). Must be less than or equal to the end date. This value
        # is included in the range.
        # Corresponds to the JSON property `startDate`
        # @return [String]
        attr_accessor :start_date
      
        # [Optional; Default is 0] Zero-based index of the first row in the response.
        # Must be a non-negative number.
        # Corresponds to the JSON property `startRow`
        # @return [Fixnum]
        attr_accessor :start_row
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregation_type = args[:aggregation_type] if args.key?(:aggregation_type)
          @dimension_filter_groups = args[:dimension_filter_groups] if args.key?(:dimension_filter_groups)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @end_date = args[:end_date] if args.key?(:end_date)
          @row_limit = args[:row_limit] if args.key?(:row_limit)
          @search_type = args[:search_type] if args.key?(:search_type)
          @start_date = args[:start_date] if args.key?(:start_date)
          @start_row = args[:start_row] if args.key?(:start_row)
        end
      end
      
      # A list of rows, one per result, grouped by key. Metrics in each row are
      # aggregated for all data grouped by that key either by page or property, as
      # specified by the aggregation type parameter.
      class SearchAnalyticsQueryResponse
        include Google::Apis::Core::Hashable
      
        # How the results were aggregated.
        # Corresponds to the JSON property `responseAggregationType`
        # @return [String]
        attr_accessor :response_aggregation_type
      
        # A list of rows grouped by the key values in the order given in the query.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::WebmastersV3::ApiDataRow>]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @response_aggregation_type = args[:response_aggregation_type] if args.key?(:response_aggregation_type)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # List of sitemaps.
      class ListSitemapsResponse
        include Google::Apis::Core::Hashable
      
        # Contains detailed information about a specific URL submitted as a sitemap.
        # Corresponds to the JSON property `sitemap`
        # @return [Array<Google::Apis::WebmastersV3::WmxSitemap>]
        attr_accessor :sitemap
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sitemap = args[:sitemap] if args.key?(:sitemap)
        end
      end
      
      # List of sites with access level information.
      class ListSitesResponse
        include Google::Apis::Core::Hashable
      
        # Contains permission level information about a Search Console site. For more
        # information, see Permissions in Search Console.
        # Corresponds to the JSON property `siteEntry`
        # @return [Array<Google::Apis::WebmastersV3::WmxSite>]
        attr_accessor :site_entry
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @site_entry = args[:site_entry] if args.key?(:site_entry)
        end
      end
      
      # Contains permission level information about a Search Console site. For more
      # information, see  Permissions in Search Console.
      class WmxSite
        include Google::Apis::Core::Hashable
      
        # The user's permission level for the site.
        # Corresponds to the JSON property `permissionLevel`
        # @return [String]
        attr_accessor :permission_level
      
        # The URL of the site.
        # Corresponds to the JSON property `siteUrl`
        # @return [String]
        attr_accessor :site_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission_level = args[:permission_level] if args.key?(:permission_level)
          @site_url = args[:site_url] if args.key?(:site_url)
        end
      end
      
      # Contains detailed information about a specific URL submitted as a sitemap.
      class WmxSitemap
        include Google::Apis::Core::Hashable
      
        # The various content types in the sitemap.
        # Corresponds to the JSON property `contents`
        # @return [Array<Google::Apis::WebmastersV3::WmxSitemapContent>]
        attr_accessor :contents
      
        # Number of errors in the sitemap. These are issues with the sitemap itself that
        # need to be fixed before it can be processed correctly.
        # Corresponds to the JSON property `errors`
        # @return [Fixnum]
        attr_accessor :errors
      
        # If true, the sitemap has not been processed.
        # Corresponds to the JSON property `isPending`
        # @return [Boolean]
        attr_accessor :is_pending
        alias_method :is_pending?, :is_pending
      
        # If true, the sitemap is a collection of sitemaps.
        # Corresponds to the JSON property `isSitemapsIndex`
        # @return [Boolean]
        attr_accessor :is_sitemaps_index
        alias_method :is_sitemaps_index?, :is_sitemaps_index
      
        # Date & time in which this sitemap was last downloaded. Date format is in RFC
        # 3339 format (yyyy-mm-dd).
        # Corresponds to the JSON property `lastDownloaded`
        # @return [DateTime]
        attr_accessor :last_downloaded
      
        # Date & time in which this sitemap was submitted. Date format is in RFC 3339
        # format (yyyy-mm-dd).
        # Corresponds to the JSON property `lastSubmitted`
        # @return [DateTime]
        attr_accessor :last_submitted
      
        # The url of the sitemap.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The type of the sitemap. For example: rssFeed.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Number of warnings for the sitemap. These are generally non-critical issues
        # with URLs in the sitemaps.
        # Corresponds to the JSON property `warnings`
        # @return [Fixnum]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contents = args[:contents] if args.key?(:contents)
          @errors = args[:errors] if args.key?(:errors)
          @is_pending = args[:is_pending] if args.key?(:is_pending)
          @is_sitemaps_index = args[:is_sitemaps_index] if args.key?(:is_sitemaps_index)
          @last_downloaded = args[:last_downloaded] if args.key?(:last_downloaded)
          @last_submitted = args[:last_submitted] if args.key?(:last_submitted)
          @path = args[:path] if args.key?(:path)
          @type = args[:type] if args.key?(:type)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
      end
      
      # Information about the various content types in the sitemap.
      class WmxSitemapContent
        include Google::Apis::Core::Hashable
      
        # The number of URLs from the sitemap that were indexed (of the content type).
        # Corresponds to the JSON property `indexed`
        # @return [Fixnum]
        attr_accessor :indexed
      
        # The number of URLs in the sitemap (of the content type).
        # Corresponds to the JSON property `submitted`
        # @return [Fixnum]
        attr_accessor :submitted
      
        # The specific type of content in this sitemap. For example: web.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @indexed = args[:indexed] if args.key?(:indexed)
          @submitted = args[:submitted] if args.key?(:submitted)
          @type = args[:type] if args.key?(:type)
        end
      end
    end
  end
end
