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
      
      class Annotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttributeValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attributes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchWriteSpansRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Link
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Links
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessageEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Module
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Span
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StackFrame
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StackFrames
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StackTrace
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeEvents
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TruncatableString
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Annotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attributes, as: 'attributes', class: Google::Apis::CloudtraceV2::Attributes, decorator: Google::Apis::CloudtraceV2::Attributes::Representation
      
          property :description, as: 'description', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
        end
      end
      
      class AttributeValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bool_value, as: 'boolValue'
          property :int_value, :numeric_string => true, as: 'intValue'
          property :string_value, as: 'stringValue', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
        end
      end
      
      class Attributes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attribute_map, as: 'attributeMap', class: Google::Apis::CloudtraceV2::AttributeValue, decorator: Google::Apis::CloudtraceV2::AttributeValue::Representation
      
          property :dropped_attributes_count, as: 'droppedAttributesCount'
        end
      end
      
      class BatchWriteSpansRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :spans, as: 'spans', class: Google::Apis::CloudtraceV2::Span, decorator: Google::Apis::CloudtraceV2::Span::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Link
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attributes, as: 'attributes', class: Google::Apis::CloudtraceV2::Attributes, decorator: Google::Apis::CloudtraceV2::Attributes::Representation
      
          property :span_id, as: 'spanId'
          property :trace_id, as: 'traceId'
          property :type, as: 'type'
        end
      end
      
      class Links
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dropped_links_count, as: 'droppedLinksCount'
          collection :link, as: 'link', class: Google::Apis::CloudtraceV2::Link, decorator: Google::Apis::CloudtraceV2::Link::Representation
      
        end
      end
      
      class MessageEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compressed_size_bytes, :numeric_string => true, as: 'compressedSizeBytes'
          property :id, :numeric_string => true, as: 'id'
          property :type, as: 'type'
          property :uncompressed_size_bytes, :numeric_string => true, as: 'uncompressedSizeBytes'
        end
      end
      
      class Module
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :build_id, as: 'buildId', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
          property :module, as: 'module', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
        end
      end
      
      class Span
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attributes, as: 'attributes', class: Google::Apis::CloudtraceV2::Attributes, decorator: Google::Apis::CloudtraceV2::Attributes::Representation
      
          property :child_span_count, as: 'childSpanCount'
          property :display_name, as: 'displayName', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
          property :end_time, as: 'endTime'
          property :links, as: 'links', class: Google::Apis::CloudtraceV2::Links, decorator: Google::Apis::CloudtraceV2::Links::Representation
      
          property :name, as: 'name'
          property :parent_span_id, as: 'parentSpanId'
          property :same_process_as_parent_span, as: 'sameProcessAsParentSpan'
          property :span_id, as: 'spanId'
          property :span_kind, as: 'spanKind'
          property :stack_trace, as: 'stackTrace', class: Google::Apis::CloudtraceV2::StackTrace, decorator: Google::Apis::CloudtraceV2::StackTrace::Representation
      
          property :start_time, as: 'startTime'
          property :status, as: 'status', class: Google::Apis::CloudtraceV2::Status, decorator: Google::Apis::CloudtraceV2::Status::Representation
      
          property :time_events, as: 'timeEvents', class: Google::Apis::CloudtraceV2::TimeEvents, decorator: Google::Apis::CloudtraceV2::TimeEvents::Representation
      
        end
      end
      
      class StackFrame
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_number, :numeric_string => true, as: 'columnNumber'
          property :file_name, as: 'fileName', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
          property :function_name, as: 'functionName', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
          property :line_number, :numeric_string => true, as: 'lineNumber'
          property :load_module, as: 'loadModule', class: Google::Apis::CloudtraceV2::Module, decorator: Google::Apis::CloudtraceV2::Module::Representation
      
          property :original_function_name, as: 'originalFunctionName', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
          property :source_version, as: 'sourceVersion', class: Google::Apis::CloudtraceV2::TruncatableString, decorator: Google::Apis::CloudtraceV2::TruncatableString::Representation
      
        end
      end
      
      class StackFrames
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dropped_frames_count, as: 'droppedFramesCount'
          collection :frame, as: 'frame', class: Google::Apis::CloudtraceV2::StackFrame, decorator: Google::Apis::CloudtraceV2::StackFrame::Representation
      
        end
      end
      
      class StackTrace
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stack_frames, as: 'stackFrames', class: Google::Apis::CloudtraceV2::StackFrames, decorator: Google::Apis::CloudtraceV2::StackFrames::Representation
      
          property :stack_trace_hash_id, :numeric_string => true, as: 'stackTraceHashId'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class TimeEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annotation, as: 'annotation', class: Google::Apis::CloudtraceV2::Annotation, decorator: Google::Apis::CloudtraceV2::Annotation::Representation
      
          property :message_event, as: 'messageEvent', class: Google::Apis::CloudtraceV2::MessageEvent, decorator: Google::Apis::CloudtraceV2::MessageEvent::Representation
      
          property :time, as: 'time'
        end
      end
      
      class TimeEvents
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dropped_annotations_count, as: 'droppedAnnotationsCount'
          property :dropped_message_events_count, as: 'droppedMessageEventsCount'
          collection :time_event, as: 'timeEvent', class: Google::Apis::CloudtraceV2::TimeEvent, decorator: Google::Apis::CloudtraceV2::TimeEvent::Representation
      
        end
      end
      
      class TruncatableString
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :truncated_byte_count, as: 'truncatedByteCount'
          property :value, as: 'value'
        end
      end
    end
  end
end
