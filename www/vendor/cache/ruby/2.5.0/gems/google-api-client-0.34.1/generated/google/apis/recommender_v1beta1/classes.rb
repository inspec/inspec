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
      
      # Contains metadata about how much money a recommendation can save or incur.
      class GoogleCloudRecommenderV1beta1CostProjection
        include Google::Apis::Core::Hashable
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `cost`
        # @return [Google::Apis::RecommenderV1beta1::GoogleTypeMoney]
        attr_accessor :cost
      
        # Duration for which this cost applies.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cost = args[:cost] if args.key?(:cost)
          @duration = args[:duration] if args.key?(:duration)
        end
      end
      
      # Contains the impact a recommendation can have for a given category.
      class GoogleCloudRecommenderV1beta1Impact
        include Google::Apis::Core::Hashable
      
        # Category that is being targeted.
        # Corresponds to the JSON property `category`
        # @return [String]
        attr_accessor :category
      
        # Contains metadata about how much money a recommendation can save or incur.
        # Corresponds to the JSON property `costProjection`
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1CostProjection]
        attr_accessor :cost_projection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category = args[:category] if args.key?(:category)
          @cost_projection = args[:cost_projection] if args.key?(:cost_projection)
        end
      end
      
      # Response to the `ListRecommendations` method.
      class GoogleCloudRecommenderV1beta1ListRecommendationsResponse
        include Google::Apis::Core::Hashable
      
        # A token that can be used to request the next page of results. This field is
        # empty if there are no additional results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The set of recommendations for the `parent` resource.
        # Corresponds to the JSON property `recommendations`
        # @return [Array<Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Recommendation>]
        attr_accessor :recommendations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @recommendations = args[:recommendations] if args.key?(:recommendations)
        end
      end
      
      # Request for the `MarkRecommendationClaimed` Method.
      class GoogleCloudRecommenderV1beta1MarkRecommendationClaimedRequest
        include Google::Apis::Core::Hashable
      
        # Fingerprint of the Recommendation. Provides optimistic locking.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # State properties to include with this state. Overwrites any existing
        # `state_metadata`.
        # Corresponds to the JSON property `stateMetadata`
        # @return [Hash<String,String>]
        attr_accessor :state_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @state_metadata = args[:state_metadata] if args.key?(:state_metadata)
        end
      end
      
      # Request for the `MarkRecommendationFailed` Method.
      class GoogleCloudRecommenderV1beta1MarkRecommendationFailedRequest
        include Google::Apis::Core::Hashable
      
        # Fingerprint of the Recommendation. Provides optimistic locking.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # State properties to include with this state. Overwrites any existing
        # `state_metadata`.
        # Corresponds to the JSON property `stateMetadata`
        # @return [Hash<String,String>]
        attr_accessor :state_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @state_metadata = args[:state_metadata] if args.key?(:state_metadata)
        end
      end
      
      # Request for the `MarkRecommendationSucceeded` Method.
      class GoogleCloudRecommenderV1beta1MarkRecommendationSucceededRequest
        include Google::Apis::Core::Hashable
      
        # Fingerprint of the Recommendation. Provides optimistic locking.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # State properties to include with this state. Overwrites any existing
        # `state_metadata`.
        # Corresponds to the JSON property `stateMetadata`
        # @return [Hash<String,String>]
        attr_accessor :state_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @state_metadata = args[:state_metadata] if args.key?(:state_metadata)
        end
      end
      
      # Contains an operation for a resource loosely based on the JSON-PATCH format
      # with support for:
      # * Custom filters for describing partial array patch.
      # * Extended path values for describing nested arrays.
      # * Custom fields for describing the resource for which the operation is being
      # described.
      # * Allows extension to custom operations not natively supported by RFC6902.
      # See https://tools.ietf.org/html/rfc6902 for details on the original RFC.
      class GoogleCloudRecommenderV1beta1Operation
        include Google::Apis::Core::Hashable
      
        # Type of this operation. Contains one of 'and', 'remove', 'replace', 'move',
        # 'copy', 'test' and custom operations. This field is case-insensitive and
        # always populated.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Path to the target field being operated on. If the operation is at the
        # resource level, then path should be "/". This field is always populated.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Set of filters to apply if `path` refers to array elements or nested array
        # elements in order to narrow down to a single unique element that is being
        # tested/modified.
        # This is intended to be an exact match per filter. To perform advanced
        # matching, use path_value_matchers.
        # * Example: `
        # "/versions/*/name" : "it-123"
        # "/versions/*/targetSize/percent": 20
        # `
        # * Example: `
        # "/bindings/*/role": "roles/admin"
        # "/bindings/*/condition" : null
        # `
        # * Example: `
        # "/bindings/*/role": "roles/admin"
        # "/bindings/*/members/*" : ["x@google.com", "y@google.com"]
        # `
        # When both path_filters and path_value_matchers are set, an implicit AND
        # must be performed.
        # Corresponds to the JSON property `pathFilters`
        # @return [Hash<String,Object>]
        attr_accessor :path_filters
      
        # Similar to path_filters, this contains set of filters to apply if `path`
        # field referes to array elements. This is meant to support value matching
        # beyond exact match. To perform exact match, use path_filters.
        # When both path_filters and path_value_matchers are set, an implicit AND
        # must be performed.
        # Corresponds to the JSON property `pathValueMatchers`
        # @return [Hash<String,Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher>]
        attr_accessor :path_value_matchers
      
        # Contains the fully qualified resource name. This field is always populated.
        # ex: //cloudresourcemanager.googleapis.com/projects/foo.
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        # Type of GCP resource being modified/tested. This field is always populated.
        # Example: cloudresourcemanager.googleapis.com/Project,
        # compute.googleapis.com/Instance
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        # Can be set with action 'copy' or 'move' to indicate the source field within
        # resource or source_resource, ignored if provided for other operation types.
        # Corresponds to the JSON property `sourcePath`
        # @return [String]
        attr_accessor :source_path
      
        # Can be set with action 'copy' to copy resource configuration across
        # different resources of the same type. Example: A resource clone can be
        # done via action = 'copy', path = "/", from = "/",
        # source_resource = <source> and resource_name = <target>.
        # This field is empty for all other values of `action`.
        # Corresponds to the JSON property `sourceResource`
        # @return [String]
        attr_accessor :source_resource
      
        # Value for the `path` field. Will be set for actions:'add'/'replace'.
        # Maybe set for action: 'test'. Either this or `value_matcher` will be set
        # for 'test' operation. An exact match must be performed.
        # Corresponds to the JSON property `value`
        # @return [Object]
        attr_accessor :value
      
        # Contains various matching options for values for a GCP resource field.
        # Corresponds to the JSON property `valueMatcher`
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1ValueMatcher]
        attr_accessor :value_matcher
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @path = args[:path] if args.key?(:path)
          @path_filters = args[:path_filters] if args.key?(:path_filters)
          @path_value_matchers = args[:path_value_matchers] if args.key?(:path_value_matchers)
          @resource = args[:resource] if args.key?(:resource)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
          @source_path = args[:source_path] if args.key?(:source_path)
          @source_resource = args[:source_resource] if args.key?(:source_resource)
          @value = args[:value] if args.key?(:value)
          @value_matcher = args[:value_matcher] if args.key?(:value_matcher)
        end
      end
      
      # Group of operations that need to be performed atomically.
      class GoogleCloudRecommenderV1beta1OperationGroup
        include Google::Apis::Core::Hashable
      
        # List of operations across one or more resources that belong to this group.
        # Loosely based on RFC6902 and should be performed in the order they appear.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # A recommendation along with a suggested action. E.g., a rightsizing
      # recommendation for an underutilized VM, IAM role recommendations, etc
      class GoogleCloudRecommenderV1beta1Recommendation
        include Google::Apis::Core::Hashable
      
        # Optional set of additional impact that this recommendation may have when
        # trying to optimize for the primary category. These may be positive
        # or negative.
        # Corresponds to the JSON property `additionalImpact`
        # @return [Array<Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact>]
        attr_accessor :additional_impact
      
        # Contains what resources are changing and how they are changing.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationContent]
        attr_accessor :content
      
        # Free-form human readable summary in English. The maximum length is 500
        # characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Fingerprint of the Recommendation. Provides optimistic locking when
        # updating states.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Last time this recommendation was refreshed by the system that created it
        # in the first place.
        # Corresponds to the JSON property `lastRefreshTime`
        # @return [String]
        attr_accessor :last_refresh_time
      
        # Name of recommendation.
        # A project recommendation is represented as
        # projects/[PROJECT_NUMBER]/locations/[LOCATION]/recommenders/[RECOMMENDER_ID]/
        # recommendations/[RECOMMENDATION_ID]
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Contains the impact a recommendation can have for a given category.
        # Corresponds to the JSON property `primaryImpact`
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1Impact]
        attr_accessor :primary_impact
      
        # Contains an identifier for a subtype of recommendations produced for the
        # same recommender. Subtype is a function of content and impact, meaning a
        # new subtype might be added when significant changes to `content` or
        # `primary_impact.category` are introduced. See the Recommenders section
        # to see a list of subtypes for a given Recommender.
        # Examples:
        # For recommender = "google.iam.policy.Recommender",
        # recommender_subtype can be one of "REMOVE_ROLE"/"REPLACE_ROLE"
        # Corresponds to the JSON property `recommenderSubtype`
        # @return [String]
        attr_accessor :recommender_subtype
      
        # Information for state. Contains state and metadata.
        # Corresponds to the JSON property `stateInfo`
        # @return [Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1RecommendationStateInfo]
        attr_accessor :state_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_impact = args[:additional_impact] if args.key?(:additional_impact)
          @content = args[:content] if args.key?(:content)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @last_refresh_time = args[:last_refresh_time] if args.key?(:last_refresh_time)
          @name = args[:name] if args.key?(:name)
          @primary_impact = args[:primary_impact] if args.key?(:primary_impact)
          @recommender_subtype = args[:recommender_subtype] if args.key?(:recommender_subtype)
          @state_info = args[:state_info] if args.key?(:state_info)
        end
      end
      
      # Contains what resources are changing and how they are changing.
      class GoogleCloudRecommenderV1beta1RecommendationContent
        include Google::Apis::Core::Hashable
      
        # Operations to one or more Google Cloud resources grouped in such a way
        # that, all operations within one group are expected to be performed
        # atomically and in an order.
        # Corresponds to the JSON property `operationGroups`
        # @return [Array<Google::Apis::RecommenderV1beta1::GoogleCloudRecommenderV1beta1OperationGroup>]
        attr_accessor :operation_groups
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation_groups = args[:operation_groups] if args.key?(:operation_groups)
        end
      end
      
      # Information for state. Contains state and metadata.
      class GoogleCloudRecommenderV1beta1RecommendationStateInfo
        include Google::Apis::Core::Hashable
      
        # The state of the recommendation, Eg ACTIVE, SUCCEEDED, FAILED.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # A map of metadata for the state, provided by user or automations systems.
        # Corresponds to the JSON property `stateMetadata`
        # @return [Hash<String,String>]
        attr_accessor :state_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @state_metadata = args[:state_metadata] if args.key?(:state_metadata)
        end
      end
      
      # Contains various matching options for values for a GCP resource field.
      class GoogleCloudRecommenderV1beta1ValueMatcher
        include Google::Apis::Core::Hashable
      
        # To be used for full regex matching. The regular expression is using the
        # Google RE2 syntax (https://github.com/google/re2/wiki/Syntax), so to be
        # used with RE2::FullMatch
        # Corresponds to the JSON property `matchesPattern`
        # @return [String]
        attr_accessor :matches_pattern
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @matches_pattern = args[:matches_pattern] if args.key?(:matches_pattern)
        end
      end
      
      # Represents an amount of money with its currency type.
      class GoogleTypeMoney
        include Google::Apis::Core::Hashable
      
        # The 3-letter currency code defined in ISO 4217.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # Number of nano (10^-9) units of the amount.
        # The value must be between -999,999,999 and +999,999,999 inclusive.
        # If `units` is positive, `nanos` must be positive or zero.
        # If `units` is zero, `nanos` can be positive, zero, or negative.
        # If `units` is negative, `nanos` must be negative or zero.
        # For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # The whole units of the amount.
        # For example if `currencyCode` is `"USD"`, then 1 unit is one US dollar.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @nanos = args[:nanos] if args.key?(:nanos)
          @units = args[:units] if args.key?(:units)
        end
      end
    end
  end
end
