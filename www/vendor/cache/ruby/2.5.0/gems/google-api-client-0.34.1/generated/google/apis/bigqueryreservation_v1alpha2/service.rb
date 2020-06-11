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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module BigqueryreservationV1alpha2
      # BigQuery Reservation API
      #
      # A service to modify your BigQuery flat-rate reservations.
      #
      # @example
      #    require 'google/apis/bigqueryreservation_v1alpha2'
      #
      #    Bigqueryreservation = Google::Apis::BigqueryreservationV1alpha2 # Alias the module
      #    service = Bigqueryreservation::BigQueryReservationService.new
      #
      # @see https://cloud.google.com/bigquery/
      class BigQueryReservationService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://bigqueryreservation.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Look up grants for a specified resource for a particular region.
        # If the request is about a project:
        # 1) Grants created on the project will be returned if they exist.
        # 2) Otherwise grants created on the closest ancestor will be returned.
        # 3) Grants for different JobTypes will all be returned.
        # Same logic applies if the request is about a folder.
        # If the request is about an organization, then grants created on the
        # organization will be returned (organization doesn't have ancestors).
        # Comparing to ListReservationGrants, there are two behavior
        # differences:
        # 1) permission on the grantee will be verified in this API.
        # 2) Hierarchy lookup (project->folder->organization) happens in this API.
        # @param [String] parent
        #   The parent resource name (containing project and location), which owns the
        #   grants. e.g.:
        #   "projects/myproject/locations/us-central1".
        # @param [Fixnum] page_size
        #   The maximum number of items to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] query
        #   Please specify resource name as grantee in the query.
        #   e.g., "grantee=projects/myproject"
        #   "grantee=folders/123"
        #   "grantee=organizations/456"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::SearchReservationGrantsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::SearchReservationGrantsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_project_location_reservation_grants(parent, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+parent}:SearchReservationGrants', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::SearchReservationGrantsResponse::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::SearchReservationGrantsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns `google.rpc.Code.PERMISSION_DENIED` if user does not have
        # 'bigquery.admin' permissions on the project using the reservation
        # and the project that owns this reservation.
        # Returns `google.rpc.Code.INVALID_ARGUMENT` when location of the grant
        # does not match location of the reservation.
        # @param [String] parent
        #   The parent resource name of the reservation grant
        #   E.g.: projects/myproject/location/eu.
        # @param [Google::Apis::BigqueryreservationV1alpha2::ReservationGrant] reservation_grant_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::ReservationGrant] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::ReservationGrant]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_reservation_grant(parent, reservation_grant_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha2/{+parent}/reservationGrants', options)
          command.request_representation = Google::Apis::BigqueryreservationV1alpha2::ReservationGrant::Representation
          command.request_object = reservation_grant_object
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::ReservationGrant::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::ReservationGrant
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a reservation grant. No expansion will happen.
        # E.g:
        # organizationA contains project1 and project2. Reservation res1 exists.
        # CreateReservationGrant was invoked previously and following grants were
        # created explicitly:
        # <organizationA, res1>
        # <project1, res1>
        # Then deletion of <organizationA, res1> won't affect <project1, res1>. After
        # deletion of <organizationA, res1>, queries from project1 will still use
        # res1, while queries from project2 will use on-demand mode.
        # @param [String] name
        #   Name of the resource, e.g.:
        #   projects/myproject/locations/eu/reservationGrants/123
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_reservation_grant(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha2/{+name}', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Empty::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists reservation grants.
        # Only explicitly created grants will be returned. E.g:
        # organizationA contains project1 and project2. Reservation res1 exists.
        # CreateReservationGrant was invoked previously and following grants were
        # created explicitly:
        # <organizationA, res1>
        # <project1, res1>
        # Then this API will just return the above two grants for reservation res1,
        # and no expansion/merge will happen.
        # @param [String] parent
        #   The parent resource name e.g.: projects/myproject/location/eu.
        # @param [Fixnum] page_size
        #   The maximum number of items to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::ListReservationGrantsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::ListReservationGrantsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_reservation_grants(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+parent}/reservationGrants', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::ListReservationGrantsResponse::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::ListReservationGrantsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new reservation resource. Multiple reservations are created if
        # the ancestor reservations do not exist.
        # @param [String] parent
        #   Project, location, and (optionally) reservation name. E.g.,
        #   projects/myproject/locations/us-central1/reservations/parent
        # @param [Google::Apis::BigqueryreservationV1alpha2::Reservation] reservation_object
        # @param [String] reservation_id
        #   The reservation ID relative to the parent, e.g., "dev". This field must
        #   only contain alphanumeric characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Reservation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Reservation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_reservation(parent, reservation_object = nil, reservation_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha2/{+parent}/reservations', options)
          command.request_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.request_object = reservation_object
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Reservation
          command.params['parent'] = parent unless parent.nil?
          command.query['reservationId'] = reservation_id unless reservation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new reservation resource. Multiple reservations are created if
        # the ancestor reservations do not exist.
        # @param [String] parent
        #   Project, location, and (optionally) reservation name. E.g.,
        #   projects/myproject/locations/us-central1/reservations/parent
        # @param [Google::Apis::BigqueryreservationV1alpha2::Reservation] reservation_object
        # @param [String] reservation_id
        #   The reservation ID relative to the parent, e.g., "dev". This field must
        #   only contain alphanumeric characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Reservation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Reservation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_reservation_reservation(parent, reservation_object = nil, reservation_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha2/{+parent}', options)
          command.request_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.request_object = reservation_object
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Reservation
          command.params['parent'] = parent unless parent.nil?
          command.query['reservationId'] = reservation_id unless reservation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a reservation.
        # Returns `google.rpc.Code.FAILED_PRECONDITION` in the following cases:
        # 1. When reservation has child reservations. This check can be bypassed by
        # setting DeleteReservationRequest.force flag to true.
        # 2. When top-level reservation with slot pools is being deleted.
        # @param [String] name
        #   Resource name of the reservation to retrieve. E.g.,
        #   projects/myproject/locations/us-central1/reservations/my_reservation
        # @param [Boolean] force
        #   If true, deletes all the child reservations of the given reservation.
        #   Otherwise, attempting to delete a reservation that has child
        #   reservations will fail with error code
        #   `google.rpc.Code.FAILED_PRECONDITION`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_reservation(name, force: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha2/{+name}', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Empty::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Empty
          command.params['name'] = name unless name.nil?
          command.query['force'] = force unless force.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about the reservation.
        # @param [String] name
        #   Resource name of the reservation to retrieve. E.g.,
        #   projects/myproject/locations/us-central1/reservations/path/to/reserv
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Reservation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Reservation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_reservation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+name}', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Reservation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the reservations for the project in the specified location.
        # @param [String] parent
        #   The parent resource name containing project and location, e.g.:
        #   "projects/myproject/locations/us-central1"
        # @param [String] filter
        #   Can be used to filter out reservations based on names, capacity, etc, e.g.:
        #   filter="reservation.slot_capacity > 200"
        #   filter="reservation.name = \"*dev/*\""
        #   Advanced filtering syntax can be
        #   [here](https://cloud.google.com/logging/docs/view/advanced-filters).
        # @param [Fixnum] page_size
        #   The maximum number of items to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::ListReservationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::ListReservationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_reservations(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+parent}/reservations', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::ListReservationsResponse::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::ListReservationsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing reservation resource. Applicable only for child
        # reservations.
        # @param [String] name
        #   The resource name of the reservation, e.g.,
        #   "projects/*/locations/*/reservations/dev/team/product". Reservation names
        #   (e.g., "dev/team/product") exceeding a depth of six will fail with
        #   `google.rpc.Code.INVALID_ARGUMENT`.
        # @param [Google::Apis::BigqueryreservationV1alpha2::Reservation] reservation_object
        # @param [String] update_mask
        #   Standard field mask for the set of fields to be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Reservation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Reservation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_reservation(name, reservation_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha2/{+name}', options)
          command.request_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.request_object = reservation_object
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Reservation::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Reservation
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a slot pool. Attempting to delete slot pool before its
        # commitment_end_time will fail with the error code
        # `google.rpc.Code.FAILED_PRECONDITION`.
        # @param [String] name
        #   Resource name of the slot pool to delete. E.g.,
        #   projects/myproject/locations/us-central1/reservations/my_reservation/
        #   slotPools/123
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_reservation_slot_pool(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha2/{+name}', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::Empty::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about the slot pool.
        # @param [String] name
        #   Resource name of the slot pool to retrieve. E.g.,
        #   projects/myproject/locations/us-central1/reservations/my_reservation/
        #   slotPools/123
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::SlotPool] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::SlotPool]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_reservation_slot_pool(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+name}', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::SlotPool::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::SlotPool
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the slot pools for the reservation.
        # @param [String] parent
        #   Resource name of the parent reservation. Only top-level reservations can
        #   have slot pools. E.g.,
        #   projects/myproject/locations/us-central1/reservations/my_reservation
        # @param [Fixnum] page_size
        #   The maximum number of items to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigqueryreservationV1alpha2::ListSlotPoolsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigqueryreservationV1alpha2::ListSlotPoolsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_reservation_slot_pools(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha2/{+parent}/slotPools', options)
          command.response_representation = Google::Apis::BigqueryreservationV1alpha2::ListSlotPoolsResponse::Representation
          command.response_class = Google::Apis::BigqueryreservationV1alpha2::ListSlotPoolsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
