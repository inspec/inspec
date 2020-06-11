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
    module BigqueryreservationV1beta1
      
      # A Assignment allows a project to submit jobs
      # of a certain type using slots from the specified reservation.
      class Assignment
        include Google::Apis::Core::Hashable
      
        # The resource which will use the reservation. E.g.
        # projects/myproject, folders/123, organizations/456.
        # Corresponds to the JSON property `assignee`
        # @return [String]
        attr_accessor :assignee
      
        # Which type of jobs will use the reservation.
        # Corresponds to the JSON property `jobType`
        # @return [String]
        attr_accessor :job_type
      
        # Output only. Name of the resource. E.g.:
        # projects/myproject/locations/US/reservations/team1-prod/assignments/123.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assignee = args[:assignee] if args.key?(:assignee)
          @job_type = args[:job_type] if args.key?(:job_type)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Capacity commitment is a way to purchase compute capacity for BigQuery jobs
      # (in the form of slots) with some minimum committed period of usage. Capacity
      # commitment is immutable and cannot be deleted until the end of the commitment
      # period. After the end of the commitment period, slots are still available but
      # can be freely removed any time.
      # A capacity commitment resource exists as a child resource of the admin
      # project.
      class CapacityCommitment
        include Google::Apis::Core::Hashable
      
        # Output only. The end of the commitment period. Capacity commitment cannot be
        # removed before commitment_end_time. It is applicable only for ACTIVE
        # capacity commitments and is computed as a combination of the plan and the
        # time when the capacity commitment became ACTIVE.
        # Corresponds to the JSON property `commitmentEndTime`
        # @return [String]
        attr_accessor :commitment_end_time
      
        # Output only. The resource name of the capacity commitment, e.g.,
        # projects/myproject/locations/US/capacityCommitments/123
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Capacity commitment commitment plan.
        # Corresponds to the JSON property `plan`
        # @return [String]
        attr_accessor :plan
      
        # Number of slots in this commitment.
        # Corresponds to the JSON property `slotCount`
        # @return [Fixnum]
        attr_accessor :slot_count
      
        # Output only. State of the commitment.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commitment_end_time = args[:commitment_end_time] if args.key?(:commitment_end_time)
          @name = args[:name] if args.key?(:name)
          @plan = args[:plan] if args.key?(:plan)
          @slot_count = args[:slot_count] if args.key?(:slot_count)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The metadata for operation returned from
      # ReservationService.CreateCapacityCommitment.
      class CreateCapacityCommitmentMetadata
        include Google::Apis::Core::Hashable
      
        # Resource name of the capacity commitment that is being created. E.g.,
        # projects/myproject/locations/US/capacityCommitments/123
        # Corresponds to the JSON property `capacityCommitment`
        # @return [String]
        attr_accessor :capacity_commitment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @capacity_commitment = args[:capacity_commitment] if args.key?(:capacity_commitment)
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
      
      # The response for ReservationService.ListAssignments.
      class ListAssignmentsResponse
        include Google::Apis::Core::Hashable
      
        # List of assignments visible to the user.
        # Corresponds to the JSON property `assignments`
        # @return [Array<Google::Apis::BigqueryreservationV1beta1::Assignment>]
        attr_accessor :assignments
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assignments = args[:assignments] if args.key?(:assignments)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for ReservationService.ListCapacityCommitments.
      class ListCapacityCommitmentsResponse
        include Google::Apis::Core::Hashable
      
        # List of capacity commitments visible to the user.
        # Corresponds to the JSON property `capacityCommitments`
        # @return [Array<Google::Apis::BigqueryreservationV1beta1::CapacityCommitment>]
        attr_accessor :capacity_commitments
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @capacity_commitments = args[:capacity_commitments] if args.key?(:capacity_commitments)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::BigqueryreservationV1beta1::Location>]
        attr_accessor :locations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for ReservationService.ListReservations.
      class ListReservationsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of reservations visible to the user.
        # Corresponds to the JSON property `reservations`
        # @return [Array<Google::Apis::BigqueryreservationV1beta1::Reservation>]
        attr_accessor :reservations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @reservations = args[:reservations] if args.key?(:reservations)
        end
      end
      
      # A resource that represents Google Cloud Platform location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name.
        # For example, "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example
        # `"cloud.googleapis.com/region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The canonical id for this location. For example: `"us-east1"`.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations.
        # For example: `"projects/example-project/locations/us-east1"`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # BigQuery-specific metadata about a location. This will be set on
      # google.cloud.location.Location.metadata in Cloud Location API
      # responses.
      class LocationMetadata
        include Google::Apis::Core::Hashable
      
        # The legacy BigQuery location ID, e.g. “EU” for the “europe” location.
        # This is for any API consumers that need the legacy “US” and “EU” locations.
        # Corresponds to the JSON property `legacyLocationId`
        # @return [String]
        attr_accessor :legacy_location_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @legacy_location_id = args[:legacy_location_id] if args.key?(:legacy_location_id)
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
        # @return [Google::Apis::BigqueryreservationV1beta1::Status]
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
      
      # A reservation is a mechanism used to guarantee slots to users.
      class Reservation
        include Google::Apis::Core::Hashable
      
        # If true, any query using this reservation might be able to use the idle
        # slots from other reservations within the same admin project. If false, a
        # query using this reservation will execute with the maximum slot capacity as
        # specified above. If not specified, default value is true.
        # Corresponds to the JSON property `ignoreIdleSlots`
        # @return [Boolean]
        attr_accessor :ignore_idle_slots
        alias_method :ignore_idle_slots?, :ignore_idle_slots
      
        # The resource name of the reservation, e.g.,
        # "projects/*/locations/*/reservations/team1-prod".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Maximum slots available to this reservation. A slot is a unit of
        # computational power in BigQuery, and serves as the unit of parallelism. In
        # a scan of a multi-partitioned table, a single slot operates on a single
        # partition of the table.
        # If the new reservation's slot capacity exceed the parent's slot capacity or
        # if total slot capacity of the new reservation and its siblings exceeds the
        # parent's slot capacity, the request will fail with
        # `google.rpc.Code.RESOURCE_EXHAUSTED`.
        # Corresponds to the JSON property `slotCapacity`
        # @return [Fixnum]
        attr_accessor :slot_capacity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_idle_slots = args[:ignore_idle_slots] if args.key?(:ignore_idle_slots)
          @name = args[:name] if args.key?(:name)
          @slot_capacity = args[:slot_capacity] if args.key?(:slot_capacity)
        end
      end
      
      # The response for ReservationService.SearchAssignments.
      class SearchAssignmentsResponse
        include Google::Apis::Core::Hashable
      
        # List of assignments visible to the user.
        # Corresponds to the JSON property `assignments`
        # @return [Array<Google::Apis::BigqueryreservationV1beta1::Assignment>]
        attr_accessor :assignments
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @assignments = args[:assignments] if args.key?(:assignments)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
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
    end
  end
end
