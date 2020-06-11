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
    module DocsV1
      
      class AutoText
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Background
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackgroundSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUpdateDocumentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUpdateDocumentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Body
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bullet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BulletSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Color
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ColumnBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateFooterRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateFooterResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateHeaderRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateHeaderResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateNamedRangeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateNamedRangeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateParagraphBulletsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CropPropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteContentRangeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteNamedRangeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteParagraphBulletsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeletePositionedObjectRequest
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
      
      class Dimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Document
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DocumentStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DocumentStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedDrawingProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedDrawingPropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedObject
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedObjectBorder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedObjectBorderSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmbeddedObjectSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EndOfSegmentLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Equation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Footer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Footnote
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FootnoteReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Header
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HorizontalRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImagePropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InlineObject
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InlineObjectElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InlineObjectProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InlineObjectPropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertInlineImageRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertInlineImageResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertInlineSheetsChartResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertPageBreakRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTableColumnRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTableRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTableRowRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertTextRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Link
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LinkedContentReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LinkedContentReferenceSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class List
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MergeTableCellsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedRanges
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedStyles
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedStylesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NestingLevel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NestingLevelSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectReferences
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OptionalColor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Paragraph
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphBorder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ParagraphStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PositionedObject
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PositionedObjectPositioning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PositionedObjectPositioningSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PositionedObjectProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PositionedObjectPropertiesSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Range
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
      
      class ReplaceNamedRangeContentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Request
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
      
      class SectionBreak
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SectionColumnProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SectionStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Shading
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShadingSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SheetsChartReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SheetsChartReferenceSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Size
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SizeSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StructuralElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubstringMatchCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedBullet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedDocumentStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedInlineObjectProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedListProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedNamedStyles
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedParagraphStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedPositionedObjectProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedTableCellStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedTableRowStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuggestedTextStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TabStop
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCell
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellBorder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableCellStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableColumnProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableOfContents
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
      
      class TableRowStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableRowStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableStyle
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
      
      class TextStyleSuggestionState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnmergeTableCellsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDocumentStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateParagraphStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableCellStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableColumnPropertiesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTableRowStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateTextStyleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WeightedFontFamily
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoText
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
          property :type, as: 'type'
        end
      end
      
      class Background
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
        end
      end
      
      class BackgroundSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color_suggested, as: 'backgroundColorSuggested'
        end
      end
      
      class BatchUpdateDocumentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :requests, as: 'requests', class: Google::Apis::DocsV1::Request, decorator: Google::Apis::DocsV1::Request::Representation
      
          property :write_control, as: 'writeControl', class: Google::Apis::DocsV1::WriteControl, decorator: Google::Apis::DocsV1::WriteControl::Representation
      
        end
      end
      
      class BatchUpdateDocumentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :document_id, as: 'documentId'
          collection :replies, as: 'replies', class: Google::Apis::DocsV1::Response, decorator: Google::Apis::DocsV1::Response::Representation
      
          property :write_control, as: 'writeControl', class: Google::Apis::DocsV1::WriteControl, decorator: Google::Apis::DocsV1::WriteControl::Representation
      
        end
      end
      
      class Body
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
        end
      end
      
      class Bullet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_id, as: 'listId'
          property :nesting_level, as: 'nestingLevel'
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class BulletSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_id_suggested, as: 'listIdSuggested'
          property :nesting_level_suggested, as: 'nestingLevelSuggested'
          property :text_style_suggestion_state, as: 'textStyleSuggestionState', class: Google::Apis::DocsV1::TextStyleSuggestionState, decorator: Google::Apis::DocsV1::TextStyleSuggestionState::Representation
      
        end
      end
      
      class Color
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rgb_color, as: 'rgbColor', class: Google::Apis::DocsV1::RgbColor, decorator: Google::Apis::DocsV1::RgbColor::Representation
      
        end
      end
      
      class ColumnBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class CreateFooterRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class CreateFooterResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :footer_id, as: 'footerId'
        end
      end
      
      class CreateHeaderRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class CreateHeaderResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header_id, as: 'headerId'
        end
      end
      
      class CreateNamedRangeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class CreateNamedRangeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :named_range_id, as: 'namedRangeId'
        end
      end
      
      class CreateParagraphBulletsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_preset, as: 'bulletPreset'
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class CropProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :angle, as: 'angle'
          property :offset_bottom, as: 'offsetBottom'
          property :offset_left, as: 'offsetLeft'
          property :offset_right, as: 'offsetRight'
          property :offset_top, as: 'offsetTop'
        end
      end
      
      class CropPropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :angle_suggested, as: 'angleSuggested'
          property :offset_bottom_suggested, as: 'offsetBottomSuggested'
          property :offset_left_suggested, as: 'offsetLeftSuggested'
          property :offset_right_suggested, as: 'offsetRightSuggested'
          property :offset_top_suggested, as: 'offsetTopSuggested'
        end
      end
      
      class DeleteContentRangeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class DeleteNamedRangeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :named_range_id, as: 'namedRangeId'
        end
      end
      
      class DeleteParagraphBulletsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class DeletePositionedObjectRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class DeleteTableColumnRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_cell_location, as: 'tableCellLocation', class: Google::Apis::DocsV1::TableCellLocation, decorator: Google::Apis::DocsV1::TableCellLocation::Representation
      
        end
      end
      
      class DeleteTableRowRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_cell_location, as: 'tableCellLocation', class: Google::Apis::DocsV1::TableCellLocation, decorator: Google::Apis::DocsV1::TableCellLocation::Representation
      
        end
      end
      
      class Dimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :magnitude, as: 'magnitude'
          property :unit, as: 'unit'
        end
      end
      
      class Document
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body', class: Google::Apis::DocsV1::Body, decorator: Google::Apis::DocsV1::Body::Representation
      
          property :document_id, as: 'documentId'
          property :document_style, as: 'documentStyle', class: Google::Apis::DocsV1::DocumentStyle, decorator: Google::Apis::DocsV1::DocumentStyle::Representation
      
          hash :footers, as: 'footers', class: Google::Apis::DocsV1::Footer, decorator: Google::Apis::DocsV1::Footer::Representation
      
          hash :footnotes, as: 'footnotes', class: Google::Apis::DocsV1::Footnote, decorator: Google::Apis::DocsV1::Footnote::Representation
      
          hash :headers, as: 'headers', class: Google::Apis::DocsV1::Header, decorator: Google::Apis::DocsV1::Header::Representation
      
          hash :inline_objects, as: 'inlineObjects', class: Google::Apis::DocsV1::InlineObject, decorator: Google::Apis::DocsV1::InlineObject::Representation
      
          hash :lists, as: 'lists', class: Google::Apis::DocsV1::List, decorator: Google::Apis::DocsV1::List::Representation
      
          hash :named_ranges, as: 'namedRanges', class: Google::Apis::DocsV1::NamedRanges, decorator: Google::Apis::DocsV1::NamedRanges::Representation
      
          property :named_styles, as: 'namedStyles', class: Google::Apis::DocsV1::NamedStyles, decorator: Google::Apis::DocsV1::NamedStyles::Representation
      
          hash :positioned_objects, as: 'positionedObjects', class: Google::Apis::DocsV1::PositionedObject, decorator: Google::Apis::DocsV1::PositionedObject::Representation
      
          property :revision_id, as: 'revisionId'
          hash :suggested_document_style_changes, as: 'suggestedDocumentStyleChanges', class: Google::Apis::DocsV1::SuggestedDocumentStyle, decorator: Google::Apis::DocsV1::SuggestedDocumentStyle::Representation
      
          hash :suggested_named_styles_changes, as: 'suggestedNamedStylesChanges', class: Google::Apis::DocsV1::SuggestedNamedStyles, decorator: Google::Apis::DocsV1::SuggestedNamedStyles::Representation
      
          property :suggestions_view_mode, as: 'suggestionsViewMode'
          property :title, as: 'title'
        end
      end
      
      class DocumentStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background, as: 'background', class: Google::Apis::DocsV1::Background, decorator: Google::Apis::DocsV1::Background::Representation
      
          property :default_footer_id, as: 'defaultFooterId'
          property :default_header_id, as: 'defaultHeaderId'
          property :even_page_footer_id, as: 'evenPageFooterId'
          property :even_page_header_id, as: 'evenPageHeaderId'
          property :first_page_footer_id, as: 'firstPageFooterId'
          property :first_page_header_id, as: 'firstPageHeaderId'
          property :margin_bottom, as: 'marginBottom', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_left, as: 'marginLeft', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_right, as: 'marginRight', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_top, as: 'marginTop', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :page_number_start, as: 'pageNumberStart'
          property :page_size, as: 'pageSize', class: Google::Apis::DocsV1::Size, decorator: Google::Apis::DocsV1::Size::Representation
      
          property :use_even_page_header_footer, as: 'useEvenPageHeaderFooter'
          property :use_first_page_header_footer, as: 'useFirstPageHeaderFooter'
        end
      end
      
      class DocumentStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_suggestion_state, as: 'backgroundSuggestionState', class: Google::Apis::DocsV1::BackgroundSuggestionState, decorator: Google::Apis::DocsV1::BackgroundSuggestionState::Representation
      
          property :default_footer_id_suggested, as: 'defaultFooterIdSuggested'
          property :default_header_id_suggested, as: 'defaultHeaderIdSuggested'
          property :even_page_footer_id_suggested, as: 'evenPageFooterIdSuggested'
          property :even_page_header_id_suggested, as: 'evenPageHeaderIdSuggested'
          property :first_page_footer_id_suggested, as: 'firstPageFooterIdSuggested'
          property :first_page_header_id_suggested, as: 'firstPageHeaderIdSuggested'
          property :margin_bottom_suggested, as: 'marginBottomSuggested'
          property :margin_left_suggested, as: 'marginLeftSuggested'
          property :margin_right_suggested, as: 'marginRightSuggested'
          property :margin_top_suggested, as: 'marginTopSuggested'
          property :page_number_start_suggested, as: 'pageNumberStartSuggested'
          property :page_size_suggestion_state, as: 'pageSizeSuggestionState', class: Google::Apis::DocsV1::SizeSuggestionState, decorator: Google::Apis::DocsV1::SizeSuggestionState::Representation
      
          property :use_even_page_header_footer_suggested, as: 'useEvenPageHeaderFooterSuggested'
          property :use_first_page_header_footer_suggested, as: 'useFirstPageHeaderFooterSuggested'
        end
      end
      
      class EmbeddedDrawingProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EmbeddedDrawingPropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EmbeddedObject
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :embedded_drawing_properties, as: 'embeddedDrawingProperties', class: Google::Apis::DocsV1::EmbeddedDrawingProperties, decorator: Google::Apis::DocsV1::EmbeddedDrawingProperties::Representation
      
          property :embedded_object_border, as: 'embeddedObjectBorder', class: Google::Apis::DocsV1::EmbeddedObjectBorder, decorator: Google::Apis::DocsV1::EmbeddedObjectBorder::Representation
      
          property :image_properties, as: 'imageProperties', class: Google::Apis::DocsV1::ImageProperties, decorator: Google::Apis::DocsV1::ImageProperties::Representation
      
          property :linked_content_reference, as: 'linkedContentReference', class: Google::Apis::DocsV1::LinkedContentReference, decorator: Google::Apis::DocsV1::LinkedContentReference::Representation
      
          property :margin_bottom, as: 'marginBottom', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_left, as: 'marginLeft', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_right, as: 'marginRight', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :margin_top, as: 'marginTop', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :size, as: 'size', class: Google::Apis::DocsV1::Size, decorator: Google::Apis::DocsV1::Size::Representation
      
          property :title, as: 'title'
        end
      end
      
      class EmbeddedObjectBorder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :dash_style, as: 'dashStyle'
          property :property_state, as: 'propertyState'
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class EmbeddedObjectBorderSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color_suggested, as: 'colorSuggested'
          property :dash_style_suggested, as: 'dashStyleSuggested'
          property :property_state_suggested, as: 'propertyStateSuggested'
          property :width_suggested, as: 'widthSuggested'
        end
      end
      
      class EmbeddedObjectSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description_suggested, as: 'descriptionSuggested'
          property :embedded_drawing_properties_suggestion_state, as: 'embeddedDrawingPropertiesSuggestionState', class: Google::Apis::DocsV1::EmbeddedDrawingPropertiesSuggestionState, decorator: Google::Apis::DocsV1::EmbeddedDrawingPropertiesSuggestionState::Representation
      
          property :embedded_object_border_suggestion_state, as: 'embeddedObjectBorderSuggestionState', class: Google::Apis::DocsV1::EmbeddedObjectBorderSuggestionState, decorator: Google::Apis::DocsV1::EmbeddedObjectBorderSuggestionState::Representation
      
          property :image_properties_suggestion_state, as: 'imagePropertiesSuggestionState', class: Google::Apis::DocsV1::ImagePropertiesSuggestionState, decorator: Google::Apis::DocsV1::ImagePropertiesSuggestionState::Representation
      
          property :linked_content_reference_suggestion_state, as: 'linkedContentReferenceSuggestionState', class: Google::Apis::DocsV1::LinkedContentReferenceSuggestionState, decorator: Google::Apis::DocsV1::LinkedContentReferenceSuggestionState::Representation
      
          property :margin_bottom_suggested, as: 'marginBottomSuggested'
          property :margin_left_suggested, as: 'marginLeftSuggested'
          property :margin_right_suggested, as: 'marginRightSuggested'
          property :margin_top_suggested, as: 'marginTopSuggested'
          property :size_suggestion_state, as: 'sizeSuggestionState', class: Google::Apis::DocsV1::SizeSuggestionState, decorator: Google::Apis::DocsV1::SizeSuggestionState::Representation
      
          property :title_suggested, as: 'titleSuggested'
        end
      end
      
      class EndOfSegmentLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :segment_id, as: 'segmentId'
        end
      end
      
      class Equation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
        end
      end
      
      class Footer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
          property :footer_id, as: 'footerId'
        end
      end
      
      class Footnote
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
          property :footnote_id, as: 'footnoteId'
        end
      end
      
      class FootnoteReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :footnote_id, as: 'footnoteId'
          property :footnote_number, as: 'footnoteNumber'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class Header
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
          property :header_id, as: 'headerId'
        end
      end
      
      class HorizontalRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class ImageProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :angle, as: 'angle'
          property :brightness, as: 'brightness'
          property :content_uri, as: 'contentUri'
          property :contrast, as: 'contrast'
          property :crop_properties, as: 'cropProperties', class: Google::Apis::DocsV1::CropProperties, decorator: Google::Apis::DocsV1::CropProperties::Representation
      
          property :source_uri, as: 'sourceUri'
          property :transparency, as: 'transparency'
        end
      end
      
      class ImagePropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :angle_suggested, as: 'angleSuggested'
          property :brightness_suggested, as: 'brightnessSuggested'
          property :content_uri_suggested, as: 'contentUriSuggested'
          property :contrast_suggested, as: 'contrastSuggested'
          property :crop_properties_suggestion_state, as: 'cropPropertiesSuggestionState', class: Google::Apis::DocsV1::CropPropertiesSuggestionState, decorator: Google::Apis::DocsV1::CropPropertiesSuggestionState::Representation
      
          property :source_uri_suggested, as: 'sourceUriSuggested'
          property :transparency_suggested, as: 'transparencySuggested'
        end
      end
      
      class InlineObject
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inline_object_properties, as: 'inlineObjectProperties', class: Google::Apis::DocsV1::InlineObjectProperties, decorator: Google::Apis::DocsV1::InlineObjectProperties::Representation
      
          property :object_id_prop, as: 'objectId'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          hash :suggested_inline_object_properties_changes, as: 'suggestedInlineObjectPropertiesChanges', class: Google::Apis::DocsV1::SuggestedInlineObjectProperties, decorator: Google::Apis::DocsV1::SuggestedInlineObjectProperties::Representation
      
          property :suggested_insertion_id, as: 'suggestedInsertionId'
        end
      end
      
      class InlineObjectElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inline_object_id, as: 'inlineObjectId'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class InlineObjectProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embedded_object, as: 'embeddedObject', class: Google::Apis::DocsV1::EmbeddedObject, decorator: Google::Apis::DocsV1::EmbeddedObject::Representation
      
        end
      end
      
      class InlineObjectPropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embedded_object_suggestion_state, as: 'embeddedObjectSuggestionState', class: Google::Apis::DocsV1::EmbeddedObjectSuggestionState, decorator: Google::Apis::DocsV1::EmbeddedObjectSuggestionState::Representation
      
        end
      end
      
      class InsertInlineImageRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_of_segment_location, as: 'endOfSegmentLocation', class: Google::Apis::DocsV1::EndOfSegmentLocation, decorator: Google::Apis::DocsV1::EndOfSegmentLocation::Representation
      
          property :location, as: 'location', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
          property :object_size, as: 'objectSize', class: Google::Apis::DocsV1::Size, decorator: Google::Apis::DocsV1::Size::Representation
      
          property :uri, as: 'uri'
        end
      end
      
      class InsertInlineImageResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class InsertInlineSheetsChartResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
        end
      end
      
      class InsertPageBreakRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_of_segment_location, as: 'endOfSegmentLocation', class: Google::Apis::DocsV1::EndOfSegmentLocation, decorator: Google::Apis::DocsV1::EndOfSegmentLocation::Representation
      
          property :location, as: 'location', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
        end
      end
      
      class InsertTableColumnRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :insert_right, as: 'insertRight'
          property :table_cell_location, as: 'tableCellLocation', class: Google::Apis::DocsV1::TableCellLocation, decorator: Google::Apis::DocsV1::TableCellLocation::Representation
      
        end
      end
      
      class InsertTableRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :columns, as: 'columns'
          property :end_of_segment_location, as: 'endOfSegmentLocation', class: Google::Apis::DocsV1::EndOfSegmentLocation, decorator: Google::Apis::DocsV1::EndOfSegmentLocation::Representation
      
          property :location, as: 'location', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
          property :rows, as: 'rows'
        end
      end
      
      class InsertTableRowRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :insert_below, as: 'insertBelow'
          property :table_cell_location, as: 'tableCellLocation', class: Google::Apis::DocsV1::TableCellLocation, decorator: Google::Apis::DocsV1::TableCellLocation::Representation
      
        end
      end
      
      class InsertTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_of_segment_location, as: 'endOfSegmentLocation', class: Google::Apis::DocsV1::EndOfSegmentLocation, decorator: Google::Apis::DocsV1::EndOfSegmentLocation::Representation
      
          property :location, as: 'location', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
          property :text, as: 'text'
        end
      end
      
      class Link
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bookmark_id, as: 'bookmarkId'
          property :heading_id, as: 'headingId'
          property :url, as: 'url'
        end
      end
      
      class LinkedContentReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sheets_chart_reference, as: 'sheetsChartReference', class: Google::Apis::DocsV1::SheetsChartReference, decorator: Google::Apis::DocsV1::SheetsChartReference::Representation
      
        end
      end
      
      class LinkedContentReferenceSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sheets_chart_reference_suggestion_state, as: 'sheetsChartReferenceSuggestionState', class: Google::Apis::DocsV1::SheetsChartReferenceSuggestionState, decorator: Google::Apis::DocsV1::SheetsChartReferenceSuggestionState::Representation
      
        end
      end
      
      class List
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_properties, as: 'listProperties', class: Google::Apis::DocsV1::ListProperties, decorator: Google::Apis::DocsV1::ListProperties::Representation
      
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          property :suggested_insertion_id, as: 'suggestedInsertionId'
          hash :suggested_list_properties_changes, as: 'suggestedListPropertiesChanges', class: Google::Apis::DocsV1::SuggestedListProperties, decorator: Google::Apis::DocsV1::SuggestedListProperties::Representation
      
        end
      end
      
      class ListProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :nesting_levels, as: 'nestingLevels', class: Google::Apis::DocsV1::NestingLevel, decorator: Google::Apis::DocsV1::NestingLevel::Representation
      
        end
      end
      
      class ListPropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :nesting_levels_suggestion_states, as: 'nestingLevelsSuggestionStates', class: Google::Apis::DocsV1::NestingLevelSuggestionState, decorator: Google::Apis::DocsV1::NestingLevelSuggestionState::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :index, as: 'index'
          property :segment_id, as: 'segmentId'
        end
      end
      
      class MergeTableCellsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_range, as: 'tableRange', class: Google::Apis::DocsV1::TableRange, decorator: Google::Apis::DocsV1::TableRange::Representation
      
        end
      end
      
      class NamedRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :named_range_id, as: 'namedRangeId'
          collection :ranges, as: 'ranges', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class NamedRanges
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :named_ranges, as: 'namedRanges', class: Google::Apis::DocsV1::NamedRange, decorator: Google::Apis::DocsV1::NamedRange::Representation
      
        end
      end
      
      class NamedStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :named_style_type, as: 'namedStyleType'
          property :paragraph_style, as: 'paragraphStyle', class: Google::Apis::DocsV1::ParagraphStyle, decorator: Google::Apis::DocsV1::ParagraphStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class NamedStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :named_style_type, as: 'namedStyleType'
          property :paragraph_style_suggestion_state, as: 'paragraphStyleSuggestionState', class: Google::Apis::DocsV1::ParagraphStyleSuggestionState, decorator: Google::Apis::DocsV1::ParagraphStyleSuggestionState::Representation
      
          property :text_style_suggestion_state, as: 'textStyleSuggestionState', class: Google::Apis::DocsV1::TextStyleSuggestionState, decorator: Google::Apis::DocsV1::TextStyleSuggestionState::Representation
      
        end
      end
      
      class NamedStyles
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :styles, as: 'styles', class: Google::Apis::DocsV1::NamedStyle, decorator: Google::Apis::DocsV1::NamedStyle::Representation
      
        end
      end
      
      class NamedStylesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :styles_suggestion_states, as: 'stylesSuggestionStates', class: Google::Apis::DocsV1::NamedStyleSuggestionState, decorator: Google::Apis::DocsV1::NamedStyleSuggestionState::Representation
      
        end
      end
      
      class NestingLevel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_alignment, as: 'bulletAlignment'
          property :glyph_format, as: 'glyphFormat'
          property :glyph_symbol, as: 'glyphSymbol'
          property :glyph_type, as: 'glyphType'
          property :indent_first_line, as: 'indentFirstLine', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :indent_start, as: 'indentStart', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :start_number, as: 'startNumber'
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class NestingLevelSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet_alignment_suggested, as: 'bulletAlignmentSuggested'
          property :glyph_format_suggested, as: 'glyphFormatSuggested'
          property :glyph_symbol_suggested, as: 'glyphSymbolSuggested'
          property :glyph_type_suggested, as: 'glyphTypeSuggested'
          property :indent_first_line_suggested, as: 'indentFirstLineSuggested'
          property :indent_start_suggested, as: 'indentStartSuggested'
          property :start_number_suggested, as: 'startNumberSuggested'
          property :text_style_suggestion_state, as: 'textStyleSuggestionState', class: Google::Apis::DocsV1::TextStyleSuggestionState, decorator: Google::Apis::DocsV1::TextStyleSuggestionState::Representation
      
        end
      end
      
      class ObjectReferences
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :object_ids, as: 'objectIds'
        end
      end
      
      class OptionalColor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::DocsV1::Color, decorator: Google::Apis::DocsV1::Color::Representation
      
        end
      end
      
      class PageBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class Paragraph
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet, as: 'bullet', class: Google::Apis::DocsV1::Bullet, decorator: Google::Apis::DocsV1::Bullet::Representation
      
          collection :elements, as: 'elements', class: Google::Apis::DocsV1::ParagraphElement, decorator: Google::Apis::DocsV1::ParagraphElement::Representation
      
          property :paragraph_style, as: 'paragraphStyle', class: Google::Apis::DocsV1::ParagraphStyle, decorator: Google::Apis::DocsV1::ParagraphStyle::Representation
      
          collection :positioned_object_ids, as: 'positionedObjectIds'
          hash :suggested_bullet_changes, as: 'suggestedBulletChanges', class: Google::Apis::DocsV1::SuggestedBullet, decorator: Google::Apis::DocsV1::SuggestedBullet::Representation
      
          hash :suggested_paragraph_style_changes, as: 'suggestedParagraphStyleChanges', class: Google::Apis::DocsV1::SuggestedParagraphStyle, decorator: Google::Apis::DocsV1::SuggestedParagraphStyle::Representation
      
          hash :suggested_positioned_object_ids, as: 'suggestedPositionedObjectIds', class: Google::Apis::DocsV1::ObjectReferences, decorator: Google::Apis::DocsV1::ObjectReferences::Representation
      
        end
      end
      
      class ParagraphBorder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :dash_style, as: 'dashStyle'
          property :padding, as: 'padding', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class ParagraphElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_text, as: 'autoText', class: Google::Apis::DocsV1::AutoText, decorator: Google::Apis::DocsV1::AutoText::Representation
      
          property :column_break, as: 'columnBreak', class: Google::Apis::DocsV1::ColumnBreak, decorator: Google::Apis::DocsV1::ColumnBreak::Representation
      
          property :end_index, as: 'endIndex'
          property :equation, as: 'equation', class: Google::Apis::DocsV1::Equation, decorator: Google::Apis::DocsV1::Equation::Representation
      
          property :footnote_reference, as: 'footnoteReference', class: Google::Apis::DocsV1::FootnoteReference, decorator: Google::Apis::DocsV1::FootnoteReference::Representation
      
          property :horizontal_rule, as: 'horizontalRule', class: Google::Apis::DocsV1::HorizontalRule, decorator: Google::Apis::DocsV1::HorizontalRule::Representation
      
          property :inline_object_element, as: 'inlineObjectElement', class: Google::Apis::DocsV1::InlineObjectElement, decorator: Google::Apis::DocsV1::InlineObjectElement::Representation
      
          property :page_break, as: 'pageBreak', class: Google::Apis::DocsV1::PageBreak, decorator: Google::Apis::DocsV1::PageBreak::Representation
      
          property :start_index, as: 'startIndex'
          property :text_run, as: 'textRun', class: Google::Apis::DocsV1::TextRun, decorator: Google::Apis::DocsV1::TextRun::Representation
      
        end
      end
      
      class ParagraphStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alignment, as: 'alignment'
          property :avoid_widow_and_orphan, as: 'avoidWidowAndOrphan'
          property :border_between, as: 'borderBetween', class: Google::Apis::DocsV1::ParagraphBorder, decorator: Google::Apis::DocsV1::ParagraphBorder::Representation
      
          property :border_bottom, as: 'borderBottom', class: Google::Apis::DocsV1::ParagraphBorder, decorator: Google::Apis::DocsV1::ParagraphBorder::Representation
      
          property :border_left, as: 'borderLeft', class: Google::Apis::DocsV1::ParagraphBorder, decorator: Google::Apis::DocsV1::ParagraphBorder::Representation
      
          property :border_right, as: 'borderRight', class: Google::Apis::DocsV1::ParagraphBorder, decorator: Google::Apis::DocsV1::ParagraphBorder::Representation
      
          property :border_top, as: 'borderTop', class: Google::Apis::DocsV1::ParagraphBorder, decorator: Google::Apis::DocsV1::ParagraphBorder::Representation
      
          property :direction, as: 'direction'
          property :heading_id, as: 'headingId'
          property :indent_end, as: 'indentEnd', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :indent_first_line, as: 'indentFirstLine', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :indent_start, as: 'indentStart', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :keep_lines_together, as: 'keepLinesTogether'
          property :keep_with_next, as: 'keepWithNext'
          property :line_spacing, as: 'lineSpacing'
          property :named_style_type, as: 'namedStyleType'
          property :shading, as: 'shading', class: Google::Apis::DocsV1::Shading, decorator: Google::Apis::DocsV1::Shading::Representation
      
          property :space_above, as: 'spaceAbove', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :space_below, as: 'spaceBelow', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :spacing_mode, as: 'spacingMode'
          collection :tab_stops, as: 'tabStops', class: Google::Apis::DocsV1::TabStop, decorator: Google::Apis::DocsV1::TabStop::Representation
      
        end
      end
      
      class ParagraphStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alignment_suggested, as: 'alignmentSuggested'
          property :avoid_widow_and_orphan_suggested, as: 'avoidWidowAndOrphanSuggested'
          property :border_between_suggested, as: 'borderBetweenSuggested'
          property :border_bottom_suggested, as: 'borderBottomSuggested'
          property :border_left_suggested, as: 'borderLeftSuggested'
          property :border_right_suggested, as: 'borderRightSuggested'
          property :border_top_suggested, as: 'borderTopSuggested'
          property :direction_suggested, as: 'directionSuggested'
          property :heading_id_suggested, as: 'headingIdSuggested'
          property :indent_end_suggested, as: 'indentEndSuggested'
          property :indent_first_line_suggested, as: 'indentFirstLineSuggested'
          property :indent_start_suggested, as: 'indentStartSuggested'
          property :keep_lines_together_suggested, as: 'keepLinesTogetherSuggested'
          property :keep_with_next_suggested, as: 'keepWithNextSuggested'
          property :line_spacing_suggested, as: 'lineSpacingSuggested'
          property :named_style_type_suggested, as: 'namedStyleTypeSuggested'
          property :shading_suggestion_state, as: 'shadingSuggestionState', class: Google::Apis::DocsV1::ShadingSuggestionState, decorator: Google::Apis::DocsV1::ShadingSuggestionState::Representation
      
          property :space_above_suggested, as: 'spaceAboveSuggested'
          property :space_below_suggested, as: 'spaceBelowSuggested'
          property :spacing_mode_suggested, as: 'spacingModeSuggested'
        end
      end
      
      class PositionedObject
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_id_prop, as: 'objectId'
          property :positioned_object_properties, as: 'positionedObjectProperties', class: Google::Apis::DocsV1::PositionedObjectProperties, decorator: Google::Apis::DocsV1::PositionedObjectProperties::Representation
      
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          property :suggested_insertion_id, as: 'suggestedInsertionId'
          hash :suggested_positioned_object_properties_changes, as: 'suggestedPositionedObjectPropertiesChanges', class: Google::Apis::DocsV1::SuggestedPositionedObjectProperties, decorator: Google::Apis::DocsV1::SuggestedPositionedObjectProperties::Representation
      
        end
      end
      
      class PositionedObjectPositioning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout, as: 'layout'
          property :left_offset, as: 'leftOffset', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :top_offset, as: 'topOffset', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class PositionedObjectPositioningSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :layout_suggested, as: 'layoutSuggested'
          property :left_offset_suggested, as: 'leftOffsetSuggested'
          property :top_offset_suggested, as: 'topOffsetSuggested'
        end
      end
      
      class PositionedObjectProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embedded_object, as: 'embeddedObject', class: Google::Apis::DocsV1::EmbeddedObject, decorator: Google::Apis::DocsV1::EmbeddedObject::Representation
      
          property :positioning, as: 'positioning', class: Google::Apis::DocsV1::PositionedObjectPositioning, decorator: Google::Apis::DocsV1::PositionedObjectPositioning::Representation
      
        end
      end
      
      class PositionedObjectPropertiesSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :embedded_object_suggestion_state, as: 'embeddedObjectSuggestionState', class: Google::Apis::DocsV1::EmbeddedObjectSuggestionState, decorator: Google::Apis::DocsV1::EmbeddedObjectSuggestionState::Representation
      
          property :positioning_suggestion_state, as: 'positioningSuggestionState', class: Google::Apis::DocsV1::PositionedObjectPositioningSuggestionState, decorator: Google::Apis::DocsV1::PositionedObjectPositioningSuggestionState::Representation
      
        end
      end
      
      class Range
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_index, as: 'endIndex'
          property :segment_id, as: 'segmentId'
          property :start_index, as: 'startIndex'
        end
      end
      
      class ReplaceAllTextRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contains_text, as: 'containsText', class: Google::Apis::DocsV1::SubstringMatchCriteria, decorator: Google::Apis::DocsV1::SubstringMatchCriteria::Representation
      
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
          property :uri, as: 'uri'
        end
      end
      
      class ReplaceNamedRangeContentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :named_range_id, as: 'namedRangeId'
          property :named_range_name, as: 'namedRangeName'
          property :text, as: 'text'
        end
      end
      
      class Request
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_footer, as: 'createFooter', class: Google::Apis::DocsV1::CreateFooterRequest, decorator: Google::Apis::DocsV1::CreateFooterRequest::Representation
      
          property :create_header, as: 'createHeader', class: Google::Apis::DocsV1::CreateHeaderRequest, decorator: Google::Apis::DocsV1::CreateHeaderRequest::Representation
      
          property :create_named_range, as: 'createNamedRange', class: Google::Apis::DocsV1::CreateNamedRangeRequest, decorator: Google::Apis::DocsV1::CreateNamedRangeRequest::Representation
      
          property :create_paragraph_bullets, as: 'createParagraphBullets', class: Google::Apis::DocsV1::CreateParagraphBulletsRequest, decorator: Google::Apis::DocsV1::CreateParagraphBulletsRequest::Representation
      
          property :delete_content_range, as: 'deleteContentRange', class: Google::Apis::DocsV1::DeleteContentRangeRequest, decorator: Google::Apis::DocsV1::DeleteContentRangeRequest::Representation
      
          property :delete_named_range, as: 'deleteNamedRange', class: Google::Apis::DocsV1::DeleteNamedRangeRequest, decorator: Google::Apis::DocsV1::DeleteNamedRangeRequest::Representation
      
          property :delete_paragraph_bullets, as: 'deleteParagraphBullets', class: Google::Apis::DocsV1::DeleteParagraphBulletsRequest, decorator: Google::Apis::DocsV1::DeleteParagraphBulletsRequest::Representation
      
          property :delete_positioned_object, as: 'deletePositionedObject', class: Google::Apis::DocsV1::DeletePositionedObjectRequest, decorator: Google::Apis::DocsV1::DeletePositionedObjectRequest::Representation
      
          property :delete_table_column, as: 'deleteTableColumn', class: Google::Apis::DocsV1::DeleteTableColumnRequest, decorator: Google::Apis::DocsV1::DeleteTableColumnRequest::Representation
      
          property :delete_table_row, as: 'deleteTableRow', class: Google::Apis::DocsV1::DeleteTableRowRequest, decorator: Google::Apis::DocsV1::DeleteTableRowRequest::Representation
      
          property :insert_inline_image, as: 'insertInlineImage', class: Google::Apis::DocsV1::InsertInlineImageRequest, decorator: Google::Apis::DocsV1::InsertInlineImageRequest::Representation
      
          property :insert_page_break, as: 'insertPageBreak', class: Google::Apis::DocsV1::InsertPageBreakRequest, decorator: Google::Apis::DocsV1::InsertPageBreakRequest::Representation
      
          property :insert_table, as: 'insertTable', class: Google::Apis::DocsV1::InsertTableRequest, decorator: Google::Apis::DocsV1::InsertTableRequest::Representation
      
          property :insert_table_column, as: 'insertTableColumn', class: Google::Apis::DocsV1::InsertTableColumnRequest, decorator: Google::Apis::DocsV1::InsertTableColumnRequest::Representation
      
          property :insert_table_row, as: 'insertTableRow', class: Google::Apis::DocsV1::InsertTableRowRequest, decorator: Google::Apis::DocsV1::InsertTableRowRequest::Representation
      
          property :insert_text, as: 'insertText', class: Google::Apis::DocsV1::InsertTextRequest, decorator: Google::Apis::DocsV1::InsertTextRequest::Representation
      
          property :merge_table_cells, as: 'mergeTableCells', class: Google::Apis::DocsV1::MergeTableCellsRequest, decorator: Google::Apis::DocsV1::MergeTableCellsRequest::Representation
      
          property :replace_all_text, as: 'replaceAllText', class: Google::Apis::DocsV1::ReplaceAllTextRequest, decorator: Google::Apis::DocsV1::ReplaceAllTextRequest::Representation
      
          property :replace_image, as: 'replaceImage', class: Google::Apis::DocsV1::ReplaceImageRequest, decorator: Google::Apis::DocsV1::ReplaceImageRequest::Representation
      
          property :replace_named_range_content, as: 'replaceNamedRangeContent', class: Google::Apis::DocsV1::ReplaceNamedRangeContentRequest, decorator: Google::Apis::DocsV1::ReplaceNamedRangeContentRequest::Representation
      
          property :unmerge_table_cells, as: 'unmergeTableCells', class: Google::Apis::DocsV1::UnmergeTableCellsRequest, decorator: Google::Apis::DocsV1::UnmergeTableCellsRequest::Representation
      
          property :update_document_style, as: 'updateDocumentStyle', class: Google::Apis::DocsV1::UpdateDocumentStyleRequest, decorator: Google::Apis::DocsV1::UpdateDocumentStyleRequest::Representation
      
          property :update_paragraph_style, as: 'updateParagraphStyle', class: Google::Apis::DocsV1::UpdateParagraphStyleRequest, decorator: Google::Apis::DocsV1::UpdateParagraphStyleRequest::Representation
      
          property :update_table_cell_style, as: 'updateTableCellStyle', class: Google::Apis::DocsV1::UpdateTableCellStyleRequest, decorator: Google::Apis::DocsV1::UpdateTableCellStyleRequest::Representation
      
          property :update_table_column_properties, as: 'updateTableColumnProperties', class: Google::Apis::DocsV1::UpdateTableColumnPropertiesRequest, decorator: Google::Apis::DocsV1::UpdateTableColumnPropertiesRequest::Representation
      
          property :update_table_row_style, as: 'updateTableRowStyle', class: Google::Apis::DocsV1::UpdateTableRowStyleRequest, decorator: Google::Apis::DocsV1::UpdateTableRowStyleRequest::Representation
      
          property :update_text_style, as: 'updateTextStyle', class: Google::Apis::DocsV1::UpdateTextStyleRequest, decorator: Google::Apis::DocsV1::UpdateTextStyleRequest::Representation
      
        end
      end
      
      class Response
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_footer, as: 'createFooter', class: Google::Apis::DocsV1::CreateFooterResponse, decorator: Google::Apis::DocsV1::CreateFooterResponse::Representation
      
          property :create_header, as: 'createHeader', class: Google::Apis::DocsV1::CreateHeaderResponse, decorator: Google::Apis::DocsV1::CreateHeaderResponse::Representation
      
          property :create_named_range, as: 'createNamedRange', class: Google::Apis::DocsV1::CreateNamedRangeResponse, decorator: Google::Apis::DocsV1::CreateNamedRangeResponse::Representation
      
          property :insert_inline_image, as: 'insertInlineImage', class: Google::Apis::DocsV1::InsertInlineImageResponse, decorator: Google::Apis::DocsV1::InsertInlineImageResponse::Representation
      
          property :insert_inline_sheets_chart, as: 'insertInlineSheetsChart', class: Google::Apis::DocsV1::InsertInlineSheetsChartResponse, decorator: Google::Apis::DocsV1::InsertInlineSheetsChartResponse::Representation
      
          property :replace_all_text, as: 'replaceAllText', class: Google::Apis::DocsV1::ReplaceAllTextResponse, decorator: Google::Apis::DocsV1::ReplaceAllTextResponse::Representation
      
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
      
      class SectionBreak
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :section_style, as: 'sectionStyle', class: Google::Apis::DocsV1::SectionStyle, decorator: Google::Apis::DocsV1::SectionStyle::Representation
      
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
        end
      end
      
      class SectionColumnProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :padding_end, as: 'paddingEnd', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class SectionStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_properties, as: 'columnProperties', class: Google::Apis::DocsV1::SectionColumnProperties, decorator: Google::Apis::DocsV1::SectionColumnProperties::Representation
      
          property :column_separator_style, as: 'columnSeparatorStyle'
          property :content_direction, as: 'contentDirection'
        end
      end
      
      class Shading
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
        end
      end
      
      class ShadingSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color_suggested, as: 'backgroundColorSuggested'
        end
      end
      
      class SheetsChartReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_id, as: 'chartId'
          property :spreadsheet_id, as: 'spreadsheetId'
        end
      end
      
      class SheetsChartReferenceSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :chart_id_suggested, as: 'chartIdSuggested'
          property :spreadsheet_id_suggested, as: 'spreadsheetIdSuggested'
        end
      end
      
      class Size
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class SizeSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height_suggested, as: 'heightSuggested'
          property :width_suggested, as: 'widthSuggested'
        end
      end
      
      class StructuralElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_index, as: 'endIndex'
          property :paragraph, as: 'paragraph', class: Google::Apis::DocsV1::Paragraph, decorator: Google::Apis::DocsV1::Paragraph::Representation
      
          property :section_break, as: 'sectionBreak', class: Google::Apis::DocsV1::SectionBreak, decorator: Google::Apis::DocsV1::SectionBreak::Representation
      
          property :start_index, as: 'startIndex'
          property :table, as: 'table', class: Google::Apis::DocsV1::Table, decorator: Google::Apis::DocsV1::Table::Representation
      
          property :table_of_contents, as: 'tableOfContents', class: Google::Apis::DocsV1::TableOfContents, decorator: Google::Apis::DocsV1::TableOfContents::Representation
      
        end
      end
      
      class SubstringMatchCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :match_case, as: 'matchCase'
          property :text, as: 'text'
        end
      end
      
      class SuggestedBullet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bullet, as: 'bullet', class: Google::Apis::DocsV1::Bullet, decorator: Google::Apis::DocsV1::Bullet::Representation
      
          property :bullet_suggestion_state, as: 'bulletSuggestionState', class: Google::Apis::DocsV1::BulletSuggestionState, decorator: Google::Apis::DocsV1::BulletSuggestionState::Representation
      
        end
      end
      
      class SuggestedDocumentStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :document_style, as: 'documentStyle', class: Google::Apis::DocsV1::DocumentStyle, decorator: Google::Apis::DocsV1::DocumentStyle::Representation
      
          property :document_style_suggestion_state, as: 'documentStyleSuggestionState', class: Google::Apis::DocsV1::DocumentStyleSuggestionState, decorator: Google::Apis::DocsV1::DocumentStyleSuggestionState::Representation
      
        end
      end
      
      class SuggestedInlineObjectProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inline_object_properties, as: 'inlineObjectProperties', class: Google::Apis::DocsV1::InlineObjectProperties, decorator: Google::Apis::DocsV1::InlineObjectProperties::Representation
      
          property :inline_object_properties_suggestion_state, as: 'inlineObjectPropertiesSuggestionState', class: Google::Apis::DocsV1::InlineObjectPropertiesSuggestionState, decorator: Google::Apis::DocsV1::InlineObjectPropertiesSuggestionState::Representation
      
        end
      end
      
      class SuggestedListProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :list_properties, as: 'listProperties', class: Google::Apis::DocsV1::ListProperties, decorator: Google::Apis::DocsV1::ListProperties::Representation
      
          property :list_properties_suggestion_state, as: 'listPropertiesSuggestionState', class: Google::Apis::DocsV1::ListPropertiesSuggestionState, decorator: Google::Apis::DocsV1::ListPropertiesSuggestionState::Representation
      
        end
      end
      
      class SuggestedNamedStyles
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :named_styles, as: 'namedStyles', class: Google::Apis::DocsV1::NamedStyles, decorator: Google::Apis::DocsV1::NamedStyles::Representation
      
          property :named_styles_suggestion_state, as: 'namedStylesSuggestionState', class: Google::Apis::DocsV1::NamedStylesSuggestionState, decorator: Google::Apis::DocsV1::NamedStylesSuggestionState::Representation
      
        end
      end
      
      class SuggestedParagraphStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :paragraph_style, as: 'paragraphStyle', class: Google::Apis::DocsV1::ParagraphStyle, decorator: Google::Apis::DocsV1::ParagraphStyle::Representation
      
          property :paragraph_style_suggestion_state, as: 'paragraphStyleSuggestionState', class: Google::Apis::DocsV1::ParagraphStyleSuggestionState, decorator: Google::Apis::DocsV1::ParagraphStyleSuggestionState::Representation
      
        end
      end
      
      class SuggestedPositionedObjectProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :positioned_object_properties, as: 'positionedObjectProperties', class: Google::Apis::DocsV1::PositionedObjectProperties, decorator: Google::Apis::DocsV1::PositionedObjectProperties::Representation
      
          property :positioned_object_properties_suggestion_state, as: 'positionedObjectPropertiesSuggestionState', class: Google::Apis::DocsV1::PositionedObjectPropertiesSuggestionState, decorator: Google::Apis::DocsV1::PositionedObjectPropertiesSuggestionState::Representation
      
        end
      end
      
      class SuggestedTableCellStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_cell_style, as: 'tableCellStyle', class: Google::Apis::DocsV1::TableCellStyle, decorator: Google::Apis::DocsV1::TableCellStyle::Representation
      
          property :table_cell_style_suggestion_state, as: 'tableCellStyleSuggestionState', class: Google::Apis::DocsV1::TableCellStyleSuggestionState, decorator: Google::Apis::DocsV1::TableCellStyleSuggestionState::Representation
      
        end
      end
      
      class SuggestedTableRowStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_row_style, as: 'tableRowStyle', class: Google::Apis::DocsV1::TableRowStyle, decorator: Google::Apis::DocsV1::TableRowStyle::Representation
      
          property :table_row_style_suggestion_state, as: 'tableRowStyleSuggestionState', class: Google::Apis::DocsV1::TableRowStyleSuggestionState, decorator: Google::Apis::DocsV1::TableRowStyleSuggestionState::Representation
      
        end
      end
      
      class SuggestedTextStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
          property :text_style_suggestion_state, as: 'textStyleSuggestionState', class: Google::Apis::DocsV1::TextStyleSuggestionState, decorator: Google::Apis::DocsV1::TextStyleSuggestionState::Representation
      
        end
      end
      
      class TabStop
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alignment, as: 'alignment'
          property :offset, as: 'offset', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :columns, as: 'columns'
          property :rows, as: 'rows'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          collection :table_rows, as: 'tableRows', class: Google::Apis::DocsV1::TableRow, decorator: Google::Apis::DocsV1::TableRow::Representation
      
          property :table_style, as: 'tableStyle', class: Google::Apis::DocsV1::TableStyle, decorator: Google::Apis::DocsV1::TableStyle::Representation
      
        end
      end
      
      class TableCell
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
          property :end_index, as: 'endIndex'
          property :start_index, as: 'startIndex'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_table_cell_style_changes, as: 'suggestedTableCellStyleChanges', class: Google::Apis::DocsV1::SuggestedTableCellStyle, decorator: Google::Apis::DocsV1::SuggestedTableCellStyle::Representation
      
          property :table_cell_style, as: 'tableCellStyle', class: Google::Apis::DocsV1::TableCellStyle, decorator: Google::Apis::DocsV1::TableCellStyle::Representation
      
        end
      end
      
      class TableCellBorder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :dash_style, as: 'dashStyle'
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class TableCellLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_index, as: 'columnIndex'
          property :row_index, as: 'rowIndex'
          property :table_start_location, as: 'tableStartLocation', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
        end
      end
      
      class TableCellStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :border_bottom, as: 'borderBottom', class: Google::Apis::DocsV1::TableCellBorder, decorator: Google::Apis::DocsV1::TableCellBorder::Representation
      
          property :border_left, as: 'borderLeft', class: Google::Apis::DocsV1::TableCellBorder, decorator: Google::Apis::DocsV1::TableCellBorder::Representation
      
          property :border_right, as: 'borderRight', class: Google::Apis::DocsV1::TableCellBorder, decorator: Google::Apis::DocsV1::TableCellBorder::Representation
      
          property :border_top, as: 'borderTop', class: Google::Apis::DocsV1::TableCellBorder, decorator: Google::Apis::DocsV1::TableCellBorder::Representation
      
          property :column_span, as: 'columnSpan'
          property :content_alignment, as: 'contentAlignment'
          property :padding_bottom, as: 'paddingBottom', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :padding_left, as: 'paddingLeft', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :padding_right, as: 'paddingRight', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :padding_top, as: 'paddingTop', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :row_span, as: 'rowSpan'
        end
      end
      
      class TableCellStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color_suggested, as: 'backgroundColorSuggested'
          property :border_bottom_suggested, as: 'borderBottomSuggested'
          property :border_left_suggested, as: 'borderLeftSuggested'
          property :border_right_suggested, as: 'borderRightSuggested'
          property :border_top_suggested, as: 'borderTopSuggested'
          property :column_span_suggested, as: 'columnSpanSuggested'
          property :content_alignment_suggested, as: 'contentAlignmentSuggested'
          property :padding_bottom_suggested, as: 'paddingBottomSuggested'
          property :padding_left_suggested, as: 'paddingLeftSuggested'
          property :padding_right_suggested, as: 'paddingRightSuggested'
          property :padding_top_suggested, as: 'paddingTopSuggested'
          property :row_span_suggested, as: 'rowSpanSuggested'
        end
      end
      
      class TableColumnProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :width, as: 'width', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :width_type, as: 'widthType'
        end
      end
      
      class TableOfContents
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content, as: 'content', class: Google::Apis::DocsV1::StructuralElement, decorator: Google::Apis::DocsV1::StructuralElement::Representation
      
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
        end
      end
      
      class TableRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_span, as: 'columnSpan'
          property :row_span, as: 'rowSpan'
          property :table_cell_location, as: 'tableCellLocation', class: Google::Apis::DocsV1::TableCellLocation, decorator: Google::Apis::DocsV1::TableCellLocation::Representation
      
        end
      end
      
      class TableRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_index, as: 'endIndex'
          property :start_index, as: 'startIndex'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_table_row_style_changes, as: 'suggestedTableRowStyleChanges', class: Google::Apis::DocsV1::SuggestedTableRowStyle, decorator: Google::Apis::DocsV1::SuggestedTableRowStyle::Representation
      
          collection :table_cells, as: 'tableCells', class: Google::Apis::DocsV1::TableCell, decorator: Google::Apis::DocsV1::TableCell::Representation
      
          property :table_row_style, as: 'tableRowStyle', class: Google::Apis::DocsV1::TableRowStyle, decorator: Google::Apis::DocsV1::TableRowStyle::Representation
      
        end
      end
      
      class TableRowStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_row_height, as: 'minRowHeight', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
        end
      end
      
      class TableRowStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_row_height_suggested, as: 'minRowHeightSuggested'
        end
      end
      
      class TableStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :table_column_properties, as: 'tableColumnProperties', class: Google::Apis::DocsV1::TableColumnProperties, decorator: Google::Apis::DocsV1::TableColumnProperties::Representation
      
        end
      end
      
      class TextRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          collection :suggested_deletion_ids, as: 'suggestedDeletionIds'
          collection :suggested_insertion_ids, as: 'suggestedInsertionIds'
          hash :suggested_text_style_changes, as: 'suggestedTextStyleChanges', class: Google::Apis::DocsV1::SuggestedTextStyle, decorator: Google::Apis::DocsV1::SuggestedTextStyle::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class TextStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color, as: 'backgroundColor', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :baseline_offset, as: 'baselineOffset'
          property :bold, as: 'bold'
          property :font_size, as: 'fontSize', class: Google::Apis::DocsV1::Dimension, decorator: Google::Apis::DocsV1::Dimension::Representation
      
          property :foreground_color, as: 'foregroundColor', class: Google::Apis::DocsV1::OptionalColor, decorator: Google::Apis::DocsV1::OptionalColor::Representation
      
          property :italic, as: 'italic'
          property :link, as: 'link', class: Google::Apis::DocsV1::Link, decorator: Google::Apis::DocsV1::Link::Representation
      
          property :small_caps, as: 'smallCaps'
          property :strikethrough, as: 'strikethrough'
          property :underline, as: 'underline'
          property :weighted_font_family, as: 'weightedFontFamily', class: Google::Apis::DocsV1::WeightedFontFamily, decorator: Google::Apis::DocsV1::WeightedFontFamily::Representation
      
        end
      end
      
      class TextStyleSuggestionState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :background_color_suggested, as: 'backgroundColorSuggested'
          property :baseline_offset_suggested, as: 'baselineOffsetSuggested'
          property :bold_suggested, as: 'boldSuggested'
          property :font_size_suggested, as: 'fontSizeSuggested'
          property :foreground_color_suggested, as: 'foregroundColorSuggested'
          property :italic_suggested, as: 'italicSuggested'
          property :link_suggested, as: 'linkSuggested'
          property :small_caps_suggested, as: 'smallCapsSuggested'
          property :strikethrough_suggested, as: 'strikethroughSuggested'
          property :underline_suggested, as: 'underlineSuggested'
          property :weighted_font_family_suggested, as: 'weightedFontFamilySuggested'
        end
      end
      
      class UnmergeTableCellsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :table_range, as: 'tableRange', class: Google::Apis::DocsV1::TableRange, decorator: Google::Apis::DocsV1::TableRange::Representation
      
        end
      end
      
      class UpdateDocumentStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :document_style, as: 'documentStyle', class: Google::Apis::DocsV1::DocumentStyle, decorator: Google::Apis::DocsV1::DocumentStyle::Representation
      
          property :fields, as: 'fields'
        end
      end
      
      class UpdateParagraphStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :paragraph_style, as: 'paragraphStyle', class: Google::Apis::DocsV1::ParagraphStyle, decorator: Google::Apis::DocsV1::ParagraphStyle::Representation
      
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
        end
      end
      
      class UpdateTableCellStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :table_cell_style, as: 'tableCellStyle', class: Google::Apis::DocsV1::TableCellStyle, decorator: Google::Apis::DocsV1::TableCellStyle::Representation
      
          property :table_range, as: 'tableRange', class: Google::Apis::DocsV1::TableRange, decorator: Google::Apis::DocsV1::TableRange::Representation
      
          property :table_start_location, as: 'tableStartLocation', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
        end
      end
      
      class UpdateTableColumnPropertiesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_indices, as: 'columnIndices'
          property :fields, as: 'fields'
          property :table_column_properties, as: 'tableColumnProperties', class: Google::Apis::DocsV1::TableColumnProperties, decorator: Google::Apis::DocsV1::TableColumnProperties::Representation
      
          property :table_start_location, as: 'tableStartLocation', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
        end
      end
      
      class UpdateTableRowStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          collection :row_indices, as: 'rowIndices'
          property :table_row_style, as: 'tableRowStyle', class: Google::Apis::DocsV1::TableRowStyle, decorator: Google::Apis::DocsV1::TableRowStyle::Representation
      
          property :table_start_location, as: 'tableStartLocation', class: Google::Apis::DocsV1::Location, decorator: Google::Apis::DocsV1::Location::Representation
      
        end
      end
      
      class UpdateTextStyleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fields, as: 'fields'
          property :range, as: 'range', class: Google::Apis::DocsV1::Range, decorator: Google::Apis::DocsV1::Range::Representation
      
          property :text_style, as: 'textStyle', class: Google::Apis::DocsV1::TextStyle, decorator: Google::Apis::DocsV1::TextStyle::Representation
      
        end
      end
      
      class WeightedFontFamily
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :font_family, as: 'fontFamily'
          property :weight, as: 'weight'
        end
      end
      
      class WriteControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :required_revision_id, as: 'requiredRevisionId'
          property :target_revision_id, as: 'targetRevisionId'
        end
      end
    end
  end
end
