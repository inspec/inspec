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
    module AdminReportsV1
      # Admin Reports API
      #
      # Fetches reports for the administrators of G Suite customers about the usage,
      #  collaboration, security, and risk for their users.
      #
      # @example
      #    require 'google/apis/admin_reports_v1'
      #
      #    Admin = Google::Apis::AdminReportsV1 # Alias the module
      #    service = Admin::ReportsService.new
      #
      # @see /admin-sdk/reports/
      class ReportsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'admin/reports/v1/')
          @batch_path = 'batch/admin/reports_v1'
        end
        
        # Retrieves a list of activities for a specific customer's account and
        # application such as the Admin console application or the Google Drive
        # application. For more information, see the guides for administrator and Google
        # Drive activity reports. For more information about the activity report's
        # parameters, see the activity parameters reference guides.
        # @param [String] user_key
        #   Represents the profile ID or the user email for which the data should be
        #   filtered. Can be all for all information, or userKey for a user's unique G
        #   Suite profile ID or their primary email address.
        # @param [String] application_name
        #   Application name for which the events are to be retrieved.
        # @param [String] actor_ip_address
        #   The Internet Protocol (IP) Address of host where the event was performed. This
        #   is an additional way to filter a report's summary using the IP address of the
        #   user whose activity is being reported. This IP address may or may not reflect
        #   the user's physical location. For example, the IP address can be the user's
        #   proxy server's address or a virtual private network (VPN) address. This
        #   parameter supports both IPv4 and IPv6 address versions.
        # @param [String] customer_id
        #   The unique ID of the customer to retrieve data for.
        # @param [String] end_time
        #   Sets the end of the range of time shown in the report. The date is in the RFC
        #   3339 format, for example 2010-10-28T10:26:35.000Z. The default value is the
        #   approximate time of the API request. An API report has three basic time
        #   concepts:
        #   - Date of the API's request for a report: When the API created and retrieved
        #   the report.
        #   - Report's start time: The beginning of the timespan shown in the report. The
        #   startTime must be before the endTime (if specified) and the current time when
        #   the request is made, or the API returns an error.
        #   - Report's end time: The end of the timespan shown in the report. For example,
        #   the timespan of events summarized in a report can start in April and end in
        #   May. The report itself can be requested in August.  If the endTime is not
        #   specified, the report returns all activities from the startTime until the
        #   current time or the most recent 180 days if the startTime is more than 180
        #   days in the past.
        # @param [String] event_name
        #   The name of the event being queried by the API. Each eventName is related to a
        #   specific G Suite service or feature which the API organizes into types of
        #   events. An example is the Google Calendar events in the Admin console
        #   application's reports. The Calendar Settings type structure has all of the
        #   Calendar eventName activities reported by the API. When an administrator
        #   changes a Calendar setting, the API reports this activity in the Calendar
        #   Settings type and eventName parameters. For more information about eventName
        #   query strings and parameters, see the list of event names for various
        #   applications above in applicationName.
        # @param [String] filters
        #   The filters query string is a comma-separated list. The list is composed of
        #   event parameters that are manipulated by relational operators. Event
        #   parameters are in the form [parameter1 name][relational operator][parameter1
        #   value],[parameter2 name][relational operator][parameter2 value],...
        #   These event parameters are associated with a specific eventName. An empty
        #   report is returned if the filtered request's parameter does not belong to the
        #   eventName. For more information about eventName parameters, see the list of
        #   event names for various applications above in applicationName.
        #   In the following Admin Activity example, the <> operator is URL-encoded in the
        #   request's query string (%3C%3E):
        #   GET...&eventName=CHANGE_CALENDAR_SETTING &filters=NEW_VALUE%3C%
        #   3EREAD_ONLY_ACCESS
        #   In the following Drive example, the list can be a view or edit event's doc_id
        #   parameter with a value that is manipulated by an 'equal to' (==) or 'not equal
        #   to' (<>) relational operator. In the first example, the report returns each
        #   edited document's doc_id. In the second example, the report returns each
        #   viewed document's doc_id that equals the value 12345 and does not return any
        #   viewed document's which have a doc_id value of 98765. The <> operator is URL-
        #   encoded in the request's query string (%3C%3E):
        #   GET...&eventName=edit&filters=doc_id GET...&eventName=view&filters=doc_id==
        #   12345,doc_id%3C%3E98765
        #   The relational operators include:
        #   - == - 'equal to'.
        #   - <> - 'not equal to'. It is URL-encoded (%3C%3E).
        #   - < - 'less than'. It is URL-encoded (%3C).
        #   - <= - 'less than or equal to'. It is URL-encoded (%3C=).
        #   - > - 'greater than'. It is URL-encoded (%3E).
        #   - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
        #   Note: The API doesn't accept multiple values of a parameter. If a particular
        #   parameter is supplied more than once in the API request, the API only accepts
        #   the last value of that request parameter.
        #   In addition, if an invalid request parameter is supplied in the API request,
        #   the API ignores that request parameter and returns the response corresponding
        #   to the remaining valid request parameters. If no parameters are requested, all
        #   parameters are returned.
        # @param [Fixnum] max_results
        #   Determines how many activity records are shown on each response page. For
        #   example, if the request sets maxResults=1 and the report has two activities,
        #   the report has two pages. The response's nextPageToken property has the token
        #   to the second page. The maxResults query string is optional in the request.
        #   The default value is 1000.
        # @param [String] org_unit_id
        #   ID of the organizational unit to report on. Activity records will be shown
        #   only for users who belong to the specified organizational unit. Data before
        #   Dec 17, 2018 doesn't appear in the filtered results.
        # @param [String] page_token
        #   The token to specify next page. A report with multiple pages has a
        #   nextPageToken property in the response. In your follow-on request getting the
        #   next page of the report, enter the nextPageToken value in the pageToken query
        #   string.
        # @param [String] start_time
        #   Sets the beginning of the range of time shown in the report. The date is in
        #   the RFC 3339 format, for example 2010-10-28T10:26:35.000Z. The report returns
        #   all activities from startTime until endTime. The startTime must be before the
        #   endTime (if specified) and the current time when the request is made, or the
        #   API returns an error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdminReportsV1::Activities] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdminReportsV1::Activities]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_activities(user_key, application_name, actor_ip_address: nil, customer_id: nil, end_time: nil, event_name: nil, filters: nil, max_results: nil, org_unit_id: nil, page_token: nil, start_time: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'activity/users/{userKey}/applications/{applicationName}', options)
          command.response_representation = Google::Apis::AdminReportsV1::Activities::Representation
          command.response_class = Google::Apis::AdminReportsV1::Activities
          command.params['userKey'] = user_key unless user_key.nil?
          command.params['applicationName'] = application_name unless application_name.nil?
          command.query['actorIpAddress'] = actor_ip_address unless actor_ip_address.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['eventName'] = event_name unless event_name.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orgUnitID'] = org_unit_id unless org_unit_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Start receiving notifications for account activities. For more information,
        # see Receiving Push Notifications.
        # @param [String] user_key
        #   Represents the profile ID or the user email for which the data should be
        #   filtered. Can be all for all information, or userKey for a user's unique G
        #   Suite profile ID or their primary email address.
        # @param [String] application_name
        #   Application name for which the events are to be retrieved.
        # @param [Google::Apis::AdminReportsV1::Channel] channel_object
        # @param [String] actor_ip_address
        #   The Internet Protocol (IP) Address of host where the event was performed. This
        #   is an additional way to filter a report's summary using the IP address of the
        #   user whose activity is being reported. This IP address may or may not reflect
        #   the user's physical location. For example, the IP address can be the user's
        #   proxy server's address or a virtual private network (VPN) address. This
        #   parameter supports both IPv4 and IPv6 address versions.
        # @param [String] customer_id
        #   The unique ID of the customer to retrieve data for.
        # @param [String] end_time
        #   Sets the end of the range of time shown in the report. The date is in the RFC
        #   3339 format, for example 2010-10-28T10:26:35.000Z. The default value is the
        #   approximate time of the API request. An API report has three basic time
        #   concepts:
        #   - Date of the API's request for a report: When the API created and retrieved
        #   the report.
        #   - Report's start time: The beginning of the timespan shown in the report. The
        #   startTime must be before the endTime (if specified) and the current time when
        #   the request is made, or the API returns an error.
        #   - Report's end time: The end of the timespan shown in the report. For example,
        #   the timespan of events summarized in a report can start in April and end in
        #   May. The report itself can be requested in August.  If the endTime is not
        #   specified, the report returns all activities from the startTime until the
        #   current time or the most recent 180 days if the startTime is more than 180
        #   days in the past.
        # @param [String] event_name
        #   The name of the event being queried by the API. Each eventName is related to a
        #   specific G Suite service or feature which the API organizes into types of
        #   events. An example is the Google Calendar events in the Admin console
        #   application's reports. The Calendar Settings type structure has all of the
        #   Calendar eventName activities reported by the API. When an administrator
        #   changes a Calendar setting, the API reports this activity in the Calendar
        #   Settings type and eventName parameters. For more information about eventName
        #   query strings and parameters, see the list of event names for various
        #   applications above in applicationName.
        # @param [String] filters
        #   The filters query string is a comma-separated list. The list is composed of
        #   event parameters that are manipulated by relational operators. Event
        #   parameters are in the form [parameter1 name][relational operator][parameter1
        #   value],[parameter2 name][relational operator][parameter2 value],...
        #   These event parameters are associated with a specific eventName. An empty
        #   report is returned if the filtered request's parameter does not belong to the
        #   eventName. For more information about eventName parameters, see the list of
        #   event names for various applications above in applicationName.
        #   In the following Admin Activity example, the <> operator is URL-encoded in the
        #   request's query string (%3C%3E):
        #   GET...&eventName=CHANGE_CALENDAR_SETTING &filters=NEW_VALUE%3C%
        #   3EREAD_ONLY_ACCESS
        #   In the following Drive example, the list can be a view or edit event's doc_id
        #   parameter with a value that is manipulated by an 'equal to' (==) or 'not equal
        #   to' (<>) relational operator. In the first example, the report returns each
        #   edited document's doc_id. In the second example, the report returns each
        #   viewed document's doc_id that equals the value 12345 and does not return any
        #   viewed document's which have a doc_id value of 98765. The <> operator is URL-
        #   encoded in the request's query string (%3C%3E):
        #   GET...&eventName=edit&filters=doc_id GET...&eventName=view&filters=doc_id==
        #   12345,doc_id%3C%3E98765
        #   The relational operators include:
        #   - == - 'equal to'.
        #   - <> - 'not equal to'. It is URL-encoded (%3C%3E).
        #   - < - 'less than'. It is URL-encoded (%3C).
        #   - <= - 'less than or equal to'. It is URL-encoded (%3C=).
        #   - > - 'greater than'. It is URL-encoded (%3E).
        #   - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
        #   Note: The API doesn't accept multiple values of a parameter. If a particular
        #   parameter is supplied more than once in the API request, the API only accepts
        #   the last value of that request parameter.
        #   In addition, if an invalid request parameter is supplied in the API request,
        #   the API ignores that request parameter and returns the response corresponding
        #   to the remaining valid request parameters. If no parameters are requested, all
        #   parameters are returned.
        # @param [Fixnum] max_results
        #   Determines how many activity records are shown on each response page. For
        #   example, if the request sets maxResults=1 and the report has two activities,
        #   the report has two pages. The response's nextPageToken property has the token
        #   to the second page. The maxResults query string is optional in the request.
        #   The default value is 1000.
        # @param [String] org_unit_id
        #   ID of the organizational unit to report on. Activity records will be shown
        #   only for users who belong to the specified organizational unit. Data before
        #   Dec 17, 2018 doesn't appear in the filtered results.
        # @param [String] page_token
        #   The token to specify next page. A report with multiple pages has a
        #   nextPageToken property in the response. In your follow-on request getting the
        #   next page of the report, enter the nextPageToken value in the pageToken query
        #   string.
        # @param [String] start_time
        #   Sets the beginning of the range of time shown in the report. The date is in
        #   the RFC 3339 format, for example 2010-10-28T10:26:35.000Z. The report returns
        #   all activities from startTime until endTime. The startTime must be before the
        #   endTime (if specified) and the current time when the request is made, or the
        #   API returns an error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdminReportsV1::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdminReportsV1::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_activity(user_key, application_name, channel_object = nil, actor_ip_address: nil, customer_id: nil, end_time: nil, event_name: nil, filters: nil, max_results: nil, org_unit_id: nil, page_token: nil, start_time: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'activity/users/{userKey}/applications/{applicationName}/watch', options)
          command.request_representation = Google::Apis::AdminReportsV1::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::AdminReportsV1::Channel::Representation
          command.response_class = Google::Apis::AdminReportsV1::Channel
          command.params['userKey'] = user_key unless user_key.nil?
          command.params['applicationName'] = application_name unless application_name.nil?
          command.query['actorIpAddress'] = actor_ip_address unless actor_ip_address.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['eventName'] = event_name unless event_name.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orgUnitID'] = org_unit_id unless org_unit_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stop watching resources through this channel
        # @param [Google::Apis::AdminReportsV1::Channel] channel_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_channel(channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '/admin/reports_v1/channels/stop', options)
          command.request_representation = Google::Apis::AdminReportsV1::Channel::Representation
          command.request_object = channel_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report which is a collection of properties and statistics for a
        # specific customer's account. For more information, see the Customers Usage
        # Report guide. For more information about the customer report's parameters, see
        # the Customers Usage parameters reference guides.
        # @param [String] date
        #   Represents the date the usage occurred. The timestamp is in the ISO 8601
        #   format, yyyy-mm-dd. We recommend you use your account's time zone for this.
        # @param [String] customer_id
        #   The unique ID of the customer to retrieve data for.
        # @param [String] page_token
        #   Token to specify next page. A report with multiple pages has a nextPageToken
        #   property in the response. For your follow-on requests getting all of the
        #   report's pages, enter the nextPageToken value in the pageToken query string.
        # @param [String] parameters
        #   The parameters query string is a comma-separated list of event parameters that
        #   refine a report's results. The parameter is associated with a specific
        #   application. The application values for the Customers usage report include
        #   accounts, app_maker, apps_scripts, calendar, classroom, cros, docs, gmail,
        #   gplus, device_management, meet, and sites.
        #   A parameters query string is in the CSV form of app_name1:param_name1,
        #   app_name2:param_name2.
        #   Note: The API doesn't accept multiple values of a parameter. If a particular
        #   parameter is supplied more than once in the API request, the API only accepts
        #   the last value of that request parameter.
        #   In addition, if an invalid request parameter is supplied in the API request,
        #   the API ignores that request parameter and returns the response corresponding
        #   to the remaining valid request parameters.
        #   An example of an invalid request parameter is one that does not belong to the
        #   application. If no parameters are requested, all parameters are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdminReportsV1::UsageReports] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdminReportsV1::UsageReports]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_customer_usage_report(date, customer_id: nil, page_token: nil, parameters: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'usage/dates/{date}', options)
          command.response_representation = Google::Apis::AdminReportsV1::UsageReports::Representation
          command.response_class = Google::Apis::AdminReportsV1::UsageReports
          command.params['date'] = date unless date.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parameters'] = parameters unless parameters.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report which is a collection of properties and statistics for
        # entities used by users within the account. For more information, see the
        # Entities Usage Report guide. For more information about the entities report's
        # parameters, see the Entities Usage parameters reference guides.
        # @param [String] entity_type
        #   Represents the type of entity for the report.
        # @param [String] entity_key
        #   Represents the key of the object to filter the data with.
        # @param [String] date
        #   Represents the date the usage occurred. The timestamp is in the ISO 8601
        #   format, yyyy-mm-dd. We recommend you use your account's time zone for this.
        # @param [String] customer_id
        #   The unique ID of the customer to retrieve data for.
        # @param [String] filters
        #   The filters query string is a comma-separated list of an application's event
        #   parameters where the parameter's value is manipulated by a relational operator.
        #   The filters query string includes the name of the application whose usage is
        #   returned in the report. The application values for the Entities usage report
        #   include accounts, docs, and gmail.
        #   Filters are in the form [application name]:[parameter name][relational
        #   operator][parameter value],....
        #   In this example, the <> 'not equal to' operator is URL-encoded in the request'
        #   s query string (%3C%3E):
        #   GET https://www.googleapis.com/admin/reports/v1/usage/gplus_communities/all/
        #   dates/2017-12-01 ?parameters=gplus:community_name,gplus:num_total_members &
        #   filters=gplus:num_total_members>0
        #   The relational operators include:
        #   - == - 'equal to'.
        #   - <> - 'not equal to'. It is URL-encoded (%3C%3E).
        #   - < - 'less than'. It is URL-encoded (%3C).
        #   - <= - 'less than or equal to'. It is URL-encoded (%3C=).
        #   - > - 'greater than'. It is URL-encoded (%3E).
        #   - >= - 'greater than or equal to'. It is URL-encoded (%3E=).  Filters can only
        #   be applied to numeric parameters.
        # @param [Fixnum] max_results
        #   Determines how many activity records are shown on each response page. For
        #   example, if the request sets maxResults=1 and the report has two activities,
        #   the report has two pages. The response's nextPageToken property has the token
        #   to the second page.
        # @param [String] page_token
        #   Token to specify next page. A report with multiple pages has a nextPageToken
        #   property in the response. In your follow-on request getting the next page of
        #   the report, enter the nextPageToken value in the pageToken query string.
        # @param [String] parameters
        #   The parameters query string is a comma-separated list of event parameters that
        #   refine a report's results. The parameter is associated with a specific
        #   application. The application values for the Entities usage report are only
        #   gplus.
        #   A parameter query string is in the CSV form of [app_name1:param_name1], [
        #   app_name2:param_name2]....
        #   Note: The API doesn't accept multiple values of a parameter. If a particular
        #   parameter is supplied more than once in the API request, the API only accepts
        #   the last value of that request parameter.
        #   In addition, if an invalid request parameter is supplied in the API request,
        #   the API ignores that request parameter and returns the response corresponding
        #   to the remaining valid request parameters.
        #   An example of an invalid request parameter is one that does not belong to the
        #   application. If no parameters are requested, all parameters are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdminReportsV1::UsageReports] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdminReportsV1::UsageReports]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_entity_usage_report(entity_type, entity_key, date, customer_id: nil, filters: nil, max_results: nil, page_token: nil, parameters: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'usage/{entityType}/{entityKey}/dates/{date}', options)
          command.response_representation = Google::Apis::AdminReportsV1::UsageReports::Representation
          command.response_class = Google::Apis::AdminReportsV1::UsageReports
          command.params['entityType'] = entity_type unless entity_type.nil?
          command.params['entityKey'] = entity_key unless entity_key.nil?
          command.params['date'] = date unless date.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parameters'] = parameters unless parameters.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a report which is a collection of properties and statistics for a
        # set of users with the account. For more information, see the User Usage Report
        # guide. For more information about the user report's parameters, see the Users
        # Usage parameters reference guides.
        # @param [String] user_key
        #   Represents the profile ID or the user email for which the data should be
        #   filtered. Can be all for all information, or userKey for a user's unique G
        #   Suite profile ID or their primary email address.
        # @param [String] date
        #   Represents the date the usage occurred. The timestamp is in the ISO 8601
        #   format, yyyy-mm-dd. We recommend you use your account's time zone for this.
        # @param [String] customer_id
        #   The unique ID of the customer to retrieve data for.
        # @param [String] filters
        #   The filters query string is a comma-separated list of an application's event
        #   parameters where the parameter's value is manipulated by a relational operator.
        #   The filters query string includes the name of the application whose usage is
        #   returned in the report. The application values for the Users Usage Report
        #   include accounts, docs, and gmail.
        #   Filters are in the form [application name]:[parameter name][relational
        #   operator][parameter value],....
        #   In this example, the <> 'not equal to' operator is URL-encoded in the request'
        #   s query string (%3C%3E):
        #   GET https://www.googleapis.com/admin/reports/v1/usage/users/all/dates/2013-03-
        #   03 ?parameters=accounts:last_login_time &filters=accounts:last_login_time>2010-
        #   10-28T10:26:35.000Z
        #   The relational operators include:
        #   - == - 'equal to'.
        #   - <> - 'not equal to'. It is URL-encoded (%3C%3E).
        #   - < - 'less than'. It is URL-encoded (%3C).
        #   - <= - 'less than or equal to'. It is URL-encoded (%3C=).
        #   - > - 'greater than'. It is URL-encoded (%3E).
        #   - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
        # @param [Fixnum] max_results
        #   Determines how many activity records are shown on each response page. For
        #   example, if the request sets maxResults=1 and the report has two activities,
        #   the report has two pages. The response's nextPageToken property has the token
        #   to the second page.
        #   The maxResults query string is optional.
        # @param [String] org_unit_id
        #   ID of the organizational unit to report on. User activity will be shown only
        #   for users who belong to the specified organizational unit. Data before Dec 17,
        #   2018 doesn't appear in the filtered results.
        # @param [String] page_token
        #   Token to specify next page. A report with multiple pages has a nextPageToken
        #   property in the response. In your follow-on request getting the next page of
        #   the report, enter the nextPageToken value in the pageToken query string.
        # @param [String] parameters
        #   The parameters query string is a comma-separated list of event parameters that
        #   refine a report's results. The parameter is associated with a specific
        #   application. The application values for the Customers usage report include
        #   accounts, app_maker, apps_scripts, calendar, classroom, cros, docs, gmail,
        #   gplus, device_management, meet, and sites.
        #   A parameters query string is in the CSV form of app_name1:param_name1,
        #   app_name2:param_name2.
        #   Note: The API doesn't accept multiple values of a parameter.
        #   If a particular parameter is supplied more than once in the API request, the
        #   API only accepts the last value of that request parameter. In addition, if an
        #   invalid request parameter is supplied in the API request, the API ignores that
        #   request parameter and returns the response corresponding to the remaining
        #   valid request parameters.
        #   An example of an invalid request parameter is one that does not belong to the
        #   application. If no parameters are requested, all parameters are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AdminReportsV1::UsageReports] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AdminReportsV1::UsageReports]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_usage_report(user_key, date, customer_id: nil, filters: nil, max_results: nil, org_unit_id: nil, page_token: nil, parameters: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'usage/users/{userKey}/dates/{date}', options)
          command.response_representation = Google::Apis::AdminReportsV1::UsageReports::Representation
          command.response_class = Google::Apis::AdminReportsV1::UsageReports
          command.params['userKey'] = user_key unless user_key.nil?
          command.params['date'] = date unless date.nil?
          command.query['customerId'] = customer_id unless customer_id.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orgUnitID'] = org_unit_id unless org_unit_id.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parameters'] = parameters unless parameters.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
