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
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The response message for the `ListTraces` method.
      class ListTracesResponse
        include Google::Apis::Core::Hashable
      
        # If defined, indicates that there are more traces that match the request
        # and that this value should be passed to the next request to continue
        # retrieving additional traces.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of trace records as specified by the view parameter.
        # Corresponds to the JSON property `traces`
        # @return [Array<Google::Apis::CloudtraceV1::Trace>]
        attr_accessor :traces
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @traces = args[:traces] if args.key?(:traces)
        end
      end
      
      # A trace describes how long it takes for an application to perform an
      # operation. It consists of a set of spans, each of which represent a single
      # timed event within the operation.
      class Trace
        include Google::Apis::Core::Hashable
      
        # Project ID of the Cloud project where the trace data is stored.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Collection of spans in the trace.
        # Corresponds to the JSON property `spans`
        # @return [Array<Google::Apis::CloudtraceV1::TraceSpan>]
        attr_accessor :spans
      
        # Globally unique identifier for the trace. This identifier is a 128-bit
        # numeric value formatted as a 32-byte hex string. For example,
        # `382d4f4c6b7bb2f4a972559d9085001d`.
        # Corresponds to the JSON property `traceId`
        # @return [String]
        attr_accessor :trace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @spans = args[:spans] if args.key?(:spans)
          @trace_id = args[:trace_id] if args.key?(:trace_id)
        end
      end
      
      # A span represents a single timed event within a trace. Spans can be nested
      # and form a trace tree. Often, a trace contains a root span that describes the
      # end-to-end latency of an operation and, optionally, one or more subspans for
      # its suboperations. Spans do not need to be contiguous. There may be gaps
      # between spans in a trace.
      class TraceSpan
        include Google::Apis::Core::Hashable
      
        # End time of the span in nanoseconds from the UNIX epoch.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Distinguishes between spans generated in a particular context. For example,
        # two spans with the same name may be distinguished using `RPC_CLIENT`
        # and `RPC_SERVER` to identify queueing latency associated with the span.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Collection of labels associated with the span. Label keys must be less than
        # 128 bytes. Label values must be less than 16 kilobytes (10MB for
        # `/stacktrace` values).
        # Some predefined label keys exist, or you may create your own. When creating
        # your own, we recommend the following formats:
        # * `/category/product/key` for agents of well-known products (e.g.
        # `/db/mongodb/read_size`).
        # * `short_host/path/key` for domain-specific keys (e.g.
        # `foo.com/myproduct/bar`)
        # Predefined labels include:
        # *   `/agent`
        # *   `/component`
        # *   `/error/message`
        # *   `/error/name`
        # *   `/http/client_city`
        # *   `/http/client_country`
        # *   `/http/client_protocol`
        # *   `/http/client_region`
        # *   `/http/host`
        # *   `/http/method`
        # *   `/http/path`
        # *   `/http/redirected_url`
        # *   `/http/request/size`
        # *   `/http/response/size`
        # *   `/http/route`
        # *   `/http/status_code`
        # *   `/http/url`
        # *   `/http/user_agent`
        # *   `/pid`
        # *   `/stacktrace`
        # *   `/tid`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Name of the span. Must be less than 128 bytes. The span name is sanitized
        # and displayed in the Stackdriver Trace tool in the
        # Google Cloud Platform Console.
        # The name may be a method name or some other per-call site name.
        # For the same executable and the same call point, a best practice is
        # to use a consistent name, which makes it easier to correlate
        # cross-trace spans.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. ID of the parent span, if any.
        # Corresponds to the JSON property `parentSpanId`
        # @return [Fixnum]
        attr_accessor :parent_span_id
      
        # Identifier for the span. Must be a 64-bit integer other than 0 and
        # unique within a trace. For example, `2205310701640571284`.
        # Corresponds to the JSON property `spanId`
        # @return [Fixnum]
        attr_accessor :span_id
      
        # Start time of the span in nanoseconds from the UNIX epoch.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @parent_span_id = args[:parent_span_id] if args.key?(:parent_span_id)
          @span_id = args[:span_id] if args.key?(:span_id)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # List of new or updated traces.
      class Traces
        include Google::Apis::Core::Hashable
      
        # List of traces.
        # Corresponds to the JSON property `traces`
        # @return [Array<Google::Apis::CloudtraceV1::Trace>]
        attr_accessor :traces
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @traces = args[:traces] if args.key?(:traces)
        end
      end
    end
  end
end
