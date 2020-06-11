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
    module RecommenderV1beta1
      
      class GoogleCloudRecommenderV1beta1CostProjection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1Impact
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1ListRecommendationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationClaimedRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationFailedRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationSucceededRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1OperationGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1Recommendation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1RecommendationContent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1RecommendationStateInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1ValueMatcher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeMoney
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRecommenderV1beta1CostProjection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cost, as: 'cost', class: Google::Apis::RecommenderV1beta1::GoogleTypeMoney, decorator: Google::Apis::RecommenderV1beta1::GoogleTypeMoney::Representation
      
          property :duration, as: 'duration'
        end
      end
      
      class GoogleCloudRecommenderV1beta1Impact
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :cost_projection, as: 'costProjection', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1CostProjection, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1CostProjection::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1ListRecommendationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :recommendations, as: 'recommendations', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationClaimedRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          hash :state_metadata, as: 'stateMetadata'
        end
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationFailedRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          hash :state_metadata, as: 'stateMetadata'
        end
      end
      
      class GoogleCloudRecommenderV1beta1MarkRecommendationSucceededRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          hash :state_metadata, as: 'stateMetadata'
        end
      end
      
      class GoogleCloudRecommenderV1beta1Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :path, as: 'path'
          hash :path_filters, as: 'pathFilters'
          hash :path_value_matchers, as: 'pathValueMatchers', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher::Representation
      
          property :resource, as: 'resource'
          property :resource_type, as: 'resourceType'
          property :source_path, as: 'sourcePath'
          property :source_resource, as: 'sourceResource'
          property :value, as: 'value'
          property :value_matcher, as: 'valueMatcher', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1OperationGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :operations, as: 'operations', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Operation, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Operation::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1Recommendation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_impact, as: 'additionalImpact', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact::Representation
      
          property :content, as: 'content', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationContent, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationContent::Representation
      
          property :description, as: 'description'
          property :etag, as: 'etag'
          property :last_refresh_time, as: 'lastRefreshTime'
          property :name, as: 'name'
          property :primary_impact, as: 'primaryImpact', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact::Representation
      
          property :recommender_subtype, as: 'recommenderSubtype'
          property :state_info, as: 'stateInfo', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationStateInfo, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationStateInfo::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1RecommendationContent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :operation_groups, as: 'operationGroups', class: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1OperationGroup, decorator: Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1OperationGroup::Representation
      
        end
      end
      
      class GoogleCloudRecommenderV1beta1RecommendationStateInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state'
          hash :state_metadata, as: 'stateMetadata'
        end
      end
      
      class GoogleCloudRecommenderV1beta1ValueMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :matches_pattern, as: 'matchesPattern'
        end
      end
      
      class GoogleTypeMoney
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency_code, as: 'currencyCode'
          property :nanos, as: 'nanos'
          property :units, :numeric_string => true, as: 'units'
        end
      end
    end
  end
end
