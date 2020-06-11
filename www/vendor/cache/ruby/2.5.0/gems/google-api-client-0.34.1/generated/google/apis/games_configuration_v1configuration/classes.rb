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
    module GamesConfigurationV1configuration
      
      # This is a JSON template for an achievement configuration resource.
      class AchievementConfiguration
        include Google::Apis::Core::Hashable
      
        # The type of the achievement.
        # Possible values are:
        # - "STANDARD" - Achievement is either locked or unlocked.
        # - "INCREMENTAL" - Achievement is incremental.
        # Corresponds to the JSON property `achievementType`
        # @return [String]
        attr_accessor :achievement_type
      
        # This is a JSON template for an achievement configuration detail.
        # Corresponds to the JSON property `draft`
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfigurationDetail]
        attr_accessor :draft
      
        # The ID of the achievement.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The initial state of the achievement.
        # Possible values are:
        # - "HIDDEN" - Achievement is hidden.
        # - "REVEALED" - Achievement is revealed.
        # - "UNLOCKED" - Achievement is unlocked.
        # Corresponds to the JSON property `initialState`
        # @return [String]
        attr_accessor :initial_state
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#achievementConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for an achievement configuration detail.
        # Corresponds to the JSON property `published`
        # @return [Google::Apis::GamesConfigurationV1configuration::AchievementConfigurationDetail]
        attr_accessor :published
      
        # Steps to unlock. Only applicable to incremental achievements.
        # Corresponds to the JSON property `stepsToUnlock`
        # @return [Fixnum]
        attr_accessor :steps_to_unlock
      
        # The token for this resource.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @achievement_type = args[:achievement_type] if args.key?(:achievement_type)
          @draft = args[:draft] if args.key?(:draft)
          @id = args[:id] if args.key?(:id)
          @initial_state = args[:initial_state] if args.key?(:initial_state)
          @kind = args[:kind] if args.key?(:kind)
          @published = args[:published] if args.key?(:published)
          @steps_to_unlock = args[:steps_to_unlock] if args.key?(:steps_to_unlock)
          @token = args[:token] if args.key?(:token)
        end
      end
      
      # This is a JSON template for an achievement configuration detail.
      class AchievementConfigurationDetail
        include Google::Apis::Core::Hashable
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `description`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :description
      
        # The icon url of this achievement. Writes to this field are ignored.
        # Corresponds to the JSON property `iconUrl`
        # @return [String]
        attr_accessor :icon_url
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#achievementConfigurationDetail.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `name`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :name
      
        # Point value for the achievement.
        # Corresponds to the JSON property `pointValue`
        # @return [Fixnum]
        attr_accessor :point_value
      
        # The sort rank of this achievement. Writes to this field are ignored.
        # Corresponds to the JSON property `sortRank`
        # @return [Fixnum]
        attr_accessor :sort_rank
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @icon_url = args[:icon_url] if args.key?(:icon_url)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @point_value = args[:point_value] if args.key?(:point_value)
          @sort_rank = args[:sort_rank] if args.key?(:sort_rank)
        end
      end
      
      # This is a JSON template for a ListConfigurations response.
      class ListAchievementConfigurationResponse
        include Google::Apis::Core::Hashable
      
        # The achievement configurations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::GamesConfigurationV1configuration::AchievementConfiguration>]
        attr_accessor :items
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string games#achievementConfigurationListResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The pagination token for the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # This is a JSON template for a number affix resource.
      class GamesNumberAffixConfiguration
        include Google::Apis::Core::Hashable
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `few`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :few
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `many`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :many
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `one`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :one
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `other`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :other
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `two`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :two
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `zero`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :zero
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @few = args[:few] if args.key?(:few)
          @many = args[:many] if args.key?(:many)
          @one = args[:one] if args.key?(:one)
          @other = args[:other] if args.key?(:other)
          @two = args[:two] if args.key?(:two)
          @zero = args[:zero] if args.key?(:zero)
        end
      end
      
      # This is a JSON template for a number format resource.
      class GamesNumberFormatConfiguration
        include Google::Apis::Core::Hashable
      
        # The curreny code string. Only used for CURRENCY format type.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # The number of decimal places for number. Only used for NUMERIC format type.
        # Corresponds to the JSON property `numDecimalPlaces`
        # @return [Fixnum]
        attr_accessor :num_decimal_places
      
        # The formatting for the number.
        # Possible values are:
        # - "NUMERIC" - Numbers are formatted to have no digits or a fixed number of
        # digits after the decimal point according to locale. An optional custom unit
        # can be added.
        # - "TIME_DURATION" - Numbers are formatted to hours, minutes and seconds.
        # - "CURRENCY" - Numbers are formatted to currency according to locale.
        # Corresponds to the JSON property `numberFormatType`
        # @return [String]
        attr_accessor :number_format_type
      
        # This is a JSON template for a number affix resource.
        # Corresponds to the JSON property `suffix`
        # @return [Google::Apis::GamesConfigurationV1configuration::GamesNumberAffixConfiguration]
        attr_accessor :suffix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @num_decimal_places = args[:num_decimal_places] if args.key?(:num_decimal_places)
          @number_format_type = args[:number_format_type] if args.key?(:number_format_type)
          @suffix = args[:suffix] if args.key?(:suffix)
        end
      end
      
      # This is a JSON template for an image configuration resource.
      class ImageConfiguration
        include Google::Apis::Core::Hashable
      
        # The image type for the image.
        # Corresponds to the JSON property `imageType`
        # @return [String]
        attr_accessor :image_type
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#imageConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The resource ID of resource which the image belongs to.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # The url for this image.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_type = args[:image_type] if args.key?(:image_type)
          @kind = args[:kind] if args.key?(:kind)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # This is a JSON template for an leaderboard configuration resource.
      class LeaderboardConfiguration
        include Google::Apis::Core::Hashable
      
        # This is a JSON template for a leaderboard configuration detail.
        # Corresponds to the JSON property `draft`
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfigurationDetail]
        attr_accessor :draft
      
        # The ID of the leaderboard.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#leaderboardConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for a leaderboard configuration detail.
        # Corresponds to the JSON property `published`
        # @return [Google::Apis::GamesConfigurationV1configuration::LeaderboardConfigurationDetail]
        attr_accessor :published
      
        # Maximum score that can be posted to this leaderboard.
        # Corresponds to the JSON property `scoreMax`
        # @return [Fixnum]
        attr_accessor :score_max
      
        # Minimum score that can be posted to this leaderboard.
        # Corresponds to the JSON property `scoreMin`
        # @return [Fixnum]
        attr_accessor :score_min
      
        # The type of the leaderboard.
        # Possible values are:
        # - "LARGER_IS_BETTER" - Larger scores posted are ranked higher.
        # - "SMALLER_IS_BETTER" - Smaller scores posted are ranked higher.
        # Corresponds to the JSON property `scoreOrder`
        # @return [String]
        attr_accessor :score_order
      
        # The token for this resource.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @draft = args[:draft] if args.key?(:draft)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @published = args[:published] if args.key?(:published)
          @score_max = args[:score_max] if args.key?(:score_max)
          @score_min = args[:score_min] if args.key?(:score_min)
          @score_order = args[:score_order] if args.key?(:score_order)
          @token = args[:token] if args.key?(:token)
        end
      end
      
      # This is a JSON template for a leaderboard configuration detail.
      class LeaderboardConfigurationDetail
        include Google::Apis::Core::Hashable
      
        # The icon url of this leaderboard. Writes to this field are ignored.
        # Corresponds to the JSON property `iconUrl`
        # @return [String]
        attr_accessor :icon_url
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#leaderboardConfigurationDetail.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is a JSON template for a localized string bundle resource.
        # Corresponds to the JSON property `name`
        # @return [Google::Apis::GamesConfigurationV1configuration::LocalizedStringBundle]
        attr_accessor :name
      
        # This is a JSON template for a number format resource.
        # Corresponds to the JSON property `scoreFormat`
        # @return [Google::Apis::GamesConfigurationV1configuration::GamesNumberFormatConfiguration]
        attr_accessor :score_format
      
        # The sort rank of this leaderboard. Writes to this field are ignored.
        # Corresponds to the JSON property `sortRank`
        # @return [Fixnum]
        attr_accessor :sort_rank
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @icon_url = args[:icon_url] if args.key?(:icon_url)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @score_format = args[:score_format] if args.key?(:score_format)
          @sort_rank = args[:sort_rank] if args.key?(:sort_rank)
        end
      end
      
      # This is a JSON template for a ListConfigurations response.
      class ListLeaderboardConfigurationResponse
        include Google::Apis::Core::Hashable
      
        # The leaderboard configurations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::GamesConfigurationV1configuration::LeaderboardConfiguration>]
        attr_accessor :items
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string games#leaderboardConfigurationListResponse.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The pagination token for the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # This is a JSON template for a localized string resource.
      class LocalizedString
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#localizedString.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The locale string.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The string value.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @locale = args[:locale] if args.key?(:locale)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # This is a JSON template for a localized string bundle resource.
      class LocalizedStringBundle
        include Google::Apis::Core::Hashable
      
        # Uniquely identifies the type of this resource. Value is always the fixed
        # string gamesConfiguration#localizedStringBundle.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The locale strings.
        # Corresponds to the JSON property `translations`
        # @return [Array<Google::Apis::GamesConfigurationV1configuration::LocalizedString>]
        attr_accessor :translations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @translations = args[:translations] if args.key?(:translations)
        end
      end
    end
  end
end
