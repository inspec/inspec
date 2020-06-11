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
    module VisionV1
      
      class AddProductToProductSetRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotateFileRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotateImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncAnnotateFileRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncAnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncBatchAnnotateFilesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncBatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncBatchAnnotateImagesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AsyncBatchAnnotateImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAnnotateFilesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAnnotateImagesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAnnotateImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Block
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BoundingPoly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Color
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ColorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropHintsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropHintsParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DetectedBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DominantColorsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FaceAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Feature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1AnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1AnnotateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1AsyncBatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Block
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1BoundingPoly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ColorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1CropHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1CropHintsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1DominantColorsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1EntityAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1FaceAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1FaceAnnotationLandmark
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ImageAnnotationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1LocationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1NormalizedVertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ProductKeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1SafeSearchAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Symbol
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationTextProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Vertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1WebDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p1beta1Word
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1AnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1AnnotateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Block
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1BoundingPoly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ColorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1CropHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1CropHintsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1DominantColorsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1EntityAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1FaceAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1FaceAnnotationLandmark
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ImageAnnotationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1LocationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1NormalizedVertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ProductKeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1SafeSearchAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Symbol
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationTextProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Vertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1WebDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p2beta1Word
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1AnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1AnnotateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1AsyncBatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1BatchOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Block
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1BoundingPoly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ColorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1CropHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1CropHintsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1DominantColorsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1EntityAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1FaceAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1FaceAnnotationLandmark
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ImageAnnotationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ImportProductSetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1LocationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1NormalizedVertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ProductKeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1ReferenceImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1SafeSearchAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Symbol
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationTextProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Vertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1WebDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p3beta1Word
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1AnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1AnnotateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1BatchAnnotateFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1BatchOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Block
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1BoundingPoly
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Celebrity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ColorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1CropHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1CropHintsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1DominantColorsAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1EntityAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1FaceAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1FaceAnnotationLandmark
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1FaceRecognitionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1GcsDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1GcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ImageAnnotationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ImportProductSetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1LocationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1NormalizedVertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ProductKeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1ReferenceImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1SafeSearchAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Symbol
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationTextProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Vertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1WebDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudVisionV1p4beta1Word
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupedResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageAnnotationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportProductSetsGcsSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportProductSetsInputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportProductSetsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportProductSetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Landmark
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LatLng
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LatLongRect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductSetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductsInProductSetResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReferenceImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalizedObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NormalizedVertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutputConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Position
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductSearchParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductSearchResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductSetPurgeConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Property
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PurgeProductsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReferenceImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemoveProductFromProductSetRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Result
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SafeSearchAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Symbol
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Vertex
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebDetectionParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Word
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddProductToProductSetRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :product, as: 'product'
        end
      end
      
      class AnnotateFileRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :features, as: 'features', class: Google::Apis::VisionV1::Feature, decorator: Google::Apis::VisionV1::Feature::Representation
      
          property :image_context, as: 'imageContext', class: Google::Apis::VisionV1::ImageContext, decorator: Google::Apis::VisionV1::ImageContext::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::InputConfig, decorator: Google::Apis::VisionV1::InputConfig::Representation
      
          collection :pages, as: 'pages'
        end
      end
      
      class AnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::InputConfig, decorator: Google::Apis::VisionV1::InputConfig::Representation
      
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::AnnotateImageResponse, decorator: Google::Apis::VisionV1::AnnotateImageResponse::Representation
      
          property :total_pages, as: 'totalPages'
        end
      end
      
      class AnnotateImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :features, as: 'features', class: Google::Apis::VisionV1::Feature, decorator: Google::Apis::VisionV1::Feature::Representation
      
          property :image, as: 'image', class: Google::Apis::VisionV1::Image, decorator: Google::Apis::VisionV1::Image::Representation
      
          property :image_context, as: 'imageContext', class: Google::Apis::VisionV1::ImageContext, decorator: Google::Apis::VisionV1::ImageContext::Representation
      
        end
      end
      
      class AnnotateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::VisionV1::ImageAnnotationContext, decorator: Google::Apis::VisionV1::ImageAnnotationContext::Representation
      
          property :crop_hints_annotation, as: 'cropHintsAnnotation', class: Google::Apis::VisionV1::CropHintsAnnotation, decorator: Google::Apis::VisionV1::CropHintsAnnotation::Representation
      
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          collection :face_annotations, as: 'faceAnnotations', class: Google::Apis::VisionV1::FaceAnnotation, decorator: Google::Apis::VisionV1::FaceAnnotation::Representation
      
          property :full_text_annotation, as: 'fullTextAnnotation', class: Google::Apis::VisionV1::TextAnnotation, decorator: Google::Apis::VisionV1::TextAnnotation::Representation
      
          property :image_properties_annotation, as: 'imagePropertiesAnnotation', class: Google::Apis::VisionV1::ImageProperties, decorator: Google::Apis::VisionV1::ImageProperties::Representation
      
          collection :label_annotations, as: 'labelAnnotations', class: Google::Apis::VisionV1::EntityAnnotation, decorator: Google::Apis::VisionV1::EntityAnnotation::Representation
      
          collection :landmark_annotations, as: 'landmarkAnnotations', class: Google::Apis::VisionV1::EntityAnnotation, decorator: Google::Apis::VisionV1::EntityAnnotation::Representation
      
          collection :localized_object_annotations, as: 'localizedObjectAnnotations', class: Google::Apis::VisionV1::LocalizedObjectAnnotation, decorator: Google::Apis::VisionV1::LocalizedObjectAnnotation::Representation
      
          collection :logo_annotations, as: 'logoAnnotations', class: Google::Apis::VisionV1::EntityAnnotation, decorator: Google::Apis::VisionV1::EntityAnnotation::Representation
      
          property :product_search_results, as: 'productSearchResults', class: Google::Apis::VisionV1::ProductSearchResults, decorator: Google::Apis::VisionV1::ProductSearchResults::Representation
      
          property :safe_search_annotation, as: 'safeSearchAnnotation', class: Google::Apis::VisionV1::SafeSearchAnnotation, decorator: Google::Apis::VisionV1::SafeSearchAnnotation::Representation
      
          collection :text_annotations, as: 'textAnnotations', class: Google::Apis::VisionV1::EntityAnnotation, decorator: Google::Apis::VisionV1::EntityAnnotation::Representation
      
          property :web_detection, as: 'webDetection', class: Google::Apis::VisionV1::WebDetection, decorator: Google::Apis::VisionV1::WebDetection::Representation
      
        end
      end
      
      class AsyncAnnotateFileRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :features, as: 'features', class: Google::Apis::VisionV1::Feature, decorator: Google::Apis::VisionV1::Feature::Representation
      
          property :image_context, as: 'imageContext', class: Google::Apis::VisionV1::ImageContext, decorator: Google::Apis::VisionV1::ImageContext::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::InputConfig, decorator: Google::Apis::VisionV1::InputConfig::Representation
      
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::OutputConfig, decorator: Google::Apis::VisionV1::OutputConfig::Representation
      
        end
      end
      
      class AsyncAnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::OutputConfig, decorator: Google::Apis::VisionV1::OutputConfig::Representation
      
        end
      end
      
      class AsyncBatchAnnotateFilesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent, as: 'parent'
          collection :requests, as: 'requests', class: Google::Apis::VisionV1::AsyncAnnotateFileRequest, decorator: Google::Apis::VisionV1::AsyncAnnotateFileRequest::Representation
      
        end
      end
      
      class AsyncBatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::AsyncAnnotateFileResponse, decorator: Google::Apis::VisionV1::AsyncAnnotateFileResponse::Representation
      
        end
      end
      
      class AsyncBatchAnnotateImagesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::OutputConfig, decorator: Google::Apis::VisionV1::OutputConfig::Representation
      
          property :parent, as: 'parent'
          collection :requests, as: 'requests', class: Google::Apis::VisionV1::AnnotateImageRequest, decorator: Google::Apis::VisionV1::AnnotateImageRequest::Representation
      
        end
      end
      
      class AsyncBatchAnnotateImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::OutputConfig, decorator: Google::Apis::VisionV1::OutputConfig::Representation
      
        end
      end
      
      class BatchAnnotateFilesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent, as: 'parent'
          collection :requests, as: 'requests', class: Google::Apis::VisionV1::AnnotateFileRequest, decorator: Google::Apis::VisionV1::AnnotateFileRequest::Representation
      
        end
      end
      
      class BatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::AnnotateFileResponse, decorator: Google::Apis::VisionV1::AnnotateFileResponse::Representation
      
        end
      end
      
      class BatchAnnotateImagesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent, as: 'parent'
          collection :requests, as: 'requests', class: Google::Apis::VisionV1::AnnotateImageRequest, decorator: Google::Apis::VisionV1::AnnotateImageRequest::Representation
      
        end
      end
      
      class BatchAnnotateImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::AnnotateImageResponse, decorator: Google::Apis::VisionV1::AnnotateImageResponse::Representation
      
        end
      end
      
      class BatchOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :state, as: 'state'
          property :submit_time, as: 'submitTime'
        end
      end
      
      class Block
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_type, as: 'blockType'
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          collection :paragraphs, as: 'paragraphs', class: Google::Apis::VisionV1::Paragraph, decorator: Google::Apis::VisionV1::Paragraph::Representation
      
          property :property, as: 'property', class: Google::Apis::VisionV1::TextProperty, decorator: Google::Apis::VisionV1::TextProperty::Representation
      
        end
      end
      
      class BoundingPoly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :normalized_vertices, as: 'normalizedVertices', class: Google::Apis::VisionV1::NormalizedVertex, decorator: Google::Apis::VisionV1::NormalizedVertex::Representation
      
          collection :vertices, as: 'vertices', class: Google::Apis::VisionV1::Vertex, decorator: Google::Apis::VisionV1::Vertex::Representation
      
        end
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Color
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alpha, as: 'alpha'
          property :blue, as: 'blue'
          property :green, as: 'green'
          property :red, as: 'red'
        end
      end
      
      class ColorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::VisionV1::Color, decorator: Google::Apis::VisionV1::Color::Representation
      
          property :pixel_fraction, as: 'pixelFraction'
          property :score, as: 'score'
        end
      end
      
      class CropHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :importance_fraction, as: 'importanceFraction'
        end
      end
      
      class CropHintsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crop_hints, as: 'cropHints', class: Google::Apis::VisionV1::CropHint, decorator: Google::Apis::VisionV1::CropHint::Representation
      
        end
      end
      
      class CropHintsParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aspect_ratios, as: 'aspectRatios'
        end
      end
      
      class DetectedBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_prefix, as: 'isPrefix'
          property :type, as: 'type'
        end
      end
      
      class DetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class DominantColorsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::VisionV1::ColorInfo, decorator: Google::Apis::VisionV1::ColorInfo::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EntityAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :description, as: 'description'
          property :locale, as: 'locale'
          collection :locations, as: 'locations', class: Google::Apis::VisionV1::LocationInfo, decorator: Google::Apis::VisionV1::LocationInfo::Representation
      
          property :mid, as: 'mid'
          collection :properties, as: 'properties', class: Google::Apis::VisionV1::Property, decorator: Google::Apis::VisionV1::Property::Representation
      
          property :score, as: 'score'
          property :topicality, as: 'topicality'
        end
      end
      
      class FaceAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anger_likelihood, as: 'angerLikelihood'
          property :blurred_likelihood, as: 'blurredLikelihood'
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :detection_confidence, as: 'detectionConfidence'
          property :fd_bounding_poly, as: 'fdBoundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :headwear_likelihood, as: 'headwearLikelihood'
          property :joy_likelihood, as: 'joyLikelihood'
          property :landmarking_confidence, as: 'landmarkingConfidence'
          collection :landmarks, as: 'landmarks', class: Google::Apis::VisionV1::Landmark, decorator: Google::Apis::VisionV1::Landmark::Representation
      
          property :pan_angle, as: 'panAngle'
          property :roll_angle, as: 'rollAngle'
          property :sorrow_likelihood, as: 'sorrowLikelihood'
          property :surprise_likelihood, as: 'surpriseLikelihood'
          property :tilt_angle, as: 'tiltAngle'
          property :under_exposed_likelihood, as: 'underExposedLikelihood'
        end
      end
      
      class Feature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_results, as: 'maxResults'
          property :model, as: 'model'
          property :type, as: 'type'
        end
      end
      
      class GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p1beta1AnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1InputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1InputConfig::Representation
      
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1AnnotateImageResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1AnnotateImageResponse::Representation
      
          property :total_pages, as: 'totalPages'
        end
      end
      
      class GoogleCloudVisionV1p1beta1AnnotateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ImageAnnotationContext, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ImageAnnotationContext::Representation
      
          property :crop_hints_annotation, as: 'cropHintsAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1CropHintsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1CropHintsAnnotation::Representation
      
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          collection :face_annotations, as: 'faceAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1FaceAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1FaceAnnotation::Representation
      
          property :full_text_annotation, as: 'fullTextAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotation::Representation
      
          property :image_properties_annotation, as: 'imagePropertiesAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ImageProperties, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ImageProperties::Representation
      
          collection :label_annotations, as: 'labelAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation::Representation
      
          collection :landmark_annotations, as: 'landmarkAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation::Representation
      
          collection :localized_object_annotations, as: 'localizedObjectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation::Representation
      
          collection :logo_annotations, as: 'logoAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation::Representation
      
          property :product_search_results, as: 'productSearchResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResults, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResults::Representation
      
          property :safe_search_annotation, as: 'safeSearchAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1SafeSearchAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1SafeSearchAnnotation::Representation
      
          collection :text_annotations, as: 'textAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1EntityAnnotation::Representation
      
          property :web_detection, as: 'webDetection', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetection, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetection::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1OutputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1OutputConfig::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1AsyncBatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1Block
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_type, as: 'blockType'
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          collection :paragraphs, as: 'paragraphs', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Paragraph, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Paragraph::Representation
      
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1BoundingPoly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :normalized_vertices, as: 'normalizedVertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1NormalizedVertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1NormalizedVertex::Representation
      
          collection :vertices, as: 'vertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Vertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Vertex::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1ColorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::VisionV1::Color, decorator: Google::Apis::VisionV1::Color::Representation
      
          property :pixel_fraction, as: 'pixelFraction'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p1beta1CropHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :importance_fraction, as: 'importanceFraction'
        end
      end
      
      class GoogleCloudVisionV1p1beta1CropHintsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crop_hints, as: 'cropHints', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1CropHint, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1CropHint::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1DominantColorsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ColorInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ColorInfo::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1EntityAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :description, as: 'description'
          property :locale, as: 'locale'
          collection :locations, as: 'locations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1LocationInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1LocationInfo::Representation
      
          property :mid, as: 'mid'
          collection :properties, as: 'properties', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Property, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Property::Representation
      
          property :score, as: 'score'
          property :topicality, as: 'topicality'
        end
      end
      
      class GoogleCloudVisionV1p1beta1FaceAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anger_likelihood, as: 'angerLikelihood'
          property :blurred_likelihood, as: 'blurredLikelihood'
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :detection_confidence, as: 'detectionConfidence'
          property :fd_bounding_poly, as: 'fdBoundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :headwear_likelihood, as: 'headwearLikelihood'
          property :joy_likelihood, as: 'joyLikelihood'
          property :landmarking_confidence, as: 'landmarkingConfidence'
          collection :landmarks, as: 'landmarks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1FaceAnnotationLandmark, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1FaceAnnotationLandmark::Representation
      
          property :pan_angle, as: 'panAngle'
          property :roll_angle, as: 'rollAngle'
          property :sorrow_likelihood, as: 'sorrowLikelihood'
          property :surprise_likelihood, as: 'surpriseLikelihood'
          property :tilt_angle, as: 'tiltAngle'
          property :under_exposed_likelihood, as: 'underExposedLikelihood'
        end
      end
      
      class GoogleCloudVisionV1p1beta1FaceAnnotationLandmark
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :position, as: 'position', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Position, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Position::Representation
      
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p1beta1GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p1beta1GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p1beta1ImageAnnotationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_number, as: 'pageNumber'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p1beta1ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dominant_colors, as: 'dominantColors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1DominantColorsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1DominantColorsAnnotation::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1GcsSource, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p1beta1LocationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1NormalizedVertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p1beta1OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudVisionV1p1beta1OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_size, as: 'batchSize'
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1GcsDestination, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1GcsDestination::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocks, as: 'blocks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Block, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Block::Representation
      
          property :confidence, as: 'confidence'
          property :height, as: 'height'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty::Representation
      
          property :width, as: 'width'
        end
      end
      
      class GoogleCloudVisionV1p1beta1Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty::Representation
      
          collection :words, as: 'words', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Word, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Word::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
          property :z, as: 'z'
        end
      end
      
      class GoogleCloudVisionV1p1beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :product_category, as: 'productCategory'
          collection :product_labels, as: 'productLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductKeyValue, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductKeyValue::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1ProductKeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_time, as: 'indexTime'
          collection :product_grouped_results, as: 'productGroupedResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          collection :object_annotations, as: 'objectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p1beta1ProductSearchResultsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
          property :product, as: 'product', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Product, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Product::Representation
      
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p1beta1Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :uint64_value, :numeric_string => true, as: 'uint64Value'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p1beta1SafeSearchAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult, as: 'adult'
          property :medical, as: 'medical'
          property :racy, as: 'racy'
          property :spoof, as: 'spoof'
          property :violence, as: 'violence'
        end
      end
      
      class GoogleCloudVisionV1p1beta1Symbol
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pages, as: 'pages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Page, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Page::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_prefix, as: 'isPrefix'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p1beta1TextAnnotationTextProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_break, as: 'detectedBreak', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak::Representation
      
          collection :detected_languages, as: 'detectedLanguages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1Vertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p1beta1WebDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_guess_labels, as: 'bestGuessLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebLabel, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebLabel::Representation
      
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage::Representation
      
          collection :pages_with_matching_images, as: 'pagesWithMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebPage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebPage::Representation
      
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage::Representation
      
          collection :visually_similar_images, as: 'visuallySimilarImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage::Representation
      
          collection :web_entities, as: 'webEntities', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebEntity, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebEntity::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :entity_id, as: 'entityId'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p1beta1WebDetectionWebPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage::Representation
      
          property :page_title, as: 'pageTitle'
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1WebDetectionWebImage::Representation
      
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p1beta1Word
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1TextAnnotationTextProperty::Representation
      
          collection :symbols, as: 'symbols', class: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Symbol, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p1beta1Symbol::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1AnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1InputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1InputConfig::Representation
      
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1AnnotateImageResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1AnnotateImageResponse::Representation
      
          property :total_pages, as: 'totalPages'
        end
      end
      
      class GoogleCloudVisionV1p2beta1AnnotateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ImageAnnotationContext, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ImageAnnotationContext::Representation
      
          property :crop_hints_annotation, as: 'cropHintsAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1CropHintsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1CropHintsAnnotation::Representation
      
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          collection :face_annotations, as: 'faceAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1FaceAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1FaceAnnotation::Representation
      
          property :full_text_annotation, as: 'fullTextAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotation::Representation
      
          property :image_properties_annotation, as: 'imagePropertiesAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ImageProperties, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ImageProperties::Representation
      
          collection :label_annotations, as: 'labelAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation::Representation
      
          collection :landmark_annotations, as: 'landmarkAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation::Representation
      
          collection :localized_object_annotations, as: 'localizedObjectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation::Representation
      
          collection :logo_annotations, as: 'logoAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation::Representation
      
          property :product_search_results, as: 'productSearchResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResults, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResults::Representation
      
          property :safe_search_annotation, as: 'safeSearchAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1SafeSearchAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1SafeSearchAnnotation::Representation
      
          collection :text_annotations, as: 'textAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1EntityAnnotation::Representation
      
          property :web_detection, as: 'webDetection', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetection, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetection::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1OutputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1OutputConfig::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1Block
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_type, as: 'blockType'
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          collection :paragraphs, as: 'paragraphs', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Paragraph, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Paragraph::Representation
      
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1BoundingPoly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :normalized_vertices, as: 'normalizedVertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1NormalizedVertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1NormalizedVertex::Representation
      
          collection :vertices, as: 'vertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Vertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Vertex::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1ColorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::VisionV1::Color, decorator: Google::Apis::VisionV1::Color::Representation
      
          property :pixel_fraction, as: 'pixelFraction'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p2beta1CropHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :importance_fraction, as: 'importanceFraction'
        end
      end
      
      class GoogleCloudVisionV1p2beta1CropHintsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crop_hints, as: 'cropHints', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1CropHint, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1CropHint::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1DominantColorsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ColorInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ColorInfo::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1EntityAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :description, as: 'description'
          property :locale, as: 'locale'
          collection :locations, as: 'locations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1LocationInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1LocationInfo::Representation
      
          property :mid, as: 'mid'
          collection :properties, as: 'properties', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Property, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Property::Representation
      
          property :score, as: 'score'
          property :topicality, as: 'topicality'
        end
      end
      
      class GoogleCloudVisionV1p2beta1FaceAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anger_likelihood, as: 'angerLikelihood'
          property :blurred_likelihood, as: 'blurredLikelihood'
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :detection_confidence, as: 'detectionConfidence'
          property :fd_bounding_poly, as: 'fdBoundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :headwear_likelihood, as: 'headwearLikelihood'
          property :joy_likelihood, as: 'joyLikelihood'
          property :landmarking_confidence, as: 'landmarkingConfidence'
          collection :landmarks, as: 'landmarks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1FaceAnnotationLandmark, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1FaceAnnotationLandmark::Representation
      
          property :pan_angle, as: 'panAngle'
          property :roll_angle, as: 'rollAngle'
          property :sorrow_likelihood, as: 'sorrowLikelihood'
          property :surprise_likelihood, as: 'surpriseLikelihood'
          property :tilt_angle, as: 'tiltAngle'
          property :under_exposed_likelihood, as: 'underExposedLikelihood'
        end
      end
      
      class GoogleCloudVisionV1p2beta1FaceAnnotationLandmark
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :position, as: 'position', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Position, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Position::Representation
      
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p2beta1GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p2beta1GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p2beta1ImageAnnotationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_number, as: 'pageNumber'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p2beta1ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dominant_colors, as: 'dominantColors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1DominantColorsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1DominantColorsAnnotation::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1GcsSource, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p2beta1LocationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1NormalizedVertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p2beta1OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudVisionV1p2beta1OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_size, as: 'batchSize'
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1GcsDestination, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1GcsDestination::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocks, as: 'blocks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Block, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Block::Representation
      
          property :confidence, as: 'confidence'
          property :height, as: 'height'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty::Representation
      
          property :width, as: 'width'
        end
      end
      
      class GoogleCloudVisionV1p2beta1Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty::Representation
      
          collection :words, as: 'words', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Word, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Word::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
          property :z, as: 'z'
        end
      end
      
      class GoogleCloudVisionV1p2beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :product_category, as: 'productCategory'
          collection :product_labels, as: 'productLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductKeyValue, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductKeyValue::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1ProductKeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_time, as: 'indexTime'
          collection :product_grouped_results, as: 'productGroupedResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          collection :object_annotations, as: 'objectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p2beta1ProductSearchResultsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
          property :product, as: 'product', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Product, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Product::Representation
      
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p2beta1Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :uint64_value, :numeric_string => true, as: 'uint64Value'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p2beta1SafeSearchAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult, as: 'adult'
          property :medical, as: 'medical'
          property :racy, as: 'racy'
          property :spoof, as: 'spoof'
          property :violence, as: 'violence'
        end
      end
      
      class GoogleCloudVisionV1p2beta1Symbol
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pages, as: 'pages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Page, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Page::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_prefix, as: 'isPrefix'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p2beta1TextAnnotationTextProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_break, as: 'detectedBreak', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak::Representation
      
          collection :detected_languages, as: 'detectedLanguages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1Vertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p2beta1WebDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_guess_labels, as: 'bestGuessLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebLabel, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebLabel::Representation
      
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage::Representation
      
          collection :pages_with_matching_images, as: 'pagesWithMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebPage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebPage::Representation
      
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage::Representation
      
          collection :visually_similar_images, as: 'visuallySimilarImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage::Representation
      
          collection :web_entities, as: 'webEntities', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebEntity, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebEntity::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :entity_id, as: 'entityId'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p2beta1WebDetectionWebPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage::Representation
      
          property :page_title, as: 'pageTitle'
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1WebDetectionWebImage::Representation
      
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p2beta1Word
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty::Representation
      
          collection :symbols, as: 'symbols', class: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Symbol, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p2beta1Symbol::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1AnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1InputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1InputConfig::Representation
      
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1AnnotateImageResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1AnnotateImageResponse::Representation
      
          property :total_pages, as: 'totalPages'
        end
      end
      
      class GoogleCloudVisionV1p3beta1AnnotateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ImageAnnotationContext, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ImageAnnotationContext::Representation
      
          property :crop_hints_annotation, as: 'cropHintsAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1CropHintsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1CropHintsAnnotation::Representation
      
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          collection :face_annotations, as: 'faceAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1FaceAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1FaceAnnotation::Representation
      
          property :full_text_annotation, as: 'fullTextAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotation::Representation
      
          property :image_properties_annotation, as: 'imagePropertiesAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ImageProperties, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ImageProperties::Representation
      
          collection :label_annotations, as: 'labelAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation::Representation
      
          collection :landmark_annotations, as: 'landmarkAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation::Representation
      
          collection :localized_object_annotations, as: 'localizedObjectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation::Representation
      
          collection :logo_annotations, as: 'logoAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation::Representation
      
          property :product_search_results, as: 'productSearchResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResults, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResults::Representation
      
          property :safe_search_annotation, as: 'safeSearchAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1SafeSearchAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1SafeSearchAnnotation::Representation
      
          collection :text_annotations, as: 'textAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1EntityAnnotation::Representation
      
          property :web_detection, as: 'webDetection', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetection, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetection::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1OutputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1OutputConfig::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1AsyncBatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1BatchOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :state, as: 'state'
          property :submit_time, as: 'submitTime'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Block
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_type, as: 'blockType'
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          collection :paragraphs, as: 'paragraphs', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Paragraph, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Paragraph::Representation
      
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1BoundingPoly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :normalized_vertices, as: 'normalizedVertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1NormalizedVertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1NormalizedVertex::Representation
      
          collection :vertices, as: 'vertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Vertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Vertex::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1ColorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::VisionV1::Color, decorator: Google::Apis::VisionV1::Color::Representation
      
          property :pixel_fraction, as: 'pixelFraction'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p3beta1CropHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :importance_fraction, as: 'importanceFraction'
        end
      end
      
      class GoogleCloudVisionV1p3beta1CropHintsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crop_hints, as: 'cropHints', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1CropHint, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1CropHint::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1DominantColorsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ColorInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ColorInfo::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1EntityAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :description, as: 'description'
          property :locale, as: 'locale'
          collection :locations, as: 'locations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1LocationInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1LocationInfo::Representation
      
          property :mid, as: 'mid'
          collection :properties, as: 'properties', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Property, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Property::Representation
      
          property :score, as: 'score'
          property :topicality, as: 'topicality'
        end
      end
      
      class GoogleCloudVisionV1p3beta1FaceAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anger_likelihood, as: 'angerLikelihood'
          property :blurred_likelihood, as: 'blurredLikelihood'
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :detection_confidence, as: 'detectionConfidence'
          property :fd_bounding_poly, as: 'fdBoundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :headwear_likelihood, as: 'headwearLikelihood'
          property :joy_likelihood, as: 'joyLikelihood'
          property :landmarking_confidence, as: 'landmarkingConfidence'
          collection :landmarks, as: 'landmarks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1FaceAnnotationLandmark, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1FaceAnnotationLandmark::Representation
      
          property :pan_angle, as: 'panAngle'
          property :roll_angle, as: 'rollAngle'
          property :sorrow_likelihood, as: 'sorrowLikelihood'
          property :surprise_likelihood, as: 'surpriseLikelihood'
          property :tilt_angle, as: 'tiltAngle'
          property :under_exposed_likelihood, as: 'underExposedLikelihood'
        end
      end
      
      class GoogleCloudVisionV1p3beta1FaceAnnotationLandmark
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :position, as: 'position', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Position, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Position::Representation
      
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p3beta1GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p3beta1GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p3beta1ImageAnnotationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_number, as: 'pageNumber'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p3beta1ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dominant_colors, as: 'dominantColors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1DominantColorsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1DominantColorsAnnotation::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1ImportProductSetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reference_images, as: 'referenceImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ReferenceImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ReferenceImage::Representation
      
          collection :statuses, as: 'statuses', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1GcsSource, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p3beta1LocationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1NormalizedVertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p3beta1OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudVisionV1p3beta1OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_size, as: 'batchSize'
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1GcsDestination, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1GcsDestination::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocks, as: 'blocks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Block, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Block::Representation
      
          property :confidence, as: 'confidence'
          property :height, as: 'height'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty::Representation
      
          property :width, as: 'width'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty::Representation
      
          collection :words, as: 'words', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Word, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Word::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
          property :z, as: 'z'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :product_category, as: 'productCategory'
          collection :product_labels, as: 'productLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductKeyValue, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductKeyValue::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1ProductKeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_time, as: 'indexTime'
          collection :product_grouped_results, as: 'productGroupedResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          collection :object_annotations, as: 'objectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p3beta1ProductSearchResultsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
          property :product, as: 'product', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Product, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Product::Representation
      
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :uint64_value, :numeric_string => true, as: 'uint64Value'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p3beta1ReferenceImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounding_polys, as: 'boundingPolys', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :name, as: 'name'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p3beta1SafeSearchAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult, as: 'adult'
          property :medical, as: 'medical'
          property :racy, as: 'racy'
          property :spoof, as: 'spoof'
          property :violence, as: 'violence'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Symbol
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pages, as: 'pages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Page, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Page::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_prefix, as: 'isPrefix'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p3beta1TextAnnotationTextProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_break, as: 'detectedBreak', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak::Representation
      
          collection :detected_languages, as: 'detectedLanguages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1Vertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p3beta1WebDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_guess_labels, as: 'bestGuessLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebLabel, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebLabel::Representation
      
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage::Representation
      
          collection :pages_with_matching_images, as: 'pagesWithMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebPage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebPage::Representation
      
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage::Representation
      
          collection :visually_similar_images, as: 'visuallySimilarImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage::Representation
      
          collection :web_entities, as: 'webEntities', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebEntity, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebEntity::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :entity_id, as: 'entityId'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p3beta1WebDetectionWebPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage::Representation
      
          property :page_title, as: 'pageTitle'
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1WebDetectionWebImage::Representation
      
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p3beta1Word
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1TextAnnotationTextProperty::Representation
      
          collection :symbols, as: 'symbols', class: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Symbol, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p3beta1Symbol::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1AnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1InputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1InputConfig::Representation
      
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AnnotateImageResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AnnotateImageResponse::Representation
      
          property :total_pages, as: 'totalPages'
        end
      end
      
      class GoogleCloudVisionV1p4beta1AnnotateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ImageAnnotationContext, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ImageAnnotationContext::Representation
      
          property :crop_hints_annotation, as: 'cropHintsAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1CropHintsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1CropHintsAnnotation::Representation
      
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          collection :face_annotations, as: 'faceAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceAnnotation::Representation
      
          property :full_text_annotation, as: 'fullTextAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotation::Representation
      
          property :image_properties_annotation, as: 'imagePropertiesAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ImageProperties, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ImageProperties::Representation
      
          collection :label_annotations, as: 'labelAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation::Representation
      
          collection :landmark_annotations, as: 'landmarkAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation::Representation
      
          collection :localized_object_annotations, as: 'localizedObjectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation::Representation
      
          collection :logo_annotations, as: 'logoAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation::Representation
      
          property :product_search_results, as: 'productSearchResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResults, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResults::Representation
      
          property :safe_search_annotation, as: 'safeSearchAnnotation', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1SafeSearchAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1SafeSearchAnnotation::Representation
      
          collection :text_annotations, as: 'textAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1EntityAnnotation::Representation
      
          property :web_detection, as: 'webDetection', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetection, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetection::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1OutputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1OutputConfig::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1AsyncBatchAnnotateImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :output_config, as: 'outputConfig', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1OutputConfig, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1OutputConfig::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1BatchAnnotateFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AnnotateFileResponse, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1AnnotateFileResponse::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1BatchOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :state, as: 'state'
          property :submit_time, as: 'submitTime'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Block
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_type, as: 'blockType'
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          collection :paragraphs, as: 'paragraphs', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Paragraph, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Paragraph::Representation
      
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1BoundingPoly
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :normalized_vertices, as: 'normalizedVertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1NormalizedVertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1NormalizedVertex::Representation
      
          collection :vertices, as: 'vertices', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Vertex, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Vertex::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1Celebrity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ColorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::VisionV1::Color, decorator: Google::Apis::VisionV1::Color::Representation
      
          property :pixel_fraction, as: 'pixelFraction'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p4beta1CropHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :importance_fraction, as: 'importanceFraction'
        end
      end
      
      class GoogleCloudVisionV1p4beta1CropHintsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crop_hints, as: 'cropHints', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1CropHint, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1CropHint::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1DominantColorsAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ColorInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ColorInfo::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1EntityAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :description, as: 'description'
          property :locale, as: 'locale'
          collection :locations, as: 'locations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1LocationInfo, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1LocationInfo::Representation
      
          property :mid, as: 'mid'
          collection :properties, as: 'properties', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Property, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Property::Representation
      
          property :score, as: 'score'
          property :topicality, as: 'topicality'
        end
      end
      
      class GoogleCloudVisionV1p4beta1FaceAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anger_likelihood, as: 'angerLikelihood'
          property :blurred_likelihood, as: 'blurredLikelihood'
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :detection_confidence, as: 'detectionConfidence'
          property :fd_bounding_poly, as: 'fdBoundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :headwear_likelihood, as: 'headwearLikelihood'
          property :joy_likelihood, as: 'joyLikelihood'
          property :landmarking_confidence, as: 'landmarkingConfidence'
          collection :landmarks, as: 'landmarks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceAnnotationLandmark, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceAnnotationLandmark::Representation
      
          property :pan_angle, as: 'panAngle'
          collection :recognition_result, as: 'recognitionResult', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceRecognitionResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1FaceRecognitionResult::Representation
      
          property :roll_angle, as: 'rollAngle'
          property :sorrow_likelihood, as: 'sorrowLikelihood'
          property :surprise_likelihood, as: 'surpriseLikelihood'
          property :tilt_angle, as: 'tiltAngle'
          property :under_exposed_likelihood, as: 'underExposedLikelihood'
        end
      end
      
      class GoogleCloudVisionV1p4beta1FaceAnnotationLandmark
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :position, as: 'position', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Position, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Position::Representation
      
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p4beta1FaceRecognitionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :celebrity, as: 'celebrity', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Celebrity, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Celebrity::Representation
      
          property :confidence, as: 'confidence'
        end
      end
      
      class GoogleCloudVisionV1p4beta1GcsDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p4beta1GcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ImageAnnotationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_number, as: 'pageNumber'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dominant_colors, as: 'dominantColors', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1DominantColorsAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1DominantColorsAnnotation::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1ImportProductSetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reference_images, as: 'referenceImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ReferenceImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ReferenceImage::Representation
      
          collection :statuses, as: 'statuses', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1GcsSource, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p4beta1LocationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1NormalizedVertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p4beta1OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudVisionV1p4beta1OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_size, as: 'batchSize'
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1GcsDestination, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1GcsDestination::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocks, as: 'blocks', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Block, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Block::Representation
      
          property :confidence, as: 'confidence'
          property :height, as: 'height'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty::Representation
      
          property :width, as: 'width'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty::Representation
      
          collection :words, as: 'words', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Word, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Word::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
          property :z, as: 'z'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :product_category, as: 'productCategory'
          collection :product_labels, as: 'productLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductKeyValue, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductKeyValue::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1ProductKeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_time, as: 'indexTime'
          collection :product_grouped_results, as: 'productGroupedResults', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          collection :object_annotations, as: 'objectAnnotations', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1ProductSearchResultsResult::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ProductSearchResultsResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
          property :product, as: 'product', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Product, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Product::Representation
      
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :uint64_value, :numeric_string => true, as: 'uint64Value'
          property :value, as: 'value'
        end
      end
      
      class GoogleCloudVisionV1p4beta1ReferenceImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounding_polys, as: 'boundingPolys', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :name, as: 'name'
          property :uri, as: 'uri'
        end
      end
      
      class GoogleCloudVisionV1p4beta1SafeSearchAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult, as: 'adult'
          property :medical, as: 'medical'
          property :racy, as: 'racy'
          property :spoof, as: 'spoof'
          property :violence, as: 'violence'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Symbol
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pages, as: 'pages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Page, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Page::Representation
      
          property :text, as: 'text'
        end
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_prefix, as: 'isPrefix'
          property :type, as: 'type'
        end
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :confidence, as: 'confidence'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p4beta1TextAnnotationTextProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_break, as: 'detectedBreak', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak::Representation
      
          collection :detected_languages, as: 'detectedLanguages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1Vertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class GoogleCloudVisionV1p4beta1WebDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_guess_labels, as: 'bestGuessLabels', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebLabel, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebLabel::Representation
      
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage::Representation
      
          collection :pages_with_matching_images, as: 'pagesWithMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebPage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebPage::Representation
      
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage::Representation
      
          collection :visually_similar_images, as: 'visuallySimilarImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage::Representation
      
          collection :web_entities, as: 'webEntities', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebEntity, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebEntity::Representation
      
        end
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :entity_id, as: 'entityId'
          property :score, as: 'score'
        end
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :language_code, as: 'languageCode'
        end
      end
      
      class GoogleCloudVisionV1p4beta1WebDetectionWebPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage::Representation
      
          property :page_title, as: 'pageTitle'
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1WebDetectionWebImage::Representation
      
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudVisionV1p4beta1Word
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1TextAnnotationTextProperty::Representation
      
          collection :symbols, as: 'symbols', class: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Symbol, decorator: Google::Apis::VisionV1::GoogleCloudVisionV1p4beta1Symbol::Representation
      
        end
      end
      
      class GroupedResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          collection :object_annotations, as: 'objectAnnotations', class: Google::Apis::VisionV1::ObjectAnnotation, decorator: Google::Apis::VisionV1::ObjectAnnotation::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::Result, decorator: Google::Apis::VisionV1::Result::Representation
      
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :source, as: 'source', class: Google::Apis::VisionV1::ImageSource, decorator: Google::Apis::VisionV1::ImageSource::Representation
      
        end
      end
      
      class ImageAnnotationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_number, as: 'pageNumber'
          property :uri, as: 'uri'
        end
      end
      
      class ImageContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :crop_hints_params, as: 'cropHintsParams', class: Google::Apis::VisionV1::CropHintsParams, decorator: Google::Apis::VisionV1::CropHintsParams::Representation
      
          collection :language_hints, as: 'languageHints'
          property :lat_long_rect, as: 'latLongRect', class: Google::Apis::VisionV1::LatLongRect, decorator: Google::Apis::VisionV1::LatLongRect::Representation
      
          property :product_search_params, as: 'productSearchParams', class: Google::Apis::VisionV1::ProductSearchParams, decorator: Google::Apis::VisionV1::ProductSearchParams::Representation
      
          property :web_detection_params, as: 'webDetectionParams', class: Google::Apis::VisionV1::WebDetectionParams, decorator: Google::Apis::VisionV1::WebDetectionParams::Representation
      
        end
      end
      
      class ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dominant_colors, as: 'dominantColors', class: Google::Apis::VisionV1::DominantColorsAnnotation, decorator: Google::Apis::VisionV1::DominantColorsAnnotation::Representation
      
        end
      end
      
      class ImageSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_image_uri, as: 'gcsImageUri'
          property :image_uri, as: 'imageUri'
        end
      end
      
      class ImportProductSetsGcsSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :csv_file_uri, as: 'csvFileUri'
        end
      end
      
      class ImportProductSetsInputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::ImportProductSetsGcsSource, decorator: Google::Apis::VisionV1::ImportProductSetsGcsSource::Representation
      
        end
      end
      
      class ImportProductSetsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :input_config, as: 'inputConfig', class: Google::Apis::VisionV1::ImportProductSetsInputConfig, decorator: Google::Apis::VisionV1::ImportProductSetsInputConfig::Representation
      
        end
      end
      
      class ImportProductSetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reference_images, as: 'referenceImages', class: Google::Apis::VisionV1::ReferenceImage, decorator: Google::Apis::VisionV1::ReferenceImage::Representation
      
          collection :statuses, as: 'statuses', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
        end
      end
      
      class InputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :gcs_source, as: 'gcsSource', class: Google::Apis::VisionV1::GcsSource, decorator: Google::Apis::VisionV1::GcsSource::Representation
      
          property :mime_type, as: 'mimeType'
        end
      end
      
      class KeyValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class Landmark
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :position, as: 'position', class: Google::Apis::VisionV1::Position, decorator: Google::Apis::VisionV1::Position::Representation
      
          property :type, as: 'type'
        end
      end
      
      class LatLng
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class LatLongRect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_lat_lng, as: 'maxLatLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
          property :min_lat_lng, as: 'minLatLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::VisionV1::Operation, decorator: Google::Apis::VisionV1::Operation::Representation
      
        end
      end
      
      class ListProductSetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :product_sets, as: 'productSets', class: Google::Apis::VisionV1::ProductSet, decorator: Google::Apis::VisionV1::ProductSet::Representation
      
        end
      end
      
      class ListProductsInProductSetResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :products, as: 'products', class: Google::Apis::VisionV1::Product, decorator: Google::Apis::VisionV1::Product::Representation
      
        end
      end
      
      class ListProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :products, as: 'products', class: Google::Apis::VisionV1::Product, decorator: Google::Apis::VisionV1::Product::Representation
      
        end
      end
      
      class ListReferenceImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          property :page_size, as: 'pageSize'
          collection :reference_images, as: 'referenceImages', class: Google::Apis::VisionV1::ReferenceImage, decorator: Google::Apis::VisionV1::ReferenceImage::Representation
      
        end
      end
      
      class LocalizedObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class LocationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::VisionV1::LatLng, decorator: Google::Apis::VisionV1::LatLng::Representation
      
        end
      end
      
      class NormalizedVertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class ObjectAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :mid, as: 'mid'
          property :name, as: 'name'
          property :score, as: 'score'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
        end
      end
      
      class OutputConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_size, as: 'batchSize'
          property :gcs_destination, as: 'gcsDestination', class: Google::Apis::VisionV1::GcsDestination, decorator: Google::Apis::VisionV1::GcsDestination::Representation
      
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocks, as: 'blocks', class: Google::Apis::VisionV1::Block, decorator: Google::Apis::VisionV1::Block::Representation
      
          property :confidence, as: 'confidence'
          property :height, as: 'height'
          property :property, as: 'property', class: Google::Apis::VisionV1::TextProperty, decorator: Google::Apis::VisionV1::TextProperty::Representation
      
          property :width, as: 'width'
        end
      end
      
      class Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::TextProperty, decorator: Google::Apis::VisionV1::TextProperty::Representation
      
          collection :words, as: 'words', class: Google::Apis::VisionV1::Word, decorator: Google::Apis::VisionV1::Word::Representation
      
        end
      end
      
      class Position
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
          property :z, as: 'z'
        end
      end
      
      class Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :product_category, as: 'productCategory'
          collection :product_labels, as: 'productLabels', class: Google::Apis::VisionV1::KeyValue, decorator: Google::Apis::VisionV1::KeyValue::Representation
      
        end
      end
      
      class ProductSearchParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_poly, as: 'boundingPoly', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :filter, as: 'filter'
          collection :product_categories, as: 'productCategories'
          property :product_set, as: 'productSet'
        end
      end
      
      class ProductSearchResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index_time, as: 'indexTime'
          collection :product_grouped_results, as: 'productGroupedResults', class: Google::Apis::VisionV1::GroupedResult, decorator: Google::Apis::VisionV1::GroupedResult::Representation
      
          collection :results, as: 'results', class: Google::Apis::VisionV1::Result, decorator: Google::Apis::VisionV1::Result::Representation
      
        end
      end
      
      class ProductSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :index_error, as: 'indexError', class: Google::Apis::VisionV1::Status, decorator: Google::Apis::VisionV1::Status::Representation
      
          property :index_time, as: 'indexTime'
          property :name, as: 'name'
        end
      end
      
      class ProductSetPurgeConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :product_set_id, as: 'productSetId'
        end
      end
      
      class Property
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :uint64_value, :numeric_string => true, as: 'uint64Value'
          property :value, as: 'value'
        end
      end
      
      class PurgeProductsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delete_orphan_products, as: 'deleteOrphanProducts'
          property :force, as: 'force'
          property :product_set_purge_config, as: 'productSetPurgeConfig', class: Google::Apis::VisionV1::ProductSetPurgeConfig, decorator: Google::Apis::VisionV1::ProductSetPurgeConfig::Representation
      
        end
      end
      
      class ReferenceImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bounding_polys, as: 'boundingPolys', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :name, as: 'name'
          property :uri, as: 'uri'
        end
      end
      
      class RemoveProductFromProductSetRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :product, as: 'product'
        end
      end
      
      class Result
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image'
          property :product, as: 'product', class: Google::Apis::VisionV1::Product, decorator: Google::Apis::VisionV1::Product::Representation
      
          property :score, as: 'score'
        end
      end
      
      class SafeSearchAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult, as: 'adult'
          property :medical, as: 'medical'
          property :racy, as: 'racy'
          property :spoof, as: 'spoof'
          property :violence, as: 'violence'
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
      
      class Symbol
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::TextProperty, decorator: Google::Apis::VisionV1::TextProperty::Representation
      
          property :text, as: 'text'
        end
      end
      
      class TextAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pages, as: 'pages', class: Google::Apis::VisionV1::Page, decorator: Google::Apis::VisionV1::Page::Representation
      
          property :text, as: 'text'
        end
      end
      
      class TextProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detected_break, as: 'detectedBreak', class: Google::Apis::VisionV1::DetectedBreak, decorator: Google::Apis::VisionV1::DetectedBreak::Representation
      
          collection :detected_languages, as: 'detectedLanguages', class: Google::Apis::VisionV1::DetectedLanguage, decorator: Google::Apis::VisionV1::DetectedLanguage::Representation
      
        end
      end
      
      class Vertex
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :x, as: 'x'
          property :y, as: 'y'
        end
      end
      
      class WebDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_guess_labels, as: 'bestGuessLabels', class: Google::Apis::VisionV1::WebLabel, decorator: Google::Apis::VisionV1::WebLabel::Representation
      
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::WebImage, decorator: Google::Apis::VisionV1::WebImage::Representation
      
          collection :pages_with_matching_images, as: 'pagesWithMatchingImages', class: Google::Apis::VisionV1::WebPage, decorator: Google::Apis::VisionV1::WebPage::Representation
      
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::WebImage, decorator: Google::Apis::VisionV1::WebImage::Representation
      
          collection :visually_similar_images, as: 'visuallySimilarImages', class: Google::Apis::VisionV1::WebImage, decorator: Google::Apis::VisionV1::WebImage::Representation
      
          collection :web_entities, as: 'webEntities', class: Google::Apis::VisionV1::WebEntity, decorator: Google::Apis::VisionV1::WebEntity::Representation
      
        end
      end
      
      class WebDetectionParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :include_geo_results, as: 'includeGeoResults'
        end
      end
      
      class WebEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :entity_id, as: 'entityId'
          property :score, as: 'score'
        end
      end
      
      class WebImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class WebLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :language_code, as: 'languageCode'
        end
      end
      
      class WebPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :full_matching_images, as: 'fullMatchingImages', class: Google::Apis::VisionV1::WebImage, decorator: Google::Apis::VisionV1::WebImage::Representation
      
          property :page_title, as: 'pageTitle'
          collection :partial_matching_images, as: 'partialMatchingImages', class: Google::Apis::VisionV1::WebImage, decorator: Google::Apis::VisionV1::WebImage::Representation
      
          property :score, as: 'score'
          property :url, as: 'url'
        end
      end
      
      class Word
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bounding_box, as: 'boundingBox', class: Google::Apis::VisionV1::BoundingPoly, decorator: Google::Apis::VisionV1::BoundingPoly::Representation
      
          property :confidence, as: 'confidence'
          property :property, as: 'property', class: Google::Apis::VisionV1::TextProperty, decorator: Google::Apis::VisionV1::TextProperty::Representation
      
          collection :symbols, as: 'symbols', class: Google::Apis::VisionV1::Symbol, decorator: Google::Apis::VisionV1::Symbol::Representation
      
        end
      end
    end
  end
end
