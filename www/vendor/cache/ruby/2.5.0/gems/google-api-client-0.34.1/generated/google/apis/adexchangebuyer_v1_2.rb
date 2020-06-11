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

require 'google/apis/adexchangebuyer_v1_2/service.rb'
require 'google/apis/adexchangebuyer_v1_2/classes.rb'
require 'google/apis/adexchangebuyer_v1_2/representations.rb'

module Google
  module Apis
    # Ad Exchange Buyer API
    #
    # Accesses your bidding-account information, submits creatives for validation,
    # finds available direct deals, and retrieves performance reports.
    #
    # @see https://developers.google.com/ad-exchange/buyer-rest
    module AdexchangebuyerV1_2
      VERSION = 'V1_2'
      REVISION = '20180222'

      # Manage your Ad Exchange buyer account configuration
      AUTH_ADEXCHANGE_BUYER = 'https://www.googleapis.com/auth/adexchange.buyer'
    end
  end
end
