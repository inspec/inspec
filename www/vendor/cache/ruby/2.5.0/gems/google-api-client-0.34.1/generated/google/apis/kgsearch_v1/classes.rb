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
    module KgsearchV1
      
      # Response message includes the context and a list of matching results
      # which contain the detail of associated entities.
      class SearchResponse
        include Google::Apis::Core::Hashable
      
        # The local context applicable for the response. See more details at
        # http://www.w3.org/TR/json-ld/#context-definitions.
        # Corresponds to the JSON property `@context`
        # @return [Object]
        attr_accessor :_context
      
        # The schema type of top-level JSON-LD object, e.g. ItemList.
        # Corresponds to the JSON property `@type`
        # @return [Object]
        attr_accessor :_type
      
        # The item list of search results.
        # Corresponds to the JSON property `itemListElement`
        # @return [Array<Object>]
        attr_accessor :item_list_element
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @_context = args[:_context] if args.key?(:_context)
          @_type = args[:_type] if args.key?(:_type)
          @item_list_element = args[:item_list_element] if args.key?(:item_list_element)
        end
      end
    end
  end
end
