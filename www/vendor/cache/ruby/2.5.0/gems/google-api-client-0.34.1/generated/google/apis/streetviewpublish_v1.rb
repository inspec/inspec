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

require 'google/apis/streetviewpublish_v1/service.rb'
require 'google/apis/streetviewpublish_v1/classes.rb'
require 'google/apis/streetviewpublish_v1/representations.rb'

module Google
  module Apis
    # Street View Publish API
    #
    # Publishes 360 photos to Google Maps, along with position, orientation, and
    # connectivity metadata. Apps can offer an interface for positioning, connecting,
    # and uploading user-generated Street View images.
    #
    # @see https://developers.google.com/streetview/publish/
    module StreetviewpublishV1
      VERSION = 'V1'
      REVISION = '20190917'

      # Publish and manage your 360 photos on Google Street View
      AUTH_STREETVIEWPUBLISH = 'https://www.googleapis.com/auth/streetviewpublish'
    end
  end
end
