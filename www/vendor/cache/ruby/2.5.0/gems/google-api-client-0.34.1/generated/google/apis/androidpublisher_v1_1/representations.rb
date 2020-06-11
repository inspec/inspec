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
    module AndroidpublisherV1_1
      
      class InappPurchase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionPurchase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InappPurchase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumption_state, as: 'consumptionState'
          property :developer_payload, as: 'developerPayload'
          property :kind, as: 'kind'
          property :order_id, as: 'orderId'
          property :purchase_state, as: 'purchaseState'
          property :purchase_time, :numeric_string => true, as: 'purchaseTime'
          property :purchase_type, as: 'purchaseType'
        end
      end
      
      class SubscriptionPurchase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_renewing, as: 'autoRenewing'
          property :initiation_timestamp_msec, :numeric_string => true, as: 'initiationTimestampMsec'
          property :kind, as: 'kind'
          property :valid_until_timestamp_msec, :numeric_string => true, as: 'validUntilTimestampMsec'
        end
      end
    end
  end
end
