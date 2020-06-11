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

require 'google/apis/run_v1beta1/service.rb'
require 'google/apis/run_v1beta1/classes.rb'
require 'google/apis/run_v1beta1/representations.rb'

module Google
  module Apis
    # Cloud Run API
    #
    # Deploy and manage user provided container images that scale automatically
    # based on HTTP traffic.
    #
    # @see https://cloud.google.com/run/
    module RunV1beta1
      VERSION = 'V1beta1'
      REVISION = '20190927'
    end
  end
end
