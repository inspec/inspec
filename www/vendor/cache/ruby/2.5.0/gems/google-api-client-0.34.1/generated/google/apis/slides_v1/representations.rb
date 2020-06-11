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
    module SlidesV1
      
      class AffineTransform
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoText
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUpdatePresentationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUpdatePresentationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bullet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ColorScheme
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ColorStop
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateLineRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateLineResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateParagraphBulletsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateShapeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateShapeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSheetsChartRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSheetsChartResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSlideRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSlideResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateTableRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateTableResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVideoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVideoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteObjectRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteParagraphBulletsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteTableColumnRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteTableRowRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DuplicateObjectRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DuplicateObjectResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Group
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupObjectsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupObjectsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTableColumnsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTableRowsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LayoutPlaceholderIdMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LayoutProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LayoutReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Line
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LineConnection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LineFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LineProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Link
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class List
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MasterProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MergeTableCellsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NestingLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NotesProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OpaqueColor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OptionalColor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Outline
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutlineFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageBackgroundFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageElementProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphMarker
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Placeholder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Presentation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Range
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Recolor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RefreshSheetsChartRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllShapesWithImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllShapesWithImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllShapesWithSheetsChartRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllShapesWithSheetsChartResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceAllTextResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplaceImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Request
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RerouteLineRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Response
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RgbColor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Shadow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Shape
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShapeBackgroundFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShapeProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SheetsChart
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SheetsChartProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Size
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SlideProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SolidFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StretchedPictureFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubstringMatchCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableBorderCell
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableBorderFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableBorderProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableBorderRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCell
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellBackgroundFill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableColumnProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableRowProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextContent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TextStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThemeColorPair
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Thumbnail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UngroupObjectsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnmergeTableCellsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateImagePropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateLineCategoryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateLinePropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdatePageElementAltTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdatePageElementTransformRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdatePageElementsZOrderRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdatePagePropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateParagraphStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateShapePropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateSlidesPositionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableBorderPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableCellPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableColumnPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableRowPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTextStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateVideoPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Video
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WeightedFontFamily
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WordArt
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AffineTransform
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :scale_x, as: 'scaleX'
          property :scale_y, as: 'scaleY'
          property :shear_x, as: 'shearX'
          property :shear_y, as: 'shearY'
          property :translate_x, as: 'translateX'
          property :translate_y, as: 'translateY'
          property :unit, as: 'unit'
        end
      end
      
      class AutoText
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :style, as: 'style', class: Google::Apis::SlidesV1::TextStyle, decorator: Google::Apis::SlidesV1::TextStyle::Representation
      
          property :type, as: 'type'
        end
      end
      
      class BatchUpdatePresentationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :requests, as: 'requests', class: Google::Apis::SlidesV1::Request, decorator: Google::Apis::SlidesV1::Request::Representation
      
          property :write_control, as: 'writeControl', class: Google::Apis::SlidesV1::WriteControl, decorator: Google::Apis::SlidesV1::WriteControl::Representation
      
        end
      end
      
      class BatchUpdatePresentationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :presentation_id, as: 'presentationId'
          collection :replies, as: 'replies', class: Google::Apis::SlidesV1::Response, decorator: Google::Apis::SlidesV1::Response::Representation
      
          property :write_control, as: 'writeControl', class: Google::Apis::SlidesV1::WriteControl, decorator: Google::Apis::SlidesV1::WriteControl::Representation
      
        end
      end
      
      class Bullet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_style, as: 'bulletStyle', class: Google::Apis::SlidesV1::TextStyle, decorator: Google::Apis::SlidesV1::TextStyle::Representation
      
          property :glyph, as: 'glyph'
          property :list_id, as: 'listId'
          property :nesting_level, as: 'nestingLevel'
        end
      end
      
      class ColorScheme
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :colors, as: 'colors', class: Google::Apis::SlidesV1::ThemeColorPair, decorator: Google::Apis::SlidesV1::ThemeColorPair::Representation
      
        end
      end
      
      class ColorStop
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alpha, as: 'alpha'
          property :color, as: 'color', class: Google::Apis::SlidesV1::OpaqueColor, decorator: Google::Apis::SlidesV1::OpaqueColor::Representation
      
          property :position, as: 'position'
        end
      end
      
      class CreateImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :object_id_prop, as: 'objectId'
          property :url, as: 'url'
        end
      end
      
      class CreateImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateLineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :line_category, as: 'lineCategory'
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateLineResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateParagraphBulletsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_preset, as: 'bulletPreset'
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :object_id_prop, as: 'objectId'
          property :text_range, as: 'textRange', class: Google::Apis::SlidesV1::Range, decorator: Google::Apis::SlidesV1::Range::Representation
      
        end
      end
      
      class CreateShapeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :object_id_prop, as: 'objectId'
          property :shape_type, as: 'shapeType'
        end
      end
      
      class CreateShapeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateSheetsChartRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_id, as: 'chartId'
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :linking_mode, as: 'linkingMode'
          property :object_id_prop, as: 'objectId'
          property :spreadsheet_id, as: 'spreadsheetId'
        end
      end
      
      class CreateSheetsChartResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateSlideRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :insertion_index, as: 'insertionIndex'
          property :object_id_prop, as: 'objectId'
          collection :placeholder_id_mappings, as: 'placeholderIdMappings', class: Google::Apis::SlidesV1::LayoutPlaceholderIdMapping, decorator: Google::Apis::SlidesV1::LayoutPlaceholderIdMapping::Representation
      
          property :slide_layout_reference, as: 'slideLayoutReference', class: Google::Apis::SlidesV1::LayoutReference, decorator: Google::Apis::SlidesV1::LayoutReference::Representation
      
        end
      end
      
      class CreateSlideResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateTableRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :columns, as: 'columns'
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :object_id_prop, as: 'objectId'
          property :rows, as: 'rows'
        end
      end
      
      class CreateTableResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CreateVideoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :element_properties, as: 'elementProperties', class: Google::Apis::SlidesV1::PageElementProperties, decorator: Google::Apis::SlidesV1::PageElementProperties::Representation
      
          property :id, as: 'id'
          property :object_id_prop, as: 'objectId'
          property :source, as: 'source'
        end
      end
      
      class CreateVideoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class CropProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :angle, as: 'angle'
          property :bottom_offset, as: 'bottomOffset'
          property :left_offset, as: 'leftOffset'
          property :right_offset, as: 'rightOffset'
          property :top_offset, as: 'topOffset'
        end
      end
      
      class DeleteObjectRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class DeleteParagraphBulletsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :object_id_prop, as: 'objectId'
          property :text_range, as: 'textRange', class: Google::Apis::SlidesV1::Range, decorator: Google::Apis::SlidesV1::Range::Representation
      
        end
      end
      
      class DeleteTableColumnRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :table_object_id, as: 'tableObjectId'
        end
      end
      
      class DeleteTableRowRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :table_object_id, as: 'tableObjectId'
        end
      end
      
      class DeleteTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :object_id_prop, as: 'objectId'
          property :text_range, as: 'textRange', class: Google::Apis::SlidesV1::Range, decorator: Google::Apis::SlidesV1::Range::Representation
      
        end
      end
      
      class Dimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :magnitude, as: 'magnitude'
          property :unit, as: 'unit'
        end
      end
      
      class DuplicateObjectRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
          hash :object_ids, as: 'objectIds'
        end
      end
      
      class DuplicateObjectResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class Group
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :children, as: 'children', class: Google::Apis::SlidesV1::PageElement, decorator: Google::Apis::SlidesV1::PageElement::Representation
      
        end
      end
      
      class GroupObjectsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :children_object_ids, as: 'childrenObjectIds'
          property :group_object_id, as: 'groupObjectId'
        end
      end
      
      class GroupObjectsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_url, as: 'contentUrl'
          property :image_properties, as: 'imageProperties', class: Google::Apis::SlidesV1::ImageProperties, decorator: Google::Apis::SlidesV1::ImageProperties::Representation
      
          property :source_url, as: 'sourceUrl'
        end
      end
      
      class ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :brightness, as: 'brightness'
          property :contrast, as: 'contrast'
          property :crop_properties, as: 'cropProperties', class: Google::Apis::SlidesV1::CropProperties, decorator: Google::Apis::SlidesV1::CropProperties::Representation
      
          property :link, as: 'link', class: Google::Apis::SlidesV1::Link, decorator: Google::Apis::SlidesV1::Link::Representation
      
          property :outline, as: 'outline', class: Google::Apis::SlidesV1::Outline, decorator: Google::Apis::SlidesV1::Outline::Representation
      
          property :recolor, as: 'recolor', class: Google::Apis::SlidesV1::Recolor, decorator: Google::Apis::SlidesV1::Recolor::Representation
      
          property :shadow, as: 'shadow', class: Google::Apis::SlidesV1::Shadow, decorator: Google::Apis::SlidesV1::Shadow::Representation
      
          property :transparency, as: 'transparency'
        end
      end
      
      class InsertTableColumnsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :insert_right, as: 'insertRight'
          property :number, as: 'number'
          property :table_object_id, as: 'tableObjectId'
        end
      end
      
      class InsertTableRowsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :insert_below, as: 'insertBelow'
          property :number, as: 'number'
          property :table_object_id, as: 'tableObjectId'
        end
      end
      
      class InsertTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :insertion_index, as: 'insertionIndex'
          property :object_id_prop, as: 'objectId'
          property :text, as: 'text'
        end
      end
      
      class LayoutPlaceholderIdMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout_placeholder, as: 'layoutPlaceholder', class: Google::Apis::SlidesV1::Placeholder, decorator: Google::Apis::SlidesV1::Placeholder::Representation
      
          property :layout_placeholder_object_id, as: 'layoutPlaceholderObjectId'
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class LayoutProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :master_object_id, as: 'masterObjectId'
          property :name, as: 'name'
        end
      end
      
      class LayoutReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout_id, as: 'layoutId'
          property :predefined_layout, as: 'predefinedLayout'
        end
      end
      
      class Line
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_category, as: 'lineCategory'
          property :line_properties, as: 'lineProperties', class: Google::Apis::SlidesV1::LineProperties, decorator: Google::Apis::SlidesV1::LineProperties::Representation
      
          property :line_type, as: 'lineType'
        end
      end
      
      class LineConnection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :connected_object_id, as: 'connectedObjectId'
          property :connection_site_index, as: 'connectionSiteIndex'
        end
      end
      
      class LineFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
        end
      end
      
      class LineProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dash_style, as: 'dashStyle'
          property :end_arrow, as: 'endArrow'
          property :end_connection, as: 'endConnection', class: Google::Apis::SlidesV1::LineConnection, decorator: Google::Apis::SlidesV1::LineConnection::Representation
      
          property :line_fill, as: 'lineFill', class: Google::Apis::SlidesV1::LineFill, decorator: Google::Apis::SlidesV1::LineFill::Representation
      
          property :link, as: 'link', class: Google::Apis::SlidesV1::Link, decorator: Google::Apis::SlidesV1::Link::Representation
      
          property :start_arrow, as: 'startArrow'
          property :start_connection, as: 'startConnection', class: Google::Apis::SlidesV1::LineConnection, decorator: Google::Apis::SlidesV1::LineConnection::Representation
      
          property :weight, as: 'weight', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class Link
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_object_id, as: 'pageObjectId'
          property :relative_link, as: 'relativeLink'
          property :slide_index, as: 'slideIndex'
          property :url, as: 'url'
        end
      end
      
      class List
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_id, as: 'listId'
          hash :nesting_level, as: 'nestingLevel', class: Google::Apis::SlidesV1::NestingLevel, decorator: Google::Apis::SlidesV1::NestingLevel::Representation
      
        end
      end
      
      class MasterProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
        end
      end
      
      class MergeTableCellsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
          property :table_range, as: 'tableRange', class: Google::Apis::SlidesV1::TableRange, decorator: Google::Apis::SlidesV1::TableRange::Representation
      
        end
      end
      
      class NestingLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_style, as: 'bulletStyle', class: Google::Apis::SlidesV1::TextStyle, decorator: Google::Apis::SlidesV1::TextStyle::Representation
      
        end
      end
      
      class NotesProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :speaker_notes_object_id, as: 'speakerNotesObjectId'
        end
      end
      
      class OpaqueColor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rgb_color, as: 'rgbColor', class: Google::Apis::SlidesV1::RgbColor, decorator: Google::Apis::SlidesV1::RgbColor::Representation
      
          property :theme_color, as: 'themeColor'
        end
      end
      
      class OptionalColor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :opaque_color, as: 'opaqueColor', class: Google::Apis::SlidesV1::OpaqueColor, decorator: Google::Apis::SlidesV1::OpaqueColor::Representation
      
        end
      end
      
      class Outline
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dash_style, as: 'dashStyle'
          property :outline_fill, as: 'outlineFill', class: Google::Apis::SlidesV1::OutlineFill, decorator: Google::Apis::SlidesV1::OutlineFill::Representation
      
          property :property_state, as: 'propertyState'
          property :weight, as: 'weight', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class OutlineFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout_properties, as: 'layoutProperties', class: Google::Apis::SlidesV1::LayoutProperties, decorator: Google::Apis::SlidesV1::LayoutProperties::Representation
      
          property :master_properties, as: 'masterProperties', class: Google::Apis::SlidesV1::MasterProperties, decorator: Google::Apis::SlidesV1::MasterProperties::Representation
      
          property :notes_properties, as: 'notesProperties', class: Google::Apis::SlidesV1::NotesProperties, decorator: Google::Apis::SlidesV1::NotesProperties::Representation
      
          property :object_id_prop, as: 'objectId'
          collection :page_elements, as: 'pageElements', class: Google::Apis::SlidesV1::PageElement, decorator: Google::Apis::SlidesV1::PageElement::Representation
      
          property :page_properties, as: 'pageProperties', class: Google::Apis::SlidesV1::PageProperties, decorator: Google::Apis::SlidesV1::PageProperties::Representation
      
          property :page_type, as: 'pageType'
          property :revision_id, as: 'revisionId'
          property :slide_properties, as: 'slideProperties', class: Google::Apis::SlidesV1::SlideProperties, decorator: Google::Apis::SlidesV1::SlideProperties::Representation
      
        end
      end
      
      class PageBackgroundFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :property_state, as: 'propertyState'
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
          property :stretched_picture_fill, as: 'stretchedPictureFill', class: Google::Apis::SlidesV1::StretchedPictureFill, decorator: Google::Apis::SlidesV1::StretchedPictureFill::Representation
      
        end
      end
      
      class PageElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :element_group, as: 'elementGroup', class: Google::Apis::SlidesV1::Group, decorator: Google::Apis::SlidesV1::Group::Representation
      
          property :image, as: 'image', class: Google::Apis::SlidesV1::Image, decorator: Google::Apis::SlidesV1::Image::Representation
      
          property :line, as: 'line', class: Google::Apis::SlidesV1::Line, decorator: Google::Apis::SlidesV1::Line::Representation
      
          property :object_id_prop, as: 'objectId'
          property :shape, as: 'shape', class: Google::Apis::SlidesV1::Shape, decorator: Google::Apis::SlidesV1::Shape::Representation
      
          property :sheets_chart, as: 'sheetsChart', class: Google::Apis::SlidesV1::SheetsChart, decorator: Google::Apis::SlidesV1::SheetsChart::Representation
      
          property :size, as: 'size', class: Google::Apis::SlidesV1::Size, decorator: Google::Apis::SlidesV1::Size::Representation
      
          property :table, as: 'table', class: Google::Apis::SlidesV1::Table, decorator: Google::Apis::SlidesV1::Table::Representation
      
          property :title, as: 'title'
          property :transform, as: 'transform', class: Google::Apis::SlidesV1::AffineTransform, decorator: Google::Apis::SlidesV1::AffineTransform::Representation
      
          property :video, as: 'video', class: Google::Apis::SlidesV1::Video, decorator: Google::Apis::SlidesV1::Video::Representation
      
          property :word_art, as: 'wordArt', class: Google::Apis::SlidesV1::WordArt, decorator: Google::Apis::SlidesV1::WordArt::Representation
      
        end
      end
      
      class PageElementProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_object_id, as: 'pageObjectId'
          property :size, as: 'size', class: Google::Apis::SlidesV1::Size, decorator: Google::Apis::SlidesV1::Size::Representation
      
          property :transform, as: 'transform', class: Google::Apis::SlidesV1::AffineTransform, decorator: Google::Apis::SlidesV1::AffineTransform::Representation
      
        end
      end
      
      class PageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color_scheme, as: 'colorScheme', class: Google::Apis::SlidesV1::ColorScheme, decorator: Google::Apis::SlidesV1::ColorScheme::Representation
      
          property :page_background_fill, as: 'pageBackgroundFill', class: Google::Apis::SlidesV1::PageBackgroundFill, decorator: Google::Apis::SlidesV1::PageBackgroundFill::Representation
      
        end
      end
      
      class ParagraphMarker
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet, as: 'bullet', class: Google::Apis::SlidesV1::Bullet, decorator: Google::Apis::SlidesV1::Bullet::Representation
      
          property :style, as: 'style', class: Google::Apis::SlidesV1::ParagraphStyle, decorator: Google::Apis::SlidesV1::ParagraphStyle::Representation
      
        end
      end
      
      class ParagraphStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alignment, as: 'alignment'
          property :direction, as: 'direction'
          property :indent_end, as: 'indentEnd', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :indent_first_line, as: 'indentFirstLine', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :indent_start, as: 'indentStart', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :line_spacing, as: 'lineSpacing'
          property :space_above, as: 'spaceAbove', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :space_below, as: 'spaceBelow', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :spacing_mode, as: 'spacingMode'
        end
      end
      
      class Placeholder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index, as: 'index'
          property :parent_object_id, as: 'parentObjectId'
          property :type, as: 'type'
        end
      end
      
      class Presentation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :layouts, as: 'layouts', class: Google::Apis::SlidesV1::Page, decorator: Google::Apis::SlidesV1::Page::Representation
      
          property :locale, as: 'locale'
          collection :masters, as: 'masters', class: Google::Apis::SlidesV1::Page, decorator: Google::Apis::SlidesV1::Page::Representation
      
          property :notes_master, as: 'notesMaster', class: Google::Apis::SlidesV1::Page, decorator: Google::Apis::SlidesV1::Page::Representation
      
          property :page_size, as: 'pageSize', class: Google::Apis::SlidesV1::Size, decorator: Google::Apis::SlidesV1::Size::Representation
      
          property :presentation_id, as: 'presentationId'
          property :revision_id, as: 'revisionId'
          collection :slides, as: 'slides', class: Google::Apis::SlidesV1::Page, decorator: Google::Apis::SlidesV1::Page::Representation
      
          property :title, as: 'title'
        end
      end
      
      class Range
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_index, as: 'endIndex'
          property :start_index, as: 'startIndex'
          property :type, as: 'type'
        end
      end
      
      class Recolor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :recolor_stops, as: 'recolorStops', class: Google::Apis::SlidesV1::ColorStop, decorator: Google::Apis::SlidesV1::ColorStop::Representation
      
        end
      end
      
      class RefreshSheetsChartRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class ReplaceAllShapesWithImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contains_text, as: 'containsText', class: Google::Apis::SlidesV1::SubstringMatchCriteria, decorator: Google::Apis::SlidesV1::SubstringMatchCriteria::Representation
      
          property :image_replace_method, as: 'imageReplaceMethod'
          property :image_url, as: 'imageUrl'
          collection :page_object_ids, as: 'pageObjectIds'
          property :replace_method, as: 'replaceMethod'
        end
      end
      
      class ReplaceAllShapesWithImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :occurrences_changed, as: 'occurrencesChanged'
        end
      end
      
      class ReplaceAllShapesWithSheetsChartRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_id, as: 'chartId'
          property :contains_text, as: 'containsText', class: Google::Apis::SlidesV1::SubstringMatchCriteria, decorator: Google::Apis::SlidesV1::SubstringMatchCriteria::Representation
      
          property :linking_mode, as: 'linkingMode'
          collection :page_object_ids, as: 'pageObjectIds'
          property :spreadsheet_id, as: 'spreadsheetId'
        end
      end
      
      class ReplaceAllShapesWithSheetsChartResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :occurrences_changed, as: 'occurrencesChanged'
        end
      end
      
      class ReplaceAllTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contains_text, as: 'containsText', class: Google::Apis::SlidesV1::SubstringMatchCriteria, decorator: Google::Apis::SlidesV1::SubstringMatchCriteria::Representation
      
          collection :page_object_ids, as: 'pageObjectIds'
          property :replace_text, as: 'replaceText'
        end
      end
      
      class ReplaceAllTextResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :occurrences_changed, as: 'occurrencesChanged'
        end
      end
      
      class ReplaceImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_object_id, as: 'imageObjectId'
          property :image_replace_method, as: 'imageReplaceMethod'
          property :url, as: 'url'
        end
      end
      
      class Request
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_image, as: 'createImage', class: Google::Apis::SlidesV1::CreateImageRequest, decorator: Google::Apis::SlidesV1::CreateImageRequest::Representation
      
          property :create_line, as: 'createLine', class: Google::Apis::SlidesV1::CreateLineRequest, decorator: Google::Apis::SlidesV1::CreateLineRequest::Representation
      
          property :create_paragraph_bullets, as: 'createParagraphBullets', class: Google::Apis::SlidesV1::CreateParagraphBulletsRequest, decorator: Google::Apis::SlidesV1::CreateParagraphBulletsRequest::Representation
      
          property :create_shape, as: 'createShape', class: Google::Apis::SlidesV1::CreateShapeRequest, decorator: Google::Apis::SlidesV1::CreateShapeRequest::Representation
      
          property :create_sheets_chart, as: 'createSheetsChart', class: Google::Apis::SlidesV1::CreateSheetsChartRequest, decorator: Google::Apis::SlidesV1::CreateSheetsChartRequest::Representation
      
          property :create_slide, as: 'createSlide', class: Google::Apis::SlidesV1::CreateSlideRequest, decorator: Google::Apis::SlidesV1::CreateSlideRequest::Representation
      
          property :create_table, as: 'createTable', class: Google::Apis::SlidesV1::CreateTableRequest, decorator: Google::Apis::SlidesV1::CreateTableRequest::Representation
      
          property :create_video, as: 'createVideo', class: Google::Apis::SlidesV1::CreateVideoRequest, decorator: Google::Apis::SlidesV1::CreateVideoRequest::Representation
      
          property :delete_object, as: 'deleteObject', class: Google::Apis::SlidesV1::DeleteObjectRequest, decorator: Google::Apis::SlidesV1::DeleteObjectRequest::Representation
      
          property :delete_paragraph_bullets, as: 'deleteParagraphBullets', class: Google::Apis::SlidesV1::DeleteParagraphBulletsRequest, decorator: Google::Apis::SlidesV1::DeleteParagraphBulletsRequest::Representation
      
          property :delete_table_column, as: 'deleteTableColumn', class: Google::Apis::SlidesV1::DeleteTableColumnRequest, decorator: Google::Apis::SlidesV1::DeleteTableColumnRequest::Representation
      
          property :delete_table_row, as: 'deleteTableRow', class: Google::Apis::SlidesV1::DeleteTableRowRequest, decorator: Google::Apis::SlidesV1::DeleteTableRowRequest::Representation
      
          property :delete_text, as: 'deleteText', class: Google::Apis::SlidesV1::DeleteTextRequest, decorator: Google::Apis::SlidesV1::DeleteTextRequest::Representation
      
          property :duplicate_object, as: 'duplicateObject', class: Google::Apis::SlidesV1::DuplicateObjectRequest, decorator: Google::Apis::SlidesV1::DuplicateObjectRequest::Representation
      
          property :group_objects, as: 'groupObjects', class: Google::Apis::SlidesV1::GroupObjectsRequest, decorator: Google::Apis::SlidesV1::GroupObjectsRequest::Representation
      
          property :insert_table_columns, as: 'insertTableColumns', class: Google::Apis::SlidesV1::InsertTableColumnsRequest, decorator: Google::Apis::SlidesV1::InsertTableColumnsRequest::Representation
      
          property :insert_table_rows, as: 'insertTableRows', class: Google::Apis::SlidesV1::InsertTableRowsRequest, decorator: Google::Apis::SlidesV1::InsertTableRowsRequest::Representation
      
          property :insert_text, as: 'insertText', class: Google::Apis::SlidesV1::InsertTextRequest, decorator: Google::Apis::SlidesV1::InsertTextRequest::Representation
      
          property :merge_table_cells, as: 'mergeTableCells', class: Google::Apis::SlidesV1::MergeTableCellsRequest, decorator: Google::Apis::SlidesV1::MergeTableCellsRequest::Representation
      
          property :refresh_sheets_chart, as: 'refreshSheetsChart', class: Google::Apis::SlidesV1::RefreshSheetsChartRequest, decorator: Google::Apis::SlidesV1::RefreshSheetsChartRequest::Representation
      
          property :replace_all_shapes_with_image, as: 'replaceAllShapesWithImage', class: Google::Apis::SlidesV1::ReplaceAllShapesWithImageRequest, decorator: Google::Apis::SlidesV1::ReplaceAllShapesWithImageRequest::Representation
      
          property :replace_all_shapes_with_sheets_chart, as: 'replaceAllShapesWithSheetsChart', class: Google::Apis::SlidesV1::ReplaceAllShapesWithSheetsChartRequest, decorator: Google::Apis::SlidesV1::ReplaceAllShapesWithSheetsChartRequest::Representation
      
          property :replace_all_text, as: 'replaceAllText', class: Google::Apis::SlidesV1::ReplaceAllTextRequest, decorator: Google::Apis::SlidesV1::ReplaceAllTextRequest::Representation
      
          property :replace_image, as: 'replaceImage', class: Google::Apis::SlidesV1::ReplaceImageRequest, decorator: Google::Apis::SlidesV1::ReplaceImageRequest::Representation
      
          property :reroute_line, as: 'rerouteLine', class: Google::Apis::SlidesV1::RerouteLineRequest, decorator: Google::Apis::SlidesV1::RerouteLineRequest::Representation
      
          property :ungroup_objects, as: 'ungroupObjects', class: Google::Apis::SlidesV1::UngroupObjectsRequest, decorator: Google::Apis::SlidesV1::UngroupObjectsRequest::Representation
      
          property :unmerge_table_cells, as: 'unmergeTableCells', class: Google::Apis::SlidesV1::UnmergeTableCellsRequest, decorator: Google::Apis::SlidesV1::UnmergeTableCellsRequest::Representation
      
          property :update_image_properties, as: 'updateImageProperties', class: Google::Apis::SlidesV1::UpdateImagePropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateImagePropertiesRequest::Representation
      
          property :update_line_category, as: 'updateLineCategory', class: Google::Apis::SlidesV1::UpdateLineCategoryRequest, decorator: Google::Apis::SlidesV1::UpdateLineCategoryRequest::Representation
      
          property :update_line_properties, as: 'updateLineProperties', class: Google::Apis::SlidesV1::UpdateLinePropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateLinePropertiesRequest::Representation
      
          property :update_page_element_alt_text, as: 'updatePageElementAltText', class: Google::Apis::SlidesV1::UpdatePageElementAltTextRequest, decorator: Google::Apis::SlidesV1::UpdatePageElementAltTextRequest::Representation
      
          property :update_page_element_transform, as: 'updatePageElementTransform', class: Google::Apis::SlidesV1::UpdatePageElementTransformRequest, decorator: Google::Apis::SlidesV1::UpdatePageElementTransformRequest::Representation
      
          property :update_page_elements_z_order, as: 'updatePageElementsZOrder', class: Google::Apis::SlidesV1::UpdatePageElementsZOrderRequest, decorator: Google::Apis::SlidesV1::UpdatePageElementsZOrderRequest::Representation
      
          property :update_page_properties, as: 'updatePageProperties', class: Google::Apis::SlidesV1::UpdatePagePropertiesRequest, decorator: Google::Apis::SlidesV1::UpdatePagePropertiesRequest::Representation
      
          property :update_paragraph_style, as: 'updateParagraphStyle', class: Google::Apis::SlidesV1::UpdateParagraphStyleRequest, decorator: Google::Apis::SlidesV1::UpdateParagraphStyleRequest::Representation
      
          property :update_shape_properties, as: 'updateShapeProperties', class: Google::Apis::SlidesV1::UpdateShapePropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateShapePropertiesRequest::Representation
      
          property :update_slides_position, as: 'updateSlidesPosition', class: Google::Apis::SlidesV1::UpdateSlidesPositionRequest, decorator: Google::Apis::SlidesV1::UpdateSlidesPositionRequest::Representation
      
          property :update_table_border_properties, as: 'updateTableBorderProperties', class: Google::Apis::SlidesV1::UpdateTableBorderPropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateTableBorderPropertiesRequest::Representation
      
          property :update_table_cell_properties, as: 'updateTableCellProperties', class: Google::Apis::SlidesV1::UpdateTableCellPropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateTableCellPropertiesRequest::Representation
      
          property :update_table_column_properties, as: 'updateTableColumnProperties', class: Google::Apis::SlidesV1::UpdateTableColumnPropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateTableColumnPropertiesRequest::Representation
      
          property :update_table_row_properties, as: 'updateTableRowProperties', class: Google::Apis::SlidesV1::UpdateTableRowPropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateTableRowPropertiesRequest::Representation
      
          property :update_text_style, as: 'updateTextStyle', class: Google::Apis::SlidesV1::UpdateTextStyleRequest, decorator: Google::Apis::SlidesV1::UpdateTextStyleRequest::Representation
      
          property :update_video_properties, as: 'updateVideoProperties', class: Google::Apis::SlidesV1::UpdateVideoPropertiesRequest, decorator: Google::Apis::SlidesV1::UpdateVideoPropertiesRequest::Representation
      
        end
      end
      
      class RerouteLineRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class Response
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_image, as: 'createImage', class: Google::Apis::SlidesV1::CreateImageResponse, decorator: Google::Apis::SlidesV1::CreateImageResponse::Representation
      
          property :create_line, as: 'createLine', class: Google::Apis::SlidesV1::CreateLineResponse, decorator: Google::Apis::SlidesV1::CreateLineResponse::Representation
      
          property :create_shape, as: 'createShape', class: Google::Apis::SlidesV1::CreateShapeResponse, decorator: Google::Apis::SlidesV1::CreateShapeResponse::Representation
      
          property :create_sheets_chart, as: 'createSheetsChart', class: Google::Apis::SlidesV1::CreateSheetsChartResponse, decorator: Google::Apis::SlidesV1::CreateSheetsChartResponse::Representation
      
          property :create_slide, as: 'createSlide', class: Google::Apis::SlidesV1::CreateSlideResponse, decorator: Google::Apis::SlidesV1::CreateSlideResponse::Representation
      
          property :create_table, as: 'createTable', class: Google::Apis::SlidesV1::CreateTableResponse, decorator: Google::Apis::SlidesV1::CreateTableResponse::Representation
      
          property :create_video, as: 'createVideo', class: Google::Apis::SlidesV1::CreateVideoResponse, decorator: Google::Apis::SlidesV1::CreateVideoResponse::Representation
      
          property :duplicate_object, as: 'duplicateObject', class: Google::Apis::SlidesV1::DuplicateObjectResponse, decorator: Google::Apis::SlidesV1::DuplicateObjectResponse::Representation
      
          property :group_objects, as: 'groupObjects', class: Google::Apis::SlidesV1::GroupObjectsResponse, decorator: Google::Apis::SlidesV1::GroupObjectsResponse::Representation
      
          property :replace_all_shapes_with_image, as: 'replaceAllShapesWithImage', class: Google::Apis::SlidesV1::ReplaceAllShapesWithImageResponse, decorator: Google::Apis::SlidesV1::ReplaceAllShapesWithImageResponse::Representation
      
          property :replace_all_shapes_with_sheets_chart, as: 'replaceAllShapesWithSheetsChart', class: Google::Apis::SlidesV1::ReplaceAllShapesWithSheetsChartResponse, decorator: Google::Apis::SlidesV1::ReplaceAllShapesWithSheetsChartResponse::Representation
      
          property :replace_all_text, as: 'replaceAllText', class: Google::Apis::SlidesV1::ReplaceAllTextResponse, decorator: Google::Apis::SlidesV1::ReplaceAllTextResponse::Representation
      
        end
      end
      
      class RgbColor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blue, as: 'blue'
          property :green, as: 'green'
          property :red, as: 'red'
        end
      end
      
      class Shadow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alignment, as: 'alignment'
          property :alpha, as: 'alpha'
          property :blur_radius, as: 'blurRadius', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :color, as: 'color', class: Google::Apis::SlidesV1::OpaqueColor, decorator: Google::Apis::SlidesV1::OpaqueColor::Representation
      
          property :property_state, as: 'propertyState'
          property :rotate_with_shape, as: 'rotateWithShape'
          property :transform, as: 'transform', class: Google::Apis::SlidesV1::AffineTransform, decorator: Google::Apis::SlidesV1::AffineTransform::Representation
      
          property :type, as: 'type'
        end
      end
      
      class Shape
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :placeholder, as: 'placeholder', class: Google::Apis::SlidesV1::Placeholder, decorator: Google::Apis::SlidesV1::Placeholder::Representation
      
          property :shape_properties, as: 'shapeProperties', class: Google::Apis::SlidesV1::ShapeProperties, decorator: Google::Apis::SlidesV1::ShapeProperties::Representation
      
          property :shape_type, as: 'shapeType'
          property :text, as: 'text', class: Google::Apis::SlidesV1::TextContent, decorator: Google::Apis::SlidesV1::TextContent::Representation
      
        end
      end
      
      class ShapeBackgroundFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :property_state, as: 'propertyState'
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
        end
      end
      
      class ShapeProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_alignment, as: 'contentAlignment'
          property :link, as: 'link', class: Google::Apis::SlidesV1::Link, decorator: Google::Apis::SlidesV1::Link::Representation
      
          property :outline, as: 'outline', class: Google::Apis::SlidesV1::Outline, decorator: Google::Apis::SlidesV1::Outline::Representation
      
          property :shadow, as: 'shadow', class: Google::Apis::SlidesV1::Shadow, decorator: Google::Apis::SlidesV1::Shadow::Representation
      
          property :shape_background_fill, as: 'shapeBackgroundFill', class: Google::Apis::SlidesV1::ShapeBackgroundFill, decorator: Google::Apis::SlidesV1::ShapeBackgroundFill::Representation
      
        end
      end
      
      class SheetsChart
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_id, as: 'chartId'
          property :content_url, as: 'contentUrl'
          property :sheets_chart_properties, as: 'sheetsChartProperties', class: Google::Apis::SlidesV1::SheetsChartProperties, decorator: Google::Apis::SlidesV1::SheetsChartProperties::Representation
      
          property :spreadsheet_id, as: 'spreadsheetId'
        end
      end
      
      class SheetsChartProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_image_properties, as: 'chartImageProperties', class: Google::Apis::SlidesV1::ImageProperties, decorator: Google::Apis::SlidesV1::ImageProperties::Representation
      
        end
      end
      
      class Size
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :width, as: 'width', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class SlideProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout_object_id, as: 'layoutObjectId'
          property :master_object_id, as: 'masterObjectId'
          property :notes_page, as: 'notesPage', class: Google::Apis::SlidesV1::Page, decorator: Google::Apis::SlidesV1::Page::Representation
      
        end
      end
      
      class SolidFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alpha, as: 'alpha'
          property :color, as: 'color', class: Google::Apis::SlidesV1::OpaqueColor, decorator: Google::Apis::SlidesV1::OpaqueColor::Representation
      
        end
      end
      
      class StretchedPictureFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_url, as: 'contentUrl'
          property :size, as: 'size', class: Google::Apis::SlidesV1::Size, decorator: Google::Apis::SlidesV1::Size::Representation
      
        end
      end
      
      class SubstringMatchCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :match_case, as: 'matchCase'
          property :text, as: 'text'
        end
      end
      
      class Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :columns, as: 'columns'
          collection :horizontal_border_rows, as: 'horizontalBorderRows', class: Google::Apis::SlidesV1::TableBorderRow, decorator: Google::Apis::SlidesV1::TableBorderRow::Representation
      
          property :rows, as: 'rows'
          collection :table_columns, as: 'tableColumns', class: Google::Apis::SlidesV1::TableColumnProperties, decorator: Google::Apis::SlidesV1::TableColumnProperties::Representation
      
          collection :table_rows, as: 'tableRows', class: Google::Apis::SlidesV1::TableRow, decorator: Google::Apis::SlidesV1::TableRow::Representation
      
          collection :vertical_border_rows, as: 'verticalBorderRows', class: Google::Apis::SlidesV1::TableBorderRow, decorator: Google::Apis::SlidesV1::TableBorderRow::Representation
      
        end
      end
      
      class TableBorderCell
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :table_border_properties, as: 'tableBorderProperties', class: Google::Apis::SlidesV1::TableBorderProperties, decorator: Google::Apis::SlidesV1::TableBorderProperties::Representation
      
        end
      end
      
      class TableBorderFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
        end
      end
      
      class TableBorderProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dash_style, as: 'dashStyle'
          property :table_border_fill, as: 'tableBorderFill', class: Google::Apis::SlidesV1::TableBorderFill, decorator: Google::Apis::SlidesV1::TableBorderFill::Representation
      
          property :weight, as: 'weight', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class TableBorderRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :table_border_cells, as: 'tableBorderCells', class: Google::Apis::SlidesV1::TableBorderCell, decorator: Google::Apis::SlidesV1::TableBorderCell::Representation
      
        end
      end
      
      class TableCell
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_span, as: 'columnSpan'
          property :location, as: 'location', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :row_span, as: 'rowSpan'
          property :table_cell_properties, as: 'tableCellProperties', class: Google::Apis::SlidesV1::TableCellProperties, decorator: Google::Apis::SlidesV1::TableCellProperties::Representation
      
          property :text, as: 'text', class: Google::Apis::SlidesV1::TextContent, decorator: Google::Apis::SlidesV1::TextContent::Representation
      
        end
      end
      
      class TableCellBackgroundFill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :property_state, as: 'propertyState'
          property :solid_fill, as: 'solidFill', class: Google::Apis::SlidesV1::SolidFill, decorator: Google::Apis::SlidesV1::SolidFill::Representation
      
        end
      end
      
      class TableCellLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_index, as: 'columnIndex'
          property :row_index, as: 'rowIndex'
        end
      end
      
      class TableCellProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_alignment, as: 'contentAlignment'
          property :table_cell_background_fill, as: 'tableCellBackgroundFill', class: Google::Apis::SlidesV1::TableCellBackgroundFill, decorator: Google::Apis::SlidesV1::TableCellBackgroundFill::Representation
      
        end
      end
      
      class TableColumnProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_width, as: 'columnWidth', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class TableRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_span, as: 'columnSpan'
          property :location, as: 'location', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :row_span, as: 'rowSpan'
        end
      end
      
      class TableRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :row_height, as: 'rowHeight', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          collection :table_cells, as: 'tableCells', class: Google::Apis::SlidesV1::TableCell, decorator: Google::Apis::SlidesV1::TableCell::Representation
      
          property :table_row_properties, as: 'tableRowProperties', class: Google::Apis::SlidesV1::TableRowProperties, decorator: Google::Apis::SlidesV1::TableRowProperties::Representation
      
        end
      end
      
      class TableRowProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_row_height, as: 'minRowHeight', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
        end
      end
      
      class TextContent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :lists, as: 'lists', class: Google::Apis::SlidesV1::List, decorator: Google::Apis::SlidesV1::List::Representation
      
          collection :text_elements, as: 'textElements', class: Google::Apis::SlidesV1::TextElement, decorator: Google::Apis::SlidesV1::TextElement::Representation
      
        end
      end
      
      class TextElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_text, as: 'autoText', class: Google::Apis::SlidesV1::AutoText, decorator: Google::Apis::SlidesV1::AutoText::Representation
      
          property :end_index, as: 'endIndex'
          property :paragraph_marker, as: 'paragraphMarker', class: Google::Apis::SlidesV1::ParagraphMarker, decorator: Google::Apis::SlidesV1::ParagraphMarker::Representation
      
          property :start_index, as: 'startIndex'
          property :text_run, as: 'textRun', class: Google::Apis::SlidesV1::TextRun, decorator: Google::Apis::SlidesV1::TextRun::Representation
      
        end
      end
      
      class TextRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :style, as: 'style', class: Google::Apis::SlidesV1::TextStyle, decorator: Google::Apis::SlidesV1::TextStyle::Representation
      
        end
      end
      
      class TextStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor', class: Google::Apis::SlidesV1::OptionalColor, decorator: Google::Apis::SlidesV1::OptionalColor::Representation
      
          property :baseline_offset, as: 'baselineOffset'
          property :bold, as: 'bold'
          property :font_family, as: 'fontFamily'
          property :font_size, as: 'fontSize', class: Google::Apis::SlidesV1::Dimension, decorator: Google::Apis::SlidesV1::Dimension::Representation
      
          property :foreground_color, as: 'foregroundColor', class: Google::Apis::SlidesV1::OptionalColor, decorator: Google::Apis::SlidesV1::OptionalColor::Representation
      
          property :italic, as: 'italic'
          property :link, as: 'link', class: Google::Apis::SlidesV1::Link, decorator: Google::Apis::SlidesV1::Link::Representation
      
          property :small_caps, as: 'smallCaps'
          property :strikethrough, as: 'strikethrough'
          property :underline, as: 'underline'
          property :weighted_font_family, as: 'weightedFontFamily', class: Google::Apis::SlidesV1::WeightedFontFamily, decorator: Google::Apis::SlidesV1::WeightedFontFamily::Representation
      
        end
      end
      
      class ThemeColorPair
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::SlidesV1::RgbColor, decorator: Google::Apis::SlidesV1::RgbColor::Representation
      
          property :type, as: 'type'
        end
      end
      
      class Thumbnail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_url, as: 'contentUrl'
          property :height, as: 'height'
          property :width, as: 'width'
        end
      end
      
      class UngroupObjectsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :object_ids, as: 'objectIds'
        end
      end
      
      class UnmergeTableCellsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
          property :table_range, as: 'tableRange', class: Google::Apis::SlidesV1::TableRange, decorator: Google::Apis::SlidesV1::TableRange::Representation
      
        end
      end
      
      class UpdateImagePropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :image_properties, as: 'imageProperties', class: Google::Apis::SlidesV1::ImageProperties, decorator: Google::Apis::SlidesV1::ImageProperties::Representation
      
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class UpdateLineCategoryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_category, as: 'lineCategory'
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class UpdateLinePropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :line_properties, as: 'lineProperties', class: Google::Apis::SlidesV1::LineProperties, decorator: Google::Apis::SlidesV1::LineProperties::Representation
      
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class UpdatePageElementAltTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :object_id_prop, as: 'objectId'
          property :title, as: 'title'
        end
      end
      
      class UpdatePageElementTransformRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :apply_mode, as: 'applyMode'
          property :object_id_prop, as: 'objectId'
          property :transform, as: 'transform', class: Google::Apis::SlidesV1::AffineTransform, decorator: Google::Apis::SlidesV1::AffineTransform::Representation
      
        end
      end
      
      class UpdatePageElementsZOrderRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation, as: 'operation'
          collection :page_element_object_ids, as: 'pageElementObjectIds'
        end
      end
      
      class UpdatePagePropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :page_properties, as: 'pageProperties', class: Google::Apis::SlidesV1::PageProperties, decorator: Google::Apis::SlidesV1::PageProperties::Representation
      
        end
      end
      
      class UpdateParagraphStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :style, as: 'style', class: Google::Apis::SlidesV1::ParagraphStyle, decorator: Google::Apis::SlidesV1::ParagraphStyle::Representation
      
          property :text_range, as: 'textRange', class: Google::Apis::SlidesV1::Range, decorator: Google::Apis::SlidesV1::Range::Representation
      
        end
      end
      
      class UpdateShapePropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :shape_properties, as: 'shapeProperties', class: Google::Apis::SlidesV1::ShapeProperties, decorator: Google::Apis::SlidesV1::ShapeProperties::Representation
      
        end
      end
      
      class UpdateSlidesPositionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :insertion_index, as: 'insertionIndex'
          collection :slide_object_ids, as: 'slideObjectIds'
        end
      end
      
      class UpdateTableBorderPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :border_position, as: 'borderPosition'
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :table_border_properties, as: 'tableBorderProperties', class: Google::Apis::SlidesV1::TableBorderProperties, decorator: Google::Apis::SlidesV1::TableBorderProperties::Representation
      
          property :table_range, as: 'tableRange', class: Google::Apis::SlidesV1::TableRange, decorator: Google::Apis::SlidesV1::TableRange::Representation
      
        end
      end
      
      class UpdateTableCellPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :table_cell_properties, as: 'tableCellProperties', class: Google::Apis::SlidesV1::TableCellProperties, decorator: Google::Apis::SlidesV1::TableCellProperties::Representation
      
          property :table_range, as: 'tableRange', class: Google::Apis::SlidesV1::TableRange, decorator: Google::Apis::SlidesV1::TableRange::Representation
      
        end
      end
      
      class UpdateTableColumnPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_indices, as: 'columnIndices'
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :table_column_properties, as: 'tableColumnProperties', class: Google::Apis::SlidesV1::TableColumnProperties, decorator: Google::Apis::SlidesV1::TableColumnProperties::Representation
      
        end
      end
      
      class UpdateTableRowPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          collection :row_indices, as: 'rowIndices'
          property :table_row_properties, as: 'tableRowProperties', class: Google::Apis::SlidesV1::TableRowProperties, decorator: Google::Apis::SlidesV1::TableRowProperties::Representation
      
        end
      end
      
      class UpdateTextStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cell_location, as: 'cellLocation', class: Google::Apis::SlidesV1::TableCellLocation, decorator: Google::Apis::SlidesV1::TableCellLocation::Representation
      
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :style, as: 'style', class: Google::Apis::SlidesV1::TextStyle, decorator: Google::Apis::SlidesV1::TextStyle::Representation
      
          property :text_range, as: 'textRange', class: Google::Apis::SlidesV1::Range, decorator: Google::Apis::SlidesV1::Range::Representation
      
        end
      end
      
      class UpdateVideoPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :object_id_prop, as: 'objectId'
          property :video_properties, as: 'videoProperties', class: Google::Apis::SlidesV1::VideoProperties, decorator: Google::Apis::SlidesV1::VideoProperties::Representation
      
        end
      end
      
      class Video
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :source, as: 'source'
          property :url, as: 'url'
          property :video_properties, as: 'videoProperties', class: Google::Apis::SlidesV1::VideoProperties, decorator: Google::Apis::SlidesV1::VideoProperties::Representation
      
        end
      end
      
      class VideoProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_play, as: 'autoPlay'
          property :end, as: 'end'
          property :mute, as: 'mute'
          property :outline, as: 'outline', class: Google::Apis::SlidesV1::Outline, decorator: Google::Apis::SlidesV1::Outline::Representation
      
          property :start, as: 'start'
        end
      end
      
      class WeightedFontFamily
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :font_family, as: 'fontFamily'
          property :weight, as: 'weight'
        end
      end
      
      class WordArt
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rendered_text, as: 'renderedText'
        end
      end
      
      class WriteControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :required_revision_id, as: 'requiredRevisionId'
        end
      end
    end
  end
end
