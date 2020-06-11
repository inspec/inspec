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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module CloudtraceV1
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTracesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Trace
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TraceSpan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Traces
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListTracesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :traces, as: 'traces', class: Google::Apis::CloudtraceV1::Trace, decorator: Google::Apis::CloudtraceV1::Trace::Representation
      
        end
      end
      
      class Trace
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          collection :spans, as: 'spans', class: Google::Apis::CloudtraceV1::TraceSpan, decorator: Google::Apis::CloudtraceV1::TraceSpan::Representation
      
          property :trace_id, as: 'traceId'
        end
      end
      
      class TraceSpan
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :kind, as: 'kind'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :parent_span_id, :numeric_string => true, as: 'parentSpanId'
          property :span_id, :numeric_string => true, as: 'spanId'
          property :start_time, as: 'startTime'
        end
      end
      
      class Traces
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :traces, as: 'traces', class: Google::Apis::CloudtraceV1::Trace, decorator: Google::Apis::CloudtraceV1::Trace::Representation
      
        end
      end
    end
  end
end
