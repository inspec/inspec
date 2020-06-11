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
    module LibraryagentV1
      
      # A single book in the library.
      class GoogleExampleLibraryagentV1Book
        include Google::Apis::Core::Hashable
      
        # The name of the book author.
        # Corresponds to the JSON property `author`
        # @return [String]
        attr_accessor :author
      
        # The resource name of the book.
        # Book names have the form `shelves/`shelf_id`/books/`book_id``.
        # The name is ignored when creating a book.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value indicating whether the book has been read.
        # Corresponds to the JSON property `read`
        # @return [Boolean]
        attr_accessor :read
        alias_method :read?, :read
      
        # The title of the book.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @name = args[:name] if args.key?(:name)
          @read = args[:read] if args.key?(:read)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Response message for LibraryAgent.ListBooks.
      class GoogleExampleLibraryagentV1ListBooksResponse
        include Google::Apis::Core::Hashable
      
        # The list of books.
        # Corresponds to the JSON property `books`
        # @return [Array<Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book>]
        attr_accessor :books
      
        # A token to retrieve next page of results.
        # Pass this value in the
        # ListBooksRequest.page_token
        # field in the subsequent call to `ListBooks` method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @books = args[:books] if args.key?(:books)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for LibraryAgent.ListShelves.
      class GoogleExampleLibraryagentV1ListShelvesResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve next page of results.
        # Pass this value in the
        # ListShelvesRequest.page_token
        # field in the subsequent call to `ListShelves` method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of shelves.
        # Corresponds to the JSON property `shelves`
        # @return [Array<Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf>]
        attr_accessor :shelves
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @shelves = args[:shelves] if args.key?(:shelves)
        end
      end
      
      # A Shelf contains a collection of books with a theme.
      class GoogleExampleLibraryagentV1Shelf
        include Google::Apis::Core::Hashable
      
        # Output only. The resource name of the shelf.
        # Shelf names have the form `shelves/`shelf_id``.
        # The name is ignored when creating a shelf.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The theme of the shelf
        # Corresponds to the JSON property `theme`
        # @return [String]
        attr_accessor :theme
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @theme = args[:theme] if args.key?(:theme)
        end
      end
    end
  end
end
