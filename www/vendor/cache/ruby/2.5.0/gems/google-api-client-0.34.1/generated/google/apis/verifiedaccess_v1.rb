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

require 'google/apis/verifiedaccess_v1/service.rb'
require 'google/apis/verifiedaccess_v1/classes.rb'
require 'google/apis/verifiedaccess_v1/representations.rb'

module Google
  module Apis
    # Verified Access API
    #
    # API for Verified Access chrome extension to provide credential verification
    # for chrome devices connecting to an enterprise network
    #
    # @see https://www.google.com/work/chrome/
    module VerifiedaccessV1
      VERSION = 'V1'
      REVISION = '20190718'

      # Verify your enterprise credentials
      AUTH_VERIFIEDACCESS = 'https://www.googleapis.com/auth/verifiedaccess'
    end
  end
end
