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

require 'google/apis/admin_datatransfer_v1/service.rb'
require 'google/apis/admin_datatransfer_v1/classes.rb'
require 'google/apis/admin_datatransfer_v1/representations.rb'

module Google
  module Apis
    # Admin Data Transfer API
    #
    # Transfers user data from one user to another.
    #
    # @see https://developers.google.com/admin-sdk/data-transfer/
    module AdminDatatransferV1
      VERSION = 'DatatransferV1'
      REVISION = '20190829'

      # View and manage data transfers between users in your organization
      AUTH_ADMIN_DATATRANSFER = 'https://www.googleapis.com/auth/admin.datatransfer'

      # View data transfers between users in your organization
      AUTH_ADMIN_DATATRANSFER_READONLY = 'https://www.googleapis.com/auth/admin.datatransfer.readonly'
    end
  end
end
