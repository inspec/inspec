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
    module StreetviewpublishV1
      
      # Request to delete multiple Photos.
      class BatchDeletePhotosRequest
        include Google::Apis::Core::Hashable
      
        # Required. IDs of the Photos. HTTP
        # GET requests require the following syntax for the URL query parameter:
        # `photoIds=<id1>&photoIds=<id2>&...`.
        # Corresponds to the JSON property `photoIds`
        # @return [Array<String>]
        attr_accessor :photo_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @photo_ids = args[:photo_ids] if args.key?(:photo_ids)
        end
      end
      
      # Response to batch delete of one or more
      # Photos.
      class BatchDeletePhotosResponse
        include Google::Apis::Core::Hashable
      
        # The status for the operation to delete a single
        # Photo in the batch request.
        # Corresponds to the JSON property `status`
        # @return [Array<Google::Apis::StreetviewpublishV1::Status>]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Response to batch get of Photos.
      class BatchGetPhotosResponse
        include Google::Apis::Core::Hashable
      
        # List of results for each individual
        # Photo requested, in the same order as
        # the requests in
        # BatchGetPhotos.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::StreetviewpublishV1::PhotoResponse>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Request to update the metadata of photos.
      # Updating the pixels of photos is not supported.
      class BatchUpdatePhotosRequest
        include Google::Apis::Core::Hashable
      
        # Required. List of
        # UpdatePhotoRequests.
        # Corresponds to the JSON property `updatePhotoRequests`
        # @return [Array<Google::Apis::StreetviewpublishV1::UpdatePhotoRequest>]
        attr_accessor :update_photo_requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @update_photo_requests = args[:update_photo_requests] if args.key?(:update_photo_requests)
        end
      end
      
      # Response to batch update of metadata of one or more
      # Photos.
      class BatchUpdatePhotosResponse
        include Google::Apis::Core::Hashable
      
        # List of results for each individual
        # Photo updated, in the same order as
        # the request.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::StreetviewpublishV1::PhotoResponse>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # A connection is the link from a source photo to a destination photo.
      class Connection
        include Google::Apis::Core::Hashable
      
        # Identifier for a Photo.
        # Corresponds to the JSON property `target`
        # @return [Google::Apis::StreetviewpublishV1::PhotoId]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target = args[:target] if args.key?(:target)
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
      
      # Level information containing level number and its corresponding name.
      class Level
        include Google::Apis::Core::Hashable
      
        # Required. A name assigned to this Level, restricted to 3 characters.
        # Consider how the elevator buttons would be labeled for this level if there
        # was an elevator.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Floor number, used for ordering. 0 indicates the ground level, 1 indicates
        # the first level above ground level, -1 indicates the first level under
        # ground level. Non-integer values are OK.
        # Corresponds to the JSON property `number`
        # @return [Float]
        attr_accessor :number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @number = args[:number] if args.key?(:number)
        end
      end
      
      # Response to list all photos that belong to a user.
      class ListPhotosResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of photos. The
        # pageSize field
        # in the request determines the number of items returned.
        # Corresponds to the JSON property `photos`
        # @return [Array<Google::Apis::StreetviewpublishV1::Photo>]
        attr_accessor :photos
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @photos = args[:photos] if args.key?(:photos)
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
        # @return [Google::Apis::StreetviewpublishV1::Status]
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
      
      # Photo is used to store 360 photos along with photo metadata.
      class Photo
        include Google::Apis::Core::Hashable
      
        # Absolute time when the photo was captured.
        # When the photo has no exif timestamp, this is used to set a timestamp in
        # the photo metadata.
        # Corresponds to the JSON property `captureTime`
        # @return [String]
        attr_accessor :capture_time
      
        # Connections to other photos. A connection represents the link from this
        # photo to another photo.
        # Corresponds to the JSON property `connections`
        # @return [Array<Google::Apis::StreetviewpublishV1::Connection>]
        attr_accessor :connections
      
        # Output only. The download URL for the photo bytes. This field is set only
        # when
        # GetPhotoRequest.view
        # is set to
        # PhotoView.INCLUDE_DOWNLOAD_URL.
        # Corresponds to the JSON property `downloadUrl`
        # @return [String]
        attr_accessor :download_url
      
        # Output only. Status in Google Maps, whether this photo was published or
        # rejected.
        # Corresponds to the JSON property `mapsPublishStatus`
        # @return [String]
        attr_accessor :maps_publish_status
      
        # Identifier for a Photo.
        # Corresponds to the JSON property `photoId`
        # @return [Google::Apis::StreetviewpublishV1::PhotoId]
        attr_accessor :photo_id
      
        # Places where this photo belongs.
        # Corresponds to the JSON property `places`
        # @return [Array<Google::Apis::StreetviewpublishV1::Place>]
        attr_accessor :places
      
        # Raw pose measurement for an entity.
        # Corresponds to the JSON property `pose`
        # @return [Google::Apis::StreetviewpublishV1::Pose]
        attr_accessor :pose
      
        # Output only. The share link for the photo.
        # Corresponds to the JSON property `shareLink`
        # @return [String]
        attr_accessor :share_link
      
        # Output only. The thumbnail URL for showing a preview of the given photo.
        # Corresponds to the JSON property `thumbnailUrl`
        # @return [String]
        attr_accessor :thumbnail_url
      
        # Output only. Status of rights transfer on this photo.
        # Corresponds to the JSON property `transferStatus`
        # @return [String]
        attr_accessor :transfer_status
      
        # Upload reference for media files.
        # Corresponds to the JSON property `uploadReference`
        # @return [Google::Apis::StreetviewpublishV1::UploadRef]
        attr_accessor :upload_reference
      
        # Output only. View count of the photo.
        # Corresponds to the JSON property `viewCount`
        # @return [Fixnum]
        attr_accessor :view_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @capture_time = args[:capture_time] if args.key?(:capture_time)
          @connections = args[:connections] if args.key?(:connections)
          @download_url = args[:download_url] if args.key?(:download_url)
          @maps_publish_status = args[:maps_publish_status] if args.key?(:maps_publish_status)
          @photo_id = args[:photo_id] if args.key?(:photo_id)
          @places = args[:places] if args.key?(:places)
          @pose = args[:pose] if args.key?(:pose)
          @share_link = args[:share_link] if args.key?(:share_link)
          @thumbnail_url = args[:thumbnail_url] if args.key?(:thumbnail_url)
          @transfer_status = args[:transfer_status] if args.key?(:transfer_status)
          @upload_reference = args[:upload_reference] if args.key?(:upload_reference)
          @view_count = args[:view_count] if args.key?(:view_count)
        end
      end
      
      # Identifier for a Photo.
      class PhotoId
        include Google::Apis::Core::Hashable
      
        # Required. A unique identifier for a photo.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # Response payload for a single
      # Photo
      # in batch operations including
      # BatchGetPhotos
      # and
      # BatchUpdatePhotos.
      class PhotoResponse
        include Google::Apis::Core::Hashable
      
        # Photo is used to store 360 photos along with photo metadata.
        # Corresponds to the JSON property `photo`
        # @return [Google::Apis::StreetviewpublishV1::Photo]
        attr_accessor :photo
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::StreetviewpublishV1::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @photo = args[:photo] if args.key?(:photo)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Place metadata for an entity.
      class Place
        include Google::Apis::Core::Hashable
      
        # Output-only. The language_code that the name is localized with. This should
        # be the language_code specified in the request, but may be a fallback.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Output-only. The name of the place, localized to the language_code.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Place identifier, as described in
        # https://developers.google.com/places/place-id.
        # Corresponds to the JSON property `placeId`
        # @return [String]
        attr_accessor :place_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @name = args[:name] if args.key?(:name)
          @place_id = args[:place_id] if args.key?(:place_id)
        end
      end
      
      # Raw pose measurement for an entity.
      class Pose
        include Google::Apis::Core::Hashable
      
        # The estimated horizontal accuracy of this pose in meters with 68%
        # confidence (one standard deviation). For example, on Android, this value is
        # available from this method:
        # https://developer.android.com/reference/android/location/Location#getAccuracy()
        # .
        # Other platforms have different methods of obtaining similar accuracy
        # estimations.
        # Corresponds to the JSON property `accuracyMeters`
        # @return [Float]
        attr_accessor :accuracy_meters
      
        # Altitude of the pose in meters above WGS84 ellipsoid.
        # NaN indicates an unmeasured quantity.
        # Corresponds to the JSON property `altitude`
        # @return [Float]
        attr_accessor :altitude
      
        # Compass heading, measured at the center of the photo in degrees clockwise
        # from North. Value must be >=0 and <360.
        # NaN indicates an unmeasured quantity.
        # Corresponds to the JSON property `heading`
        # @return [Float]
        attr_accessor :heading
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLngPair`
        # @return [Google::Apis::StreetviewpublishV1::LatLng]
        attr_accessor :lat_lng_pair
      
        # Level information containing level number and its corresponding name.
        # Corresponds to the JSON property `level`
        # @return [Google::Apis::StreetviewpublishV1::Level]
        attr_accessor :level
      
        # Pitch, measured at the center of the photo in degrees. Value must be >=-90
        # and <= 90. A value of -90 means looking directly down, and a value of 90
        # means looking directly up.
        # NaN indicates an unmeasured quantity.
        # Corresponds to the JSON property `pitch`
        # @return [Float]
        attr_accessor :pitch
      
        # Roll, measured in degrees. Value must be >= 0 and <360. A value of 0
        # means level with the horizon.
        # NaN indicates an unmeasured quantity.
        # Corresponds to the JSON property `roll`
        # @return [Float]
        attr_accessor :roll
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accuracy_meters = args[:accuracy_meters] if args.key?(:accuracy_meters)
          @altitude = args[:altitude] if args.key?(:altitude)
          @heading = args[:heading] if args.key?(:heading)
          @lat_lng_pair = args[:lat_lng_pair] if args.key?(:lat_lng_pair)
          @level = args[:level] if args.key?(:level)
          @pitch = args[:pitch] if args.key?(:pitch)
          @roll = args[:roll] if args.key?(:roll)
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
      
      # Request to update the metadata of a
      # Photo. Updating the pixels of a photo
      # is not supported.
      class UpdatePhotoRequest
        include Google::Apis::Core::Hashable
      
        # Photo is used to store 360 photos along with photo metadata.
        # Corresponds to the JSON property `photo`
        # @return [Google::Apis::StreetviewpublishV1::Photo]
        attr_accessor :photo
      
        # Required. Mask that identifies fields on the photo metadata to update.
        # If not present, the old Photo
        # metadata is entirely replaced with the
        # new Photo metadata in this request.
        # The update fails if invalid fields are specified. Multiple fields can be
        # specified in a comma-delimited list.
        # The following fields are valid:
        # * `pose.heading`
        # * `pose.latLngPair`
        # * `pose.pitch`
        # * `pose.roll`
        # * `pose.level`
        # * `pose.altitude`
        # * `connections`
        # * `places`
        # <aside class="note"><b>Note:</b> When
        # updateMask
        # contains repeated fields, the entire set of repeated values get replaced
        # with the new contents. For example, if
        # updateMask
        # contains `connections` and `UpdatePhotoRequest.photo.connections` is empty,
        # all connections are removed.</aside>
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @photo = args[:photo] if args.key?(:photo)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Upload reference for media files.
      class UploadRef
        include Google::Apis::Core::Hashable
      
        # Required. An upload reference should be unique for each user. It follows
        # the form:
        # "https://streetviewpublish.googleapis.com/media/user/`account_id`/photo/`
        # upload_reference`"
        # Corresponds to the JSON property `uploadUrl`
        # @return [String]
        attr_accessor :upload_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @upload_url = args[:upload_url] if args.key?(:upload_url)
        end
      end
    end
  end
end
