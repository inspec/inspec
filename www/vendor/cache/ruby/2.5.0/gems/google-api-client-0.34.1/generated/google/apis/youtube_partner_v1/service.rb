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
    module YoutubePartnerV1
      # YouTube Content ID API
      #
      # API for YouTube partners. To use this API a YouTube CMS account is required.
      #
      # @example
      #    require 'google/apis/youtube_partner_v1'
      #
      #    YoutubePartner = Google::Apis::YoutubePartnerV1 # Alias the module
      #    service = YoutubePartner::YouTubePartnerService.new
      #
      # @see https://developers.google.com/youtube/partner/
      class YouTubePartnerService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'youtube/partner/v1/')
          @batch_path = 'batch/youtubePartner/v1'
        end
        
        # Insert an asset label for an owner.
        # @param [Google::Apis::YoutubePartnerV1::AssetLabel] asset_label_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetLabel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetLabel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_asset_label(asset_label_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'assetLabels', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::AssetLabel::Representation
          command.request_object = asset_label_object
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetLabel::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetLabel
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of all asset labels for an owner.
        # @param [String] label_prefix
        #   The labelPrefix parameter identifies the prefix of asset labels to retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] q
        #   The q parameter specifies the query string to use to filter search results.
        #   YouTube searches for the query string in the labelName field of asset labels.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetLabelListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetLabelListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_asset_labels(label_prefix: nil, on_behalf_of_content_owner: nil, q: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assetLabels', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetLabelListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetLabelListResponse
          command.query['labelPrefix'] = label_prefix unless label_prefix.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the match policy assigned to the specified asset by the content
        # owner associated with the authenticated user. This information is only
        # accessible to an owner of the asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving the match policy.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetMatchPolicy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetMatchPolicy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_asset_match_policy(asset_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assets/{assetId}/matchPolicy', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetMatchPolicy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetMatchPolicy
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the asset's match policy. If an asset has multiple owners, each owner
        # may set its own match policy for the asset. YouTube then computes the match
        # policy that is actually applied for the asset based on the territories where
        # each owner owns the asset. This method supports patch semantics.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving the match policy.
        # @param [Google::Apis::YoutubePartnerV1::AssetMatchPolicy] asset_match_policy_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetMatchPolicy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetMatchPolicy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_asset_match_policy(asset_id, asset_match_policy_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'assets/{assetId}/matchPolicy', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::AssetMatchPolicy::Representation
          command.request_object = asset_match_policy_object
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetMatchPolicy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetMatchPolicy
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the asset's match policy. If an asset has multiple owners, each owner
        # may set its own match policy for the asset. YouTube then computes the match
        # policy that is actually applied for the asset based on the territories where
        # each owner owns the asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving the match policy.
        # @param [Google::Apis::YoutubePartnerV1::AssetMatchPolicy] asset_match_policy_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetMatchPolicy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetMatchPolicy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_asset_match_policy(asset_id, asset_match_policy_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'assets/{assetId}/matchPolicy', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::AssetMatchPolicy::Representation
          command.request_object = asset_match_policy_object
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetMatchPolicy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetMatchPolicy
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a relationship between two assets.
        # @param [String] asset_relationship_id
        #   The assetRelationshipId parameter specifies a value that uniquely identifies
        #   the relationship you are deleting.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_asset_relationship(asset_relationship_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'assetRelationships/{assetRelationshipId}', options)
          command.params['assetRelationshipId'] = asset_relationship_id unless asset_relationship_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a relationship that links two assets.
        # @param [Google::Apis::YoutubePartnerV1::AssetRelationship] asset_relationship_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetRelationship] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetRelationship]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_asset_relationship(asset_relationship_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'assetRelationships', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::AssetRelationship::Representation
          command.request_object = asset_relationship_object
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetRelationship::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetRelationship
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of relationships for a given asset. The list contains
        # relationships where the specified asset is either the parent (embedding) or
        # child (embedded) asset in the relationship.
        # @param [String] asset_id
        #   The assetId parameter specifies the asset ID of the asset for which you are
        #   retrieving relationships.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of search results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetRelationshipListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetRelationshipListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_asset_relationships(asset_id, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assetRelationships', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetRelationshipListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetRelationshipListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for assets based on asset metadata. The method can retrieve all
        # assets or only assets owned by the content owner. This method mimics the
        # functionality of the advanced search feature on the Assets page in CMS.
        # @param [DateTime] created_after
        #   The createdAfter parameter restricts the set of returned assets to ones
        #   originally created on or after the specified datetime. For example: 2015-01-
        #   29T23:00:00Z
        # @param [DateTime] created_before
        #   The createdBefore parameter restricts the set of returned assets to ones
        #   originally created on or before the specified datetime. For example: 2015-01-
        #   29T23:00:00Z
        # @param [Boolean] has_conflicts
        #   The hasConflicts parameter enables you to only retrieve assets that have
        #   ownership conflicts. The only valid value is true. Setting the parameter value
        #   to false does not affect the results.
        # @param [Boolean] include_any_providedlabel
        #   If includeAnyProvidedlabel parameter is set to true, will search for assets
        #   that contain any of the provided labels; else will search for assets that
        #   contain all the provided labels.
        # @param [String] isrcs
        #   A comma-separated list of up to 50 ISRCs. If you specify a value for this
        #   parameter, the API server ignores any values set for the following parameters:
        #   q, includeAnyProvidedLabel, hasConflicts, labels, metadataSearchFields, sort,
        #   and type.
        # @param [String] labels
        #   The labels parameter specifies the assets with certain asset labels that you
        #   want to retrieve. The parameter value is a comma-separated list of asset
        #   labels.
        # @param [String] metadata_search_fields
        #   The metadataSearchField parameter specifies which metadata fields to search by.
        #   It is a comma-separated list of metadata field and value pairs connected by
        #   colon(:). For example: customId:my_custom_id,artist:Dandexx
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] ownership_restriction
        #   The ownershipRestriction parameter specifies the ownership filtering option
        #   for the search. By default the search is performed in the assets owned by
        #   currently authenticated user only.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of search results.
        # @param [String] q
        #   YouTube searches within the id, type, and customId fields for all assets as
        #   well as in numerous other metadata fields – such as actor, album, director,
        #   isrc, and tmsId – that vary for different types of assets (movies, music
        #   videos, etc.).
        # @param [String] sort
        #   The sort parameter specifies how the search results should be sorted. Note
        #   that results are always sorted in descending order.
        # @param [String] type
        #   The type parameter specifies the types of assets that you want to retrieve.
        #   The parameter value is a comma-separated list of asset types.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetSearchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetSearchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_asset_searches(created_after: nil, created_before: nil, has_conflicts: nil, include_any_providedlabel: nil, isrcs: nil, labels: nil, metadata_search_fields: nil, on_behalf_of_content_owner: nil, ownership_restriction: nil, page_token: nil, q: nil, sort: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assetSearch', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetSearchResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetSearchResponse
          command.query['createdAfter'] = created_after unless created_after.nil?
          command.query['createdBefore'] = created_before unless created_before.nil?
          command.query['hasConflicts'] = has_conflicts unless has_conflicts.nil?
          command.query['includeAnyProvidedlabel'] = include_any_providedlabel unless include_any_providedlabel.nil?
          command.query['isrcs'] = isrcs unless isrcs.nil?
          command.query['labels'] = labels unless labels.nil?
          command.query['metadataSearchFields'] = metadata_search_fields unless metadata_search_fields.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['ownershipRestriction'] = ownership_restriction unless ownership_restriction.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['type'] = type unless type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # This method either retrieves a list of asset shares the partner owns and that
        # map to a specified asset view ID or it retrieves a list of asset views
        # associated with a specified asset share ID owned by the partner.
        # @param [String] asset_id
        #   The assetId parameter specifies the asset ID for which you are retrieving data.
        #   The parameter can be an asset view ID or an asset share ID.
        #   - If the value is an asset view ID, the API response identifies any asset
        #   share ids mapped to the asset view.
        #   - If the value is an asset share ID, the API response identifies any asset
        #   view ids that maps to that asset share.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of search results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetShareListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetShareListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_asset_shares(asset_id, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assetShares', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetShareListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetShareListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the metadata for the specified asset. Note that if the request
        # identifies an asset that has been merged with another asset, meaning that
        # YouTube identified the requested asset as a duplicate, then the request
        # retrieves the merged, or synthesized, asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset being
        #   retrieved.
        # @param [String] fetch_match_policy
        #   The fetchMatchPolicy parameter specifies the version of the asset's match
        #   policy that should be returned in the API response.
        # @param [String] fetch_metadata
        #   The fetchMetadata parameter specifies the version of the asset's metadata that
        #   should be returned in the API response. In some cases, YouTube receives
        #   metadata for an asset from multiple sources, such as when different partners
        #   own the asset in different territories.
        # @param [String] fetch_ownership
        #   The fetchOwnership parameter specifies the version of the asset's ownership
        #   data that should be returned in the API response. As with asset metadata,
        #   YouTube can receive asset ownership data from multiple sources.
        # @param [Boolean] fetch_ownership_conflicts
        #   The fetchOwnershipConflicts parameter allows you to retrieve information about
        #   ownership conflicts.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Asset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Asset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_asset(asset_id, fetch_match_policy: nil, fetch_metadata: nil, fetch_ownership: nil, fetch_ownership_conflicts: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assets/{assetId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Asset
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['fetchMatchPolicy'] = fetch_match_policy unless fetch_match_policy.nil?
          command.query['fetchMetadata'] = fetch_metadata unless fetch_metadata.nil?
          command.query['fetchOwnership'] = fetch_ownership unless fetch_ownership.nil?
          command.query['fetchOwnershipConflicts'] = fetch_ownership_conflicts unless fetch_ownership_conflicts.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts an asset with the specified metadata. After inserting an asset, you
        # can set its ownership data and match policy.
        # @param [Google::Apis::YoutubePartnerV1::Asset] asset_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Asset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Asset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_asset(asset_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'assets', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.request_object = asset_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Asset
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of assets based on asset metadata. The method can retrieve
        # all assets or only assets owned by the content owner.
        # Note that in cases where duplicate assets have been merged, the API response
        # only contains the synthesized asset. (It does not contain the constituent
        # assets that were merged into the synthesized asset.)
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube Asset IDs that
        #   identify the assets you want to retrieve. As noted in the method description,
        #   if you try to retrieve an asset that YouTube identified as a duplicate and
        #   merged with another asset, the API response only returns the synthesized asset.
        #   In that case, the aliasId property in the asset resource specifies a list of
        #   other asset IDs that can be used to identify that asset.
        #   Also note that the API response does not contain duplicates. As such, if your
        #   request identifies three asset IDs, and all of those have been merged into a
        #   single asset, then the API response identifies one matching asset.
        # @param [String] fetch_match_policy
        #   The fetchMatchPolicy parameter specifies the version of the asset's match
        #   policy that should be returned in the API response.
        # @param [String] fetch_metadata
        #   The fetchMetadata parameter specifies the version of the asset's metadata that
        #   should be returned in the API response. In some cases, YouTube receives
        #   metadata for an asset from multiple sources, such as when different partners
        #   own the asset in different territories.
        # @param [String] fetch_ownership
        #   The fetchOwnership parameter specifies the version of the asset's ownership
        #   data that should be returned in the API response. As with asset metadata,
        #   YouTube can receive asset ownership data from multiple sources.
        # @param [Boolean] fetch_ownership_conflicts
        #   The fetchOwnershipConflicts parameter allows you to retrieve information about
        #   ownership conflicts.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::AssetListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::AssetListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_assets(id, fetch_match_policy: nil, fetch_metadata: nil, fetch_ownership: nil, fetch_ownership_conflicts: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assets', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::AssetListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::AssetListResponse
          command.query['fetchMatchPolicy'] = fetch_match_policy unless fetch_match_policy.nil?
          command.query['fetchMetadata'] = fetch_metadata unless fetch_metadata.nil?
          command.query['fetchOwnership'] = fetch_ownership unless fetch_ownership.nil?
          command.query['fetchOwnershipConflicts'] = fetch_ownership_conflicts unless fetch_ownership_conflicts.nil?
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Patches the metadata for the specified asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset being
        #   patched.
        # @param [Google::Apis::YoutubePartnerV1::Asset] asset_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Asset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Asset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_asset(asset_id, asset_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'assets/{assetId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.request_object = asset_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Asset
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the metadata for the specified asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset being
        #   updated.
        # @param [Google::Apis::YoutubePartnerV1::Asset] asset_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Asset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Asset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_asset(asset_id, asset_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'assets/{assetId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.request_object = asset_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Asset::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Asset
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a specified campaign for an owner.
        # @param [String] campaign_id
        #   The campaignId parameter specifies the YouTube campaign ID of the campaign
        #   being deleted.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_campaign(campaign_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'campaigns/{campaignId}', options)
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a particular campaign for an owner.
        # @param [String] campaign_id
        #   The campaignId parameter specifies the YouTube campaign ID of the campaign
        #   being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_campaign(campaign_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'campaigns/{campaignId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Campaign
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Insert a new campaign for an owner using the specified campaign data.
        # @param [Google::Apis::YoutubePartnerV1::Campaign] campaign_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_campaign(campaign_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'campaigns', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Campaign
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of campaigns for an owner.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. For example, set this parameter to the value of the
        #   nextPageToken value from the previous API response to retrieve the next page
        #   of search results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::CampaignList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::CampaignList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_campaigns(on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'campaigns', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::CampaignList::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::CampaignList
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the data for a specific campaign. This method supports patch semantics.
        # @param [String] campaign_id
        #   The campaignId parameter specifies the YouTube campaign ID of the campaign
        #   being retrieved.
        # @param [Google::Apis::YoutubePartnerV1::Campaign] campaign_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_campaign(campaign_id, campaign_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'campaigns/{campaignId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Campaign
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the data for a specific campaign.
        # @param [String] campaign_id
        #   The campaignId parameter specifies the YouTube campaign ID of the campaign
        #   being retrieved.
        # @param [Google::Apis::YoutubePartnerV1::Campaign] campaign_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Campaign] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Campaign]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_campaign(campaign_id, campaign_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'campaigns/{campaignId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.request_object = campaign_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Campaign::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Campaign
          command.params['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the claim history for a specified claim.
        # @param [String] claim_id
        #   The claimId parameter specifies the YouTube claim ID of the claim for which
        #   you are retrieving the claim history.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ClaimHistory] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ClaimHistory]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_claim_history(claim_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'claimHistory/{claimId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ClaimHistory::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ClaimHistory
          command.params['claimId'] = claim_id unless claim_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of claims that match the search criteria. You can search for
        # claims that are associated with a specific asset or video or that match a
        # specified query string.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving claims.
        # @param [String] content_type
        #   The contentType parameter specifies the content type of claims that you want
        #   to retrieve.
        # @param [DateTime] created_after
        #   The createdAfter parameter allows you to restrict the set of returned claims
        #   to ones created on or after the specified date (inclusive).
        # @param [DateTime] created_before
        #   The createdBefore parameter allows you to restrict the set of returned claims
        #   to ones created before the specified date (exclusive).
        # @param [String] inactive_reasons
        #   The inactiveReasons parameter allows you to specify what kind of inactive
        #   claims you want to find based on the reasons why the claims became inactive.
        # @param [Boolean] include_third_party_claims
        #   Used along with the videoId parameter this parameter determines whether or not
        #   to include third party claims in the search results.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] origin
        #   The origin parameter specifies the origins you want to find claims for. It is
        #   a comma-separated list of origin values.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. For example, set this parameter to the value of the
        #   nextPageToken value from the previous API response to retrieve the next page
        #   of search results.
        # @param [Boolean] partner_uploaded
        #   The partnerUploaded parameter specifies whether you want to filter your search
        #   results to only partner uploaded or non partner uploaded claims.
        # @param [String] q
        #   The q parameter specifies the query string to use to filter search results.
        #   YouTube searches for the query string in the following claim fields:
        #   video_title, video_keywords, user_name, isrc, iswc, grid, custom_id, and in
        #   the content owner's email address.
        # @param [String] reference_id
        #   The referenceId parameter specifies the YouTube reference ID of the reference
        #   for which you are retrieving claims.
        # @param [String] sort
        #   The sort parameter specifies the method that will be used to order resources
        #   in the API response. The default value is date. However, if the status
        #   parameter value is either appealed, disputed, pending, potential, or
        #   routedForReview, then results will be sorted by the time that the claim review
        #   period expires.
        # @param [String] status
        #   The status parameter restricts your results to only claims in the specified
        #   status.
        # @param [DateTime] status_modified_after
        #   The statusModifiedAfter parameter allows you to restrict the result set to
        #   only include claims that have had their status modified on or after the
        #   specified date (inclusive). The date specified must be on or after June 30,
        #   2016 (2016-06-30). The parameter value's format is YYYY-MM-DD.
        # @param [DateTime] status_modified_before
        #   The statusModifiedBefore parameter allows you to restrict the result set to
        #   only include claims that have had their status modified before the specified
        #   date (exclusive). The date specified must be on or after July 1, 2016 (2016-07-
        #   01). The parameter value's format is YYYY-MM-DD.
        # @param [String] video_id
        #   The videoId parameter specifies comma-separated list of YouTube video IDs for
        #   which you are retrieving claims.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ClaimSearchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ClaimSearchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_claim_searches(asset_id: nil, content_type: nil, created_after: nil, created_before: nil, inactive_reasons: nil, include_third_party_claims: nil, on_behalf_of_content_owner: nil, origin: nil, page_token: nil, partner_uploaded: nil, q: nil, reference_id: nil, sort: nil, status: nil, status_modified_after: nil, status_modified_before: nil, video_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'claimSearch', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ClaimSearchResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ClaimSearchResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['contentType'] = content_type unless content_type.nil?
          command.query['createdAfter'] = created_after unless created_after.nil?
          command.query['createdBefore'] = created_before unless created_before.nil?
          command.query['inactiveReasons'] = inactive_reasons unless inactive_reasons.nil?
          command.query['includeThirdPartyClaims'] = include_third_party_claims unless include_third_party_claims.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['origin'] = origin unless origin.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['partnerUploaded'] = partner_uploaded unless partner_uploaded.nil?
          command.query['q'] = q unless q.nil?
          command.query['referenceId'] = reference_id unless reference_id.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['status'] = status unless status.nil?
          command.query['statusModifiedAfter'] = status_modified_after unless status_modified_after.nil?
          command.query['statusModifiedBefore'] = status_modified_before unless status_modified_before.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific claim by ID.
        # @param [String] claim_id
        #   The claimId parameter specifies the claim ID of the claim being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Claim] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Claim]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_claim(claim_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'claims/{claimId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Claim
          command.params['claimId'] = claim_id unless claim_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a claim. The video being claimed must have been uploaded to a channel
        # associated with the same content owner as the API user sending the request.
        # You can set the claim's policy in any of the following ways:
        # - Use the claim resource's policy property to identify a saved policy by its
        # unique ID.
        # - Use the claim resource's policy property to specify a custom set of rules.
        # @param [Google::Apis::YoutubePartnerV1::Claim] claim_object
        # @param [Boolean] is_manual_claim
        #   restricted
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Claim] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Claim]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_claim(claim_object = nil, is_manual_claim: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'claims', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.request_object = claim_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Claim
          command.query['isManualClaim'] = is_manual_claim unless is_manual_claim.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of claims administered by the content owner associated with
        # the currently authenticated user. Results are sorted in descending order of
        # creation time.
        # @param [String] asset_id
        #   Use the claimSearch.list method's assetId parameter to search for claim
        #   snippets by asset ID. You can then retrieve the claim resources for those
        #   claims by using this method's id parameter to specify a comma-separated list
        #   of claim IDs.
        # @param [String] id
        #   The id parameter specifies a list of comma-separated YouTube claim IDs to
        #   retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. For example, set this parameter to the value of the
        #   nextPageToken value from the previous API response to retrieve the next page
        #   of search results.
        # @param [String] q
        #   Use the claimSearch.list method's q parameter to search for claim snippets
        #   that match a particular query string. You can then retrieve the claim
        #   resources for those claims by using this method's id parameter to specify a
        #   comma-separated list of claim IDs.
        # @param [String] video_id
        #   Use the claimSearch.list method's videoId parameter to search for claim
        #   snippets by video ID. You can then retrieve the claim resources for those
        #   claims by using this method's id parameter to specify a comma-separated list
        #   of claim IDs.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ClaimListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ClaimListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_claims(asset_id: nil, id: nil, on_behalf_of_content_owner: nil, page_token: nil, q: nil, video_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'claims', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ClaimListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ClaimListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Patches an existing claim by either changing its policy or its status. You can
        # update a claim's status from active to inactive to effectively release the
        # claim.
        # @param [String] claim_id
        #   The claimId parameter specifies the claim ID of the claim being updated.
        # @param [Google::Apis::YoutubePartnerV1::Claim] claim_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Claim] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Claim]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_claim(claim_id, claim_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'claims/{claimId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.request_object = claim_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Claim
          command.params['claimId'] = claim_id unless claim_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing claim by either changing its policy or its status. You can
        # update a claim's status from active to inactive to effectively release the
        # claim.
        # @param [String] claim_id
        #   The claimId parameter specifies the claim ID of the claim being updated.
        # @param [Google::Apis::YoutubePartnerV1::Claim] claim_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Claim] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Claim]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_claim(claim_id, claim_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'claims/{claimId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.request_object = claim_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Claim::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Claim
          command.params['claimId'] = claim_id unless claim_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves advertising options for the content owner associated with the
        # authenticated user.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_content_owner_advertising_option(on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'contentOwnerAdvertisingOptions', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates advertising options for the content owner associated with the
        # authenticated API user. This method supports patch semantics.
        # @param [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption] content_owner_advertising_option_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_content_owner_advertising_option(content_owner_advertising_option_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'contentOwnerAdvertisingOptions', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption::Representation
          command.request_object = content_owner_advertising_option_object
          command.response_representation = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates advertising options for the content owner associated with the
        # authenticated API user.
        # @param [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption] content_owner_advertising_option_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_content_owner_advertising_option(content_owner_advertising_option_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'contentOwnerAdvertisingOptions', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption::Representation
          command.request_object = content_owner_advertising_option_object
          command.response_representation = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ContentOwnerAdvertisingOption
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves information about the specified content owner.
        # @param [String] content_owner_id
        #   The contentOwnerId parameter specifies a value that uniquely identifies the
        #   content owner.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ContentOwner] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ContentOwner]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_content_owner(content_owner_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'contentOwners/{contentOwnerId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ContentOwner::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ContentOwner
          command.params['contentOwnerId'] = content_owner_id unless content_owner_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of content owners that match the request criteria.
        # @param [Boolean] fetch_mine
        #   The fetchMine parameter restricts the result set to content owners associated
        #   with the currently authenticated API user.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube content owner IDs
        #   to retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ContentOwnerListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ContentOwnerListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_content_owners(fetch_mine: nil, id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'contentOwners', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ContentOwnerListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ContentOwnerListResponse
          command.query['fetchMine'] = fetch_mine unless fetch_mine.nil?
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a cuepoint into a live broadcast.
        # @param [String] channel_id
        #   The channelId parameter identifies the channel that owns the broadcast into
        #   which the cuepoint is being inserted.
        # @param [Google::Apis::YoutubePartnerV1::LiveCuepoint] live_cuepoint_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners. You can obtain the content owner ID
        #   that will serve as the parameter value by calling the YouTube Content ID API's
        #   contentOwners.list method.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::LiveCuepoint] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::LiveCuepoint]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_live_cuepoint(channel_id, live_cuepoint_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'liveCuepoints', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::LiveCuepoint::Representation
          command.request_object = live_cuepoint_object
          command.response_representation = Google::Apis::YoutubePartnerV1::LiveCuepoint::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::LiveCuepoint
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of all metadata provided for an asset, regardless of which
        # content owner provided the data.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving a metadata history.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::MetadataHistoryListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::MetadataHistoryListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_metadata_histories(asset_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'metadataHistory', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::MetadataHistoryListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::MetadataHistoryListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete an order, which moves orders to inactive state and removes any
        # associated video.
        # @param [String] order_id
        #   Id of the order to delete.
        # @param [String] on_behalf_of_content_owner
        #   ContentOwnerId that super admin acts in behalf of.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_order(order_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'orders/{orderId}', options)
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve the details of an existing order.
        # @param [String] order_id
        #   The id of the order.
        # @param [String] on_behalf_of_content_owner
        #   ContentOnwerId that super admin acts in behalf of.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_order(order_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'orders/{orderId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Order
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new basic order entry in the YouTube premium asset order management
        # system. You must supply at least a country and channel in the new order.
        # @param [Google::Apis::YoutubePartnerV1::Order] order_object
        # @param [String] on_behalf_of_content_owner
        #   ContentOnwerId that super admin acts in behalf of.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_order(order_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'orders', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.request_object = order_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Order
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a list of orders, filtered by the parameters below, may return more
        # than a single page of results.
        # @param [String] channel_id
        #   Filter results to only a specific channel ( use encrypted ID).
        # @param [String] content_type
        #   Filter the results by type, possible values are SHOW or MOVIE.
        # @param [String] country
        #   Filter results by country, two letter ISO country codes are used.
        # @param [String] custom_id
        #   Filter result by orders that have this custom ID.
        # @param [String] on_behalf_of_content_owner
        #   ContentOnwerId that super admin acts in behalf of.
        # @param [String] page_token
        #   The continuation token is an optional value that is only used to page through
        #   large result sets.
        #   - To retrieve the next page of results for a request, set this parameter to
        #   the value of the nextPageToken value from the previous response.
        #   - To get the previous page of results, set this parameter to the value of the
        #   previousPageToken value from the previous response.
        # @param [String] priority
        #   Filter results by priority. P0, P1, P2, P3 and P4 are the acceptable options.
        # @param [String] production_house
        #   Filter results by a particular production house. Specified by the name of the
        #   production house.
        # @param [String] q
        #   Filter results to only orders that contain this string in the title.
        # @param [String] status
        #   Filter results to have this status, available options are STATUS_AVAILED,
        #   STATUS_ORDERED, STATUS_RECEIVED, STATUS_READY_FOR_QC, STATUS_MOC_FIX,
        #   STATUS_PARTNER_FIX, STATUS_YOUTUBE_FIX, STATUS_QC_APPROVED, STATUS_INACTIVE,
        #   STATUS_INGESTION_COMPLETE, STATUS_REORDERED
        # @param [String] video_id
        #   Filter results to orders that are associated with this YouTube external video
        #   id.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::OrderListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::OrderListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_orders(channel_id: nil, content_type: nil, country: nil, custom_id: nil, on_behalf_of_content_owner: nil, page_token: nil, priority: nil, production_house: nil, q: nil, status: nil, video_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'orders', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::OrderListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::OrderListResponse
          command.query['channelId'] = channel_id unless channel_id.nil?
          command.query['contentType'] = content_type unless content_type.nil?
          command.query['country'] = country unless country.nil?
          command.query['customId'] = custom_id unless custom_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['priority'] = priority unless priority.nil?
          command.query['productionHouse'] = production_house unless production_house.nil?
          command.query['q'] = q unless q.nil?
          command.query['status'] = status unless status.nil?
          command.query['videoId'] = video_id unless video_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the values in an existing order. This method supports patch semantics.
        # @param [String] order_id
        #   The id of the order.
        # @param [Google::Apis::YoutubePartnerV1::Order] order_object
        # @param [String] on_behalf_of_content_owner
        #   ContentOwnerId that super admin acts in behalf of.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_order(order_id, order_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'orders/{orderId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.request_object = order_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Order
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update the values in an existing order.
        # @param [String] order_id
        #   The id of the order.
        # @param [Google::Apis::YoutubePartnerV1::Order] order_object
        # @param [String] on_behalf_of_content_owner
        #   ContentOwnerId that super admin acts in behalf of.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Order] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Order]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_order(order_id, order_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'orders/{orderId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.request_object = order_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Order::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Order
          command.params['orderId'] = order_id unless order_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the ownership data provided for the specified asset by the content
        # owner associated with the authenticated user.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID for which you are
        #   retrieving ownership data.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::RightsOwnership] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::RightsOwnership]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ownership(asset_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'assets/{assetId}/ownership', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::RightsOwnership::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::RightsOwnership
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides new ownership information for the specified asset. Note that YouTube
        # may receive ownership information from multiple sources. For example, if an
        # asset has multiple owners, each owner might send ownership data for the asset.
        # YouTube algorithmically combines the ownership data received from all of those
        # sources to generate the asset's canonical ownership data, which should provide
        # the most comprehensive and accurate representation of the asset's ownership.
        # This method supports patch semantics.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset being
        #   updated.
        # @param [Google::Apis::YoutubePartnerV1::RightsOwnership] rights_ownership_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::RightsOwnership] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::RightsOwnership]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_ownership(asset_id, rights_ownership_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'assets/{assetId}/ownership', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::RightsOwnership::Representation
          command.request_object = rights_ownership_object
          command.response_representation = Google::Apis::YoutubePartnerV1::RightsOwnership::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::RightsOwnership
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides new ownership information for the specified asset. Note that YouTube
        # may receive ownership information from multiple sources. For example, if an
        # asset has multiple owners, each owner might send ownership data for the asset.
        # YouTube algorithmically combines the ownership data received from all of those
        # sources to generate the asset's canonical ownership data, which should provide
        # the most comprehensive and accurate representation of the asset's ownership.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset being
        #   updated.
        # @param [Google::Apis::YoutubePartnerV1::RightsOwnership] rights_ownership_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::RightsOwnership] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::RightsOwnership]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_ownership(asset_id, rights_ownership_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'assets/{assetId}/ownership', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::RightsOwnership::Representation
          command.request_object = rights_ownership_object
          command.response_representation = Google::Apis::YoutubePartnerV1::RightsOwnership::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::RightsOwnership
          command.params['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of the ownership data for an asset, regardless of which
        # content owner provided the data. The list only includes the most recent
        # ownership data for each content owner. However, if the content owner has
        # submitted ownership data through multiple data sources (API, content feeds,
        # etc.), the list will contain the most recent data for each content owner and
        # data source.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving an ownership data history.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::OwnershipHistoryListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::OwnershipHistoryListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_ownership_histories(asset_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'ownershipHistory', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::OwnershipHistoryListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::OwnershipHistoryListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves information for the specified package.
        # @param [String] package_id
        #   The packageId parameter specifies the Content Delivery package ID of the
        #   package being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Package] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Package]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_package(package_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'package/{packageId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Package::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Package
          command.params['packageId'] = package_id unless package_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a metadata-only package.
        # @param [Google::Apis::YoutubePartnerV1::Package] package_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::PackageInsertResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::PackageInsertResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_package(package_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'package', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Package::Representation
          command.request_object = package_object
          command.response_representation = Google::Apis::YoutubePartnerV1::PackageInsertResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::PackageInsertResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the specified saved policy.
        # @param [String] policy_id
        #   The policyId parameter specifies a value that uniquely identifies the policy
        #   being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_policy(policy_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'policies/{policyId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Policy
          command.params['policyId'] = policy_id unless policy_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a saved policy.
        # @param [Google::Apis::YoutubePartnerV1::Policy] policy_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_policy(policy_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'policies', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Policy
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of the content owner's saved policies.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of saved policy IDs to
        #   retrieve. Only policies belonging to the currently authenticated content owner
        #   will be available.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] sort
        #   The sort parameter specifies how the search results should be sorted.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::PolicyList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::PolicyList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_policies(id: nil, on_behalf_of_content_owner: nil, sort: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'policies', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::PolicyList::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::PolicyList
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified saved policy. This method supports patch semantics.
        # @param [String] policy_id
        #   The policyId parameter specifies a value that uniquely identifies the policy
        #   being updated.
        # @param [Google::Apis::YoutubePartnerV1::Policy] policy_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_policy(policy_id, policy_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'policies/{policyId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Policy
          command.params['policyId'] = policy_id unless policy_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified saved policy.
        # @param [String] policy_id
        #   The policyId parameter specifies a value that uniquely identifies the policy
        #   being updated.
        # @param [Google::Apis::YoutubePartnerV1::Policy] policy_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_policy(policy_id, policy_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'policies/{policyId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Policy::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Policy
          command.params['policyId'] = policy_id unless policy_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves information about the specified reference conflict.
        # @param [String] reference_conflict_id
        #   The referenceConflictId parameter specifies the YouTube reference conflict ID
        #   of the reference conflict being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ReferenceConflict] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ReferenceConflict]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_reference_conflict(reference_conflict_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'referenceConflicts/{referenceConflictId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ReferenceConflict::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ReferenceConflict
          command.params['referenceConflictId'] = reference_conflict_id unless reference_conflict_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of unresolved reference conflicts.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of search results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ReferenceConflictListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ReferenceConflictListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_reference_conflicts(on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'referenceConflicts', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ReferenceConflictListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ReferenceConflictListResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves information about the specified reference.
        # @param [String] reference_id
        #   The referenceId parameter specifies the YouTube reference ID of the reference
        #   being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Reference] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Reference]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_reference(reference_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'references/{referenceId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Reference
          command.params['referenceId'] = reference_id unless reference_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a reference in one of the following ways:
        # - If your request is uploading a reference file, YouTube creates the reference
        # from the provided content. You can provide either a video/audio file or a pre-
        # generated fingerprint. If you are providing a pre-generated fingerprint, set
        # the reference resource's fpDirect property to true in the request body. In
        # this flow, you can use either the multipart or resumable upload flows to
        # provide the reference content.
        # - If you want to create a reference using a claimed video as the reference
        # content, use the claimId parameter to identify the claim.
        # @param [Google::Apis::YoutubePartnerV1::Reference] reference_object
        # @param [String] claim_id
        #   The claimId parameter specifies the YouTube claim ID of an existing claim from
        #   which a reference should be created. (The claimed video is used as the
        #   reference content.)
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Reference] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Reference]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_reference(reference_object = nil, claim_id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'references', options)
          else
            command = make_upload_command(:post, 'references', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.request_object = reference_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Reference
          command.query['claimId'] = claim_id unless claim_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of references by ID or the list of references for the
        # specified asset.
        # @param [String] asset_id
        #   The assetId parameter specifies the YouTube asset ID of the asset for which
        #   you are retrieving references.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube reference IDs to
        #   retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of search results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ReferenceListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ReferenceListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_references(asset_id: nil, id: nil, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'references', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::ReferenceListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ReferenceListResponse
          command.query['assetId'] = asset_id unless asset_id.nil?
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a reference. This method supports patch semantics.
        # @param [String] reference_id
        #   The referenceId parameter specifies the YouTube reference ID of the reference
        #   being updated.
        # @param [Google::Apis::YoutubePartnerV1::Reference] reference_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [Boolean] release_claims
        #   The releaseClaims parameter indicates that you want to release all match
        #   claims associated with this reference. This parameter only works when the
        #   claim's status is being updated to 'inactive' - you can then set the parameter'
        #   s value to true to release all match claims produced by this reference.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Reference] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Reference]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_reference(reference_id, reference_object = nil, on_behalf_of_content_owner: nil, release_claims: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'references/{referenceId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.request_object = reference_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Reference
          command.params['referenceId'] = reference_id unless reference_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['releaseClaims'] = release_claims unless release_claims.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a reference.
        # @param [String] reference_id
        #   The referenceId parameter specifies the YouTube reference ID of the reference
        #   being updated.
        # @param [Google::Apis::YoutubePartnerV1::Reference] reference_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [Boolean] release_claims
        #   The releaseClaims parameter indicates that you want to release all match
        #   claims associated with this reference. This parameter only works when the
        #   claim's status is being updated to 'inactive' - you can then set the parameter'
        #   s value to true to release all match claims produced by this reference.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Reference] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Reference]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_reference(reference_id, reference_object = nil, on_behalf_of_content_owner: nil, release_claims: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'references/{referenceId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.request_object = reference_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Reference::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Reference
          command.params['referenceId'] = reference_id unless reference_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['releaseClaims'] = release_claims unless release_claims.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of spreadsheet templates for a content owner.
        # @param [String] locale
        #   The locale parameter identifies the desired language for templates in the API
        #   response. The value is a string that contains a BCP-47 language code. The
        #   default value is en.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::SpreadsheetTemplateListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::SpreadsheetTemplateListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_spreadsheet_templates(locale: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'spreadsheetTemplate', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::SpreadsheetTemplateListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::SpreadsheetTemplateListResponse
          command.query['locale'] = locale unless locale.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of uploaders for a content owner.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::UploaderListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::UploaderListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_uploaders(on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'uploader', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::UploaderListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::UploaderListResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Validate a metadata file.
        # @param [Google::Apis::YoutubePartnerV1::ValidateRequest] validate_request_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ValidateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ValidateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def validate_validator(validate_request_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'validator', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::ValidateRequest::Representation
          command.request_object = validate_request_object
          command.response_representation = Google::Apis::YoutubePartnerV1::ValidateResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ValidateResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Validate a metadata file asynchronously.
        # @param [Google::Apis::YoutubePartnerV1::ValidateAsyncRequest] validate_async_request_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ValidateAsyncResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ValidateAsyncResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def validate_validator_async(validate_async_request_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'validatorAsync', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::ValidateAsyncRequest::Representation
          command.request_object = validate_async_request_object
          command.response_representation = Google::Apis::YoutubePartnerV1::ValidateAsyncResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ValidateAsyncResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the asynchronous validation status.
        # @param [Google::Apis::YoutubePartnerV1::ValidateStatusRequest] validate_status_request_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::ValidateStatusResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::ValidateStatusResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def validate_validator_async_status(validate_status_request_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'validatorAsyncStatus', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::ValidateStatusRequest::Representation
          command.request_object = validate_status_request_object
          command.response_representation = Google::Apis::YoutubePartnerV1::ValidateStatusResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::ValidateStatusResponse
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves advertising settings for the specified video.
        # @param [String] video_id
        #   The videoId parameter specifies the YouTube video ID of the video for which
        #   you are retrieving advertising settings.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_video_advertising_option(video_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videoAdvertisingOptions/{videoId}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption
          command.params['videoId'] = video_id unless video_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves details about the types of allowed ads for a specified partner- or
        # user-uploaded video.
        # @param [String] video_id
        #   The videoId parameter specifies the YouTube video ID of the video for which
        #   you are retrieving advertising options.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::VideoAdvertisingOptionGetEnabledAdsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::VideoAdvertisingOptionGetEnabledAdsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_video_advertising_option_enabled_ads(video_id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'videoAdvertisingOptions/{videoId}/getEnabledAds', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOptionGetEnabledAdsResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::VideoAdvertisingOptionGetEnabledAdsResponse
          command.params['videoId'] = video_id unless video_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the advertising settings for the specified video. This method supports
        # patch semantics.
        # @param [String] video_id
        #   The videoId parameter specifies the YouTube video ID of the video for which
        #   you are updating advertising settings.
        # @param [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption] video_advertising_option_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_video_advertising_option(video_id, video_advertising_option_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'videoAdvertisingOptions/{videoId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption::Representation
          command.request_object = video_advertising_option_object
          command.response_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption
          command.params['videoId'] = video_id unless video_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the advertising settings for the specified video.
        # @param [String] video_id
        #   The videoId parameter specifies the YouTube video ID of the video for which
        #   you are updating advertising settings.
        # @param [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption] video_advertising_option_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::VideoAdvertisingOption]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_video_advertising_option(video_id, video_advertising_option_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'videoAdvertisingOptions/{videoId}', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption::Representation
          command.request_object = video_advertising_option_object
          command.response_representation = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::VideoAdvertisingOption
          command.params['videoId'] = video_id unless video_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a whitelisted channel for a content owner.
        # @param [String] id
        #   The id parameter specifies the YouTube channel ID of the channel being removed
        #   from whitelist.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_whitelist(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'whitelists/{id}', options)
          command.params['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific whitelisted channel by ID.
        # @param [String] id
        #   The id parameter specifies the YouTube channel ID of the whitelisted channel
        #   being retrieved.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Whitelist] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Whitelist]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_whitelist(id, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'whitelists/{id}', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::Whitelist::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Whitelist
          command.params['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Whitelist a YouTube channel for your content owner. Whitelisted channels are
        # channels that are not owned or managed by you, but you would like to whitelist
        # so that no claims from your assets are placed on videos uploaded to these
        # channels.
        # @param [Google::Apis::YoutubePartnerV1::Whitelist] whitelist_object
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::Whitelist] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::Whitelist]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_whitelist(whitelist_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'whitelists', options)
          command.request_representation = Google::Apis::YoutubePartnerV1::Whitelist::Representation
          command.request_object = whitelist_object
          command.response_representation = Google::Apis::YoutubePartnerV1::Whitelist::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::Whitelist
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of whitelisted channels for a content owner.
        # @param [String] id
        #   The id parameter specifies a comma-separated list of YouTube channel IDs that
        #   identify the whitelisted channels you want to retrieve.
        # @param [String] on_behalf_of_content_owner
        #   The onBehalfOfContentOwner parameter identifies the content owner that the
        #   user is acting on behalf of. This parameter supports users whose accounts are
        #   associated with multiple content owners.
        # @param [String] page_token
        #   The pageToken parameter specifies a token that identifies a particular page of
        #   results to return. Set this parameter to the value of the nextPageToken value
        #   from the previous API response to retrieve the next page of results.
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
        # @yieldparam result [Google::Apis::YoutubePartnerV1::WhitelistListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubePartnerV1::WhitelistListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_whitelists(id: nil, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'whitelists', options)
          command.response_representation = Google::Apis::YoutubePartnerV1::WhitelistListResponse::Representation
          command.response_class = Google::Apis::YoutubePartnerV1::WhitelistListResponse
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
