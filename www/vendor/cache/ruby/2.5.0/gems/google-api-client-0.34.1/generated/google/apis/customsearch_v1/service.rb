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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module CustomsearchV1
      # CustomSearch API
      #
      # Searches over a website or collection of websites
      #
      # @example
      #    require 'google/apis/customsearch_v1'
      #
      #    Customsearch = Google::Apis::CustomsearchV1 # Alias the module
      #    service = Customsearch::CustomsearchService.new
      #
      # @see https://developers.google.com/custom-search/v1/using_rest
      class CustomsearchService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'customsearch/')
          @batch_path = 'batch/customsearch/v1'
        end
        
        # Returns metadata about the search performed, metadata about the custom search
        # engine used for the search, and the search results.
        # @param [String] q
        #   Query
        # @param [String] c2coff
        #   Turns off the translation between zh-CN and zh-TW.
        # @param [String] cr
        #   Country restrict(s).
        # @param [String] cx
        #   The custom search engine ID to scope this search query
        # @param [String] date_restrict
        #   Specifies all search results are from a time period
        # @param [String] exact_terms
        #   Identifies a phrase that all documents in the search results must contain
        # @param [String] exclude_terms
        #   Identifies a word or phrase that should not appear in any documents in the
        #   search results
        # @param [String] file_type
        #   Returns images of a specified type. Some of the allowed values are: bmp, gif,
        #   png, jpg, svg, pdf, ...
        # @param [String] filter
        #   Controls turning on or off the duplicate content filter.
        # @param [String] gl
        #   Geolocation of end user.
        # @param [String] googlehost
        #   The local Google domain to use to perform the search.
        # @param [String] high_range
        #   Creates a range in form as_nlo value..as_nhi value and attempts to append it
        #   to query
        # @param [String] hl
        #   Sets the user interface language.
        # @param [String] hq
        #   Appends the extra query terms to the query.
        # @param [String] img_color_type
        #   Returns black and white, grayscale, or color images: mono, gray, and color.
        # @param [String] img_dominant_color
        #   Returns images of a specific dominant color: red, orange, yellow, green, teal,
        #   blue, purple, pink, white, gray, black and brown.
        # @param [String] img_size
        #   Returns images of a specified size, where size can be one of: icon, small,
        #   medium, large, xlarge, xxlarge, and huge.
        # @param [String] img_type
        #   Returns images of a type, which can be one of: clipart, face, lineart, news,
        #   and photo.
        # @param [String] link_site
        #   Specifies that all search results should contain a link to a particular URL
        # @param [String] low_range
        #   Creates a range in form as_nlo value..as_nhi value and attempts to append it
        #   to query
        # @param [String] lr
        #   The language restriction for the search results
        # @param [Fixnum] num
        #   Number of search results to return
        # @param [String] or_terms
        #   Provides additional search terms to check for in a document, where each
        #   document in the search results must contain at least one of the additional
        #   search terms
        # @param [String] related_site
        #   Specifies that all search results should be pages that are related to the
        #   specified URL
        # @param [String] rights
        #   Filters based on licensing. Supported values include: cc_publicdomain,
        #   cc_attribute, cc_sharealike, cc_noncommercial, cc_nonderived and combinations
        #   of these.
        # @param [String] safe
        #   Search safety level
        # @param [String] search_type
        #   Specifies the search type: image.
        # @param [String] site_search
        #   Specifies all search results should be pages from a given site
        # @param [String] site_search_filter
        #   Controls whether to include or exclude results from the site named in the
        #   as_sitesearch parameter
        # @param [String] sort
        #   The sort expression to apply to the results
        # @param [Fixnum] start
        #   The index of the first result to return
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CustomsearchV1::Search] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CustomsearchV1::Search]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_cses(q, c2coff: nil, cr: nil, cx: nil, date_restrict: nil, exact_terms: nil, exclude_terms: nil, file_type: nil, filter: nil, gl: nil, googlehost: nil, high_range: nil, hl: nil, hq: nil, img_color_type: nil, img_dominant_color: nil, img_size: nil, img_type: nil, link_site: nil, low_range: nil, lr: nil, num: nil, or_terms: nil, related_site: nil, rights: nil, safe: nil, search_type: nil, site_search: nil, site_search_filter: nil, sort: nil, start: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1', options)
          command.response_representation = Google::Apis::CustomsearchV1::Search::Representation
          command.response_class = Google::Apis::CustomsearchV1::Search
          command.query['c2coff'] = c2coff unless c2coff.nil?
          command.query['cr'] = cr unless cr.nil?
          command.query['cx'] = cx unless cx.nil?
          command.query['dateRestrict'] = date_restrict unless date_restrict.nil?
          command.query['exactTerms'] = exact_terms unless exact_terms.nil?
          command.query['excludeTerms'] = exclude_terms unless exclude_terms.nil?
          command.query['fileType'] = file_type unless file_type.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['gl'] = gl unless gl.nil?
          command.query['googlehost'] = googlehost unless googlehost.nil?
          command.query['highRange'] = high_range unless high_range.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['hq'] = hq unless hq.nil?
          command.query['imgColorType'] = img_color_type unless img_color_type.nil?
          command.query['imgDominantColor'] = img_dominant_color unless img_dominant_color.nil?
          command.query['imgSize'] = img_size unless img_size.nil?
          command.query['imgType'] = img_type unless img_type.nil?
          command.query['linkSite'] = link_site unless link_site.nil?
          command.query['lowRange'] = low_range unless low_range.nil?
          command.query['lr'] = lr unless lr.nil?
          command.query['num'] = num unless num.nil?
          command.query['orTerms'] = or_terms unless or_terms.nil?
          command.query['q'] = q unless q.nil?
          command.query['relatedSite'] = related_site unless related_site.nil?
          command.query['rights'] = rights unless rights.nil?
          command.query['safe'] = safe unless safe.nil?
          command.query['searchType'] = search_type unless search_type.nil?
          command.query['siteSearch'] = site_search unless site_search.nil?
          command.query['siteSearchFilter'] = site_search_filter unless site_search_filter.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['start'] = start unless start.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns metadata about the search performed, metadata about the custom search
        # engine used for the search, and the search results. Uses a small set of url
        # patterns.
        # @param [String] q
        #   Query
        # @param [String] c2coff
        #   Turns off the translation between zh-CN and zh-TW.
        # @param [String] cr
        #   Country restrict(s).
        # @param [String] cx
        #   The custom search engine ID to scope this search query
        # @param [String] date_restrict
        #   Specifies all search results are from a time period
        # @param [String] exact_terms
        #   Identifies a phrase that all documents in the search results must contain
        # @param [String] exclude_terms
        #   Identifies a word or phrase that should not appear in any documents in the
        #   search results
        # @param [String] file_type
        #   Returns images of a specified type. Some of the allowed values are: bmp, gif,
        #   png, jpg, svg, pdf, ...
        # @param [String] filter
        #   Controls turning on or off the duplicate content filter.
        # @param [String] gl
        #   Geolocation of end user.
        # @param [String] googlehost
        #   The local Google domain to use to perform the search.
        # @param [String] high_range
        #   Creates a range in form as_nlo value..as_nhi value and attempts to append it
        #   to query
        # @param [String] hl
        #   Sets the user interface language.
        # @param [String] hq
        #   Appends the extra query terms to the query.
        # @param [String] img_color_type
        #   Returns black and white, grayscale, or color images: mono, gray, and color.
        # @param [String] img_dominant_color
        #   Returns images of a specific dominant color: red, orange, yellow, green, teal,
        #   blue, purple, pink, white, gray, black and brown.
        # @param [String] img_size
        #   Returns images of a specified size, where size can be one of: icon, small,
        #   medium, large, xlarge, xxlarge, and huge.
        # @param [String] img_type
        #   Returns images of a type, which can be one of: clipart, face, lineart, news,
        #   and photo.
        # @param [String] link_site
        #   Specifies that all search results should contain a link to a particular URL
        # @param [String] low_range
        #   Creates a range in form as_nlo value..as_nhi value and attempts to append it
        #   to query
        # @param [String] lr
        #   The language restriction for the search results
        # @param [Fixnum] num
        #   Number of search results to return
        # @param [String] or_terms
        #   Provides additional search terms to check for in a document, where each
        #   document in the search results must contain at least one of the additional
        #   search terms
        # @param [String] related_site
        #   Specifies that all search results should be pages that are related to the
        #   specified URL
        # @param [String] rights
        #   Filters based on licensing. Supported values include: cc_publicdomain,
        #   cc_attribute, cc_sharealike, cc_noncommercial, cc_nonderived and combinations
        #   of these.
        # @param [String] safe
        #   Search safety level
        # @param [String] search_type
        #   Specifies the search type: image.
        # @param [String] site_search
        #   Specifies all search results should be pages from a given site
        # @param [String] site_search_filter
        #   Controls whether to include or exclude results from the site named in the
        #   as_sitesearch parameter
        # @param [String] sort
        #   The sort expression to apply to the results
        # @param [Fixnum] start
        #   The index of the first result to return
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CustomsearchV1::Search] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CustomsearchV1::Search]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_cse_siterestricts(q, c2coff: nil, cr: nil, cx: nil, date_restrict: nil, exact_terms: nil, exclude_terms: nil, file_type: nil, filter: nil, gl: nil, googlehost: nil, high_range: nil, hl: nil, hq: nil, img_color_type: nil, img_dominant_color: nil, img_size: nil, img_type: nil, link_site: nil, low_range: nil, lr: nil, num: nil, or_terms: nil, related_site: nil, rights: nil, safe: nil, search_type: nil, site_search: nil, site_search_filter: nil, sort: nil, start: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/siterestrict', options)
          command.response_representation = Google::Apis::CustomsearchV1::Search::Representation
          command.response_class = Google::Apis::CustomsearchV1::Search
          command.query['c2coff'] = c2coff unless c2coff.nil?
          command.query['cr'] = cr unless cr.nil?
          command.query['cx'] = cx unless cx.nil?
          command.query['dateRestrict'] = date_restrict unless date_restrict.nil?
          command.query['exactTerms'] = exact_terms unless exact_terms.nil?
          command.query['excludeTerms'] = exclude_terms unless exclude_terms.nil?
          command.query['fileType'] = file_type unless file_type.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['gl'] = gl unless gl.nil?
          command.query['googlehost'] = googlehost unless googlehost.nil?
          command.query['highRange'] = high_range unless high_range.nil?
          command.query['hl'] = hl unless hl.nil?
          command.query['hq'] = hq unless hq.nil?
          command.query['imgColorType'] = img_color_type unless img_color_type.nil?
          command.query['imgDominantColor'] = img_dominant_color unless img_dominant_color.nil?
          command.query['imgSize'] = img_size unless img_size.nil?
          command.query['imgType'] = img_type unless img_type.nil?
          command.query['linkSite'] = link_site unless link_site.nil?
          command.query['lowRange'] = low_range unless low_range.nil?
          command.query['lr'] = lr unless lr.nil?
          command.query['num'] = num unless num.nil?
          command.query['orTerms'] = or_terms unless or_terms.nil?
          command.query['q'] = q unless q.nil?
          command.query['relatedSite'] = related_site unless related_site.nil?
          command.query['rights'] = rights unless rights.nil?
          command.query['safe'] = safe unless safe.nil?
          command.query['searchType'] = search_type unless search_type.nil?
          command.query['siteSearch'] = site_search unless site_search.nil?
          command.query['siteSearchFilter'] = site_search_filter unless site_search_filter.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['start'] = start unless start.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
