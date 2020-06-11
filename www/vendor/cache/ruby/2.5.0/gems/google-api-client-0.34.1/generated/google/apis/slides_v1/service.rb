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
    module SlidesV1
      # Google Slides API
      #
      # Reads and writes Google Slides presentations.
      #
      # @example
      #    require 'google/apis/slides_v1'
      #
      #    Slides = Google::Apis::SlidesV1 # Alias the module
      #    service = Slides::SlidesService.new
      #
      # @see https://developers.google.com/slides/
      class SlidesService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://slides.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Applies one or more updates to the presentation.
        # Each request is validated before
        # being applied. If any request is not valid, then the entire request will
        # fail and nothing will be applied.
        # Some requests have replies to
        # give you some information about how they are applied. Other requests do
        # not need to return information; these each return an empty reply.
        # The order of replies matches that of the requests.
        # For example, suppose you call batchUpdate with four updates, and only the
        # third one returns information. The response would have two empty replies:
        # the reply to the third request, and another empty reply, in that order.
        # Because other users may be editing the presentation, the presentation
        # might not exactly reflect your changes: your changes may
        # be altered with respect to collaborator changes. If there are no
        # collaborators, the presentation should reflect your changes. In any case,
        # the updates in your request are guaranteed to be applied together
        # atomically.
        # @param [String] presentation_id
        #   The presentation to apply the updates to.
        # @param [Google::Apis::SlidesV1::BatchUpdatePresentationRequest] batch_update_presentation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SlidesV1::BatchUpdatePresentationResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SlidesV1::BatchUpdatePresentationResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_presentation(presentation_id, batch_update_presentation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/presentations/{presentationId}:batchUpdate', options)
          command.request_representation = Google::Apis::SlidesV1::BatchUpdatePresentationRequest::Representation
          command.request_object = batch_update_presentation_request_object
          command.response_representation = Google::Apis::SlidesV1::BatchUpdatePresentationResponse::Representation
          command.response_class = Google::Apis::SlidesV1::BatchUpdatePresentationResponse
          command.params['presentationId'] = presentation_id unless presentation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a blank presentation using the title given in the request. If a
        # `presentationId` is provided, it is used as the ID of the new presentation.
        # Otherwise, a new ID is generated. Other fields in the request, including
        # any provided content, are ignored.
        # Returns the created presentation.
        # @param [Google::Apis::SlidesV1::Presentation] presentation_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SlidesV1::Presentation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SlidesV1::Presentation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_presentation(presentation_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/presentations', options)
          command.request_representation = Google::Apis::SlidesV1::Presentation::Representation
          command.request_object = presentation_object
          command.response_representation = Google::Apis::SlidesV1::Presentation::Representation
          command.response_class = Google::Apis::SlidesV1::Presentation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest version of the specified presentation.
        # @param [String] presentation_id
        #   The ID of the presentation to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SlidesV1::Presentation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SlidesV1::Presentation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_presentation(presentation_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/presentations/{+presentationId}', options)
          command.response_representation = Google::Apis::SlidesV1::Presentation::Representation
          command.response_class = Google::Apis::SlidesV1::Presentation
          command.params['presentationId'] = presentation_id unless presentation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest version of the specified page in the presentation.
        # @param [String] presentation_id
        #   The ID of the presentation to retrieve.
        # @param [String] page_object_id
        #   The object ID of the page to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SlidesV1::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SlidesV1::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_presentation_page(presentation_id, page_object_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/presentations/{presentationId}/pages/{pageObjectId}', options)
          command.response_representation = Google::Apis::SlidesV1::Page::Representation
          command.response_class = Google::Apis::SlidesV1::Page
          command.params['presentationId'] = presentation_id unless presentation_id.nil?
          command.params['pageObjectId'] = page_object_id unless page_object_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a thumbnail of the latest version of the specified page in the
        # presentation and returns a URL to the thumbnail image.
        # This request counts as an [expensive read request](/slides/limits) for
        # quota purposes.
        # @param [String] presentation_id
        #   The ID of the presentation to retrieve.
        # @param [String] page_object_id
        #   The object ID of the page whose thumbnail to retrieve.
        # @param [String] thumbnail_properties_mime_type
        #   The optional mime type of the thumbnail image.
        #   If you don't specify the mime type, the default mime type will be PNG.
        # @param [String] thumbnail_properties_thumbnail_size
        #   The optional thumbnail image size.
        #   If you don't specify the size, the server chooses a default size of the
        #   image.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SlidesV1::Thumbnail] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SlidesV1::Thumbnail]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_presentation_page_thumbnail(presentation_id, page_object_id, thumbnail_properties_mime_type: nil, thumbnail_properties_thumbnail_size: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/presentations/{presentationId}/pages/{pageObjectId}/thumbnail', options)
          command.response_representation = Google::Apis::SlidesV1::Thumbnail::Representation
          command.response_class = Google::Apis::SlidesV1::Thumbnail
          command.params['presentationId'] = presentation_id unless presentation_id.nil?
          command.params['pageObjectId'] = page_object_id unless page_object_id.nil?
          command.query['thumbnailProperties.mimeType'] = thumbnail_properties_mime_type unless thumbnail_properties_mime_type.nil?
          command.query['thumbnailProperties.thumbnailSize'] = thumbnail_properties_thumbnail_size unless thumbnail_properties_thumbnail_size.nil?
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
