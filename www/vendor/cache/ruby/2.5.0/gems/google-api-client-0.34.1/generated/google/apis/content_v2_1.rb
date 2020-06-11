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

require 'google/apis/content_v2_1/service.rb'
require 'google/apis/content_v2_1/classes.rb'
require 'google/apis/content_v2_1/representations.rb'

module Google
  module Apis
    # Content API for Shopping
    #
    # Manages product items, inventory, and Merchant Center accounts for Google
    # Shopping.
    #
    # @see https://developers.google.com/shopping-content
    module ContentV2_1
      VERSION = 'V2_1'
      REVISION = '20191008'

      # Manage your product listings and accounts for Google Shopping
      AUTH_CONTENT = 'https://www.googleapis.com/auth/content'
    end
  end
end
