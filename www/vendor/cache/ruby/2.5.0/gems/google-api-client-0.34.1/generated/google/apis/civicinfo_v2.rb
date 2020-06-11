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

require 'google/apis/civicinfo_v2/service.rb'
require 'google/apis/civicinfo_v2/classes.rb'
require 'google/apis/civicinfo_v2/representations.rb'

module Google
  module Apis
    # Google Civic Information API
    #
    # Provides polling places, early vote locations, contest data, election
    # officials, and government representatives for U.S. residential addresses.
    #
    # @see https://developers.google.com/civic-information
    module CivicinfoV2
      VERSION = 'V2'
      REVISION = '20191010'
    end
  end
end
