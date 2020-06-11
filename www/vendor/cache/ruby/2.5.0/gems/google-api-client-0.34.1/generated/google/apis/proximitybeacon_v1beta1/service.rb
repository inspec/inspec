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
    module ProximitybeaconV1beta1
      # Proximity Beacon API
      #
      # Registers, manages, indexes, and searches beacons.
      #
      # @example
      #    require 'google/apis/proximitybeacon_v1beta1'
      #
      #    Proximitybeacon = Google::Apis::ProximitybeaconV1beta1 # Alias the module
      #    service = Proximitybeacon::ProximitybeaconService.new
      #
      # @see https://developers.google.com/beacons/proximity/
      class ProximitybeaconService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://proximitybeacon.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Given one or more beacon observations, returns any beacon information
        # and attachments accessible to your application. Authorize by using the
        # [API
        # key](https://developers.google.com/beacons/proximity/get-started#
        # request_a_browser_api_key)
        # for the application.
        # @param [Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsRequest] get_info_for_observed_beacons_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def getforobserved_beaconinfo(get_info_for_observed_beacons_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/beaconinfo:getforobserved', options)
          command.request_representation = Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsRequest::Representation
          command.request_object = get_info_for_observed_beacons_request_object
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::GetInfoForObservedBeaconsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Activates a beacon. A beacon that is active will return information
        # and attachment data when queried via `beaconinfo.getforobserved`.
        # Calling this method on an already active beacon will do nothing (but
        # will return a successful response code).
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Beacon that should be activated. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the beacon to activate. If the project id is not
        #   specified then the project making the request is used. The project id
        #   must match the project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def activate_beacon(beacon_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+beaconName}:activate', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Empty::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Empty
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deactivates a beacon. Once deactivated, the API will not return
        # information nor attachment data for the beacon when queried via
        # `beaconinfo.getforobserved`. Calling this method on an already inactive
        # beacon will do nothing (but will return a successful response code).
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Beacon that should be deactivated. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the beacon to deactivate. If the project id is not
        #   specified then the project making the request is used. The project id must
        #   match the project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def deactivate_beacon(beacon_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+beaconName}:deactivate', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Empty::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Empty
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Decommissions the specified beacon in the service. This beacon will no
        # longer be returned from `beaconinfo.getforobserved`. This operation is
        # permanent -- you will not be able to re-register a beacon with this ID
        # again.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Beacon that should be decommissioned. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID of the beacon's "stable" UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the beacon to decommission. If the project id is not
        #   specified then the project making the request is used. The project id
        #   must match the project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def decommission_beacon(beacon_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+beaconName}:decommission', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Empty::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Empty
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified beacon including all diagnostics data for the beacon
        # as well as any attachments on the beacon (including those belonging to
        # other projects). This operation cannot be undone.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Beacon that should be deleted. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the beacon to delete. If not provided, the project
        #   that is making the request is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_beacon(beacon_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+beaconName}', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Empty::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Empty
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns detailed information about the specified beacon.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **viewer**, **Is owner** or **Can edit** permissions in
        # the Google Developers Console project.
        # Requests may supply an Eddystone-EID beacon name in the form:
        # `beacons/4!beaconId` where the `beaconId` is the base16 ephemeral ID
        # broadcast by the beacon. The returned `Beacon` object will contain the
        # beacon's stable Eddystone-UID. Clients not authorized to resolve the
        # beacon's ephemeral Eddystone-EID broadcast will receive an error.
        # @param [String] beacon_name
        #   Resource name of this beacon. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the beacon to request. If the project id is not specified
        #   then the project making the request is used. The project id must match the
        #   project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Beacon] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Beacon]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_beacon(beacon_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+beaconName}', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Beacon::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Beacon
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches the beacon registry for beacons that match the given search
        # criteria. Only those beacons that the client has permission to list
        # will be returned.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **viewer**, **Is owner** or **Can edit** permissions in
        # the Google Developers Console project.
        # @param [Fixnum] page_size
        #   The maximum number of records to return for this request, up to a
        #   server-defined upper limit.
        # @param [String] page_token
        #   A pagination token obtained from a previous request to list beacons.
        # @param [String] project_id
        #   The project id to list beacons under. If not present then the project
        #   credential that made the request is used as the project.
        #   Optional.
        # @param [String] q
        #   Filter query string that supports the following field filters:
        #   * **description:`"<string>"`**
        #   For example: **description:"Room 3"**
        #   Returns beacons whose description matches tokens in the string "Room 3"
        #   (not necessarily that exact string).
        #   The string must be double-quoted.
        #   * **status:`<enum>`**
        #   For example: **status:active**
        #   Returns beacons whose status matches the given value. Values must be
        #   one of the Beacon.Status enum values (case insensitive). Accepts
        #   multiple filters which will be combined with OR logic.
        #   * **stability:`<enum>`**
        #   For example: **stability:mobile**
        #   Returns beacons whose expected stability matches the given value.
        #   Values must be one of the Beacon.Stability enum values (case
        #   insensitive). Accepts multiple filters which will be combined with
        #   OR logic.
        #   * **place\_id:`"<string>"`**
        #   For example: **place\_id:"ChIJVSZzVR8FdkgRXGmmm6SslKw="**
        #   Returns beacons explicitly registered at the given place, expressed as
        #   a Place ID obtained from [Google Places API](/places/place-id). Does not
        #   match places inside the given place. Does not consider the beacon's
        #   actual location (which may be different from its registered place).
        #   Accepts multiple filters that will be combined with OR logic. The place
        #   ID must be double-quoted.
        #   * **registration\_time`[<|>|<=|>=]<integer>`**
        #   For example: **registration\_time>=1433116800**
        #   Returns beacons whose registration time matches the given filter.
        #   Supports the operators: <, >, <=, and >=. Timestamp must be expressed as
        #   an integer number of seconds since midnight January 1, 1970 UTC. Accepts
        #   at most two filters that will be combined with AND logic, to support
        #   "between" semantics. If more than two are supplied, the latter ones are
        #   ignored.
        #   * **lat:`<double> lng:<double> radius:<integer>`**
        #   For example: **lat:51.1232343 lng:-1.093852 radius:1000**
        #   Returns beacons whose registered location is within the given circle.
        #   When any of these fields are given, all are required. Latitude and
        #   longitude must be decimal degrees between -90.0 and 90.0 and between
        #   -180.0 and 180.0 respectively. Radius must be an integer number of
        #   meters between 10 and 1,000,000 (1000 km).
        #   * **property:`"<string>=<string>"`**
        #   For example: **property:"battery-type=CR2032"**
        #   Returns beacons which have a property of the given name and value.
        #   Supports multiple filters which will be combined with OR logic.
        #   The entire name=value string must be double-quoted as one string.
        #   * **attachment\_type:`"<string>"`**
        #   For example: **attachment_type:"my-namespace/my-type"**
        #   Returns beacons having at least one attachment of the given namespaced
        #   type. Supports "any within this namespace" via the partial wildcard
        #   syntax: "my-namespace/*". Supports multiple filters which will be
        #   combined with OR logic. The string must be double-quoted.
        #   * **indoor\_level:`"<string>"`**
        #   For example: **indoor\_level:"1"**
        #   Returns beacons which are located on the given indoor level. Accepts
        #   multiple filters that will be combined with OR logic.
        #   Multiple filters on the same field are combined with OR logic (except
        #   registration_time which is combined with AND logic).
        #   Multiple filters on different fields are combined with AND logic.
        #   Filters should be separated by spaces.
        #   As with any HTTP query string parameter, the whole filter expression must
        #   be URL-encoded.
        #   Example REST request:
        #   `GET
        #   /v1beta1/beacons?q=status:active%20lat:51.123%20lng:-1.095%20radius:1000`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::ListBeaconsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::ListBeaconsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_beacons(page_size: nil, page_token: nil, project_id: nil, q: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/beacons', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::ListBeaconsResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::ListBeaconsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Registers a previously unregistered beacon given its `advertisedId`.
        # These IDs are unique within the system. An ID can be registered only once.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [Google::Apis::ProximitybeaconV1beta1::Beacon] beacon_object
        # @param [String] project_id
        #   The project id of the project the beacon will be registered to. If
        #   the project id is not specified then the project making the request
        #   is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Beacon] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Beacon]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def register_beacon(beacon_object = nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/beacons:register', options)
          command.request_representation = Google::Apis::ProximitybeaconV1beta1::Beacon::Representation
          command.request_object = beacon_object
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Beacon::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Beacon
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the information about the specified beacon. **Any field that you do
        # not populate in the submitted beacon will be permanently erased**, so you
        # should follow the "read, modify, write" pattern to avoid inadvertently
        # destroying data.
        # Changes to the beacon status via this method will be  silently ignored.
        # To update beacon status, use the separate methods on this API for
        # activation, deactivation, and decommissioning.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Resource name of this beacon. A beacon name has the format
        #   "beacons/N!beaconId" where the beaconId is the base16 ID broadcast by
        #   the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone, `1` for iBeacon, or `5` for AltBeacon.
        #   This field must be left empty when registering. After reading a beacon,
        #   clients can use the name for future operations.
        # @param [Google::Apis::ProximitybeaconV1beta1::Beacon] beacon_object
        # @param [String] project_id
        #   The project id of the beacon to update. If the project id is not
        #   specified then the project making the request is used. The project id
        #   must match the project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Beacon] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Beacon]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_beacon(beacon_name, beacon_object = nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+beaconName}', options)
          command.request_representation = Google::Apis::ProximitybeaconV1beta1::Beacon::Representation
          command.request_object = beacon_object
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Beacon::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Beacon
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes multiple attachments on a given beacon. This operation is
        # permanent and cannot be undone.
        # You can optionally specify `namespacedType` to choose which attachments
        # should be deleted. If you do not specify `namespacedType`,  all your
        # attachments on the given beacon will be deleted. You also may explicitly
        # specify `*/*` to delete all.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   The beacon whose attachments should be deleted. A beacon name has the
        #   format "beacons/N!beaconId" where the beaconId is the base16 ID broadcast
        #   by the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] namespaced_type
        #   Specifies the namespace and type of attachments to delete in
        #   `namespace/type` format. Accepts `*/*` to specify
        #   "all types in all namespaces".
        #   Optional.
        # @param [String] project_id
        #   The project id to delete beacon attachments under. This field can be
        #   used when "*" is specified to mean all attachment namespaces. Projects
        #   may have multiple attachments with multiple namespaces. If "*" is
        #   specified and the projectId string is empty, then the project
        #   making the request is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::DeleteAttachmentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::DeleteAttachmentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_beacon_attachment_delete(beacon_name, namespaced_type: nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+beaconName}/attachments:batchDelete', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::DeleteAttachmentsResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::DeleteAttachmentsResponse
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['namespacedType'] = namespaced_type unless namespaced_type.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Associates the given data with the specified beacon. Attachment data must
        # contain two parts:
        # <ul>
        # <li>A namespaced type.</li>
        # <li>The actual attachment data itself.</li>
        # </ul>
        # The namespaced type consists of two parts, the namespace and the type.
        # The namespace must be one of the values returned by the `namespaces`
        # endpoint, while the type can be a string of any characters except for the
        # forward slash (`/`) up to 100 characters in length.
        # Attachment data can be up to 1024 bytes long.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] beacon_name
        #   Beacon on which the attachment should be created. A beacon name has the
        #   format "beacons/N!beaconId" where the beaconId is the base16 ID broadcast
        #   by the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [Google::Apis::ProximitybeaconV1beta1::BeaconAttachment] beacon_attachment_object
        # @param [String] project_id
        #   The project id of the project the attachment will belong to. If
        #   the project id is not specified then the project making the request
        #   is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::BeaconAttachment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::BeaconAttachment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_beacon_attachment(beacon_name, beacon_attachment_object = nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+beaconName}/attachments', options)
          command.request_representation = Google::Apis::ProximitybeaconV1beta1::BeaconAttachment::Representation
          command.request_object = beacon_attachment_object
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::BeaconAttachment::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::BeaconAttachment
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified attachment for the given beacon. Each attachment has
        # a unique attachment name (`attachmentName`) which is returned when you
        # fetch the attachment data via this API. You specify this with the delete
        # request to control which attachment is removed. This operation cannot be
        # undone.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **Is owner** or **Can edit** permissions in the Google
        # Developers Console project.
        # @param [String] attachment_name
        #   The attachment name (`attachmentName`) of
        #   the attachment to remove. For example:
        #   `beacons/3!893737abc9/attachments/c5e937-af0-494-959-ec49d12738`. For
        #   Eddystone-EID beacons, the beacon ID portion (`3!893737abc9`) may be the
        #   beacon's current EID, or its "stable" Eddystone-UID.
        #   Required.
        # @param [String] project_id
        #   The project id of the attachment to delete. If not provided, the project
        #   that is making the request is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_beacon_attachment(attachment_name, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+attachmentName}', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Empty::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Empty
          command.params['attachmentName'] = attachment_name unless attachment_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the attachments for the specified beacon that match the specified
        # namespaced-type pattern.
        # To control which namespaced types are returned, you add the
        # `namespacedType` query parameter to the request. You must either use
        # `*/*`, to return all attachments, or the namespace must be one of
        # the ones returned from the  `namespaces` endpoint.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **viewer**, **Is owner** or **Can edit** permissions in
        # the Google Developers Console project.
        # @param [String] beacon_name
        #   Beacon whose attachments should be fetched. A beacon name has the
        #   format "beacons/N!beaconId" where the beaconId is the base16 ID broadcast
        #   by the beacon and N is a code for the beacon's type. Possible values are
        #   `3` for Eddystone-UID, `4` for Eddystone-EID, `1` for iBeacon, or `5`
        #   for AltBeacon. For Eddystone-EID beacons, you may use either the
        #   current EID or the beacon's "stable" UID.
        #   Required.
        # @param [String] namespaced_type
        #   Specifies the namespace and type of attachment to include in response in
        #   <var>namespace/type</var> format. Accepts `*/*` to specify
        #   "all types in all namespaces".
        # @param [String] project_id
        #   The project id to list beacon attachments under. This field can be
        #   used when "*" is specified to mean all attachment namespaces. Projects
        #   may have multiple attachments with multiple namespaces. If "*" is
        #   specified and the projectId string is empty, then the project
        #   making the request is used.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::ListBeaconAttachmentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::ListBeaconAttachmentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_beacon_attachments(beacon_name, namespaced_type: nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+beaconName}/attachments', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::ListBeaconAttachmentsResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::ListBeaconAttachmentsResponse
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['namespacedType'] = namespaced_type unless namespaced_type.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the diagnostics for a single beacon. You can also list diagnostics for
        # all the beacons owned by your Google Developers Console project by using
        # the beacon name `beacons/-`.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **viewer**, **Is owner** or **Can edit** permissions in
        # the Google Developers Console project.
        # @param [String] beacon_name
        #   Beacon that the diagnostics are for.
        # @param [String] alert_filter
        #   Requests only beacons that have the given alert. For example, to find
        #   beacons that have low batteries use `alert_filter=LOW_BATTERY`.
        # @param [Fixnum] page_size
        #   Specifies the maximum number of results to return. Defaults to
        #   10. Maximum 1000. Optional.
        # @param [String] page_token
        #   Requests results that occur after the `page_token`, obtained from the
        #   response to a previous request. Optional.
        # @param [String] project_id
        #   Requests only diagnostic records for the given project id. If not set,
        #   then the project making the request will be used for looking up
        #   diagnostic records. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::ListDiagnosticsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::ListDiagnosticsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_beacon_diagnostics(beacon_name, alert_filter: nil, page_size: nil, page_token: nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+beaconName}/diagnostics', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::ListDiagnosticsResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::ListDiagnosticsResponse
          command.params['beaconName'] = beacon_name unless beacon_name.nil?
          command.query['alertFilter'] = alert_filter unless alert_filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all attachment namespaces owned by your Google Developers Console
        # project. Attachment data associated with a beacon must include a
        # namespaced type, and the namespace must be owned by your project.
        # Authenticate using an [OAuth access
        # token](https://developers.google.com/identity/protocols/OAuth2) from a
        # signed-in user with **viewer**, **Is owner** or **Can edit** permissions in
        # the Google Developers Console project.
        # @param [String] project_id
        #   The project id to list namespaces under.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::ListNamespacesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::ListNamespacesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespaces(project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/namespaces', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::ListNamespacesResponse::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::ListNamespacesResponse
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the information about the specified namespace. Only the namespace
        # visibility can be updated.
        # @param [String] namespace_name
        #   Resource name of this namespace. Namespaces names have the format:
        #   <code>namespaces/<var>namespace</var></code>.
        # @param [Google::Apis::ProximitybeaconV1beta1::Namespace] namespace_object
        # @param [String] project_id
        #   The project id of the namespace to update. If the project id is not
        #   specified then the project making the request is used. The project id
        #   must match the project that owns the beacon.
        #   Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::Namespace] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::Namespace]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_namespace(namespace_name, namespace_object = nil, project_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+namespaceName}', options)
          command.request_representation = Google::Apis::ProximitybeaconV1beta1::Namespace::Representation
          command.request_object = namespace_object
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::Namespace::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::Namespace
          command.params['namespaceName'] = namespace_name unless namespace_name.nil?
          command.query['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the Proximity Beacon API's current public key and associated
        # parameters used to initiate the Diffie-Hellman key exchange required to
        # register a beacon that broadcasts the Eddystone-EID format. This key
        # changes periodically; clients may cache it and re-use the same public key
        # to provision and register multiple beacons. However, clients should be
        # prepared to refresh this key when they encounter an error registering an
        # Eddystone-EID beacon.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ProximitybeaconV1beta1::EphemeralIdRegistrationParams] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ProximitybeaconV1beta1::EphemeralIdRegistrationParams]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_eidparams(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/eidparams', options)
          command.response_representation = Google::Apis::ProximitybeaconV1beta1::EphemeralIdRegistrationParams::Representation
          command.response_class = Google::Apis::ProximitybeaconV1beta1::EphemeralIdRegistrationParams
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
