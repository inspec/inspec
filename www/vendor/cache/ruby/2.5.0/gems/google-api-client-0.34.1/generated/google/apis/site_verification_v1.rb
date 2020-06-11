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

require 'google/apis/site_verification_v1/service.rb'
require 'google/apis/site_verification_v1/classes.rb'
require 'google/apis/site_verification_v1/representations.rb'

module Google
  module Apis
    # Google Site Verification API
    #
    # Verifies ownership of websites or domains with Google.
    #
    # @see https://developers.google.com/site-verification/
    module SiteVerificationV1
      VERSION = 'V1'
      REVISION = '20180521'

      # Manage the list of sites and domains you control
      AUTH_SITEVERIFICATION = 'https://www.googleapis.com/auth/siteverification'

      # Manage your new site verifications with Google
      AUTH_SITEVERIFICATION_VERIFY_ONLY = 'https://www.googleapis.com/auth/siteverification.verify_only'
    end
  end
end
