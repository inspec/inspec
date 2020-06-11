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

require 'google/apis/cloudtrace_v1/service.rb'
require 'google/apis/cloudtrace_v1/classes.rb'
require 'google/apis/cloudtrace_v1/representations.rb'

module Google
  module Apis
    # Stackdriver Trace API
    #
    # Sends application trace data to Stackdriver Trace for viewing. Trace data is
    # collected for all App Engine applications by default. Trace data from other
    # applications can be provided using this API. This library is used to interact
    # with the Trace API directly. If you are looking to instrument your application
    # for Stackdriver Trace, we recommend using OpenCensus.
    #
    # @see https://cloud.google.com/trace
    module CloudtraceV1
      VERSION = 'V1'
      REVISION = '20190917'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Write Trace data for a project or application
      AUTH_TRACE_APPEND = 'https://www.googleapis.com/auth/trace.append'

      # Read Trace data for a project or application
      AUTH_TRACE_READONLY = 'https://www.googleapis.com/auth/trace.readonly'
    end
  end
end
