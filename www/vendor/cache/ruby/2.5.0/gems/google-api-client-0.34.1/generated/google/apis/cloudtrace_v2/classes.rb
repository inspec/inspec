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
    module CloudtraceV2
      
      # Text annotation with a set of attributes.
      class Annotation
        include Google::Apis::Core::Hashable
      
        # A set of attributes, each in the format `[KEY]:[VALUE]`.
        # Corresponds to the JSON property `attributes`
        # @return [Google::Apis::CloudtraceV2::Attributes]
        attr_accessor :attributes
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `description`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # The allowed types for [VALUE] in a `[KEY]:[VALUE]` attribute.
      class AttributeValue
        include Google::Apis::Core::Hashable
      
        # A Boolean value represented by `true` or `false`.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # A 64-bit signed integer.
        # Corresponds to the JSON property `intValue`
        # @return [Fixnum]
        attr_accessor :int_value
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `stringValue`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @int_value = args[:int_value] if args.key?(:int_value)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # A set of attributes, each in the format `[KEY]:[VALUE]`.
      class Attributes
        include Google::Apis::Core::Hashable
      
        # The set of attributes. Each attribute's key can be up to 128 bytes
        # long. The value can be a string up to 256 bytes, a signed 64-bit integer,
        # or the Boolean values `true` and `false`. For example:
        # "/instance_id": "my-instance"
        # "/http/user_agent": ""
        # "/http/request_bytes": 300
        # "abc.com/myattribute": true
        # Corresponds to the JSON property `attributeMap`
        # @return [Hash<String,Google::Apis::CloudtraceV2::AttributeValue>]
        attr_accessor :attribute_map
      
        # The number of attributes that were discarded. Attributes can be discarded
        # because their keys are too long or because there are too many attributes.
        # If this value is 0 then all attributes are valid.
        # Corresponds to the JSON property `droppedAttributesCount`
        # @return [Fixnum]
        attr_accessor :dropped_attributes_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_map = args[:attribute_map] if args.key?(:attribute_map)
          @dropped_attributes_count = args[:dropped_attributes_count] if args.key?(:dropped_attributes_count)
        end
      end
      
      # The request message for the `BatchWriteSpans` method.
      class BatchWriteSpansRequest
        include Google::Apis::Core::Hashable
      
        # Required. A list of new spans. The span names must not match existing
        # spans, or the results are undefined.
        # Corresponds to the JSON property `spans`
        # @return [Array<Google::Apis::CloudtraceV2::Span>]
        attr_accessor :spans
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @spans = args[:spans] if args.key?(:spans)
        end
      end
      
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
      
      # A pointer from the current span to another span in the same trace or in a
      # different trace. For example, this can be used in batching operations,
      # where a single batch handler processes multiple requests from different
      # traces or when the handler receives a request from a different project.
      class Link
        include Google::Apis::Core::Hashable
      
        # A set of attributes, each in the format `[KEY]:[VALUE]`.
        # Corresponds to the JSON property `attributes`
        # @return [Google::Apis::CloudtraceV2::Attributes]
        attr_accessor :attributes
      
        # The [SPAN_ID] for a span within a trace.
        # Corresponds to the JSON property `spanId`
        # @return [String]
        attr_accessor :span_id
      
        # The [TRACE_ID] for a trace within a project.
        # Corresponds to the JSON property `traceId`
        # @return [String]
        attr_accessor :trace_id
      
        # The relationship of the current span relative to the linked span.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @span_id = args[:span_id] if args.key?(:span_id)
          @trace_id = args[:trace_id] if args.key?(:trace_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A collection of links, which are references from this span to a span
      # in the same or different trace.
      class Links
        include Google::Apis::Core::Hashable
      
        # The number of dropped links after the maximum size was enforced. If
        # this value is 0, then no links were dropped.
        # Corresponds to the JSON property `droppedLinksCount`
        # @return [Fixnum]
        attr_accessor :dropped_links_count
      
        # A collection of links.
        # Corresponds to the JSON property `link`
        # @return [Array<Google::Apis::CloudtraceV2::Link>]
        attr_accessor :link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dropped_links_count = args[:dropped_links_count] if args.key?(:dropped_links_count)
          @link = args[:link] if args.key?(:link)
        end
      end
      
      # An event describing a message sent/received between Spans.
      class MessageEvent
        include Google::Apis::Core::Hashable
      
        # The number of compressed bytes sent or received. If missing assumed to
        # be the same size as uncompressed.
        # Corresponds to the JSON property `compressedSizeBytes`
        # @return [Fixnum]
        attr_accessor :compressed_size_bytes
      
        # An identifier for the MessageEvent's message that can be used to match
        # SENT and RECEIVED MessageEvents. It is recommended to be unique within
        # a Span.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Type of MessageEvent. Indicates whether the message was sent or
        # received.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The number of uncompressed bytes sent or received.
        # Corresponds to the JSON property `uncompressedSizeBytes`
        # @return [Fixnum]
        attr_accessor :uncompressed_size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compressed_size_bytes = args[:compressed_size_bytes] if args.key?(:compressed_size_bytes)
          @id = args[:id] if args.key?(:id)
          @type = args[:type] if args.key?(:type)
          @uncompressed_size_bytes = args[:uncompressed_size_bytes] if args.key?(:uncompressed_size_bytes)
        end
      end
      
      # Binary module.
      class Module
        include Google::Apis::Core::Hashable
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `buildId`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :build_id
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `module`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :module
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @build_id = args[:build_id] if args.key?(:build_id)
          @module = args[:module] if args.key?(:module)
        end
      end
      
      # A span represents a single operation within a trace. Spans can be
      # nested to form a trace tree. Often, a trace contains a root span
      # that describes the end-to-end latency, and one or more subspans for
      # its sub-operations. A trace can also contain multiple root spans,
      # or none at all. Spans do not need to be contiguous&mdash;there may be
      # gaps or overlaps between spans in a trace.
      class Span
        include Google::Apis::Core::Hashable
      
        # A set of attributes, each in the format `[KEY]:[VALUE]`.
        # Corresponds to the JSON property `attributes`
        # @return [Google::Apis::CloudtraceV2::Attributes]
        attr_accessor :attributes
      
        # Optional. The number of child spans that were generated while this span
        # was active. If set, allows implementation to detect missing child spans.
        # Corresponds to the JSON property `childSpanCount`
        # @return [Fixnum]
        attr_accessor :child_span_count
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `displayName`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :display_name
      
        # The end time of the span. On the client side, this is the time kept by
        # the local machine where the span execution ends. On the server side, this
        # is the time when the server application handler stops running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # A collection of links, which are references from this span to a span
        # in the same or different trace.
        # Corresponds to the JSON property `links`
        # @return [Google::Apis::CloudtraceV2::Links]
        attr_accessor :links
      
        # The resource name of the span in the following format:
        # projects/[PROJECT_ID]/traces/[TRACE_ID]/spans/SPAN_ID is a unique
        # identifier for a trace within a project;
        # it is a 32-character hexadecimal encoding of a 16-byte array.
        # [SPAN_ID] is a unique identifier for a span within a trace; it
        # is a 16-character hexadecimal encoding of an 8-byte array.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The [SPAN_ID] of this span's parent span. If this is a root span,
        # then this field must be empty.
        # Corresponds to the JSON property `parentSpanId`
        # @return [String]
        attr_accessor :parent_span_id
      
        # Optional. Set this parameter to indicate whether this span is in
        # the same process as its parent. If you do not set this parameter,
        # Stackdriver Trace is unable to take advantage of this helpful
        # information.
        # Corresponds to the JSON property `sameProcessAsParentSpan`
        # @return [Boolean]
        attr_accessor :same_process_as_parent_span
        alias_method :same_process_as_parent_span?, :same_process_as_parent_span
      
        # The [SPAN_ID] portion of the span's resource name.
        # Corresponds to the JSON property `spanId`
        # @return [String]
        attr_accessor :span_id
      
        # Distinguishes between spans generated in a particular context. For example,
        # two spans with the same name may be distinguished using `CLIENT` (caller)
        # and `SERVER` (callee) to identify an RPC call.
        # Corresponds to the JSON property `spanKind`
        # @return [String]
        attr_accessor :span_kind
      
        # A call stack appearing in a trace.
        # Corresponds to the JSON property `stackTrace`
        # @return [Google::Apis::CloudtraceV2::StackTrace]
        attr_accessor :stack_trace
      
        # The start time of the span. On the client side, this is the time kept by
        # the local machine where the span execution starts. On the server side, this
        # is the time when the server's application handler starts running.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::CloudtraceV2::Status]
        attr_accessor :status
      
        # A collection of `TimeEvent`s. A `TimeEvent` is a time-stamped annotation
        # on the span, consisting of either user-supplied key:value pairs, or
        # details of a message sent/received between Spans.
        # Corresponds to the JSON property `timeEvents`
        # @return [Google::Apis::CloudtraceV2::TimeEvents]
        attr_accessor :time_events
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @child_span_count = args[:child_span_count] if args.key?(:child_span_count)
          @display_name = args[:display_name] if args.key?(:display_name)
          @end_time = args[:end_time] if args.key?(:end_time)
          @links = args[:links] if args.key?(:links)
          @name = args[:name] if args.key?(:name)
          @parent_span_id = args[:parent_span_id] if args.key?(:parent_span_id)
          @same_process_as_parent_span = args[:same_process_as_parent_span] if args.key?(:same_process_as_parent_span)
          @span_id = args[:span_id] if args.key?(:span_id)
          @span_kind = args[:span_kind] if args.key?(:span_kind)
          @stack_trace = args[:stack_trace] if args.key?(:stack_trace)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @time_events = args[:time_events] if args.key?(:time_events)
        end
      end
      
      # Represents a single stack frame in a stack trace.
      class StackFrame
        include Google::Apis::Core::Hashable
      
        # The column number where the function call appears, if available.
        # This is important in JavaScript because of its anonymous functions.
        # Corresponds to the JSON property `columnNumber`
        # @return [Fixnum]
        attr_accessor :column_number
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `fileName`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :file_name
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `functionName`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :function_name
      
        # The line number in `file_name` where the function call appears.
        # Corresponds to the JSON property `lineNumber`
        # @return [Fixnum]
        attr_accessor :line_number
      
        # Binary module.
        # Corresponds to the JSON property `loadModule`
        # @return [Google::Apis::CloudtraceV2::Module]
        attr_accessor :load_module
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `originalFunctionName`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :original_function_name
      
        # Represents a string that might be shortened to a specified length.
        # Corresponds to the JSON property `sourceVersion`
        # @return [Google::Apis::CloudtraceV2::TruncatableString]
        attr_accessor :source_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_number = args[:column_number] if args.key?(:column_number)
          @file_name = args[:file_name] if args.key?(:file_name)
          @function_name = args[:function_name] if args.key?(:function_name)
          @line_number = args[:line_number] if args.key?(:line_number)
          @load_module = args[:load_module] if args.key?(:load_module)
          @original_function_name = args[:original_function_name] if args.key?(:original_function_name)
          @source_version = args[:source_version] if args.key?(:source_version)
        end
      end
      
      # A collection of stack frames, which can be truncated.
      class StackFrames
        include Google::Apis::Core::Hashable
      
        # The number of stack frames that were dropped because there
        # were too many stack frames.
        # If this value is 0, then no stack frames were dropped.
        # Corresponds to the JSON property `droppedFramesCount`
        # @return [Fixnum]
        attr_accessor :dropped_frames_count
      
        # Stack frames in this call stack.
        # Corresponds to the JSON property `frame`
        # @return [Array<Google::Apis::CloudtraceV2::StackFrame>]
        attr_accessor :frame
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dropped_frames_count = args[:dropped_frames_count] if args.key?(:dropped_frames_count)
          @frame = args[:frame] if args.key?(:frame)
        end
      end
      
      # A call stack appearing in a trace.
      class StackTrace
        include Google::Apis::Core::Hashable
      
        # A collection of stack frames, which can be truncated.
        # Corresponds to the JSON property `stackFrames`
        # @return [Google::Apis::CloudtraceV2::StackFrames]
        attr_accessor :stack_frames
      
        # The hash ID is used to conserve network bandwidth for duplicate
        # stack traces within a single trace.
        # Often multiple spans will have identical stack traces.
        # The first occurrence of a stack trace should contain both the
        # `stackFrame` content and a value in `stackTraceHashId`.
        # Subsequent spans within the same request can refer
        # to that stack trace by only setting `stackTraceHashId`.
        # Corresponds to the JSON property `stackTraceHashId`
        # @return [Fixnum]
        attr_accessor :stack_trace_hash_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stack_frames = args[:stack_frames] if args.key?(:stack_frames)
          @stack_trace_hash_id = args[:stack_trace_hash_id] if args.key?(:stack_trace_hash_id)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # A time-stamped annotation or message event in the Span.
      class TimeEvent
        include Google::Apis::Core::Hashable
      
        # Text annotation with a set of attributes.
        # Corresponds to the JSON property `annotation`
        # @return [Google::Apis::CloudtraceV2::Annotation]
        attr_accessor :annotation
      
        # An event describing a message sent/received between Spans.
        # Corresponds to the JSON property `messageEvent`
        # @return [Google::Apis::CloudtraceV2::MessageEvent]
        attr_accessor :message_event
      
        # The timestamp indicating the time the event occurred.
        # Corresponds to the JSON property `time`
        # @return [String]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation = args[:annotation] if args.key?(:annotation)
          @message_event = args[:message_event] if args.key?(:message_event)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # A collection of `TimeEvent`s. A `TimeEvent` is a time-stamped annotation
      # on the span, consisting of either user-supplied key:value pairs, or
      # details of a message sent/received between Spans.
      class TimeEvents
        include Google::Apis::Core::Hashable
      
        # The number of dropped annotations in all the included time events.
        # If the value is 0, then no annotations were dropped.
        # Corresponds to the JSON property `droppedAnnotationsCount`
        # @return [Fixnum]
        attr_accessor :dropped_annotations_count
      
        # The number of dropped message events in all the included time events.
        # If the value is 0, then no message events were dropped.
        # Corresponds to the JSON property `droppedMessageEventsCount`
        # @return [Fixnum]
        attr_accessor :dropped_message_events_count
      
        # A collection of `TimeEvent`s.
        # Corresponds to the JSON property `timeEvent`
        # @return [Array<Google::Apis::CloudtraceV2::TimeEvent>]
        attr_accessor :time_event
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dropped_annotations_count = args[:dropped_annotations_count] if args.key?(:dropped_annotations_count)
          @dropped_message_events_count = args[:dropped_message_events_count] if args.key?(:dropped_message_events_count)
          @time_event = args[:time_event] if args.key?(:time_event)
        end
      end
      
      # Represents a string that might be shortened to a specified length.
      class TruncatableString
        include Google::Apis::Core::Hashable
      
        # The number of bytes removed from the original string. If this
        # value is 0, then the string was not shortened.
        # Corresponds to the JSON property `truncatedByteCount`
        # @return [Fixnum]
        attr_accessor :truncated_byte_count
      
        # The shortened string. For example, if the original string is 500
        # bytes long and the limit of the string is 128 bytes, then
        # `value` contains the first 128 bytes of the 500-byte string.
        # Truncation always happens on a UTF8 character boundary. If there
        # are multi-byte characters in the string, then the length of the
        # shortened string might be less than the size limit.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @truncated_byte_count = args[:truncated_byte_count] if args.key?(:truncated_byte_count)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
