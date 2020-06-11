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
    module PolyV1
      
      # Represents and describes an asset in the Poly library. An asset is a 3D model
      # or scene created using [Tilt Brush](//www.tiltbrush.com),
      # [Blocks](//vr.google.com/blocks/), or any 3D program that produces a file
      # that can be upload to Poly.
      class Asset
        include Google::Apis::Core::Hashable
      
        # The author's publicly visible name. Use this name when giving credit to the
        # author. For more information, see [Licensing](/poly/discover/licensing).
        # Corresponds to the JSON property `authorName`
        # @return [String]
        attr_accessor :author_name
      
        # For published assets, the time when the asset was published.
        # For unpublished assets, the time when the asset was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The human-readable description, set by the asset's author.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The human-readable name, set by the asset's author.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A list of Formats where each
        # format describes one representation of the asset.
        # Corresponds to the JSON property `formats`
        # @return [Array<Google::Apis::PolyV1::Format>]
        attr_accessor :formats
      
        # Whether this asset has been curated by the Poly team.
        # Corresponds to the JSON property `isCurated`
        # @return [Boolean]
        attr_accessor :is_curated
        alias_method :is_curated?, :is_curated
      
        # The license under which the author has made the asset available
        # for use, if any.
        # Corresponds to the JSON property `license`
        # @return [String]
        attr_accessor :license
      
        # Application-defined opaque metadata for this asset. This field is only
        # returned when querying for the signed-in user's own assets, not for public
        # assets. This string is limited to 1K chars. It is up to the creator of
        # the asset to define the format for this string (for example, JSON).
        # Corresponds to the JSON property `metadata`
        # @return [String]
        attr_accessor :metadata
      
        # The unique identifier for the asset in the form:
        # `assets/`ASSET_ID``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Hints for displaying the asset, based on information available when the asset
        # was uploaded.
        # Corresponds to the JSON property `presentationParams`
        # @return [Google::Apis::PolyV1::PresentationParams]
        attr_accessor :presentation_params
      
        # Info about the sources of this asset (i.e. assets that were remixed to
        # create this asset).
        # Corresponds to the JSON property `remixInfo`
        # @return [Google::Apis::PolyV1::RemixInfo]
        attr_accessor :remix_info
      
        # Represents a file in Poly, which can be a root,
        # resource, or thumbnail file.
        # Corresponds to the JSON property `thumbnail`
        # @return [Google::Apis::PolyV1::File]
        attr_accessor :thumbnail
      
        # The time when the asset was last modified. For published assets, whose
        # contents are immutable, the update time changes only when metadata
        # properties, such as visibility, are updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # The visibility of the asset and who can access it.
        # Corresponds to the JSON property `visibility`
        # @return [String]
        attr_accessor :visibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author_name = args[:author_name] if args.key?(:author_name)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @formats = args[:formats] if args.key?(:formats)
          @is_curated = args[:is_curated] if args.key?(:is_curated)
          @license = args[:license] if args.key?(:license)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @presentation_params = args[:presentation_params] if args.key?(:presentation_params)
          @remix_info = args[:remix_info] if args.key?(:remix_info)
          @thumbnail = args[:thumbnail] if args.key?(:thumbnail)
          @update_time = args[:update_time] if args.key?(:update_time)
          @visibility = args[:visibility] if args.key?(:visibility)
        end
      end
      
      # A message generated by the asset import process.
      class AssetImportMessage
        include Google::Apis::Core::Hashable
      
        # The code associated with this message.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # An optional file path. Only present for those error codes that specify it.
        # Corresponds to the JSON property `filePath`
        # @return [String]
        attr_accessor :file_path
      
        # A message resulting from reading an image file.
        # Corresponds to the JSON property `imageError`
        # @return [Google::Apis::PolyV1::ImageError]
        attr_accessor :image_error
      
        # Details of an error resulting from parsing an OBJ file
        # Corresponds to the JSON property `objParseError`
        # @return [Google::Apis::PolyV1::ObjParseError]
        attr_accessor :obj_parse_error
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @file_path = args[:file_path] if args.key?(:file_path)
          @image_error = args[:image_error] if args.key?(:image_error)
          @obj_parse_error = args[:obj_parse_error] if args.key?(:obj_parse_error)
        end
      end
      
      # Represents a file in Poly, which can be a root,
      # resource, or thumbnail file.
      class File
        include Google::Apis::Core::Hashable
      
        # The MIME content-type, such as `image/png`.
        # For more information, see
        # [MIME
        # types](//developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types).
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The path of the resource file relative to the
        # root file. For root or thumbnail files,
        # this is just the filename.
        # Corresponds to the JSON property `relativePath`
        # @return [String]
        attr_accessor :relative_path
      
        # The URL where the file data can be retrieved.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @relative_path = args[:relative_path] if args.key?(:relative_path)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # The same asset can be represented in different formats, for example,
      # a [WaveFront .obj](//en.wikipedia.org/wiki/Wavefront_.obj_file) file with its
      # corresponding .mtl file or a [Khronos glTF](//www.khronos.org/gltf) file
      # with its corresponding .glb binary data. A format refers to a specific
      # representation of an asset and contains all information needed to
      # retrieve and describe this representation.
      class Format
        include Google::Apis::Core::Hashable
      
        # Information on the complexity of this Format.
        # Corresponds to the JSON property `formatComplexity`
        # @return [Google::Apis::PolyV1::FormatComplexity]
        attr_accessor :format_complexity
      
        # A short string that identifies the format type of this representation.
        # Possible values are: `FBX`, `GLTF`, `GLTF2`, `OBJ`, and `TILT`.
        # Corresponds to the JSON property `formatType`
        # @return [String]
        attr_accessor :format_type
      
        # A list of dependencies of the root element. May include, but is not
        # limited to, materials, textures, and shader programs.
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::PolyV1::File>]
        attr_accessor :resources
      
        # Represents a file in Poly, which can be a root,
        # resource, or thumbnail file.
        # Corresponds to the JSON property `root`
        # @return [Google::Apis::PolyV1::File]
        attr_accessor :root
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @format_complexity = args[:format_complexity] if args.key?(:format_complexity)
          @format_type = args[:format_type] if args.key?(:format_type)
          @resources = args[:resources] if args.key?(:resources)
          @root = args[:root] if args.key?(:root)
        end
      end
      
      # Information on the complexity of this Format.
      class FormatComplexity
        include Google::Apis::Core::Hashable
      
        # A non-negative integer that represents the level of detail (LOD) of this
        # format relative to other formats of the same asset with the same
        # format_type.
        # This hint allows you to sort formats from the most-detailed (0) to
        # least-detailed (integers greater than 0).
        # Corresponds to the JSON property `lodHint`
        # @return [Fixnum]
        attr_accessor :lod_hint
      
        # The estimated number of triangles.
        # Corresponds to the JSON property `triangleCount`
        # @return [Fixnum]
        attr_accessor :triangle_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lod_hint = args[:lod_hint] if args.key?(:lod_hint)
          @triangle_count = args[:triangle_count] if args.key?(:triangle_count)
        end
      end
      
      # A message resulting from reading an image file.
      class ImageError
        include Google::Apis::Core::Hashable
      
        # The type of image error encountered. Optional for older image errors.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # The file path in the import of the image that was rejected.
        # Corresponds to the JSON property `filePath`
        # @return [String]
        attr_accessor :file_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @file_path = args[:file_path] if args.key?(:file_path)
        end
      end
      
      # A response message from a request to list.
      class ListAssetsResponse
        include Google::Apis::Core::Hashable
      
        # A list of assets that match the criteria specified in the request.
        # Corresponds to the JSON property `assets`
        # @return [Array<Google::Apis::PolyV1::Asset>]
        attr_accessor :assets
      
        # The continuation token for retrieving the next page. If empty,
        # indicates that there are no more pages. To get the next page, submit the
        # same request specifying this value as the
        # page_token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of assets in the list, without pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assets = args[:assets] if args.key?(:assets)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # A response message from a request to list.
      class ListLikedAssetsResponse
        include Google::Apis::Core::Hashable
      
        # A list of assets that match the criteria specified in the request.
        # Corresponds to the JSON property `assets`
        # @return [Array<Google::Apis::PolyV1::Asset>]
        attr_accessor :assets
      
        # The continuation token for retrieving the next page. If empty,
        # indicates that there are no more pages. To get the next page, submit the
        # same request specifying this value as the
        # page_token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of assets in the list, without pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assets = args[:assets] if args.key?(:assets)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # A response message from a request to list.
      class ListUserAssetsResponse
        include Google::Apis::Core::Hashable
      
        # The continuation token for retrieving the next page. If empty,
        # indicates that there are no more pages. To get the next page, submit the
        # same request specifying this value as the
        # page_token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of assets in the list, without pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        # A list of UserAssets matching the request.
        # Corresponds to the JSON property `userAssets`
        # @return [Array<Google::Apis::PolyV1::UserAsset>]
        attr_accessor :user_assets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
          @user_assets = args[:user_assets] if args.key?(:user_assets)
        end
      end
      
      # Details of an error resulting from parsing an OBJ file
      class ObjParseError
        include Google::Apis::Core::Hashable
      
        # The type of problem found (required).
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # The ending character index at which the problem was found.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # The file path in which the problem was found.
        # Corresponds to the JSON property `filePath`
        # @return [String]
        attr_accessor :file_path
      
        # The text of the line. Note that this may be truncated if the line was very
        # long. This may not include the error if it occurs after line truncation.
        # Corresponds to the JSON property `line`
        # @return [String]
        attr_accessor :line
      
        # Line number at which the problem was found.
        # Corresponds to the JSON property `lineNumber`
        # @return [Fixnum]
        attr_accessor :line_number
      
        # The starting character index at which the problem was found.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @end_index = args[:end_index] if args.key?(:end_index)
          @file_path = args[:file_path] if args.key?(:file_path)
          @line = args[:line] if args.key?(:line)
          @line_number = args[:line_number] if args.key?(:line_number)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Hints for displaying the asset, based on information available when the asset
      # was uploaded.
      class PresentationParams
        include Google::Apis::Core::Hashable
      
        # A background color which could be used for displaying the 3D asset in a
        # 'thumbnail' or 'palette' style view. Authors have the option to set this
        # background color when publishing or editing their asset.
        # This is represented as a six-digit hexademical triplet specifying the
        # RGB components of the background color, e.g. #FF0000 for Red.
        # Corresponds to the JSON property `backgroundColor`
        # @return [String]
        attr_accessor :background_color
      
        # The materials' diffuse/albedo color. This does not apply to vertex colors
        # or texture maps.
        # Corresponds to the JSON property `colorSpace`
        # @return [String]
        attr_accessor :color_space
      
        # A [Quaternion](//en.wikipedia.org/wiki/Quaternion). Please note: if in the
        # response you see "w: 1" and nothing else this is the default value of
        # [0, 0, 0, 1] where x,y, and z are 0.
        # Corresponds to the JSON property `orientingRotation`
        # @return [Google::Apis::PolyV1::Quaternion]
        attr_accessor :orienting_rotation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @background_color = args[:background_color] if args.key?(:background_color)
          @color_space = args[:color_space] if args.key?(:color_space)
          @orienting_rotation = args[:orienting_rotation] if args.key?(:orienting_rotation)
        end
      end
      
      # A [Quaternion](//en.wikipedia.org/wiki/Quaternion). Please note: if in the
      # response you see "w: 1" and nothing else this is the default value of
      # [0, 0, 0, 1] where x,y, and z are 0.
      class Quaternion
        include Google::Apis::Core::Hashable
      
        # The scalar component.
        # Corresponds to the JSON property `w`
        # @return [Float]
        attr_accessor :w
      
        # The x component.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # The y component.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # The z component.
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @w = args[:w] if args.key?(:w)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # Info about the sources of this asset (i.e. assets that were remixed to
      # create this asset).
      class RemixInfo
        include Google::Apis::Core::Hashable
      
        # Resource ids for the sources of this remix, of the form:
        # `assets/`ASSET_ID``
        # Corresponds to the JSON property `sourceAsset`
        # @return [Array<String>]
        attr_accessor :source_asset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_asset = args[:source_asset] if args.key?(:source_asset)
        end
      end
      
      # A response message from a request to
      # startImport. This is returned in the response
      # field of the Operation.
      class StartAssetImportResponse
        include Google::Apis::Core::Hashable
      
        # The id of newly created asset. If this is empty when the operation is
        # complete it means the import failed. Please refer to the
        # assetImportMessages field to understand what went wrong.
        # Corresponds to the JSON property `assetId`
        # @return [String]
        attr_accessor :asset_id
      
        # The id of the asset import.
        # Corresponds to the JSON property `assetImportId`
        # @return [String]
        attr_accessor :asset_import_id
      
        # The message from the asset import. This will contain any warnings
        # (or - in the case of failure - errors) that occurred during import.
        # Corresponds to the JSON property `assetImportMessages`
        # @return [Array<Google::Apis::PolyV1::AssetImportMessage>]
        attr_accessor :asset_import_messages
      
        # The publish URL for the asset.
        # Corresponds to the JSON property `publishUrl`
        # @return [String]
        attr_accessor :publish_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset_id = args[:asset_id] if args.key?(:asset_id)
          @asset_import_id = args[:asset_import_id] if args.key?(:asset_import_id)
          @asset_import_messages = args[:asset_import_messages] if args.key?(:asset_import_messages)
          @publish_url = args[:publish_url] if args.key?(:publish_url)
        end
      end
      
      # Data about the user's asset.
      class UserAsset
        include Google::Apis::Core::Hashable
      
        # Represents and describes an asset in the Poly library. An asset is a 3D model
        # or scene created using [Tilt Brush](//www.tiltbrush.com),
        # [Blocks](//vr.google.com/blocks/), or any 3D program that produces a file
        # that can be upload to Poly.
        # Corresponds to the JSON property `asset`
        # @return [Google::Apis::PolyV1::Asset]
        attr_accessor :asset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset = args[:asset] if args.key?(:asset)
        end
      end
    end
  end
end
