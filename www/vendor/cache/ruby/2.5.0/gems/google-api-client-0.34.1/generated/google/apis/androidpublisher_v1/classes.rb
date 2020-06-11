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
    module AndroidpublisherV1
      
      # A SubscriptionPurchase resource indicates the status of a user's subscription
      # purchase.
      class SubscriptionPurchase
        include Google::Apis::Core::Hashable
      
        # Whether the subscription will automatically be renewed when it reaches its
        # current expiry time.
        # Corresponds to the JSON property `autoRenewing`
        # @return [Boolean]
        attr_accessor :auto_renewing
        alias_method :auto_renewing?, :auto_renewing
      
        # Time at which the subscription was granted, in milliseconds since the Epoch.
        # Corresponds to the JSON property `initiationTimestampMsec`
        # @return [Fixnum]
        attr_accessor :initiation_timestamp_msec
      
        # This kind represents a subscriptionPurchase object in the androidpublisher
        # service.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Time at which the subscription will expire, in milliseconds since the Epoch.
        # Corresponds to the JSON property `validUntilTimestampMsec`
        # @return [Fixnum]
        attr_accessor :valid_until_timestamp_msec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_renewing = args[:auto_renewing] if args.key?(:auto_renewing)
          @initiation_timestamp_msec = args[:initiation_timestamp_msec] if args.key?(:initiation_timestamp_msec)
          @kind = args[:kind] if args.key?(:kind)
          @valid_until_timestamp_msec = args[:valid_until_timestamp_msec] if args.key?(:valid_until_timestamp_msec)
        end
      end
    end
  end
end
