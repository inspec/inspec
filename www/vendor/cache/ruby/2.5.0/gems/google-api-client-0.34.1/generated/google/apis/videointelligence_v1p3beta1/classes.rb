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
    module VideointelligenceV1p3beta1
      
      # Video annotation progress. Included in the `metadata`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1AnnotateVideoProgress
        include Google::Apis::Core::Hashable
      
        # Progress metadata for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationProgress`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoAnnotationProgress>]
        attr_accessor :annotation_progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_progress = args[:annotation_progress] if args.key?(:annotation_progress)
        end
      end
      
      # Video annotation response. Included in the `response`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1AnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Annotation results for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationResults`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoAnnotationResults>]
        attr_accessor :annotation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
        end
      end
      
      # Detected entity from video analysis.
      class GoogleCloudVideointelligenceV1Entity
        include Google::Apis::Core::Hashable
      
        # Textual description, e.g. `Fixed-gear bicycle`.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Language code for `description` in BCP-47 format.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Explicit content annotation (based on per-frame visual signals only).
      # If no explicit content has been detected in a frame, no annotations are
      # present for that frame.
      class GoogleCloudVideointelligenceV1ExplicitContentAnnotation
        include Google::Apis::Core::Hashable
      
        # All video frames where explicit content was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1ExplicitContentFrame>]
        attr_accessor :frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frames = args[:frames] if args.key?(:frames)
        end
      end
      
      # Video frame level annotation results for explicit content.
      class GoogleCloudVideointelligenceV1ExplicitContentFrame
        include Google::Apis::Core::Hashable
      
        # Likelihood of the pornography content..
        # Corresponds to the JSON property `pornographyLikelihood`
        # @return [String]
        attr_accessor :pornography_likelihood
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pornography_likelihood = args[:pornography_likelihood] if args.key?(:pornography_likelihood)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Label annotation.
      class GoogleCloudVideointelligenceV1LabelAnnotation
        include Google::Apis::Core::Hashable
      
        # Common categories for the detected entity.
        # E.g. when the label is `Terrier` the category is likely `dog`. And in some
        # cases there might be more than one categories e.g. `Terrier` could also be
        # a `pet`.
        # Corresponds to the JSON property `categoryEntities`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1Entity>]
        attr_accessor :category_entities
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1Entity]
        attr_accessor :entity
      
        # All video frames where a label was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelFrame>]
        attr_accessor :frames
      
        # All video segments where a label was detected.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelSegment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_entities = args[:category_entities] if args.key?(:category_entities)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # Video frame level annotation results for label detection.
      class GoogleCloudVideointelligenceV1LabelFrame
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for label detection.
      class GoogleCloudVideointelligenceV1LabelSegment
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Normalized bounding box.
      # The normalized vertex coordinates are relative to the original image.
      # Range: [0, 1].
      class GoogleCloudVideointelligenceV1NormalizedBoundingBox
        include Google::Apis::Core::Hashable
      
        # Bottom Y coordinate.
        # Corresponds to the JSON property `bottom`
        # @return [Float]
        attr_accessor :bottom
      
        # Left X coordinate.
        # Corresponds to the JSON property `left`
        # @return [Float]
        attr_accessor :left
      
        # Right X coordinate.
        # Corresponds to the JSON property `right`
        # @return [Float]
        attr_accessor :right
      
        # Top Y coordinate.
        # Corresponds to the JSON property `top`
        # @return [Float]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bottom = args[:bottom] if args.key?(:bottom)
          @left = args[:left] if args.key?(:left)
          @right = args[:right] if args.key?(:right)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Normalized bounding polygon for text (that might not be aligned with axis).
      # Contains list of the corner points in clockwise order starting from
      # top-left corner. For example, for a rectangular bounding box:
      # When the text is horizontal it might look like:
      # 0----1
      # |    |
      # 3----2
      # When it's clockwise rotated 180 degrees around the top-left corner it
      # becomes:
      # 2----3
      # |    |
      # 1----0
      # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
      # than 0, or greater than 1 due to trignometric calculations for location of
      # the box.
      class GoogleCloudVideointelligenceV1NormalizedBoundingPoly
        include Google::Apis::Core::Hashable
      
        # Normalized vertices of the bounding polygon.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1NormalizedVertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVideointelligenceV1NormalizedVertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Annotations corresponding to one tracked object.
      class GoogleCloudVideointelligenceV1ObjectTrackingAnnotation
        include Google::Apis::Core::Hashable
      
        # Object category's labeling confidence of this track.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1Entity]
        attr_accessor :entity
      
        # Information corresponding to all frames where this object track appears.
        # Non-streaming batch mode: it may be one or multiple ObjectTrackingFrame
        # messages in frames.
        # Streaming mode: it can only be one ObjectTrackingFrame message in frames.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1ObjectTrackingFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment]
        attr_accessor :segment
      
        # Streaming mode ONLY.
        # In streaming mode, we do not know the end time of a tracked object
        # before it is completed. Hence, there is no VideoSegment info returned.
        # Instead, we provide a unique identifiable integer track_id so that
        # the customers can correlate the results of the ongoing
        # ObjectTrackAnnotation of the same track_id over time.
        # Corresponds to the JSON property `trackId`
        # @return [Fixnum]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Video frame level annotations for object detection and tracking. This field
      # stores per frame location, time offset, and confidence.
      class GoogleCloudVideointelligenceV1ObjectTrackingFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # The timestamp of the frame in microseconds.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class GoogleCloudVideointelligenceV1SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class GoogleCloudVideointelligenceV1SpeechTranscription
        include Google::Apis::Core::Hashable
      
        # May contain one or more recognition hypotheses (up to the maximum specified
        # in `max_alternatives`).  These alternatives are ordered in terms of
        # accuracy, with the top (first) alternative being the most probable, as
        # ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt)
        # language tag of
        # the language in this result. This language code was detected to have the
        # most likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Annotations related to one detected OCR text snippet. This will contain the
      # corresponding text, confidence value, and frame level information for each
      # detection.
      class GoogleCloudVideointelligenceV1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # All video segments where OCR detected text appears.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1TextSegment>]
        attr_accessor :segments
      
        # The detected text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Video frame level annotation results for text annotation (OCR).
      # Contains information regarding timestamp and bounding box locations for the
      # frames containing detected OCR text snippets.
      class GoogleCloudVideointelligenceV1TextFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding polygon for text (that might not be aligned with axis).
        # Contains list of the corner points in clockwise order starting from
        # top-left corner. For example, for a rectangular bounding box:
        # When the text is horizontal it might look like:
        # 0----1
        # |    |
        # 3----2
        # When it's clockwise rotated 180 degrees around the top-left corner it
        # becomes:
        # 2----3
        # |    |
        # 1----0
        # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
        # than 0, or greater than 1 due to trignometric calculations for location of
        # the box.
        # Corresponds to the JSON property `rotatedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1NormalizedBoundingPoly]
        attr_accessor :rotated_bounding_box
      
        # Timestamp of this frame.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotated_bounding_box = args[:rotated_bounding_box] if args.key?(:rotated_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for text detection.
      class GoogleCloudVideointelligenceV1TextSegment
        include Google::Apis::Core::Hashable
      
        # Confidence for the track of detected text. It is calculated as the highest
        # over all frames where OCR detected text appears.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Information related to the frames where OCR detected text appears.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1TextFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Annotation progress for a single video.
      class GoogleCloudVideointelligenceV1VideoAnnotationProgress
        include Google::Apis::Core::Hashable
      
        # Specifies which feature is being tracked if the request contains more than
        # one features.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Approximate percentage processed thus far. Guaranteed to be
        # 100 when fully processed.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment]
        attr_accessor :segment
      
        # Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Time of the most recent update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @segment = args[:segment] if args.key?(:segment)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Annotation results for a single video.
      class GoogleCloudVideointelligenceV1VideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotations on frame level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `frameLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelAnnotation>]
        attr_accessor :frame_label_annotations
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Annotations for list of objects detected and tracked in video.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment]
        attr_accessor :segment
      
        # Topical label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `segmentLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelAnnotation>]
        attr_accessor :segment_label_annotations
      
        # Presence label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label. Compared to the
        # existing topical `segment_label_annotations`, this field presents more
        # fine-grained, segment-level labels detected in video content and is made
        # available only when the client sets `LabelDetectionConfig.model` to
        # "builtin/latest" in the request.
        # Corresponds to the JSON property `segmentPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelAnnotation>]
        attr_accessor :segment_presence_label_annotations
      
        # Shot annotations. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1VideoSegment>]
        attr_accessor :shot_annotations
      
        # Topical label annotations on shot level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `shotLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelAnnotation>]
        attr_accessor :shot_label_annotations
      
        # Presence label annotations on shot level. There is exactly one element for
        # each unique label. Compared to the existing topical
        # `shot_label_annotations`, this field presents more fine-grained, shot-level
        # labels detected in video content and is made available only when the client
        # sets `LabelDetectionConfig.model` to "builtin/latest" in the request.
        # Corresponds to the JSON property `shotPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1LabelAnnotation>]
        attr_accessor :shot_presence_label_annotations
      
        # Speech transcription.
        # Corresponds to the JSON property `speechTranscriptions`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1SpeechTranscription>]
        attr_accessor :speech_transcriptions
      
        # OCR text detection and tracking.
        # Annotations for list of detected text snippets. Each will have list of
        # frame information associated with it.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1TextAnnotation>]
        attr_accessor :text_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @frame_label_annotations = args[:frame_label_annotations] if args.key?(:frame_label_annotations)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @segment = args[:segment] if args.key?(:segment)
          @segment_label_annotations = args[:segment_label_annotations] if args.key?(:segment_label_annotations)
          @segment_presence_label_annotations = args[:segment_presence_label_annotations] if args.key?(:segment_presence_label_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
          @shot_label_annotations = args[:shot_label_annotations] if args.key?(:shot_label_annotations)
          @shot_presence_label_annotations = args[:shot_presence_label_annotations] if args.key?(:shot_presence_label_annotations)
          @speech_transcriptions = args[:speech_transcriptions] if args.key?(:speech_transcriptions)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
        end
      end
      
      # Video segment.
      class GoogleCloudVideointelligenceV1VideoSegment
        include Google::Apis::Core::Hashable
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the end of the segment (inclusive).
        # Corresponds to the JSON property `endTimeOffset`
        # @return [String]
        attr_accessor :end_time_offset
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the start of the segment (inclusive).
        # Corresponds to the JSON property `startTimeOffset`
        # @return [String]
        attr_accessor :start_time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time_offset = args[:end_time_offset] if args.key?(:end_time_offset)
          @start_time_offset = args[:start_time_offset] if args.key?(:start_time_offset)
        end
      end
      
      # Word-specific information for recognized words. Word information is only
      # included in the response when certain request parameters are set, such
      # as `enable_word_time_offsets`.
      class GoogleCloudVideointelligenceV1WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the end of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from 1 up to diarization_speaker_count,
        # and is only set if speaker diarization is enabled.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the start of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
      
      # Video annotation progress. Included in the `metadata`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1beta2AnnotateVideoProgress
        include Google::Apis::Core::Hashable
      
        # Progress metadata for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationProgress`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoAnnotationProgress>]
        attr_accessor :annotation_progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_progress = args[:annotation_progress] if args.key?(:annotation_progress)
        end
      end
      
      # Video annotation response. Included in the `response`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1beta2AnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Annotation results for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationResults`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoAnnotationResults>]
        attr_accessor :annotation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
        end
      end
      
      # Detected entity from video analysis.
      class GoogleCloudVideointelligenceV1beta2Entity
        include Google::Apis::Core::Hashable
      
        # Textual description, e.g. `Fixed-gear bicycle`.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Language code for `description` in BCP-47 format.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Explicit content annotation (based on per-frame visual signals only).
      # If no explicit content has been detected in a frame, no annotations are
      # present for that frame.
      class GoogleCloudVideointelligenceV1beta2ExplicitContentAnnotation
        include Google::Apis::Core::Hashable
      
        # All video frames where explicit content was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2ExplicitContentFrame>]
        attr_accessor :frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frames = args[:frames] if args.key?(:frames)
        end
      end
      
      # Video frame level annotation results for explicit content.
      class GoogleCloudVideointelligenceV1beta2ExplicitContentFrame
        include Google::Apis::Core::Hashable
      
        # Likelihood of the pornography content..
        # Corresponds to the JSON property `pornographyLikelihood`
        # @return [String]
        attr_accessor :pornography_likelihood
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pornography_likelihood = args[:pornography_likelihood] if args.key?(:pornography_likelihood)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Label annotation.
      class GoogleCloudVideointelligenceV1beta2LabelAnnotation
        include Google::Apis::Core::Hashable
      
        # Common categories for the detected entity.
        # E.g. when the label is `Terrier` the category is likely `dog`. And in some
        # cases there might be more than one categories e.g. `Terrier` could also be
        # a `pet`.
        # Corresponds to the JSON property `categoryEntities`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2Entity>]
        attr_accessor :category_entities
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2Entity]
        attr_accessor :entity
      
        # All video frames where a label was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelFrame>]
        attr_accessor :frames
      
        # All video segments where a label was detected.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelSegment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_entities = args[:category_entities] if args.key?(:category_entities)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # Video frame level annotation results for label detection.
      class GoogleCloudVideointelligenceV1beta2LabelFrame
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for label detection.
      class GoogleCloudVideointelligenceV1beta2LabelSegment
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Normalized bounding box.
      # The normalized vertex coordinates are relative to the original image.
      # Range: [0, 1].
      class GoogleCloudVideointelligenceV1beta2NormalizedBoundingBox
        include Google::Apis::Core::Hashable
      
        # Bottom Y coordinate.
        # Corresponds to the JSON property `bottom`
        # @return [Float]
        attr_accessor :bottom
      
        # Left X coordinate.
        # Corresponds to the JSON property `left`
        # @return [Float]
        attr_accessor :left
      
        # Right X coordinate.
        # Corresponds to the JSON property `right`
        # @return [Float]
        attr_accessor :right
      
        # Top Y coordinate.
        # Corresponds to the JSON property `top`
        # @return [Float]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bottom = args[:bottom] if args.key?(:bottom)
          @left = args[:left] if args.key?(:left)
          @right = args[:right] if args.key?(:right)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Normalized bounding polygon for text (that might not be aligned with axis).
      # Contains list of the corner points in clockwise order starting from
      # top-left corner. For example, for a rectangular bounding box:
      # When the text is horizontal it might look like:
      # 0----1
      # |    |
      # 3----2
      # When it's clockwise rotated 180 degrees around the top-left corner it
      # becomes:
      # 2----3
      # |    |
      # 1----0
      # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
      # than 0, or greater than 1 due to trignometric calculations for location of
      # the box.
      class GoogleCloudVideointelligenceV1beta2NormalizedBoundingPoly
        include Google::Apis::Core::Hashable
      
        # Normalized vertices of the bounding polygon.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2NormalizedVertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVideointelligenceV1beta2NormalizedVertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Annotations corresponding to one tracked object.
      class GoogleCloudVideointelligenceV1beta2ObjectTrackingAnnotation
        include Google::Apis::Core::Hashable
      
        # Object category's labeling confidence of this track.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2Entity]
        attr_accessor :entity
      
        # Information corresponding to all frames where this object track appears.
        # Non-streaming batch mode: it may be one or multiple ObjectTrackingFrame
        # messages in frames.
        # Streaming mode: it can only be one ObjectTrackingFrame message in frames.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2ObjectTrackingFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment]
        attr_accessor :segment
      
        # Streaming mode ONLY.
        # In streaming mode, we do not know the end time of a tracked object
        # before it is completed. Hence, there is no VideoSegment info returned.
        # Instead, we provide a unique identifiable integer track_id so that
        # the customers can correlate the results of the ongoing
        # ObjectTrackAnnotation of the same track_id over time.
        # Corresponds to the JSON property `trackId`
        # @return [Fixnum]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Video frame level annotations for object detection and tracking. This field
      # stores per frame location, time offset, and confidence.
      class GoogleCloudVideointelligenceV1beta2ObjectTrackingFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # The timestamp of the frame in microseconds.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class GoogleCloudVideointelligenceV1beta2SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class GoogleCloudVideointelligenceV1beta2SpeechTranscription
        include Google::Apis::Core::Hashable
      
        # May contain one or more recognition hypotheses (up to the maximum specified
        # in `max_alternatives`).  These alternatives are ordered in terms of
        # accuracy, with the top (first) alternative being the most probable, as
        # ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt)
        # language tag of
        # the language in this result. This language code was detected to have the
        # most likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Annotations related to one detected OCR text snippet. This will contain the
      # corresponding text, confidence value, and frame level information for each
      # detection.
      class GoogleCloudVideointelligenceV1beta2TextAnnotation
        include Google::Apis::Core::Hashable
      
        # All video segments where OCR detected text appears.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2TextSegment>]
        attr_accessor :segments
      
        # The detected text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Video frame level annotation results for text annotation (OCR).
      # Contains information regarding timestamp and bounding box locations for the
      # frames containing detected OCR text snippets.
      class GoogleCloudVideointelligenceV1beta2TextFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding polygon for text (that might not be aligned with axis).
        # Contains list of the corner points in clockwise order starting from
        # top-left corner. For example, for a rectangular bounding box:
        # When the text is horizontal it might look like:
        # 0----1
        # |    |
        # 3----2
        # When it's clockwise rotated 180 degrees around the top-left corner it
        # becomes:
        # 2----3
        # |    |
        # 1----0
        # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
        # than 0, or greater than 1 due to trignometric calculations for location of
        # the box.
        # Corresponds to the JSON property `rotatedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2NormalizedBoundingPoly]
        attr_accessor :rotated_bounding_box
      
        # Timestamp of this frame.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotated_bounding_box = args[:rotated_bounding_box] if args.key?(:rotated_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for text detection.
      class GoogleCloudVideointelligenceV1beta2TextSegment
        include Google::Apis::Core::Hashable
      
        # Confidence for the track of detected text. It is calculated as the highest
        # over all frames where OCR detected text appears.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Information related to the frames where OCR detected text appears.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2TextFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Annotation progress for a single video.
      class GoogleCloudVideointelligenceV1beta2VideoAnnotationProgress
        include Google::Apis::Core::Hashable
      
        # Specifies which feature is being tracked if the request contains more than
        # one features.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Approximate percentage processed thus far. Guaranteed to be
        # 100 when fully processed.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment]
        attr_accessor :segment
      
        # Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Time of the most recent update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @segment = args[:segment] if args.key?(:segment)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Annotation results for a single video.
      class GoogleCloudVideointelligenceV1beta2VideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotations on frame level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `frameLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelAnnotation>]
        attr_accessor :frame_label_annotations
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Annotations for list of objects detected and tracked in video.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment]
        attr_accessor :segment
      
        # Topical label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `segmentLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelAnnotation>]
        attr_accessor :segment_label_annotations
      
        # Presence label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label. Compared to the
        # existing topical `segment_label_annotations`, this field presents more
        # fine-grained, segment-level labels detected in video content and is made
        # available only when the client sets `LabelDetectionConfig.model` to
        # "builtin/latest" in the request.
        # Corresponds to the JSON property `segmentPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelAnnotation>]
        attr_accessor :segment_presence_label_annotations
      
        # Shot annotations. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2VideoSegment>]
        attr_accessor :shot_annotations
      
        # Topical label annotations on shot level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `shotLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelAnnotation>]
        attr_accessor :shot_label_annotations
      
        # Presence label annotations on shot level. There is exactly one element for
        # each unique label. Compared to the existing topical
        # `shot_label_annotations`, this field presents more fine-grained, shot-level
        # labels detected in video content and is made available only when the client
        # sets `LabelDetectionConfig.model` to "builtin/latest" in the request.
        # Corresponds to the JSON property `shotPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2LabelAnnotation>]
        attr_accessor :shot_presence_label_annotations
      
        # Speech transcription.
        # Corresponds to the JSON property `speechTranscriptions`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2SpeechTranscription>]
        attr_accessor :speech_transcriptions
      
        # OCR text detection and tracking.
        # Annotations for list of detected text snippets. Each will have list of
        # frame information associated with it.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1beta2TextAnnotation>]
        attr_accessor :text_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @frame_label_annotations = args[:frame_label_annotations] if args.key?(:frame_label_annotations)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @segment = args[:segment] if args.key?(:segment)
          @segment_label_annotations = args[:segment_label_annotations] if args.key?(:segment_label_annotations)
          @segment_presence_label_annotations = args[:segment_presence_label_annotations] if args.key?(:segment_presence_label_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
          @shot_label_annotations = args[:shot_label_annotations] if args.key?(:shot_label_annotations)
          @shot_presence_label_annotations = args[:shot_presence_label_annotations] if args.key?(:shot_presence_label_annotations)
          @speech_transcriptions = args[:speech_transcriptions] if args.key?(:speech_transcriptions)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
        end
      end
      
      # Video segment.
      class GoogleCloudVideointelligenceV1beta2VideoSegment
        include Google::Apis::Core::Hashable
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the end of the segment (inclusive).
        # Corresponds to the JSON property `endTimeOffset`
        # @return [String]
        attr_accessor :end_time_offset
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the start of the segment (inclusive).
        # Corresponds to the JSON property `startTimeOffset`
        # @return [String]
        attr_accessor :start_time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time_offset = args[:end_time_offset] if args.key?(:end_time_offset)
          @start_time_offset = args[:start_time_offset] if args.key?(:start_time_offset)
        end
      end
      
      # Word-specific information for recognized words. Word information is only
      # included in the response when certain request parameters are set, such
      # as `enable_word_time_offsets`.
      class GoogleCloudVideointelligenceV1beta2WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the end of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from 1 up to diarization_speaker_count,
        # and is only set if speaker diarization is enabled.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the start of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
      
      # Video annotation progress. Included in the `metadata`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p1beta1AnnotateVideoProgress
        include Google::Apis::Core::Hashable
      
        # Progress metadata for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationProgress`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoAnnotationProgress>]
        attr_accessor :annotation_progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_progress = args[:annotation_progress] if args.key?(:annotation_progress)
        end
      end
      
      # Video annotation response. Included in the `response`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p1beta1AnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Annotation results for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationResults`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoAnnotationResults>]
        attr_accessor :annotation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
        end
      end
      
      # Detected entity from video analysis.
      class GoogleCloudVideointelligenceV1p1beta1Entity
        include Google::Apis::Core::Hashable
      
        # Textual description, e.g. `Fixed-gear bicycle`.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Language code for `description` in BCP-47 format.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Explicit content annotation (based on per-frame visual signals only).
      # If no explicit content has been detected in a frame, no annotations are
      # present for that frame.
      class GoogleCloudVideointelligenceV1p1beta1ExplicitContentAnnotation
        include Google::Apis::Core::Hashable
      
        # All video frames where explicit content was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1ExplicitContentFrame>]
        attr_accessor :frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frames = args[:frames] if args.key?(:frames)
        end
      end
      
      # Video frame level annotation results for explicit content.
      class GoogleCloudVideointelligenceV1p1beta1ExplicitContentFrame
        include Google::Apis::Core::Hashable
      
        # Likelihood of the pornography content..
        # Corresponds to the JSON property `pornographyLikelihood`
        # @return [String]
        attr_accessor :pornography_likelihood
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pornography_likelihood = args[:pornography_likelihood] if args.key?(:pornography_likelihood)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Label annotation.
      class GoogleCloudVideointelligenceV1p1beta1LabelAnnotation
        include Google::Apis::Core::Hashable
      
        # Common categories for the detected entity.
        # E.g. when the label is `Terrier` the category is likely `dog`. And in some
        # cases there might be more than one categories e.g. `Terrier` could also be
        # a `pet`.
        # Corresponds to the JSON property `categoryEntities`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1Entity>]
        attr_accessor :category_entities
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1Entity]
        attr_accessor :entity
      
        # All video frames where a label was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelFrame>]
        attr_accessor :frames
      
        # All video segments where a label was detected.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelSegment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_entities = args[:category_entities] if args.key?(:category_entities)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # Video frame level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p1beta1LabelFrame
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p1beta1LabelSegment
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Normalized bounding box.
      # The normalized vertex coordinates are relative to the original image.
      # Range: [0, 1].
      class GoogleCloudVideointelligenceV1p1beta1NormalizedBoundingBox
        include Google::Apis::Core::Hashable
      
        # Bottom Y coordinate.
        # Corresponds to the JSON property `bottom`
        # @return [Float]
        attr_accessor :bottom
      
        # Left X coordinate.
        # Corresponds to the JSON property `left`
        # @return [Float]
        attr_accessor :left
      
        # Right X coordinate.
        # Corresponds to the JSON property `right`
        # @return [Float]
        attr_accessor :right
      
        # Top Y coordinate.
        # Corresponds to the JSON property `top`
        # @return [Float]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bottom = args[:bottom] if args.key?(:bottom)
          @left = args[:left] if args.key?(:left)
          @right = args[:right] if args.key?(:right)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Normalized bounding polygon for text (that might not be aligned with axis).
      # Contains list of the corner points in clockwise order starting from
      # top-left corner. For example, for a rectangular bounding box:
      # When the text is horizontal it might look like:
      # 0----1
      # |    |
      # 3----2
      # When it's clockwise rotated 180 degrees around the top-left corner it
      # becomes:
      # 2----3
      # |    |
      # 1----0
      # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
      # than 0, or greater than 1 due to trignometric calculations for location of
      # the box.
      class GoogleCloudVideointelligenceV1p1beta1NormalizedBoundingPoly
        include Google::Apis::Core::Hashable
      
        # Normalized vertices of the bounding polygon.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1NormalizedVertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVideointelligenceV1p1beta1NormalizedVertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Annotations corresponding to one tracked object.
      class GoogleCloudVideointelligenceV1p1beta1ObjectTrackingAnnotation
        include Google::Apis::Core::Hashable
      
        # Object category's labeling confidence of this track.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1Entity]
        attr_accessor :entity
      
        # Information corresponding to all frames where this object track appears.
        # Non-streaming batch mode: it may be one or multiple ObjectTrackingFrame
        # messages in frames.
        # Streaming mode: it can only be one ObjectTrackingFrame message in frames.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1ObjectTrackingFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment]
        attr_accessor :segment
      
        # Streaming mode ONLY.
        # In streaming mode, we do not know the end time of a tracked object
        # before it is completed. Hence, there is no VideoSegment info returned.
        # Instead, we provide a unique identifiable integer track_id so that
        # the customers can correlate the results of the ongoing
        # ObjectTrackAnnotation of the same track_id over time.
        # Corresponds to the JSON property `trackId`
        # @return [Fixnum]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Video frame level annotations for object detection and tracking. This field
      # stores per frame location, time offset, and confidence.
      class GoogleCloudVideointelligenceV1p1beta1ObjectTrackingFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # The timestamp of the frame in microseconds.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class GoogleCloudVideointelligenceV1p1beta1SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class GoogleCloudVideointelligenceV1p1beta1SpeechTranscription
        include Google::Apis::Core::Hashable
      
        # May contain one or more recognition hypotheses (up to the maximum specified
        # in `max_alternatives`).  These alternatives are ordered in terms of
        # accuracy, with the top (first) alternative being the most probable, as
        # ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt)
        # language tag of
        # the language in this result. This language code was detected to have the
        # most likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Annotations related to one detected OCR text snippet. This will contain the
      # corresponding text, confidence value, and frame level information for each
      # detection.
      class GoogleCloudVideointelligenceV1p1beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # All video segments where OCR detected text appears.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1TextSegment>]
        attr_accessor :segments
      
        # The detected text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Video frame level annotation results for text annotation (OCR).
      # Contains information regarding timestamp and bounding box locations for the
      # frames containing detected OCR text snippets.
      class GoogleCloudVideointelligenceV1p1beta1TextFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding polygon for text (that might not be aligned with axis).
        # Contains list of the corner points in clockwise order starting from
        # top-left corner. For example, for a rectangular bounding box:
        # When the text is horizontal it might look like:
        # 0----1
        # |    |
        # 3----2
        # When it's clockwise rotated 180 degrees around the top-left corner it
        # becomes:
        # 2----3
        # |    |
        # 1----0
        # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
        # than 0, or greater than 1 due to trignometric calculations for location of
        # the box.
        # Corresponds to the JSON property `rotatedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1NormalizedBoundingPoly]
        attr_accessor :rotated_bounding_box
      
        # Timestamp of this frame.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotated_bounding_box = args[:rotated_bounding_box] if args.key?(:rotated_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for text detection.
      class GoogleCloudVideointelligenceV1p1beta1TextSegment
        include Google::Apis::Core::Hashable
      
        # Confidence for the track of detected text. It is calculated as the highest
        # over all frames where OCR detected text appears.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Information related to the frames where OCR detected text appears.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1TextFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Annotation progress for a single video.
      class GoogleCloudVideointelligenceV1p1beta1VideoAnnotationProgress
        include Google::Apis::Core::Hashable
      
        # Specifies which feature is being tracked if the request contains more than
        # one features.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Approximate percentage processed thus far. Guaranteed to be
        # 100 when fully processed.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment]
        attr_accessor :segment
      
        # Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Time of the most recent update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @segment = args[:segment] if args.key?(:segment)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Annotation results for a single video.
      class GoogleCloudVideointelligenceV1p1beta1VideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotations on frame level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `frameLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelAnnotation>]
        attr_accessor :frame_label_annotations
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Annotations for list of objects detected and tracked in video.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment]
        attr_accessor :segment
      
        # Topical label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `segmentLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelAnnotation>]
        attr_accessor :segment_label_annotations
      
        # Presence label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label. Compared to the
        # existing topical `segment_label_annotations`, this field presents more
        # fine-grained, segment-level labels detected in video content and is made
        # available only when the client sets `LabelDetectionConfig.model` to
        # "builtin/latest" in the request.
        # Corresponds to the JSON property `segmentPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelAnnotation>]
        attr_accessor :segment_presence_label_annotations
      
        # Shot annotations. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1VideoSegment>]
        attr_accessor :shot_annotations
      
        # Topical label annotations on shot level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `shotLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelAnnotation>]
        attr_accessor :shot_label_annotations
      
        # Presence label annotations on shot level. There is exactly one element for
        # each unique label. Compared to the existing topical
        # `shot_label_annotations`, this field presents more fine-grained, shot-level
        # labels detected in video content and is made available only when the client
        # sets `LabelDetectionConfig.model` to "builtin/latest" in the request.
        # Corresponds to the JSON property `shotPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1LabelAnnotation>]
        attr_accessor :shot_presence_label_annotations
      
        # Speech transcription.
        # Corresponds to the JSON property `speechTranscriptions`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1SpeechTranscription>]
        attr_accessor :speech_transcriptions
      
        # OCR text detection and tracking.
        # Annotations for list of detected text snippets. Each will have list of
        # frame information associated with it.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p1beta1TextAnnotation>]
        attr_accessor :text_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @frame_label_annotations = args[:frame_label_annotations] if args.key?(:frame_label_annotations)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @segment = args[:segment] if args.key?(:segment)
          @segment_label_annotations = args[:segment_label_annotations] if args.key?(:segment_label_annotations)
          @segment_presence_label_annotations = args[:segment_presence_label_annotations] if args.key?(:segment_presence_label_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
          @shot_label_annotations = args[:shot_label_annotations] if args.key?(:shot_label_annotations)
          @shot_presence_label_annotations = args[:shot_presence_label_annotations] if args.key?(:shot_presence_label_annotations)
          @speech_transcriptions = args[:speech_transcriptions] if args.key?(:speech_transcriptions)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
        end
      end
      
      # Video segment.
      class GoogleCloudVideointelligenceV1p1beta1VideoSegment
        include Google::Apis::Core::Hashable
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the end of the segment (inclusive).
        # Corresponds to the JSON property `endTimeOffset`
        # @return [String]
        attr_accessor :end_time_offset
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the start of the segment (inclusive).
        # Corresponds to the JSON property `startTimeOffset`
        # @return [String]
        attr_accessor :start_time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time_offset = args[:end_time_offset] if args.key?(:end_time_offset)
          @start_time_offset = args[:start_time_offset] if args.key?(:start_time_offset)
        end
      end
      
      # Word-specific information for recognized words. Word information is only
      # included in the response when certain request parameters are set, such
      # as `enable_word_time_offsets`.
      class GoogleCloudVideointelligenceV1p1beta1WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the end of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from 1 up to diarization_speaker_count,
        # and is only set if speaker diarization is enabled.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the start of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
      
      # Video annotation progress. Included in the `metadata`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p2beta1AnnotateVideoProgress
        include Google::Apis::Core::Hashable
      
        # Progress metadata for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationProgress`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoAnnotationProgress>]
        attr_accessor :annotation_progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_progress = args[:annotation_progress] if args.key?(:annotation_progress)
        end
      end
      
      # Video annotation response. Included in the `response`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p2beta1AnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Annotation results for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationResults`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoAnnotationResults>]
        attr_accessor :annotation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
        end
      end
      
      # Detected entity from video analysis.
      class GoogleCloudVideointelligenceV1p2beta1Entity
        include Google::Apis::Core::Hashable
      
        # Textual description, e.g. `Fixed-gear bicycle`.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Language code for `description` in BCP-47 format.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Explicit content annotation (based on per-frame visual signals only).
      # If no explicit content has been detected in a frame, no annotations are
      # present for that frame.
      class GoogleCloudVideointelligenceV1p2beta1ExplicitContentAnnotation
        include Google::Apis::Core::Hashable
      
        # All video frames where explicit content was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1ExplicitContentFrame>]
        attr_accessor :frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frames = args[:frames] if args.key?(:frames)
        end
      end
      
      # Video frame level annotation results for explicit content.
      class GoogleCloudVideointelligenceV1p2beta1ExplicitContentFrame
        include Google::Apis::Core::Hashable
      
        # Likelihood of the pornography content..
        # Corresponds to the JSON property `pornographyLikelihood`
        # @return [String]
        attr_accessor :pornography_likelihood
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pornography_likelihood = args[:pornography_likelihood] if args.key?(:pornography_likelihood)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Label annotation.
      class GoogleCloudVideointelligenceV1p2beta1LabelAnnotation
        include Google::Apis::Core::Hashable
      
        # Common categories for the detected entity.
        # E.g. when the label is `Terrier` the category is likely `dog`. And in some
        # cases there might be more than one categories e.g. `Terrier` could also be
        # a `pet`.
        # Corresponds to the JSON property `categoryEntities`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1Entity>]
        attr_accessor :category_entities
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1Entity]
        attr_accessor :entity
      
        # All video frames where a label was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelFrame>]
        attr_accessor :frames
      
        # All video segments where a label was detected.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelSegment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_entities = args[:category_entities] if args.key?(:category_entities)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # Video frame level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p2beta1LabelFrame
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p2beta1LabelSegment
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Normalized bounding box.
      # The normalized vertex coordinates are relative to the original image.
      # Range: [0, 1].
      class GoogleCloudVideointelligenceV1p2beta1NormalizedBoundingBox
        include Google::Apis::Core::Hashable
      
        # Bottom Y coordinate.
        # Corresponds to the JSON property `bottom`
        # @return [Float]
        attr_accessor :bottom
      
        # Left X coordinate.
        # Corresponds to the JSON property `left`
        # @return [Float]
        attr_accessor :left
      
        # Right X coordinate.
        # Corresponds to the JSON property `right`
        # @return [Float]
        attr_accessor :right
      
        # Top Y coordinate.
        # Corresponds to the JSON property `top`
        # @return [Float]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bottom = args[:bottom] if args.key?(:bottom)
          @left = args[:left] if args.key?(:left)
          @right = args[:right] if args.key?(:right)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Normalized bounding polygon for text (that might not be aligned with axis).
      # Contains list of the corner points in clockwise order starting from
      # top-left corner. For example, for a rectangular bounding box:
      # When the text is horizontal it might look like:
      # 0----1
      # |    |
      # 3----2
      # When it's clockwise rotated 180 degrees around the top-left corner it
      # becomes:
      # 2----3
      # |    |
      # 1----0
      # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
      # than 0, or greater than 1 due to trignometric calculations for location of
      # the box.
      class GoogleCloudVideointelligenceV1p2beta1NormalizedBoundingPoly
        include Google::Apis::Core::Hashable
      
        # Normalized vertices of the bounding polygon.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1NormalizedVertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVideointelligenceV1p2beta1NormalizedVertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Annotations corresponding to one tracked object.
      class GoogleCloudVideointelligenceV1p2beta1ObjectTrackingAnnotation
        include Google::Apis::Core::Hashable
      
        # Object category's labeling confidence of this track.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1Entity]
        attr_accessor :entity
      
        # Information corresponding to all frames where this object track appears.
        # Non-streaming batch mode: it may be one or multiple ObjectTrackingFrame
        # messages in frames.
        # Streaming mode: it can only be one ObjectTrackingFrame message in frames.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1ObjectTrackingFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment]
        attr_accessor :segment
      
        # Streaming mode ONLY.
        # In streaming mode, we do not know the end time of a tracked object
        # before it is completed. Hence, there is no VideoSegment info returned.
        # Instead, we provide a unique identifiable integer track_id so that
        # the customers can correlate the results of the ongoing
        # ObjectTrackAnnotation of the same track_id over time.
        # Corresponds to the JSON property `trackId`
        # @return [Fixnum]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Video frame level annotations for object detection and tracking. This field
      # stores per frame location, time offset, and confidence.
      class GoogleCloudVideointelligenceV1p2beta1ObjectTrackingFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # The timestamp of the frame in microseconds.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class GoogleCloudVideointelligenceV1p2beta1SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class GoogleCloudVideointelligenceV1p2beta1SpeechTranscription
        include Google::Apis::Core::Hashable
      
        # May contain one or more recognition hypotheses (up to the maximum specified
        # in `max_alternatives`).  These alternatives are ordered in terms of
        # accuracy, with the top (first) alternative being the most probable, as
        # ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt)
        # language tag of
        # the language in this result. This language code was detected to have the
        # most likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Annotations related to one detected OCR text snippet. This will contain the
      # corresponding text, confidence value, and frame level information for each
      # detection.
      class GoogleCloudVideointelligenceV1p2beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # All video segments where OCR detected text appears.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1TextSegment>]
        attr_accessor :segments
      
        # The detected text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Video frame level annotation results for text annotation (OCR).
      # Contains information regarding timestamp and bounding box locations for the
      # frames containing detected OCR text snippets.
      class GoogleCloudVideointelligenceV1p2beta1TextFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding polygon for text (that might not be aligned with axis).
        # Contains list of the corner points in clockwise order starting from
        # top-left corner. For example, for a rectangular bounding box:
        # When the text is horizontal it might look like:
        # 0----1
        # |    |
        # 3----2
        # When it's clockwise rotated 180 degrees around the top-left corner it
        # becomes:
        # 2----3
        # |    |
        # 1----0
        # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
        # than 0, or greater than 1 due to trignometric calculations for location of
        # the box.
        # Corresponds to the JSON property `rotatedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1NormalizedBoundingPoly]
        attr_accessor :rotated_bounding_box
      
        # Timestamp of this frame.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotated_bounding_box = args[:rotated_bounding_box] if args.key?(:rotated_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for text detection.
      class GoogleCloudVideointelligenceV1p2beta1TextSegment
        include Google::Apis::Core::Hashable
      
        # Confidence for the track of detected text. It is calculated as the highest
        # over all frames where OCR detected text appears.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Information related to the frames where OCR detected text appears.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1TextFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Annotation progress for a single video.
      class GoogleCloudVideointelligenceV1p2beta1VideoAnnotationProgress
        include Google::Apis::Core::Hashable
      
        # Specifies which feature is being tracked if the request contains more than
        # one features.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Approximate percentage processed thus far. Guaranteed to be
        # 100 when fully processed.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment]
        attr_accessor :segment
      
        # Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Time of the most recent update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @segment = args[:segment] if args.key?(:segment)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Annotation results for a single video.
      class GoogleCloudVideointelligenceV1p2beta1VideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotations on frame level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `frameLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelAnnotation>]
        attr_accessor :frame_label_annotations
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Annotations for list of objects detected and tracked in video.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment]
        attr_accessor :segment
      
        # Topical label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `segmentLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelAnnotation>]
        attr_accessor :segment_label_annotations
      
        # Presence label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label. Compared to the
        # existing topical `segment_label_annotations`, this field presents more
        # fine-grained, segment-level labels detected in video content and is made
        # available only when the client sets `LabelDetectionConfig.model` to
        # "builtin/latest" in the request.
        # Corresponds to the JSON property `segmentPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelAnnotation>]
        attr_accessor :segment_presence_label_annotations
      
        # Shot annotations. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1VideoSegment>]
        attr_accessor :shot_annotations
      
        # Topical label annotations on shot level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `shotLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelAnnotation>]
        attr_accessor :shot_label_annotations
      
        # Presence label annotations on shot level. There is exactly one element for
        # each unique label. Compared to the existing topical
        # `shot_label_annotations`, this field presents more fine-grained, shot-level
        # labels detected in video content and is made available only when the client
        # sets `LabelDetectionConfig.model` to "builtin/latest" in the request.
        # Corresponds to the JSON property `shotPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1LabelAnnotation>]
        attr_accessor :shot_presence_label_annotations
      
        # Speech transcription.
        # Corresponds to the JSON property `speechTranscriptions`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1SpeechTranscription>]
        attr_accessor :speech_transcriptions
      
        # OCR text detection and tracking.
        # Annotations for list of detected text snippets. Each will have list of
        # frame information associated with it.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p2beta1TextAnnotation>]
        attr_accessor :text_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @frame_label_annotations = args[:frame_label_annotations] if args.key?(:frame_label_annotations)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @segment = args[:segment] if args.key?(:segment)
          @segment_label_annotations = args[:segment_label_annotations] if args.key?(:segment_label_annotations)
          @segment_presence_label_annotations = args[:segment_presence_label_annotations] if args.key?(:segment_presence_label_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
          @shot_label_annotations = args[:shot_label_annotations] if args.key?(:shot_label_annotations)
          @shot_presence_label_annotations = args[:shot_presence_label_annotations] if args.key?(:shot_presence_label_annotations)
          @speech_transcriptions = args[:speech_transcriptions] if args.key?(:speech_transcriptions)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
        end
      end
      
      # Video segment.
      class GoogleCloudVideointelligenceV1p2beta1VideoSegment
        include Google::Apis::Core::Hashable
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the end of the segment (inclusive).
        # Corresponds to the JSON property `endTimeOffset`
        # @return [String]
        attr_accessor :end_time_offset
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the start of the segment (inclusive).
        # Corresponds to the JSON property `startTimeOffset`
        # @return [String]
        attr_accessor :start_time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time_offset = args[:end_time_offset] if args.key?(:end_time_offset)
          @start_time_offset = args[:start_time_offset] if args.key?(:start_time_offset)
        end
      end
      
      # Word-specific information for recognized words. Word information is only
      # included in the response when certain request parameters are set, such
      # as `enable_word_time_offsets`.
      class GoogleCloudVideointelligenceV1p2beta1WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the end of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from 1 up to diarization_speaker_count,
        # and is only set if speaker diarization is enabled.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the start of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
      
      # Video annotation progress. Included in the `metadata`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p3beta1AnnotateVideoProgress
        include Google::Apis::Core::Hashable
      
        # Progress metadata for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationProgress`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoAnnotationProgress>]
        attr_accessor :annotation_progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_progress = args[:annotation_progress] if args.key?(:annotation_progress)
        end
      end
      
      # Video annotation request.
      class GoogleCloudVideointelligenceV1p3beta1AnnotateVideoRequest
        include Google::Apis::Core::Hashable
      
        # Required. Requested video annotation features.
        # Corresponds to the JSON property `features`
        # @return [Array<String>]
        attr_accessor :features
      
        # The video data bytes.
        # If unset, the input video(s) should be specified via `input_uri`.
        # If set, `input_uri` should be unset.
        # Corresponds to the JSON property `inputContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :input_content
      
        # Input video location. Currently, only
        # [Google Cloud Storage](https://cloud.google.com/storage/) URIs are
        # supported, which must be specified in the following format:
        # `gs://bucket-id/object-id` (other URI formats return
        # google.rpc.Code.INVALID_ARGUMENT). For more information, see
        # [Request URIs](/storage/docs/reference-uris).
        # A video URI may include wildcards in `object-id`, and thus identify
        # multiple videos. Supported wildcards: '*' to match 0 or more characters;
        # '?' to match 1 character. If unset, the input video should be embedded
        # in the request as `input_content`. If set, `input_content` should be unset.
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Optional. Cloud region where annotation should take place. Supported cloud
        # regions: `us-east1`, `us-west1`, `europe-west1`, `asia-east1`. If no region
        # is specified, a region will be determined based on video file location.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Optional. Location where the output (in JSON format) should be stored.
        # Currently, only [Google Cloud Storage](https://cloud.google.com/storage/)
        # URIs are supported, which must be specified in the following format:
        # `gs://bucket-id/object-id` (other URI formats return
        # google.rpc.Code.INVALID_ARGUMENT). For more information, see
        # [Request URIs](/storage/docs/reference-uris).
        # Corresponds to the JSON property `outputUri`
        # @return [String]
        attr_accessor :output_uri
      
        # Video context and/or feature-specific parameters.
        # Corresponds to the JSON property `videoContext`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoContext]
        attr_accessor :video_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @input_content = args[:input_content] if args.key?(:input_content)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @location_id = args[:location_id] if args.key?(:location_id)
          @output_uri = args[:output_uri] if args.key?(:output_uri)
          @video_context = args[:video_context] if args.key?(:video_context)
        end
      end
      
      # Video annotation response. Included in the `response`
      # field of the `Operation` returned by the `GetOperation`
      # call of the `google::longrunning::Operations` service.
      class GoogleCloudVideointelligenceV1p3beta1AnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Annotation results for all videos specified in `AnnotateVideoRequest`.
        # Corresponds to the JSON property `annotationResults`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoAnnotationResults>]
        attr_accessor :annotation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
        end
      end
      
      # A generic detected attribute represented by name in string format.
      class GoogleCloudVideointelligenceV1p3beta1DetectedAttribute
        include Google::Apis::Core::Hashable
      
        # Detected attribute confidence. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The name of the attribute, i.e. glasses, dark_glasses, mouth_open etc.
        # A full list of supported type names will be provided in the document.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Text value of the detection result. For example, the value for "HairColor"
        # can be "black", "blonde", etc.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Detected entity from video analysis.
      class GoogleCloudVideointelligenceV1p3beta1Entity
        include Google::Apis::Core::Hashable
      
        # Textual description, e.g. `Fixed-gear bicycle`.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Language code for `description` in BCP-47 format.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Explicit content annotation (based on per-frame visual signals only).
      # If no explicit content has been detected in a frame, no annotations are
      # present for that frame.
      class GoogleCloudVideointelligenceV1p3beta1ExplicitContentAnnotation
        include Google::Apis::Core::Hashable
      
        # All video frames where explicit content was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ExplicitContentFrame>]
        attr_accessor :frames
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frames = args[:frames] if args.key?(:frames)
        end
      end
      
      # Config for EXPLICIT_CONTENT_DETECTION.
      class GoogleCloudVideointelligenceV1p3beta1ExplicitContentDetectionConfig
        include Google::Apis::Core::Hashable
      
        # Model to use for explicit content detection.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model = args[:model] if args.key?(:model)
        end
      end
      
      # Video frame level annotation results for explicit content.
      class GoogleCloudVideointelligenceV1p3beta1ExplicitContentFrame
        include Google::Apis::Core::Hashable
      
        # Likelihood of the pornography content..
        # Corresponds to the JSON property `pornographyLikelihood`
        # @return [String]
        attr_accessor :pornography_likelihood
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pornography_likelihood = args[:pornography_likelihood] if args.key?(:pornography_likelihood)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Label annotation.
      class GoogleCloudVideointelligenceV1p3beta1LabelAnnotation
        include Google::Apis::Core::Hashable
      
        # Common categories for the detected entity.
        # E.g. when the label is `Terrier` the category is likely `dog`. And in some
        # cases there might be more than one categories e.g. `Terrier` could also be
        # a `pet`.
        # Corresponds to the JSON property `categoryEntities`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1Entity>]
        attr_accessor :category_entities
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1Entity]
        attr_accessor :entity
      
        # All video frames where a label was detected.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelFrame>]
        attr_accessor :frames
      
        # All video segments where a label was detected.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelSegment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @category_entities = args[:category_entities] if args.key?(:category_entities)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # Config for LABEL_DETECTION.
      class GoogleCloudVideointelligenceV1p3beta1LabelDetectionConfig
        include Google::Apis::Core::Hashable
      
        # The confidence threshold we perform filtering on the labels from
        # frame-level detection. If not set, it is set to 0.4 by default. The valid
        # range for this threshold is [0.1, 0.9]. Any value set outside of this
        # range will be clipped.
        # Note: for best results please follow the default threshold. We will update
        # the default threshold everytime when we release a new model.
        # Corresponds to the JSON property `frameConfidenceThreshold`
        # @return [Float]
        attr_accessor :frame_confidence_threshold
      
        # What labels should be detected with LABEL_DETECTION, in addition to
        # video-level labels or segment-level labels.
        # If unspecified, defaults to `SHOT_MODE`.
        # Corresponds to the JSON property `labelDetectionMode`
        # @return [String]
        attr_accessor :label_detection_mode
      
        # Model to use for label detection.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # Whether the video has been shot from a stationary (i.e. non-moving) camera.
        # When set to true, might improve detection accuracy for moving objects.
        # Should be used with `SHOT_AND_FRAME_MODE` enabled.
        # Corresponds to the JSON property `stationaryCamera`
        # @return [Boolean]
        attr_accessor :stationary_camera
        alias_method :stationary_camera?, :stationary_camera
      
        # The confidence threshold we perform filtering on the labels from
        # video-level and shot-level detections. If not set, it is set to 0.3 by
        # default. The valid range for this threshold is [0.1, 0.9]. Any value set
        # outside of this range will be clipped.
        # Note: for best results please follow the default threshold. We will update
        # the default threshold everytime when we release a new model.
        # Corresponds to the JSON property `videoConfidenceThreshold`
        # @return [Float]
        attr_accessor :video_confidence_threshold
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frame_confidence_threshold = args[:frame_confidence_threshold] if args.key?(:frame_confidence_threshold)
          @label_detection_mode = args[:label_detection_mode] if args.key?(:label_detection_mode)
          @model = args[:model] if args.key?(:model)
          @stationary_camera = args[:stationary_camera] if args.key?(:stationary_camera)
          @video_confidence_threshold = args[:video_confidence_threshold] if args.key?(:video_confidence_threshold)
        end
      end
      
      # Video frame level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p3beta1LabelFrame
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time-offset, relative to the beginning of the video, corresponding to the
        # video frame for this location.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for label detection.
      class GoogleCloudVideointelligenceV1p3beta1LabelSegment
        include Google::Apis::Core::Hashable
      
        # Confidence that the label is accurate. Range: [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Annotation corresponding to one detected, tracked and recognized logo class.
      class GoogleCloudVideointelligenceV1p3beta1LogoRecognitionAnnotation
        include Google::Apis::Core::Hashable
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1Entity]
        attr_accessor :entity
      
        # All video segments where the recognized logo appears. There might be
        # multiple instances of the same logo class appearing in one VideoSegment.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment>]
        attr_accessor :segments
      
        # All logo tracks where the recognized logo appears. Each track corresponds
        # to one logo instance appearing in consecutive frames.
        # Corresponds to the JSON property `tracks`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1Track>]
        attr_accessor :tracks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity = args[:entity] if args.key?(:entity)
          @segments = args[:segments] if args.key?(:segments)
          @tracks = args[:tracks] if args.key?(:tracks)
        end
      end
      
      # Normalized bounding box.
      # The normalized vertex coordinates are relative to the original image.
      # Range: [0, 1].
      class GoogleCloudVideointelligenceV1p3beta1NormalizedBoundingBox
        include Google::Apis::Core::Hashable
      
        # Bottom Y coordinate.
        # Corresponds to the JSON property `bottom`
        # @return [Float]
        attr_accessor :bottom
      
        # Left X coordinate.
        # Corresponds to the JSON property `left`
        # @return [Float]
        attr_accessor :left
      
        # Right X coordinate.
        # Corresponds to the JSON property `right`
        # @return [Float]
        attr_accessor :right
      
        # Top Y coordinate.
        # Corresponds to the JSON property `top`
        # @return [Float]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bottom = args[:bottom] if args.key?(:bottom)
          @left = args[:left] if args.key?(:left)
          @right = args[:right] if args.key?(:right)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Normalized bounding polygon for text (that might not be aligned with axis).
      # Contains list of the corner points in clockwise order starting from
      # top-left corner. For example, for a rectangular bounding box:
      # When the text is horizontal it might look like:
      # 0----1
      # |    |
      # 3----2
      # When it's clockwise rotated 180 degrees around the top-left corner it
      # becomes:
      # 2----3
      # |    |
      # 1----0
      # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
      # than 0, or greater than 1 due to trignometric calculations for location of
      # the box.
      class GoogleCloudVideointelligenceV1p3beta1NormalizedBoundingPoly
        include Google::Apis::Core::Hashable
      
        # Normalized vertices of the bounding polygon.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1NormalizedVertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVideointelligenceV1p3beta1NormalizedVertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Annotations corresponding to one tracked object.
      class GoogleCloudVideointelligenceV1p3beta1ObjectTrackingAnnotation
        include Google::Apis::Core::Hashable
      
        # Object category's labeling confidence of this track.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Detected entity from video analysis.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1Entity]
        attr_accessor :entity
      
        # Information corresponding to all frames where this object track appears.
        # Non-streaming batch mode: it may be one or multiple ObjectTrackingFrame
        # messages in frames.
        # Streaming mode: it can only be one ObjectTrackingFrame message in frames.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ObjectTrackingFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        # Streaming mode ONLY.
        # In streaming mode, we do not know the end time of a tracked object
        # before it is completed. Hence, there is no VideoSegment info returned.
        # Instead, we provide a unique identifiable integer track_id so that
        # the customers can correlate the results of the ongoing
        # ObjectTrackAnnotation of the same track_id over time.
        # Corresponds to the JSON property `trackId`
        # @return [Fixnum]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @entity = args[:entity] if args.key?(:entity)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Config for OBJECT_TRACKING.
      class GoogleCloudVideointelligenceV1p3beta1ObjectTrackingConfig
        include Google::Apis::Core::Hashable
      
        # Model to use for object tracking.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model = args[:model] if args.key?(:model)
        end
      end
      
      # Video frame level annotations for object detection and tracking. This field
      # stores per frame location, time offset, and confidence.
      class GoogleCloudVideointelligenceV1p3beta1ObjectTrackingFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # The timestamp of the frame in microseconds.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Config for SHOT_CHANGE_DETECTION.
      class GoogleCloudVideointelligenceV1p3beta1ShotChangeDetectionConfig
        include Google::Apis::Core::Hashable
      
        # Model to use for shot change detection.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model = args[:model] if args.key?(:model)
        end
      end
      
      # Provides "hints" to the speech recognizer to favor specific words and phrases
      # in the results.
      class GoogleCloudVideointelligenceV1p3beta1SpeechContext
        include Google::Apis::Core::Hashable
      
        # Optional. A list of strings containing words and phrases "hints" so that
        # the speech recognition is more likely to recognize them. This can be used
        # to improve the accuracy for specific words and phrases, for example, if
        # specific commands are typically spoken by the user. This can also be used
        # to add additional words to the vocabulary of the recognizer. See
        # [usage limits](https://cloud.google.com/speech/limits#content).
        # Corresponds to the JSON property `phrases`
        # @return [Array<String>]
        attr_accessor :phrases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @phrases = args[:phrases] if args.key?(:phrases)
        end
      end
      
      # Alternative hypotheses (a.k.a. n-best list).
      class GoogleCloudVideointelligenceV1p3beta1SpeechRecognitionAlternative
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Transcript text representing the words that the user spoke.
        # Corresponds to the JSON property `transcript`
        # @return [String]
        attr_accessor :transcript
      
        # Output only. A list of word-specific information for each recognized word.
        # Note: When `enable_speaker_diarization` is true, you will see all the words
        # from the beginning of the audio.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1WordInfo>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @transcript = args[:transcript] if args.key?(:transcript)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A speech recognition result corresponding to a portion of the audio.
      class GoogleCloudVideointelligenceV1p3beta1SpeechTranscription
        include Google::Apis::Core::Hashable
      
        # May contain one or more recognition hypotheses (up to the maximum specified
        # in `max_alternatives`).  These alternatives are ordered in terms of
        # accuracy, with the top (first) alternative being the most probable, as
        # ranked by the recognizer.
        # Corresponds to the JSON property `alternatives`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1SpeechRecognitionAlternative>]
        attr_accessor :alternatives
      
        # Output only. The [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt)
        # language tag of
        # the language in this result. This language code was detected to have the
        # most likelihood of being spoken in the audio.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternatives = args[:alternatives] if args.key?(:alternatives)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Config for SPEECH_TRANSCRIPTION.
      class GoogleCloudVideointelligenceV1p3beta1SpeechTranscriptionConfig
        include Google::Apis::Core::Hashable
      
        # Optional. For file formats, such as MXF or MKV, supporting multiple audio
        # tracks, specify up to two tracks. Default: track 0.
        # Corresponds to the JSON property `audioTracks`
        # @return [Array<Fixnum>]
        attr_accessor :audio_tracks
      
        # Optional. If set, specifies the estimated number of speakers in the
        # conversation.
        # If not set, defaults to '2'.
        # Ignored unless enable_speaker_diarization is set to true.
        # Corresponds to the JSON property `diarizationSpeakerCount`
        # @return [Fixnum]
        attr_accessor :diarization_speaker_count
      
        # Optional. If 'true', adds punctuation to recognition result hypotheses.
        # This feature is only available in select languages. Setting this for
        # requests in other languages has no effect at all. The default 'false' value
        # does not add punctuation to result hypotheses. NOTE: "This is currently
        # offered as an experimental service, complimentary to all users. In the
        # future this may be exclusively available as a premium feature."
        # Corresponds to the JSON property `enableAutomaticPunctuation`
        # @return [Boolean]
        attr_accessor :enable_automatic_punctuation
        alias_method :enable_automatic_punctuation?, :enable_automatic_punctuation
      
        # Optional. If 'true', enables speaker detection for each recognized word in
        # the top alternative of the recognition result using a speaker_tag provided
        # in the WordInfo.
        # Note: When this is true, we send all the words from the beginning of the
        # audio for the top alternative in every consecutive responses.
        # This is done in order to improve our speaker tags as our models learn to
        # identify the speakers in the conversation over time.
        # Corresponds to the JSON property `enableSpeakerDiarization`
        # @return [Boolean]
        attr_accessor :enable_speaker_diarization
        alias_method :enable_speaker_diarization?, :enable_speaker_diarization
      
        # Optional. If `true`, the top result includes a list of words and the
        # confidence for those words. If `false`, no word-level confidence
        # information is returned. The default is `false`.
        # Corresponds to the JSON property `enableWordConfidence`
        # @return [Boolean]
        attr_accessor :enable_word_confidence
        alias_method :enable_word_confidence?, :enable_word_confidence
      
        # Optional. If set to `true`, the server will attempt to filter out
        # profanities, replacing all but the initial character in each filtered word
        # with asterisks, e.g. "f***". If set to `false` or omitted, profanities
        # won't be filtered out.
        # Corresponds to the JSON property `filterProfanity`
        # @return [Boolean]
        attr_accessor :filter_profanity
        alias_method :filter_profanity?, :filter_profanity
      
        # Required. *Required* The language of the supplied audio as a
        # [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language tag.
        # Example: "en-US".
        # See [Language Support](https://cloud.google.com/speech/docs/languages)
        # for a list of the currently supported language codes.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. Maximum number of recognition hypotheses to be returned.
        # Specifically, the maximum number of `SpeechRecognitionAlternative` messages
        # within each `SpeechTranscription`. The server may return fewer than
        # `max_alternatives`. Valid values are `0`-`30`. A value of `0` or `1` will
        # return a maximum of one. If omitted, will return a maximum of one.
        # Corresponds to the JSON property `maxAlternatives`
        # @return [Fixnum]
        attr_accessor :max_alternatives
      
        # Optional. A means to provide context to assist the speech recognition.
        # Corresponds to the JSON property `speechContexts`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1SpeechContext>]
        attr_accessor :speech_contexts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audio_tracks = args[:audio_tracks] if args.key?(:audio_tracks)
          @diarization_speaker_count = args[:diarization_speaker_count] if args.key?(:diarization_speaker_count)
          @enable_automatic_punctuation = args[:enable_automatic_punctuation] if args.key?(:enable_automatic_punctuation)
          @enable_speaker_diarization = args[:enable_speaker_diarization] if args.key?(:enable_speaker_diarization)
          @enable_word_confidence = args[:enable_word_confidence] if args.key?(:enable_word_confidence)
          @filter_profanity = args[:filter_profanity] if args.key?(:filter_profanity)
          @language_code = args[:language_code] if args.key?(:language_code)
          @max_alternatives = args[:max_alternatives] if args.key?(:max_alternatives)
          @speech_contexts = args[:speech_contexts] if args.key?(:speech_contexts)
        end
      end
      
      # `StreamingAnnotateVideoResponse` is the only message returned to the client
      # by `StreamingAnnotateVideo`. A series of zero or more
      # `StreamingAnnotateVideoResponse` messages are streamed back to the client.
      class GoogleCloudVideointelligenceV1p3beta1StreamingAnnotateVideoResponse
        include Google::Apis::Core::Hashable
      
        # Streaming annotation results corresponding to a portion of the video
        # that is currently being processed.
        # Corresponds to the JSON property `annotationResults`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1StreamingVideoAnnotationResults]
        attr_accessor :annotation_results
      
        # GCS URI that stores annotation results of one streaming session.
        # It is a directory that can hold multiple files in JSON format.
        # Example uri format:
        # gs://bucket_id/object_id/cloud_project_name-session_id
        # Corresponds to the JSON property `annotationResultsUri`
        # @return [String]
        attr_accessor :annotation_results_uri
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_results = args[:annotation_results] if args.key?(:annotation_results)
          @annotation_results_uri = args[:annotation_results_uri] if args.key?(:annotation_results_uri)
          @error = args[:error] if args.key?(:error)
        end
      end
      
      # Streaming annotation results corresponding to a portion of the video
      # that is currently being processed.
      class GoogleCloudVideointelligenceV1p3beta1StreamingVideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotation results.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :label_annotations
      
        # Object tracking results.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Shot annotation results. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment>]
        attr_accessor :shot_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
        end
      end
      
      # Annotations related to one detected OCR text snippet. This will contain the
      # corresponding text, confidence value, and frame level information for each
      # detection.
      class GoogleCloudVideointelligenceV1p3beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # All video segments where OCR detected text appears.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1TextSegment>]
        attr_accessor :segments
      
        # The detected text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Config for TEXT_DETECTION.
      class GoogleCloudVideointelligenceV1p3beta1TextDetectionConfig
        include Google::Apis::Core::Hashable
      
        # Language hint can be specified if the language to be detected is known a
        # priori. It can increase the accuracy of the detection. Language hint must
        # be language code in BCP-47 format.
        # Automatic language detection is performed if no hint is provided.
        # Corresponds to the JSON property `languageHints`
        # @return [Array<String>]
        attr_accessor :language_hints
      
        # Model to use for text detection.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_hints = args[:language_hints] if args.key?(:language_hints)
          @model = args[:model] if args.key?(:model)
        end
      end
      
      # Video frame level annotation results for text annotation (OCR).
      # Contains information regarding timestamp and bounding box locations for the
      # frames containing detected OCR text snippets.
      class GoogleCloudVideointelligenceV1p3beta1TextFrame
        include Google::Apis::Core::Hashable
      
        # Normalized bounding polygon for text (that might not be aligned with axis).
        # Contains list of the corner points in clockwise order starting from
        # top-left corner. For example, for a rectangular bounding box:
        # When the text is horizontal it might look like:
        # 0----1
        # |    |
        # 3----2
        # When it's clockwise rotated 180 degrees around the top-left corner it
        # becomes:
        # 2----3
        # |    |
        # 1----0
        # and the vertex order will still be (0, 1, 2, 3). Note that values can be less
        # than 0, or greater than 1 due to trignometric calculations for location of
        # the box.
        # Corresponds to the JSON property `rotatedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1NormalizedBoundingPoly]
        attr_accessor :rotated_bounding_box
      
        # Timestamp of this frame.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotated_bounding_box = args[:rotated_bounding_box] if args.key?(:rotated_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # Video segment level annotation results for text detection.
      class GoogleCloudVideointelligenceV1p3beta1TextSegment
        include Google::Apis::Core::Hashable
      
        # Confidence for the track of detected text. It is calculated as the highest
        # over all frames where OCR detected text appears.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Information related to the frames where OCR detected text appears.
        # Corresponds to the JSON property `frames`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1TextFrame>]
        attr_accessor :frames
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @frames = args[:frames] if args.key?(:frames)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # For tracking related features.
      # An object at time_offset with attributes, and located with
      # normalized_bounding_box.
      class GoogleCloudVideointelligenceV1p3beta1TimestampedObject
        include Google::Apis::Core::Hashable
      
        # Optional. The attributes of the object in the bounding box.
        # Corresponds to the JSON property `attributes`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1DetectedAttribute>]
        attr_accessor :attributes
      
        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # Corresponds to the JSON property `normalizedBoundingBox`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1NormalizedBoundingBox]
        attr_accessor :normalized_bounding_box
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the video frame for this object.
        # Corresponds to the JSON property `timeOffset`
        # @return [String]
        attr_accessor :time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @normalized_bounding_box = args[:normalized_bounding_box] if args.key?(:normalized_bounding_box)
          @time_offset = args[:time_offset] if args.key?(:time_offset)
        end
      end
      
      # A track of an object instance.
      class GoogleCloudVideointelligenceV1p3beta1Track
        include Google::Apis::Core::Hashable
      
        # Optional. Attributes in the track level.
        # Corresponds to the JSON property `attributes`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1DetectedAttribute>]
        attr_accessor :attributes
      
        # Optional. The confidence score of the tracked object.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        # The object with timestamp and attributes per frame in the track.
        # Corresponds to the JSON property `timestampedObjects`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1TimestampedObject>]
        attr_accessor :timestamped_objects
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @confidence = args[:confidence] if args.key?(:confidence)
          @segment = args[:segment] if args.key?(:segment)
          @timestamped_objects = args[:timestamped_objects] if args.key?(:timestamped_objects)
        end
      end
      
      # Annotation progress for a single video.
      class GoogleCloudVideointelligenceV1p3beta1VideoAnnotationProgress
        include Google::Apis::Core::Hashable
      
        # Specifies which feature is being tracked if the request contains more than
        # one features.
        # Corresponds to the JSON property `feature`
        # @return [String]
        attr_accessor :feature
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Approximate percentage processed thus far. Guaranteed to be
        # 100 when fully processed.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        # Time when the request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Time of the most recent update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feature = args[:feature] if args.key?(:feature)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @segment = args[:segment] if args.key?(:segment)
          @start_time = args[:start_time] if args.key?(:start_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Annotation results for a single video.
      class GoogleCloudVideointelligenceV1p3beta1VideoAnnotationResults
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # Corresponds to the JSON property `explicitAnnotation`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ExplicitContentAnnotation]
        attr_accessor :explicit_annotation
      
        # Label annotations on frame level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `frameLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :frame_label_annotations
      
        # Video file location in
        # [Google Cloud Storage](https://cloud.google.com/storage/).
        # Corresponds to the JSON property `inputUri`
        # @return [String]
        attr_accessor :input_uri
      
        # Annotations for list of logos detected, tracked and recognized in video.
        # Corresponds to the JSON property `logoRecognitionAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LogoRecognitionAnnotation>]
        attr_accessor :logo_recognition_annotations
      
        # Annotations for list of objects detected and tracked in video.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ObjectTrackingAnnotation>]
        attr_accessor :object_annotations
      
        # Video segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment]
        attr_accessor :segment
      
        # Topical label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `segmentLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :segment_label_annotations
      
        # Presence label annotations on video level or user specified segment level.
        # There is exactly one element for each unique label. Compared to the
        # existing topical `segment_label_annotations`, this field presents more
        # fine-grained, segment-level labels detected in video content and is made
        # available only when the client sets `LabelDetectionConfig.model` to
        # "builtin/latest" in the request.
        # Corresponds to the JSON property `segmentPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :segment_presence_label_annotations
      
        # Shot annotations. Each shot is represented as a video segment.
        # Corresponds to the JSON property `shotAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment>]
        attr_accessor :shot_annotations
      
        # Topical label annotations on shot level.
        # There is exactly one element for each unique label.
        # Corresponds to the JSON property `shotLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :shot_label_annotations
      
        # Presence label annotations on shot level. There is exactly one element for
        # each unique label. Compared to the existing topical
        # `shot_label_annotations`, this field presents more fine-grained, shot-level
        # labels detected in video content and is made available only when the client
        # sets `LabelDetectionConfig.model` to "builtin/latest" in the request.
        # Corresponds to the JSON property `shotPresenceLabelAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelAnnotation>]
        attr_accessor :shot_presence_label_annotations
      
        # Speech transcription.
        # Corresponds to the JSON property `speechTranscriptions`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1SpeechTranscription>]
        attr_accessor :speech_transcriptions
      
        # OCR text detection and tracking.
        # Annotations for list of detected text snippets. Each will have list of
        # frame information associated with it.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1TextAnnotation>]
        attr_accessor :text_annotations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @explicit_annotation = args[:explicit_annotation] if args.key?(:explicit_annotation)
          @frame_label_annotations = args[:frame_label_annotations] if args.key?(:frame_label_annotations)
          @input_uri = args[:input_uri] if args.key?(:input_uri)
          @logo_recognition_annotations = args[:logo_recognition_annotations] if args.key?(:logo_recognition_annotations)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @segment = args[:segment] if args.key?(:segment)
          @segment_label_annotations = args[:segment_label_annotations] if args.key?(:segment_label_annotations)
          @segment_presence_label_annotations = args[:segment_presence_label_annotations] if args.key?(:segment_presence_label_annotations)
          @shot_annotations = args[:shot_annotations] if args.key?(:shot_annotations)
          @shot_label_annotations = args[:shot_label_annotations] if args.key?(:shot_label_annotations)
          @shot_presence_label_annotations = args[:shot_presence_label_annotations] if args.key?(:shot_presence_label_annotations)
          @speech_transcriptions = args[:speech_transcriptions] if args.key?(:speech_transcriptions)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
        end
      end
      
      # Video context and/or feature-specific parameters.
      class GoogleCloudVideointelligenceV1p3beta1VideoContext
        include Google::Apis::Core::Hashable
      
        # Config for EXPLICIT_CONTENT_DETECTION.
        # Corresponds to the JSON property `explicitContentDetectionConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ExplicitContentDetectionConfig]
        attr_accessor :explicit_content_detection_config
      
        # Config for LABEL_DETECTION.
        # Corresponds to the JSON property `labelDetectionConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1LabelDetectionConfig]
        attr_accessor :label_detection_config
      
        # Config for OBJECT_TRACKING.
        # Corresponds to the JSON property `objectTrackingConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ObjectTrackingConfig]
        attr_accessor :object_tracking_config
      
        # Video segments to annotate. The segments may overlap and are not required
        # to be contiguous or span the whole video. If unspecified, each video is
        # treated as a single segment.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1VideoSegment>]
        attr_accessor :segments
      
        # Config for SHOT_CHANGE_DETECTION.
        # Corresponds to the JSON property `shotChangeDetectionConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1ShotChangeDetectionConfig]
        attr_accessor :shot_change_detection_config
      
        # Config for SPEECH_TRANSCRIPTION.
        # Corresponds to the JSON property `speechTranscriptionConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1SpeechTranscriptionConfig]
        attr_accessor :speech_transcription_config
      
        # Config for TEXT_DETECTION.
        # Corresponds to the JSON property `textDetectionConfig`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleCloudVideointelligenceV1p3beta1TextDetectionConfig]
        attr_accessor :text_detection_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explicit_content_detection_config = args[:explicit_content_detection_config] if args.key?(:explicit_content_detection_config)
          @label_detection_config = args[:label_detection_config] if args.key?(:label_detection_config)
          @object_tracking_config = args[:object_tracking_config] if args.key?(:object_tracking_config)
          @segments = args[:segments] if args.key?(:segments)
          @shot_change_detection_config = args[:shot_change_detection_config] if args.key?(:shot_change_detection_config)
          @speech_transcription_config = args[:speech_transcription_config] if args.key?(:speech_transcription_config)
          @text_detection_config = args[:text_detection_config] if args.key?(:text_detection_config)
        end
      end
      
      # Video segment.
      class GoogleCloudVideointelligenceV1p3beta1VideoSegment
        include Google::Apis::Core::Hashable
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the end of the segment (inclusive).
        # Corresponds to the JSON property `endTimeOffset`
        # @return [String]
        attr_accessor :end_time_offset
      
        # Time-offset, relative to the beginning of the video,
        # corresponding to the start of the segment (inclusive).
        # Corresponds to the JSON property `startTimeOffset`
        # @return [String]
        attr_accessor :start_time_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time_offset = args[:end_time_offset] if args.key?(:end_time_offset)
          @start_time_offset = args[:start_time_offset] if args.key?(:start_time_offset)
        end
      end
      
      # Word-specific information for recognized words. Word information is only
      # included in the response when certain request parameters are set, such
      # as `enable_word_time_offsets`.
      class GoogleCloudVideointelligenceV1p3beta1WordInfo
        include Google::Apis::Core::Hashable
      
        # Output only. The confidence estimate between 0.0 and 1.0. A higher number
        # indicates an estimated greater likelihood that the recognized words are
        # correct. This field is set only for the top alternative.
        # This field is not guaranteed to be accurate and users should not rely on it
        # to be always provided.
        # The default of 0.0 is a sentinel value indicating `confidence` was not set.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the end of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. A distinct integer value is assigned for every speaker within
        # the audio. This field specifies which one of those speakers was detected to
        # have spoken this word. Value ranges from 1 up to diarization_speaker_count,
        # and is only set if speaker diarization is enabled.
        # Corresponds to the JSON property `speakerTag`
        # @return [Fixnum]
        attr_accessor :speaker_tag
      
        # Time offset relative to the beginning of the audio, and
        # corresponding to the start of the spoken word. This field is only set if
        # `enable_word_time_offsets=true` and only in the top hypothesis. This is an
        # experimental feature and the accuracy of the time offset can vary.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The word corresponding to this set of information.
        # Corresponds to the JSON property `word`
        # @return [String]
        attr_accessor :word
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @end_time = args[:end_time] if args.key?(:end_time)
          @speaker_tag = args[:speaker_tag] if args.key?(:speaker_tag)
          @start_time = args[:start_time] if args.key?(:start_time)
          @word = args[:word] if args.key?(:word)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VideointelligenceV1p3beta1::GoogleRpcStatus]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
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
    end
  end
end
