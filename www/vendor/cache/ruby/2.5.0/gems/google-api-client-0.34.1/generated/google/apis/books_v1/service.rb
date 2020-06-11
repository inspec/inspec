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
    module BooksV1
      # Books API
      #
      # Searches for books and manages your Google Books library.
      #
      # @example
      #    require 'google/apis/books_v1'
      #
      #    Books = Google::Apis::BooksV1 # Alias the module
      #    service = Books::BooksService.new
      #
      # @see https://developers.google.com/books/docs/v1/getting_started
      class BooksService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'books/v1/')
          @batch_path = 'batch/books/v1'
        end
        
        # Retrieves metadata for a specific bookshelf for the specified user.
        # @param [String] user_id
        #   ID of user for whom to retrieve bookshelves.
        # @param [String] shelf
        #   ID of bookshelf to retrieve.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Bookshelf] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Bookshelf]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_bookshelf(user_id, shelf, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/bookshelves/{shelf}', options)
          command.response_representation = Google::Apis::BooksV1::Bookshelf::Representation
          command.response_class = Google::Apis::BooksV1::Bookshelf
          command.params['userId'] = user_id unless user_id.nil?
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of public bookshelves for the specified user.
        # @param [String] user_id
        #   ID of user for whom to retrieve bookshelves.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Bookshelves] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Bookshelves]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bookshelves(user_id, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/bookshelves', options)
          command.response_representation = Google::Apis::BooksV1::Bookshelves::Representation
          command.response_class = Google::Apis::BooksV1::Bookshelves
          command.params['userId'] = user_id unless user_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves volumes in a specific bookshelf for the specified user.
        # @param [String] user_id
        #   ID of user for whom to retrieve bookshelf volumes.
        # @param [String] shelf
        #   ID of bookshelf to retrieve volumes.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [Boolean] show_preorders
        #   Set to true to show pre-ordered books. Defaults to false.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] start_index
        #   Index of the first element to return (starts at 0)
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bookshelf_volumes(user_id, shelf, max_results: nil, show_preorders: nil, source: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/bookshelves/{shelf}/volumes', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.params['userId'] = user_id unless user_id.nil?
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['showPreorders'] = show_preorders unless show_preorders.nil?
          command.query['source'] = source unless source.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # 
        # @param [String] drive_document_id
        #   A drive document id. The upload_client_token must not be set.
        # @param [String] mime_type
        #   The document MIME type. It can be set only if the drive_document_id is set.
        # @param [String] name
        #   The document name. It can be set only if the drive_document_id is set.
        # @param [String] upload_client_token
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
        # @yieldparam result [Google::Apis::BooksV1::LoadingResource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::LoadingResource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_book(drive_document_id: nil, mime_type: nil, name: nil, upload_client_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'cloudloading/addBook', options)
          command.response_representation = Google::Apis::BooksV1::LoadingResource::Representation
          command.response_class = Google::Apis::BooksV1::LoadingResource
          command.query['drive_document_id'] = drive_document_id unless drive_document_id.nil?
          command.query['mime_type'] = mime_type unless mime_type.nil?
          command.query['name'] = name unless name.nil?
          command.query['upload_client_token'] = upload_client_token unless upload_client_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Remove the book and its contents
        # @param [String] volume_id
        #   The id of the book to be removed.
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
        def delete_book(volume_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'cloudloading/deleteBook', options)
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # 
        # @param [Google::Apis::BooksV1::LoadingResource] loading_resource_object
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
        # @yieldparam result [Google::Apis::BooksV1::LoadingResource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::LoadingResource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_book(loading_resource_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'cloudloading/updateBook', options)
          command.request_representation = Google::Apis::BooksV1::LoadingResource::Representation
          command.request_object = loading_resource_object
          command.response_representation = Google::Apis::BooksV1::LoadingResource::Representation
          command.response_class = Google::Apis::BooksV1::LoadingResource
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of offline dictionary metadata available
        # @param [String] cpksver
        #   The device/version ID from which to request the data.
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
        # @yieldparam result [Google::Apis::BooksV1::Metadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Metadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_offline_metadata_dictionary(cpksver, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'dictionary/listOfflineMetadata', options)
          command.response_representation = Google::Apis::BooksV1::Metadata::Representation
          command.response_class = Google::Apis::BooksV1::Metadata
          command.query['cpksver'] = cpksver unless cpksver.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information regarding the family that the user is part of.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::FamilyInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::FamilyInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_familysharing_family_info(source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'familysharing/getFamilyInfo', options)
          command.response_representation = Google::Apis::BooksV1::FamilyInfo::Representation
          command.response_class = Google::Apis::BooksV1::FamilyInfo
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Initiates sharing of the content with the user's family. Empty response
        # indicates success.
        # @param [String] doc_id
        #   The docid to share.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] volume_id
        #   The volume to share.
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
        def share_familysharing(doc_id: nil, source: nil, volume_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'familysharing/share', options)
          command.query['docId'] = doc_id unless doc_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Initiates revoking content that has already been shared with the user's family.
        # Empty response indicates success.
        # @param [String] doc_id
        #   The docid to unshare.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] volume_id
        #   The volume to unshare.
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
        def unshare_familysharing(doc_id: nil, source: nil, volume_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'familysharing/unshare', options)
          command.query['docId'] = doc_id unless doc_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the layer summary for a volume.
        # @param [String] volume_id
        #   The volume to retrieve layers for.
        # @param [String] summary_id
        #   The ID for the layer to get the summary for.
        # @param [String] content_version
        #   The content version for the requested volume.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::LayerSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::LayerSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_layer(volume_id, summary_id, content_version: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layersummary/{summaryId}', options)
          command.response_representation = Google::Apis::BooksV1::LayerSummary::Representation
          command.response_class = Google::Apis::BooksV1::LayerSummary
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.params['summaryId'] = summary_id unless summary_id.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the layer summaries for a volume.
        # @param [String] volume_id
        #   The volume to retrieve layers for.
        # @param [String] content_version
        #   The content version for the requested volume.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::LayerSummaries] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::LayerSummaries]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_layers(volume_id, content_version: nil, max_results: nil, page_token: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layersummary', options)
          command.response_representation = Google::Apis::BooksV1::LayerSummaries::Representation
          command.response_class = Google::Apis::BooksV1::LayerSummaries
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the annotation data.
        # @param [String] volume_id
        #   The volume to retrieve annotations for.
        # @param [String] layer_id
        #   The ID for the layer to get the annotations.
        # @param [String] annotation_data_id
        #   The ID of the annotation data to retrieve.
        # @param [String] content_version
        #   The content version for the volume you are trying to retrieve.
        # @param [Boolean] allow_web_definitions
        #   For the dictionary layer. Whether or not to allow web definitions.
        # @param [Fixnum] h
        #   The requested pixel height for any images. If height is provided width must
        #   also be provided.
        # @param [String] locale
        #   The locale information for the data. ISO-639-1 language and ISO-3166-1 country
        #   code. Ex: 'en_US'.
        # @param [Fixnum] scale
        #   The requested scale for the image.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] w
        #   The requested pixel width for any images. If width is provided height must
        #   also be provided.
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
        # @yieldparam result [Google::Apis::BooksV1::AnnotationData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::AnnotationData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_layer_annotation_data(volume_id, layer_id, annotation_data_id, content_version, allow_web_definitions: nil, h: nil, locale: nil, scale: nil, source: nil, w: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layers/{layerId}/data/{annotationDataId}', options)
          command.response_representation = Google::Apis::BooksV1::AnnotationData::Representation
          command.response_class = Google::Apis::BooksV1::AnnotationData
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.params['layerId'] = layer_id unless layer_id.nil?
          command.params['annotationDataId'] = annotation_data_id unless annotation_data_id.nil?
          command.query['allowWebDefinitions'] = allow_web_definitions unless allow_web_definitions.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['h'] = h unless h.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['scale'] = scale unless scale.nil?
          command.query['source'] = source unless source.nil?
          command.query['w'] = w unless w.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the annotation data for a volume and layer.
        # @param [String] volume_id
        #   The volume to retrieve annotation data for.
        # @param [String] layer_id
        #   The ID for the layer to get the annotation data.
        # @param [String] content_version
        #   The content version for the requested volume.
        # @param [Array<String>, String] annotation_data_id
        #   The list of Annotation Data Ids to retrieve. Pagination is ignored if this is
        #   set.
        # @param [Fixnum] h
        #   The requested pixel height for any images. If height is provided width must
        #   also be provided.
        # @param [String] locale
        #   The locale information for the data. ISO-639-1 language and ISO-3166-1 country
        #   code. Ex: 'en_US'.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
        # @param [Fixnum] scale
        #   The requested scale for the image.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] updated_max
        #   RFC 3339 timestamp to restrict to items updated prior to this timestamp (
        #   exclusive).
        # @param [String] updated_min
        #   RFC 3339 timestamp to restrict to items updated since this timestamp (
        #   inclusive).
        # @param [Fixnum] w
        #   The requested pixel width for any images. If width is provided height must
        #   also be provided.
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
        # @yieldparam result [Google::Apis::BooksV1::AnnotationsData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::AnnotationsData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_layer_annotation_data(volume_id, layer_id, content_version, annotation_data_id: nil, h: nil, locale: nil, max_results: nil, page_token: nil, scale: nil, source: nil, updated_max: nil, updated_min: nil, w: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layers/{layerId}/data', options)
          command.response_representation = Google::Apis::BooksV1::AnnotationsData::Representation
          command.response_class = Google::Apis::BooksV1::AnnotationsData
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.params['layerId'] = layer_id unless layer_id.nil?
          command.query['annotationDataId'] = annotation_data_id unless annotation_data_id.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['h'] = h unless h.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['scale'] = scale unless scale.nil?
          command.query['source'] = source unless source.nil?
          command.query['updatedMax'] = updated_max unless updated_max.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['w'] = w unless w.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the volume annotation.
        # @param [String] volume_id
        #   The volume to retrieve annotations for.
        # @param [String] layer_id
        #   The ID for the layer to get the annotations.
        # @param [String] annotation_id
        #   The ID of the volume annotation to retrieve.
        # @param [String] locale
        #   The locale information for the data. ISO-639-1 language and ISO-3166-1 country
        #   code. Ex: 'en_US'.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::VolumeAnnotation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::VolumeAnnotation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_layer_volume_annotation(volume_id, layer_id, annotation_id, locale: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layers/{layerId}/annotations/{annotationId}', options)
          command.response_representation = Google::Apis::BooksV1::VolumeAnnotation::Representation
          command.response_class = Google::Apis::BooksV1::VolumeAnnotation
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.params['layerId'] = layer_id unless layer_id.nil?
          command.params['annotationId'] = annotation_id unless annotation_id.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the volume annotations for a volume and layer.
        # @param [String] volume_id
        #   The volume to retrieve annotations for.
        # @param [String] layer_id
        #   The ID for the layer to get the annotations.
        # @param [String] content_version
        #   The content version for the requested volume.
        # @param [String] end_offset
        #   The end offset to end retrieving data from.
        # @param [String] end_position
        #   The end position to end retrieving data from.
        # @param [String] locale
        #   The locale information for the data. ISO-639-1 language and ISO-3166-1 country
        #   code. Ex: 'en_US'.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
        # @param [Boolean] show_deleted
        #   Set to true to return deleted annotations. updatedMin must be in the request
        #   to use this. Defaults to false.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] start_offset
        #   The start offset to start retrieving data from.
        # @param [String] start_position
        #   The start position to start retrieving data from.
        # @param [String] updated_max
        #   RFC 3339 timestamp to restrict to items updated prior to this timestamp (
        #   exclusive).
        # @param [String] updated_min
        #   RFC 3339 timestamp to restrict to items updated since this timestamp (
        #   inclusive).
        # @param [String] volume_annotations_version
        #   The version of the volume annotations that you are requesting.
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
        # @yieldparam result [Google::Apis::BooksV1::Volumeannotations] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumeannotations]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_layer_volume_annotations(volume_id, layer_id, content_version, end_offset: nil, end_position: nil, locale: nil, max_results: nil, page_token: nil, show_deleted: nil, source: nil, start_offset: nil, start_position: nil, updated_max: nil, updated_min: nil, volume_annotations_version: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/layers/{layerId}', options)
          command.response_representation = Google::Apis::BooksV1::Volumeannotations::Representation
          command.response_class = Google::Apis::BooksV1::Volumeannotations
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.params['layerId'] = layer_id unless layer_id.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['endOffset'] = end_offset unless end_offset.nil?
          command.query['endPosition'] = end_position unless end_position.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['source'] = source unless source.nil?
          command.query['startOffset'] = start_offset unless start_offset.nil?
          command.query['startPosition'] = start_position unless start_position.nil?
          command.query['updatedMax'] = updated_max unless updated_max.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['volumeAnnotationsVersion'] = volume_annotations_version unless volume_annotations_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the current settings for the user.
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
        # @yieldparam result [Google::Apis::BooksV1::UserSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::UserSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_settings(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'myconfig/getUserSettings', options)
          command.response_representation = Google::Apis::BooksV1::UserSettings::Representation
          command.response_class = Google::Apis::BooksV1::UserSettings
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Release downloaded content access restriction.
        # @param [Array<String>, String] volume_ids
        #   The volume(s) to release restrictions for.
        # @param [String] cpksver
        #   The device/version ID from which to release the restriction.
        # @param [String] locale
        #   ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::DownloadAccesses] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::DownloadAccesses]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def release_download_access(volume_ids, cpksver, locale: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'myconfig/releaseDownloadAccess', options)
          command.response_representation = Google::Apis::BooksV1::DownloadAccesses::Representation
          command.response_class = Google::Apis::BooksV1::DownloadAccesses
          command.query['cpksver'] = cpksver unless cpksver.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeIds'] = volume_ids unless volume_ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request concurrent and download access restrictions.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] volume_id
        #   The volume to request concurrent/download restrictions for.
        # @param [String] nonce
        #   The client nonce value.
        # @param [String] cpksver
        #   The device/version ID from which to request the restrictions.
        # @param [String] license_types
        #   The type of access license to request. If not specified, the default is BOTH.
        # @param [String] locale
        #   ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
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
        # @yieldparam result [Google::Apis::BooksV1::RequestAccess] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::RequestAccess]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def request_access(source, volume_id, nonce, cpksver, license_types: nil, locale: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'myconfig/requestAccess', options)
          command.response_representation = Google::Apis::BooksV1::RequestAccess::Representation
          command.response_class = Google::Apis::BooksV1::RequestAccess
          command.query['cpksver'] = cpksver unless cpksver.nil?
          command.query['licenseTypes'] = license_types unless license_types.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['nonce'] = nonce unless nonce.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request downloaded content access for specified volumes on the My eBooks shelf.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] nonce
        #   The client nonce value.
        # @param [String] cpksver
        #   The device/version ID from which to release the restriction.
        # @param [Array<String>, String] features
        #   List of features supported by the client, i.e., 'RENTALS'
        # @param [Boolean] include_non_comics_series
        #   Set to true to include non-comics series. Defaults to false.
        # @param [String] locale
        #   ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
        # @param [Boolean] show_preorders
        #   Set to true to show pre-ordered books. Defaults to false.
        # @param [Array<String>, String] volume_ids
        #   The volume(s) to request download restrictions for.
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sync_volume_licenses(source, nonce, cpksver, features: nil, include_non_comics_series: nil, locale: nil, show_preorders: nil, volume_ids: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'myconfig/syncVolumeLicenses', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.query['cpksver'] = cpksver unless cpksver.nil?
          command.query['features'] = features unless features.nil?
          command.query['includeNonComicsSeries'] = include_non_comics_series unless include_non_comics_series.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['nonce'] = nonce unless nonce.nil?
          command.query['showPreorders'] = show_preorders unless show_preorders.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeIds'] = volume_ids unless volume_ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the settings for the user. If a sub-object is specified, it will
        # overwrite the existing sub-object stored in the server. Unspecified sub-
        # objects will retain the existing value.
        # @param [Google::Apis::BooksV1::UserSettings] user_settings_object
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
        # @yieldparam result [Google::Apis::BooksV1::UserSettings] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::UserSettings]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user_settings(user_settings_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'myconfig/updateUserSettings', options)
          command.request_representation = Google::Apis::BooksV1::UserSettings::Representation
          command.request_object = user_settings_object
          command.response_representation = Google::Apis::BooksV1::UserSettings::Representation
          command.response_class = Google::Apis::BooksV1::UserSettings
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an annotation.
        # @param [String] annotation_id
        #   The ID for the annotation to delete.
        # @param [String] source
        #   String to identify the originator of this request.
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
        def delete_my_library_annotation(annotation_id, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'mylibrary/annotations/{annotationId}', options)
          command.params['annotationId'] = annotation_id unless annotation_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a new annotation.
        # @param [Google::Apis::BooksV1::Annotation] annotation_object
        # @param [String] annotation_id
        #   The ID for the annotation to insert.
        # @param [String] country
        #   ISO-3166-1 code to override the IP-based location.
        # @param [Boolean] show_only_summary_in_response
        #   Requests that only the summary of the specified layer be provided in the
        #   response.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Annotation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Annotation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_my_library_annotation(annotation_object = nil, annotation_id: nil, country: nil, show_only_summary_in_response: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/annotations', options)
          command.request_representation = Google::Apis::BooksV1::Annotation::Representation
          command.request_object = annotation_object
          command.response_representation = Google::Apis::BooksV1::Annotation::Representation
          command.response_class = Google::Apis::BooksV1::Annotation
          command.query['annotationId'] = annotation_id unless annotation_id.nil?
          command.query['country'] = country unless country.nil?
          command.query['showOnlySummaryInResponse'] = show_only_summary_in_response unless show_only_summary_in_response.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of annotations, possibly filtered.
        # @param [String] content_version
        #   The content version for the requested volume.
        # @param [String] layer_id
        #   The layer ID to limit annotation by.
        # @param [Array<String>, String] layer_ids
        #   The layer ID(s) to limit annotation by.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
        # @param [Boolean] show_deleted
        #   Set to true to return deleted annotations. updatedMin must be in the request
        #   to use this. Defaults to false.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [String] updated_max
        #   RFC 3339 timestamp to restrict to items updated prior to this timestamp (
        #   exclusive).
        # @param [String] updated_min
        #   RFC 3339 timestamp to restrict to items updated since this timestamp (
        #   inclusive).
        # @param [String] volume_id
        #   The volume to restrict annotations to.
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
        # @yieldparam result [Google::Apis::BooksV1::Annotations] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Annotations]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_my_library_annotations(content_version: nil, layer_id: nil, layer_ids: nil, max_results: nil, page_token: nil, show_deleted: nil, source: nil, updated_max: nil, updated_min: nil, volume_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'mylibrary/annotations', options)
          command.response_representation = Google::Apis::BooksV1::Annotations::Representation
          command.response_class = Google::Apis::BooksV1::Annotations
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['layerId'] = layer_id unless layer_id.nil?
          command.query['layerIds'] = layer_ids unless layer_ids.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['showDeleted'] = show_deleted unless show_deleted.nil?
          command.query['source'] = source unless source.nil?
          command.query['updatedMax'] = updated_max unless updated_max.nil?
          command.query['updatedMin'] = updated_min unless updated_min.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the summary of specified layers.
        # @param [Array<String>, String] layer_ids
        #   Array of layer IDs to get the summary for.
        # @param [String] volume_id
        #   Volume id to get the summary for.
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
        # @yieldparam result [Google::Apis::BooksV1::AnnotationsSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::AnnotationsSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def summarize_my_library_annotation(layer_ids, volume_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/annotations/summary', options)
          command.response_representation = Google::Apis::BooksV1::AnnotationsSummary::Representation
          command.response_class = Google::Apis::BooksV1::AnnotationsSummary
          command.query['layerIds'] = layer_ids unless layer_ids.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing annotation.
        # @param [String] annotation_id
        #   The ID for the annotation to update.
        # @param [Google::Apis::BooksV1::Annotation] annotation_object
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Annotation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Annotation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_my_library_annotation(annotation_id, annotation_object = nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'mylibrary/annotations/{annotationId}', options)
          command.request_representation = Google::Apis::BooksV1::Annotation::Representation
          command.request_object = annotation_object
          command.response_representation = Google::Apis::BooksV1::Annotation::Representation
          command.response_class = Google::Apis::BooksV1::Annotation
          command.params['annotationId'] = annotation_id unless annotation_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a volume to a bookshelf.
        # @param [String] shelf
        #   ID of bookshelf to which to add a volume.
        # @param [String] volume_id
        #   ID of volume to add.
        # @param [String] reason
        #   The reason for which the book is added to the library.
        # @param [String] source
        #   String to identify the originator of this request.
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
        def add_my_library_volume(shelf, volume_id, reason: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/bookshelves/{shelf}/addVolume', options)
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['reason'] = reason unless reason.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears all volumes from a bookshelf.
        # @param [String] shelf
        #   ID of bookshelf from which to remove a volume.
        # @param [String] source
        #   String to identify the originator of this request.
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
        def clear_my_library_volumes(shelf, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/bookshelves/{shelf}/clearVolumes', options)
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves metadata for a specific bookshelf belonging to the authenticated
        # user.
        # @param [String] shelf
        #   ID of bookshelf to retrieve.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Bookshelf] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Bookshelf]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_my_library_bookshelf(shelf, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'mylibrary/bookshelves/{shelf}', options)
          command.response_representation = Google::Apis::BooksV1::Bookshelf::Representation
          command.response_class = Google::Apis::BooksV1::Bookshelf
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of bookshelves belonging to the authenticated user.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Bookshelves] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Bookshelves]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_my_library_bookshelves(source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'mylibrary/bookshelves', options)
          command.response_representation = Google::Apis::BooksV1::Bookshelves::Representation
          command.response_class = Google::Apis::BooksV1::Bookshelves
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Moves a volume within a bookshelf.
        # @param [String] shelf
        #   ID of bookshelf with the volume.
        # @param [String] volume_id
        #   ID of volume to move.
        # @param [Fixnum] volume_position
        #   Position on shelf to move the item (0 puts the item before the current first
        #   item, 1 puts it between the first and the second and so on.)
        # @param [String] source
        #   String to identify the originator of this request.
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
        def move_my_library_volume(shelf, volume_id, volume_position, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/bookshelves/{shelf}/moveVolume', options)
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['volumePosition'] = volume_position unless volume_position.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a volume from a bookshelf.
        # @param [String] shelf
        #   ID of bookshelf from which to remove a volume.
        # @param [String] volume_id
        #   ID of volume to remove.
        # @param [String] reason
        #   The reason for which the book is removed from the library.
        # @param [String] source
        #   String to identify the originator of this request.
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
        def remove_my_library_volume(shelf, volume_id, reason: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/bookshelves/{shelf}/removeVolume', options)
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['reason'] = reason unless reason.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets volume information for volumes on a bookshelf.
        # @param [String] shelf
        #   The bookshelf ID or name retrieve volumes for.
        # @param [String] country
        #   ISO-3166-1 code to override the IP-based location.
        # @param [Fixnum] max_results
        #   Maximum number of results to return
        # @param [String] projection
        #   Restrict information returned to a set of selected fields.
        # @param [String] q
        #   Full-text search query string in this bookshelf.
        # @param [Boolean] show_preorders
        #   Set to true to show pre-ordered books. Defaults to false.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] start_index
        #   Index of the first element to return (starts at 0)
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_my_library_volumes(shelf, country: nil, max_results: nil, projection: nil, q: nil, show_preorders: nil, source: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'mylibrary/bookshelves/{shelf}/volumes', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.params['shelf'] = shelf unless shelf.nil?
          command.query['country'] = country unless country.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['q'] = q unless q.nil?
          command.query['showPreorders'] = show_preorders unless show_preorders.nil?
          command.query['source'] = source unless source.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves my reading position information for a volume.
        # @param [String] volume_id
        #   ID of volume for which to retrieve a reading position.
        # @param [String] content_version
        #   Volume content version for which this reading position is requested.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::ReadingPosition] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::ReadingPosition]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_my_library_reading_position(volume_id, content_version: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'mylibrary/readingpositions/{volumeId}', options)
          command.response_representation = Google::Apis::BooksV1::ReadingPosition::Representation
          command.response_class = Google::Apis::BooksV1::ReadingPosition
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets my reading position information for a volume.
        # @param [String] volume_id
        #   ID of volume for which to update the reading position.
        # @param [String] timestamp
        #   RFC 3339 UTC format timestamp associated with this reading position.
        # @param [String] position
        #   Position string for the new volume reading position.
        # @param [String] action
        #   Action that caused this reading position to be set.
        # @param [String] content_version
        #   Volume content version for which this reading position applies.
        # @param [String] device_cookie
        #   Random persistent device cookie optional on set position.
        # @param [String] source
        #   String to identify the originator of this request.
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
        def set_my_library_reading_position(volume_id, timestamp, position, action: nil, content_version: nil, device_cookie: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'mylibrary/readingpositions/{volumeId}/setPosition', options)
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.query['action'] = action unless action.nil?
          command.query['contentVersion'] = content_version unless content_version.nil?
          command.query['deviceCookie'] = device_cookie unless device_cookie.nil?
          command.query['position'] = position unless position.nil?
          command.query['source'] = source unless source.nil?
          command.query['timestamp'] = timestamp unless timestamp.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns notification details for a given notification id.
        # @param [String] notification_id
        #   String to identify the notification.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating notification title and body.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Notification] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Notification]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_notification(notification_id, locale: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'notification/get', options)
          command.response_representation = Google::Apis::BooksV1::Notification::Representation
          command.response_class = Google::Apis::BooksV1::Notification
          command.query['locale'] = locale unless locale.nil?
          command.query['notification_id'] = notification_id unless notification_id.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List categories for onboarding experience.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset.
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
        # @yieldparam result [Google::Apis::BooksV1::Category] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Category]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_onboarding_categories(locale: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'onboarding/listCategories', options)
          command.response_representation = Google::Apis::BooksV1::Category::Representation
          command.response_class = Google::Apis::BooksV1::Category
          command.query['locale'] = locale unless locale.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List available volumes under categories for onboarding experience.
        # @param [Array<String>, String] category_id
        #   List of category ids requested.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset.
        # @param [String] max_allowed_maturity_rating
        #   The maximum allowed maturity rating of returned volumes. Books with a higher
        #   maturity rating are filtered out.
        # @param [Fixnum] page_size
        #   Number of maximum results per page to be included in the response.
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
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
        # @yieldparam result [Google::Apis::BooksV1::Volume2] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volume2]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_onboarding_category_volumes(category_id: nil, locale: nil, max_allowed_maturity_rating: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'onboarding/listCategoryVolumes', options)
          command.response_representation = Google::Apis::BooksV1::Volume2::Representation
          command.response_class = Google::Apis::BooksV1::Volume2
          command.query['categoryId'] = category_id unless category_id.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxAllowedMaturityRating'] = max_allowed_maturity_rating unless max_allowed_maturity_rating.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a stream of personalized book clusters
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating recommendations.
        # @param [String] max_allowed_maturity_rating
        #   The maximum allowed maturity rating of returned recommendations. Books with a
        #   higher maturity rating are filtered out.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Discoveryclusters] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Discoveryclusters]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_personalizedstream(locale: nil, max_allowed_maturity_rating: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'personalizedstream/get', options)
          command.response_representation = Google::Apis::BooksV1::Discoveryclusters::Representation
          command.response_class = Google::Apis::BooksV1::Discoveryclusters
          command.query['locale'] = locale unless locale.nil?
          command.query['maxAllowedMaturityRating'] = max_allowed_maturity_rating unless max_allowed_maturity_rating.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # 
        # @param [String] android_id
        #   device android_id
        # @param [String] device
        #   device device
        # @param [String] manufacturer
        #   device manufacturer
        # @param [String] model
        #   device model
        # @param [String] offer_id
        # @param [String] product
        #   device product
        # @param [String] serial
        #   device serial
        # @param [String] volume_id
        #   Volume id to exercise the offer
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
        def accept_promo_offer(android_id: nil, device: nil, manufacturer: nil, model: nil, offer_id: nil, product: nil, serial: nil, volume_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'promooffer/accept', options)
          command.query['androidId'] = android_id unless android_id.nil?
          command.query['device'] = device unless device.nil?
          command.query['manufacturer'] = manufacturer unless manufacturer.nil?
          command.query['model'] = model unless model.nil?
          command.query['offerId'] = offer_id unless offer_id.nil?
          command.query['product'] = product unless product.nil?
          command.query['serial'] = serial unless serial.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # 
        # @param [String] android_id
        #   device android_id
        # @param [String] device
        #   device device
        # @param [String] manufacturer
        #   device manufacturer
        # @param [String] model
        #   device model
        # @param [String] offer_id
        #   Offer to dimiss
        # @param [String] product
        #   device product
        # @param [String] serial
        #   device serial
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
        def dismiss_promo_offer(android_id: nil, device: nil, manufacturer: nil, model: nil, offer_id: nil, product: nil, serial: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'promooffer/dismiss', options)
          command.query['androidId'] = android_id unless android_id.nil?
          command.query['device'] = device unless device.nil?
          command.query['manufacturer'] = manufacturer unless manufacturer.nil?
          command.query['model'] = model unless model.nil?
          command.query['offerId'] = offer_id unless offer_id.nil?
          command.query['product'] = product unless product.nil?
          command.query['serial'] = serial unless serial.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of promo offers available to the user
        # @param [String] android_id
        #   device android_id
        # @param [String] device
        #   device device
        # @param [String] manufacturer
        #   device manufacturer
        # @param [String] model
        #   device model
        # @param [String] product
        #   device product
        # @param [String] serial
        #   device serial
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
        # @yieldparam result [Google::Apis::BooksV1::Offers] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Offers]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_promo_offer(android_id: nil, device: nil, manufacturer: nil, model: nil, product: nil, serial: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'promooffer/get', options)
          command.response_representation = Google::Apis::BooksV1::Offers::Representation
          command.response_class = Google::Apis::BooksV1::Offers
          command.query['androidId'] = android_id unless android_id.nil?
          command.query['device'] = device unless device.nil?
          command.query['manufacturer'] = manufacturer unless manufacturer.nil?
          command.query['model'] = model unless model.nil?
          command.query['product'] = product unless product.nil?
          command.query['serial'] = serial unless serial.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns Series metadata for the given series ids.
        # @param [Array<String>, String] series_id
        #   String that identifies the series
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
        # @yieldparam result [Google::Apis::BooksV1::Series] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Series]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_series(series_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'series/get', options)
          command.response_representation = Google::Apis::BooksV1::Series::Representation
          command.response_class = Google::Apis::BooksV1::Series
          command.query['series_id'] = series_id unless series_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns Series membership data given the series id.
        # @param [String] series_id
        #   String that identifies the series
        # @param [Fixnum] page_size
        #   Number of maximum results per page to be included in the response.
        # @param [String] page_token
        #   The value of the nextToken from the previous page.
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
        # @yieldparam result [Google::Apis::BooksV1::SeriesMembership] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::SeriesMembership]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_series_membership(series_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'series/membership/get', options)
          command.response_representation = Google::Apis::BooksV1::SeriesMembership::Representation
          command.response_class = Google::Apis::BooksV1::SeriesMembership
          command.query['page_size'] = page_size unless page_size.nil?
          command.query['page_token'] = page_token unless page_token.nil?
          command.query['series_id'] = series_id unless series_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets volume information for a single volume.
        # @param [String] volume_id
        #   ID of volume to retrieve.
        # @param [String] country
        #   ISO-3166-1 code to override the IP-based location.
        # @param [Boolean] include_non_comics_series
        #   Set to true to include non-comics series. Defaults to false.
        # @param [String] partner
        #   Brand results for partner ID.
        # @param [String] projection
        #   Restrict information returned to a set of selected fields.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Boolean] user_library_consistent_read
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
        # @yieldparam result [Google::Apis::BooksV1::Volume] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volume]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_volume(volume_id, country: nil, include_non_comics_series: nil, partner: nil, projection: nil, source: nil, user_library_consistent_read: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}', options)
          command.response_representation = Google::Apis::BooksV1::Volume::Representation
          command.response_class = Google::Apis::BooksV1::Volume
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.query['country'] = country unless country.nil?
          command.query['includeNonComicsSeries'] = include_non_comics_series unless include_non_comics_series.nil?
          command.query['partner'] = partner unless partner.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['source'] = source unless source.nil?
          command.query['user_library_consistent_read'] = user_library_consistent_read unless user_library_consistent_read.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Performs a book search.
        # @param [String] q
        #   Full-text search query string.
        # @param [String] download
        #   Restrict to volumes by download availability.
        # @param [String] filter
        #   Filter search results.
        # @param [String] lang_restrict
        #   Restrict results to books with this language code.
        # @param [String] library_restrict
        #   Restrict search to this user's library.
        # @param [String] max_allowed_maturity_rating
        #   The maximum allowed maturity rating of returned recommendations. Books with a
        #   higher maturity rating are filtered out.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [String] order_by
        #   Sort search results.
        # @param [String] partner
        #   Restrict and brand results for partner ID.
        # @param [String] print_type
        #   Restrict to books or magazines.
        # @param [String] projection
        #   Restrict information returned to a set of selected fields.
        # @param [Boolean] show_preorders
        #   Set to true to show books available for preorder. Defaults to false.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] start_index
        #   Index of the first result to return (starts at 0)
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_volumes(q, download: nil, filter: nil, lang_restrict: nil, library_restrict: nil, max_allowed_maturity_rating: nil, max_results: nil, order_by: nil, partner: nil, print_type: nil, projection: nil, show_preorders: nil, source: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.query['download'] = download unless download.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['langRestrict'] = lang_restrict unless lang_restrict.nil?
          command.query['libraryRestrict'] = library_restrict unless library_restrict.nil?
          command.query['maxAllowedMaturityRating'] = max_allowed_maturity_rating unless max_allowed_maturity_rating.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['partner'] = partner unless partner.nil?
          command.query['printType'] = print_type unless print_type.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['q'] = q unless q.nil?
          command.query['showPreorders'] = show_preorders unless show_preorders.nil?
          command.query['source'] = source unless source.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a list of associated books.
        # @param [String] volume_id
        #   ID of the source volume.
        # @param [String] association
        #   Association type.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating recommendations.
        # @param [String] max_allowed_maturity_rating
        #   The maximum allowed maturity rating of returned recommendations. Books with a
        #   higher maturity rating are filtered out.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_associated_volumes(volume_id, association: nil, locale: nil, max_allowed_maturity_rating: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/{volumeId}/associated', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.params['volumeId'] = volume_id unless volume_id.nil?
          command.query['association'] = association unless association.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxAllowedMaturityRating'] = max_allowed_maturity_rating unless max_allowed_maturity_rating.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a list of books in My Library.
        # @param [Array<String>, String] acquire_method
        #   How the book was acquired
        # @param [String] country
        #   ISO-3166-1 code to override the IP-based location.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex:'en_US'. Used for
        #   generating recommendations.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Array<String>, String] processing_state
        #   The processing state of the user uploaded volumes to be returned. Applicable
        #   only if the UPLOADED is specified in the acquireMethod.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] start_index
        #   Index of the first result to return (starts at 0)
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_my_books(acquire_method: nil, country: nil, locale: nil, max_results: nil, processing_state: nil, source: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/mybooks', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.query['acquireMethod'] = acquire_method unless acquire_method.nil?
          command.query['country'] = country unless country.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['processingState'] = processing_state unless processing_state.nil?
          command.query['source'] = source unless source.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a list of recommended books for the current user.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating recommendations.
        # @param [String] max_allowed_maturity_rating
        #   The maximum allowed maturity rating of returned recommendations. Books with a
        #   higher maturity rating are filtered out.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_recommended_volumes(locale: nil, max_allowed_maturity_rating: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/recommended', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.query['locale'] = locale unless locale.nil?
          command.query['maxAllowedMaturityRating'] = max_allowed_maturity_rating unless max_allowed_maturity_rating.nil?
          command.query['source'] = source unless source.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rate a recommended book for the current user.
        # @param [String] rating
        #   Rating to be given to the volume.
        # @param [String] volume_id
        #   ID of the source volume.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating recommendations.
        # @param [String] source
        #   String to identify the originator of this request.
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
        # @yieldparam result [Google::Apis::BooksV1::RateRecommendedVolumeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::RateRecommendedVolumeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rate_recommended_volume(rating, volume_id, locale: nil, source: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'volumes/recommended/rate', options)
          command.response_representation = Google::Apis::BooksV1::RateRecommendedVolumeResponse::Representation
          command.response_class = Google::Apis::BooksV1::RateRecommendedVolumeResponse
          command.query['locale'] = locale unless locale.nil?
          command.query['rating'] = rating unless rating.nil?
          command.query['source'] = source unless source.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a list of books uploaded by the current user.
        # @param [String] locale
        #   ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for
        #   generating recommendations.
        # @param [Fixnum] max_results
        #   Maximum number of results to return.
        # @param [Array<String>, String] processing_state
        #   The processing state of the user uploaded volumes to be returned.
        # @param [String] source
        #   String to identify the originator of this request.
        # @param [Fixnum] start_index
        #   Index of the first result to return (starts at 0)
        # @param [Array<String>, String] volume_id
        #   The ids of the volumes to be returned. If not specified all that match the
        #   processingState are returned.
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
        # @yieldparam result [Google::Apis::BooksV1::Volumes] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BooksV1::Volumes]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_uploaded_volumes(locale: nil, max_results: nil, processing_state: nil, source: nil, start_index: nil, volume_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'volumes/useruploaded', options)
          command.response_representation = Google::Apis::BooksV1::Volumes::Representation
          command.response_class = Google::Apis::BooksV1::Volumes
          command.query['locale'] = locale unless locale.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['processingState'] = processing_state unless processing_state.nil?
          command.query['source'] = source unless source.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['volumeId'] = volume_id unless volume_id.nil?
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
