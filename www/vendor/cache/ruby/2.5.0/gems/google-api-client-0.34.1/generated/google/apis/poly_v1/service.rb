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
    module PolyV1
      # Poly API
      #
      # The Poly API provides read access to assets hosted on <a href="https://poly.
      #  google.com">poly.google.com</a> to all, and upload access to <a href="https://
      #  poly.google.com">poly.google.com</a> for whitelisted accounts.
      #
      # @example
      #    require 'google/apis/poly_v1'
      #
      #    Poly = Google::Apis::PolyV1 # Alias the module
      #    service = Poly::PolyServiceService.new
      #
      # @see https://developers.google.com/poly/
      class PolyServiceService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://poly.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Returns detailed information about an asset given its name.
        # PRIVATE assets are returned only if
        # the currently authenticated user (via OAuth token) is the author of the
        # asset.
        # @param [String] name
        #   Required. An asset's name in the form `assets/`ASSET_ID``.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PolyV1::Asset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PolyV1::Asset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_asset(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::PolyV1::Asset::Representation
          command.response_class = Google::Apis::PolyV1::Asset
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all public, remixable assets. These are assets with an access level
        # of PUBLIC and published under the
        # CC-By license.
        # @param [String] category
        #   Filter assets based on the specified category. Supported values are:
        #   `animals`, `architecture`, `art`, `food`, `nature`, `objects`, `people`,
        #   `scenes`, `technology`, and `transport`.
        # @param [Boolean] curated
        #   Return only assets that have been curated by the Poly team.
        # @param [String] format
        #   Return only assets with the matching format. Acceptable values are:
        #   `BLOCKS`, `FBX`, `GLTF`, `GLTF2`, `OBJ`, `TILT`.
        # @param [String] keywords
        #   One or more search terms to be matched against all text that Poly has
        #   indexed for assets, which includes display_name,
        #   description, and tags. Multiple keywords should be
        #   separated by spaces.
        # @param [String] max_complexity
        #   Returns assets that are of the specified complexity or less. Defaults to
        #   COMPLEX. For example, a request for
        #   MEDIUM assets also includes
        #   SIMPLE assets.
        # @param [String] order_by
        #   Specifies an ordering for assets. Acceptable values are:
        #   `BEST`, `NEWEST`, `OLDEST`. Defaults to `BEST`, which ranks assets
        #   based on a combination of popularity and other features.
        # @param [Fixnum] page_size
        #   The maximum number of assets to be returned. This value must be between `1`
        #   and `100`. Defaults to `20`.
        # @param [String] page_token
        #   Specifies a continuation token from a previous search whose results were
        #   split into multiple pages. To get the next page, submit the same request
        #   specifying the value from
        #   next_page_token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PolyV1::ListAssetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PolyV1::ListAssetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_assets(category: nil, curated: nil, format: nil, keywords: nil, max_complexity: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/assets', options)
          command.response_representation = Google::Apis::PolyV1::ListAssetsResponse::Representation
          command.response_class = Google::Apis::PolyV1::ListAssetsResponse
          command.query['category'] = category unless category.nil?
          command.query['curated'] = curated unless curated.nil?
          command.query['format'] = format unless format.nil?
          command.query['keywords'] = keywords unless keywords.nil?
          command.query['maxComplexity'] = max_complexity unless max_complexity.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists assets authored by the given user. Only the value 'me', representing
        # the currently-authenticated user, is supported. May include assets with an
        # access level of PRIVATE or
        # UNLISTED and assets which are
        # All Rights Reserved for the
        # currently-authenticated user.
        # @param [String] name
        #   A valid user id. Currently, only the special value 'me', representing the
        #   currently-authenticated user is supported. To use 'me', you must pass
        #   an OAuth token with the request.
        # @param [String] format
        #   Return only assets with the matching format. Acceptable values are:
        #   `BLOCKS`, `FBX`, `GLTF`, `GLTF2`, `OBJ`, and `TILT`.
        # @param [String] order_by
        #   Specifies an ordering for assets. Acceptable values are:
        #   `BEST`, `NEWEST`, `OLDEST`. Defaults to `BEST`, which ranks assets
        #   based on a combination of popularity and other features.
        # @param [Fixnum] page_size
        #   The maximum number of assets to be returned. This value must be between `1`
        #   and `100`. Defaults to `20`.
        # @param [String] page_token
        #   Specifies a continuation token from a previous search whose results were
        #   split into multiple pages. To get the next page, submit the same request
        #   specifying the value from
        #   next_page_token.
        # @param [String] visibility
        #   The visibility of the assets to be returned.
        #   Defaults to
        #   VISIBILITY_UNSPECIFIED
        #   which returns all assets.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PolyV1::ListUserAssetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PolyV1::ListUserAssetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_assets(name, format: nil, order_by: nil, page_size: nil, page_token: nil, visibility: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/assets', options)
          command.response_representation = Google::Apis::PolyV1::ListUserAssetsResponse::Representation
          command.response_class = Google::Apis::PolyV1::ListUserAssetsResponse
          command.params['name'] = name unless name.nil?
          command.query['format'] = format unless format.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['visibility'] = visibility unless visibility.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists assets that the user has liked. Only the value 'me', representing
        # the currently-authenticated user, is supported. May include assets with an
        # access level of UNLISTED.
        # @param [String] name
        #   A valid user id. Currently, only the special value 'me', representing the
        #   currently-authenticated user is supported. To use 'me', you must pass
        #   an OAuth token with the request.
        # @param [String] format
        #   Return only assets with the matching format. Acceptable values are:
        #   `BLOCKS`, `FBX`, `GLTF`, `GLTF2`, `OBJ`, `TILT`.
        # @param [String] order_by
        #   Specifies an ordering for assets. Acceptable values are:
        #   `BEST`, `NEWEST`, `OLDEST`, 'LIKED_TIME'. Defaults to `LIKED_TIME`, which
        #   ranks assets based on how recently they were liked.
        # @param [Fixnum] page_size
        #   The maximum number of assets to be returned. This value must be between `1`
        #   and `100`. Defaults to `20`.
        # @param [String] page_token
        #   Specifies a continuation token from a previous search whose results were
        #   split into multiple pages. To get the next page, submit the same request
        #   specifying the value from
        #   next_page_token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PolyV1::ListLikedAssetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PolyV1::ListLikedAssetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_likedassets(name, format: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/likedassets', options)
          command.response_representation = Google::Apis::PolyV1::ListLikedAssetsResponse::Representation
          command.response_class = Google::Apis::PolyV1::ListLikedAssetsResponse
          command.params['name'] = name unless name.nil?
          command.query['format'] = format unless format.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
