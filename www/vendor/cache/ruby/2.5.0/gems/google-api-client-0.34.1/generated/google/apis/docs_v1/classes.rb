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
      
      # A ParagraphElement representing a
      # spot in the text that is dynamically replaced with content that can change
      # over time, like a page number.
      class AutoText
        include Google::Apis::Core::Hashable
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. An AutoText
        # may have multiple insertion IDs if it is a nested suggested change. If
        # empty, then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this AutoText, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        # The type of this auto text.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents the background of a document.
      class Background
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
        end
      end
      
      # A mask that indicates which of the fields on the base Background have been
      # changed in this suggestion.
      # For any field set to true, the Backgound has a new suggested value.
      class BackgroundSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates whether the current background color has been modified in this
        # suggestion.
        # Corresponds to the JSON property `backgroundColorSuggested`
        # @return [Boolean]
        attr_accessor :background_color_suggested
        alias_method :background_color_suggested?, :background_color_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color_suggested = args[:background_color_suggested] if args.key?(:background_color_suggested)
        end
      end
      
      # Request message for BatchUpdateDocument.
      class BatchUpdateDocumentRequest
        include Google::Apis::Core::Hashable
      
        # A list of updates to apply to the document.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::DocsV1::Request>]
        attr_accessor :requests
      
        # Provides control over how write requests are executed.
        # Corresponds to the JSON property `writeControl`
        # @return [Google::Apis::DocsV1::WriteControl]
        attr_accessor :write_control
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requests = args[:requests] if args.key?(:requests)
          @write_control = args[:write_control] if args.key?(:write_control)
        end
      end
      
      # Response message from a BatchUpdateDocument request.
      class BatchUpdateDocumentResponse
        include Google::Apis::Core::Hashable
      
        # The ID of the document to which the updates were applied to.
        # Corresponds to the JSON property `documentId`
        # @return [String]
        attr_accessor :document_id
      
        # The reply of the updates. This maps 1:1 with the updates, although replies
        # to some requests may be empty.
        # Corresponds to the JSON property `replies`
        # @return [Array<Google::Apis::DocsV1::Response>]
        attr_accessor :replies
      
        # Provides control over how write requests are executed.
        # Corresponds to the JSON property `writeControl`
        # @return [Google::Apis::DocsV1::WriteControl]
        attr_accessor :write_control
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_id = args[:document_id] if args.key?(:document_id)
          @replies = args[:replies] if args.key?(:replies)
          @write_control = args[:write_control] if args.key?(:write_control)
        end
      end
      
      # The document body.
      # The body typically contains the full document contents except for
      # headers, footers
      # and footnotes.
      class Body
        include Google::Apis::Core::Hashable
      
        # The contents of the body.
        # The indexes for the body's content begin at zero.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
        end
      end
      
      # Describes the bullet of a paragraph.
      class Bullet
        include Google::Apis::Core::Hashable
      
        # The ID of the list this paragraph belongs to.
        # Corresponds to the JSON property `listId`
        # @return [String]
        attr_accessor :list_id
      
        # The nesting level of this paragraph in the list.
        # Corresponds to the JSON property `nestingLevel`
        # @return [Fixnum]
        attr_accessor :nesting_level
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_id = args[:list_id] if args.key?(:list_id)
          @nesting_level = args[:nesting_level] if args.key?(:nesting_level)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # Bullet have been changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class BulletSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to the
        # list_id.
        # Corresponds to the JSON property `listIdSuggested`
        # @return [Boolean]
        attr_accessor :list_id_suggested
        alias_method :list_id_suggested?, :list_id_suggested
      
        # Indicates if there was a suggested change to the
        # nesting_level.
        # Corresponds to the JSON property `nestingLevelSuggested`
        # @return [Boolean]
        attr_accessor :nesting_level_suggested
        alias_method :nesting_level_suggested?, :nesting_level_suggested
      
        # A mask that indicates which of the fields on the base TextStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `textStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TextStyleSuggestionState]
        attr_accessor :text_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_id_suggested = args[:list_id_suggested] if args.key?(:list_id_suggested)
          @nesting_level_suggested = args[:nesting_level_suggested] if args.key?(:nesting_level_suggested)
          @text_style_suggestion_state = args[:text_style_suggestion_state] if args.key?(:text_style_suggestion_state)
        end
      end
      
      # A solid color.
      class Color
        include Google::Apis::Core::Hashable
      
        # An RGB color.
        # Corresponds to the JSON property `rgbColor`
        # @return [Google::Apis::DocsV1::RgbColor]
        attr_accessor :rgb_color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rgb_color = args[:rgb_color] if args.key?(:rgb_color)
        end
      end
      
      # A ParagraphElement representing a
      # column break. A column break makes the subsequent text start at the top of
      # the next column.
      class ColumnBreak
        include Google::Apis::Core::Hashable
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A ColumnBreak may have multiple insertion IDs if
        # it is
        # a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this ColumnBreak, keyed by suggestion
        # ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # Creates a Footer. The new footer will be
      # applied to SectionStyle or the
      # DocumentStyle.
      # If a footer of the specified type already exists then a 400 bad request error
      # will be returned.
      class CreateFooterRequest
        include Google::Apis::Core::Hashable
      
        # The type of footer to create.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The result of creating a footer.
      class CreateFooterResponse
        include Google::Apis::Core::Hashable
      
        # The ID of the created footer.
        # Corresponds to the JSON property `footerId`
        # @return [String]
        attr_accessor :footer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @footer_id = args[:footer_id] if args.key?(:footer_id)
        end
      end
      
      # Creates a Header. The new header will be
      # applied to SectionStyle or the
      # DocumentStyle.
      # If a header of the specified type already exists then a 400 bad request error
      # will be returned.
      class CreateHeaderRequest
        include Google::Apis::Core::Hashable
      
        # The type of header to create.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The result of creating a header.
      class CreateHeaderResponse
        include Google::Apis::Core::Hashable
      
        # The ID of the created header.
        # Corresponds to the JSON property `headerId`
        # @return [String]
        attr_accessor :header_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @header_id = args[:header_id] if args.key?(:header_id)
        end
      end
      
      # Creates a NamedRange referencing the given
      # range.
      class CreateNamedRangeRequest
        include Google::Apis::Core::Hashable
      
        # The name of the NamedRange. Names do not need to be unique.
        # Names must be at least 1 character and no more than 256 characters,
        # measured in UTF-16 code units.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # The result of creating a named range.
      class CreateNamedRangeResponse
        include Google::Apis::Core::Hashable
      
        # The ID of the created named range.
        # Corresponds to the JSON property `namedRangeId`
        # @return [String]
        attr_accessor :named_range_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @named_range_id = args[:named_range_id] if args.key?(:named_range_id)
        end
      end
      
      # Creates bullets for all of the paragraphs that overlap with the given range.
      # The nesting level of each paragraph will be determined by counting leading
      # tabs in front of each paragraph. To avoid excess space between the bullet and
      # the corresponding paragraph, these leading tabs are removed by this request.
      # This may change the indices of parts of the text.
      # If the paragraph immediately before paragraphs being updated is in a list
      # with a matching preset, the paragraphs being updated are added to that
      # preceding list.
      class CreateParagraphBulletsRequest
        include Google::Apis::Core::Hashable
      
        # The kinds of bullet glyphs to be used.
        # Corresponds to the JSON property `bulletPreset`
        # @return [String]
        attr_accessor :bullet_preset
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bullet_preset = args[:bullet_preset] if args.key?(:bullet_preset)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # The crop properties of an image.
      # The crop rectangle is represented using fractional offsets from the original
      # content's four edges.
      # - If the offset is in the interval (0, 1), the corresponding edge of crop
      # rectangle is positioned inside of the image's original bounding rectangle.
      # - If the offset is negative or greater than 1, the corresponding edge of crop
      # rectangle is positioned outside of the image's original bounding rectangle.
      # - If all offsets and rotation angle are 0, the image is not cropped.
      class CropProperties
        include Google::Apis::Core::Hashable
      
        # The clockwise rotation angle of the crop rectangle around its center, in
        # radians. Rotation is applied after the offsets.
        # Corresponds to the JSON property `angle`
        # @return [Float]
        attr_accessor :angle
      
        # The offset specifies how far inwards the bottom edge of the crop rectangle
        # is from the bottom edge of the original content as a fraction of the
        # original content's height.
        # Corresponds to the JSON property `offsetBottom`
        # @return [Float]
        attr_accessor :offset_bottom
      
        # The offset specifies how far inwards the left edge of the crop rectangle is
        # from the left edge of the original content as a fraction of the original
        # content's width.
        # Corresponds to the JSON property `offsetLeft`
        # @return [Float]
        attr_accessor :offset_left
      
        # The offset specifies how far inwards the right edge of the crop rectangle
        # is from the right edge of the original content as a fraction of the
        # original content's width.
        # Corresponds to the JSON property `offsetRight`
        # @return [Float]
        attr_accessor :offset_right
      
        # The offset specifies how far inwards the top edge of the crop rectangle is
        # from the top edge of the original content as a fraction of the original
        # content's height.
        # Corresponds to the JSON property `offsetTop`
        # @return [Float]
        attr_accessor :offset_top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @angle = args[:angle] if args.key?(:angle)
          @offset_bottom = args[:offset_bottom] if args.key?(:offset_bottom)
          @offset_left = args[:offset_left] if args.key?(:offset_left)
          @offset_right = args[:offset_right] if args.key?(:offset_right)
          @offset_top = args[:offset_top] if args.key?(:offset_top)
        end
      end
      
      # A mask that indicates which of the fields on the base CropProperties have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class CropPropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to angle.
        # Corresponds to the JSON property `angleSuggested`
        # @return [Boolean]
        attr_accessor :angle_suggested
        alias_method :angle_suggested?, :angle_suggested
      
        # Indicates if there was a suggested change to offset_bottom.
        # Corresponds to the JSON property `offsetBottomSuggested`
        # @return [Boolean]
        attr_accessor :offset_bottom_suggested
        alias_method :offset_bottom_suggested?, :offset_bottom_suggested
      
        # Indicates if there was a suggested change to offset_left.
        # Corresponds to the JSON property `offsetLeftSuggested`
        # @return [Boolean]
        attr_accessor :offset_left_suggested
        alias_method :offset_left_suggested?, :offset_left_suggested
      
        # Indicates if there was a suggested change to offset_right.
        # Corresponds to the JSON property `offsetRightSuggested`
        # @return [Boolean]
        attr_accessor :offset_right_suggested
        alias_method :offset_right_suggested?, :offset_right_suggested
      
        # Indicates if there was a suggested change to offset_top.
        # Corresponds to the JSON property `offsetTopSuggested`
        # @return [Boolean]
        attr_accessor :offset_top_suggested
        alias_method :offset_top_suggested?, :offset_top_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @angle_suggested = args[:angle_suggested] if args.key?(:angle_suggested)
          @offset_bottom_suggested = args[:offset_bottom_suggested] if args.key?(:offset_bottom_suggested)
          @offset_left_suggested = args[:offset_left_suggested] if args.key?(:offset_left_suggested)
          @offset_right_suggested = args[:offset_right_suggested] if args.key?(:offset_right_suggested)
          @offset_top_suggested = args[:offset_top_suggested] if args.key?(:offset_top_suggested)
        end
      end
      
      # Deletes content from the document.
      class DeleteContentRangeRequest
        include Google::Apis::Core::Hashable
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # Deletes a NamedRange.
      class DeleteNamedRangeRequest
        include Google::Apis::Core::Hashable
      
        # The name of the range(s) to delete. All named ranges with the given
        # name will be deleted.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID of the named range to delete.
        # Corresponds to the JSON property `namedRangeId`
        # @return [String]
        attr_accessor :named_range_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @named_range_id = args[:named_range_id] if args.key?(:named_range_id)
        end
      end
      
      # Deletes bullets from all of the paragraphs that overlap with the given range.
      # The nesting level of each paragraph will be visually preserved by adding
      # indent to the start of the corresponding paragraph.
      class DeleteParagraphBulletsRequest
        include Google::Apis::Core::Hashable
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # Deletes a PositionedObject from the
      # document.
      class DeletePositionedObjectRequest
        include Google::Apis::Core::Hashable
      
        # The ID of the positioned object to delete.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
        end
      end
      
      # Deletes a column from a table.
      class DeleteTableColumnRequest
        include Google::Apis::Core::Hashable
      
        # Location of a single cell within a table.
        # Corresponds to the JSON property `tableCellLocation`
        # @return [Google::Apis::DocsV1::TableCellLocation]
        attr_accessor :table_cell_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_cell_location = args[:table_cell_location] if args.key?(:table_cell_location)
        end
      end
      
      # Deletes a row from a table.
      class DeleteTableRowRequest
        include Google::Apis::Core::Hashable
      
        # Location of a single cell within a table.
        # Corresponds to the JSON property `tableCellLocation`
        # @return [Google::Apis::DocsV1::TableCellLocation]
        attr_accessor :table_cell_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_cell_location = args[:table_cell_location] if args.key?(:table_cell_location)
        end
      end
      
      # A magnitude in a single direction in the specified units.
      class Dimension
        include Google::Apis::Core::Hashable
      
        # The magnitude.
        # Corresponds to the JSON property `magnitude`
        # @return [Float]
        attr_accessor :magnitude
      
        # The units for magnitude.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @magnitude = args[:magnitude] if args.key?(:magnitude)
          @unit = args[:unit] if args.key?(:unit)
        end
      end
      
      # A Google Docs document.
      class Document
        include Google::Apis::Core::Hashable
      
        # The document body.
        # The body typically contains the full document contents except for
        # headers, footers
        # and footnotes.
        # Corresponds to the JSON property `body`
        # @return [Google::Apis::DocsV1::Body]
        attr_accessor :body
      
        # Output only. The ID of the document.
        # Corresponds to the JSON property `documentId`
        # @return [String]
        attr_accessor :document_id
      
        # The style of the document.
        # Corresponds to the JSON property `documentStyle`
        # @return [Google::Apis::DocsV1::DocumentStyle]
        attr_accessor :document_style
      
        # Output only. The footers in the document, keyed by footer ID.
        # Corresponds to the JSON property `footers`
        # @return [Hash<String,Google::Apis::DocsV1::Footer>]
        attr_accessor :footers
      
        # Output only. The footnotes in the document, keyed by footnote ID.
        # Corresponds to the JSON property `footnotes`
        # @return [Hash<String,Google::Apis::DocsV1::Footnote>]
        attr_accessor :footnotes
      
        # Output only. The headers in the document, keyed by header ID.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,Google::Apis::DocsV1::Header>]
        attr_accessor :headers
      
        # Output only. The inline objects in the document, keyed by object ID.
        # Corresponds to the JSON property `inlineObjects`
        # @return [Hash<String,Google::Apis::DocsV1::InlineObject>]
        attr_accessor :inline_objects
      
        # Output only. The lists in the document, keyed by list ID.
        # Corresponds to the JSON property `lists`
        # @return [Hash<String,Google::Apis::DocsV1::List>]
        attr_accessor :lists
      
        # Output only. The named ranges in the document, keyed by name.
        # Corresponds to the JSON property `namedRanges`
        # @return [Hash<String,Google::Apis::DocsV1::NamedRanges>]
        attr_accessor :named_ranges
      
        # The named styles. Paragraphs in the document can inherit their
        # TextStyle and
        # ParagraphStyle from these named styles.
        # Corresponds to the JSON property `namedStyles`
        # @return [Google::Apis::DocsV1::NamedStyles]
        attr_accessor :named_styles
      
        # Output only. The positioned objects in the document, keyed by object ID.
        # Corresponds to the JSON property `positionedObjects`
        # @return [Hash<String,Google::Apis::DocsV1::PositionedObject>]
        attr_accessor :positioned_objects
      
        # Output only. The revision ID of the document. Can be used in update
        # requests to specify which revision of a document to apply updates to and
        # how the request should behave if the document has been edited since that
        # revision. Only populated if the user has edit access to the document.
        # The format of the revision ID may change over time, so it should be treated
        # opaquely. A returned revision ID is only guaranteed to be valid for 24
        # hours after it has been returned and cannot be shared across users. If the
        # revision ID is unchanged between calls, then the document has not changed.
        # Conversely, a changed ID (for the same document and user) usually means the
        # document has been updated; however, a changed ID can also be due to
        # internal factors such as ID format changes.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        # Output only. The suggested changes to the style of the document, keyed by
        # suggestion ID.
        # Corresponds to the JSON property `suggestedDocumentStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedDocumentStyle>]
        attr_accessor :suggested_document_style_changes
      
        # Output only. The suggested changes to the named styles of the document,
        # keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedNamedStylesChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedNamedStyles>]
        attr_accessor :suggested_named_styles_changes
      
        # Output only. The suggestions view mode applied to the document.
        # Note: When editing a document, changes must be based on a document with
        # SUGGESTIONS_INLINE.
        # Corresponds to the JSON property `suggestionsViewMode`
        # @return [String]
        attr_accessor :suggestions_view_mode
      
        # The title of the document.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @document_id = args[:document_id] if args.key?(:document_id)
          @document_style = args[:document_style] if args.key?(:document_style)
          @footers = args[:footers] if args.key?(:footers)
          @footnotes = args[:footnotes] if args.key?(:footnotes)
          @headers = args[:headers] if args.key?(:headers)
          @inline_objects = args[:inline_objects] if args.key?(:inline_objects)
          @lists = args[:lists] if args.key?(:lists)
          @named_ranges = args[:named_ranges] if args.key?(:named_ranges)
          @named_styles = args[:named_styles] if args.key?(:named_styles)
          @positioned_objects = args[:positioned_objects] if args.key?(:positioned_objects)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
          @suggested_document_style_changes = args[:suggested_document_style_changes] if args.key?(:suggested_document_style_changes)
          @suggested_named_styles_changes = args[:suggested_named_styles_changes] if args.key?(:suggested_named_styles_changes)
          @suggestions_view_mode = args[:suggestions_view_mode] if args.key?(:suggestions_view_mode)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # The style of the document.
      class DocumentStyle
        include Google::Apis::Core::Hashable
      
        # Represents the background of a document.
        # Corresponds to the JSON property `background`
        # @return [Google::Apis::DocsV1::Background]
        attr_accessor :background
      
        # The ID of the default footer. If not set, there is no default footer.
        # This property is read-only.
        # Corresponds to the JSON property `defaultFooterId`
        # @return [String]
        attr_accessor :default_footer_id
      
        # The ID of the default header. If not set, there is no default header.
        # This property is read-only.
        # Corresponds to the JSON property `defaultHeaderId`
        # @return [String]
        attr_accessor :default_header_id
      
        # The ID of the footer used only for even pages. The value of
        # use_even_page_header_footer determines
        # whether to use the default_footer_id or this value for the
        # footer on even pages. If not set, there is no even page footer.
        # This property is read-only.
        # Corresponds to the JSON property `evenPageFooterId`
        # @return [String]
        attr_accessor :even_page_footer_id
      
        # The ID of the header used only for even pages. The value of
        # use_even_page_header_footer determines
        # whether to use the default_header_id or this value for the
        # header on even pages. If not set, there is no even page header.
        # This property is read-only.
        # Corresponds to the JSON property `evenPageHeaderId`
        # @return [String]
        attr_accessor :even_page_header_id
      
        # The ID of the footer used only for the first page. If not set then
        # a unique footer for the first page does not exist. The value of
        # use_first_page_header_footer determines
        # whether to use the default_footer_id or this value for the
        # footer on the first page. If not set, there is no first page footer.
        # This property is read-only.
        # Corresponds to the JSON property `firstPageFooterId`
        # @return [String]
        attr_accessor :first_page_footer_id
      
        # The ID of the header used only for the first page. If not set then
        # a unique header for the first page does not exist.
        # The value of use_first_page_header_footer determines
        # whether to use the default_header_id or this value for the
        # header on the first page. If not set, there is no first page header.
        # This property is read-only.
        # Corresponds to the JSON property `firstPageHeaderId`
        # @return [String]
        attr_accessor :first_page_header_id
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginBottom`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_bottom
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginLeft`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_left
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginRight`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_right
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginTop`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_top
      
        # The page number from which to start counting the number of pages.
        # Corresponds to the JSON property `pageNumberStart`
        # @return [Fixnum]
        attr_accessor :page_number_start
      
        # A width and height.
        # Corresponds to the JSON property `pageSize`
        # @return [Google::Apis::DocsV1::Size]
        attr_accessor :page_size
      
        # Indicates whether to use the even page header / footer IDs for the even
        # pages.
        # This property is read-only.
        # Corresponds to the JSON property `useEvenPageHeaderFooter`
        # @return [Boolean]
        attr_accessor :use_even_page_header_footer
        alias_method :use_even_page_header_footer?, :use_even_page_header_footer
      
        # Indicates whether to use the first page header / footer IDs for the first
        # page.
        # This property is read-only.
        # Corresponds to the JSON property `useFirstPageHeaderFooter`
        # @return [Boolean]
        attr_accessor :use_first_page_header_footer
        alias_method :use_first_page_header_footer?, :use_first_page_header_footer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background = args[:background] if args.key?(:background)
          @default_footer_id = args[:default_footer_id] if args.key?(:default_footer_id)
          @default_header_id = args[:default_header_id] if args.key?(:default_header_id)
          @even_page_footer_id = args[:even_page_footer_id] if args.key?(:even_page_footer_id)
          @even_page_header_id = args[:even_page_header_id] if args.key?(:even_page_header_id)
          @first_page_footer_id = args[:first_page_footer_id] if args.key?(:first_page_footer_id)
          @first_page_header_id = args[:first_page_header_id] if args.key?(:first_page_header_id)
          @margin_bottom = args[:margin_bottom] if args.key?(:margin_bottom)
          @margin_left = args[:margin_left] if args.key?(:margin_left)
          @margin_right = args[:margin_right] if args.key?(:margin_right)
          @margin_top = args[:margin_top] if args.key?(:margin_top)
          @page_number_start = args[:page_number_start] if args.key?(:page_number_start)
          @page_size = args[:page_size] if args.key?(:page_size)
          @use_even_page_header_footer = args[:use_even_page_header_footer] if args.key?(:use_even_page_header_footer)
          @use_first_page_header_footer = args[:use_first_page_header_footer] if args.key?(:use_first_page_header_footer)
        end
      end
      
      # A mask that indicates which of the fields on the base DocumentStyle have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class DocumentStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the base Background have been
        # changed in this suggestion.
        # For any field set to true, the Backgound has a new suggested value.
        # Corresponds to the JSON property `backgroundSuggestionState`
        # @return [Google::Apis::DocsV1::BackgroundSuggestionState]
        attr_accessor :background_suggestion_state
      
        # Indicates if there was a suggested change to default_footer_id.
        # Corresponds to the JSON property `defaultFooterIdSuggested`
        # @return [Boolean]
        attr_accessor :default_footer_id_suggested
        alias_method :default_footer_id_suggested?, :default_footer_id_suggested
      
        # Indicates if there was a suggested change to default_header_id.
        # Corresponds to the JSON property `defaultHeaderIdSuggested`
        # @return [Boolean]
        attr_accessor :default_header_id_suggested
        alias_method :default_header_id_suggested?, :default_header_id_suggested
      
        # Indicates if there was a suggested change to even_page_footer_id.
        # Corresponds to the JSON property `evenPageFooterIdSuggested`
        # @return [Boolean]
        attr_accessor :even_page_footer_id_suggested
        alias_method :even_page_footer_id_suggested?, :even_page_footer_id_suggested
      
        # Indicates if there was a suggested change to even_page_header_id.
        # Corresponds to the JSON property `evenPageHeaderIdSuggested`
        # @return [Boolean]
        attr_accessor :even_page_header_id_suggested
        alias_method :even_page_header_id_suggested?, :even_page_header_id_suggested
      
        # Indicates if there was a suggested change to first_page_footer_id.
        # Corresponds to the JSON property `firstPageFooterIdSuggested`
        # @return [Boolean]
        attr_accessor :first_page_footer_id_suggested
        alias_method :first_page_footer_id_suggested?, :first_page_footer_id_suggested
      
        # Indicates if there was a suggested change to first_page_header_id.
        # Corresponds to the JSON property `firstPageHeaderIdSuggested`
        # @return [Boolean]
        attr_accessor :first_page_header_id_suggested
        alias_method :first_page_header_id_suggested?, :first_page_header_id_suggested
      
        # Indicates if there was a suggested change to margin_bottom.
        # Corresponds to the JSON property `marginBottomSuggested`
        # @return [Boolean]
        attr_accessor :margin_bottom_suggested
        alias_method :margin_bottom_suggested?, :margin_bottom_suggested
      
        # Indicates if there was a suggested change to margin_left.
        # Corresponds to the JSON property `marginLeftSuggested`
        # @return [Boolean]
        attr_accessor :margin_left_suggested
        alias_method :margin_left_suggested?, :margin_left_suggested
      
        # Indicates if there was a suggested change to margin_right.
        # Corresponds to the JSON property `marginRightSuggested`
        # @return [Boolean]
        attr_accessor :margin_right_suggested
        alias_method :margin_right_suggested?, :margin_right_suggested
      
        # Indicates if there was a suggested change to margin_top.
        # Corresponds to the JSON property `marginTopSuggested`
        # @return [Boolean]
        attr_accessor :margin_top_suggested
        alias_method :margin_top_suggested?, :margin_top_suggested
      
        # Indicates if there was a suggested change to page_number_start.
        # Corresponds to the JSON property `pageNumberStartSuggested`
        # @return [Boolean]
        attr_accessor :page_number_start_suggested
        alias_method :page_number_start_suggested?, :page_number_start_suggested
      
        # A mask that indicates which of the fields on the base Size have been changed
        # in this suggestion.
        # For any field set to true, the Size has
        # a new suggested value.
        # Corresponds to the JSON property `pageSizeSuggestionState`
        # @return [Google::Apis::DocsV1::SizeSuggestionState]
        attr_accessor :page_size_suggestion_state
      
        # Indicates if there was a suggested change to use_even_page_header_footer.
        # Corresponds to the JSON property `useEvenPageHeaderFooterSuggested`
        # @return [Boolean]
        attr_accessor :use_even_page_header_footer_suggested
        alias_method :use_even_page_header_footer_suggested?, :use_even_page_header_footer_suggested
      
        # Indicates if there was a suggested change to use_first_page_header_footer.
        # Corresponds to the JSON property `useFirstPageHeaderFooterSuggested`
        # @return [Boolean]
        attr_accessor :use_first_page_header_footer_suggested
        alias_method :use_first_page_header_footer_suggested?, :use_first_page_header_footer_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_suggestion_state = args[:background_suggestion_state] if args.key?(:background_suggestion_state)
          @default_footer_id_suggested = args[:default_footer_id_suggested] if args.key?(:default_footer_id_suggested)
          @default_header_id_suggested = args[:default_header_id_suggested] if args.key?(:default_header_id_suggested)
          @even_page_footer_id_suggested = args[:even_page_footer_id_suggested] if args.key?(:even_page_footer_id_suggested)
          @even_page_header_id_suggested = args[:even_page_header_id_suggested] if args.key?(:even_page_header_id_suggested)
          @first_page_footer_id_suggested = args[:first_page_footer_id_suggested] if args.key?(:first_page_footer_id_suggested)
          @first_page_header_id_suggested = args[:first_page_header_id_suggested] if args.key?(:first_page_header_id_suggested)
          @margin_bottom_suggested = args[:margin_bottom_suggested] if args.key?(:margin_bottom_suggested)
          @margin_left_suggested = args[:margin_left_suggested] if args.key?(:margin_left_suggested)
          @margin_right_suggested = args[:margin_right_suggested] if args.key?(:margin_right_suggested)
          @margin_top_suggested = args[:margin_top_suggested] if args.key?(:margin_top_suggested)
          @page_number_start_suggested = args[:page_number_start_suggested] if args.key?(:page_number_start_suggested)
          @page_size_suggestion_state = args[:page_size_suggestion_state] if args.key?(:page_size_suggestion_state)
          @use_even_page_header_footer_suggested = args[:use_even_page_header_footer_suggested] if args.key?(:use_even_page_header_footer_suggested)
          @use_first_page_header_footer_suggested = args[:use_first_page_header_footer_suggested] if args.key?(:use_first_page_header_footer_suggested)
        end
      end
      
      # The properties of an embedded drawing.
      class EmbeddedDrawingProperties
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # EmbeddedDrawingProperties
      # have been changed in this suggestion. For any field set to true, there is a
      # new suggested value.
      class EmbeddedDrawingPropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An embedded object in the document.
      class EmbeddedObject
        include Google::Apis::Core::Hashable
      
        # The description of the embedded object. The `title` and `description` are
        # both combined to display alt text.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The properties of an embedded drawing.
        # Corresponds to the JSON property `embeddedDrawingProperties`
        # @return [Google::Apis::DocsV1::EmbeddedDrawingProperties]
        attr_accessor :embedded_drawing_properties
      
        # A border around an EmbeddedObject.
        # Corresponds to the JSON property `embeddedObjectBorder`
        # @return [Google::Apis::DocsV1::EmbeddedObjectBorder]
        attr_accessor :embedded_object_border
      
        # The properties of an image.
        # Corresponds to the JSON property `imageProperties`
        # @return [Google::Apis::DocsV1::ImageProperties]
        attr_accessor :image_properties
      
        # A reference to the external linked source content.
        # Corresponds to the JSON property `linkedContentReference`
        # @return [Google::Apis::DocsV1::LinkedContentReference]
        attr_accessor :linked_content_reference
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginBottom`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_bottom
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginLeft`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_left
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginRight`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_right
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `marginTop`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :margin_top
      
        # A width and height.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::DocsV1::Size]
        attr_accessor :size
      
        # The title of the embedded object. The `title` and `description` are both
        # combined to display alt text.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @embedded_drawing_properties = args[:embedded_drawing_properties] if args.key?(:embedded_drawing_properties)
          @embedded_object_border = args[:embedded_object_border] if args.key?(:embedded_object_border)
          @image_properties = args[:image_properties] if args.key?(:image_properties)
          @linked_content_reference = args[:linked_content_reference] if args.key?(:linked_content_reference)
          @margin_bottom = args[:margin_bottom] if args.key?(:margin_bottom)
          @margin_left = args[:margin_left] if args.key?(:margin_left)
          @margin_right = args[:margin_right] if args.key?(:margin_right)
          @margin_top = args[:margin_top] if args.key?(:margin_top)
          @size = args[:size] if args.key?(:size)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A border around an EmbeddedObject.
      class EmbeddedObjectBorder
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :color
      
        # The dash style of the border.
        # Corresponds to the JSON property `dashStyle`
        # @return [String]
        attr_accessor :dash_style
      
        # The property state of the border property.
        # Corresponds to the JSON property `propertyState`
        # @return [String]
        attr_accessor :property_state
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @dash_style = args[:dash_style] if args.key?(:dash_style)
          @property_state = args[:property_state] if args.key?(:property_state)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # A mask that indicates which of the fields on the base EmbeddedObjectBorder
      # have been changed in this
      # suggestion. For any field set to true, there is a new suggested value.
      class EmbeddedObjectBorderSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to color.
        # Corresponds to the JSON property `colorSuggested`
        # @return [Boolean]
        attr_accessor :color_suggested
        alias_method :color_suggested?, :color_suggested
      
        # Indicates if there was a suggested change to dash_style.
        # Corresponds to the JSON property `dashStyleSuggested`
        # @return [Boolean]
        attr_accessor :dash_style_suggested
        alias_method :dash_style_suggested?, :dash_style_suggested
      
        # Indicates if there was a suggested change to property_state.
        # Corresponds to the JSON property `propertyStateSuggested`
        # @return [Boolean]
        attr_accessor :property_state_suggested
        alias_method :property_state_suggested?, :property_state_suggested
      
        # Indicates if there was a suggested change to width.
        # Corresponds to the JSON property `widthSuggested`
        # @return [Boolean]
        attr_accessor :width_suggested
        alias_method :width_suggested?, :width_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color_suggested = args[:color_suggested] if args.key?(:color_suggested)
          @dash_style_suggested = args[:dash_style_suggested] if args.key?(:dash_style_suggested)
          @property_state_suggested = args[:property_state_suggested] if args.key?(:property_state_suggested)
          @width_suggested = args[:width_suggested] if args.key?(:width_suggested)
        end
      end
      
      # A mask that indicates which of the fields on the base EmbeddedObject have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class EmbeddedObjectSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to description.
        # Corresponds to the JSON property `descriptionSuggested`
        # @return [Boolean]
        attr_accessor :description_suggested
        alias_method :description_suggested?, :description_suggested
      
        # A mask that indicates which of the fields on the base
        # EmbeddedDrawingProperties
        # have been changed in this suggestion. For any field set to true, there is a
        # new suggested value.
        # Corresponds to the JSON property `embeddedDrawingPropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::EmbeddedDrawingPropertiesSuggestionState]
        attr_accessor :embedded_drawing_properties_suggestion_state
      
        # A mask that indicates which of the fields on the base EmbeddedObjectBorder
        # have been changed in this
        # suggestion. For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `embeddedObjectBorderSuggestionState`
        # @return [Google::Apis::DocsV1::EmbeddedObjectBorderSuggestionState]
        attr_accessor :embedded_object_border_suggestion_state
      
        # A mask that indicates which of the fields on the base ImageProperties have
        # been changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `imagePropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::ImagePropertiesSuggestionState]
        attr_accessor :image_properties_suggestion_state
      
        # A mask that indicates which of the fields on the base
        # LinkedContentReference have
        # been changed in this suggestion. For any field set to true, there is a new
        # suggested value.
        # Corresponds to the JSON property `linkedContentReferenceSuggestionState`
        # @return [Google::Apis::DocsV1::LinkedContentReferenceSuggestionState]
        attr_accessor :linked_content_reference_suggestion_state
      
        # Indicates if there was a suggested change to margin_bottom.
        # Corresponds to the JSON property `marginBottomSuggested`
        # @return [Boolean]
        attr_accessor :margin_bottom_suggested
        alias_method :margin_bottom_suggested?, :margin_bottom_suggested
      
        # Indicates if there was a suggested change to margin_left.
        # Corresponds to the JSON property `marginLeftSuggested`
        # @return [Boolean]
        attr_accessor :margin_left_suggested
        alias_method :margin_left_suggested?, :margin_left_suggested
      
        # Indicates if there was a suggested change to margin_right.
        # Corresponds to the JSON property `marginRightSuggested`
        # @return [Boolean]
        attr_accessor :margin_right_suggested
        alias_method :margin_right_suggested?, :margin_right_suggested
      
        # Indicates if there was a suggested change to margin_top.
        # Corresponds to the JSON property `marginTopSuggested`
        # @return [Boolean]
        attr_accessor :margin_top_suggested
        alias_method :margin_top_suggested?, :margin_top_suggested
      
        # A mask that indicates which of the fields on the base Size have been changed
        # in this suggestion.
        # For any field set to true, the Size has
        # a new suggested value.
        # Corresponds to the JSON property `sizeSuggestionState`
        # @return [Google::Apis::DocsV1::SizeSuggestionState]
        attr_accessor :size_suggestion_state
      
        # Indicates if there was a suggested change to title.
        # Corresponds to the JSON property `titleSuggested`
        # @return [Boolean]
        attr_accessor :title_suggested
        alias_method :title_suggested?, :title_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description_suggested = args[:description_suggested] if args.key?(:description_suggested)
          @embedded_drawing_properties_suggestion_state = args[:embedded_drawing_properties_suggestion_state] if args.key?(:embedded_drawing_properties_suggestion_state)
          @embedded_object_border_suggestion_state = args[:embedded_object_border_suggestion_state] if args.key?(:embedded_object_border_suggestion_state)
          @image_properties_suggestion_state = args[:image_properties_suggestion_state] if args.key?(:image_properties_suggestion_state)
          @linked_content_reference_suggestion_state = args[:linked_content_reference_suggestion_state] if args.key?(:linked_content_reference_suggestion_state)
          @margin_bottom_suggested = args[:margin_bottom_suggested] if args.key?(:margin_bottom_suggested)
          @margin_left_suggested = args[:margin_left_suggested] if args.key?(:margin_left_suggested)
          @margin_right_suggested = args[:margin_right_suggested] if args.key?(:margin_right_suggested)
          @margin_top_suggested = args[:margin_top_suggested] if args.key?(:margin_top_suggested)
          @size_suggestion_state = args[:size_suggestion_state] if args.key?(:size_suggestion_state)
          @title_suggested = args[:title_suggested] if args.key?(:title_suggested)
        end
      end
      
      # Location at the end of a body, header, footer or footnote. The location is
      # immediately before the last newline in the document segment.
      class EndOfSegmentLocation
        include Google::Apis::Core::Hashable
      
        # The ID of the header, footer or footnote the location is in. An empty
        # segment ID signifies the document's body.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
        end
      end
      
      # A ParagraphElement representing an
      # equation.
      class Equation
        include Google::Apis::Core::Hashable
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A Equation
        # may have multiple insertion IDs if it is a nested suggested change. If
        # empty, then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
        end
      end
      
      # A document footer.
      class Footer
        include Google::Apis::Core::Hashable
      
        # The contents of the footer.
        # The indexes for a footer's content begin at zero.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        # The ID of the footer.
        # Corresponds to the JSON property `footerId`
        # @return [String]
        attr_accessor :footer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @footer_id = args[:footer_id] if args.key?(:footer_id)
        end
      end
      
      # A document footnote.
      class Footnote
        include Google::Apis::Core::Hashable
      
        # The contents of the footnote.
        # The indexes for a footnote's content begin at zero.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        # The ID of the footnote.
        # Corresponds to the JSON property `footnoteId`
        # @return [String]
        attr_accessor :footnote_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @footnote_id = args[:footnote_id] if args.key?(:footnote_id)
        end
      end
      
      # A ParagraphElement representing a
      # footnote reference. A footnote reference is the inline content rendered with
      # a number and is used to identify the footnote.
      class FootnoteReference
        include Google::Apis::Core::Hashable
      
        # The ID of the footnote that
        # contains the content of this footnote reference.
        # Corresponds to the JSON property `footnoteId`
        # @return [String]
        attr_accessor :footnote_id
      
        # The rendered number of this footnote.
        # Corresponds to the JSON property `footnoteNumber`
        # @return [String]
        attr_accessor :footnote_number
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A FootnoteReference may have multiple insertion
        # IDs if
        # it is a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this FootnoteReference, keyed by
        # suggestion ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @footnote_id = args[:footnote_id] if args.key?(:footnote_id)
          @footnote_number = args[:footnote_number] if args.key?(:footnote_number)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # A document header.
      class Header
        include Google::Apis::Core::Hashable
      
        # The contents of the header.
        # The indexes for a header's content begin at zero.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        # The ID of the header.
        # Corresponds to the JSON property `headerId`
        # @return [String]
        attr_accessor :header_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @header_id = args[:header_id] if args.key?(:header_id)
        end
      end
      
      # A ParagraphElement representing a
      # horizontal line.
      class HorizontalRule
        include Google::Apis::Core::Hashable
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A HorizontalRule may have multiple insertion IDs
        # if it
        # is a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this HorizontalRule, keyed by
        # suggestion ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # The properties of an image.
      class ImageProperties
        include Google::Apis::Core::Hashable
      
        # The clockwise rotation angle of the image, in radians.
        # Corresponds to the JSON property `angle`
        # @return [Float]
        attr_accessor :angle
      
        # The brightness effect of the image. The value should be in the interval
        # [-1.0, 1.0], where 0 means no effect.
        # Corresponds to the JSON property `brightness`
        # @return [Float]
        attr_accessor :brightness
      
        # A URI to the image with a default lifetime of 30 minutes.
        # This URI is tagged with the account of the requester. Anyone with the URI
        # effectively accesses the image as the original requester. Access to the
        # image may be lost if the document's sharing settings change.
        # Corresponds to the JSON property `contentUri`
        # @return [String]
        attr_accessor :content_uri
      
        # The contrast effect of the image. The value should be in the interval
        # [-1.0, 1.0], where 0 means no effect.
        # Corresponds to the JSON property `contrast`
        # @return [Float]
        attr_accessor :contrast
      
        # The crop properties of an image.
        # The crop rectangle is represented using fractional offsets from the original
        # content's four edges.
        # - If the offset is in the interval (0, 1), the corresponding edge of crop
        # rectangle is positioned inside of the image's original bounding rectangle.
        # - If the offset is negative or greater than 1, the corresponding edge of crop
        # rectangle is positioned outside of the image's original bounding rectangle.
        # - If all offsets and rotation angle are 0, the image is not cropped.
        # Corresponds to the JSON property `cropProperties`
        # @return [Google::Apis::DocsV1::CropProperties]
        attr_accessor :crop_properties
      
        # The source URI is the URI used to insert the image. The source URI can be
        # empty.
        # Corresponds to the JSON property `sourceUri`
        # @return [String]
        attr_accessor :source_uri
      
        # The transparency effect of the image. The value should be in the interval
        # [0.0, 1.0], where 0 means no effect and 1 means completely transparent.
        # Corresponds to the JSON property `transparency`
        # @return [Float]
        attr_accessor :transparency
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @angle = args[:angle] if args.key?(:angle)
          @brightness = args[:brightness] if args.key?(:brightness)
          @content_uri = args[:content_uri] if args.key?(:content_uri)
          @contrast = args[:contrast] if args.key?(:contrast)
          @crop_properties = args[:crop_properties] if args.key?(:crop_properties)
          @source_uri = args[:source_uri] if args.key?(:source_uri)
          @transparency = args[:transparency] if args.key?(:transparency)
        end
      end
      
      # A mask that indicates which of the fields on the base ImageProperties have
      # been changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class ImagePropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to angle.
        # Corresponds to the JSON property `angleSuggested`
        # @return [Boolean]
        attr_accessor :angle_suggested
        alias_method :angle_suggested?, :angle_suggested
      
        # Indicates if there was a suggested change to brightness.
        # Corresponds to the JSON property `brightnessSuggested`
        # @return [Boolean]
        attr_accessor :brightness_suggested
        alias_method :brightness_suggested?, :brightness_suggested
      
        # Indicates if there was a suggested change to
        # content_uri.
        # Corresponds to the JSON property `contentUriSuggested`
        # @return [Boolean]
        attr_accessor :content_uri_suggested
        alias_method :content_uri_suggested?, :content_uri_suggested
      
        # Indicates if there was a suggested change to contrast.
        # Corresponds to the JSON property `contrastSuggested`
        # @return [Boolean]
        attr_accessor :contrast_suggested
        alias_method :contrast_suggested?, :contrast_suggested
      
        # A mask that indicates which of the fields on the base CropProperties have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `cropPropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::CropPropertiesSuggestionState]
        attr_accessor :crop_properties_suggestion_state
      
        # Indicates if there was a suggested change to source_uri.
        # Corresponds to the JSON property `sourceUriSuggested`
        # @return [Boolean]
        attr_accessor :source_uri_suggested
        alias_method :source_uri_suggested?, :source_uri_suggested
      
        # Indicates if there was a suggested change to transparency.
        # Corresponds to the JSON property `transparencySuggested`
        # @return [Boolean]
        attr_accessor :transparency_suggested
        alias_method :transparency_suggested?, :transparency_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @angle_suggested = args[:angle_suggested] if args.key?(:angle_suggested)
          @brightness_suggested = args[:brightness_suggested] if args.key?(:brightness_suggested)
          @content_uri_suggested = args[:content_uri_suggested] if args.key?(:content_uri_suggested)
          @contrast_suggested = args[:contrast_suggested] if args.key?(:contrast_suggested)
          @crop_properties_suggestion_state = args[:crop_properties_suggestion_state] if args.key?(:crop_properties_suggestion_state)
          @source_uri_suggested = args[:source_uri_suggested] if args.key?(:source_uri_suggested)
          @transparency_suggested = args[:transparency_suggested] if args.key?(:transparency_suggested)
        end
      end
      
      # An object that appears inline with text. An InlineObject contains
      # an EmbeddedObject such as an image.
      class InlineObject
        include Google::Apis::Core::Hashable
      
        # Properties of an InlineObject.
        # Corresponds to the JSON property `inlineObjectProperties`
        # @return [Google::Apis::DocsV1::InlineObjectProperties]
        attr_accessor :inline_object_properties
      
        # The ID of this inline object.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested changes to the inline object properties, keyed by suggestion
        # ID.
        # Corresponds to the JSON property `suggestedInlineObjectPropertiesChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedInlineObjectProperties>]
        attr_accessor :suggested_inline_object_properties_changes
      
        # The suggested insertion ID. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionId`
        # @return [String]
        attr_accessor :suggested_insertion_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inline_object_properties = args[:inline_object_properties] if args.key?(:inline_object_properties)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_inline_object_properties_changes = args[:suggested_inline_object_properties_changes] if args.key?(:suggested_inline_object_properties_changes)
          @suggested_insertion_id = args[:suggested_insertion_id] if args.key?(:suggested_insertion_id)
        end
      end
      
      # A ParagraphElement that contains
      # an InlineObject.
      class InlineObjectElement
        include Google::Apis::Core::Hashable
      
        # The ID of the InlineObject this
        # element contains.
        # Corresponds to the JSON property `inlineObjectId`
        # @return [String]
        attr_accessor :inline_object_id
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. An InlineObjectElement may have multiple
        # insertion IDs
        # if it is a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this InlineObject, keyed by suggestion
        # ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inline_object_id = args[:inline_object_id] if args.key?(:inline_object_id)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # Properties of an InlineObject.
      class InlineObjectProperties
        include Google::Apis::Core::Hashable
      
        # An embedded object in the document.
        # Corresponds to the JSON property `embeddedObject`
        # @return [Google::Apis::DocsV1::EmbeddedObject]
        attr_accessor :embedded_object
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedded_object = args[:embedded_object] if args.key?(:embedded_object)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # InlineObjectProperties have
      # been changed in this suggestion. For any field set to true, there is a new
      # suggested value.
      class InlineObjectPropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the base EmbeddedObject have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `embeddedObjectSuggestionState`
        # @return [Google::Apis::DocsV1::EmbeddedObjectSuggestionState]
        attr_accessor :embedded_object_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedded_object_suggestion_state = args[:embedded_object_suggestion_state] if args.key?(:embedded_object_suggestion_state)
        end
      end
      
      # Inserts an InlineObject containing an
      # image at the given location.
      class InsertInlineImageRequest
        include Google::Apis::Core::Hashable
      
        # Location at the end of a body, header, footer or footnote. The location is
        # immediately before the last newline in the document segment.
        # Corresponds to the JSON property `endOfSegmentLocation`
        # @return [Google::Apis::DocsV1::EndOfSegmentLocation]
        attr_accessor :end_of_segment_location
      
        # A particular location in the document.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :location
      
        # A width and height.
        # Corresponds to the JSON property `objectSize`
        # @return [Google::Apis::DocsV1::Size]
        attr_accessor :object_size
      
        # The image URI.
        # The image is fetched once at insertion time and a copy is stored for
        # display inside the document. Images must be less than 50MB in size, cannot
        # exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format.
        # The provided URI can be at most 2 kB in length. The URI itself is saved
        # with the image, and exposed via the ImageProperties.content_uri field.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_of_segment_location = args[:end_of_segment_location] if args.key?(:end_of_segment_location)
          @location = args[:location] if args.key?(:location)
          @object_size = args[:object_size] if args.key?(:object_size)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The result of inserting an inline image.
      class InsertInlineImageResponse
        include Google::Apis::Core::Hashable
      
        # The ID of the created InlineObject.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
        end
      end
      
      # The result of inserting an embedded Google Sheets chart.
      class InsertInlineSheetsChartResponse
        include Google::Apis::Core::Hashable
      
        # The object ID of the inserted chart.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
        end
      end
      
      # Inserts a page break followed by a newline at the specified location.
      class InsertPageBreakRequest
        include Google::Apis::Core::Hashable
      
        # Location at the end of a body, header, footer or footnote. The location is
        # immediately before the last newline in the document segment.
        # Corresponds to the JSON property `endOfSegmentLocation`
        # @return [Google::Apis::DocsV1::EndOfSegmentLocation]
        attr_accessor :end_of_segment_location
      
        # A particular location in the document.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_of_segment_location = args[:end_of_segment_location] if args.key?(:end_of_segment_location)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Inserts an empty column into a table.
      class InsertTableColumnRequest
        include Google::Apis::Core::Hashable
      
        # Whether to insert new column to the right of the reference cell location.
        # - `True`: insert to the right.
        # - `False`: insert to the left.
        # Corresponds to the JSON property `insertRight`
        # @return [Boolean]
        attr_accessor :insert_right
        alias_method :insert_right?, :insert_right
      
        # Location of a single cell within a table.
        # Corresponds to the JSON property `tableCellLocation`
        # @return [Google::Apis::DocsV1::TableCellLocation]
        attr_accessor :table_cell_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @insert_right = args[:insert_right] if args.key?(:insert_right)
          @table_cell_location = args[:table_cell_location] if args.key?(:table_cell_location)
        end
      end
      
      # Inserts a table at the specified location.
      # A newline character will be inserted before the inserted table.
      class InsertTableRequest
        include Google::Apis::Core::Hashable
      
        # The number of columns in the table.
        # Corresponds to the JSON property `columns`
        # @return [Fixnum]
        attr_accessor :columns
      
        # Location at the end of a body, header, footer or footnote. The location is
        # immediately before the last newline in the document segment.
        # Corresponds to the JSON property `endOfSegmentLocation`
        # @return [Google::Apis::DocsV1::EndOfSegmentLocation]
        attr_accessor :end_of_segment_location
      
        # A particular location in the document.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :location
      
        # The number of rows in the table.
        # Corresponds to the JSON property `rows`
        # @return [Fixnum]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @end_of_segment_location = args[:end_of_segment_location] if args.key?(:end_of_segment_location)
          @location = args[:location] if args.key?(:location)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # Inserts an empty row into a table.
      class InsertTableRowRequest
        include Google::Apis::Core::Hashable
      
        # Whether to insert new row below the reference cell location.
        # - `True`: insert below the cell.
        # - `False`: insert above the cell.
        # Corresponds to the JSON property `insertBelow`
        # @return [Boolean]
        attr_accessor :insert_below
        alias_method :insert_below?, :insert_below
      
        # Location of a single cell within a table.
        # Corresponds to the JSON property `tableCellLocation`
        # @return [Google::Apis::DocsV1::TableCellLocation]
        attr_accessor :table_cell_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @insert_below = args[:insert_below] if args.key?(:insert_below)
          @table_cell_location = args[:table_cell_location] if args.key?(:table_cell_location)
        end
      end
      
      # Inserts text at the specified location.
      class InsertTextRequest
        include Google::Apis::Core::Hashable
      
        # Location at the end of a body, header, footer or footnote. The location is
        # immediately before the last newline in the document segment.
        # Corresponds to the JSON property `endOfSegmentLocation`
        # @return [Google::Apis::DocsV1::EndOfSegmentLocation]
        attr_accessor :end_of_segment_location
      
        # A particular location in the document.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :location
      
        # The text to be inserted.
        # Inserting a newline character will implicitly create a new
        # Paragraph at that index.
        # The paragraph style of the new paragraph will be copied from the paragraph
        # at the current insertion index, including lists and bullets.
        # Text styles for inserted text will be determined automatically, generally
        # preserving the styling of neighboring text. In most cases, the text style
        # for the inserted text will match the text immediately before the insertion
        # index.
        # Some control characters (U+0000-U+0008, U+000C-U+001F) and characters
        # from the Unicode Basic Multilingual Plane Private Use Area (U+E000-U+F8FF)
        # will be stripped out of the inserted text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_of_segment_location = args[:end_of_segment_location] if args.key?(:end_of_segment_location)
          @location = args[:location] if args.key?(:location)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # A reference to another portion of a document or an external URL resource.
      class Link
        include Google::Apis::Core::Hashable
      
        # The ID of a bookmark in this document.
        # Corresponds to the JSON property `bookmarkId`
        # @return [String]
        attr_accessor :bookmark_id
      
        # The ID of a heading in this document.
        # Corresponds to the JSON property `headingId`
        # @return [String]
        attr_accessor :heading_id
      
        # An external URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bookmark_id = args[:bookmark_id] if args.key?(:bookmark_id)
          @heading_id = args[:heading_id] if args.key?(:heading_id)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A reference to the external linked source content.
      class LinkedContentReference
        include Google::Apis::Core::Hashable
      
        # A reference to a linked chart embedded from Google Sheets.
        # Corresponds to the JSON property `sheetsChartReference`
        # @return [Google::Apis::DocsV1::SheetsChartReference]
        attr_accessor :sheets_chart_reference
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sheets_chart_reference = args[:sheets_chart_reference] if args.key?(:sheets_chart_reference)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # LinkedContentReference have
      # been changed in this suggestion. For any field set to true, there is a new
      # suggested value.
      class LinkedContentReferenceSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the base SheetsChartReference
        # have been changed in this
        # suggestion. For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `sheetsChartReferenceSuggestionState`
        # @return [Google::Apis::DocsV1::SheetsChartReferenceSuggestionState]
        attr_accessor :sheets_chart_reference_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sheets_chart_reference_suggestion_state = args[:sheets_chart_reference_suggestion_state] if args.key?(:sheets_chart_reference_suggestion_state)
        end
      end
      
      # A List represents the list attributes for a group of paragraphs that all
      # belong to the same list. A paragraph that is part of a list has a reference
      # to the list's ID in its bullet.
      class List
        include Google::Apis::Core::Hashable
      
        # The properties of a list which describe the look
        # and feel of bullets belonging to paragraphs associated with a list.
        # Corresponds to the JSON property `listProperties`
        # @return [Google::Apis::DocsV1::ListProperties]
        attr_accessor :list_properties
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this list.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion ID. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionId`
        # @return [String]
        attr_accessor :suggested_insertion_id
      
        # The suggested changes to the list properties, keyed by suggestion
        # ID.
        # Corresponds to the JSON property `suggestedListPropertiesChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedListProperties>]
        attr_accessor :suggested_list_properties_changes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_properties = args[:list_properties] if args.key?(:list_properties)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_id = args[:suggested_insertion_id] if args.key?(:suggested_insertion_id)
          @suggested_list_properties_changes = args[:suggested_list_properties_changes] if args.key?(:suggested_list_properties_changes)
        end
      end
      
      # The properties of a list which describe the look
      # and feel of bullets belonging to paragraphs associated with a list.
      class ListProperties
        include Google::Apis::Core::Hashable
      
        # Describes the properties of the bullets at the associated level.
        # A list has at most nine levels of nesting with nesting level 0
        # corresponding to the top-most level and nesting level 8 corresponding to
        # the most nested level. The nesting levels are returned in ascending order
        # with the least nested returned first.
        # Corresponds to the JSON property `nestingLevels`
        # @return [Array<Google::Apis::DocsV1::NestingLevel>]
        attr_accessor :nesting_levels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nesting_levels = args[:nesting_levels] if args.key?(:nesting_levels)
        end
      end
      
      # A mask that indicates which of the fields on the base ListProperties have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class ListPropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the corresponding
        # NestingLevel in nesting_levels have been changed in
        # this suggestion.
        # The nesting level suggestion states are returned in ascending order of the
        # nesting level with the least nested returned first.
        # Corresponds to the JSON property `nestingLevelsSuggestionStates`
        # @return [Array<Google::Apis::DocsV1::NestingLevelSuggestionState>]
        attr_accessor :nesting_levels_suggestion_states
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nesting_levels_suggestion_states = args[:nesting_levels_suggestion_states] if args.key?(:nesting_levels_suggestion_states)
        end
      end
      
      # A particular location in the document.
      class Location
        include Google::Apis::Core::Hashable
      
        # The zero-based index, in UTF-16 code units.
        # The index is relative to the beginning of the segment specified by
        # segment_id.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # The ID of the header, footer or footnote the location is in. An empty
        # segment ID signifies the document's body.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index = args[:index] if args.key?(:index)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
        end
      end
      
      # Merges cells in a Table.
      class MergeTableCellsRequest
        include Google::Apis::Core::Hashable
      
        # A table range represents a reference to a subset of a table.
        # It's important to note that the cells specified by a table range do not
        # necessarily form a rectangle. For example, let's say we have a 3 x 3 table
        # where all the cells of the last row are merged together. The table looks
        # like this:
        # 
        # [             ]
        # A table range with table cell location = (table_start_location, row = 0,
        # column = 0), row span = 3 and column span = 2 specifies the following cells:
        # x     x
        # [ x    x    x ]
        # Corresponds to the JSON property `tableRange`
        # @return [Google::Apis::DocsV1::TableRange]
        attr_accessor :table_range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_range = args[:table_range] if args.key?(:table_range)
        end
      end
      
      # A collection of Ranges with the same named range
      # ID.
      # Named ranges allow developers to associate parts of a document with an
      # arbitrary user-defined label so their contents can be programmatically read
      # or edited at a later time. A document can contain multiple named ranges with
      # the same name, but every named range has a unique ID.
      # A named range is created with a single Range,
      # and content inserted inside a named range generally expands that range.
      # However, certain document changes can cause the range to be split into
      # multiple ranges.
      # Named ranges are not private. All applications and collaborators that have
      # access to the document can see its named ranges.
      class NamedRange
        include Google::Apis::Core::Hashable
      
        # The name of the named range.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID of the named range.
        # Corresponds to the JSON property `namedRangeId`
        # @return [String]
        attr_accessor :named_range_id
      
        # The ranges that belong to this named range.
        # Corresponds to the JSON property `ranges`
        # @return [Array<Google::Apis::DocsV1::Range>]
        attr_accessor :ranges
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @named_range_id = args[:named_range_id] if args.key?(:named_range_id)
          @ranges = args[:ranges] if args.key?(:ranges)
        end
      end
      
      # A collection of all the NamedRanges in the
      # document that share a given name.
      class NamedRanges
        include Google::Apis::Core::Hashable
      
        # The name that all the named ranges share.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The NamedRanges that share the same name.
        # Corresponds to the JSON property `namedRanges`
        # @return [Array<Google::Apis::DocsV1::NamedRange>]
        attr_accessor :named_ranges
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @named_ranges = args[:named_ranges] if args.key?(:named_ranges)
        end
      end
      
      # A named style. Paragraphs in the document can inherit their
      # TextStyle and
      # ParagraphStyle from this named style
      # when they have the same named style type.
      class NamedStyle
        include Google::Apis::Core::Hashable
      
        # The type of this named style.
        # Corresponds to the JSON property `namedStyleType`
        # @return [String]
        attr_accessor :named_style_type
      
        # Styles that apply to a whole paragraph.
        # Inherited paragraph styles are represented as unset fields in this message.
        # A paragraph style's parent depends on where the paragraph style is defined:
        # * The ParagraphStyle on a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The ParagraphStyle on a named style
        # inherits from the normal text named style.
        # * The ParagraphStyle of the normal text named style inherits
        # from the default paragraph style in the Docs editor.
        # * The ParagraphStyle on a Paragraph
        # element that is contained in a table may inherit its paragraph style from
        # the table style.
        # If the paragraph style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `paragraphStyle`
        # @return [Google::Apis::DocsV1::ParagraphStyle]
        attr_accessor :paragraph_style
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @named_style_type = args[:named_style_type] if args.key?(:named_style_type)
          @paragraph_style = args[:paragraph_style] if args.key?(:paragraph_style)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # A suggestion state of a NamedStyle message.
      class NamedStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # The named style type that this suggestion state corresponds to.
        # This field is provided as a convenience for matching the
        # NamedStyleSuggestionState with its corresponding NamedStyle.
        # Corresponds to the JSON property `namedStyleType`
        # @return [String]
        attr_accessor :named_style_type
      
        # A mask that indicates which of the fields on the base ParagraphStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `paragraphStyleSuggestionState`
        # @return [Google::Apis::DocsV1::ParagraphStyleSuggestionState]
        attr_accessor :paragraph_style_suggestion_state
      
        # A mask that indicates which of the fields on the base TextStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `textStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TextStyleSuggestionState]
        attr_accessor :text_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @named_style_type = args[:named_style_type] if args.key?(:named_style_type)
          @paragraph_style_suggestion_state = args[:paragraph_style_suggestion_state] if args.key?(:paragraph_style_suggestion_state)
          @text_style_suggestion_state = args[:text_style_suggestion_state] if args.key?(:text_style_suggestion_state)
        end
      end
      
      # The named styles. Paragraphs in the document can inherit their
      # TextStyle and
      # ParagraphStyle from these named styles.
      class NamedStyles
        include Google::Apis::Core::Hashable
      
        # The named styles.
        # There is an entry for each of the possible named style types.
        # Corresponds to the JSON property `styles`
        # @return [Array<Google::Apis::DocsV1::NamedStyle>]
        attr_accessor :styles
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @styles = args[:styles] if args.key?(:styles)
        end
      end
      
      # The suggestion state of a NamedStyles
      # message.
      class NamedStylesSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the corresponding NamedStyle in
        # styles have been changed in this
        # suggestion.
        # The order of these named style suggestion states match the order of the
        # corresponding named style within the named styles suggestion.
        # Corresponds to the JSON property `stylesSuggestionStates`
        # @return [Array<Google::Apis::DocsV1::NamedStyleSuggestionState>]
        attr_accessor :styles_suggestion_states
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @styles_suggestion_states = args[:styles_suggestion_states] if args.key?(:styles_suggestion_states)
        end
      end
      
      # Contains properties describing the look and feel of a list bullet at a given
      # level of nesting.
      class NestingLevel
        include Google::Apis::Core::Hashable
      
        # The alignment of the bullet within the space allotted for rendering the
        # bullet.
        # Corresponds to the JSON property `bulletAlignment`
        # @return [String]
        attr_accessor :bullet_alignment
      
        # The format string used by bullets at this level of nesting.
        # The glyph format contains one or more placeholders, and these placeholder
        # are replaced with the appropriate values depending on the glyph_type or
        # glyph_symbol. The placeholders follow
        # the pattern `%[nesting_level]`. Furthermore, placeholders can have prefixes
        # and suffixes. Thus, the glyph format follows the pattern
        # `<prefix>%[nesting_level]<suffix>`. Note that the prefix and suffix are
        # optional and can be arbitrary strings.
        # For example, the glyph format `%0.` indicates that the rendered glyph will
        # replace the placeholder with the corresponding glyph for nesting level 0
        # followed by a period as the suffix. So a list with a glyph type of
        # UPPER_ALPHA and
        # glyph format `%0.` at nesting level 0 will result in a list with rendered
        # glyphs
        # <p>`A.`
        # <p>`B.`
        # <p>`C.`
        # The glyph format can contain placeholders for the current nesting level as
        # well as placeholders for parent nesting levels. For example, a
        # list can have a glyph format of `%0.` at nesting level 0 and a
        # glyph format of `%0.%1.` at nesting level 1. Assuming both nesting levels
        # have DECIMAL glyph
        # types, this would result in a list with rendered glyphs
        # <p>`1.`
        # <p>`2.`
        # <p>`  2.1.`
        # <p>`  2.2.`
        # <p>`3.`
        # For nesting levels that are ordered, the string that replaces a placeholder
        # in the glyph format for a particular paragraph depends on the paragraph's
        # order within the list.
        # Corresponds to the JSON property `glyphFormat`
        # @return [String]
        attr_accessor :glyph_format
      
        # A custom glyph symbol used by bullets when paragraphs at this level of
        # nesting are unordered.
        # The glyph symbol replaces placeholders within the glyph_format. For example,
        # if the
        # glyph_symbol is the solid circle corresponding to Unicode U+25cf code
        # point and the glyph_format is `%0`, the rendered
        # glyph would be the solid circle.
        # Corresponds to the JSON property `glyphSymbol`
        # @return [String]
        attr_accessor :glyph_symbol
      
        # The type of glyph used by bullets when paragraphs at this level of
        # nesting are ordered.
        # The glyph type determines the type of glyph used to replace placeholders
        # within the glyph_format
        # when paragraphs at this level of nesting are ordered. For example, if the
        # nesting level is 0, the glyph_format is `%0.` and the glyph
        # type is DECIMAL,
        # then the rendered glyph would replace the placeholder `%0` in the glyph
        # format with a number corresponding to list item's order within the list.
        # Corresponds to the JSON property `glyphType`
        # @return [String]
        attr_accessor :glyph_type
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `indentFirstLine`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :indent_first_line
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `indentStart`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :indent_start
      
        # The number of the first list item at this nesting level.
        # A value of 0 is treated as a value of 1 for lettered lists and roman
        # numeraled lists, i.e. for values of both 0 and 1, lettered and roman
        # numeraled lists will begin at `a` and `i` respectively.
        # This value is ignored for nesting levels with unordered glyphs.
        # Corresponds to the JSON property `startNumber`
        # @return [Fixnum]
        attr_accessor :start_number
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bullet_alignment = args[:bullet_alignment] if args.key?(:bullet_alignment)
          @glyph_format = args[:glyph_format] if args.key?(:glyph_format)
          @glyph_symbol = args[:glyph_symbol] if args.key?(:glyph_symbol)
          @glyph_type = args[:glyph_type] if args.key?(:glyph_type)
          @indent_first_line = args[:indent_first_line] if args.key?(:indent_first_line)
          @indent_start = args[:indent_start] if args.key?(:indent_start)
          @start_number = args[:start_number] if args.key?(:start_number)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # A mask that indicates which of the fields on the base NestingLevel have been
      # changed in this suggestion. For
      # any field set to true, there is a new suggested value.
      class NestingLevelSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to
        # bullet_alignment.
        # Corresponds to the JSON property `bulletAlignmentSuggested`
        # @return [Boolean]
        attr_accessor :bullet_alignment_suggested
        alias_method :bullet_alignment_suggested?, :bullet_alignment_suggested
      
        # Indicates if there was a suggested change to
        # glyph_format.
        # Corresponds to the JSON property `glyphFormatSuggested`
        # @return [Boolean]
        attr_accessor :glyph_format_suggested
        alias_method :glyph_format_suggested?, :glyph_format_suggested
      
        # Indicates if there was a suggested change to
        # glyph_symbol.
        # Corresponds to the JSON property `glyphSymbolSuggested`
        # @return [Boolean]
        attr_accessor :glyph_symbol_suggested
        alias_method :glyph_symbol_suggested?, :glyph_symbol_suggested
      
        # Indicates if there was a suggested change to
        # glyph_type.
        # Corresponds to the JSON property `glyphTypeSuggested`
        # @return [Boolean]
        attr_accessor :glyph_type_suggested
        alias_method :glyph_type_suggested?, :glyph_type_suggested
      
        # Indicates if there was a suggested change to
        # indent_first_line.
        # Corresponds to the JSON property `indentFirstLineSuggested`
        # @return [Boolean]
        attr_accessor :indent_first_line_suggested
        alias_method :indent_first_line_suggested?, :indent_first_line_suggested
      
        # Indicates if there was a suggested change to
        # indent_start.
        # Corresponds to the JSON property `indentStartSuggested`
        # @return [Boolean]
        attr_accessor :indent_start_suggested
        alias_method :indent_start_suggested?, :indent_start_suggested
      
        # Indicates if there was a suggested change to
        # start_number.
        # Corresponds to the JSON property `startNumberSuggested`
        # @return [Boolean]
        attr_accessor :start_number_suggested
        alias_method :start_number_suggested?, :start_number_suggested
      
        # A mask that indicates which of the fields on the base TextStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `textStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TextStyleSuggestionState]
        attr_accessor :text_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bullet_alignment_suggested = args[:bullet_alignment_suggested] if args.key?(:bullet_alignment_suggested)
          @glyph_format_suggested = args[:glyph_format_suggested] if args.key?(:glyph_format_suggested)
          @glyph_symbol_suggested = args[:glyph_symbol_suggested] if args.key?(:glyph_symbol_suggested)
          @glyph_type_suggested = args[:glyph_type_suggested] if args.key?(:glyph_type_suggested)
          @indent_first_line_suggested = args[:indent_first_line_suggested] if args.key?(:indent_first_line_suggested)
          @indent_start_suggested = args[:indent_start_suggested] if args.key?(:indent_start_suggested)
          @start_number_suggested = args[:start_number_suggested] if args.key?(:start_number_suggested)
          @text_style_suggestion_state = args[:text_style_suggestion_state] if args.key?(:text_style_suggestion_state)
        end
      end
      
      # A collection of object IDs.
      class ObjectReferences
        include Google::Apis::Core::Hashable
      
        # The object IDs.
        # Corresponds to the JSON property `objectIds`
        # @return [Array<String>]
        attr_accessor :object_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_ids = args[:object_ids] if args.key?(:object_ids)
        end
      end
      
      # A color that can either be fully opaque or fully transparent.
      class OptionalColor
        include Google::Apis::Core::Hashable
      
        # A solid color.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::DocsV1::Color]
        attr_accessor :color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
        end
      end
      
      # A ParagraphElement representing a
      # page break. A page break makes the subsequent text start at the top of the
      # next page.
      class PageBreak
        include Google::Apis::Core::Hashable
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A PageBreak
        # may have multiple insertion IDs if it is a nested suggested change. If
        # empty, then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this PageBreak, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # A StructuralElement representing a
      # paragraph. A paragraph is a range of content that is terminated with a
      # newline character.
      class Paragraph
        include Google::Apis::Core::Hashable
      
        # Describes the bullet of a paragraph.
        # Corresponds to the JSON property `bullet`
        # @return [Google::Apis::DocsV1::Bullet]
        attr_accessor :bullet
      
        # The content of the paragraph broken down into its component parts.
        # Corresponds to the JSON property `elements`
        # @return [Array<Google::Apis::DocsV1::ParagraphElement>]
        attr_accessor :elements
      
        # Styles that apply to a whole paragraph.
        # Inherited paragraph styles are represented as unset fields in this message.
        # A paragraph style's parent depends on where the paragraph style is defined:
        # * The ParagraphStyle on a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The ParagraphStyle on a named style
        # inherits from the normal text named style.
        # * The ParagraphStyle of the normal text named style inherits
        # from the default paragraph style in the Docs editor.
        # * The ParagraphStyle on a Paragraph
        # element that is contained in a table may inherit its paragraph style from
        # the table style.
        # If the paragraph style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `paragraphStyle`
        # @return [Google::Apis::DocsV1::ParagraphStyle]
        attr_accessor :paragraph_style
      
        # The IDs of the positioned objects tethered to this paragraph.
        # Corresponds to the JSON property `positionedObjectIds`
        # @return [Array<String>]
        attr_accessor :positioned_object_ids
      
        # The suggested changes to this paragraph's bullet.
        # Corresponds to the JSON property `suggestedBulletChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedBullet>]
        attr_accessor :suggested_bullet_changes
      
        # The suggested paragraph style changes to this paragraph, keyed by
        # suggestion ID.
        # Corresponds to the JSON property `suggestedParagraphStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedParagraphStyle>]
        attr_accessor :suggested_paragraph_style_changes
      
        # The IDs of the positioned objects that are suggested to be attached to this
        # paragraph, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedPositionedObjectIds`
        # @return [Hash<String,Google::Apis::DocsV1::ObjectReferences>]
        attr_accessor :suggested_positioned_object_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bullet = args[:bullet] if args.key?(:bullet)
          @elements = args[:elements] if args.key?(:elements)
          @paragraph_style = args[:paragraph_style] if args.key?(:paragraph_style)
          @positioned_object_ids = args[:positioned_object_ids] if args.key?(:positioned_object_ids)
          @suggested_bullet_changes = args[:suggested_bullet_changes] if args.key?(:suggested_bullet_changes)
          @suggested_paragraph_style_changes = args[:suggested_paragraph_style_changes] if args.key?(:suggested_paragraph_style_changes)
          @suggested_positioned_object_ids = args[:suggested_positioned_object_ids] if args.key?(:suggested_positioned_object_ids)
        end
      end
      
      # A border around a paragraph.
      class ParagraphBorder
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :color
      
        # The dash style of the border.
        # Corresponds to the JSON property `dashStyle`
        # @return [String]
        attr_accessor :dash_style
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `padding`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @dash_style = args[:dash_style] if args.key?(:dash_style)
          @padding = args[:padding] if args.key?(:padding)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # A ParagraphElement describes content within a
      # Paragraph.
      class ParagraphElement
        include Google::Apis::Core::Hashable
      
        # A ParagraphElement representing a
        # spot in the text that is dynamically replaced with content that can change
        # over time, like a page number.
        # Corresponds to the JSON property `autoText`
        # @return [Google::Apis::DocsV1::AutoText]
        attr_accessor :auto_text
      
        # A ParagraphElement representing a
        # column break. A column break makes the subsequent text start at the top of
        # the next column.
        # Corresponds to the JSON property `columnBreak`
        # @return [Google::Apis::DocsV1::ColumnBreak]
        attr_accessor :column_break
      
        # The zero-base end index of this paragraph element, exclusive, in UTF-16
        # code units.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # A ParagraphElement representing an
        # equation.
        # Corresponds to the JSON property `equation`
        # @return [Google::Apis::DocsV1::Equation]
        attr_accessor :equation
      
        # A ParagraphElement representing a
        # footnote reference. A footnote reference is the inline content rendered with
        # a number and is used to identify the footnote.
        # Corresponds to the JSON property `footnoteReference`
        # @return [Google::Apis::DocsV1::FootnoteReference]
        attr_accessor :footnote_reference
      
        # A ParagraphElement representing a
        # horizontal line.
        # Corresponds to the JSON property `horizontalRule`
        # @return [Google::Apis::DocsV1::HorizontalRule]
        attr_accessor :horizontal_rule
      
        # A ParagraphElement that contains
        # an InlineObject.
        # Corresponds to the JSON property `inlineObjectElement`
        # @return [Google::Apis::DocsV1::InlineObjectElement]
        attr_accessor :inline_object_element
      
        # A ParagraphElement representing a
        # page break. A page break makes the subsequent text start at the top of the
        # next page.
        # Corresponds to the JSON property `pageBreak`
        # @return [Google::Apis::DocsV1::PageBreak]
        attr_accessor :page_break
      
        # The zero-based start index of this paragraph element, in UTF-16 code units.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # A ParagraphElement that represents a
        # run of text that all has the same styling.
        # Corresponds to the JSON property `textRun`
        # @return [Google::Apis::DocsV1::TextRun]
        attr_accessor :text_run
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_text = args[:auto_text] if args.key?(:auto_text)
          @column_break = args[:column_break] if args.key?(:column_break)
          @end_index = args[:end_index] if args.key?(:end_index)
          @equation = args[:equation] if args.key?(:equation)
          @footnote_reference = args[:footnote_reference] if args.key?(:footnote_reference)
          @horizontal_rule = args[:horizontal_rule] if args.key?(:horizontal_rule)
          @inline_object_element = args[:inline_object_element] if args.key?(:inline_object_element)
          @page_break = args[:page_break] if args.key?(:page_break)
          @start_index = args[:start_index] if args.key?(:start_index)
          @text_run = args[:text_run] if args.key?(:text_run)
        end
      end
      
      # Styles that apply to a whole paragraph.
      # Inherited paragraph styles are represented as unset fields in this message.
      # A paragraph style's parent depends on where the paragraph style is defined:
      # * The ParagraphStyle on a Paragraph
      # inherits from the paragraph's corresponding named style type.
      # * The ParagraphStyle on a named style
      # inherits from the normal text named style.
      # * The ParagraphStyle of the normal text named style inherits
      # from the default paragraph style in the Docs editor.
      # * The ParagraphStyle on a Paragraph
      # element that is contained in a table may inherit its paragraph style from
      # the table style.
      # If the paragraph style does not inherit from a parent, unsetting fields will
      # revert the style to a value matching the defaults in the Docs editor.
      class ParagraphStyle
        include Google::Apis::Core::Hashable
      
        # The text alignment for this paragraph.
        # Corresponds to the JSON property `alignment`
        # @return [String]
        attr_accessor :alignment
      
        # Whether to avoid widows and orphans for the paragraph. If unset, the value
        # is inherited from the parent.
        # Corresponds to the JSON property `avoidWidowAndOrphan`
        # @return [Boolean]
        attr_accessor :avoid_widow_and_orphan
        alias_method :avoid_widow_and_orphan?, :avoid_widow_and_orphan
      
        # A border around a paragraph.
        # Corresponds to the JSON property `borderBetween`
        # @return [Google::Apis::DocsV1::ParagraphBorder]
        attr_accessor :border_between
      
        # A border around a paragraph.
        # Corresponds to the JSON property `borderBottom`
        # @return [Google::Apis::DocsV1::ParagraphBorder]
        attr_accessor :border_bottom
      
        # A border around a paragraph.
        # Corresponds to the JSON property `borderLeft`
        # @return [Google::Apis::DocsV1::ParagraphBorder]
        attr_accessor :border_left
      
        # A border around a paragraph.
        # Corresponds to the JSON property `borderRight`
        # @return [Google::Apis::DocsV1::ParagraphBorder]
        attr_accessor :border_right
      
        # A border around a paragraph.
        # Corresponds to the JSON property `borderTop`
        # @return [Google::Apis::DocsV1::ParagraphBorder]
        attr_accessor :border_top
      
        # The text direction of this paragraph. If unset, the value defaults to
        # LEFT_TO_RIGHT since
        # paragraph direction is not inherited.
        # Corresponds to the JSON property `direction`
        # @return [String]
        attr_accessor :direction
      
        # The heading ID of the paragraph. If empty, then this paragraph is not a
        # heading.
        # This property is read-only.
        # Corresponds to the JSON property `headingId`
        # @return [String]
        attr_accessor :heading_id
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `indentEnd`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :indent_end
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `indentFirstLine`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :indent_first_line
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `indentStart`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :indent_start
      
        # Whether all lines of the paragraph should be laid out on the same page or
        # column if possible. If unset, the value is inherited from the parent.
        # Corresponds to the JSON property `keepLinesTogether`
        # @return [Boolean]
        attr_accessor :keep_lines_together
        alias_method :keep_lines_together?, :keep_lines_together
      
        # Whether at least a part of this paragraph should be laid out on the same
        # page or column as the next paragraph if possible. If unset, the value is
        # inherited from the parent.
        # Corresponds to the JSON property `keepWithNext`
        # @return [Boolean]
        attr_accessor :keep_with_next
        alias_method :keep_with_next?, :keep_with_next
      
        # The amount of space between lines, as a percentage of normal, where normal
        # is represented as 100.0. If unset, the value is inherited from the parent.
        # Corresponds to the JSON property `lineSpacing`
        # @return [Float]
        attr_accessor :line_spacing
      
        # The named style type of the paragraph.
        # Since updating the named style type affects other properties within
        # ParagraphStyle, the named style type is applied before the other properties
        # are updated.
        # Corresponds to the JSON property `namedStyleType`
        # @return [String]
        attr_accessor :named_style_type
      
        # The shading of a paragraph.
        # Corresponds to the JSON property `shading`
        # @return [Google::Apis::DocsV1::Shading]
        attr_accessor :shading
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `spaceAbove`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :space_above
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `spaceBelow`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :space_below
      
        # The spacing mode for the paragraph.
        # Corresponds to the JSON property `spacingMode`
        # @return [String]
        attr_accessor :spacing_mode
      
        # A list of the tab stops for this paragraph. The list of tab stops is not
        # inherited.
        # This property is read-only.
        # Corresponds to the JSON property `tabStops`
        # @return [Array<Google::Apis::DocsV1::TabStop>]
        attr_accessor :tab_stops
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alignment = args[:alignment] if args.key?(:alignment)
          @avoid_widow_and_orphan = args[:avoid_widow_and_orphan] if args.key?(:avoid_widow_and_orphan)
          @border_between = args[:border_between] if args.key?(:border_between)
          @border_bottom = args[:border_bottom] if args.key?(:border_bottom)
          @border_left = args[:border_left] if args.key?(:border_left)
          @border_right = args[:border_right] if args.key?(:border_right)
          @border_top = args[:border_top] if args.key?(:border_top)
          @direction = args[:direction] if args.key?(:direction)
          @heading_id = args[:heading_id] if args.key?(:heading_id)
          @indent_end = args[:indent_end] if args.key?(:indent_end)
          @indent_first_line = args[:indent_first_line] if args.key?(:indent_first_line)
          @indent_start = args[:indent_start] if args.key?(:indent_start)
          @keep_lines_together = args[:keep_lines_together] if args.key?(:keep_lines_together)
          @keep_with_next = args[:keep_with_next] if args.key?(:keep_with_next)
          @line_spacing = args[:line_spacing] if args.key?(:line_spacing)
          @named_style_type = args[:named_style_type] if args.key?(:named_style_type)
          @shading = args[:shading] if args.key?(:shading)
          @space_above = args[:space_above] if args.key?(:space_above)
          @space_below = args[:space_below] if args.key?(:space_below)
          @spacing_mode = args[:spacing_mode] if args.key?(:spacing_mode)
          @tab_stops = args[:tab_stops] if args.key?(:tab_stops)
        end
      end
      
      # A mask that indicates which of the fields on the base ParagraphStyle have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class ParagraphStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to alignment.
        # Corresponds to the JSON property `alignmentSuggested`
        # @return [Boolean]
        attr_accessor :alignment_suggested
        alias_method :alignment_suggested?, :alignment_suggested
      
        # Indicates if there was a suggested change to avoid_widow_and_orphan.
        # Corresponds to the JSON property `avoidWidowAndOrphanSuggested`
        # @return [Boolean]
        attr_accessor :avoid_widow_and_orphan_suggested
        alias_method :avoid_widow_and_orphan_suggested?, :avoid_widow_and_orphan_suggested
      
        # Indicates if there was a suggested change to border_between.
        # Corresponds to the JSON property `borderBetweenSuggested`
        # @return [Boolean]
        attr_accessor :border_between_suggested
        alias_method :border_between_suggested?, :border_between_suggested
      
        # Indicates if there was a suggested change to border_bottom.
        # Corresponds to the JSON property `borderBottomSuggested`
        # @return [Boolean]
        attr_accessor :border_bottom_suggested
        alias_method :border_bottom_suggested?, :border_bottom_suggested
      
        # Indicates if there was a suggested change to border_left.
        # Corresponds to the JSON property `borderLeftSuggested`
        # @return [Boolean]
        attr_accessor :border_left_suggested
        alias_method :border_left_suggested?, :border_left_suggested
      
        # Indicates if there was a suggested change to border_right.
        # Corresponds to the JSON property `borderRightSuggested`
        # @return [Boolean]
        attr_accessor :border_right_suggested
        alias_method :border_right_suggested?, :border_right_suggested
      
        # Indicates if there was a suggested change to border_top.
        # Corresponds to the JSON property `borderTopSuggested`
        # @return [Boolean]
        attr_accessor :border_top_suggested
        alias_method :border_top_suggested?, :border_top_suggested
      
        # Indicates if there was a suggested change to direction.
        # Corresponds to the JSON property `directionSuggested`
        # @return [Boolean]
        attr_accessor :direction_suggested
        alias_method :direction_suggested?, :direction_suggested
      
        # Indicates if there was a suggested change to heading_id.
        # Corresponds to the JSON property `headingIdSuggested`
        # @return [Boolean]
        attr_accessor :heading_id_suggested
        alias_method :heading_id_suggested?, :heading_id_suggested
      
        # Indicates if there was a suggested change to indent_end.
        # Corresponds to the JSON property `indentEndSuggested`
        # @return [Boolean]
        attr_accessor :indent_end_suggested
        alias_method :indent_end_suggested?, :indent_end_suggested
      
        # Indicates if there was a suggested change to indent_first_line.
        # Corresponds to the JSON property `indentFirstLineSuggested`
        # @return [Boolean]
        attr_accessor :indent_first_line_suggested
        alias_method :indent_first_line_suggested?, :indent_first_line_suggested
      
        # Indicates if there was a suggested change to indent_start.
        # Corresponds to the JSON property `indentStartSuggested`
        # @return [Boolean]
        attr_accessor :indent_start_suggested
        alias_method :indent_start_suggested?, :indent_start_suggested
      
        # Indicates if there was a suggested change to keep_lines_together.
        # Corresponds to the JSON property `keepLinesTogetherSuggested`
        # @return [Boolean]
        attr_accessor :keep_lines_together_suggested
        alias_method :keep_lines_together_suggested?, :keep_lines_together_suggested
      
        # Indicates if there was a suggested change to keep_with_next.
        # Corresponds to the JSON property `keepWithNextSuggested`
        # @return [Boolean]
        attr_accessor :keep_with_next_suggested
        alias_method :keep_with_next_suggested?, :keep_with_next_suggested
      
        # Indicates if there was a suggested change to line_spacing.
        # Corresponds to the JSON property `lineSpacingSuggested`
        # @return [Boolean]
        attr_accessor :line_spacing_suggested
        alias_method :line_spacing_suggested?, :line_spacing_suggested
      
        # Indicates if there was a suggested change to named_style_type.
        # Corresponds to the JSON property `namedStyleTypeSuggested`
        # @return [Boolean]
        attr_accessor :named_style_type_suggested
        alias_method :named_style_type_suggested?, :named_style_type_suggested
      
        # A mask that indicates which of the fields on the base Shading have been
        # changed in this
        # suggested change. For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `shadingSuggestionState`
        # @return [Google::Apis::DocsV1::ShadingSuggestionState]
        attr_accessor :shading_suggestion_state
      
        # Indicates if there was a suggested change to space_above.
        # Corresponds to the JSON property `spaceAboveSuggested`
        # @return [Boolean]
        attr_accessor :space_above_suggested
        alias_method :space_above_suggested?, :space_above_suggested
      
        # Indicates if there was a suggested change to space_below.
        # Corresponds to the JSON property `spaceBelowSuggested`
        # @return [Boolean]
        attr_accessor :space_below_suggested
        alias_method :space_below_suggested?, :space_below_suggested
      
        # Indicates if there was a suggested change to spacing_mode.
        # Corresponds to the JSON property `spacingModeSuggested`
        # @return [Boolean]
        attr_accessor :spacing_mode_suggested
        alias_method :spacing_mode_suggested?, :spacing_mode_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alignment_suggested = args[:alignment_suggested] if args.key?(:alignment_suggested)
          @avoid_widow_and_orphan_suggested = args[:avoid_widow_and_orphan_suggested] if args.key?(:avoid_widow_and_orphan_suggested)
          @border_between_suggested = args[:border_between_suggested] if args.key?(:border_between_suggested)
          @border_bottom_suggested = args[:border_bottom_suggested] if args.key?(:border_bottom_suggested)
          @border_left_suggested = args[:border_left_suggested] if args.key?(:border_left_suggested)
          @border_right_suggested = args[:border_right_suggested] if args.key?(:border_right_suggested)
          @border_top_suggested = args[:border_top_suggested] if args.key?(:border_top_suggested)
          @direction_suggested = args[:direction_suggested] if args.key?(:direction_suggested)
          @heading_id_suggested = args[:heading_id_suggested] if args.key?(:heading_id_suggested)
          @indent_end_suggested = args[:indent_end_suggested] if args.key?(:indent_end_suggested)
          @indent_first_line_suggested = args[:indent_first_line_suggested] if args.key?(:indent_first_line_suggested)
          @indent_start_suggested = args[:indent_start_suggested] if args.key?(:indent_start_suggested)
          @keep_lines_together_suggested = args[:keep_lines_together_suggested] if args.key?(:keep_lines_together_suggested)
          @keep_with_next_suggested = args[:keep_with_next_suggested] if args.key?(:keep_with_next_suggested)
          @line_spacing_suggested = args[:line_spacing_suggested] if args.key?(:line_spacing_suggested)
          @named_style_type_suggested = args[:named_style_type_suggested] if args.key?(:named_style_type_suggested)
          @shading_suggestion_state = args[:shading_suggestion_state] if args.key?(:shading_suggestion_state)
          @space_above_suggested = args[:space_above_suggested] if args.key?(:space_above_suggested)
          @space_below_suggested = args[:space_below_suggested] if args.key?(:space_below_suggested)
          @spacing_mode_suggested = args[:spacing_mode_suggested] if args.key?(:spacing_mode_suggested)
        end
      end
      
      # An object that is tethered to a Paragraph
      # and positioned relative to the beginning of the paragraph. A PositionedObject
      # contains an EmbeddedObject such as an
      # image.
      class PositionedObject
        include Google::Apis::Core::Hashable
      
        # The ID of this positioned object.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        # Properties of a PositionedObject.
        # Corresponds to the JSON property `positionedObjectProperties`
        # @return [Google::Apis::DocsV1::PositionedObjectProperties]
        attr_accessor :positioned_object_properties
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion ID. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionId`
        # @return [String]
        attr_accessor :suggested_insertion_id
      
        # The suggested changes to the positioned object properties, keyed by
        # suggestion ID.
        # Corresponds to the JSON property `suggestedPositionedObjectPropertiesChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedPositionedObjectProperties>]
        attr_accessor :suggested_positioned_object_properties_changes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @positioned_object_properties = args[:positioned_object_properties] if args.key?(:positioned_object_properties)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_id = args[:suggested_insertion_id] if args.key?(:suggested_insertion_id)
          @suggested_positioned_object_properties_changes = args[:suggested_positioned_object_properties_changes] if args.key?(:suggested_positioned_object_properties_changes)
        end
      end
      
      # The positioning of a PositionedObject. The positioned object is positioned
      # relative to the beginning of the Paragraph
      # it is tethered to.
      class PositionedObjectPositioning
        include Google::Apis::Core::Hashable
      
        # The layout of this positioned object.
        # Corresponds to the JSON property `layout`
        # @return [String]
        attr_accessor :layout
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `leftOffset`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :left_offset
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `topOffset`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :top_offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @layout = args[:layout] if args.key?(:layout)
          @left_offset = args[:left_offset] if args.key?(:left_offset)
          @top_offset = args[:top_offset] if args.key?(:top_offset)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # PositionedObjectPositioning have been changed in this
      # suggestion. For any field set to true, there is a new suggested value.
      class PositionedObjectPositioningSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to layout.
        # Corresponds to the JSON property `layoutSuggested`
        # @return [Boolean]
        attr_accessor :layout_suggested
        alias_method :layout_suggested?, :layout_suggested
      
        # Indicates if there was a suggested change to left_offset.
        # Corresponds to the JSON property `leftOffsetSuggested`
        # @return [Boolean]
        attr_accessor :left_offset_suggested
        alias_method :left_offset_suggested?, :left_offset_suggested
      
        # Indicates if there was a suggested change to top_offset.
        # Corresponds to the JSON property `topOffsetSuggested`
        # @return [Boolean]
        attr_accessor :top_offset_suggested
        alias_method :top_offset_suggested?, :top_offset_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @layout_suggested = args[:layout_suggested] if args.key?(:layout_suggested)
          @left_offset_suggested = args[:left_offset_suggested] if args.key?(:left_offset_suggested)
          @top_offset_suggested = args[:top_offset_suggested] if args.key?(:top_offset_suggested)
        end
      end
      
      # Properties of a PositionedObject.
      class PositionedObjectProperties
        include Google::Apis::Core::Hashable
      
        # An embedded object in the document.
        # Corresponds to the JSON property `embeddedObject`
        # @return [Google::Apis::DocsV1::EmbeddedObject]
        attr_accessor :embedded_object
      
        # The positioning of a PositionedObject. The positioned object is positioned
        # relative to the beginning of the Paragraph
        # it is tethered to.
        # Corresponds to the JSON property `positioning`
        # @return [Google::Apis::DocsV1::PositionedObjectPositioning]
        attr_accessor :positioning
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedded_object = args[:embedded_object] if args.key?(:embedded_object)
          @positioning = args[:positioning] if args.key?(:positioning)
        end
      end
      
      # A mask that indicates which of the fields on the base
      # PositionedObjectProperties
      # have been changed in this suggestion. For any field set to true, there is a
      # new suggested value.
      class PositionedObjectPropertiesSuggestionState
        include Google::Apis::Core::Hashable
      
        # A mask that indicates which of the fields on the base EmbeddedObject have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `embeddedObjectSuggestionState`
        # @return [Google::Apis::DocsV1::EmbeddedObjectSuggestionState]
        attr_accessor :embedded_object_suggestion_state
      
        # A mask that indicates which of the fields on the base
        # PositionedObjectPositioning have been changed in this
        # suggestion. For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `positioningSuggestionState`
        # @return [Google::Apis::DocsV1::PositionedObjectPositioningSuggestionState]
        attr_accessor :positioning_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedded_object_suggestion_state = args[:embedded_object_suggestion_state] if args.key?(:embedded_object_suggestion_state)
          @positioning_suggestion_state = args[:positioning_suggestion_state] if args.key?(:positioning_suggestion_state)
        end
      end
      
      # Specifies a contiguous range of text.
      class Range
        include Google::Apis::Core::Hashable
      
        # The zero-based end index of this range, exclusive, in UTF-16 code units.
        # In all current uses, an end index must be provided. This field is an
        # Int32Value in order to accommodate future use cases with open-ended ranges.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # The ID of the header, footer or footnote that this range is contained in.
        # An empty segment ID signifies the document's body.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        # The zero-based start index of this range, in UTF-16 code units.
        # In all current uses, a start index must be provided. This field is an
        # Int32Value in order to accommodate future use cases with open-ended ranges.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Replaces all instances of text matching a criteria with replace text.
      class ReplaceAllTextRequest
        include Google::Apis::Core::Hashable
      
        # A criteria that matches a specific string of text in the document.
        # Corresponds to the JSON property `containsText`
        # @return [Google::Apis::DocsV1::SubstringMatchCriteria]
        attr_accessor :contains_text
      
        # The text that will replace the matched text.
        # Corresponds to the JSON property `replaceText`
        # @return [String]
        attr_accessor :replace_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contains_text = args[:contains_text] if args.key?(:contains_text)
          @replace_text = args[:replace_text] if args.key?(:replace_text)
        end
      end
      
      # The result of replacing text.
      class ReplaceAllTextResponse
        include Google::Apis::Core::Hashable
      
        # The number of occurrences changed by replacing all text.
        # Corresponds to the JSON property `occurrencesChanged`
        # @return [Fixnum]
        attr_accessor :occurrences_changed
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @occurrences_changed = args[:occurrences_changed] if args.key?(:occurrences_changed)
        end
      end
      
      # Replaces an existing image with a new image.
      # Replacing an image removes some image effects from the existing image in order
      # to
      # mirror the behavior of the Docs editor.
      class ReplaceImageRequest
        include Google::Apis::Core::Hashable
      
        # The ID of the existing image that will be replaced.
        # Corresponds to the JSON property `imageObjectId`
        # @return [String]
        attr_accessor :image_object_id
      
        # The replacement method.
        # Corresponds to the JSON property `imageReplaceMethod`
        # @return [String]
        attr_accessor :image_replace_method
      
        # The URI of the new image.
        # The image is fetched once at insertion time and a copy is stored for
        # display inside the document. Images must be less than 50MB in size, cannot
        # exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format.
        # The provided URI can be at most 2 kB in length. The URI itself is saved
        # with the image, and exposed via the ImageProperties.source_uri field.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_object_id = args[:image_object_id] if args.key?(:image_object_id)
          @image_replace_method = args[:image_replace_method] if args.key?(:image_replace_method)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Replaces the contents of the specified
      # NamedRange or
      # NamedRanges with the given replacement
      # content.
      # Note that an individual NamedRange may
      # consist of multiple discontinuous
      # ranges. In this case, only the
      # content in the first range will be replaced. The other ranges and their
      # content will be deleted.
      # In cases where replacing or deleting any ranges would result in an invalid
      # document structure, a 400 bad request error is returned.
      class ReplaceNamedRangeContentRequest
        include Google::Apis::Core::Hashable
      
        # The ID of the named range whose content will be replaced.
        # If there is no named range with the given ID a 400 bad request error is
        # returned.
        # Corresponds to the JSON property `namedRangeId`
        # @return [String]
        attr_accessor :named_range_id
      
        # The name of the NamedRanges whose
        # content will be replaced.
        # If there are multiple named ranges with the given name, then
        # the content of each one will be replaced. If there are no named ranges
        # with the given name, then the request will be a no-op.
        # Corresponds to the JSON property `namedRangeName`
        # @return [String]
        attr_accessor :named_range_name
      
        # Replaces the content of the specified named range(s) with the given text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @named_range_id = args[:named_range_id] if args.key?(:named_range_id)
          @named_range_name = args[:named_range_name] if args.key?(:named_range_name)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # A single update to apply to a document.
      class Request
        include Google::Apis::Core::Hashable
      
        # Creates a Footer. The new footer will be
        # applied to SectionStyle or the
        # DocumentStyle.
        # If a footer of the specified type already exists then a 400 bad request error
        # will be returned.
        # Corresponds to the JSON property `createFooter`
        # @return [Google::Apis::DocsV1::CreateFooterRequest]
        attr_accessor :create_footer
      
        # Creates a Header. The new header will be
        # applied to SectionStyle or the
        # DocumentStyle.
        # If a header of the specified type already exists then a 400 bad request error
        # will be returned.
        # Corresponds to the JSON property `createHeader`
        # @return [Google::Apis::DocsV1::CreateHeaderRequest]
        attr_accessor :create_header
      
        # Creates a NamedRange referencing the given
        # range.
        # Corresponds to the JSON property `createNamedRange`
        # @return [Google::Apis::DocsV1::CreateNamedRangeRequest]
        attr_accessor :create_named_range
      
        # Creates bullets for all of the paragraphs that overlap with the given range.
        # The nesting level of each paragraph will be determined by counting leading
        # tabs in front of each paragraph. To avoid excess space between the bullet and
        # the corresponding paragraph, these leading tabs are removed by this request.
        # This may change the indices of parts of the text.
        # If the paragraph immediately before paragraphs being updated is in a list
        # with a matching preset, the paragraphs being updated are added to that
        # preceding list.
        # Corresponds to the JSON property `createParagraphBullets`
        # @return [Google::Apis::DocsV1::CreateParagraphBulletsRequest]
        attr_accessor :create_paragraph_bullets
      
        # Deletes content from the document.
        # Corresponds to the JSON property `deleteContentRange`
        # @return [Google::Apis::DocsV1::DeleteContentRangeRequest]
        attr_accessor :delete_content_range
      
        # Deletes a NamedRange.
        # Corresponds to the JSON property `deleteNamedRange`
        # @return [Google::Apis::DocsV1::DeleteNamedRangeRequest]
        attr_accessor :delete_named_range
      
        # Deletes bullets from all of the paragraphs that overlap with the given range.
        # The nesting level of each paragraph will be visually preserved by adding
        # indent to the start of the corresponding paragraph.
        # Corresponds to the JSON property `deleteParagraphBullets`
        # @return [Google::Apis::DocsV1::DeleteParagraphBulletsRequest]
        attr_accessor :delete_paragraph_bullets
      
        # Deletes a PositionedObject from the
        # document.
        # Corresponds to the JSON property `deletePositionedObject`
        # @return [Google::Apis::DocsV1::DeletePositionedObjectRequest]
        attr_accessor :delete_positioned_object
      
        # Deletes a column from a table.
        # Corresponds to the JSON property `deleteTableColumn`
        # @return [Google::Apis::DocsV1::DeleteTableColumnRequest]
        attr_accessor :delete_table_column
      
        # Deletes a row from a table.
        # Corresponds to the JSON property `deleteTableRow`
        # @return [Google::Apis::DocsV1::DeleteTableRowRequest]
        attr_accessor :delete_table_row
      
        # Inserts an InlineObject containing an
        # image at the given location.
        # Corresponds to the JSON property `insertInlineImage`
        # @return [Google::Apis::DocsV1::InsertInlineImageRequest]
        attr_accessor :insert_inline_image
      
        # Inserts a page break followed by a newline at the specified location.
        # Corresponds to the JSON property `insertPageBreak`
        # @return [Google::Apis::DocsV1::InsertPageBreakRequest]
        attr_accessor :insert_page_break
      
        # Inserts a table at the specified location.
        # A newline character will be inserted before the inserted table.
        # Corresponds to the JSON property `insertTable`
        # @return [Google::Apis::DocsV1::InsertTableRequest]
        attr_accessor :insert_table
      
        # Inserts an empty column into a table.
        # Corresponds to the JSON property `insertTableColumn`
        # @return [Google::Apis::DocsV1::InsertTableColumnRequest]
        attr_accessor :insert_table_column
      
        # Inserts an empty row into a table.
        # Corresponds to the JSON property `insertTableRow`
        # @return [Google::Apis::DocsV1::InsertTableRowRequest]
        attr_accessor :insert_table_row
      
        # Inserts text at the specified location.
        # Corresponds to the JSON property `insertText`
        # @return [Google::Apis::DocsV1::InsertTextRequest]
        attr_accessor :insert_text
      
        # Merges cells in a Table.
        # Corresponds to the JSON property `mergeTableCells`
        # @return [Google::Apis::DocsV1::MergeTableCellsRequest]
        attr_accessor :merge_table_cells
      
        # Replaces all instances of text matching a criteria with replace text.
        # Corresponds to the JSON property `replaceAllText`
        # @return [Google::Apis::DocsV1::ReplaceAllTextRequest]
        attr_accessor :replace_all_text
      
        # Replaces an existing image with a new image.
        # Replacing an image removes some image effects from the existing image in order
        # to
        # mirror the behavior of the Docs editor.
        # Corresponds to the JSON property `replaceImage`
        # @return [Google::Apis::DocsV1::ReplaceImageRequest]
        attr_accessor :replace_image
      
        # Replaces the contents of the specified
        # NamedRange or
        # NamedRanges with the given replacement
        # content.
        # Note that an individual NamedRange may
        # consist of multiple discontinuous
        # ranges. In this case, only the
        # content in the first range will be replaced. The other ranges and their
        # content will be deleted.
        # In cases where replacing or deleting any ranges would result in an invalid
        # document structure, a 400 bad request error is returned.
        # Corresponds to the JSON property `replaceNamedRangeContent`
        # @return [Google::Apis::DocsV1::ReplaceNamedRangeContentRequest]
        attr_accessor :replace_named_range_content
      
        # Unmerges cells in a Table.
        # Corresponds to the JSON property `unmergeTableCells`
        # @return [Google::Apis::DocsV1::UnmergeTableCellsRequest]
        attr_accessor :unmerge_table_cells
      
        # Updates the DocumentStyle.
        # Corresponds to the JSON property `updateDocumentStyle`
        # @return [Google::Apis::DocsV1::UpdateDocumentStyleRequest]
        attr_accessor :update_document_style
      
        # Update the styling of all paragraphs that overlap with the given range.
        # Corresponds to the JSON property `updateParagraphStyle`
        # @return [Google::Apis::DocsV1::UpdateParagraphStyleRequest]
        attr_accessor :update_paragraph_style
      
        # Updates the style of a range of table cells.
        # Corresponds to the JSON property `updateTableCellStyle`
        # @return [Google::Apis::DocsV1::UpdateTableCellStyleRequest]
        attr_accessor :update_table_cell_style
      
        # Updates the
        # TableColumnProperties of columns
        # in a table.
        # Corresponds to the JSON property `updateTableColumnProperties`
        # @return [Google::Apis::DocsV1::UpdateTableColumnPropertiesRequest]
        attr_accessor :update_table_column_properties
      
        # Updates the TableRowStyle of rows in a
        # table.
        # Corresponds to the JSON property `updateTableRowStyle`
        # @return [Google::Apis::DocsV1::UpdateTableRowStyleRequest]
        attr_accessor :update_table_row_style
      
        # Update the styling of text.
        # Corresponds to the JSON property `updateTextStyle`
        # @return [Google::Apis::DocsV1::UpdateTextStyleRequest]
        attr_accessor :update_text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_footer = args[:create_footer] if args.key?(:create_footer)
          @create_header = args[:create_header] if args.key?(:create_header)
          @create_named_range = args[:create_named_range] if args.key?(:create_named_range)
          @create_paragraph_bullets = args[:create_paragraph_bullets] if args.key?(:create_paragraph_bullets)
          @delete_content_range = args[:delete_content_range] if args.key?(:delete_content_range)
          @delete_named_range = args[:delete_named_range] if args.key?(:delete_named_range)
          @delete_paragraph_bullets = args[:delete_paragraph_bullets] if args.key?(:delete_paragraph_bullets)
          @delete_positioned_object = args[:delete_positioned_object] if args.key?(:delete_positioned_object)
          @delete_table_column = args[:delete_table_column] if args.key?(:delete_table_column)
          @delete_table_row = args[:delete_table_row] if args.key?(:delete_table_row)
          @insert_inline_image = args[:insert_inline_image] if args.key?(:insert_inline_image)
          @insert_page_break = args[:insert_page_break] if args.key?(:insert_page_break)
          @insert_table = args[:insert_table] if args.key?(:insert_table)
          @insert_table_column = args[:insert_table_column] if args.key?(:insert_table_column)
          @insert_table_row = args[:insert_table_row] if args.key?(:insert_table_row)
          @insert_text = args[:insert_text] if args.key?(:insert_text)
          @merge_table_cells = args[:merge_table_cells] if args.key?(:merge_table_cells)
          @replace_all_text = args[:replace_all_text] if args.key?(:replace_all_text)
          @replace_image = args[:replace_image] if args.key?(:replace_image)
          @replace_named_range_content = args[:replace_named_range_content] if args.key?(:replace_named_range_content)
          @unmerge_table_cells = args[:unmerge_table_cells] if args.key?(:unmerge_table_cells)
          @update_document_style = args[:update_document_style] if args.key?(:update_document_style)
          @update_paragraph_style = args[:update_paragraph_style] if args.key?(:update_paragraph_style)
          @update_table_cell_style = args[:update_table_cell_style] if args.key?(:update_table_cell_style)
          @update_table_column_properties = args[:update_table_column_properties] if args.key?(:update_table_column_properties)
          @update_table_row_style = args[:update_table_row_style] if args.key?(:update_table_row_style)
          @update_text_style = args[:update_text_style] if args.key?(:update_text_style)
        end
      end
      
      # A single response from an update.
      class Response
        include Google::Apis::Core::Hashable
      
        # The result of creating a footer.
        # Corresponds to the JSON property `createFooter`
        # @return [Google::Apis::DocsV1::CreateFooterResponse]
        attr_accessor :create_footer
      
        # The result of creating a header.
        # Corresponds to the JSON property `createHeader`
        # @return [Google::Apis::DocsV1::CreateHeaderResponse]
        attr_accessor :create_header
      
        # The result of creating a named range.
        # Corresponds to the JSON property `createNamedRange`
        # @return [Google::Apis::DocsV1::CreateNamedRangeResponse]
        attr_accessor :create_named_range
      
        # The result of inserting an inline image.
        # Corresponds to the JSON property `insertInlineImage`
        # @return [Google::Apis::DocsV1::InsertInlineImageResponse]
        attr_accessor :insert_inline_image
      
        # The result of inserting an embedded Google Sheets chart.
        # Corresponds to the JSON property `insertInlineSheetsChart`
        # @return [Google::Apis::DocsV1::InsertInlineSheetsChartResponse]
        attr_accessor :insert_inline_sheets_chart
      
        # The result of replacing text.
        # Corresponds to the JSON property `replaceAllText`
        # @return [Google::Apis::DocsV1::ReplaceAllTextResponse]
        attr_accessor :replace_all_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_footer = args[:create_footer] if args.key?(:create_footer)
          @create_header = args[:create_header] if args.key?(:create_header)
          @create_named_range = args[:create_named_range] if args.key?(:create_named_range)
          @insert_inline_image = args[:insert_inline_image] if args.key?(:insert_inline_image)
          @insert_inline_sheets_chart = args[:insert_inline_sheets_chart] if args.key?(:insert_inline_sheets_chart)
          @replace_all_text = args[:replace_all_text] if args.key?(:replace_all_text)
        end
      end
      
      # An RGB color.
      class RgbColor
        include Google::Apis::Core::Hashable
      
        # The blue component of the color, from 0.0 to 1.0.
        # Corresponds to the JSON property `blue`
        # @return [Float]
        attr_accessor :blue
      
        # The green component of the color, from 0.0 to 1.0.
        # Corresponds to the JSON property `green`
        # @return [Float]
        attr_accessor :green
      
        # The red component of the color, from 0.0 to 1.0.
        # Corresponds to the JSON property `red`
        # @return [Float]
        attr_accessor :red
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blue = args[:blue] if args.key?(:blue)
          @green = args[:green] if args.key?(:green)
          @red = args[:red] if args.key?(:red)
        end
      end
      
      # A StructuralElement representing a
      # section break. A section is a range of content which has the same
      # SectionStyle. A section break represents
      # the start of a new section, and the section style applies to the section
      # after the section break.
      # The document body always begins with a section break.
      class SectionBreak
        include Google::Apis::Core::Hashable
      
        # The styling that applies to a section.
        # Corresponds to the JSON property `sectionStyle`
        # @return [Google::Apis::DocsV1::SectionStyle]
        attr_accessor :section_style
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A SectionBreak may have multiple insertion IDs if
        # it is
        # a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @section_style = args[:section_style] if args.key?(:section_style)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
        end
      end
      
      # Properties that apply to a section's column.
      class SectionColumnProperties
        include Google::Apis::Core::Hashable
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `paddingEnd`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding_end
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @padding_end = args[:padding_end] if args.key?(:padding_end)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # The styling that applies to a section.
      class SectionStyle
        include Google::Apis::Core::Hashable
      
        # The section's columns properties.
        # If empty, the section contains one column with the default properties in
        # the Docs editor.
        # Corresponds to the JSON property `columnProperties`
        # @return [Array<Google::Apis::DocsV1::SectionColumnProperties>]
        attr_accessor :column_properties
      
        # The style of column separators.
        # This style can be set even when there is one column in the section.
        # Corresponds to the JSON property `columnSeparatorStyle`
        # @return [String]
        attr_accessor :column_separator_style
      
        # The content direction of this section. If unset, the value defaults to
        # LEFT_TO_RIGHT.
        # Corresponds to the JSON property `contentDirection`
        # @return [String]
        attr_accessor :content_direction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_properties = args[:column_properties] if args.key?(:column_properties)
          @column_separator_style = args[:column_separator_style] if args.key?(:column_separator_style)
          @content_direction = args[:content_direction] if args.key?(:content_direction)
        end
      end
      
      # The shading of a paragraph.
      class Shading
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `backgroundColor`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :background_color
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
        end
      end
      
      # A mask that indicates which of the fields on the base Shading have been
      # changed in this
      # suggested change. For any field set to true, there is a new suggested value.
      class ShadingSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to the Shading.
        # Corresponds to the JSON property `backgroundColorSuggested`
        # @return [Boolean]
        attr_accessor :background_color_suggested
        alias_method :background_color_suggested?, :background_color_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color_suggested = args[:background_color_suggested] if args.key?(:background_color_suggested)
        end
      end
      
      # A reference to a linked chart embedded from Google Sheets.
      class SheetsChartReference
        include Google::Apis::Core::Hashable
      
        # The ID of the specific chart in the Google Sheets spreadsheet that is
        # embedded.
        # Corresponds to the JSON property `chartId`
        # @return [Fixnum]
        attr_accessor :chart_id
      
        # The ID of the Google Sheets spreadsheet that contains the source chart.
        # Corresponds to the JSON property `spreadsheetId`
        # @return [String]
        attr_accessor :spreadsheet_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chart_id = args[:chart_id] if args.key?(:chart_id)
          @spreadsheet_id = args[:spreadsheet_id] if args.key?(:spreadsheet_id)
        end
      end
      
      # A mask that indicates which of the fields on the base SheetsChartReference
      # have been changed in this
      # suggestion. For any field set to true, there is a new suggested value.
      class SheetsChartReferenceSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to chart_id.
        # Corresponds to the JSON property `chartIdSuggested`
        # @return [Boolean]
        attr_accessor :chart_id_suggested
        alias_method :chart_id_suggested?, :chart_id_suggested
      
        # Indicates if there was a suggested change to spreadsheet_id.
        # Corresponds to the JSON property `spreadsheetIdSuggested`
        # @return [Boolean]
        attr_accessor :spreadsheet_id_suggested
        alias_method :spreadsheet_id_suggested?, :spreadsheet_id_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chart_id_suggested = args[:chart_id_suggested] if args.key?(:chart_id_suggested)
          @spreadsheet_id_suggested = args[:spreadsheet_id_suggested] if args.key?(:spreadsheet_id_suggested)
        end
      end
      
      # A width and height.
      class Size
        include Google::Apis::Core::Hashable
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `height`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :height
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # A mask that indicates which of the fields on the base Size have been changed
      # in this suggestion.
      # For any field set to true, the Size has
      # a new suggested value.
      class SizeSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to height.
        # Corresponds to the JSON property `heightSuggested`
        # @return [Boolean]
        attr_accessor :height_suggested
        alias_method :height_suggested?, :height_suggested
      
        # Indicates if there was a suggested change to width.
        # Corresponds to the JSON property `widthSuggested`
        # @return [Boolean]
        attr_accessor :width_suggested
        alias_method :width_suggested?, :width_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height_suggested = args[:height_suggested] if args.key?(:height_suggested)
          @width_suggested = args[:width_suggested] if args.key?(:width_suggested)
        end
      end
      
      # A StructuralElement describes content that provides structure to the
      # document.
      class StructuralElement
        include Google::Apis::Core::Hashable
      
        # The zero-based end index of this structural element, exclusive, in UTF-16
        # code units.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # A StructuralElement representing a
        # paragraph. A paragraph is a range of content that is terminated with a
        # newline character.
        # Corresponds to the JSON property `paragraph`
        # @return [Google::Apis::DocsV1::Paragraph]
        attr_accessor :paragraph
      
        # A StructuralElement representing a
        # section break. A section is a range of content which has the same
        # SectionStyle. A section break represents
        # the start of a new section, and the section style applies to the section
        # after the section break.
        # The document body always begins with a section break.
        # Corresponds to the JSON property `sectionBreak`
        # @return [Google::Apis::DocsV1::SectionBreak]
        attr_accessor :section_break
      
        # The zero-based start index of this structural element, in UTF-16 code
        # units.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # A StructuralElement representing a
        # table.
        # Corresponds to the JSON property `table`
        # @return [Google::Apis::DocsV1::Table]
        attr_accessor :table
      
        # A StructuralElement representing
        # a table of contents.
        # Corresponds to the JSON property `tableOfContents`
        # @return [Google::Apis::DocsV1::TableOfContents]
        attr_accessor :table_of_contents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @paragraph = args[:paragraph] if args.key?(:paragraph)
          @section_break = args[:section_break] if args.key?(:section_break)
          @start_index = args[:start_index] if args.key?(:start_index)
          @table = args[:table] if args.key?(:table)
          @table_of_contents = args[:table_of_contents] if args.key?(:table_of_contents)
        end
      end
      
      # A criteria that matches a specific string of text in the document.
      class SubstringMatchCriteria
        include Google::Apis::Core::Hashable
      
        # Indicates whether the search should respect case:
        # - `True`: the search is case sensitive.
        # - `False`: the search is case insensitive.
        # Corresponds to the JSON property `matchCase`
        # @return [Boolean]
        attr_accessor :match_case
        alias_method :match_case?, :match_case
      
        # The text to search for in the document.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @match_case = args[:match_case] if args.key?(:match_case)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # A suggested change to a Bullet.
      class SuggestedBullet
        include Google::Apis::Core::Hashable
      
        # Describes the bullet of a paragraph.
        # Corresponds to the JSON property `bullet`
        # @return [Google::Apis::DocsV1::Bullet]
        attr_accessor :bullet
      
        # A mask that indicates which of the fields on the base
        # Bullet have been changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `bulletSuggestionState`
        # @return [Google::Apis::DocsV1::BulletSuggestionState]
        attr_accessor :bullet_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bullet = args[:bullet] if args.key?(:bullet)
          @bullet_suggestion_state = args[:bullet_suggestion_state] if args.key?(:bullet_suggestion_state)
        end
      end
      
      # A suggested change to the DocumentStyle.
      class SuggestedDocumentStyle
        include Google::Apis::Core::Hashable
      
        # The style of the document.
        # Corresponds to the JSON property `documentStyle`
        # @return [Google::Apis::DocsV1::DocumentStyle]
        attr_accessor :document_style
      
        # A mask that indicates which of the fields on the base DocumentStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `documentStyleSuggestionState`
        # @return [Google::Apis::DocsV1::DocumentStyleSuggestionState]
        attr_accessor :document_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_style = args[:document_style] if args.key?(:document_style)
          @document_style_suggestion_state = args[:document_style_suggestion_state] if args.key?(:document_style_suggestion_state)
        end
      end
      
      # A suggested change to InlineObjectProperties.
      class SuggestedInlineObjectProperties
        include Google::Apis::Core::Hashable
      
        # Properties of an InlineObject.
        # Corresponds to the JSON property `inlineObjectProperties`
        # @return [Google::Apis::DocsV1::InlineObjectProperties]
        attr_accessor :inline_object_properties
      
        # A mask that indicates which of the fields on the base
        # InlineObjectProperties have
        # been changed in this suggestion. For any field set to true, there is a new
        # suggested value.
        # Corresponds to the JSON property `inlineObjectPropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::InlineObjectPropertiesSuggestionState]
        attr_accessor :inline_object_properties_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inline_object_properties = args[:inline_object_properties] if args.key?(:inline_object_properties)
          @inline_object_properties_suggestion_state = args[:inline_object_properties_suggestion_state] if args.key?(:inline_object_properties_suggestion_state)
        end
      end
      
      # A suggested change to ListProperties.
      class SuggestedListProperties
        include Google::Apis::Core::Hashable
      
        # The properties of a list which describe the look
        # and feel of bullets belonging to paragraphs associated with a list.
        # Corresponds to the JSON property `listProperties`
        # @return [Google::Apis::DocsV1::ListProperties]
        attr_accessor :list_properties
      
        # A mask that indicates which of the fields on the base ListProperties have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `listPropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::ListPropertiesSuggestionState]
        attr_accessor :list_properties_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_properties = args[:list_properties] if args.key?(:list_properties)
          @list_properties_suggestion_state = args[:list_properties_suggestion_state] if args.key?(:list_properties_suggestion_state)
        end
      end
      
      # A suggested change to the NamedStyles.
      class SuggestedNamedStyles
        include Google::Apis::Core::Hashable
      
        # The named styles. Paragraphs in the document can inherit their
        # TextStyle and
        # ParagraphStyle from these named styles.
        # Corresponds to the JSON property `namedStyles`
        # @return [Google::Apis::DocsV1::NamedStyles]
        attr_accessor :named_styles
      
        # The suggestion state of a NamedStyles
        # message.
        # Corresponds to the JSON property `namedStylesSuggestionState`
        # @return [Google::Apis::DocsV1::NamedStylesSuggestionState]
        attr_accessor :named_styles_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @named_styles = args[:named_styles] if args.key?(:named_styles)
          @named_styles_suggestion_state = args[:named_styles_suggestion_state] if args.key?(:named_styles_suggestion_state)
        end
      end
      
      # A suggested change to a
      # ParagraphStyle.
      class SuggestedParagraphStyle
        include Google::Apis::Core::Hashable
      
        # Styles that apply to a whole paragraph.
        # Inherited paragraph styles are represented as unset fields in this message.
        # A paragraph style's parent depends on where the paragraph style is defined:
        # * The ParagraphStyle on a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The ParagraphStyle on a named style
        # inherits from the normal text named style.
        # * The ParagraphStyle of the normal text named style inherits
        # from the default paragraph style in the Docs editor.
        # * The ParagraphStyle on a Paragraph
        # element that is contained in a table may inherit its paragraph style from
        # the table style.
        # If the paragraph style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `paragraphStyle`
        # @return [Google::Apis::DocsV1::ParagraphStyle]
        attr_accessor :paragraph_style
      
        # A mask that indicates which of the fields on the base ParagraphStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `paragraphStyleSuggestionState`
        # @return [Google::Apis::DocsV1::ParagraphStyleSuggestionState]
        attr_accessor :paragraph_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @paragraph_style = args[:paragraph_style] if args.key?(:paragraph_style)
          @paragraph_style_suggestion_state = args[:paragraph_style_suggestion_state] if args.key?(:paragraph_style_suggestion_state)
        end
      end
      
      # A suggested change to PositionedObjectProperties.
      class SuggestedPositionedObjectProperties
        include Google::Apis::Core::Hashable
      
        # Properties of a PositionedObject.
        # Corresponds to the JSON property `positionedObjectProperties`
        # @return [Google::Apis::DocsV1::PositionedObjectProperties]
        attr_accessor :positioned_object_properties
      
        # A mask that indicates which of the fields on the base
        # PositionedObjectProperties
        # have been changed in this suggestion. For any field set to true, there is a
        # new suggested value.
        # Corresponds to the JSON property `positionedObjectPropertiesSuggestionState`
        # @return [Google::Apis::DocsV1::PositionedObjectPropertiesSuggestionState]
        attr_accessor :positioned_object_properties_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @positioned_object_properties = args[:positioned_object_properties] if args.key?(:positioned_object_properties)
          @positioned_object_properties_suggestion_state = args[:positioned_object_properties_suggestion_state] if args.key?(:positioned_object_properties_suggestion_state)
        end
      end
      
      # A suggested change to a TableCellStyle.
      class SuggestedTableCellStyle
        include Google::Apis::Core::Hashable
      
        # The style of a TableCell.
        # Inherited table cell styles are represented as unset fields in this message.
        # A table cell style can inherit from the table's style.
        # Corresponds to the JSON property `tableCellStyle`
        # @return [Google::Apis::DocsV1::TableCellStyle]
        attr_accessor :table_cell_style
      
        # A mask that indicates which of the fields on the base TableCellStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `tableCellStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TableCellStyleSuggestionState]
        attr_accessor :table_cell_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_cell_style = args[:table_cell_style] if args.key?(:table_cell_style)
          @table_cell_style_suggestion_state = args[:table_cell_style_suggestion_state] if args.key?(:table_cell_style_suggestion_state)
        end
      end
      
      # A suggested change to a
      # TableRowStyle.
      class SuggestedTableRowStyle
        include Google::Apis::Core::Hashable
      
        # Styles that apply to a table row.
        # Corresponds to the JSON property `tableRowStyle`
        # @return [Google::Apis::DocsV1::TableRowStyle]
        attr_accessor :table_row_style
      
        # A mask that indicates which of the fields on the base TableRowStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `tableRowStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TableRowStyleSuggestionState]
        attr_accessor :table_row_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_row_style = args[:table_row_style] if args.key?(:table_row_style)
          @table_row_style_suggestion_state = args[:table_row_style_suggestion_state] if args.key?(:table_row_style_suggestion_state)
        end
      end
      
      # A suggested change to a TextStyle.
      class SuggestedTextStyle
        include Google::Apis::Core::Hashable
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        # A mask that indicates which of the fields on the base TextStyle have been
        # changed in this suggestion.
        # For any field set to true, there is a new suggested value.
        # Corresponds to the JSON property `textStyleSuggestionState`
        # @return [Google::Apis::DocsV1::TextStyleSuggestionState]
        attr_accessor :text_style_suggestion_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text_style = args[:text_style] if args.key?(:text_style)
          @text_style_suggestion_state = args[:text_style_suggestion_state] if args.key?(:text_style_suggestion_state)
        end
      end
      
      # A tab stop within a paragraph.
      class TabStop
        include Google::Apis::Core::Hashable
      
        # The alignment of this tab stop. If unset, the value defaults to START.
        # Corresponds to the JSON property `alignment`
        # @return [String]
        attr_accessor :alignment
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `offset`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :offset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alignment = args[:alignment] if args.key?(:alignment)
          @offset = args[:offset] if args.key?(:offset)
        end
      end
      
      # A StructuralElement representing a
      # table.
      class Table
        include Google::Apis::Core::Hashable
      
        # Number of columns in the table.
        # It is possible for a table to be non-rectangular, so some rows may have a
        # different number of cells.
        # Corresponds to the JSON property `columns`
        # @return [Fixnum]
        attr_accessor :columns
      
        # Number of rows in the table.
        # Corresponds to the JSON property `rows`
        # @return [Fixnum]
        attr_accessor :rows
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A Table may have
        # multiple insertion IDs if it is a nested suggested change. If empty, then
        # this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The contents and style of each row.
        # Corresponds to the JSON property `tableRows`
        # @return [Array<Google::Apis::DocsV1::TableRow>]
        attr_accessor :table_rows
      
        # Styles that apply to a table.
        # Corresponds to the JSON property `tableStyle`
        # @return [Google::Apis::DocsV1::TableStyle]
        attr_accessor :table_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @rows = args[:rows] if args.key?(:rows)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @table_rows = args[:table_rows] if args.key?(:table_rows)
          @table_style = args[:table_style] if args.key?(:table_style)
        end
      end
      
      # The contents and style of a cell in a Table.
      class TableCell
        include Google::Apis::Core::Hashable
      
        # The content of the cell.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        # The zero-based end index of this cell, exclusive, in UTF-16 code units.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # The zero-based start index of this cell, in UTF-16 code units.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A TableCell
        # may have multiple insertion IDs if it is a nested suggested change. If
        # empty, then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested changes to the table cell style, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedTableCellStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTableCellStyle>]
        attr_accessor :suggested_table_cell_style_changes
      
        # The style of a TableCell.
        # Inherited table cell styles are represented as unset fields in this message.
        # A table cell style can inherit from the table's style.
        # Corresponds to the JSON property `tableCellStyle`
        # @return [Google::Apis::DocsV1::TableCellStyle]
        attr_accessor :table_cell_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @end_index = args[:end_index] if args.key?(:end_index)
          @start_index = args[:start_index] if args.key?(:start_index)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_table_cell_style_changes = args[:suggested_table_cell_style_changes] if args.key?(:suggested_table_cell_style_changes)
          @table_cell_style = args[:table_cell_style] if args.key?(:table_cell_style)
        end
      end
      
      # A border around a table cell.
      # Table cell borders cannot be transparent. To hide a table cell border, make
      # its width 0.
      class TableCellBorder
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :color
      
        # The dash style of the border.
        # Corresponds to the JSON property `dashStyle`
        # @return [String]
        attr_accessor :dash_style
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @dash_style = args[:dash_style] if args.key?(:dash_style)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Location of a single cell within a table.
      class TableCellLocation
        include Google::Apis::Core::Hashable
      
        # The zero-based column index. For example, the second column in the table
        # has a column index of 1.
        # Corresponds to the JSON property `columnIndex`
        # @return [Fixnum]
        attr_accessor :column_index
      
        # The zero-based row index. For example, the second row in the table has a
        # row index of 1.
        # Corresponds to the JSON property `rowIndex`
        # @return [Fixnum]
        attr_accessor :row_index
      
        # A particular location in the document.
        # Corresponds to the JSON property `tableStartLocation`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :table_start_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_index = args[:column_index] if args.key?(:column_index)
          @row_index = args[:row_index] if args.key?(:row_index)
          @table_start_location = args[:table_start_location] if args.key?(:table_start_location)
        end
      end
      
      # The style of a TableCell.
      # Inherited table cell styles are represented as unset fields in this message.
      # A table cell style can inherit from the table's style.
      class TableCellStyle
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `backgroundColor`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :background_color
      
        # A border around a table cell.
        # Table cell borders cannot be transparent. To hide a table cell border, make
        # its width 0.
        # Corresponds to the JSON property `borderBottom`
        # @return [Google::Apis::DocsV1::TableCellBorder]
        attr_accessor :border_bottom
      
        # A border around a table cell.
        # Table cell borders cannot be transparent. To hide a table cell border, make
        # its width 0.
        # Corresponds to the JSON property `borderLeft`
        # @return [Google::Apis::DocsV1::TableCellBorder]
        attr_accessor :border_left
      
        # A border around a table cell.
        # Table cell borders cannot be transparent. To hide a table cell border, make
        # its width 0.
        # Corresponds to the JSON property `borderRight`
        # @return [Google::Apis::DocsV1::TableCellBorder]
        attr_accessor :border_right
      
        # A border around a table cell.
        # Table cell borders cannot be transparent. To hide a table cell border, make
        # its width 0.
        # Corresponds to the JSON property `borderTop`
        # @return [Google::Apis::DocsV1::TableCellBorder]
        attr_accessor :border_top
      
        # The column span of the cell.
        # This property is read-only.
        # Corresponds to the JSON property `columnSpan`
        # @return [Fixnum]
        attr_accessor :column_span
      
        # The alignment of the content in the table cell. The default alignment
        # matches the alignment for newly created table cells in the Docs editor.
        # Corresponds to the JSON property `contentAlignment`
        # @return [String]
        attr_accessor :content_alignment
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `paddingBottom`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding_bottom
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `paddingLeft`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding_left
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `paddingRight`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding_right
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `paddingTop`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :padding_top
      
        # The row span of the cell.
        # This property is read-only.
        # Corresponds to the JSON property `rowSpan`
        # @return [Fixnum]
        attr_accessor :row_span
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
          @border_bottom = args[:border_bottom] if args.key?(:border_bottom)
          @border_left = args[:border_left] if args.key?(:border_left)
          @border_right = args[:border_right] if args.key?(:border_right)
          @border_top = args[:border_top] if args.key?(:border_top)
          @column_span = args[:column_span] if args.key?(:column_span)
          @content_alignment = args[:content_alignment] if args.key?(:content_alignment)
          @padding_bottom = args[:padding_bottom] if args.key?(:padding_bottom)
          @padding_left = args[:padding_left] if args.key?(:padding_left)
          @padding_right = args[:padding_right] if args.key?(:padding_right)
          @padding_top = args[:padding_top] if args.key?(:padding_top)
          @row_span = args[:row_span] if args.key?(:row_span)
        end
      end
      
      # A mask that indicates which of the fields on the base TableCellStyle have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class TableCellStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to background_color.
        # Corresponds to the JSON property `backgroundColorSuggested`
        # @return [Boolean]
        attr_accessor :background_color_suggested
        alias_method :background_color_suggested?, :background_color_suggested
      
        # Indicates if there was a suggested change to border_bottom.
        # Corresponds to the JSON property `borderBottomSuggested`
        # @return [Boolean]
        attr_accessor :border_bottom_suggested
        alias_method :border_bottom_suggested?, :border_bottom_suggested
      
        # Indicates if there was a suggested change to border_left.
        # Corresponds to the JSON property `borderLeftSuggested`
        # @return [Boolean]
        attr_accessor :border_left_suggested
        alias_method :border_left_suggested?, :border_left_suggested
      
        # Indicates if there was a suggested change to border_right.
        # Corresponds to the JSON property `borderRightSuggested`
        # @return [Boolean]
        attr_accessor :border_right_suggested
        alias_method :border_right_suggested?, :border_right_suggested
      
        # Indicates if there was a suggested change to border_top.
        # Corresponds to the JSON property `borderTopSuggested`
        # @return [Boolean]
        attr_accessor :border_top_suggested
        alias_method :border_top_suggested?, :border_top_suggested
      
        # Indicates if there was a suggested change to column_span.
        # Corresponds to the JSON property `columnSpanSuggested`
        # @return [Boolean]
        attr_accessor :column_span_suggested
        alias_method :column_span_suggested?, :column_span_suggested
      
        # Indicates if there was a suggested change to content_alignment.
        # Corresponds to the JSON property `contentAlignmentSuggested`
        # @return [Boolean]
        attr_accessor :content_alignment_suggested
        alias_method :content_alignment_suggested?, :content_alignment_suggested
      
        # Indicates if there was a suggested change to padding_bottom.
        # Corresponds to the JSON property `paddingBottomSuggested`
        # @return [Boolean]
        attr_accessor :padding_bottom_suggested
        alias_method :padding_bottom_suggested?, :padding_bottom_suggested
      
        # Indicates if there was a suggested change to padding_left.
        # Corresponds to the JSON property `paddingLeftSuggested`
        # @return [Boolean]
        attr_accessor :padding_left_suggested
        alias_method :padding_left_suggested?, :padding_left_suggested
      
        # Indicates if there was a suggested change to padding_right.
        # Corresponds to the JSON property `paddingRightSuggested`
        # @return [Boolean]
        attr_accessor :padding_right_suggested
        alias_method :padding_right_suggested?, :padding_right_suggested
      
        # Indicates if there was a suggested change to padding_top.
        # Corresponds to the JSON property `paddingTopSuggested`
        # @return [Boolean]
        attr_accessor :padding_top_suggested
        alias_method :padding_top_suggested?, :padding_top_suggested
      
        # Indicates if there was a suggested change to row_span.
        # Corresponds to the JSON property `rowSpanSuggested`
        # @return [Boolean]
        attr_accessor :row_span_suggested
        alias_method :row_span_suggested?, :row_span_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color_suggested = args[:background_color_suggested] if args.key?(:background_color_suggested)
          @border_bottom_suggested = args[:border_bottom_suggested] if args.key?(:border_bottom_suggested)
          @border_left_suggested = args[:border_left_suggested] if args.key?(:border_left_suggested)
          @border_right_suggested = args[:border_right_suggested] if args.key?(:border_right_suggested)
          @border_top_suggested = args[:border_top_suggested] if args.key?(:border_top_suggested)
          @column_span_suggested = args[:column_span_suggested] if args.key?(:column_span_suggested)
          @content_alignment_suggested = args[:content_alignment_suggested] if args.key?(:content_alignment_suggested)
          @padding_bottom_suggested = args[:padding_bottom_suggested] if args.key?(:padding_bottom_suggested)
          @padding_left_suggested = args[:padding_left_suggested] if args.key?(:padding_left_suggested)
          @padding_right_suggested = args[:padding_right_suggested] if args.key?(:padding_right_suggested)
          @padding_top_suggested = args[:padding_top_suggested] if args.key?(:padding_top_suggested)
          @row_span_suggested = args[:row_span_suggested] if args.key?(:row_span_suggested)
        end
      end
      
      # The properties of a column in a table.
      class TableColumnProperties
        include Google::Apis::Core::Hashable
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `width`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :width
      
        # The width type of the column.
        # Corresponds to the JSON property `widthType`
        # @return [String]
        attr_accessor :width_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @width = args[:width] if args.key?(:width)
          @width_type = args[:width_type] if args.key?(:width_type)
        end
      end
      
      # A StructuralElement representing
      # a table of contents.
      class TableOfContents
        include Google::Apis::Core::Hashable
      
        # The content of the table of contents.
        # Corresponds to the JSON property `content`
        # @return [Array<Google::Apis::DocsV1::StructuralElement>]
        attr_accessor :content
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A TableOfContents may have multiple insertion IDs
        # if it
        # is a nested suggested change. If empty, then this is not a suggested
        # insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
        end
      end
      
      # A table range represents a reference to a subset of a table.
      # It's important to note that the cells specified by a table range do not
      # necessarily form a rectangle. For example, let's say we have a 3 x 3 table
      # where all the cells of the last row are merged together. The table looks
      # like this:
      # 
      # [             ]
      # A table range with table cell location = (table_start_location, row = 0,
      # column = 0), row span = 3 and column span = 2 specifies the following cells:
      # x     x
      # [ x    x    x ]
      class TableRange
        include Google::Apis::Core::Hashable
      
        # The column span of the table range.
        # Corresponds to the JSON property `columnSpan`
        # @return [Fixnum]
        attr_accessor :column_span
      
        # The row span of the table range.
        # Corresponds to the JSON property `rowSpan`
        # @return [Fixnum]
        attr_accessor :row_span
      
        # Location of a single cell within a table.
        # Corresponds to the JSON property `tableCellLocation`
        # @return [Google::Apis::DocsV1::TableCellLocation]
        attr_accessor :table_cell_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_span = args[:column_span] if args.key?(:column_span)
          @row_span = args[:row_span] if args.key?(:row_span)
          @table_cell_location = args[:table_cell_location] if args.key?(:table_cell_location)
        end
      end
      
      # The contents and style of a row in a Table.
      class TableRow
        include Google::Apis::Core::Hashable
      
        # The zero-based end index of this row, exclusive, in UTF-16 code units.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # The zero-based start index of this row, in UTF-16 code units.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A TableRow
        # may have multiple insertion IDs if it is a nested suggested change. If
        # empty, then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested style changes to this row, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedTableRowStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTableRowStyle>]
        attr_accessor :suggested_table_row_style_changes
      
        # The contents and style of each cell in this row.
        # It is possible for a table to be non-rectangular, so some rows may have a
        # different number of cells than other rows in the same table.
        # Corresponds to the JSON property `tableCells`
        # @return [Array<Google::Apis::DocsV1::TableCell>]
        attr_accessor :table_cells
      
        # Styles that apply to a table row.
        # Corresponds to the JSON property `tableRowStyle`
        # @return [Google::Apis::DocsV1::TableRowStyle]
        attr_accessor :table_row_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @start_index = args[:start_index] if args.key?(:start_index)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_table_row_style_changes = args[:suggested_table_row_style_changes] if args.key?(:suggested_table_row_style_changes)
          @table_cells = args[:table_cells] if args.key?(:table_cells)
          @table_row_style = args[:table_row_style] if args.key?(:table_row_style)
        end
      end
      
      # Styles that apply to a table row.
      class TableRowStyle
        include Google::Apis::Core::Hashable
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `minRowHeight`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :min_row_height
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @min_row_height = args[:min_row_height] if args.key?(:min_row_height)
        end
      end
      
      # A mask that indicates which of the fields on the base TableRowStyle have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class TableRowStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to min_row_height.
        # Corresponds to the JSON property `minRowHeightSuggested`
        # @return [Boolean]
        attr_accessor :min_row_height_suggested
        alias_method :min_row_height_suggested?, :min_row_height_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @min_row_height_suggested = args[:min_row_height_suggested] if args.key?(:min_row_height_suggested)
        end
      end
      
      # Styles that apply to a table.
      class TableStyle
        include Google::Apis::Core::Hashable
      
        # The properties of each column.
        # Note that in Docs, tables contain rows and rows contain cells, similar to
        # HTML. So the properties for a row can be found on the row's
        # table_row_style.
        # Corresponds to the JSON property `tableColumnProperties`
        # @return [Array<Google::Apis::DocsV1::TableColumnProperties>]
        attr_accessor :table_column_properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_column_properties = args[:table_column_properties] if args.key?(:table_column_properties)
        end
      end
      
      # A ParagraphElement that represents a
      # run of text that all has the same styling.
      class TextRun
        include Google::Apis::Core::Hashable
      
        # The text of this run.
        # Any non-text elements in the run are replaced with the Unicode character
        # U+E907.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The suggested deletion IDs. If empty, then there are no suggested deletions
        # of this content.
        # Corresponds to the JSON property `suggestedDeletionIds`
        # @return [Array<String>]
        attr_accessor :suggested_deletion_ids
      
        # The suggested insertion IDs. A TextRun may
        # have multiple insertion IDs if it is a nested suggested change. If empty,
        # then this is not a suggested insertion.
        # Corresponds to the JSON property `suggestedInsertionIds`
        # @return [Array<String>]
        attr_accessor :suggested_insertion_ids
      
        # The suggested text style changes to this run, keyed by suggestion ID.
        # Corresponds to the JSON property `suggestedTextStyleChanges`
        # @return [Hash<String,Google::Apis::DocsV1::SuggestedTextStyle>]
        attr_accessor :suggested_text_style_changes
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @suggested_deletion_ids = args[:suggested_deletion_ids] if args.key?(:suggested_deletion_ids)
          @suggested_insertion_ids = args[:suggested_insertion_ids] if args.key?(:suggested_insertion_ids)
          @suggested_text_style_changes = args[:suggested_text_style_changes] if args.key?(:suggested_text_style_changes)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # Represents the styling that can be applied to text.
      # Inherited text styles are represented as unset fields in this message. A
      # text style's parent depends on where the text style is defined:
      # * The TextStyle of text in a Paragraph
      # inherits from the paragraph's corresponding named style type.
      # * The TextStyle on a named style
      # inherits from the normal text named style.
      # * The TextStyle of the normal text named style inherits
      # from the default text style in the Docs editor.
      # * The TextStyle on a Paragraph element
      # that is contained in a table may inherit its text style from the table
      # style.
      # If the text style does not inherit from a parent, unsetting fields will
      # revert the style to a value matching the defaults in the Docs editor.
      class TextStyle
        include Google::Apis::Core::Hashable
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `backgroundColor`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :background_color
      
        # The text's vertical offset from its normal position.
        # Text with `SUPERSCRIPT` or `SUBSCRIPT` baseline offsets is automatically
        # rendered in a smaller font size, computed based on the `font_size` field.
        # The `font_size` itself is not affected by changes in this field.
        # Corresponds to the JSON property `baselineOffset`
        # @return [String]
        attr_accessor :baseline_offset
      
        # Whether or not the text is rendered as bold.
        # Corresponds to the JSON property `bold`
        # @return [Boolean]
        attr_accessor :bold
        alias_method :bold?, :bold
      
        # A magnitude in a single direction in the specified units.
        # Corresponds to the JSON property `fontSize`
        # @return [Google::Apis::DocsV1::Dimension]
        attr_accessor :font_size
      
        # A color that can either be fully opaque or fully transparent.
        # Corresponds to the JSON property `foregroundColor`
        # @return [Google::Apis::DocsV1::OptionalColor]
        attr_accessor :foreground_color
      
        # Whether or not the text is italicized.
        # Corresponds to the JSON property `italic`
        # @return [Boolean]
        attr_accessor :italic
        alias_method :italic?, :italic
      
        # A reference to another portion of a document or an external URL resource.
        # Corresponds to the JSON property `link`
        # @return [Google::Apis::DocsV1::Link]
        attr_accessor :link
      
        # Whether or not the text is in small capital letters.
        # Corresponds to the JSON property `smallCaps`
        # @return [Boolean]
        attr_accessor :small_caps
        alias_method :small_caps?, :small_caps
      
        # Whether or not the text is struck through.
        # Corresponds to the JSON property `strikethrough`
        # @return [Boolean]
        attr_accessor :strikethrough
        alias_method :strikethrough?, :strikethrough
      
        # Whether or not the text is underlined.
        # Corresponds to the JSON property `underline`
        # @return [Boolean]
        attr_accessor :underline
        alias_method :underline?, :underline
      
        # Represents a font family and weight of text.
        # Corresponds to the JSON property `weightedFontFamily`
        # @return [Google::Apis::DocsV1::WeightedFontFamily]
        attr_accessor :weighted_font_family
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
          @baseline_offset = args[:baseline_offset] if args.key?(:baseline_offset)
          @bold = args[:bold] if args.key?(:bold)
          @font_size = args[:font_size] if args.key?(:font_size)
          @foreground_color = args[:foreground_color] if args.key?(:foreground_color)
          @italic = args[:italic] if args.key?(:italic)
          @link = args[:link] if args.key?(:link)
          @small_caps = args[:small_caps] if args.key?(:small_caps)
          @strikethrough = args[:strikethrough] if args.key?(:strikethrough)
          @underline = args[:underline] if args.key?(:underline)
          @weighted_font_family = args[:weighted_font_family] if args.key?(:weighted_font_family)
        end
      end
      
      # A mask that indicates which of the fields on the base TextStyle have been
      # changed in this suggestion.
      # For any field set to true, there is a new suggested value.
      class TextStyleSuggestionState
        include Google::Apis::Core::Hashable
      
        # Indicates if there was a suggested change to background_color.
        # Corresponds to the JSON property `backgroundColorSuggested`
        # @return [Boolean]
        attr_accessor :background_color_suggested
        alias_method :background_color_suggested?, :background_color_suggested
      
        # Indicates if there was a suggested change to baseline_offset.
        # Corresponds to the JSON property `baselineOffsetSuggested`
        # @return [Boolean]
        attr_accessor :baseline_offset_suggested
        alias_method :baseline_offset_suggested?, :baseline_offset_suggested
      
        # Indicates if there was a suggested change to bold.
        # Corresponds to the JSON property `boldSuggested`
        # @return [Boolean]
        attr_accessor :bold_suggested
        alias_method :bold_suggested?, :bold_suggested
      
        # Indicates if there was a suggested change to font_size.
        # Corresponds to the JSON property `fontSizeSuggested`
        # @return [Boolean]
        attr_accessor :font_size_suggested
        alias_method :font_size_suggested?, :font_size_suggested
      
        # Indicates if there was a suggested change to foreground_color.
        # Corresponds to the JSON property `foregroundColorSuggested`
        # @return [Boolean]
        attr_accessor :foreground_color_suggested
        alias_method :foreground_color_suggested?, :foreground_color_suggested
      
        # Indicates if there was a suggested change to italic.
        # Corresponds to the JSON property `italicSuggested`
        # @return [Boolean]
        attr_accessor :italic_suggested
        alias_method :italic_suggested?, :italic_suggested
      
        # Indicates if there was a suggested change to link.
        # Corresponds to the JSON property `linkSuggested`
        # @return [Boolean]
        attr_accessor :link_suggested
        alias_method :link_suggested?, :link_suggested
      
        # Indicates if there was a suggested change to small_caps.
        # Corresponds to the JSON property `smallCapsSuggested`
        # @return [Boolean]
        attr_accessor :small_caps_suggested
        alias_method :small_caps_suggested?, :small_caps_suggested
      
        # Indicates if there was a suggested change to strikethrough.
        # Corresponds to the JSON property `strikethroughSuggested`
        # @return [Boolean]
        attr_accessor :strikethrough_suggested
        alias_method :strikethrough_suggested?, :strikethrough_suggested
      
        # Indicates if there was a suggested change to underline.
        # Corresponds to the JSON property `underlineSuggested`
        # @return [Boolean]
        attr_accessor :underline_suggested
        alias_method :underline_suggested?, :underline_suggested
      
        # Indicates if there was a suggested change to weighted_font_family.
        # Corresponds to the JSON property `weightedFontFamilySuggested`
        # @return [Boolean]
        attr_accessor :weighted_font_family_suggested
        alias_method :weighted_font_family_suggested?, :weighted_font_family_suggested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color_suggested = args[:background_color_suggested] if args.key?(:background_color_suggested)
          @baseline_offset_suggested = args[:baseline_offset_suggested] if args.key?(:baseline_offset_suggested)
          @bold_suggested = args[:bold_suggested] if args.key?(:bold_suggested)
          @font_size_suggested = args[:font_size_suggested] if args.key?(:font_size_suggested)
          @foreground_color_suggested = args[:foreground_color_suggested] if args.key?(:foreground_color_suggested)
          @italic_suggested = args[:italic_suggested] if args.key?(:italic_suggested)
          @link_suggested = args[:link_suggested] if args.key?(:link_suggested)
          @small_caps_suggested = args[:small_caps_suggested] if args.key?(:small_caps_suggested)
          @strikethrough_suggested = args[:strikethrough_suggested] if args.key?(:strikethrough_suggested)
          @underline_suggested = args[:underline_suggested] if args.key?(:underline_suggested)
          @weighted_font_family_suggested = args[:weighted_font_family_suggested] if args.key?(:weighted_font_family_suggested)
        end
      end
      
      # Unmerges cells in a Table.
      class UnmergeTableCellsRequest
        include Google::Apis::Core::Hashable
      
        # A table range represents a reference to a subset of a table.
        # It's important to note that the cells specified by a table range do not
        # necessarily form a rectangle. For example, let's say we have a 3 x 3 table
        # where all the cells of the last row are merged together. The table looks
        # like this:
        # 
        # [             ]
        # A table range with table cell location = (table_start_location, row = 0,
        # column = 0), row span = 3 and column span = 2 specifies the following cells:
        # x     x
        # [ x    x    x ]
        # Corresponds to the JSON property `tableRange`
        # @return [Google::Apis::DocsV1::TableRange]
        attr_accessor :table_range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @table_range = args[:table_range] if args.key?(:table_range)
        end
      end
      
      # Updates the DocumentStyle.
      class UpdateDocumentStyleRequest
        include Google::Apis::Core::Hashable
      
        # The style of the document.
        # Corresponds to the JSON property `documentStyle`
        # @return [Google::Apis::DocsV1::DocumentStyle]
        attr_accessor :document_style
      
        # The fields that should be updated.
        # At least one field must be specified. The root `document_style` is
        # implied and should not be specified. A single `"*"` can be used as
        # short-hand for listing every field.
        # For example to update the background, set `fields` to `"background"`.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_style = args[:document_style] if args.key?(:document_style)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # Update the styling of all paragraphs that overlap with the given range.
      class UpdateParagraphStyleRequest
        include Google::Apis::Core::Hashable
      
        # The fields that should be updated.
        # At least one field must be specified. The root `paragraph_style` is implied
        # and should not be specified.
        # For example, to update the paragraph style's alignment property, set
        # `fields` to `"alignment"`.
        # To reset a property to its default value, include its field name in the
        # field mask but leave the field itself unset.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        # Styles that apply to a whole paragraph.
        # Inherited paragraph styles are represented as unset fields in this message.
        # A paragraph style's parent depends on where the paragraph style is defined:
        # * The ParagraphStyle on a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The ParagraphStyle on a named style
        # inherits from the normal text named style.
        # * The ParagraphStyle of the normal text named style inherits
        # from the default paragraph style in the Docs editor.
        # * The ParagraphStyle on a Paragraph
        # element that is contained in a table may inherit its paragraph style from
        # the table style.
        # If the paragraph style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `paragraphStyle`
        # @return [Google::Apis::DocsV1::ParagraphStyle]
        attr_accessor :paragraph_style
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @paragraph_style = args[:paragraph_style] if args.key?(:paragraph_style)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # Updates the style of a range of table cells.
      class UpdateTableCellStyleRequest
        include Google::Apis::Core::Hashable
      
        # The fields that should be updated.
        # At least one field must be specified. The root `tableCellStyle` is implied
        # and should not be specified. A single `"*"` can be used as short-hand for
        # listing every field.
        # For example to update the table cell background color, set `fields` to
        # `"backgroundColor"`.
        # To reset a property to its default value, include its field name in the
        # field mask but leave the field itself unset.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        # The style of a TableCell.
        # Inherited table cell styles are represented as unset fields in this message.
        # A table cell style can inherit from the table's style.
        # Corresponds to the JSON property `tableCellStyle`
        # @return [Google::Apis::DocsV1::TableCellStyle]
        attr_accessor :table_cell_style
      
        # A table range represents a reference to a subset of a table.
        # It's important to note that the cells specified by a table range do not
        # necessarily form a rectangle. For example, let's say we have a 3 x 3 table
        # where all the cells of the last row are merged together. The table looks
        # like this:
        # 
        # [             ]
        # A table range with table cell location = (table_start_location, row = 0,
        # column = 0), row span = 3 and column span = 2 specifies the following cells:
        # x     x
        # [ x    x    x ]
        # Corresponds to the JSON property `tableRange`
        # @return [Google::Apis::DocsV1::TableRange]
        attr_accessor :table_range
      
        # A particular location in the document.
        # Corresponds to the JSON property `tableStartLocation`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :table_start_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @table_cell_style = args[:table_cell_style] if args.key?(:table_cell_style)
          @table_range = args[:table_range] if args.key?(:table_range)
          @table_start_location = args[:table_start_location] if args.key?(:table_start_location)
        end
      end
      
      # Updates the
      # TableColumnProperties of columns
      # in a table.
      class UpdateTableColumnPropertiesRequest
        include Google::Apis::Core::Hashable
      
        # The list of zero-based column indices whose property should be updated. If
        # no indices are specified, all columns will be updated.
        # Corresponds to the JSON property `columnIndices`
        # @return [Array<Fixnum>]
        attr_accessor :column_indices
      
        # The fields that should be updated.
        # At least one field must be specified. The root `tableColumnProperties` is
        # implied and should not be specified. A single `"*"` can be used as
        # short-hand for listing every field.
        # For example to update the column width, set `fields` to `"width"`.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        # The properties of a column in a table.
        # Corresponds to the JSON property `tableColumnProperties`
        # @return [Google::Apis::DocsV1::TableColumnProperties]
        attr_accessor :table_column_properties
      
        # A particular location in the document.
        # Corresponds to the JSON property `tableStartLocation`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :table_start_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_indices = args[:column_indices] if args.key?(:column_indices)
          @fields = args[:fields] if args.key?(:fields)
          @table_column_properties = args[:table_column_properties] if args.key?(:table_column_properties)
          @table_start_location = args[:table_start_location] if args.key?(:table_start_location)
        end
      end
      
      # Updates the TableRowStyle of rows in a
      # table.
      class UpdateTableRowStyleRequest
        include Google::Apis::Core::Hashable
      
        # The fields that should be updated.
        # At least one field must be specified. The root `tableRowStyle` is implied
        # and should not be specified. A single `"*"` can be used as short-hand for
        # listing every field.
        # For example to update the minimum row height, set `fields` to
        # `"min_row_height"`.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        # The list of zero-based row indices whose style should be updated. If no
        # indices are specified, all rows will be updated.
        # Corresponds to the JSON property `rowIndices`
        # @return [Array<Fixnum>]
        attr_accessor :row_indices
      
        # Styles that apply to a table row.
        # Corresponds to the JSON property `tableRowStyle`
        # @return [Google::Apis::DocsV1::TableRowStyle]
        attr_accessor :table_row_style
      
        # A particular location in the document.
        # Corresponds to the JSON property `tableStartLocation`
        # @return [Google::Apis::DocsV1::Location]
        attr_accessor :table_start_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @row_indices = args[:row_indices] if args.key?(:row_indices)
          @table_row_style = args[:table_row_style] if args.key?(:table_row_style)
          @table_start_location = args[:table_start_location] if args.key?(:table_start_location)
        end
      end
      
      # Update the styling of text.
      class UpdateTextStyleRequest
        include Google::Apis::Core::Hashable
      
        # The fields that should be updated.
        # At least one field must be specified. The root `text_style` is implied and
        # should not be specified. A single `"*"` can be used as short-hand for
        # listing every field.
        # For example, to update the text style to bold, set `fields` to `"bold"`.
        # To reset a property to its default value, include its field name in the
        # field mask but leave the field itself unset.
        # Corresponds to the JSON property `fields`
        # @return [String]
        attr_accessor :fields
      
        # Specifies a contiguous range of text.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DocsV1::Range]
        attr_accessor :range
      
        # Represents the styling that can be applied to text.
        # Inherited text styles are represented as unset fields in this message. A
        # text style's parent depends on where the text style is defined:
        # * The TextStyle of text in a Paragraph
        # inherits from the paragraph's corresponding named style type.
        # * The TextStyle on a named style
        # inherits from the normal text named style.
        # * The TextStyle of the normal text named style inherits
        # from the default text style in the Docs editor.
        # * The TextStyle on a Paragraph element
        # that is contained in a table may inherit its text style from the table
        # style.
        # If the text style does not inherit from a parent, unsetting fields will
        # revert the style to a value matching the defaults in the Docs editor.
        # Corresponds to the JSON property `textStyle`
        # @return [Google::Apis::DocsV1::TextStyle]
        attr_accessor :text_style
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @range = args[:range] if args.key?(:range)
          @text_style = args[:text_style] if args.key?(:text_style)
        end
      end
      
      # Represents a font family and weight of text.
      class WeightedFontFamily
        include Google::Apis::Core::Hashable
      
        # The font family of the text.
        # The font family can be any font from the Font menu in Docs or from
        # [Google Fonts] (https://fonts.google.com/). If the font name is
        # unrecognized, the text is rendered in `Arial`.
        # Corresponds to the JSON property `fontFamily`
        # @return [String]
        attr_accessor :font_family
      
        # The weight of the font. This field can have any value that is a multiple of
        # `100` between `100` and `900`, inclusive. This range corresponds to the
        # numerical values described in the CSS 2.1 Specification,
        # [section 15.6](https://www.w3.org/TR/CSS21/fonts.html#font-boldness), with
        # non-numerical values disallowed.
        # The default value is `400` ("normal").
        # The font weight makes up just one component of the rendered font weight.
        # The rendered weight is determined by a combination of the `weight` and the
        # text style's resolved `bold` value, after accounting for inheritance:
        # * If the text is bold and the weight is less than `400`, the rendered
        # weight is 400.
        # * If the text is bold and the weight is greater than or equal to `400` but
        # is less than `700`, the rendered weight is `700`.
        # * If the weight is greater than or equal to `700`, the rendered weight is
        # equal to the weight.
        # * If the text is not bold, the rendered weight is equal to the weight.
        # Corresponds to the JSON property `weight`
        # @return [Fixnum]
        attr_accessor :weight
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @font_family = args[:font_family] if args.key?(:font_family)
          @weight = args[:weight] if args.key?(:weight)
        end
      end
      
      # Provides control over how write requests are executed.
      class WriteControl
        include Google::Apis::Core::Hashable
      
        # The revision ID of the
        # document that the write request will be applied to. If this is not the
        # latest revision of the document, the request will not be processed and
        # will return a 400 bad request error.
        # When a required revision ID is returned in a response, it indicates the
        # revision ID of the document after the request was applied.
        # Corresponds to the JSON property `requiredRevisionId`
        # @return [String]
        attr_accessor :required_revision_id
      
        # The target revision ID of the
        # document that the write request will be applied to.
        # If collaborator changes have occurred after the document was read using
        # the API, the changes produced by this write request will be transformed
        # against the collaborator changes. This results in a new revision of the
        # document which incorporates both the changes in the request and the
        # collaborator changes, and the Docs server will resolve conflicting
        # changes. When using `target_revision_id`, the API client can be thought
        # of as another collaborator of the document.
        # The target revision ID may only be used to write to recent versions of a
        # document. If the target revision is too far behind the latest revision,
        # the request will not be processed and will return a 400 bad request error
        # and the request should be retried after reading the latest version of the
        # document. In most cases a `revision_id` will remain valid for use as a
        # target revision for several minutes after it is read, but for
        # frequently-edited documents this window may be shorter.
        # Corresponds to the JSON property `targetRevisionId`
        # @return [String]
        attr_accessor :target_revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @required_revision_id = args[:required_revision_id] if args.key?(:required_revision_id)
          @target_revision_id = args[:target_revision_id] if args.key?(:target_revision_id)
        end
      end
    end
  end
end
