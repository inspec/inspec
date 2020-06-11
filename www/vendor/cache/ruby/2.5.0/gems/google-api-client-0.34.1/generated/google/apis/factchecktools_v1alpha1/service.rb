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
    module FactchecktoolsV1alpha1
      # Fact Check Tools API
      #
      # 
      #
      # @example
      #    require 'google/apis/factchecktools_v1alpha1'
      #
      #    Factchecktools = Google::Apis::FactchecktoolsV1alpha1 # Alias the module
      #    service = Factchecktools::FactCheckToolsService.new
      #
      # @see https://developers.google.com/fact-check/tools/api/
      class FactCheckToolsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://factchecktools.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Search through fact-checked claims.
        # @param [String] language_code
        #   The BCP-47 language code, such as "en-US" or "sr-Latn". Can be used to
        #   restrict results by language, though we do not currently consider the
        #   region.
        # @param [Fixnum] max_age_days
        #   The maximum age of the returned search results, in days.
        #   Age is determined by either claim date or review date, whichever is newer.
        # @param [Fixnum] offset
        #   An integer that specifies the current offset (that is, starting result
        #   location) in search results. This field is only considered if `page_token`
        #   is unset. For example, 0 means to return results starting from the first
        #   matching result, and 10 means to return from the 11th result.
        # @param [Fixnum] page_size
        #   The pagination size. We will return up to that many results. Defaults to
        #   10 if not set.
        # @param [String] page_token
        #   The pagination token. You may provide the `next_page_token` returned from a
        #   previous List request, if any, in order to get the next page. All other
        #   fields must have the same values as in the previous request.
        # @param [String] query
        #   Textual query string. Required unless `review_publisher_site_filter` is
        #   specified.
        # @param [String] review_publisher_site_filter
        #   The review publisher site to filter results by, e.g. nytimes.com.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_claims(language_code: nil, max_age_days: nil, offset: nil, page_size: nil, page_token: nil, query: nil, review_publisher_site_filter: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/claims:search', options)
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['maxAgeDays'] = max_age_days unless max_age_days.nil?
          command.query['offset'] = offset unless offset.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['reviewPublisherSiteFilter'] = review_publisher_site_filter unless review_publisher_site_filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create `ClaimReview` markup on a page.
        # @param [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage] google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_page(google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/pages', options)
          command.request_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
          command.request_object = google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete all `ClaimReview` markup on a page.
        # @param [String] name
        #   The name of the resource to delete, in the form of `pages/`page_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_page(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get all `ClaimReview` markup on a page.
        # @param [String] name
        #   The name of the resource to get, in the form of `pages/`page_id``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_page(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the `ClaimReview` markup pages for a specific URL or for an
        # organization.
        # @param [Fixnum] offset
        #   An integer that specifies the current offset (that is, starting result
        #   location) in search results. This field is only considered if `page_token`
        #   is unset, and if the request is not for a specific URL. For example, 0
        #   means to return results starting from the first matching result, and 10
        #   means to return from the 11th result.
        # @param [String] organization
        #   The organization for which we want to fetch markups for. For instance,
        #   "site.com". Cannot be specified along with an URL.
        # @param [Fixnum] page_size
        #   The pagination size. We will return up to that many results. Defaults to
        #   10 if not set. Has no effect if a URL is requested.
        # @param [String] page_token
        #   The pagination token. You may provide the `next_page_token` returned from a
        #   previous List request, if any, in order to get the next page. All other
        #   fields must have the same values as in the previous request.
        # @param [String] url
        #   The URL from which to get `ClaimReview` markup. There will be at most one
        #   result. If markup is associated with a more canonical version of the URL
        #   provided, we will return that URL instead. Cannot be specified along with
        #   an organization.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pages(offset: nil, organization: nil, page_size: nil, page_token: nil, url: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/pages', options)
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse
          command.query['offset'] = offset unless offset.nil?
          command.query['organization'] = organization unless organization.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['url'] = url unless url.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update for all `ClaimReview` markup on a page
        # Note that this is a full update. To retain the existing `ClaimReview`
        # markup on a page, first perform a Get operation, then modify the returned
        # markup, and finally call Update with the entire `ClaimReview` markup as the
        # body.
        # @param [String] name
        #   The name of this `ClaimReview` markup page resource, in the form of
        #   `pages/`page_id``. Except for update requests, this field is output-only
        #   and should not be set by the user.
        # @param [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage] google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_page(name, google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
          command.request_object = google_factchecking_factchecktools_v1alpha1_claim_review_markup_page_object
          command.response_representation = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
          command.response_class = Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
