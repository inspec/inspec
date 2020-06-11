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
    module VisionV1p2beta1
      
      # Response to a single file annotation request. A file may contain one or more
      # images, which individually have their own responses.
      class AnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::InputConfig]
        attr_accessor :input_config
      
        # Individual responses to images found within the file. This field will be
        # empty if the `error` field is set.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::AnnotateImageResponse>]
        attr_accessor :responses
      
        # This field gives the total number of pages in the file.
        # Corresponds to the JSON property `totalPages`
        # @return [Fixnum]
        attr_accessor :total_pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @input_config = args[:input_config] if args.key?(:input_config)
          @responses = args[:responses] if args.key?(:responses)
          @total_pages = args[:total_pages] if args.key?(:total_pages)
        end
      end
      
      # Response to an image annotation request.
      class AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, localized object detection has completed successfully.
        # This will be sorted descending by confidence score.
        # Corresponds to the JSON property `localizedObjectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::LocalizedObjectAnnotation>]
        attr_accessor :localized_object_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Results for a product search request.
        # Corresponds to the JSON property `productSearchResults`
        # @return [Google::Apis::VisionV1p2beta1::ProductSearchResults]
        attr_accessor :product_search_results
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @localized_object_annotations = args[:localized_object_annotations] if args.key?(:localized_object_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @product_search_results = args[:product_search_results] if args.key?(:product_search_results)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # The response for a single offline file annotation request.
      class AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Response to an async batch file annotation request.
      class AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Response to an async batch image annotation request.
      class AsyncBatchAnnotateImagesResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # A list of file annotation responses.
      class BatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, each response corresponding to each
        # AnnotateFileRequest in BatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::AnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Metadata for the batch operations such as the current state.
      # This is included in the `metadata` field of the `Operation` returned by the
      # `GetOperation` call of the `google::longrunning::Operations` service.
      class BatchOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request is finished and
        # google.longrunning.Operation.done is set to true.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the batch request was submitted to the server.
        # Corresponds to the JSON property `submitTime`
        # @return [String]
        attr_accessor :submit_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @state = args[:state] if args.key?(:state)
          @submit_time = args[:submit_time] if args.key?(:submit_time)
        end
      end
      
      # Logical element on the page.
      class Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::TextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon normalized vertices.
        # Corresponds to the JSON property `normalizedVertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::NormalizedVertex>]
        attr_accessor :normalized_vertices
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_vertices = args[:normalized_vertices] if args.key?(:normalized_vertices)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # Represents a color in the RGBA color space. This representation is designed
      # for simplicity of conversion to/from color representations in various
      # languages over compactness; for example, the fields of this representation
      # can be trivially provided to the constructor of "java.awt.Color" in Java; it
      # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
      # method in iOS; and, with just a little work, it can be easily formatted into
      # a CSS "rgba()" string in JavaScript, as well.
      # Note: this proto does not carry information about the absolute color space
      # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
      # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
      # space.
      # Example (Java):
      # import com.google.type.Color;
      # // ...
      # public static java.awt.Color fromProto(Color protocolor) `
      # float alpha = protocolor.hasAlpha()
      # ? protocolor.getAlpha().getValue()
      # : 1.0;
      # return new java.awt.Color(
      # protocolor.getRed(),
      # protocolor.getGreen(),
      # protocolor.getBlue(),
      # alpha);
      # `
      # public static Color toProto(java.awt.Color color) `
      # float red = (float) color.getRed();
      # float green = (float) color.getGreen();
      # float blue = (float) color.getBlue();
      # float denominator = 255.0;
      # Color.Builder resultBuilder =
      # Color
      # .newBuilder()
      # .setRed(red / denominator)
      # .setGreen(green / denominator)
      # .setBlue(blue / denominator);
      # int alpha = color.getAlpha();
      # if (alpha != 255) `
      # result.setAlpha(
      # FloatValue
      # .newBuilder()
      # .setValue(((float) alpha) / denominator)
      # .build());
      # `
      # return resultBuilder.build();
      # `
      # // ...
      # Example (iOS / Obj-C):
      # // ...
      # static UIColor* fromProto(Color* protocolor) `
      # float red = [protocolor red];
      # float green = [protocolor green];
      # float blue = [protocolor blue];
      # FloatValue* alpha_wrapper = [protocolor alpha];
      # float alpha = 1.0;
      # if (alpha_wrapper != nil) `
      # alpha = [alpha_wrapper value];
      # `
      # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
      # `
      # static Color* toProto(UIColor* color) `
      # CGFloat red, green, blue, alpha;
      # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
      # return nil;
      # `
      # Color* result = [[Color alloc] init];
      # [result setRed:red];
      # [result setGreen:green];
      # [result setBlue:blue];
      # if (alpha <= 0.9999) `
      # [result setAlpha:floatWrapperWithValue(alpha)];
      # `
      # [result autorelease];
      # return result;
      # `
      # // ...
      # Example (JavaScript):
      # // ...
      # var protoToCssColor = function(rgb_color) `
      # var redFrac = rgb_color.red || 0.0;
      # var greenFrac = rgb_color.green || 0.0;
      # var blueFrac = rgb_color.blue || 0.0;
      # var red = Math.floor(redFrac * 255);
      # var green = Math.floor(greenFrac * 255);
      # var blue = Math.floor(blueFrac * 255);
      # if (!('alpha' in rgb_color)) `
      # return rgbToCssColor_(red, green, blue);
      # `
      # var alphaFrac = rgb_color.alpha.value || 0.0;
      # var rgbParams = [red, green, blue].join(',');
      # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
      # `;
      # var rgbToCssColor_ = function(red, green, blue) `
      # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
      # var hexString = rgbNumber.toString(16);
      # var missingZeros = 6 - hexString.length;
      # var resultBuilder = ['#'];
      # for (var i = 0; i < missingZeros; i++) `
      # resultBuilder.push('0');
      # `
      # resultBuilder.push(hexString);
      # return resultBuilder.join('');
      # `;
      # // ...
      class Color
        include Google::Apis::Core::Hashable
      
        # The fraction of this color that should be applied to the pixel. That is,
        # the final pixel color is defined by the equation:
        # pixel color = alpha * (this color) + (1.0 - alpha) * (background color)
        # This means that a value of 1.0 corresponds to a solid color, whereas
        # a value of 0.0 corresponds to a completely transparent color. This
        # uses a wrapper message rather than a simple float scalar so that it is
        # possible to distinguish between a default value and the value being unset.
        # If omitted, this color object is to be rendered as a solid color
        # (as if the alpha value had been explicitly given with a value of 1.0).
        # Corresponds to the JSON property `alpha`
        # @return [Float]
        attr_accessor :alpha
      
        # The amount of blue in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `blue`
        # @return [Float]
        attr_accessor :blue
      
        # The amount of green in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `green`
        # @return [Float]
        attr_accessor :green
      
        # The amount of red in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `red`
        # @return [Float]
        attr_accessor :red
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alpha = args[:alpha] if args.key?(:alpha)
          @blue = args[:blue] if args.key?(:blue)
          @green = args[:green] if args.key?(:green)
          @red = args[:red] if args.key?(:red)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Detected start or end of a structural component.
      class DetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class DetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::Landmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI prefix where the results will be stored. Results
        # will be in JSON format and preceded by its corresponding input URI prefix.
        # This field can either represent a gcs file prefix or gcs directory. In
        # either case, the uri should be unique because in order to get all of the
        # output files, you will need to do a wildcard gcs search on the uri prefix
        # you provide.
        # Examples:
        # *    File Prefix: gs://bucket-name/here/filenameprefix   The output files
        # will be created in gs://bucket-name/here/ and the names of the
        # output files will begin with "filenameprefix".
        # *    Directory Prefix: gs://bucket-name/some/location/   The output files
        # will be created in gs://bucket-name/some/location/ and the names of the
        # output files could be anything because there was no filename prefix
        # specified.
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a
        # Google Cloud Storage object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Response to a single file annotation request. A file may contain one or more
      # images, which individually have their own responses.
      class GoogleCloudVisionV1p1beta1AnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1InputConfig]
        attr_accessor :input_config
      
        # Individual responses to images found within the file. This field will be
        # empty if the `error` field is set.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        # This field gives the total number of pages in the file.
        # Corresponds to the JSON property `totalPages`
        # @return [Fixnum]
        attr_accessor :total_pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @input_config = args[:input_config] if args.key?(:input_config)
          @responses = args[:responses] if args.key?(:responses)
          @total_pages = args[:total_pages] if args.key?(:total_pages)
        end
      end
      
      # Response to an image annotation request.
      class GoogleCloudVisionV1p1beta1AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, localized object detection has completed successfully.
        # This will be sorted descending by confidence score.
        # Corresponds to the JSON property `localizedObjectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation>]
        attr_accessor :localized_object_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Results for a product search request.
        # Corresponds to the JSON property `productSearchResults`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductSearchResults]
        attr_accessor :product_search_results
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @localized_object_annotations = args[:localized_object_annotations] if args.key?(:localized_object_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @product_search_results = args[:product_search_results] if args.key?(:product_search_results)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # The response for a single offline file annotation request.
      class GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Response to an async batch file annotation request.
      class GoogleCloudVisionV1p1beta1AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Logical element on the page.
      class GoogleCloudVisionV1p1beta1Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class GoogleCloudVisionV1p1beta1BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon normalized vertices.
        # Corresponds to the JSON property `normalizedVertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1NormalizedVertex>]
        attr_accessor :normalized_vertices
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_vertices = args[:normalized_vertices] if args.key?(:normalized_vertices)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class GoogleCloudVisionV1p1beta1ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class GoogleCloudVisionV1p1beta1CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class GoogleCloudVisionV1p1beta1CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class GoogleCloudVisionV1p1beta1DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class GoogleCloudVisionV1p1beta1EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class GoogleCloudVisionV1p1beta1FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1FaceAnnotationLandmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class GoogleCloudVisionV1p1beta1FaceAnnotationLandmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GoogleCloudVisionV1p1beta1GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI prefix where the results will be stored. Results
        # will be in JSON format and preceded by its corresponding input URI prefix.
        # This field can either represent a gcs file prefix or gcs directory. In
        # either case, the uri should be unique because in order to get all of the
        # output files, you will need to do a wildcard gcs search on the uri prefix
        # you provide.
        # Examples:
        # *    File Prefix: gs://bucket-name/here/filenameprefix   The output files
        # will be created in gs://bucket-name/here/ and the names of the
        # output files will begin with "filenameprefix".
        # *    Directory Prefix: gs://bucket-name/some/location/   The output files
        # will be created in gs://bucket-name/some/location/ and the names of the
        # output files could be anything because there was no filename prefix
        # specified.
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GoogleCloudVisionV1p1beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a
        # Google Cloud Storage object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class GoogleCloudVisionV1p1beta1ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class GoogleCloudVisionV1p1beta1ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # The desired input location and metadata.
      class GoogleCloudVisionV1p1beta1InputConfig
        include Google::Apis::Core::Hashable
      
        # File content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Currently, this field only works for BatchAnnotateFiles requests. It does
        # not work for AsyncBatchAnnotateFiles requests.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf", "image/tiff" and
        # "image/gif" are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # Set of detected objects with bounding boxes.
      class GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Detected entity location information.
      class GoogleCloudVisionV1p1beta1LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVisionV1p1beta1NormalizedVertex
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
      
      # Contains metadata for the BatchAnnotateImages operation.
      class GoogleCloudVisionV1p1beta1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class GoogleCloudVisionV1p1beta1OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on
        # Google Cloud Storage.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class GoogleCloudVisionV1p1beta1Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class GoogleCloudVisionV1p1beta1Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of all words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p1beta1Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A Product contains ReferenceImages.
      class GoogleCloudVisionV1p1beta1Product
        include Google::Apis::Core::Hashable
      
        # User-provided metadata to be stored with this product. Must be at most 4096
        # characters long.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The user-provided name for this Product. Must not be empty. Must be at most
        # 4096 characters long.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the product.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # This field is ignored when creating a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The category for the product identified by the reference image.
        # This should
        # be either "homegoods-v2", "apparel-v2", or "toys-v2". The legacy categories
        # "homegoods", "apparel", and "toys" are still supported, but these should
        # not be used for new products.
        # Corresponds to the JSON property `productCategory`
        # @return [String]
        attr_accessor :product_category
      
        # Key-value pairs that can be attached to a product. At query time,
        # constraints can be specified based on the product_labels.
        # Note that integer values can be provided as strings, e.g. "1199". Only
        # strings with integer values can match a range-based restriction which is
        # to be supported soon.
        # Multiple values can be assigned to the same key. One product may have up to
        # 500 product_labels.
        # Notice that the total number of distinct product_labels over all products
        # in one ProductSet cannot exceed 1M, otherwise the product search pipeline
        # will refuse to work for that ProductSet.
        # Corresponds to the JSON property `productLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductKeyValue>]
        attr_accessor :product_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @product_category = args[:product_category] if args.key?(:product_category)
          @product_labels = args[:product_labels] if args.key?(:product_labels)
        end
      end
      
      # A product label represented as a key-value pair.
      class GoogleCloudVisionV1p1beta1ProductKeyValue
        include Google::Apis::Core::Hashable
      
        # The key of the label attached to the product. Cannot be empty and cannot
        # exceed 128 bytes.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the label attached to the product. Cannot be empty and
        # cannot exceed 128 bytes.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Results for a product search request.
      class GoogleCloudVisionV1p1beta1ProductSearchResults
        include Google::Apis::Core::Hashable
      
        # Timestamp of the index which provided these results. Products added to the
        # product set and products removed from the product set after this time are
        # not reflected in the current results.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # List of results grouped by products detected in the query image. Each entry
        # corresponds to one bounding polygon in the query image, and contains the
        # matching products specific to that region. There may be duplicate product
        # matches in the union of all the per-product results.
        # Corresponds to the JSON property `productGroupedResults`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult>]
        attr_accessor :product_grouped_results
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_time = args[:index_time] if args.key?(:index_time)
          @product_grouped_results = args[:product_grouped_results] if args.key?(:product_grouped_results)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Information about the products similar to a single product in a query
      # image.
      class GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # List of generic predictions for the object in the bounding box.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation>]
        attr_accessor :object_annotations
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Prediction for what the object in the bounding box is.
      class GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Information about a product.
      class GoogleCloudVisionV1p1beta1ProductSearchResultsResult
        include Google::Apis::Core::Hashable
      
        # The resource name of the image from the product that is the closest match
        # to the query.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # A Product contains ReferenceImages.
        # Corresponds to the JSON property `product`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Product]
        attr_accessor :product
      
        # A confidence level on the match, ranging from 0 (no confidence) to
        # 1 (full confidence).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @product = args[:product] if args.key?(:product)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class GoogleCloudVisionV1p1beta1Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class GoogleCloudVisionV1p1beta1SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
        end
      end
      
      # A single symbol representation.
      class GoogleCloudVisionV1p1beta1Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class GoogleCloudVisionV1p1beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Detected start or end of a structural component.
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Additional information detected on the structural component.
      class GoogleCloudVisionV1p1beta1TextAnnotationTextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p1beta1Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
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
      
      # Relevant information for the image from the Internet.
      class GoogleCloudVisionV1p1beta1WebDetection
        include Google::Apis::Core::Hashable
      
        # The service's best guess as to the topic of the request image.
        # Inferred from similar images on the open web.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class GoogleCloudVisionV1p1beta1WebDetectionWebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class GoogleCloudVisionV1p1beta1WebDetectionWebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class GoogleCloudVisionV1p1beta1WebDetectionWebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class GoogleCloudVisionV1p1beta1WebDetectionWebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class GoogleCloudVisionV1p1beta1Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p1beta1Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
      
      # A request to annotate one single file, e.g. a PDF, TIFF or GIF file.
      class GoogleCloudVisionV1p2beta1AnnotateFileRequest
        include Google::Apis::Core::Hashable
      
        # Required. Requested features.
        # Corresponds to the JSON property `features`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Feature>]
        attr_accessor :features
      
        # Image context and/or feature-specific parameters.
        # Corresponds to the JSON property `imageContext`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageContext]
        attr_accessor :image_context
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1InputConfig]
        attr_accessor :input_config
      
        # Pages of the file to perform image annotation.
        # Pages starts from 1, we assume the first page of the file is page 1.
        # At most 5 pages are supported per request. Pages can be negative.
        # Page 1 means the first page.
        # Page 2 means the second page.
        # Page -1 means the last page.
        # Page -2 means the second to the last page.
        # If the file is GIF instead of PDF or TIFF, page refers to GIF frames.
        # If this field is empty, by default the service performs image annotation
        # for the first 5 pages of the file.
        # Corresponds to the JSON property `pages`
        # @return [Array<Fixnum>]
        attr_accessor :pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @image_context = args[:image_context] if args.key?(:image_context)
          @input_config = args[:input_config] if args.key?(:input_config)
          @pages = args[:pages] if args.key?(:pages)
        end
      end
      
      # Response to a single file annotation request. A file may contain one or more
      # images, which individually have their own responses.
      class GoogleCloudVisionV1p2beta1AnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1InputConfig]
        attr_accessor :input_config
      
        # Individual responses to images found within the file. This field will be
        # empty if the `error` field is set.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        # This field gives the total number of pages in the file.
        # Corresponds to the JSON property `totalPages`
        # @return [Fixnum]
        attr_accessor :total_pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @input_config = args[:input_config] if args.key?(:input_config)
          @responses = args[:responses] if args.key?(:responses)
          @total_pages = args[:total_pages] if args.key?(:total_pages)
        end
      end
      
      # Request for performing Google Cloud Vision API tasks over a user-provided
      # image, with user-requested features, and with context information.
      class GoogleCloudVisionV1p2beta1AnnotateImageRequest
        include Google::Apis::Core::Hashable
      
        # Requested features.
        # Corresponds to the JSON property `features`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Feature>]
        attr_accessor :features
      
        # Client image to perform Google Cloud Vision API tasks over.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Image]
        attr_accessor :image
      
        # Image context and/or feature-specific parameters.
        # Corresponds to the JSON property `imageContext`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageContext]
        attr_accessor :image_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @image = args[:image] if args.key?(:image)
          @image_context = args[:image_context] if args.key?(:image_context)
        end
      end
      
      # Response to an image annotation request.
      class GoogleCloudVisionV1p2beta1AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, localized object detection has completed successfully.
        # This will be sorted descending by confidence score.
        # Corresponds to the JSON property `localizedObjectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation>]
        attr_accessor :localized_object_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Results for a product search request.
        # Corresponds to the JSON property `productSearchResults`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchResults]
        attr_accessor :product_search_results
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @localized_object_annotations = args[:localized_object_annotations] if args.key?(:localized_object_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @product_search_results = args[:product_search_results] if args.key?(:product_search_results)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # An offline file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileRequest
        include Google::Apis::Core::Hashable
      
        # Required. Requested features.
        # Corresponds to the JSON property `features`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Feature>]
        attr_accessor :features
      
        # Image context and/or feature-specific parameters.
        # Corresponds to the JSON property `imageContext`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageContext]
        attr_accessor :image_context
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1InputConfig]
        attr_accessor :input_config
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @image_context = args[:image_context] if args.key?(:image_context)
          @input_config = args[:input_config] if args.key?(:input_config)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # The response for a single offline file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Multiple async file annotation requests are batched into a single service
      # call.
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Target project and location to make a call.
        # Format: `projects/`project-id`/locations/`location-id``.
        # If no parent is specified, a region will be chosen automatically.
        # Supported location-ids:
        # `us`: USA country only,
        # `asia`: East asia areas, like Japan, Taiwan,
        # `eu`: The European Union.
        # Example: `projects/project-A/locations/eu`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Required. Individual async file annotation requests for this batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # Response to an async batch file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Request for async image annotation for a list of images.
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateImagesRequest
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1OutputConfig]
        attr_accessor :output_config
      
        # Optional. Target project and location to make a call.
        # Format: `projects/`project-id`/locations/`location-id``.
        # If no parent is specified, a region will be chosen automatically.
        # Supported location-ids:
        # `us`: USA country only,
        # `asia`: East asia areas, like Japan, Taiwan,
        # `eu`: The European Union.
        # Example: `projects/project-A/locations/eu`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Required. Individual image annotation requests for this batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
          @parent = args[:parent] if args.key?(:parent)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # A list of requests to annotate files using the BatchAnnotateFiles API.
      class GoogleCloudVisionV1p2beta1BatchAnnotateFilesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Target project and location to make a call.
        # Format: `projects/`project-id`/locations/`location-id``.
        # If no parent is specified, a region will be chosen automatically.
        # Supported location-ids:
        # `us`: USA country only,
        # `asia`: East asia areas, like Japan, Taiwan,
        # `eu`: The European Union.
        # Example: `projects/project-A/locations/eu`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Required. The list of file annotation requests. Right now we support only one
        # AnnotateFileRequest in BatchAnnotateFilesRequest.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateFileRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # A list of file annotation responses.
      class GoogleCloudVisionV1p2beta1BatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, each response corresponding to each
        # AnnotateFileRequest in BatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Multiple image annotation requests are batched into a single service call.
      class GoogleCloudVisionV1p2beta1BatchAnnotateImagesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Target project and location to make a call.
        # Format: `projects/`project-id`/locations/`location-id``.
        # If no parent is specified, a region will be chosen automatically.
        # Supported location-ids:
        # `us`: USA country only,
        # `asia`: East asia areas, like Japan, Taiwan,
        # `eu`: The European Union.
        # Example: `projects/project-A/locations/eu`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Required. Individual image annotation requests for this batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # Response to a batch image annotation request.
      class GoogleCloudVisionV1p2beta1BatchAnnotateImagesResponse
        include Google::Apis::Core::Hashable
      
        # Individual responses to image annotation requests within the batch.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Logical element on the page.
      class GoogleCloudVisionV1p2beta1Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class GoogleCloudVisionV1p2beta1BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon normalized vertices.
        # Corresponds to the JSON property `normalizedVertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1NormalizedVertex>]
        attr_accessor :normalized_vertices
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_vertices = args[:normalized_vertices] if args.key?(:normalized_vertices)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class GoogleCloudVisionV1p2beta1ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class GoogleCloudVisionV1p2beta1CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class GoogleCloudVisionV1p2beta1CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Parameters for crop hints annotation request.
      class GoogleCloudVisionV1p2beta1CropHintsParams
        include Google::Apis::Core::Hashable
      
        # Aspect ratios in floats, representing the ratio of the width to the height
        # of the image. For example, if the desired aspect ratio is 4/3, the
        # corresponding float value should be 1.33333.  If not specified, the
        # best possible crop is returned. The number of provided aspect ratios is
        # limited to a maximum of 16; any aspect ratios provided after the 16th are
        # ignored.
        # Corresponds to the JSON property `aspectRatios`
        # @return [Array<Float>]
        attr_accessor :aspect_ratios
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aspect_ratios = args[:aspect_ratios] if args.key?(:aspect_ratios)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class GoogleCloudVisionV1p2beta1DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class GoogleCloudVisionV1p2beta1EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class GoogleCloudVisionV1p2beta1FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1FaceAnnotationLandmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class GoogleCloudVisionV1p2beta1FaceAnnotationLandmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The type of Google Cloud Vision API detection to perform, and the maximum
      # number of results to return for that type. Multiple `Feature` objects can
      # be specified in the `features` list.
      class GoogleCloudVisionV1p2beta1Feature
        include Google::Apis::Core::Hashable
      
        # Maximum number of results of this type. Does not apply to
        # `TEXT_DETECTION`, `DOCUMENT_TEXT_DETECTION`, or `CROP_HINTS`.
        # Corresponds to the JSON property `maxResults`
        # @return [Fixnum]
        attr_accessor :max_results
      
        # Model to use for the feature.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The feature type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_results = args[:max_results] if args.key?(:max_results)
          @model = args[:model] if args.key?(:model)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GoogleCloudVisionV1p2beta1GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI prefix where the results will be stored. Results
        # will be in JSON format and preceded by its corresponding input URI prefix.
        # This field can either represent a gcs file prefix or gcs directory. In
        # either case, the uri should be unique because in order to get all of the
        # output files, you will need to do a wildcard gcs search on the uri prefix
        # you provide.
        # Examples:
        # *    File Prefix: gs://bucket-name/here/filenameprefix   The output files
        # will be created in gs://bucket-name/here/ and the names of the
        # output files will begin with "filenameprefix".
        # *    Directory Prefix: gs://bucket-name/some/location/   The output files
        # will be created in gs://bucket-name/some/location/ and the names of the
        # output files could be anything because there was no filename prefix
        # specified.
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GoogleCloudVisionV1p2beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a
        # Google Cloud Storage object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Client image to perform Google Cloud Vision API tasks over.
      class GoogleCloudVisionV1p2beta1Image
        include Google::Apis::Core::Hashable
      
        # Image content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # External image source (Google Cloud Storage or web URL image location).
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageSource]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class GoogleCloudVisionV1p2beta1ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Image context and/or feature-specific parameters.
      class GoogleCloudVisionV1p2beta1ImageContext
        include Google::Apis::Core::Hashable
      
        # Parameters for crop hints annotation request.
        # Corresponds to the JSON property `cropHintsParams`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHintsParams]
        attr_accessor :crop_hints_params
      
        # List of languages to use for TEXT_DETECTION. In most cases, an empty value
        # yields the best results since it enables automatic language detection. For
        # languages based on the Latin alphabet, setting `language_hints` is not
        # needed. In rare cases, when the language of the text in the image is known,
        # setting a hint will help get better results (although it will be a
        # significant hindrance if the hint is wrong). Text detection returns an
        # error if one or more of the specified languages is not one of the
        # [supported languages](/vision/docs/languages).
        # Corresponds to the JSON property `languageHints`
        # @return [Array<String>]
        attr_accessor :language_hints
      
        # Rectangle determined by min and max `LatLng` pairs.
        # Corresponds to the JSON property `latLongRect`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1LatLongRect]
        attr_accessor :lat_long_rect
      
        # Parameters for a product search request.
        # Corresponds to the JSON property `productSearchParams`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchParams]
        attr_accessor :product_search_params
      
        # Parameters for web detection request.
        # Corresponds to the JSON property `webDetectionParams`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionParams]
        attr_accessor :web_detection_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints_params = args[:crop_hints_params] if args.key?(:crop_hints_params)
          @language_hints = args[:language_hints] if args.key?(:language_hints)
          @lat_long_rect = args[:lat_long_rect] if args.key?(:lat_long_rect)
          @product_search_params = args[:product_search_params] if args.key?(:product_search_params)
          @web_detection_params = args[:web_detection_params] if args.key?(:web_detection_params)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class GoogleCloudVisionV1p2beta1ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # External image source (Google Cloud Storage or web URL image location).
      class GoogleCloudVisionV1p2beta1ImageSource
        include Google::Apis::Core::Hashable
      
        # **Use `image_uri` instead.**
        # The Google Cloud Storage  URI of the form
        # `gs://bucket_name/object_name`. Object versioning is not supported. See
        # [Google Cloud Storage Request
        # URIs](https://cloud.google.com/storage/docs/reference-uris) for more info.
        # Corresponds to the JSON property `gcsImageUri`
        # @return [String]
        attr_accessor :gcs_image_uri
      
        # The URI of the source image. Can be either:
        # 1. A Google Cloud Storage URI of the form
        # `gs://bucket_name/object_name`. Object versioning is not supported. See
        # [Google Cloud Storage Request
        # URIs](https://cloud.google.com/storage/docs/reference-uris) for more
        # info.
        # 2. A publicly-accessible image HTTP/HTTPS URL. When fetching images from
        # HTTP/HTTPS URLs, Google cannot guarantee that the request will be
        # completed. Your request may fail if the specified host denies the
        # request (e.g. due to request throttling or DOS prevention), or if Google
        # throttles requests to the site for abuse prevention. You should not
        # depend on externally-hosted images for production applications.
        # When both `gcs_image_uri` and `image_uri` are specified, `image_uri` takes
        # precedence.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_image_uri = args[:gcs_image_uri] if args.key?(:gcs_image_uri)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # The desired input location and metadata.
      class GoogleCloudVisionV1p2beta1InputConfig
        include Google::Apis::Core::Hashable
      
        # File content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Currently, this field only works for BatchAnnotateFiles requests. It does
        # not work for AsyncBatchAnnotateFiles requests.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf", "image/tiff" and
        # "image/gif" are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # Rectangle determined by min and max `LatLng` pairs.
      class GoogleCloudVisionV1p2beta1LatLongRect
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `maxLatLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :max_lat_lng
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `minLatLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :min_lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_lat_lng = args[:max_lat_lng] if args.key?(:max_lat_lng)
          @min_lat_lng = args[:min_lat_lng] if args.key?(:min_lat_lng)
        end
      end
      
      # Set of detected objects with bounding boxes.
      class GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Detected entity location information.
      class GoogleCloudVisionV1p2beta1LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVisionV1p2beta1NormalizedVertex
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
      
      # Contains metadata for the BatchAnnotateImages operation.
      class GoogleCloudVisionV1p2beta1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class GoogleCloudVisionV1p2beta1OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on
        # Google Cloud Storage.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class GoogleCloudVisionV1p2beta1Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class GoogleCloudVisionV1p2beta1Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of all words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p2beta1Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A Product contains ReferenceImages.
      class GoogleCloudVisionV1p2beta1Product
        include Google::Apis::Core::Hashable
      
        # User-provided metadata to be stored with this product. Must be at most 4096
        # characters long.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The user-provided name for this Product. Must not be empty. Must be at most
        # 4096 characters long.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the product.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # This field is ignored when creating a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The category for the product identified by the reference image.
        # This should
        # be either "homegoods-v2", "apparel-v2", or "toys-v2". The legacy categories
        # "homegoods", "apparel", and "toys" are still supported, but these should
        # not be used for new products.
        # Corresponds to the JSON property `productCategory`
        # @return [String]
        attr_accessor :product_category
      
        # Key-value pairs that can be attached to a product. At query time,
        # constraints can be specified based on the product_labels.
        # Note that integer values can be provided as strings, e.g. "1199". Only
        # strings with integer values can match a range-based restriction which is
        # to be supported soon.
        # Multiple values can be assigned to the same key. One product may have up to
        # 500 product_labels.
        # Notice that the total number of distinct product_labels over all products
        # in one ProductSet cannot exceed 1M, otherwise the product search pipeline
        # will refuse to work for that ProductSet.
        # Corresponds to the JSON property `productLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductKeyValue>]
        attr_accessor :product_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @product_category = args[:product_category] if args.key?(:product_category)
          @product_labels = args[:product_labels] if args.key?(:product_labels)
        end
      end
      
      # A product label represented as a key-value pair.
      class GoogleCloudVisionV1p2beta1ProductKeyValue
        include Google::Apis::Core::Hashable
      
        # The key of the label attached to the product. Cannot be empty and cannot
        # exceed 128 bytes.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the label attached to the product. Cannot be empty and
        # cannot exceed 128 bytes.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Parameters for a product search request.
      class GoogleCloudVisionV1p2beta1ProductSearchParams
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # The filtering expression. This can be used to restrict search results based
        # on Product labels. We currently support an AND of OR of key-value
        # expressions, where each expression within an OR must have the same key. An
        # '=' should be used to connect the key and value.
        # For example, "(color = red OR color = blue) AND brand = Google" is
        # acceptable, but "(color = red OR brand = Google)" is not acceptable.
        # "color: red" is not acceptable because it uses a ':' instead of an '='.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The list of product categories to search in. Currently, we only consider
        # the first category, and either "homegoods-v2", "apparel-v2", "toys-v2",
        # "packagedgoods-v1", or "general-v1" should be specified. The legacy
        # categories "homegoods", "apparel", and "toys" are still supported but will
        # be deprecated. For new products, please use "homegoods-v2", "apparel-v2",
        # or "toys-v2" for better product search accuracy. It is recommended to
        # migrate existing products to these categories as well.
        # Corresponds to the JSON property `productCategories`
        # @return [Array<String>]
        attr_accessor :product_categories
      
        # The resource name of a ProductSet to be searched for similar images.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`.
        # Corresponds to the JSON property `productSet`
        # @return [String]
        attr_accessor :product_set
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @filter = args[:filter] if args.key?(:filter)
          @product_categories = args[:product_categories] if args.key?(:product_categories)
          @product_set = args[:product_set] if args.key?(:product_set)
        end
      end
      
      # Results for a product search request.
      class GoogleCloudVisionV1p2beta1ProductSearchResults
        include Google::Apis::Core::Hashable
      
        # Timestamp of the index which provided these results. Products added to the
        # product set and products removed from the product set after this time are
        # not reflected in the current results.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # List of results grouped by products detected in the query image. Each entry
        # corresponds to one bounding polygon in the query image, and contains the
        # matching products specific to that region. There may be duplicate product
        # matches in the union of all the per-product results.
        # Corresponds to the JSON property `productGroupedResults`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult>]
        attr_accessor :product_grouped_results
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_time = args[:index_time] if args.key?(:index_time)
          @product_grouped_results = args[:product_grouped_results] if args.key?(:product_grouped_results)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Information about the products similar to a single product in a query
      # image.
      class GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # List of generic predictions for the object in the bounding box.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation>]
        attr_accessor :object_annotations
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Prediction for what the object in the bounding box is.
      class GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Information about a product.
      class GoogleCloudVisionV1p2beta1ProductSearchResultsResult
        include Google::Apis::Core::Hashable
      
        # The resource name of the image from the product that is the closest match
        # to the query.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # A Product contains ReferenceImages.
        # Corresponds to the JSON property `product`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Product]
        attr_accessor :product
      
        # A confidence level on the match, ranging from 0 (no confidence) to
        # 1 (full confidence).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @product = args[:product] if args.key?(:product)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class GoogleCloudVisionV1p2beta1Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class GoogleCloudVisionV1p2beta1SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
        end
      end
      
      # A single symbol representation.
      class GoogleCloudVisionV1p2beta1Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class GoogleCloudVisionV1p2beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Detected start or end of a structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Additional information detected on the structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationTextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p2beta1Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
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
      
      # Relevant information for the image from the Internet.
      class GoogleCloudVisionV1p2beta1WebDetection
        include Google::Apis::Core::Hashable
      
        # The service's best guess as to the topic of the request image.
        # Inferred from similar images on the open web.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Parameters for web detection request.
      class GoogleCloudVisionV1p2beta1WebDetectionParams
        include Google::Apis::Core::Hashable
      
        # Whether to include results derived from the geo information in the image.
        # Corresponds to the JSON property `includeGeoResults`
        # @return [Boolean]
        attr_accessor :include_geo_results
        alias_method :include_geo_results?, :include_geo_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @include_geo_results = args[:include_geo_results] if args.key?(:include_geo_results)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class GoogleCloudVisionV1p2beta1WebDetectionWebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class GoogleCloudVisionV1p2beta1WebDetectionWebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class GoogleCloudVisionV1p2beta1WebDetectionWebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class GoogleCloudVisionV1p2beta1WebDetectionWebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class GoogleCloudVisionV1p2beta1Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
      
      # Response to a single file annotation request. A file may contain one or more
      # images, which individually have their own responses.
      class GoogleCloudVisionV1p3beta1AnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1InputConfig]
        attr_accessor :input_config
      
        # Individual responses to images found within the file. This field will be
        # empty if the `error` field is set.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        # This field gives the total number of pages in the file.
        # Corresponds to the JSON property `totalPages`
        # @return [Fixnum]
        attr_accessor :total_pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @input_config = args[:input_config] if args.key?(:input_config)
          @responses = args[:responses] if args.key?(:responses)
          @total_pages = args[:total_pages] if args.key?(:total_pages)
        end
      end
      
      # Response to an image annotation request.
      class GoogleCloudVisionV1p3beta1AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, localized object detection has completed successfully.
        # This will be sorted descending by confidence score.
        # Corresponds to the JSON property `localizedObjectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation>]
        attr_accessor :localized_object_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Results for a product search request.
        # Corresponds to the JSON property `productSearchResults`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductSearchResults]
        attr_accessor :product_search_results
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @localized_object_annotations = args[:localized_object_annotations] if args.key?(:localized_object_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @product_search_results = args[:product_search_results] if args.key?(:product_search_results)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # The response for a single offline file annotation request.
      class GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Response to an async batch file annotation request.
      class GoogleCloudVisionV1p3beta1AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Metadata for the batch operations such as the current state.
      # This is included in the `metadata` field of the `Operation` returned by the
      # `GetOperation` call of the `google::longrunning::Operations` service.
      class GoogleCloudVisionV1p3beta1BatchOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request is finished and
        # google.longrunning.Operation.done is set to true.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the batch request was submitted to the server.
        # Corresponds to the JSON property `submitTime`
        # @return [String]
        attr_accessor :submit_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @state = args[:state] if args.key?(:state)
          @submit_time = args[:submit_time] if args.key?(:submit_time)
        end
      end
      
      # Logical element on the page.
      class GoogleCloudVisionV1p3beta1Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class GoogleCloudVisionV1p3beta1BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon normalized vertices.
        # Corresponds to the JSON property `normalizedVertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1NormalizedVertex>]
        attr_accessor :normalized_vertices
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_vertices = args[:normalized_vertices] if args.key?(:normalized_vertices)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class GoogleCloudVisionV1p3beta1ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class GoogleCloudVisionV1p3beta1CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class GoogleCloudVisionV1p3beta1CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class GoogleCloudVisionV1p3beta1DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class GoogleCloudVisionV1p3beta1EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class GoogleCloudVisionV1p3beta1FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1FaceAnnotationLandmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class GoogleCloudVisionV1p3beta1FaceAnnotationLandmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GoogleCloudVisionV1p3beta1GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI prefix where the results will be stored. Results
        # will be in JSON format and preceded by its corresponding input URI prefix.
        # This field can either represent a gcs file prefix or gcs directory. In
        # either case, the uri should be unique because in order to get all of the
        # output files, you will need to do a wildcard gcs search on the uri prefix
        # you provide.
        # Examples:
        # *    File Prefix: gs://bucket-name/here/filenameprefix   The output files
        # will be created in gs://bucket-name/here/ and the names of the
        # output files will begin with "filenameprefix".
        # *    Directory Prefix: gs://bucket-name/some/location/   The output files
        # will be created in gs://bucket-name/some/location/ and the names of the
        # output files could be anything because there was no filename prefix
        # specified.
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GoogleCloudVisionV1p3beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a
        # Google Cloud Storage object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class GoogleCloudVisionV1p3beta1ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class GoogleCloudVisionV1p3beta1ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # Response message for the `ImportProductSets` method.
      # This message is returned by the
      # google.longrunning.Operations.GetOperation method in the returned
      # google.longrunning.Operation.response field.
      class GoogleCloudVisionV1p3beta1ImportProductSetsResponse
        include Google::Apis::Core::Hashable
      
        # The list of reference_images that are imported successfully.
        # Corresponds to the JSON property `referenceImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ReferenceImage>]
        attr_accessor :reference_images
      
        # The rpc status for each ImportProductSet request, including both successes
        # and errors.
        # The number of statuses here matches the number of lines in the csv file,
        # and statuses[i] stores the success or failure status of processing the i-th
        # line of the csv, starting from line 0.
        # Corresponds to the JSON property `statuses`
        # @return [Array<Google::Apis::VisionV1p2beta1::Status>]
        attr_accessor :statuses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_images = args[:reference_images] if args.key?(:reference_images)
          @statuses = args[:statuses] if args.key?(:statuses)
        end
      end
      
      # The desired input location and metadata.
      class GoogleCloudVisionV1p3beta1InputConfig
        include Google::Apis::Core::Hashable
      
        # File content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Currently, this field only works for BatchAnnotateFiles requests. It does
        # not work for AsyncBatchAnnotateFiles requests.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf", "image/tiff" and
        # "image/gif" are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # Set of detected objects with bounding boxes.
      class GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Detected entity location information.
      class GoogleCloudVisionV1p3beta1LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVisionV1p3beta1NormalizedVertex
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
      
      # Contains metadata for the BatchAnnotateImages operation.
      class GoogleCloudVisionV1p3beta1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class GoogleCloudVisionV1p3beta1OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on
        # Google Cloud Storage.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class GoogleCloudVisionV1p3beta1Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class GoogleCloudVisionV1p3beta1Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of all words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p3beta1Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A Product contains ReferenceImages.
      class GoogleCloudVisionV1p3beta1Product
        include Google::Apis::Core::Hashable
      
        # User-provided metadata to be stored with this product. Must be at most 4096
        # characters long.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The user-provided name for this Product. Must not be empty. Must be at most
        # 4096 characters long.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the product.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # This field is ignored when creating a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The category for the product identified by the reference image.
        # This should
        # be either "homegoods-v2", "apparel-v2", or "toys-v2". The legacy categories
        # "homegoods", "apparel", and "toys" are still supported, but these should
        # not be used for new products.
        # Corresponds to the JSON property `productCategory`
        # @return [String]
        attr_accessor :product_category
      
        # Key-value pairs that can be attached to a product. At query time,
        # constraints can be specified based on the product_labels.
        # Note that integer values can be provided as strings, e.g. "1199". Only
        # strings with integer values can match a range-based restriction which is
        # to be supported soon.
        # Multiple values can be assigned to the same key. One product may have up to
        # 500 product_labels.
        # Notice that the total number of distinct product_labels over all products
        # in one ProductSet cannot exceed 1M, otherwise the product search pipeline
        # will refuse to work for that ProductSet.
        # Corresponds to the JSON property `productLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductKeyValue>]
        attr_accessor :product_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @product_category = args[:product_category] if args.key?(:product_category)
          @product_labels = args[:product_labels] if args.key?(:product_labels)
        end
      end
      
      # A product label represented as a key-value pair.
      class GoogleCloudVisionV1p3beta1ProductKeyValue
        include Google::Apis::Core::Hashable
      
        # The key of the label attached to the product. Cannot be empty and cannot
        # exceed 128 bytes.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the label attached to the product. Cannot be empty and
        # cannot exceed 128 bytes.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Results for a product search request.
      class GoogleCloudVisionV1p3beta1ProductSearchResults
        include Google::Apis::Core::Hashable
      
        # Timestamp of the index which provided these results. Products added to the
        # product set and products removed from the product set after this time are
        # not reflected in the current results.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # List of results grouped by products detected in the query image. Each entry
        # corresponds to one bounding polygon in the query image, and contains the
        # matching products specific to that region. There may be duplicate product
        # matches in the union of all the per-product results.
        # Corresponds to the JSON property `productGroupedResults`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult>]
        attr_accessor :product_grouped_results
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_time = args[:index_time] if args.key?(:index_time)
          @product_grouped_results = args[:product_grouped_results] if args.key?(:product_grouped_results)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Information about the products similar to a single product in a query
      # image.
      class GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # List of generic predictions for the object in the bounding box.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation>]
        attr_accessor :object_annotations
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Prediction for what the object in the bounding box is.
      class GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Information about a product.
      class GoogleCloudVisionV1p3beta1ProductSearchResultsResult
        include Google::Apis::Core::Hashable
      
        # The resource name of the image from the product that is the closest match
        # to the query.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # A Product contains ReferenceImages.
        # Corresponds to the JSON property `product`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Product]
        attr_accessor :product
      
        # A confidence level on the match, ranging from 0 (no confidence) to
        # 1 (full confidence).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @product = args[:product] if args.key?(:product)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class GoogleCloudVisionV1p3beta1Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A `ReferenceImage` represents a product image and its associated metadata,
      # such as bounding boxes.
      class GoogleCloudVisionV1p3beta1ReferenceImage
        include Google::Apis::Core::Hashable
      
        # Optional. Bounding polygons around the areas of interest in the reference
        # image.
        # If this field is empty, the system will try to detect regions of
        # interest. At most 10 bounding polygons will be used.
        # The provided shape is converted into a non-rotated rectangle. Once
        # converted, the small edge of the rectangle must be greater than or equal
        # to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5
        # is not).
        # Corresponds to the JSON property `boundingPolys`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly>]
        attr_accessor :bounding_polys
      
        # The resource name of the reference image.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/
        # IMAGE_ID`.
        # This field is ignored when creating a reference image.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The Google Cloud Storage URI of the reference image.
        # The URI must start with `gs://`.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_polys = args[:bounding_polys] if args.key?(:bounding_polys)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class GoogleCloudVisionV1p3beta1SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
        end
      end
      
      # A single symbol representation.
      class GoogleCloudVisionV1p3beta1Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class GoogleCloudVisionV1p3beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Detected start or end of a structural component.
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Additional information detected on the structural component.
      class GoogleCloudVisionV1p3beta1TextAnnotationTextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p3beta1Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
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
      
      # Relevant information for the image from the Internet.
      class GoogleCloudVisionV1p3beta1WebDetection
        include Google::Apis::Core::Hashable
      
        # The service's best guess as to the topic of the request image.
        # Inferred from similar images on the open web.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class GoogleCloudVisionV1p3beta1WebDetectionWebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class GoogleCloudVisionV1p3beta1WebDetectionWebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class GoogleCloudVisionV1p3beta1WebDetectionWebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class GoogleCloudVisionV1p3beta1WebDetectionWebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class GoogleCloudVisionV1p3beta1Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p3beta1Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
      
      # Response to a single file annotation request. A file may contain one or more
      # images, which individually have their own responses.
      class GoogleCloudVisionV1p4beta1AnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1InputConfig]
        attr_accessor :input_config
      
        # Individual responses to images found within the file. This field will be
        # empty if the `error` field is set.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        # This field gives the total number of pages in the file.
        # Corresponds to the JSON property `totalPages`
        # @return [Fixnum]
        attr_accessor :total_pages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @input_config = args[:input_config] if args.key?(:input_config)
          @responses = args[:responses] if args.key?(:responses)
          @total_pages = args[:total_pages] if args.key?(:total_pages)
        end
      end
      
      # Response to an image annotation request.
      class GoogleCloudVisionV1p4beta1AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, localized object detection has completed successfully.
        # This will be sorted descending by confidence score.
        # Corresponds to the JSON property `localizedObjectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation>]
        attr_accessor :localized_object_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Results for a product search request.
        # Corresponds to the JSON property `productSearchResults`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductSearchResults]
        attr_accessor :product_search_results
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @localized_object_annotations = args[:localized_object_annotations] if args.key?(:localized_object_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @product_search_results = args[:product_search_results] if args.key?(:product_search_results)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # The response for a single offline file annotation request.
      class GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # Response to an async batch file annotation request.
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Response to an async batch image annotation request.
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateImagesResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # A list of file annotation responses.
      class GoogleCloudVisionV1p4beta1BatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, each response corresponding to each
        # AnnotateFileRequest in BatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1AnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Metadata for the batch operations such as the current state.
      # This is included in the `metadata` field of the `Operation` returned by the
      # `GetOperation` call of the `google::longrunning::Operations` service.
      class GoogleCloudVisionV1p4beta1BatchOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request is finished and
        # google.longrunning.Operation.done is set to true.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the batch request was submitted to the server.
        # Corresponds to the JSON property `submitTime`
        # @return [String]
        attr_accessor :submit_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @state = args[:state] if args.key?(:state)
          @submit_time = args[:submit_time] if args.key?(:submit_time)
        end
      end
      
      # Logical element on the page.
      class GoogleCloudVisionV1p4beta1Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class GoogleCloudVisionV1p4beta1BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon normalized vertices.
        # Corresponds to the JSON property `normalizedVertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1NormalizedVertex>]
        attr_accessor :normalized_vertices
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @normalized_vertices = args[:normalized_vertices] if args.key?(:normalized_vertices)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # A Celebrity is a group of Faces with an identity.
      class GoogleCloudVisionV1p4beta1Celebrity
        include Google::Apis::Core::Hashable
      
        # The Celebrity's description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The Celebrity's display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the preloaded Celebrity. Has the format
        # `builtin/`mid``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class GoogleCloudVisionV1p4beta1ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class GoogleCloudVisionV1p4beta1CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class GoogleCloudVisionV1p4beta1CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class GoogleCloudVisionV1p4beta1DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class GoogleCloudVisionV1p4beta1EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class GoogleCloudVisionV1p4beta1FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1FaceAnnotationLandmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Additional recognition information. Only computed if
        # image_context.face_recognition_params is provided, **and** a match is found
        # to a Celebrity in the input CelebritySet. This field is
        # sorted in order of decreasing confidence values.
        # Corresponds to the JSON property `recognitionResult`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1FaceRecognitionResult>]
        attr_accessor :recognition_result
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @recognition_result = args[:recognition_result] if args.key?(:recognition_result)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class GoogleCloudVisionV1p4beta1FaceAnnotationLandmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Information about a face's identity.
      class GoogleCloudVisionV1p4beta1FaceRecognitionResult
        include Google::Apis::Core::Hashable
      
        # A Celebrity is a group of Faces with an identity.
        # Corresponds to the JSON property `celebrity`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Celebrity]
        attr_accessor :celebrity
      
        # Recognition confidence. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @celebrity = args[:celebrity] if args.key?(:celebrity)
          @confidence = args[:confidence] if args.key?(:confidence)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GoogleCloudVisionV1p4beta1GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI prefix where the results will be stored. Results
        # will be in JSON format and preceded by its corresponding input URI prefix.
        # This field can either represent a gcs file prefix or gcs directory. In
        # either case, the uri should be unique because in order to get all of the
        # output files, you will need to do a wildcard gcs search on the uri prefix
        # you provide.
        # Examples:
        # *    File Prefix: gs://bucket-name/here/filenameprefix   The output files
        # will be created in gs://bucket-name/here/ and the names of the
        # output files will begin with "filenameprefix".
        # *    Directory Prefix: gs://bucket-name/some/location/   The output files
        # will be created in gs://bucket-name/some/location/ and the names of the
        # output files could be anything because there was no filename prefix
        # specified.
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GoogleCloudVisionV1p4beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a
        # Google Cloud Storage object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class GoogleCloudVisionV1p4beta1ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class GoogleCloudVisionV1p4beta1ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # Response message for the `ImportProductSets` method.
      # This message is returned by the
      # google.longrunning.Operations.GetOperation method in the returned
      # google.longrunning.Operation.response field.
      class GoogleCloudVisionV1p4beta1ImportProductSetsResponse
        include Google::Apis::Core::Hashable
      
        # The list of reference_images that are imported successfully.
        # Corresponds to the JSON property `referenceImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ReferenceImage>]
        attr_accessor :reference_images
      
        # The rpc status for each ImportProductSet request, including both successes
        # and errors.
        # The number of statuses here matches the number of lines in the csv file,
        # and statuses[i] stores the success or failure status of processing the i-th
        # line of the csv, starting from line 0.
        # Corresponds to the JSON property `statuses`
        # @return [Array<Google::Apis::VisionV1p2beta1::Status>]
        attr_accessor :statuses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_images = args[:reference_images] if args.key?(:reference_images)
          @statuses = args[:statuses] if args.key?(:statuses)
        end
      end
      
      # The desired input location and metadata.
      class GoogleCloudVisionV1p4beta1InputConfig
        include Google::Apis::Core::Hashable
      
        # File content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Currently, this field only works for BatchAnnotateFiles requests. It does
        # not work for AsyncBatchAnnotateFiles requests.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf", "image/tiff" and
        # "image/gif" are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # Set of detected objects with bounding boxes.
      class GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Detected entity location information.
      class GoogleCloudVisionV1p4beta1LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class GoogleCloudVisionV1p4beta1NormalizedVertex
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
      
      # Contains metadata for the BatchAnnotateImages operation.
      class GoogleCloudVisionV1p4beta1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class GoogleCloudVisionV1p4beta1OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on
        # Google Cloud Storage.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class GoogleCloudVisionV1p4beta1Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class GoogleCloudVisionV1p4beta1Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of all words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p4beta1Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A Product contains ReferenceImages.
      class GoogleCloudVisionV1p4beta1Product
        include Google::Apis::Core::Hashable
      
        # User-provided metadata to be stored with this product. Must be at most 4096
        # characters long.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The user-provided name for this Product. Must not be empty. Must be at most
        # 4096 characters long.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the product.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # This field is ignored when creating a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The category for the product identified by the reference image.
        # This should
        # be either "homegoods-v2", "apparel-v2", or "toys-v2". The legacy categories
        # "homegoods", "apparel", and "toys" are still supported, but these should
        # not be used for new products.
        # Corresponds to the JSON property `productCategory`
        # @return [String]
        attr_accessor :product_category
      
        # Key-value pairs that can be attached to a product. At query time,
        # constraints can be specified based on the product_labels.
        # Note that integer values can be provided as strings, e.g. "1199". Only
        # strings with integer values can match a range-based restriction which is
        # to be supported soon.
        # Multiple values can be assigned to the same key. One product may have up to
        # 500 product_labels.
        # Notice that the total number of distinct product_labels over all products
        # in one ProductSet cannot exceed 1M, otherwise the product search pipeline
        # will refuse to work for that ProductSet.
        # Corresponds to the JSON property `productLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductKeyValue>]
        attr_accessor :product_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @product_category = args[:product_category] if args.key?(:product_category)
          @product_labels = args[:product_labels] if args.key?(:product_labels)
        end
      end
      
      # A product label represented as a key-value pair.
      class GoogleCloudVisionV1p4beta1ProductKeyValue
        include Google::Apis::Core::Hashable
      
        # The key of the label attached to the product. Cannot be empty and cannot
        # exceed 128 bytes.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the label attached to the product. Cannot be empty and
        # cannot exceed 128 bytes.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Results for a product search request.
      class GoogleCloudVisionV1p4beta1ProductSearchResults
        include Google::Apis::Core::Hashable
      
        # Timestamp of the index which provided these results. Products added to the
        # product set and products removed from the product set after this time are
        # not reflected in the current results.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # List of results grouped by products detected in the query image. Each entry
        # corresponds to one bounding polygon in the query image, and contains the
        # matching products specific to that region. There may be duplicate product
        # matches in the union of all the per-product results.
        # Corresponds to the JSON property `productGroupedResults`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult>]
        attr_accessor :product_grouped_results
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_time = args[:index_time] if args.key?(:index_time)
          @product_grouped_results = args[:product_grouped_results] if args.key?(:product_grouped_results)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Information about the products similar to a single product in a query
      # image.
      class GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # List of generic predictions for the object in the bounding box.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation>]
        attr_accessor :object_annotations
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Prediction for what the object in the bounding box is.
      class GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Information about a product.
      class GoogleCloudVisionV1p4beta1ProductSearchResultsResult
        include Google::Apis::Core::Hashable
      
        # The resource name of the image from the product that is the closest match
        # to the query.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # A Product contains ReferenceImages.
        # Corresponds to the JSON property `product`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Product]
        attr_accessor :product
      
        # A confidence level on the match, ranging from 0 (no confidence) to
        # 1 (full confidence).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @product = args[:product] if args.key?(:product)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class GoogleCloudVisionV1p4beta1Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A `ReferenceImage` represents a product image and its associated metadata,
      # such as bounding boxes.
      class GoogleCloudVisionV1p4beta1ReferenceImage
        include Google::Apis::Core::Hashable
      
        # Optional. Bounding polygons around the areas of interest in the reference
        # image.
        # If this field is empty, the system will try to detect regions of
        # interest. At most 10 bounding polygons will be used.
        # The provided shape is converted into a non-rotated rectangle. Once
        # converted, the small edge of the rectangle must be greater than or equal
        # to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5
        # is not).
        # Corresponds to the JSON property `boundingPolys`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly>]
        attr_accessor :bounding_polys
      
        # The resource name of the reference image.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/
        # IMAGE_ID`.
        # This field is ignored when creating a reference image.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The Google Cloud Storage URI of the reference image.
        # The URI must start with `gs://`.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_polys = args[:bounding_polys] if args.key?(:bounding_polys)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class GoogleCloudVisionV1p4beta1SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
        end
      end
      
      # A single symbol representation.
      class GoogleCloudVisionV1p4beta1Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class GoogleCloudVisionV1p4beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Detected start or end of a structural component.
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Additional information detected on the structural component.
      class GoogleCloudVisionV1p4beta1TextAnnotationTextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p4beta1Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
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
      
      # Relevant information for the image from the Internet.
      class GoogleCloudVisionV1p4beta1WebDetection
        include Google::Apis::Core::Hashable
      
        # The service's best guess as to the topic of the request image.
        # Inferred from similar images on the open web.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class GoogleCloudVisionV1p4beta1WebDetectionWebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class GoogleCloudVisionV1p4beta1WebDetectionWebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class GoogleCloudVisionV1p4beta1WebDetectionWebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class GoogleCloudVisionV1p4beta1WebDetectionWebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class GoogleCloudVisionV1p4beta1Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p4beta1Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
      
      # Information about the products similar to a single product in a query
      # image.
      class GroupedResult
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_poly
      
        # List of generic predictions for the object in the bounding box.
        # Corresponds to the JSON property `objectAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::ObjectAnnotation>]
        attr_accessor :object_annotations
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::Result>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @object_annotations = args[:object_annotations] if args.key?(:object_annotations)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # Response message for the `ImportProductSets` method.
      # This message is returned by the
      # google.longrunning.Operations.GetOperation method in the returned
      # google.longrunning.Operation.response field.
      class ImportProductSetsResponse
        include Google::Apis::Core::Hashable
      
        # The list of reference_images that are imported successfully.
        # Corresponds to the JSON property `referenceImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::ReferenceImage>]
        attr_accessor :reference_images
      
        # The rpc status for each ImportProductSet request, including both successes
        # and errors.
        # The number of statuses here matches the number of lines in the csv file,
        # and statuses[i] stores the success or failure status of processing the i-th
        # line of the csv, starting from line 0.
        # Corresponds to the JSON property `statuses`
        # @return [Array<Google::Apis::VisionV1p2beta1::Status>]
        attr_accessor :statuses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_images = args[:reference_images] if args.key?(:reference_images)
          @statuses = args[:statuses] if args.key?(:statuses)
        end
      end
      
      # The desired input location and metadata.
      class InputConfig
        include Google::Apis::Core::Hashable
      
        # File content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Currently, this field only works for BatchAnnotateFiles requests. It does
        # not work for AsyncBatchAnnotateFiles requests.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf", "image/tiff" and
        # "image/gif" are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # A product label represented as a key-value pair.
      class KeyValue
        include Google::Apis::Core::Hashable
      
        # The key of the label attached to the product. Cannot be empty and cannot
        # exceed 128 bytes.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the label attached to the product. Cannot be empty and
        # cannot exceed 128 bytes.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class Landmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      class LatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # Set of detected objects with bounding boxes.
      class LocalizedObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_poly
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Detected entity location information.
      class LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the normalized vertex coordinates are relative to the original image
      # and range from 0 to 1.
      class NormalizedVertex
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
      
      # Prediction for what the object in the bounding box is.
      class ObjectAnnotation
        include Google::Apis::Core::Hashable
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Object ID that should align with EntityAnnotation mid.
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Object name, expressed in its `language_code` language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @mid = args[:mid] if args.key?(:mid)
          @name = args[:name] if args.key?(:name)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
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
        # @return [Google::Apis::VisionV1p2beta1::Status]
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
      
      # Contains metadata for the BatchAnnotateImages operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on
        # Google Cloud Storage.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::TextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::TextProperty]
        attr_accessor :property
      
        # List of all words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A Product contains ReferenceImages.
      class Product
        include Google::Apis::Core::Hashable
      
        # User-provided metadata to be stored with this product. Must be at most 4096
        # characters long.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The user-provided name for this Product. Must not be empty. Must be at most
        # 4096 characters long.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The resource name of the product.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # This field is ignored when creating a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The category for the product identified by the reference image.
        # This should
        # be either "homegoods-v2", "apparel-v2", or "toys-v2". The legacy categories
        # "homegoods", "apparel", and "toys" are still supported, but these should
        # not be used for new products.
        # Corresponds to the JSON property `productCategory`
        # @return [String]
        attr_accessor :product_category
      
        # Key-value pairs that can be attached to a product. At query time,
        # constraints can be specified based on the product_labels.
        # Note that integer values can be provided as strings, e.g. "1199". Only
        # strings with integer values can match a range-based restriction which is
        # to be supported soon.
        # Multiple values can be assigned to the same key. One product may have up to
        # 500 product_labels.
        # Notice that the total number of distinct product_labels over all products
        # in one ProductSet cannot exceed 1M, otherwise the product search pipeline
        # will refuse to work for that ProductSet.
        # Corresponds to the JSON property `productLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::KeyValue>]
        attr_accessor :product_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @product_category = args[:product_category] if args.key?(:product_category)
          @product_labels = args[:product_labels] if args.key?(:product_labels)
        end
      end
      
      # Results for a product search request.
      class ProductSearchResults
        include Google::Apis::Core::Hashable
      
        # Timestamp of the index which provided these results. Products added to the
        # product set and products removed from the product set after this time are
        # not reflected in the current results.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # List of results grouped by products detected in the query image. Each entry
        # corresponds to one bounding polygon in the query image, and contains the
        # matching products specific to that region. There may be duplicate product
        # matches in the union of all the per-product results.
        # Corresponds to the JSON property `productGroupedResults`
        # @return [Array<Google::Apis::VisionV1p2beta1::GroupedResult>]
        attr_accessor :product_grouped_results
      
        # List of results, one for each product match.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::VisionV1p2beta1::Result>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_time = args[:index_time] if args.key?(:index_time)
          @product_grouped_results = args[:product_grouped_results] if args.key?(:product_grouped_results)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A `ReferenceImage` represents a product image and its associated metadata,
      # such as bounding boxes.
      class ReferenceImage
        include Google::Apis::Core::Hashable
      
        # Optional. Bounding polygons around the areas of interest in the reference
        # image.
        # If this field is empty, the system will try to detect regions of
        # interest. At most 10 bounding polygons will be used.
        # The provided shape is converted into a non-rotated rectangle. Once
        # converted, the small edge of the rectangle must be greater than or equal
        # to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5
        # is not).
        # Corresponds to the JSON property `boundingPolys`
        # @return [Array<Google::Apis::VisionV1p2beta1::BoundingPoly>]
        attr_accessor :bounding_polys
      
        # The resource name of the reference image.
        # Format is:
        # `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/
        # IMAGE_ID`.
        # This field is ignored when creating a reference image.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The Google Cloud Storage URI of the reference image.
        # The URI must start with `gs://`.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_polys = args[:bounding_polys] if args.key?(:bounding_polys)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Information about a product.
      class Result
        include Google::Apis::Core::Hashable
      
        # The resource name of the image from the product that is the closest match
        # to the query.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # A Product contains ReferenceImages.
        # Corresponds to the JSON property `product`
        # @return [Google::Apis::VisionV1p2beta1::Product]
        attr_accessor :product
      
        # A confidence level on the match, ranging from 0 (no confidence) to
        # 1 (full confidence).
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @product = args[:product] if args.key?(:product)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
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
      
      # A single symbol representation.
      class Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::TextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Additional information detected on the structural component.
      class TextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::DetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::DetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
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
      
      # Relevant information for the image from the Internet.
      class WebDetection
        include Google::Apis::Core::Hashable
      
        # The service's best guess as to the topic of the request image.
        # Inferred from similar images on the open web.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class WebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class WebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class WebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class WebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::WebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::TextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
    end
  end
end
