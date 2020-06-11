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
    module BigqueryreservationV1alpha2
      
      class CreateSlotPoolMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReservationGrantsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReservationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSlotPoolsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Reservation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationGrant
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchReservationGrantsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SlotPool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateSlotPoolMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :slot_pool, as: 'slotPool'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListReservationGrantsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :reservation_grants, as: 'reservationGrants', class: Google::Apis::BigqueryreservationV1alpha2::ReservationGrant, decorator: Google::Apis::BigqueryreservationV1alpha2::ReservationGrant::Representation
      
        end
      end
      
      class ListReservationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :reservations, as: 'reservations', class: Google::Apis::BigqueryreservationV1alpha2::Reservation, decorator: Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
      
        end
      end
      
      class ListSlotPoolsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :slot_pools, as: 'slotPools', class: Google::Apis::BigqueryreservationV1alpha2::SlotPool, decorator: Google::Apis::BigqueryreservationV1alpha2::SlotPool::Representation
      
        end
      end
      
      class LocationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :legacy_location_id, as: 'legacyLocationId'
        end
      end
      
      class Reservation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :slot_capacity, :numeric_string => true, as: 'slotCapacity'
          property :use_parent_reservation, as: 'useParentReservation'
        end
      end
      
      class ReservationGrant
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :grantee, as: 'grantee'
          property :job_type, as: 'jobType'
          property :name, as: 'name'
          property :reservation, as: 'reservation'
        end
      end
      
      class SearchReservationGrantsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :reservation_grants, as: 'reservationGrants', class: Google::Apis::BigqueryreservationV1alpha2::ReservationGrant, decorator: Google::Apis::BigqueryreservationV1alpha2::ReservationGrant::Representation
      
        end
      end
      
      class SlotPool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commitment_end_time, as: 'commitmentEndTime'
          property :name, as: 'name'
          property :plan, as: 'plan'
          property :slot_count, :numeric_string => true, as: 'slotCount'
          property :state, as: 'state'
        end
      end
    end
  end
end
