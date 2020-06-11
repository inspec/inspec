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
    module AnalyticsreportingV4
      
      # An Activity represents data for an activity of a user. Note that an
      # Activity is different from a hit.
      # A hit might result in multiple Activity's. For example, if a hit
      # includes a transaction and a goal completion, there will be two
      # Activity protos for this hit, one for ECOMMERCE and one for GOAL.
      # Conversely, multiple hits can also construct one Activity. In classic
      # e-commerce, data for one transaction might be sent through multiple hits.
      # These hits will be merged into one ECOMMERCE Activity.
      class Activity
        include Google::Apis::Core::Hashable
      
        # Timestamp of the activity. If activities for a visit cross midnight and
        # occur in two separate dates, then two sessions (one per date)
        # share the session identifier.
        # For example, say session ID 113472 has activity within 2019-08-20, and
        # session ID 243742 has activity within 2019-08-25 and 2019-08-26. Session ID
        # 113472 is one session, and session ID 243742 is two sessions.
        # Corresponds to the JSON property `activityTime`
        # @return [String]
        attr_accessor :activity_time
      
        # Type of this activity.
        # Corresponds to the JSON property `activityType`
        # @return [String]
        attr_accessor :activity_type
      
        # This will be set if `activity_type` equals `SCREEN_VIEW`.
        # Corresponds to the JSON property `appview`
        # @return [Google::Apis::AnalyticsreportingV4::ScreenviewData]
        attr_accessor :appview
      
        # For manual campaign tracking, it is the value of the utm_campaign campaign
        # tracking parameter. For AdWords autotagging, it is the name(s) of the
        # online ad campaign(s) you use for the property. If you use neither, its
        # value is (not set).
        # Corresponds to the JSON property `campaign`
        # @return [String]
        attr_accessor :campaign
      
        # The Channel Group associated with an end user's session for this View
        # (defined by the View's Channel Groupings).
        # Corresponds to the JSON property `channelGrouping`
        # @return [String]
        attr_accessor :channel_grouping
      
        # A list of all custom dimensions associated with this activity.
        # Corresponds to the JSON property `customDimension`
        # @return [Array<Google::Apis::AnalyticsreportingV4::CustomDimension>]
        attr_accessor :custom_dimension
      
        # E-commerce details associated with the user activity.
        # Corresponds to the JSON property `ecommerce`
        # @return [Google::Apis::AnalyticsreportingV4::EcommerceData]
        attr_accessor :ecommerce
      
        # Represents all the details pertaining to an event.
        # Corresponds to the JSON property `event`
        # @return [Google::Apis::AnalyticsreportingV4::EventData]
        attr_accessor :event
      
        # Represents a set of goals that were reached in an activity.
        # Corresponds to the JSON property `goals`
        # @return [Google::Apis::AnalyticsreportingV4::GoalSetData]
        attr_accessor :goals
      
        # The hostname from which the tracking request was made.
        # Corresponds to the JSON property `hostname`
        # @return [String]
        attr_accessor :hostname
      
        # For manual campaign tracking, it is the value of the utm_term campaign
        # tracking parameter. For AdWords traffic, it contains the best matching
        # targeting criteria. For the display network, where multiple targeting
        # criteria could have caused the ad to show up, it returns the best matching
        # targeting criteria as selected by Ads. This could be display_keyword, site
        # placement, boomuserlist, user_interest, age, or gender. Otherwise its value
        # is (not set).
        # Corresponds to the JSON property `keyword`
        # @return [String]
        attr_accessor :keyword
      
        # The first page in users' sessions, or the landing page.
        # Corresponds to the JSON property `landingPagePath`
        # @return [String]
        attr_accessor :landing_page_path
      
        # The type of referrals. For manual campaign tracking, it is the value of the
        # utm_medium campaign tracking parameter. For AdWords autotagging, it is cpc.
        # If users came from a search engine detected by Google Analytics, it is
        # organic. If the referrer is not a search engine, it is referral. If users
        # came directly to the property and document.referrer is empty, its value is
        # (none).
        # Corresponds to the JSON property `medium`
        # @return [String]
        attr_accessor :medium
      
        # Represents details collected when the visitor views a page.
        # Corresponds to the JSON property `pageview`
        # @return [Google::Apis::AnalyticsreportingV4::PageviewData]
        attr_accessor :pageview
      
        # The source of referrals. For manual campaign tracking, it is the value of
        # the utm_source campaign tracking parameter. For AdWords autotagging, it is
        # google. If you use neither, it is the domain of the source
        # (e.g., document.referrer) referring the users. It may also contain a port
        # address. If users arrived without a referrer, its value is (direct).
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activity_time = args[:activity_time] if args.key?(:activity_time)
          @activity_type = args[:activity_type] if args.key?(:activity_type)
          @appview = args[:appview] if args.key?(:appview)
          @campaign = args[:campaign] if args.key?(:campaign)
          @channel_grouping = args[:channel_grouping] if args.key?(:channel_grouping)
          @custom_dimension = args[:custom_dimension] if args.key?(:custom_dimension)
          @ecommerce = args[:ecommerce] if args.key?(:ecommerce)
          @event = args[:event] if args.key?(:event)
          @goals = args[:goals] if args.key?(:goals)
          @hostname = args[:hostname] if args.key?(:hostname)
          @keyword = args[:keyword] if args.key?(:keyword)
          @landing_page_path = args[:landing_page_path] if args.key?(:landing_page_path)
          @medium = args[:medium] if args.key?(:medium)
          @pageview = args[:pageview] if args.key?(:pageview)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Defines a cohort. A cohort is a group of users who share a common
      # characteristic. For example, all users with the same acquisition date
      # belong to the same cohort.
      class Cohort
        include Google::Apis::Core::Hashable
      
        # A contiguous set of days: startDate, startDate + 1 day, ..., endDate.
        # The start and end dates are specified in
        # [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) date format `YYYY-MM-DD`.
        # Corresponds to the JSON property `dateRange`
        # @return [Google::Apis::AnalyticsreportingV4::DateRange]
        attr_accessor :date_range
      
        # A unique name for the cohort. If not defined name will be auto-generated
        # with values cohort_[1234...].
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Type of the cohort. The only supported type as of now is
        # `FIRST_VISIT_DATE`. If this field is unspecified the cohort is treated
        # as `FIRST_VISIT_DATE` type cohort.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date_range = args[:date_range] if args.key?(:date_range)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Defines a cohort group.
      # For example:
      # "cohortGroup": `
      # "cohorts": [`
      # "name": "cohort 1",
      # "type": "FIRST_VISIT_DATE",
      # "dateRange": ` "startDate": "2015-08-01", "endDate": "2015-08-01" `
      # `,`
      # "name": "cohort 2"
      # "type": "FIRST_VISIT_DATE"
      # "dateRange": ` "startDate": "2015-07-01", "endDate": "2015-07-01" `
      # `]
      # `
      class CohortGroup
        include Google::Apis::Core::Hashable
      
        # The definition for the cohort.
        # Corresponds to the JSON property `cohorts`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Cohort>]
        attr_accessor :cohorts
      
        # Enable Life Time Value (LTV).  LTV measures lifetime value for users
        # acquired through different channels.
        # Please see:
        # [Cohort Analysis](https://support.google.com/analytics/answer/6074676) and
        # [Lifetime Value](https://support.google.com/analytics/answer/6182550)
        # If the value of lifetimeValue is false:
        # - The metric values are similar to the values in the web interface cohort
        # report.
        # - The cohort definition date ranges must be aligned to the calendar week
        # and month. i.e. while requesting `ga:cohortNthWeek` the `startDate` in
        # the cohort definition should be a Sunday and the `endDate` should be the
        # following Saturday, and for `ga:cohortNthMonth`, the `startDate`
        # should be the 1st of the month and `endDate` should be the last day
        # of the month.
        # When the lifetimeValue is true:
        # - The metric values will correspond to the values in the web interface
        # LifeTime value report.
        # - The Lifetime Value report shows you how user value (Revenue) and
        # engagement (Appviews, Goal Completions, Sessions, and Session Duration)
        # grow during the 90 days after a user is acquired.
        # - The metrics are calculated as a cumulative average per user per the time
        # increment.
        # - The cohort definition date ranges need not be aligned to the calendar
        # week and month boundaries.
        # - The `viewId` must be an
        # [app view
        # ID](https://support.google.com/analytics/answer/2649553#WebVersusAppViews)
        # Corresponds to the JSON property `lifetimeValue`
        # @return [Boolean]
        attr_accessor :lifetime_value
        alias_method :lifetime_value?, :lifetime_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cohorts = args[:cohorts] if args.key?(:cohorts)
          @lifetime_value = args[:lifetime_value] if args.key?(:lifetime_value)
        end
      end
      
      # Column headers.
      class ColumnHeader
        include Google::Apis::Core::Hashable
      
        # The dimension names in the response.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<String>]
        attr_accessor :dimensions
      
        # The headers for the metrics.
        # Corresponds to the JSON property `metricHeader`
        # @return [Google::Apis::AnalyticsreportingV4::MetricHeader]
        attr_accessor :metric_header
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @metric_header = args[:metric_header] if args.key?(:metric_header)
        end
      end
      
      # Custom dimension.
      class CustomDimension
        include Google::Apis::Core::Hashable
      
        # Slot number of custom dimension.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Value of the custom dimension. Default value (i.e. empty string) indicates
        # clearing sesion/visitor scope custom dimension value.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index = args[:index] if args.key?(:index)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A contiguous set of days: startDate, startDate + 1 day, ..., endDate.
      # The start and end dates are specified in
      # [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) date format `YYYY-MM-DD`.
      class DateRange
        include Google::Apis::Core::Hashable
      
        # The end date for the query in the format `YYYY-MM-DD`.
        # Corresponds to the JSON property `endDate`
        # @return [String]
        attr_accessor :end_date
      
        # The start date for the query in the format `YYYY-MM-DD`.
        # Corresponds to the JSON property `startDate`
        # @return [String]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # Used to return a list of metrics for a single DateRange / dimension
      # combination
      class DateRangeValues
        include Google::Apis::Core::Hashable
      
        # The values of each pivot region.
        # Corresponds to the JSON property `pivotValueRegions`
        # @return [Array<Google::Apis::AnalyticsreportingV4::PivotValueRegion>]
        attr_accessor :pivot_value_regions
      
        # Each value corresponds to each Metric in the request.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pivot_value_regions = args[:pivot_value_regions] if args.key?(:pivot_value_regions)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # [Dimensions](https://support.google.com/analytics/answer/1033861)
      # are attributes of your data. For example, the dimension `ga:city`
      # indicates the city, for example, "Paris" or "New York", from which
      # a session originates.
      class Dimension
        include Google::Apis::Core::Hashable
      
        # If non-empty, we place dimension values into buckets after string to
        # int64. Dimension values that are not the string representation of an
        # integral value will be converted to zero.  The bucket values have to be in
        # increasing order.  Each bucket is closed on the lower end, and open on the
        # upper end. The "first" bucket includes all values less than the first
        # boundary, the "last" bucket includes all values up to infinity. Dimension
        # values that fall in a bucket get transformed to a new dimension value. For
        # example, if one gives a list of "0, 1, 3, 4, 7", then we return the
        # following buckets:
        # - bucket #1: values < 0, dimension value "<0"
        # - bucket #2: values in [0,1), dimension value "0"
        # - bucket #3: values in [1,3), dimension value "1-2"
        # - bucket #4: values in [3,4), dimension value "3"
        # - bucket #5: values in [4,7), dimension value "4-6"
        # - bucket #6: values >= 7, dimension value "7+"
        # NOTE: If you are applying histogram mutation on any dimension, and using
        # that dimension in sort, you will want to use the sort type
        # `HISTOGRAM_BUCKET` for that purpose. Without that the dimension values
        # will be sorted according to dictionary
        # (lexicographic) order. For example the ascending dictionary order is:
        # "<50", "1001+", "121-1000", "50-120"
        # And the ascending `HISTOGRAM_BUCKET` order is:
        # "<50", "50-120", "121-1000", "1001+"
        # The client has to explicitly request `"orderType": "HISTOGRAM_BUCKET"`
        # for a histogram-mutated dimension.
        # Corresponds to the JSON property `histogramBuckets`
        # @return [Array<Fixnum>]
        attr_accessor :histogram_buckets
      
        # Name of the dimension to fetch, for example `ga:browser`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @histogram_buckets = args[:histogram_buckets] if args.key?(:histogram_buckets)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Dimension filter specifies the filtering options on a dimension.
      class DimensionFilter
        include Google::Apis::Core::Hashable
      
        # Should the match be case sensitive? Default is false.
        # Corresponds to the JSON property `caseSensitive`
        # @return [Boolean]
        attr_accessor :case_sensitive
        alias_method :case_sensitive?, :case_sensitive
      
        # The dimension to filter on. A DimensionFilter must contain a dimension.
        # Corresponds to the JSON property `dimensionName`
        # @return [String]
        attr_accessor :dimension_name
      
        # Strings or regular expression to match against. Only the first value of
        # the list is used for comparison unless the operator is `IN_LIST`.
        # If `IN_LIST` operator, then the entire list is used to filter the
        # dimensions as explained in the description of the `IN_LIST` operator.
        # Corresponds to the JSON property `expressions`
        # @return [Array<String>]
        attr_accessor :expressions
      
        # Logical `NOT` operator. If this boolean is set to true, then the matching
        # dimension values will be excluded in the report. The default is false.
        # Corresponds to the JSON property `not`
        # @return [Boolean]
        attr_accessor :not
        alias_method :not?, :not
      
        # How to match the dimension to the expression. The default is REGEXP.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
          @dimension_name = args[:dimension_name] if args.key?(:dimension_name)
          @expressions = args[:expressions] if args.key?(:expressions)
          @not = args[:not] if args.key?(:not)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # A group of dimension filters. Set the operator value to specify how
      # the filters are logically combined.
      class DimensionFilterClause
        include Google::Apis::Core::Hashable
      
        # The repeated set of filters. They are logically combined based on the
        # operator specified.
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DimensionFilter>]
        attr_accessor :filters
      
        # The operator for combining multiple dimension filters. If unspecified, it
        # is treated as an `OR`.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # Dynamic segment definition for defining the segment within the request.
      # A segment can select users, sessions or both.
      class DynamicSegment
        include Google::Apis::Core::Hashable
      
        # The name of the dynamic segment.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # SegmentDefinition defines the segment to be a set of SegmentFilters which
        # are combined together with a logical `AND` operation.
        # Corresponds to the JSON property `sessionSegment`
        # @return [Google::Apis::AnalyticsreportingV4::SegmentDefinition]
        attr_accessor :session_segment
      
        # SegmentDefinition defines the segment to be a set of SegmentFilters which
        # are combined together with a logical `AND` operation.
        # Corresponds to the JSON property `userSegment`
        # @return [Google::Apis::AnalyticsreportingV4::SegmentDefinition]
        attr_accessor :user_segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @session_segment = args[:session_segment] if args.key?(:session_segment)
          @user_segment = args[:user_segment] if args.key?(:user_segment)
        end
      end
      
      # E-commerce details associated with the user activity.
      class EcommerceData
        include Google::Apis::Core::Hashable
      
        # Action associated with this e-commerce action.
        # Corresponds to the JSON property `actionType`
        # @return [String]
        attr_accessor :action_type
      
        # The type of this e-commerce activity.
        # Corresponds to the JSON property `ecommerceType`
        # @return [String]
        attr_accessor :ecommerce_type
      
        # Details of the products in this transaction.
        # Corresponds to the JSON property `products`
        # @return [Array<Google::Apis::AnalyticsreportingV4::ProductData>]
        attr_accessor :products
      
        # Represents details collected when the visitor performs a transaction on the
        # page.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::AnalyticsreportingV4::TransactionData]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_type = args[:action_type] if args.key?(:action_type)
          @ecommerce_type = args[:ecommerce_type] if args.key?(:ecommerce_type)
          @products = args[:products] if args.key?(:products)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # Represents all the details pertaining to an event.
      class EventData
        include Google::Apis::Core::Hashable
      
        # Type of interaction with the object. Eg: 'play'.
        # Corresponds to the JSON property `eventAction`
        # @return [String]
        attr_accessor :event_action
      
        # The object on the page that was interacted with. Eg: 'Video'.
        # Corresponds to the JSON property `eventCategory`
        # @return [String]
        attr_accessor :event_category
      
        # Number of such events in this activity.
        # Corresponds to the JSON property `eventCount`
        # @return [Fixnum]
        attr_accessor :event_count
      
        # Label attached with the event.
        # Corresponds to the JSON property `eventLabel`
        # @return [String]
        attr_accessor :event_label
      
        # Numeric value associated with the event.
        # Corresponds to the JSON property `eventValue`
        # @return [Fixnum]
        attr_accessor :event_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @event_action = args[:event_action] if args.key?(:event_action)
          @event_category = args[:event_category] if args.key?(:event_category)
          @event_count = args[:event_count] if args.key?(:event_count)
          @event_label = args[:event_label] if args.key?(:event_label)
          @event_value = args[:event_value] if args.key?(:event_value)
        end
      end
      
      # The batch request containing multiple report request.
      class GetReportsRequest
        include Google::Apis::Core::Hashable
      
        # Requests, each request will have a separate response.
        # There can be a maximum of 5 requests. All requests should have the same
        # `dateRanges`, `viewId`, `segments`, `samplingLevel`, and `cohortGroup`.
        # Corresponds to the JSON property `reportRequests`
        # @return [Array<Google::Apis::AnalyticsreportingV4::ReportRequest>]
        attr_accessor :report_requests
      
        # Enables
        # [resource based
        # quotas](/analytics/devguides/reporting/core/v4/limits-quotas#
        # analytics_reporting_api_v4),
        # (defaults to `False`). If this field is set to `True` the
        # per view (profile) quotas are governed by the computational
        # cost of the request. Note that using cost based quotas will
        # higher enable sampling rates. (10 Million for `SMALL`,
        # 100M for `LARGE`. See the
        # [limits and quotas
        # documentation](/analytics/devguides/reporting/core/v4/limits-quotas#
        # analytics_reporting_api_v4)
        # for details.
        # Corresponds to the JSON property `useResourceQuotas`
        # @return [Boolean]
        attr_accessor :use_resource_quotas
        alias_method :use_resource_quotas?, :use_resource_quotas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @report_requests = args[:report_requests] if args.key?(:report_requests)
          @use_resource_quotas = args[:use_resource_quotas] if args.key?(:use_resource_quotas)
        end
      end
      
      # The main response class which holds the reports from the Reporting API
      # `batchGet` call.
      class GetReportsResponse
        include Google::Apis::Core::Hashable
      
        # The amount of resource quota tokens deducted to execute the query. Includes
        # all responses.
        # Corresponds to the JSON property `queryCost`
        # @return [Fixnum]
        attr_accessor :query_cost
      
        # Responses corresponding to each of the request.
        # Corresponds to the JSON property `reports`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Report>]
        attr_accessor :reports
      
        # The resource quota tokens remaining for the property after the request is
        # completed.
        # Corresponds to the JSON property `resourceQuotasRemaining`
        # @return [Google::Apis::AnalyticsreportingV4::ResourceQuotasRemaining]
        attr_accessor :resource_quotas_remaining
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_cost = args[:query_cost] if args.key?(:query_cost)
          @reports = args[:reports] if args.key?(:reports)
          @resource_quotas_remaining = args[:resource_quotas_remaining] if args.key?(:resource_quotas_remaining)
        end
      end
      
      # Represents all the details pertaining to a goal.
      class GoalData
        include Google::Apis::Core::Hashable
      
        # URL of the page where this goal was completed.
        # Corresponds to the JSON property `goalCompletionLocation`
        # @return [String]
        attr_accessor :goal_completion_location
      
        # Total number of goal completions in this activity.
        # Corresponds to the JSON property `goalCompletions`
        # @return [Fixnum]
        attr_accessor :goal_completions
      
        # This identifies the goal as configured for the profile.
        # Corresponds to the JSON property `goalIndex`
        # @return [Fixnum]
        attr_accessor :goal_index
      
        # Name of the goal.
        # Corresponds to the JSON property `goalName`
        # @return [String]
        attr_accessor :goal_name
      
        # URL of the page one step prior to the goal completion.
        # Corresponds to the JSON property `goalPreviousStep1`
        # @return [String]
        attr_accessor :goal_previous_step1
      
        # URL of the page two steps prior to the goal completion.
        # Corresponds to the JSON property `goalPreviousStep2`
        # @return [String]
        attr_accessor :goal_previous_step2
      
        # URL of the page three steps prior to the goal completion.
        # Corresponds to the JSON property `goalPreviousStep3`
        # @return [String]
        attr_accessor :goal_previous_step3
      
        # Value in this goal.
        # Corresponds to the JSON property `goalValue`
        # @return [Float]
        attr_accessor :goal_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @goal_completion_location = args[:goal_completion_location] if args.key?(:goal_completion_location)
          @goal_completions = args[:goal_completions] if args.key?(:goal_completions)
          @goal_index = args[:goal_index] if args.key?(:goal_index)
          @goal_name = args[:goal_name] if args.key?(:goal_name)
          @goal_previous_step1 = args[:goal_previous_step1] if args.key?(:goal_previous_step1)
          @goal_previous_step2 = args[:goal_previous_step2] if args.key?(:goal_previous_step2)
          @goal_previous_step3 = args[:goal_previous_step3] if args.key?(:goal_previous_step3)
          @goal_value = args[:goal_value] if args.key?(:goal_value)
        end
      end
      
      # Represents a set of goals that were reached in an activity.
      class GoalSetData
        include Google::Apis::Core::Hashable
      
        # All the goals that were reached in the current activity.
        # Corresponds to the JSON property `goals`
        # @return [Array<Google::Apis::AnalyticsreportingV4::GoalData>]
        attr_accessor :goals
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @goals = args[:goals] if args.key?(:goals)
        end
      end
      
      # [Metrics](https://support.google.com/analytics/answer/1033861)
      # are the quantitative measurements. For example, the metric `ga:users`
      # indicates the total number of users for the requested time period.
      class Metric
        include Google::Apis::Core::Hashable
      
        # An alias for the metric expression is an alternate name for the
        # expression. The alias can be used for filtering and sorting. This field
        # is optional and is useful if the expression is not a single metric but
        # a complex expression which cannot be used in filtering and sorting.
        # The alias is also used in the response column header.
        # Corresponds to the JSON property `alias`
        # @return [String]
        attr_accessor :alias
      
        # A metric expression in the request. An expression is constructed from one
        # or more metrics and numbers. Accepted operators include: Plus (+), Minus
        # (-), Negation (Unary -), Divided by (/), Multiplied by (*), Parenthesis,
        # Positive cardinal numbers (0-9), can include decimals and is limited to
        # 1024 characters. Example `ga:totalRefunds/ga:users`, in most cases the
        # metric expression is just a single metric name like `ga:users`.
        # Adding mixed `MetricType` (E.g., `CURRENCY` + `PERCENTAGE`) metrics
        # will result in unexpected results.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # Specifies how the metric expression should be formatted, for example
        # `INTEGER`.
        # Corresponds to the JSON property `formattingType`
        # @return [String]
        attr_accessor :formatting_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias = args[:alias] if args.key?(:alias)
          @expression = args[:expression] if args.key?(:expression)
          @formatting_type = args[:formatting_type] if args.key?(:formatting_type)
        end
      end
      
      # MetricFilter specifies the filter on a metric.
      class MetricFilter
        include Google::Apis::Core::Hashable
      
        # The value to compare against.
        # Corresponds to the JSON property `comparisonValue`
        # @return [String]
        attr_accessor :comparison_value
      
        # The metric that will be filtered on. A metricFilter must contain a metric
        # name. A metric name can be an alias earlier defined as a metric or it can
        # also be a metric expression.
        # Corresponds to the JSON property `metricName`
        # @return [String]
        attr_accessor :metric_name
      
        # Logical `NOT` operator. If this boolean is set to true, then the matching
        # metric values will be excluded in the report. The default is false.
        # Corresponds to the JSON property `not`
        # @return [Boolean]
        attr_accessor :not
        alias_method :not?, :not
      
        # Is the metric `EQUAL`, `LESS_THAN` or `GREATER_THAN` the
        # comparisonValue, the default is `EQUAL`. If the operator is
        # `IS_MISSING`, checks if the metric is missing and would ignore the
        # comparisonValue.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comparison_value = args[:comparison_value] if args.key?(:comparison_value)
          @metric_name = args[:metric_name] if args.key?(:metric_name)
          @not = args[:not] if args.key?(:not)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # Represents a group of metric filters.
      # Set the operator value to specify how the filters are logically combined.
      class MetricFilterClause
        include Google::Apis::Core::Hashable
      
        # The repeated set of filters. They are logically combined based on the
        # operator specified.
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::AnalyticsreportingV4::MetricFilter>]
        attr_accessor :filters
      
        # The operator for combining multiple metric filters. If unspecified, it is
        # treated as an `OR`.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # The headers for the metrics.
      class MetricHeader
        include Google::Apis::Core::Hashable
      
        # Headers for the metrics in the response.
        # Corresponds to the JSON property `metricHeaderEntries`
        # @return [Array<Google::Apis::AnalyticsreportingV4::MetricHeaderEntry>]
        attr_accessor :metric_header_entries
      
        # Headers for the pivots in the response.
        # Corresponds to the JSON property `pivotHeaders`
        # @return [Array<Google::Apis::AnalyticsreportingV4::PivotHeader>]
        attr_accessor :pivot_headers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_header_entries = args[:metric_header_entries] if args.key?(:metric_header_entries)
          @pivot_headers = args[:pivot_headers] if args.key?(:pivot_headers)
        end
      end
      
      # Header for the metrics.
      class MetricHeaderEntry
        include Google::Apis::Core::Hashable
      
        # The name of the header.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The type of the metric, for example `INTEGER`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A list of segment filters in the `OR` group are combined with the logical OR
      # operator.
      class OrFiltersForSegment
        include Google::Apis::Core::Hashable
      
        # List of segment filters to be combined with a `OR` operator.
        # Corresponds to the JSON property `segmentFilterClauses`
        # @return [Array<Google::Apis::AnalyticsreportingV4::SegmentFilterClause>]
        attr_accessor :segment_filter_clauses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segment_filter_clauses = args[:segment_filter_clauses] if args.key?(:segment_filter_clauses)
        end
      end
      
      # Specifies the sorting options.
      class OrderBy
        include Google::Apis::Core::Hashable
      
        # The field which to sort by. The default sort order is ascending. Example:
        # `ga:browser`.
        # Note, that you can only specify one field for sort here. For example,
        # `ga:browser, ga:city` is not valid.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The order type. The default orderType is `VALUE`.
        # Corresponds to the JSON property `orderType`
        # @return [String]
        attr_accessor :order_type
      
        # The sorting order for the field.
        # Corresponds to the JSON property `sortOrder`
        # @return [String]
        attr_accessor :sort_order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_name = args[:field_name] if args.key?(:field_name)
          @order_type = args[:order_type] if args.key?(:order_type)
          @sort_order = args[:sort_order] if args.key?(:sort_order)
        end
      end
      
      # Represents details collected when the visitor views a page.
      class PageviewData
        include Google::Apis::Core::Hashable
      
        # The URL of the page that the visitor viewed.
        # Corresponds to the JSON property `pagePath`
        # @return [String]
        attr_accessor :page_path
      
        # The title of the page that the visitor viewed.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_path = args[:page_path] if args.key?(:page_path)
          @page_title = args[:page_title] if args.key?(:page_title)
        end
      end
      
      # The Pivot describes the pivot section in the request.
      # The Pivot helps rearrange the information in the table for certain reports
      # by pivoting your data on a second dimension.
      class Pivot
        include Google::Apis::Core::Hashable
      
        # DimensionFilterClauses are logically combined with an `AND` operator: only
        # data that is included by all these DimensionFilterClauses contributes to
        # the values in this pivot region. Dimension filters can be used to restrict
        # the columns shown in the pivot region. For example if you have
        # `ga:browser` as the requested dimension in the pivot region, and you
        # specify key filters to restrict `ga:browser` to only "IE" or "Firefox",
        # then only those two browsers would show up as columns.
        # Corresponds to the JSON property `dimensionFilterClauses`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DimensionFilterClause>]
        attr_accessor :dimension_filter_clauses
      
        # A list of dimensions to show as pivot columns. A Pivot can have a maximum
        # of 4 dimensions. Pivot dimensions are part of the restriction on the
        # total number of dimensions allowed in the request.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Dimension>]
        attr_accessor :dimensions
      
        # Specifies the maximum number of groups to return.
        # The default value is 10, also the maximum value is 1,000.
        # Corresponds to the JSON property `maxGroupCount`
        # @return [Fixnum]
        attr_accessor :max_group_count
      
        # The pivot metrics. Pivot metrics are part of the
        # restriction on total number of metrics allowed in the request.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Metric>]
        attr_accessor :metrics
      
        # If k metrics were requested, then the response will contain some
        # data-dependent multiple of k columns in the report.  E.g., if you pivoted
        # on the dimension `ga:browser` then you'd get k columns for "Firefox", k
        # columns for "IE", k columns for "Chrome", etc. The ordering of the groups
        # of columns is determined by descending order of "total" for the first of
        # the k values.  Ties are broken by lexicographic ordering of the first
        # pivot dimension, then lexicographic ordering of the second pivot
        # dimension, and so on.  E.g., if the totals for the first value for
        # Firefox, IE, and Chrome were 8, 2, 8, respectively, the order of columns
        # would be Chrome, Firefox, IE.
        # The following let you choose which of the groups of k columns are
        # included in the response.
        # Corresponds to the JSON property `startGroup`
        # @return [Fixnum]
        attr_accessor :start_group
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_filter_clauses = args[:dimension_filter_clauses] if args.key?(:dimension_filter_clauses)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @max_group_count = args[:max_group_count] if args.key?(:max_group_count)
          @metrics = args[:metrics] if args.key?(:metrics)
          @start_group = args[:start_group] if args.key?(:start_group)
        end
      end
      
      # The headers for each of the pivot sections defined in the request.
      class PivotHeader
        include Google::Apis::Core::Hashable
      
        # A single pivot section header.
        # Corresponds to the JSON property `pivotHeaderEntries`
        # @return [Array<Google::Apis::AnalyticsreportingV4::PivotHeaderEntry>]
        attr_accessor :pivot_header_entries
      
        # The total number of groups for this pivot.
        # Corresponds to the JSON property `totalPivotGroupsCount`
        # @return [Fixnum]
        attr_accessor :total_pivot_groups_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pivot_header_entries = args[:pivot_header_entries] if args.key?(:pivot_header_entries)
          @total_pivot_groups_count = args[:total_pivot_groups_count] if args.key?(:total_pivot_groups_count)
        end
      end
      
      # The headers for the each of the metric column corresponding to the metrics
      # requested in the pivots section of the response.
      class PivotHeaderEntry
        include Google::Apis::Core::Hashable
      
        # The name of the dimensions in the pivot response.
        # Corresponds to the JSON property `dimensionNames`
        # @return [Array<String>]
        attr_accessor :dimension_names
      
        # The values for the dimensions in the pivot.
        # Corresponds to the JSON property `dimensionValues`
        # @return [Array<String>]
        attr_accessor :dimension_values
      
        # Header for the metrics.
        # Corresponds to the JSON property `metric`
        # @return [Google::Apis::AnalyticsreportingV4::MetricHeaderEntry]
        attr_accessor :metric
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_names = args[:dimension_names] if args.key?(:dimension_names)
          @dimension_values = args[:dimension_values] if args.key?(:dimension_values)
          @metric = args[:metric] if args.key?(:metric)
        end
      end
      
      # The metric values in the pivot region.
      class PivotValueRegion
        include Google::Apis::Core::Hashable
      
        # The values of the metrics in each of the pivot regions.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Details of the products in an e-commerce transaction.
      class ProductData
        include Google::Apis::Core::Hashable
      
        # The total revenue from purchased product items.
        # Corresponds to the JSON property `itemRevenue`
        # @return [Float]
        attr_accessor :item_revenue
      
        # The product name, supplied by the e-commerce tracking application, for
        # the purchased items.
        # Corresponds to the JSON property `productName`
        # @return [String]
        attr_accessor :product_name
      
        # Total number of this product units in the transaction.
        # Corresponds to the JSON property `productQuantity`
        # @return [Fixnum]
        attr_accessor :product_quantity
      
        # Unique code that represents the product.
        # Corresponds to the JSON property `productSku`
        # @return [String]
        attr_accessor :product_sku
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_revenue = args[:item_revenue] if args.key?(:item_revenue)
          @product_name = args[:product_name] if args.key?(:product_name)
          @product_quantity = args[:product_quantity] if args.key?(:product_quantity)
          @product_sku = args[:product_sku] if args.key?(:product_sku)
        end
      end
      
      # The data response corresponding to the request.
      class Report
        include Google::Apis::Core::Hashable
      
        # Column headers.
        # Corresponds to the JSON property `columnHeader`
        # @return [Google::Apis::AnalyticsreportingV4::ColumnHeader]
        attr_accessor :column_header
      
        # The data part of the report.
        # Corresponds to the JSON property `data`
        # @return [Google::Apis::AnalyticsreportingV4::ReportData]
        attr_accessor :data
      
        # Page token to retrieve the next page of results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_header = args[:column_header] if args.key?(:column_header)
          @data = args[:data] if args.key?(:data)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The data part of the report.
      class ReportData
        include Google::Apis::Core::Hashable
      
        # The last time the data in the report was refreshed. All the hits received
        # before this timestamp are included in the calculation of the report.
        # Corresponds to the JSON property `dataLastRefreshed`
        # @return [String]
        attr_accessor :data_last_refreshed
      
        # Indicates if response to this request is golden or not. Data is
        # golden when the exact same request will not produce any new results if
        # asked at a later point in time.
        # Corresponds to the JSON property `isDataGolden`
        # @return [Boolean]
        attr_accessor :is_data_golden
        alias_method :is_data_golden?, :is_data_golden
      
        # Minimum and maximum values seen over all matching rows. These are both
        # empty when `hideValueRanges` in the request is false, or when
        # rowCount is zero.
        # Corresponds to the JSON property `maximums`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DateRangeValues>]
        attr_accessor :maximums
      
        # Minimum and maximum values seen over all matching rows. These are both
        # empty when `hideValueRanges` in the request is false, or when
        # rowCount is zero.
        # Corresponds to the JSON property `minimums`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DateRangeValues>]
        attr_accessor :minimums
      
        # Total number of matching rows for this query.
        # Corresponds to the JSON property `rowCount`
        # @return [Fixnum]
        attr_accessor :row_count
      
        # There's one ReportRow for every unique combination of dimensions.
        # Corresponds to the JSON property `rows`
        # @return [Array<Google::Apis::AnalyticsreportingV4::ReportRow>]
        attr_accessor :rows
      
        # If the results are
        # [sampled](https://support.google.com/analytics/answer/2637192),
        # this returns the total number of samples read, one entry per date range.
        # If the results are not sampled this field will not be defined. See
        # [developer guide](/analytics/devguides/reporting/core/v4/basics#sampling)
        # for details.
        # Corresponds to the JSON property `samplesReadCounts`
        # @return [Array<Fixnum>]
        attr_accessor :samples_read_counts
      
        # If the results are
        # [sampled](https://support.google.com/analytics/answer/2637192),
        # this returns the total number of
        # samples present, one entry per date range. If the results are not sampled
        # this field will not be defined. See
        # [developer guide](/analytics/devguides/reporting/core/v4/basics#sampling)
        # for details.
        # Corresponds to the JSON property `samplingSpaceSizes`
        # @return [Array<Fixnum>]
        attr_accessor :sampling_space_sizes
      
        # For each requested date range, for the set of all rows that match
        # the query, every requested value format gets a total. The total
        # for a value format is computed by first totaling the metrics
        # mentioned in the value format and then evaluating the value
        # format as a scalar expression.  E.g., The "totals" for
        # `3 / (ga:sessions + 2)` we compute
        # `3 / ((sum of all relevant ga:sessions) + 2)`.
        # Totals are computed before pagination.
        # Corresponds to the JSON property `totals`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DateRangeValues>]
        attr_accessor :totals
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_last_refreshed = args[:data_last_refreshed] if args.key?(:data_last_refreshed)
          @is_data_golden = args[:is_data_golden] if args.key?(:is_data_golden)
          @maximums = args[:maximums] if args.key?(:maximums)
          @minimums = args[:minimums] if args.key?(:minimums)
          @row_count = args[:row_count] if args.key?(:row_count)
          @rows = args[:rows] if args.key?(:rows)
          @samples_read_counts = args[:samples_read_counts] if args.key?(:samples_read_counts)
          @sampling_space_sizes = args[:sampling_space_sizes] if args.key?(:sampling_space_sizes)
          @totals = args[:totals] if args.key?(:totals)
        end
      end
      
      # The main request class which specifies the Reporting API request.
      class ReportRequest
        include Google::Apis::Core::Hashable
      
        # Defines a cohort group.
        # For example:
        # "cohortGroup": `
        # "cohorts": [`
        # "name": "cohort 1",
        # "type": "FIRST_VISIT_DATE",
        # "dateRange": ` "startDate": "2015-08-01", "endDate": "2015-08-01" `
        # `,`
        # "name": "cohort 2"
        # "type": "FIRST_VISIT_DATE"
        # "dateRange": ` "startDate": "2015-07-01", "endDate": "2015-07-01" `
        # `]
        # `
        # Corresponds to the JSON property `cohortGroup`
        # @return [Google::Apis::AnalyticsreportingV4::CohortGroup]
        attr_accessor :cohort_group
      
        # Date ranges in the request. The request can have a maximum of 2 date
        # ranges. The response will contain a set of metric values for each
        # combination of the dimensions for each date range in the request. So, if
        # there are two date ranges, there will be two set of metric values, one for
        # the original date range and one for the second date range.
        # The `reportRequest.dateRanges` field should not be specified for cohorts
        # or Lifetime value requests.
        # If a date range is not provided, the default date range is (startDate:
        # current date - 7 days, endDate: current date - 1 day). Every
        # [ReportRequest](#ReportRequest) within a `batchGet` method must
        # contain the same `dateRanges` definition.
        # Corresponds to the JSON property `dateRanges`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DateRange>]
        attr_accessor :date_ranges
      
        # The dimension filter clauses for filtering Dimension Values. They are
        # logically combined with the `AND` operator. Note that filtering occurs
        # before any dimensions are aggregated, so that the returned metrics
        # represent the total for only the relevant dimensions.
        # Corresponds to the JSON property `dimensionFilterClauses`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DimensionFilterClause>]
        attr_accessor :dimension_filter_clauses
      
        # The dimensions requested.
        # Requests can have a total of 9 dimensions.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Dimension>]
        attr_accessor :dimensions
      
        # Dimension or metric filters that restrict the data returned for your
        # request. To use the `filtersExpression`, supply a dimension or metric on
        # which to filter, followed by the filter expression. For example, the
        # following expression selects `ga:browser` dimension which starts with
        # Firefox; `ga:browser=~^Firefox`. For more information on dimensions
        # and metric filters, see
        # [Filters
        # reference](https://developers.google.com/analytics/devguides/reporting/core/v3/
        # reference#filters).
        # Corresponds to the JSON property `filtersExpression`
        # @return [String]
        attr_accessor :filters_expression
      
        # If set to true, hides the total of all metrics for all the matching rows,
        # for every date range. The default false and will return the totals.
        # Corresponds to the JSON property `hideTotals`
        # @return [Boolean]
        attr_accessor :hide_totals
        alias_method :hide_totals?, :hide_totals
      
        # If set to true, hides the minimum and maximum across all matching rows.
        # The default is false and the value ranges are returned.
        # Corresponds to the JSON property `hideValueRanges`
        # @return [Boolean]
        attr_accessor :hide_value_ranges
        alias_method :hide_value_ranges?, :hide_value_ranges
      
        # If set to false, the response does not include rows if all the retrieved
        # metrics are equal to zero. The default is false which will exclude these
        # rows.
        # Corresponds to the JSON property `includeEmptyRows`
        # @return [Boolean]
        attr_accessor :include_empty_rows
        alias_method :include_empty_rows?, :include_empty_rows
      
        # The metric filter clauses. They are logically combined with the `AND`
        # operator.  Metric filters look at only the first date range and not the
        # comparing date range. Note that filtering on metrics occurs after the
        # metrics are aggregated.
        # Corresponds to the JSON property `metricFilterClauses`
        # @return [Array<Google::Apis::AnalyticsreportingV4::MetricFilterClause>]
        attr_accessor :metric_filter_clauses
      
        # The metrics requested.
        # Requests must specify at least one metric. Requests can have a
        # total of 10 metrics.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Metric>]
        attr_accessor :metrics
      
        # Sort order on output rows. To compare two rows, the elements of the
        # following are applied in order until a difference is found.  All date
        # ranges in the output get the same row order.
        # Corresponds to the JSON property `orderBys`
        # @return [Array<Google::Apis::AnalyticsreportingV4::OrderBy>]
        attr_accessor :order_bys
      
        # Page size is for paging and specifies the maximum number of returned rows.
        # Page size should be >= 0. A query returns the default of 1,000 rows.
        # The Analytics Core Reporting API returns a maximum of 100,000 rows per
        # request, no matter how many you ask for. It can also return fewer rows
        # than requested, if there aren't as many dimension segments as you expect.
        # For instance, there are fewer than 300 possible values for `ga:country`,
        # so when segmenting only by country, you can't get more than 300 rows,
        # even if you set `pageSize` to a higher value.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A continuation token to get the next page of the results. Adding this to
        # the request will return the rows after the pageToken. The pageToken should
        # be the value returned in the nextPageToken parameter in the response to
        # the GetReports request.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # The pivot definitions. Requests can have a maximum of 2 pivots.
        # Corresponds to the JSON property `pivots`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Pivot>]
        attr_accessor :pivots
      
        # The desired report
        # [sample](https://support.google.com/analytics/answer/2637192) size.
        # If the the `samplingLevel` field is unspecified the `DEFAULT` sampling
        # level is used. Every [ReportRequest](#ReportRequest) within a
        # `batchGet` method must contain the same `samplingLevel` definition. See
        # [developer guide](/analytics/devguides/reporting/core/v4/basics#sampling)
        # for details.
        # Corresponds to the JSON property `samplingLevel`
        # @return [String]
        attr_accessor :sampling_level
      
        # Segment the data returned for the request. A segment definition helps look
        # at a subset of the segment request. A request can contain up to four
        # segments. Every [ReportRequest](#ReportRequest) within a
        # `batchGet` method must contain the same `segments` definition. Requests
        # with segments must have the `ga:segment` dimension.
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Segment>]
        attr_accessor :segments
      
        # The Analytics
        # [view ID](https://support.google.com/analytics/answer/1009618)
        # from which to retrieve data. Every [ReportRequest](#ReportRequest)
        # within a `batchGet` method must contain the same `viewId`.
        # Corresponds to the JSON property `viewId`
        # @return [String]
        attr_accessor :view_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cohort_group = args[:cohort_group] if args.key?(:cohort_group)
          @date_ranges = args[:date_ranges] if args.key?(:date_ranges)
          @dimension_filter_clauses = args[:dimension_filter_clauses] if args.key?(:dimension_filter_clauses)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @filters_expression = args[:filters_expression] if args.key?(:filters_expression)
          @hide_totals = args[:hide_totals] if args.key?(:hide_totals)
          @hide_value_ranges = args[:hide_value_ranges] if args.key?(:hide_value_ranges)
          @include_empty_rows = args[:include_empty_rows] if args.key?(:include_empty_rows)
          @metric_filter_clauses = args[:metric_filter_clauses] if args.key?(:metric_filter_clauses)
          @metrics = args[:metrics] if args.key?(:metrics)
          @order_bys = args[:order_bys] if args.key?(:order_bys)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @pivots = args[:pivots] if args.key?(:pivots)
          @sampling_level = args[:sampling_level] if args.key?(:sampling_level)
          @segments = args[:segments] if args.key?(:segments)
          @view_id = args[:view_id] if args.key?(:view_id)
        end
      end
      
      # A row in the report.
      class ReportRow
        include Google::Apis::Core::Hashable
      
        # List of requested dimensions.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<String>]
        attr_accessor :dimensions
      
        # List of metrics for each requested DateRange.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::AnalyticsreportingV4::DateRangeValues>]
        attr_accessor :metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @metrics = args[:metrics] if args.key?(:metrics)
        end
      end
      
      # The resource quota tokens remaining for the property after the request is
      # completed.
      class ResourceQuotasRemaining
        include Google::Apis::Core::Hashable
      
        # Daily resource quota remaining remaining.
        # Corresponds to the JSON property `dailyQuotaTokensRemaining`
        # @return [Fixnum]
        attr_accessor :daily_quota_tokens_remaining
      
        # Hourly resource quota tokens remaining.
        # Corresponds to the JSON property `hourlyQuotaTokensRemaining`
        # @return [Fixnum]
        attr_accessor :hourly_quota_tokens_remaining
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @daily_quota_tokens_remaining = args[:daily_quota_tokens_remaining] if args.key?(:daily_quota_tokens_remaining)
          @hourly_quota_tokens_remaining = args[:hourly_quota_tokens_remaining] if args.key?(:hourly_quota_tokens_remaining)
        end
      end
      
      # 
      class ScreenviewData
        include Google::Apis::Core::Hashable
      
        # The application name.
        # Corresponds to the JSON property `appName`
        # @return [String]
        attr_accessor :app_name
      
        # Mobile manufacturer or branded name. Eg: "Google", "Apple" etc.
        # Corresponds to the JSON property `mobileDeviceBranding`
        # @return [String]
        attr_accessor :mobile_device_branding
      
        # Mobile device model. Eg: "Pixel", "iPhone" etc.
        # Corresponds to the JSON property `mobileDeviceModel`
        # @return [String]
        attr_accessor :mobile_device_model
      
        # The name of the screen.
        # Corresponds to the JSON property `screenName`
        # @return [String]
        attr_accessor :screen_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_name = args[:app_name] if args.key?(:app_name)
          @mobile_device_branding = args[:mobile_device_branding] if args.key?(:mobile_device_branding)
          @mobile_device_model = args[:mobile_device_model] if args.key?(:mobile_device_model)
          @screen_name = args[:screen_name] if args.key?(:screen_name)
        end
      end
      
      # The request to fetch User Report from Reporting API `userActivity:get` call.
      class SearchUserActivityRequest
        include Google::Apis::Core::Hashable
      
        # Set of all activity types being requested. Only acvities matching these
        # types will be returned in the response. If empty, all activies will be
        # returned.
        # Corresponds to the JSON property `activityTypes`
        # @return [Array<String>]
        attr_accessor :activity_types
      
        # A contiguous set of days: startDate, startDate + 1 day, ..., endDate.
        # The start and end dates are specified in
        # [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) date format `YYYY-MM-DD`.
        # Corresponds to the JSON property `dateRange`
        # @return [Google::Apis::AnalyticsreportingV4::DateRange]
        attr_accessor :date_range
      
        # Page size is for paging and specifies the maximum number of returned rows.
        # Page size should be > 0. If the value is 0 or if the field isn't specified,
        # the request returns the default of 1000 rows per page.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A continuation token to get the next page of the results. Adding this to
        # the request will return the rows after the pageToken. The pageToken should
        # be the value returned in the nextPageToken parameter in the response to
        # the [SearchUserActivityRequest](#SearchUserActivityRequest) request.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Contains information to identify a particular user uniquely.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::AnalyticsreportingV4::User]
        attr_accessor :user
      
        # Required. The Analytics
        # [view ID](https://support.google.com/analytics/answer/1009618)
        # from which to retrieve data. Every
        # [SearchUserActivityRequest](#SearchUserActivityRequest) must contain the
        # `viewId`.
        # Corresponds to the JSON property `viewId`
        # @return [String]
        attr_accessor :view_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activity_types = args[:activity_types] if args.key?(:activity_types)
          @date_range = args[:date_range] if args.key?(:date_range)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @user = args[:user] if args.key?(:user)
          @view_id = args[:view_id] if args.key?(:view_id)
        end
      end
      
      # The response from `userActivity:get` call.
      class SearchUserActivityResponse
        include Google::Apis::Core::Hashable
      
        # This token should be passed to
        # [SearchUserActivityRequest](#SearchUserActivityRequest) to retrieve the
        # next page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # This field represents the
        # [sampling rate](https://support.google.com/analytics/answer/2637192) for
        # the given request and is a number between 0.0 to 1.0. See
        # [developer guide](/analytics/devguides/reporting/core/v4/basics#sampling)
        # for details.
        # Corresponds to the JSON property `sampleRate`
        # @return [Float]
        attr_accessor :sample_rate
      
        # Each record represents a session (device details, duration, etc).
        # Corresponds to the JSON property `sessions`
        # @return [Array<Google::Apis::AnalyticsreportingV4::UserActivitySession>]
        attr_accessor :sessions
      
        # Total rows returned by this query (across different pages).
        # Corresponds to the JSON property `totalRows`
        # @return [Fixnum]
        attr_accessor :total_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sample_rate = args[:sample_rate] if args.key?(:sample_rate)
          @sessions = args[:sessions] if args.key?(:sessions)
          @total_rows = args[:total_rows] if args.key?(:total_rows)
        end
      end
      
      # The segment definition, if the report needs to be segmented.
      # A Segment is a subset of the Analytics data. For example, of the entire
      # set of users, one Segment might be users from a particular country or city.
      class Segment
        include Google::Apis::Core::Hashable
      
        # Dynamic segment definition for defining the segment within the request.
        # A segment can select users, sessions or both.
        # Corresponds to the JSON property `dynamicSegment`
        # @return [Google::Apis::AnalyticsreportingV4::DynamicSegment]
        attr_accessor :dynamic_segment
      
        # The segment ID of a built-in or custom segment, for example `gaid::-3`.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_segment = args[:dynamic_segment] if args.key?(:dynamic_segment)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
        end
      end
      
      # SegmentDefinition defines the segment to be a set of SegmentFilters which
      # are combined together with a logical `AND` operation.
      class SegmentDefinition
        include Google::Apis::Core::Hashable
      
        # A segment is defined by a set of segment filters which are combined
        # together with a logical `AND` operation.
        # Corresponds to the JSON property `segmentFilters`
        # @return [Array<Google::Apis::AnalyticsreportingV4::SegmentFilter>]
        attr_accessor :segment_filters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segment_filters = args[:segment_filters] if args.key?(:segment_filters)
        end
      end
      
      # Dimension filter specifies the filtering options on a dimension.
      class SegmentDimensionFilter
        include Google::Apis::Core::Hashable
      
        # Should the match be case sensitive, ignored for `IN_LIST` operator.
        # Corresponds to the JSON property `caseSensitive`
        # @return [Boolean]
        attr_accessor :case_sensitive
        alias_method :case_sensitive?, :case_sensitive
      
        # Name of the dimension for which the filter is being applied.
        # Corresponds to the JSON property `dimensionName`
        # @return [String]
        attr_accessor :dimension_name
      
        # The list of expressions, only the first element is used for all operators
        # Corresponds to the JSON property `expressions`
        # @return [Array<String>]
        attr_accessor :expressions
      
        # Maximum comparison values for `BETWEEN` match type.
        # Corresponds to the JSON property `maxComparisonValue`
        # @return [String]
        attr_accessor :max_comparison_value
      
        # Minimum comparison values for `BETWEEN` match type.
        # Corresponds to the JSON property `minComparisonValue`
        # @return [String]
        attr_accessor :min_comparison_value
      
        # The operator to use to match the dimension with the expressions.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
          @dimension_name = args[:dimension_name] if args.key?(:dimension_name)
          @expressions = args[:expressions] if args.key?(:expressions)
          @max_comparison_value = args[:max_comparison_value] if args.key?(:max_comparison_value)
          @min_comparison_value = args[:min_comparison_value] if args.key?(:min_comparison_value)
          @operator = args[:operator] if args.key?(:operator)
        end
      end
      
      # SegmentFilter defines the segment to be either a simple or a sequence
      # segment. A simple segment condition contains dimension and metric conditions
      # to select the sessions or users. A sequence segment condition can be used to
      # select users or sessions based on sequential conditions.
      class SegmentFilter
        include Google::Apis::Core::Hashable
      
        # If true, match the complement of simple or sequence segment.
        # For example, to match all visits not from "New York", we can define the
        # segment as follows:
        # "sessionSegment": `
        # "segmentFilters": [`
        # "simpleSegment" :`
        # "orFiltersForSegment": [`
        # "segmentFilterClauses":[`
        # "dimensionFilter": `
        # "dimensionName": "ga:city",
        # "expressions": ["New York"]
        # `
        # `]
        # `]
        # `,
        # "not": "True"
        # `]
        # `,
        # Corresponds to the JSON property `not`
        # @return [Boolean]
        attr_accessor :not
        alias_method :not?, :not
      
        # Sequence conditions consist of one or more steps, where each step is defined
        # by one or more dimension/metric conditions. Multiple steps can be combined
        # with special sequence operators.
        # Corresponds to the JSON property `sequenceSegment`
        # @return [Google::Apis::AnalyticsreportingV4::SequenceSegment]
        attr_accessor :sequence_segment
      
        # A Simple segment conditions consist of one or more dimension/metric
        # conditions that can be combined.
        # Corresponds to the JSON property `simpleSegment`
        # @return [Google::Apis::AnalyticsreportingV4::SimpleSegment]
        attr_accessor :simple_segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @not = args[:not] if args.key?(:not)
          @sequence_segment = args[:sequence_segment] if args.key?(:sequence_segment)
          @simple_segment = args[:simple_segment] if args.key?(:simple_segment)
        end
      end
      
      # Filter Clause to be used in a segment definition, can be wither a metric or
      # a dimension filter.
      class SegmentFilterClause
        include Google::Apis::Core::Hashable
      
        # Dimension filter specifies the filtering options on a dimension.
        # Corresponds to the JSON property `dimensionFilter`
        # @return [Google::Apis::AnalyticsreportingV4::SegmentDimensionFilter]
        attr_accessor :dimension_filter
      
        # Metric filter to be used in a segment filter clause.
        # Corresponds to the JSON property `metricFilter`
        # @return [Google::Apis::AnalyticsreportingV4::SegmentMetricFilter]
        attr_accessor :metric_filter
      
        # Matches the complement (`!`) of the filter.
        # Corresponds to the JSON property `not`
        # @return [Boolean]
        attr_accessor :not
        alias_method :not?, :not
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_filter = args[:dimension_filter] if args.key?(:dimension_filter)
          @metric_filter = args[:metric_filter] if args.key?(:metric_filter)
          @not = args[:not] if args.key?(:not)
        end
      end
      
      # Metric filter to be used in a segment filter clause.
      class SegmentMetricFilter
        include Google::Apis::Core::Hashable
      
        # The value to compare against. If the operator is `BETWEEN`, this value is
        # treated as minimum comparison value.
        # Corresponds to the JSON property `comparisonValue`
        # @return [String]
        attr_accessor :comparison_value
      
        # Max comparison value is only used for `BETWEEN` operator.
        # Corresponds to the JSON property `maxComparisonValue`
        # @return [String]
        attr_accessor :max_comparison_value
      
        # The metric that will be filtered on. A `metricFilter` must contain a
        # metric name.
        # Corresponds to the JSON property `metricName`
        # @return [String]
        attr_accessor :metric_name
      
        # Specifies is the operation to perform to compare the metric. The default
        # is `EQUAL`.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        # Scope for a metric defines the level at which that metric is defined.  The
        # specified metric scope must be equal to or greater than its primary scope
        # as defined in the data model. The primary scope is defined by if the
        # segment is selecting users or sessions.
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comparison_value = args[:comparison_value] if args.key?(:comparison_value)
          @max_comparison_value = args[:max_comparison_value] if args.key?(:max_comparison_value)
          @metric_name = args[:metric_name] if args.key?(:metric_name)
          @operator = args[:operator] if args.key?(:operator)
          @scope = args[:scope] if args.key?(:scope)
        end
      end
      
      # A segment sequence definition.
      class SegmentSequenceStep
        include Google::Apis::Core::Hashable
      
        # Specifies if the step immediately precedes or can be any time before the
        # next step.
        # Corresponds to the JSON property `matchType`
        # @return [String]
        attr_accessor :match_type
      
        # A sequence is specified with a list of Or grouped filters which are
        # combined with `AND` operator.
        # Corresponds to the JSON property `orFiltersForSegment`
        # @return [Array<Google::Apis::AnalyticsreportingV4::OrFiltersForSegment>]
        attr_accessor :or_filters_for_segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @match_type = args[:match_type] if args.key?(:match_type)
          @or_filters_for_segment = args[:or_filters_for_segment] if args.key?(:or_filters_for_segment)
        end
      end
      
      # Sequence conditions consist of one or more steps, where each step is defined
      # by one or more dimension/metric conditions. Multiple steps can be combined
      # with special sequence operators.
      class SequenceSegment
        include Google::Apis::Core::Hashable
      
        # If set, first step condition must match the first hit of the visitor (in
        # the date range).
        # Corresponds to the JSON property `firstStepShouldMatchFirstHit`
        # @return [Boolean]
        attr_accessor :first_step_should_match_first_hit
        alias_method :first_step_should_match_first_hit?, :first_step_should_match_first_hit
      
        # The list of steps in the sequence.
        # Corresponds to the JSON property `segmentSequenceSteps`
        # @return [Array<Google::Apis::AnalyticsreportingV4::SegmentSequenceStep>]
        attr_accessor :segment_sequence_steps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @first_step_should_match_first_hit = args[:first_step_should_match_first_hit] if args.key?(:first_step_should_match_first_hit)
          @segment_sequence_steps = args[:segment_sequence_steps] if args.key?(:segment_sequence_steps)
        end
      end
      
      # A Simple segment conditions consist of one or more dimension/metric
      # conditions that can be combined.
      class SimpleSegment
        include Google::Apis::Core::Hashable
      
        # A list of segment filters groups which are combined with logical `AND`
        # operator.
        # Corresponds to the JSON property `orFiltersForSegment`
        # @return [Array<Google::Apis::AnalyticsreportingV4::OrFiltersForSegment>]
        attr_accessor :or_filters_for_segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @or_filters_for_segment = args[:or_filters_for_segment] if args.key?(:or_filters_for_segment)
        end
      end
      
      # Represents details collected when the visitor performs a transaction on the
      # page.
      class TransactionData
        include Google::Apis::Core::Hashable
      
        # The transaction ID, supplied by the e-commerce tracking method, for the
        # purchase in the shopping cart.
        # Corresponds to the JSON property `transactionId`
        # @return [String]
        attr_accessor :transaction_id
      
        # The total sale revenue (excluding shipping and tax) of the transaction.
        # Corresponds to the JSON property `transactionRevenue`
        # @return [Float]
        attr_accessor :transaction_revenue
      
        # Total cost of shipping.
        # Corresponds to the JSON property `transactionShipping`
        # @return [Float]
        attr_accessor :transaction_shipping
      
        # Total tax for the transaction.
        # Corresponds to the JSON property `transactionTax`
        # @return [Float]
        attr_accessor :transaction_tax
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction_id = args[:transaction_id] if args.key?(:transaction_id)
          @transaction_revenue = args[:transaction_revenue] if args.key?(:transaction_revenue)
          @transaction_shipping = args[:transaction_shipping] if args.key?(:transaction_shipping)
          @transaction_tax = args[:transaction_tax] if args.key?(:transaction_tax)
        end
      end
      
      # Contains information to identify a particular user uniquely.
      class User
        include Google::Apis::Core::Hashable
      
        # Type of the user in the request. The field `userId` is associated with this
        # type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Unique Id of the user for which the data is being requested.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # This represents a user session performed on a specific device at a certain
      # time over a period of time.
      class UserActivitySession
        include Google::Apis::Core::Hashable
      
        # Represents a detailed view into each of the activity in this session.
        # Corresponds to the JSON property `activities`
        # @return [Array<Google::Apis::AnalyticsreportingV4::Activity>]
        attr_accessor :activities
      
        # The data source of a hit. By default, hits sent from analytics.js are
        # reported as "web" and hits sent from the mobile SDKs are reported as "app".
        # These values can be overridden in the Measurement Protocol.
        # Corresponds to the JSON property `dataSource`
        # @return [String]
        attr_accessor :data_source
      
        # The type of device used: "mobile", "tablet" etc.
        # Corresponds to the JSON property `deviceCategory`
        # @return [String]
        attr_accessor :device_category
      
        # Platform on which the activity happened: "android", "ios" etc.
        # Corresponds to the JSON property `platform`
        # @return [String]
        attr_accessor :platform
      
        # Date of this session in ISO-8601 format.
        # Corresponds to the JSON property `sessionDate`
        # @return [String]
        attr_accessor :session_date
      
        # Unique ID of the session.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activities = args[:activities] if args.key?(:activities)
          @data_source = args[:data_source] if args.key?(:data_source)
          @device_category = args[:device_category] if args.key?(:device_category)
          @platform = args[:platform] if args.key?(:platform)
          @session_date = args[:session_date] if args.key?(:session_date)
          @session_id = args[:session_id] if args.key?(:session_id)
        end
      end
    end
  end
end
