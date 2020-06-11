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
    module ProximitybeaconV1beta1
      
      # Defines a unique identifier of a beacon as broadcast by the device.
      class AdvertisedId
        include Google::Apis::Core::Hashable
      
        # The actual beacon identifier, as broadcast by the beacon hardware. Must be
        # [base64](http://tools.ietf.org/html/rfc4648#section-4) encoded in HTTP
        # requests, and will be so encoded (with padding) in responses. The base64
        # encoding should be of the binary byte-stream and not any textual (such as
        # hex) representation thereof.
        # Required.
        # Corresponds to the JSON property `id`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :id
      
        # Specifies the identifier type.
        # Required.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A subset of attachment information served via the
      # `beaconinfo.getforobserved` method, used when your users encounter your
      # beacons.
      class AttachmentInfo
        include Google::Apis::Core::Hashable
      
        # An opaque data container for client-provided data.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # The distance away from the beacon at which this attachment should be
        # delivered to a mobile app.
        # Setting this to a value greater than zero indicates that the app should
        # behave as if the beacon is "seen" when the mobile device is less than this
        # distance away from the beacon.
        # Different attachments on the same beacon can have different max distances.
        # Note that even though this value is expressed with fractional meter
        # precision, real-world behavior is likley to be much less precise than one
        # meter, due to the nature of current Bluetooth radio technology.
        # Optional. When not set or zero, the attachment should be delivered at the
        # beacon's outer limit of detection.
        # Corresponds to the JSON property `maxDistanceMeters`
        # @return [Float]
        attr_accessor :max_distance_meters
      
        # Specifies what kind of attachment this is. Tells a client how to
        # interpret the `data` field. Format is <var>namespace/type</var>, for
        # example <code>scrupulous-wombat-12345/welcome-message</code>
        # Corresponds to the JSON property `namespacedType`
        # @return [String]
        attr_accessor :namespaced_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @max_distance_meters = args[:max_distance_meters] if args.key?(:max_distance_meters)
          @namespaced_type = args[:namespaced_type] if args.key?(:namespaced_type)
        end
      end
      
      # Details of a beacon device.
      class Beacon
        include Google::Apis::Core::Hashable
      
        # Defines a unique identifier of a beacon as broadcast by the device.
        # Corresponds to the JSON property `advertisedId`
        # @return [Google::Apis::ProximitybeaconV1beta1::AdvertisedId]
        attr_accessor :advertised_id
      
        # Resource name of this beacon. A beacon name has the format
        # "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        # the beacon and N is a code for the beacon's type. Possible values are
        # `3` for Eddystone, `1` for iBeacon, or `5` for AltBeacon.
        # This field must be left empty when registering. After reading a beacon,
        # clients can use the name for future operations.
        # Corresponds to the JSON property `beaconName`
        # @return [String]
        attr_accessor :beacon_name
      
        # Free text used to identify and describe the beacon. Maximum length 140
        # characters.
        # Optional.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Write-only registration parameters for beacons using Eddystone-EID format.
        # Two ways of securely registering an Eddystone-EID beacon with the service
        # are supported:
        # 1. Perform an ECDH key exchange via this API, including a previous call
        # to `GET /v1beta1/eidparams`. In this case the fields
        # `beacon_ecdh_public_key` and `service_ecdh_public_key` should be
        # populated and `beacon_identity_key` should not be populated. This
        # method ensures that only the two parties in the ECDH key exchange can
        # compute the identity key, which becomes a secret between them.
        # 2. Derive or obtain the beacon's identity key via other secure means
        # (perhaps an ECDH key exchange between the beacon and a mobile device
        # or any other secure method), and then submit the resulting identity key
        # to the service. In this case `beacon_identity_key` field should be
        # populated, and neither of `beacon_ecdh_public_key` nor
        # `service_ecdh_public_key` fields should be. The security of this method
        # depends on how securely the parties involved (in particular the
        # bluetooth client) handle the identity key, and obviously on how
        # securely the identity key was generated.
        # See [the Eddystone
        # specification](https://github.com/google/eddystone/tree/master/eddystone-eid)
        # at GitHub.
        # Corresponds to the JSON property `ephemeralIdRegistration`
        # @return [Google::Apis::ProximitybeaconV1beta1::EphemeralIdRegistration]
        attr_accessor :ephemeral_id_registration
      
        # Expected location stability. This is set when the beacon is registered or
        # updated, not automatically detected in any way.
        # Optional.
        # Corresponds to the JSON property `expectedStability`
        # @return [String]
        attr_accessor :expected_stability
      
        # Indoor level, a human-readable string as returned by Google Maps APIs,
        # useful to indicate which floor of a building a beacon is located on.
        # Corresponds to the JSON property `indoorLevel`
        # @return [Google::Apis::ProximitybeaconV1beta1::IndoorLevel]
        attr_accessor :indoor_level
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::ProximitybeaconV1beta1::LatLng]
        attr_accessor :lat_lng
      
        # The [Google Places API](/places/place-id) Place ID of the place where
        # the beacon is deployed. This is given when the beacon is registered or
        # updated, not automatically detected in any way.
        # Optional.
        # Corresponds to the JSON property `placeId`
        # @return [String]
        attr_accessor :place_id
      
        # Properties of the beacon device, for example battery type or firmware
        # version.
        # Optional.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # Some beacons may require a user to provide an authorization key before
        # changing any of its configuration (e.g. broadcast frames, transmit power).
        # This field provides a place to store and control access to that key.
        # This field is populated in responses to `GET /v1beta1/beacons/3!beaconId`
        # from users with write access to the given beacon. That is to say: If the
        # user is authorized to write the beacon's confidential data in the service,
        # the service considers them authorized to configure the beacon. Note
        # that this key grants nothing on the service, only on the beacon itself.
        # Corresponds to the JSON property `provisioningKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :provisioning_key
      
        # Current status of the beacon.
        # Required.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertised_id = args[:advertised_id] if args.key?(:advertised_id)
          @beacon_name = args[:beacon_name] if args.key?(:beacon_name)
          @description = args[:description] if args.key?(:description)
          @ephemeral_id_registration = args[:ephemeral_id_registration] if args.key?(:ephemeral_id_registration)
          @expected_stability = args[:expected_stability] if args.key?(:expected_stability)
          @indoor_level = args[:indoor_level] if args.key?(:indoor_level)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
          @place_id = args[:place_id] if args.key?(:place_id)
          @properties = args[:properties] if args.key?(:properties)
          @provisioning_key = args[:provisioning_key] if args.key?(:provisioning_key)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Project-specific data associated with a beacon.
      class BeaconAttachment
        include Google::Apis::Core::Hashable
      
        # Resource name of this attachment. Attachment names have the format:
        # <code>beacons/<var>beacon_id</var>/attachments/<var>attachment_id</var></code>.
        # Leave this empty on creation.
        # Corresponds to the JSON property `attachmentName`
        # @return [String]
        attr_accessor :attachment_name
      
        # The UTC time when this attachment was created, in milliseconds since the
        # UNIX epoch.
        # Corresponds to the JSON property `creationTimeMs`
        # @return [String]
        attr_accessor :creation_time_ms
      
        # An opaque data container for client-provided data. Must be
        # [base64](http://tools.ietf.org/html/rfc4648#section-4) encoded in HTTP
        # requests, and will be so encoded (with padding) in responses.
        # Required.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # The distance away from the beacon at which this attachment should be
        # delivered to a mobile app.
        # Setting this to a value greater than zero indicates that the app should
        # behave as if the beacon is "seen" when the mobile device is less than this
        # distance away from the beacon.
        # Different attachments on the same beacon can have different max distances.
        # Note that even though this value is expressed with fractional meter
        # precision, real-world behavior is likley to be much less precise than one
        # meter, due to the nature of current Bluetooth radio technology.
        # Optional. When not set or zero, the attachment should be delivered at the
        # beacon's outer limit of detection.
        # Negative values are invalid and return an error.
        # Corresponds to the JSON property `maxDistanceMeters`
        # @return [Float]
        attr_accessor :max_distance_meters
      
        # Specifies what kind of attachment this is. Tells a client how to
        # interpret the `data` field. Format is <var>namespace/type</var>. Namespace
        # provides type separation between clients. Type describes the type of
        # `data`, for use by the client when parsing the `data` field.
        # Required.
        # Corresponds to the JSON property `namespacedType`
        # @return [String]
        attr_accessor :namespaced_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachment_name = args[:attachment_name] if args.key?(:attachment_name)
          @creation_time_ms = args[:creation_time_ms] if args.key?(:creation_time_ms)
          @data = args[:data] if args.key?(:data)
          @max_distance_meters = args[:max_distance_meters] if args.key?(:max_distance_meters)
          @namespaced_type = args[:namespaced_type] if args.key?(:namespaced_type)
        end
      end
      
      # A subset of beacon information served via the `beaconinfo.getforobserved`
      # method, which you call when users of your app encounter your beacons.
      class BeaconInfo
        include Google::Apis::Core::Hashable
      
        # Defines a unique identifier of a beacon as broadcast by the device.
        # Corresponds to the JSON property `advertisedId`
        # @return [Google::Apis::ProximitybeaconV1beta1::AdvertisedId]
        attr_accessor :advertised_id
      
        # Attachments matching the type(s) requested.
        # May be empty if no attachment types were requested.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::AttachmentInfo>]
        attr_accessor :attachments
      
        # The name under which the beacon is registered.
        # Corresponds to the JSON property `beaconName`
        # @return [String]
        attr_accessor :beacon_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertised_id = args[:advertised_id] if args.key?(:advertised_id)
          @attachments = args[:attachments] if args.key?(:attachments)
          @beacon_name = args[:beacon_name] if args.key?(:beacon_name)
        end
      end
      
      # Represents a whole or partial calendar date, e.g. a birthday. The time of day
      # and time zone are either specified elsewhere or are not significant. The date
      # is relative to the Proleptic Gregorian Calendar. This can represent:
      # * A full date, with non-zero year, month and day values
      # * A month and day value, with a zero year, e.g. an anniversary
      # * A year on its own, with zero month and day values
      # * A year and month value, with a zero day, e.g. a credit card expiration date
      # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month, or 0
        # if specifying a year by itself or a year and month where the day is not
        # significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of year. Must be from 1 to 12, or 0 if specifying a year without a
        # month and day.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999, or 0 if specifying a date without
        # a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # Response for a request to delete attachments.
      class DeleteAttachmentsResponse
        include Google::Apis::Core::Hashable
      
        # The number of attachments that were deleted.
        # Corresponds to the JSON property `numDeleted`
        # @return [Fixnum]
        attr_accessor :num_deleted
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_deleted = args[:num_deleted] if args.key?(:num_deleted)
        end
      end
      
      # Diagnostics for a single beacon.
      class Diagnostics
        include Google::Apis::Core::Hashable
      
        # An unordered list of Alerts that the beacon has.
        # Corresponds to the JSON property `alerts`
        # @return [Array<String>]
        attr_accessor :alerts
      
        # Resource name of the beacon. For Eddystone-EID beacons, this may
        # be the beacon's current EID, or the beacon's "stable" Eddystone-UID.
        # Corresponds to the JSON property `beaconName`
        # @return [String]
        attr_accessor :beacon_name
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `estimatedLowBatteryDate`
        # @return [Google::Apis::ProximitybeaconV1beta1::Date]
        attr_accessor :estimated_low_battery_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alerts = args[:alerts] if args.key?(:alerts)
          @beacon_name = args[:beacon_name] if args.key?(:beacon_name)
          @estimated_low_battery_date = args[:estimated_low_battery_date] if args.key?(:estimated_low_battery_date)
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
      
      # Write-only registration parameters for beacons using Eddystone-EID format.
      # Two ways of securely registering an Eddystone-EID beacon with the service
      # are supported:
      # 1. Perform an ECDH key exchange via this API, including a previous call
      # to `GET /v1beta1/eidparams`. In this case the fields
      # `beacon_ecdh_public_key` and `service_ecdh_public_key` should be
      # populated and `beacon_identity_key` should not be populated. This
      # method ensures that only the two parties in the ECDH key exchange can
      # compute the identity key, which becomes a secret between them.
      # 2. Derive or obtain the beacon's identity key via other secure means
      # (perhaps an ECDH key exchange between the beacon and a mobile device
      # or any other secure method), and then submit the resulting identity key
      # to the service. In this case `beacon_identity_key` field should be
      # populated, and neither of `beacon_ecdh_public_key` nor
      # `service_ecdh_public_key` fields should be. The security of this method
      # depends on how securely the parties involved (in particular the
      # bluetooth client) handle the identity key, and obviously on how
      # securely the identity key was generated.
      # See [the Eddystone
      # specification](https://github.com/google/eddystone/tree/master/eddystone-eid)
      # at GitHub.
      class EphemeralIdRegistration
        include Google::Apis::Core::Hashable
      
        # The beacon's public key used for the Elliptic curve Diffie-Hellman
        # key exchange. When this field is populated, `service_ecdh_public_key`
        # must also be populated, and `beacon_identity_key` must not be.
        # Corresponds to the JSON property `beaconEcdhPublicKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :beacon_ecdh_public_key
      
        # The private key of the beacon. If this field is populated,
        # `beacon_ecdh_public_key` and `service_ecdh_public_key` must not be
        # populated.
        # Corresponds to the JSON property `beaconIdentityKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :beacon_identity_key
      
        # The initial clock value of the beacon. The beacon's clock must have
        # begun counting at this value immediately prior to transmitting this
        # value to the resolving service. Significant delay in transmitting this
        # value to the service risks registration or resolution failures. If a
        # value is not provided, the default is zero.
        # Corresponds to the JSON property `initialClockValue`
        # @return [Fixnum]
        attr_accessor :initial_clock_value
      
        # An initial ephemeral ID calculated using the clock value submitted as
        # `initial_clock_value`, and the secret key generated by the
        # Diffie-Hellman key exchange using `service_ecdh_public_key` and
        # `service_ecdh_public_key`. This initial EID value will be used by the
        # service to confirm that the key exchange process was successful.
        # Corresponds to the JSON property `initialEid`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :initial_eid
      
        # Indicates the nominal period between each rotation of the beacon's
        # ephemeral ID. "Nominal" because the beacon should randomize the
        # actual interval. See [the spec at
        # github](https://github.com/google/eddystone/tree/master/eddystone-eid)
        # for details. This value corresponds to a power-of-two scaler on the
        # beacon's clock: when the scaler value is K, the beacon will begin
        # broadcasting a new ephemeral ID on average every 2^K seconds.
        # Corresponds to the JSON property `rotationPeriodExponent`
        # @return [Fixnum]
        attr_accessor :rotation_period_exponent
      
        # The service's public key used for the Elliptic curve Diffie-Hellman
        # key exchange. When this field is populated, `beacon_ecdh_public_key`
        # must also be populated, and `beacon_identity_key` must not be.
        # Corresponds to the JSON property `serviceEcdhPublicKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :service_ecdh_public_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @beacon_ecdh_public_key = args[:beacon_ecdh_public_key] if args.key?(:beacon_ecdh_public_key)
          @beacon_identity_key = args[:beacon_identity_key] if args.key?(:beacon_identity_key)
          @initial_clock_value = args[:initial_clock_value] if args.key?(:initial_clock_value)
          @initial_eid = args[:initial_eid] if args.key?(:initial_eid)
          @rotation_period_exponent = args[:rotation_period_exponent] if args.key?(:rotation_period_exponent)
          @service_ecdh_public_key = args[:service_ecdh_public_key] if args.key?(:service_ecdh_public_key)
        end
      end
      
      # Information a client needs to provision and register beacons that
      # broadcast Eddystone-EID format beacon IDs, using Elliptic curve
      # Diffie-Hellman key exchange. See
      # [the Eddystone
      # specification](https://github.com/google/eddystone/tree/master/eddystone-eid)
      # at GitHub.
      class EphemeralIdRegistrationParams
        include Google::Apis::Core::Hashable
      
        # Indicates the maximum rotation period supported by the service.
        # See
        # EddystoneEidRegistration.rotation_period_exponent
        # Corresponds to the JSON property `maxRotationPeriodExponent`
        # @return [Fixnum]
        attr_accessor :max_rotation_period_exponent
      
        # Indicates the minimum rotation period supported by the service.
        # See
        # EddystoneEidRegistration.rotation_period_exponent
        # Corresponds to the JSON property `minRotationPeriodExponent`
        # @return [Fixnum]
        attr_accessor :min_rotation_period_exponent
      
        # The beacon service's public key for use by a beacon to derive its
        # Identity Key using Elliptic Curve Diffie-Hellman key exchange.
        # Corresponds to the JSON property `serviceEcdhPublicKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :service_ecdh_public_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_rotation_period_exponent = args[:max_rotation_period_exponent] if args.key?(:max_rotation_period_exponent)
          @min_rotation_period_exponent = args[:min_rotation_period_exponent] if args.key?(:min_rotation_period_exponent)
          @service_ecdh_public_key = args[:service_ecdh_public_key] if args.key?(:service_ecdh_public_key)
        end
      end
      
      # Request for beacon and attachment information about beacons that
      # a mobile client has encountered "in the wild".
      class GetInfoForObservedBeaconsRequest
        include Google::Apis::Core::Hashable
      
        # Specifies what kind of attachments to include in the response.
        # When given, the response will include only attachments of the given types.
        # When empty, no attachments will be returned. Must be in the format
        # <var>namespace/type</var>. Accepts `*` to specify all types in
        # all namespaces owned by the client.
        # Optional.
        # Corresponds to the JSON property `namespacedTypes`
        # @return [Array<String>]
        attr_accessor :namespaced_types
      
        # The beacons that the client has encountered.
        # At least one must be given.
        # Corresponds to the JSON property `observations`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::Observation>]
        attr_accessor :observations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespaced_types = args[:namespaced_types] if args.key?(:namespaced_types)
          @observations = args[:observations] if args.key?(:observations)
        end
      end
      
      # Information about the requested beacons, optionally including attachment
      # data.
      class GetInfoForObservedBeaconsResponse
        include Google::Apis::Core::Hashable
      
        # Public information about beacons.
        # May be empty if the request matched no beacons.
        # Corresponds to the JSON property `beacons`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::BeaconInfo>]
        attr_accessor :beacons
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @beacons = args[:beacons] if args.key?(:beacons)
        end
      end
      
      # Indoor level, a human-readable string as returned by Google Maps APIs,
      # useful to indicate which floor of a building a beacon is located on.
      class IndoorLevel
        include Google::Apis::Core::Hashable
      
        # The name of this level.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
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
      
      # Response to `ListBeaconAttachments` that contains the requested attachments.
      class ListBeaconAttachmentsResponse
        include Google::Apis::Core::Hashable
      
        # The attachments that corresponded to the request params.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::BeaconAttachment>]
        attr_accessor :attachments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments = args[:attachments] if args.key?(:attachments)
        end
      end
      
      # Response that contains list beacon results and pagination help.
      class ListBeaconsResponse
        include Google::Apis::Core::Hashable
      
        # The beacons that matched the search criteria.
        # Corresponds to the JSON property `beacons`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::Beacon>]
        attr_accessor :beacons
      
        # An opaque pagination token that the client may provide in their next
        # request to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Estimate of the total number of beacons matched by the query. Higher
        # values may be less accurate.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @beacons = args[:beacons] if args.key?(:beacons)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_count = args[:total_count] if args.key?(:total_count)
        end
      end
      
      # Response that contains the requested diagnostics.
      class ListDiagnosticsResponse
        include Google::Apis::Core::Hashable
      
        # The diagnostics matching the given request.
        # Corresponds to the JSON property `diagnostics`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::Diagnostics>]
        attr_accessor :diagnostics
      
        # Token that can be used for pagination. Returned only if the
        # request matches more beacons than can be returned in this response.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @diagnostics = args[:diagnostics] if args.key?(:diagnostics)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response to ListNamespacesRequest that contains all the project's namespaces.
      class ListNamespacesResponse
        include Google::Apis::Core::Hashable
      
        # The attachments that corresponded to the request params.
        # Corresponds to the JSON property `namespaces`
        # @return [Array<Google::Apis::ProximitybeaconV1beta1::Namespace>]
        attr_accessor :namespaces
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespaces = args[:namespaces] if args.key?(:namespaces)
        end
      end
      
      # An attachment namespace defines read and write access for all the attachments
      # created under it. Each namespace is globally unique, and owned by one
      # project which is the only project that can create attachments under it.
      class Namespace
        include Google::Apis::Core::Hashable
      
        # Resource name of this namespace. Namespaces names have the format:
        # <code>namespaces/<var>namespace</var></code>.
        # Corresponds to the JSON property `namespaceName`
        # @return [String]
        attr_accessor :namespace_name
      
        # Specifies what clients may receive attachments under this namespace
        # via `beaconinfo.getforobserved`.
        # Corresponds to the JSON property `servingVisibility`
        # @return [String]
        attr_accessor :serving_visibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespace_name = args[:namespace_name] if args.key?(:namespace_name)
          @serving_visibility = args[:serving_visibility] if args.key?(:serving_visibility)
        end
      end
      
      # Represents one beacon observed once.
      class Observation
        include Google::Apis::Core::Hashable
      
        # Defines a unique identifier of a beacon as broadcast by the device.
        # Corresponds to the JSON property `advertisedId`
        # @return [Google::Apis::ProximitybeaconV1beta1::AdvertisedId]
        attr_accessor :advertised_id
      
        # The array of telemetry bytes received from the beacon. The server is
        # responsible for parsing it. This field may frequently be empty, as
        # with a beacon that transmits telemetry only occasionally.
        # Corresponds to the JSON property `telemetry`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :telemetry
      
        # Time when the beacon was observed.
        # Corresponds to the JSON property `timestampMs`
        # @return [String]
        attr_accessor :timestamp_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertised_id = args[:advertised_id] if args.key?(:advertised_id)
          @telemetry = args[:telemetry] if args.key?(:telemetry)
          @timestamp_ms = args[:timestamp_ms] if args.key?(:timestamp_ms)
        end
      end
    end
  end
end
