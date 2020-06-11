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
    module LicensingV1
      
      class LicenseAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseAssignmentInsert
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseAssignmentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etags, as: 'etags'
          property :kind, as: 'kind'
          property :product_id, as: 'productId'
          property :product_name, as: 'productName'
          property :self_link, as: 'selfLink'
          property :sku_id, as: 'skuId'
          property :sku_name, as: 'skuName'
          property :user_id, as: 'userId'
        end
      end
      
      class LicenseAssignmentInsert
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :user_id, as: 'userId'
        end
      end
      
      class LicenseAssignmentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::LicensingV1::LicenseAssignment, decorator: Google::Apis::LicensingV1::LicenseAssignment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
