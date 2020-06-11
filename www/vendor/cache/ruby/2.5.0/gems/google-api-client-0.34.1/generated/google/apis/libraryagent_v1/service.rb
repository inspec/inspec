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
    module LibraryagentV1
      # Library Agent API
      #
      # A simple Google Example Library API.
      #
      # @example
      #    require 'google/apis/libraryagent_v1'
      #
      #    Libraryagent = Google::Apis::LibraryagentV1 # Alias the module
      #    service = Libraryagent::LibraryagentService.new
      #
      # @see https://cloud.google.com/docs/quota
      class LibraryagentService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://libraryagent.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets a shelf. Returns NOT_FOUND if the shelf does not exist.
        # @param [String] name
        #   Required. The name of the shelf to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_shelf(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists shelves. The order is unspecified but deterministic. Newly created
        # shelves will not necessarily be added to the end of this list.
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer shelves than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListShelvesResponse.next_page_token
        #   returned from the previous call to `ListShelves` method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListShelvesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListShelvesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_shelves(page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/shelves', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListShelvesResponse::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListShelvesResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Borrow a book from the library. Returns the book if it is borrowed
        # successfully. Returns NOT_FOUND if the book does not exist in the library.
        # Returns quota exceeded error if the amount of books borrowed exceeds
        # allocation quota in any dimensions.
        # @param [String] name
        #   Required. The name of the book to borrow.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def borrow_shelf_book(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:borrow', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a book. Returns NOT_FOUND if the book does not exist.
        # @param [String] name
        #   Required. The name of the book to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_shelf_book(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists books in a shelf. The order is unspecified but deterministic. Newly
        # created books will not necessarily be added to the end of this list.
        # Returns NOT_FOUND if the shelf does not exist.
        # @param [String] parent
        #   Required. The name of the shelf whose books we'd like to list.
        # @param [Fixnum] page_size
        #   Requested page size. Server may return fewer books than requested.
        #   If unspecified, server will pick an appropriate default.
        # @param [String] page_token
        #   A token identifying a page of results the server should return.
        #   Typically, this is the value of
        #   ListBooksResponse.next_page_token.
        #   returned from the previous call to `ListBooks` method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListBooksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListBooksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_shelf_books(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/books', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListBooksResponse::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1ListBooksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Return a book to the library. Returns the book if it is returned to the
        # library successfully.
        # Returns error if the book does not belong to the library
        # or the users didn't borrow before.
        # @param [String] name
        #   Required. The name of the book to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def return_shelf_book(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:return', options)
          command.response_representation = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book::Representation
          command.response_class = Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book
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
