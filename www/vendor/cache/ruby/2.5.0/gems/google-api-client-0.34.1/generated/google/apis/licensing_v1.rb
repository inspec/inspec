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

require 'google/apis/licensing_v1/service.rb'
require 'google/apis/licensing_v1/classes.rb'
require 'google/apis/licensing_v1/representations.rb'

module Google
  module Apis
    # Licensing API
    #
    # Licensing API to view and manage licenses for your domain
    #
    # @see https://developers.google.com/admin-sdk/licensing/
    module LicensingV1
      VERSION = 'V1'
      REVISION = '20190916'

      # View and manage G Suite licenses for your domain
      AUTH_APPS_LICENSING = 'https://www.googleapis.com/auth/apps.licensing'
    end
  end
end
