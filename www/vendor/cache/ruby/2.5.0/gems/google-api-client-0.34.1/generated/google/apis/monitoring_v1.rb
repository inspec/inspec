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

require 'google/apis/monitoring_v1/service.rb'
require 'google/apis/monitoring_v1/classes.rb'
require 'google/apis/monitoring_v1/representations.rb'

module Google
  module Apis
    # Stackdriver Monitoring API
    #
    # Manages your Stackdriver Monitoring data and configurations. Most projects
    # must be associated with a Stackdriver account, with a few exceptions as noted
    # on the individual method pages. The table entries below are presented in
    # alphabetical order, not in order of common use. For explanations of the
    # concepts found in the table entries, read the Stackdriver Monitoring
    # documentation.
    #
    # @see https://cloud.google.com/monitoring/api/
    module MonitoringV1
      VERSION = 'V1'
      REVISION = '20191005'
    end
  end
end
