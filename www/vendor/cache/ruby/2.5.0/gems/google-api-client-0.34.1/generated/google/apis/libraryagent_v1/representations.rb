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
      
      class GoogleExampleLibraryagentV1Book
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleExampleLibraryagentV1ListBooksResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleExampleLibraryagentV1ListShelvesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleExampleLibraryagentV1Shelf
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleExampleLibraryagentV1Book
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author'
          property :name, as: 'name'
          property :read, as: 'read'
          property :title, as: 'title'
        end
      end
      
      class GoogleExampleLibraryagentV1ListBooksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :books, as: 'books', class: Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book, decorator: Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Book::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleExampleLibraryagentV1ListShelvesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :shelves, as: 'shelves', class: Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf, decorator: Google::Apis::LibraryagentV1::GoogleExampleLibraryagentV1Shelf::Representation
      
        end
      end
      
      class GoogleExampleLibraryagentV1Shelf
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :theme, as: 'theme'
        end
      end
    end
  end
end
