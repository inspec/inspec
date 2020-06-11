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
    module StreetviewpublishV1
      # Street View Publish API
      #
      # Publishes 360 photos to Google Maps, along with position, orientation, and
      #  connectivity metadata. Apps can offer an interface for positioning, connecting,
      #  and uploading user-generated Street View images.
      #
      # @example
      #    require 'google/apis/streetviewpublish_v1'
      #
      #    Streetviewpublish = Google::Apis::StreetviewpublishV1 # Alias the module
      #    service = Streetviewpublish::StreetViewPublishService.new
      #
      # @see https://developers.google.com/streetview/publish/
      class StreetViewPublishService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://streetviewpublish.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # After the client finishes uploading the photo with the returned
        # UploadRef,
        # CreatePhoto
        # publishes the uploaded Photo to
        # Street View on Google Maps.
        # Currently, the only way to set heading, pitch, and roll in CreatePhoto is
        # through the [Photo Sphere XMP
        # metadata](https://developers.google.com/streetview/spherical-metadata) in
        # the photo bytes. CreatePhoto ignores the  `pose.heading`, `pose.pitch`,
        # `pose.roll`, `pose.altitude`, and `pose.level` fields in Pose.
        # This method returns the following error codes:
        # * google.rpc.Code.INVALID_ARGUMENT if the request is malformed or if
        # the uploaded photo is not a 360 photo.
        # * google.rpc.Code.NOT_FOUND if the upload reference does not exist.
        # * google.rpc.Code.RESOURCE_EXHAUSTED if the account has reached the
        # storage limit.
        # @param [Google::Apis::StreetviewpublishV1::Photo] photo_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::Photo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::Photo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_photo(photo_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/photo', options)
          command.request_representation = Google::Apis::StreetviewpublishV1::Photo::Representation
          command.request_object = photo_object
          command.response_representation = Google::Apis::StreetviewpublishV1::Photo::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::Photo
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a Photo and its metadata.
        # This method returns the following error codes:
        # * google.rpc.Code.PERMISSION_DENIED if the requesting user did not
        # create the requested photo.
        # * google.rpc.Code.NOT_FOUND if the photo ID does not exist.
        # @param [String] photo_id
        #   Required. ID of the Photo.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_photo(photo_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/photo/{photoId}', options)
          command.response_representation = Google::Apis::StreetviewpublishV1::Empty::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::Empty
          command.params['photoId'] = photo_id unless photo_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the metadata of the specified
        # Photo.
        # This method returns the following error codes:
        # * google.rpc.Code.PERMISSION_DENIED if the requesting user did not
        # create the requested Photo.
        # * google.rpc.Code.NOT_FOUND if the requested
        # Photo does not exist.
        # * google.rpc.Code.UNAVAILABLE if the requested
        # Photo is still being indexed.
        # @param [String] photo_id
        #   Required. ID of the Photo.
        # @param [String] language_code
        #   The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        #   information, see
        #   http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        #   If language_code is unspecified, the user's language preference for Google
        #   services is used.
        # @param [String] view
        #   Required. Specifies if a download URL for the photo bytes should be returned
        #   in the
        #   Photo response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::Photo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::Photo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_photo(photo_id, language_code: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/photo/{photoId}', options)
          command.response_representation = Google::Apis::StreetviewpublishV1::Photo::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::Photo
          command.params['photoId'] = photo_id unless photo_id.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an upload session to start uploading photo bytes.  The method uses
        # the upload URL of the returned
        # UploadRef to upload the bytes for
        # the Photo.
        # In addition to the photo requirements shown in
        # https://support.google.com/maps/answer/7012050?hl=en&ref_topic=6275604,
        # the photo must meet the following requirements:
        # * Photo Sphere XMP metadata must be included in the photo medadata. See
        # https://developers.google.com/streetview/spherical-metadata for the
        # required fields.
        # * The pixel size of the photo must meet the size requirements listed in
        # https://support.google.com/maps/answer/7012050?hl=en&ref_topic=6275604, and
        # the photo must be a full 360 horizontally.
        # After the upload completes, the method uses
        # UploadRef with
        # CreatePhoto
        # to create the Photo object entry.
        # @param [Google::Apis::StreetviewpublishV1::Empty] empty_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::UploadRef] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::UploadRef]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_photo_upload(empty_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/photo:startUpload', options)
          command.request_representation = Google::Apis::StreetviewpublishV1::Empty::Representation
          command.request_object = empty_object
          command.response_representation = Google::Apis::StreetviewpublishV1::UploadRef::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::UploadRef
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the metadata of a Photo, such
        # as pose, place association, connections, etc. Changing the pixels of a
        # photo is not supported.
        # Only the fields specified in the
        # updateMask
        # field are used. If `updateMask` is not present, the update applies to all
        # fields.
        # This method returns the following error codes:
        # * google.rpc.Code.PERMISSION_DENIED if the requesting user did not
        # create the requested photo.
        # * google.rpc.Code.INVALID_ARGUMENT if the request is malformed.
        # * google.rpc.Code.NOT_FOUND if the requested photo does not exist.
        # * google.rpc.Code.UNAVAILABLE if the requested
        # Photo is still being indexed.
        # @param [String] id
        #   Required. A unique identifier for a photo.
        # @param [Google::Apis::StreetviewpublishV1::Photo] photo_object
        # @param [String] update_mask
        #   Required. Mask that identifies fields on the photo metadata to update.
        #   If not present, the old Photo
        #   metadata is entirely replaced with the
        #   new Photo metadata in this request.
        #   The update fails if invalid fields are specified. Multiple fields can be
        #   specified in a comma-delimited list.
        #   The following fields are valid:
        #   * `pose.heading`
        #   * `pose.latLngPair`
        #   * `pose.pitch`
        #   * `pose.roll`
        #   * `pose.level`
        #   * `pose.altitude`
        #   * `connections`
        #   * `places`
        #   <aside class="note"><b>Note:</b> When
        #   updateMask
        #   contains repeated fields, the entire set of repeated values get replaced
        #   with the new contents. For example, if
        #   updateMask
        #   contains `connections` and `UpdatePhotoRequest.photo.connections` is empty,
        #   all connections are removed.</aside>
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::Photo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::Photo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_photo(id, photo_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/photo/{id}', options)
          command.request_representation = Google::Apis::StreetviewpublishV1::Photo::Representation
          command.request_object = photo_object
          command.response_representation = Google::Apis::StreetviewpublishV1::Photo::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::Photo
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a list of Photos and their
        # metadata.
        # Note that if
        # BatchDeletePhotos
        # fails, either critical fields are missing or there is an authentication
        # error. Even if
        # BatchDeletePhotos
        # succeeds, individual photos in the batch may have failures.
        # These failures are specified in each
        # PhotoResponse.status
        # in
        # BatchDeletePhotosResponse.results.
        # See
        # DeletePhoto
        # for specific failures that can occur per photo.
        # @param [Google::Apis::StreetviewpublishV1::BatchDeletePhotosRequest] batch_delete_photos_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::BatchDeletePhotosResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::BatchDeletePhotosResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_delete_photos(batch_delete_photos_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/photos:batchDelete', options)
          command.request_representation = Google::Apis::StreetviewpublishV1::BatchDeletePhotosRequest::Representation
          command.request_object = batch_delete_photos_request_object
          command.response_representation = Google::Apis::StreetviewpublishV1::BatchDeletePhotosResponse::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::BatchDeletePhotosResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the metadata of the specified
        # Photo batch.
        # Note that if
        # BatchGetPhotos
        # fails, either critical fields are missing or there is an authentication
        # error. Even if
        # BatchGetPhotos
        # succeeds, individual photos in the batch may have failures.
        # These failures are specified in each
        # PhotoResponse.status
        # in
        # BatchGetPhotosResponse.results.
        # See
        # GetPhoto
        # for specific failures that can occur per photo.
        # @param [String] language_code
        #   The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        #   information, see
        #   http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        #   If language_code is unspecified, the user's language preference for Google
        #   services is used.
        # @param [Array<String>, String] photo_ids
        #   Required. IDs of the Photos. For HTTP
        #   GET requests, the URL query parameter should be
        #   `photoIds=<id1>&photoIds=<id2>&...`.
        # @param [String] view
        #   Required. Specifies if a download URL for the photo bytes should be returned
        #   in the
        #   Photo response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::BatchGetPhotosResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::BatchGetPhotosResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_photo_get(language_code: nil, photo_ids: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/photos:batchGet', options)
          command.response_representation = Google::Apis::StreetviewpublishV1::BatchGetPhotosResponse::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::BatchGetPhotosResponse
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['photoIds'] = photo_ids unless photo_ids.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the metadata of Photos, such
        # as pose, place association, connections, etc. Changing the pixels of photos
        # is not supported.
        # Note that if
        # BatchUpdatePhotos
        # fails, either critical fields are missing or there is an authentication
        # error. Even if
        # BatchUpdatePhotos
        # succeeds, individual photos in the batch may have failures.
        # These failures are specified in each
        # PhotoResponse.status
        # in
        # BatchUpdatePhotosResponse.results.
        # See
        # UpdatePhoto
        # for specific failures that can occur per photo.
        # Only the fields specified in
        # updateMask
        # field are used. If `updateMask` is not present, the update applies to all
        # fields.
        # The number of
        # UpdatePhotoRequest
        # messages in a
        # BatchUpdatePhotosRequest
        # must not exceed 20.
        # <aside class="note"><b>Note:</b> To update
        # Pose.altitude,
        # Pose.latLngPair has to be
        # filled as well. Otherwise, the request will fail.</aside>
        # @param [Google::Apis::StreetviewpublishV1::BatchUpdatePhotosRequest] batch_update_photos_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::BatchUpdatePhotosResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::BatchUpdatePhotosResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_photos(batch_update_photos_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/photos:batchUpdate', options)
          command.request_representation = Google::Apis::StreetviewpublishV1::BatchUpdatePhotosRequest::Representation
          command.request_object = batch_update_photos_request_object
          command.response_representation = Google::Apis::StreetviewpublishV1::BatchUpdatePhotosResponse::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::BatchUpdatePhotosResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the Photos that belong to
        # the user.
        # <aside class="note"><b>Note:</b> Recently created photos that are still
        # being indexed are not returned in the response.</aside>
        # @param [String] filter
        #   Required. The filter expression. For example: `placeId=
        #   ChIJj61dQgK6j4AR4GeTYWZsKWw`.
        #   The only filter supported at the moment is `placeId`.
        # @param [String] language_code
        #   The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        #   information, see
        #   http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        #   If language_code is unspecified, the user's language preference for Google
        #   services is used.
        # @param [Fixnum] page_size
        #   The maximum number of photos to return.
        #   `pageSize` must be non-negative. If `pageSize` is zero or is not provided,
        #   the default page size of 100 is used.
        #   The number of photos returned in the response may be less than `pageSize`
        #   if the number of photos that belong to the user is less than `pageSize`.
        # @param [String] page_token
        #   The
        #   nextPageToken
        #   value returned from a previous
        #   ListPhotos
        #   request, if any.
        # @param [String] view
        #   Required. Specifies if a download URL for the photos bytes should be returned
        #   in the
        #   Photos response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StreetviewpublishV1::ListPhotosResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StreetviewpublishV1::ListPhotosResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_photos(filter: nil, language_code: nil, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/photos', options)
          command.response_representation = Google::Apis::StreetviewpublishV1::ListPhotosResponse::Representation
          command.response_class = Google::Apis::StreetviewpublishV1::ListPhotosResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['languageCode'] = language_code unless language_code.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
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
