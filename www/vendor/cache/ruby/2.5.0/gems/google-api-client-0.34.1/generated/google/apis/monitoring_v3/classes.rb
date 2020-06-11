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
    module MonitoringV3
      
      # Describes how to combine multiple time series to provide different views of
      # the data. Aggregation consists of an alignment step on individual time series (
      # alignment_period and per_series_aligner) followed by an optional reduction
      # step of the data across the aligned time series (cross_series_reducer and
      # group_by_fields). For more details, see Aggregation.
      class Aggregation
        include Google::Apis::Core::Hashable
      
        # The alignment period for per-time series alignment. If present,
        # alignmentPeriod must be at least 60 seconds. After per-time series alignment,
        # each time series will contain data points only on the period boundaries. If
        # perSeriesAligner is not specified or equals ALIGN_NONE, then this field is
        # ignored. If perSeriesAligner is specified and does not equal ALIGN_NONE, then
        # this field must be defined; otherwise an error is returned.
        # Corresponds to the JSON property `alignmentPeriod`
        # @return [String]
        attr_accessor :alignment_period
      
        # The approach to be used to combine time series. Not all reducer functions may
        # be applied to all time series, depending on the metric type and the value type
        # of the original time series. Reduction may change the metric type of value
        # type of the time series.Time series data must be aligned in order to perform
        # cross-time series reduction. If crossSeriesReducer is specified, then
        # perSeriesAligner must be specified and not equal ALIGN_NONE and
        # alignmentPeriod must be specified; otherwise, an error is returned.
        # Corresponds to the JSON property `crossSeriesReducer`
        # @return [String]
        attr_accessor :cross_series_reducer
      
        # The set of fields to preserve when crossSeriesReducer is specified. The
        # groupByFields determine how the time series are partitioned into subsets prior
        # to applying the aggregation function. Each subset contains time series that
        # have the same value for each of the grouping fields. Each individual time
        # series is a member of exactly one subset. The crossSeriesReducer is applied to
        # each subset of time series. It is not possible to reduce across different
        # resource types, so this field implicitly contains resource.type. Fields not
        # specified in groupByFields are aggregated away. If groupByFields is not
        # specified and all the time series have the same resource type, then the time
        # series are aggregated into a single output time series. If crossSeriesReducer
        # is not defined, this field is ignored.
        # Corresponds to the JSON property `groupByFields`
        # @return [Array<String>]
        attr_accessor :group_by_fields
      
        # The approach to be used to align individual time series. Not all alignment
        # functions may be applied to all time series, depending on the metric type and
        # value type of the original time series. Alignment may change the metric type
        # or the value type of the time series.Time series data must be aligned in order
        # to perform cross-time series reduction. If crossSeriesReducer is specified,
        # then perSeriesAligner must be specified and not equal ALIGN_NONE and
        # alignmentPeriod must be specified; otherwise, an error is returned.
        # Corresponds to the JSON property `perSeriesAligner`
        # @return [String]
        attr_accessor :per_series_aligner
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alignment_period = args[:alignment_period] if args.key?(:alignment_period)
          @cross_series_reducer = args[:cross_series_reducer] if args.key?(:cross_series_reducer)
          @group_by_fields = args[:group_by_fields] if args.key?(:group_by_fields)
          @per_series_aligner = args[:per_series_aligner] if args.key?(:per_series_aligner)
        end
      end
      
      # A description of the conditions under which some aspect of your system is
      # considered to be "unhealthy" and the ways to notify people or services about
      # this state. For an overview of alert policies, see Introduction to Alerting.
      class AlertPolicy
        include Google::Apis::Core::Hashable
      
        # How to combine the results of multiple conditions to determine if an incident
        # should be opened.
        # Corresponds to the JSON property `combiner`
        # @return [String]
        attr_accessor :combiner
      
        # A list of conditions for the policy. The conditions are combined by AND or OR
        # according to the combiner field. If the combined conditions evaluate to true,
        # then an incident is created. A policy can have from one to six conditions.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::MonitoringV3::Condition>]
        attr_accessor :conditions
      
        # Describes a change made to a configuration.
        # Corresponds to the JSON property `creationRecord`
        # @return [Google::Apis::MonitoringV3::MutationRecord]
        attr_accessor :creation_record
      
        # A short name or phrase used to identify the policy in dashboards,
        # notifications, and incidents. To avoid confusion, don't use the same display
        # name for multiple policies in the same project. The name is limited to 512
        # Unicode characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A content string and a MIME type that describes the content string's format.
        # Corresponds to the JSON property `documentation`
        # @return [Google::Apis::MonitoringV3::Documentation]
        attr_accessor :documentation
      
        # Whether or not the policy is enabled. On write, the default interpretation if
        # unset is that the policy is enabled. On read, clients should not make any
        # assumption about the state if it has not been populated. The field should
        # always be populated on List and Get operations, unless a field projection has
        # been specified that strips it out.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Describes a change made to a configuration.
        # Corresponds to the JSON property `mutationRecord`
        # @return [Google::Apis::MonitoringV3::MutationRecord]
        attr_accessor :mutation_record
      
        # Required if the policy exists. The resource name for this policy. The syntax
        # is:
        # projects/[PROJECT_ID]/alertPolicies/[ALERT_POLICY_ID]
        # [ALERT_POLICY_ID] is assigned by Stackdriver Monitoring when the policy is
        # created. When calling the alertPolicies.create method, do not include the name
        # field in the alerting policy passed as part of the request.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Identifies the notification channels to which notifications should be sent
        # when incidents are opened or closed or when new violations occur on an already
        # opened incident. Each element of this array corresponds to the name field in
        # each of the NotificationChannel objects that are returned from the
        # ListNotificationChannels method. The syntax of the entries in this field is:
        # projects/[PROJECT_ID]/notificationChannels/[CHANNEL_ID]
        # Corresponds to the JSON property `notificationChannels`
        # @return [Array<String>]
        attr_accessor :notification_channels
      
        # User-supplied key/value data to be used for organizing and identifying the
        # AlertPolicy objects.The field can contain up to 64 entries. Each key and value
        # is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels
        # and values can contain only lowercase letters, numerals, underscores, and
        # dashes. Keys must begin with a letter.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `validity`
        # @return [Google::Apis::MonitoringV3::Status]
        attr_accessor :validity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @combiner = args[:combiner] if args.key?(:combiner)
          @conditions = args[:conditions] if args.key?(:conditions)
          @creation_record = args[:creation_record] if args.key?(:creation_record)
          @display_name = args[:display_name] if args.key?(:display_name)
          @documentation = args[:documentation] if args.key?(:documentation)
          @enabled = args[:enabled] if args.key?(:enabled)
          @mutation_record = args[:mutation_record] if args.key?(:mutation_record)
          @name = args[:name] if args.key?(:name)
          @notification_channels = args[:notification_channels] if args.key?(:notification_channels)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @validity = args[:validity] if args.key?(:validity)
        end
      end
      
      # The authentication parameters to provide to the specified resource or URL that
      # requires a username and password. Currently, only Basic HTTP authentication (
      # https://tools.ietf.org/html/rfc7617) is supported in Uptime checks.
      class BasicAuthentication
        include Google::Apis::Core::Hashable
      
        # The password to use when authenticating with the HTTP server.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The username to use when authenticating with the HTTP server.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @password = args[:password] if args.key?(:password)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # BucketOptions describes the bucket boundaries used to create a histogram for
      # the distribution. The buckets can be in a linear sequence, an exponential
      # sequence, or each bucket can be specified explicitly. BucketOptions does not
      # include the number of values in each bucket.A bucket has an inclusive lower
      # bound and exclusive upper bound for the values that are counted for that
      # bucket. The upper bound of a bucket must be strictly greater than the lower
      # bound. The sequence of N buckets for a distribution consists of an underflow
      # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
      # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
      # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
      # span the whole range of finite values: lower bound of the underflow bucket is -
      # infinity and the upper bound of the overflow bucket is +infinity. The finite
      # buckets are so-called because both bounds are finite.
      class BucketOptions
        include Google::Apis::Core::Hashable
      
        # Specifies a set of buckets with arbitrary widths.There are size(bounds) + 1 (=
        # N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-1):
        # boundsi  Lower bound (1 <= i < N); boundsi - 1The bounds field must contain at
        # least one element. If bounds has only one element, then there are no finite
        # buckets, and that single element is the common boundary of the overflow and
        # underflow buckets.
        # Corresponds to the JSON property `explicitBuckets`
        # @return [Google::Apis::MonitoringV3::Explicit]
        attr_accessor :explicit_buckets
      
        # Specifies an exponential sequence of buckets that have a width that is
        # proportional to the value of the lower bound. Each bucket represents a
        # constant relative uncertainty on a specific value in the bucket.There are
        # num_finite_buckets + 2 (= N) buckets. Bucket i has the following boundaries:
        # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i).  Lower bound (1 <= i <
        # N): scale * (growth_factor ^ (i - 1)).
        # Corresponds to the JSON property `exponentialBuckets`
        # @return [Google::Apis::MonitoringV3::Exponential]
        attr_accessor :exponential_buckets
      
        # Specifies a linear sequence of buckets that all have the same width (except
        # overflow and underflow). Each bucket represents a constant absolute
        # uncertainty on the specific value in the bucket.There are num_finite_buckets +
        # 2 (= N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-
        # 1): offset + (width * i).  Lower bound (1 <= i < N): offset + (width * (i - 1))
        # .
        # Corresponds to the JSON property `linearBuckets`
        # @return [Google::Apis::MonitoringV3::Linear]
        attr_accessor :linear_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explicit_buckets = args[:explicit_buckets] if args.key?(:explicit_buckets)
          @exponential_buckets = args[:exponential_buckets] if args.key?(:exponential_buckets)
          @linear_buckets = args[:linear_buckets] if args.key?(:linear_buckets)
        end
      end
      
      # A collection of data points sent from a collectd-based plugin. See the
      # collectd documentation for more information.
      class CollectdPayload
        include Google::Apis::Core::Hashable
      
        # The end time of the interval.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The measurement metadata. Example: "process_id" -> 12345
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Google::Apis::MonitoringV3::TypedValue>]
        attr_accessor :metadata
      
        # The name of the plugin. Example: "disk".
        # Corresponds to the JSON property `plugin`
        # @return [String]
        attr_accessor :plugin
      
        # The instance name of the plugin Example: "hdcl".
        # Corresponds to the JSON property `pluginInstance`
        # @return [String]
        attr_accessor :plugin_instance
      
        # The start time of the interval.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The measurement type. Example: "memory".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The measurement type instance. Example: "used".
        # Corresponds to the JSON property `typeInstance`
        # @return [String]
        attr_accessor :type_instance
      
        # The measured values during this time interval. Each value must have a
        # different dataSourceName.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::MonitoringV3::CollectdValue>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @metadata = args[:metadata] if args.key?(:metadata)
          @plugin = args[:plugin] if args.key?(:plugin)
          @plugin_instance = args[:plugin_instance] if args.key?(:plugin_instance)
          @start_time = args[:start_time] if args.key?(:start_time)
          @type = args[:type] if args.key?(:type)
          @type_instance = args[:type_instance] if args.key?(:type_instance)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Describes the error status for payloads that were not written.
      class CollectdPayloadError
        include Google::Apis::Core::Hashable
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::MonitoringV3::Status]
        attr_accessor :error
      
        # The zero-based index in CreateCollectdTimeSeriesRequest.collectd_payloads.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Records the error status for values that were not written due to an error.
        # Failed payloads for which nothing is written will not include partial value
        # errors.
        # Corresponds to the JSON property `valueErrors`
        # @return [Array<Google::Apis::MonitoringV3::CollectdValueError>]
        attr_accessor :value_errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @index = args[:index] if args.key?(:index)
          @value_errors = args[:value_errors] if args.key?(:value_errors)
        end
      end
      
      # A single data point from a collectd-based plugin.
      class CollectdValue
        include Google::Apis::Core::Hashable
      
        # The data source for the collectd value. For example there are two data sources
        # for network measurements: "rx" and "tx".
        # Corresponds to the JSON property `dataSourceName`
        # @return [String]
        attr_accessor :data_source_name
      
        # The type of measurement.
        # Corresponds to the JSON property `dataSourceType`
        # @return [String]
        attr_accessor :data_source_type
      
        # A single strongly-typed value.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::MonitoringV3::TypedValue]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_source_name = args[:data_source_name] if args.key?(:data_source_name)
          @data_source_type = args[:data_source_type] if args.key?(:data_source_type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Describes the error status for values that were not written.
      class CollectdValueError
        include Google::Apis::Core::Hashable
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::MonitoringV3::Status]
        attr_accessor :error
      
        # The zero-based index in CollectdPayload.values within the parent
        # CreateCollectdTimeSeriesRequest.collectd_payloads.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @index = args[:index] if args.key?(:index)
        end
      end
      
      # A condition is a true/false test that determines when an alerting policy
      # should open an incident. If a condition evaluates to true, it signifies that
      # something is wrong.
      class Condition
        include Google::Apis::Core::Hashable
      
        # A condition type that checks that monitored resources are reporting data. The
        # configuration defines a metric and a set of monitored resources. The predicate
        # is considered in violation when a time series for the specified metric of a
        # monitored resource does not include any data in the specified duration.
        # Corresponds to the JSON property `conditionAbsent`
        # @return [Google::Apis::MonitoringV3::MetricAbsence]
        attr_accessor :condition_absent
      
        # A condition type that compares a collection of time series against a threshold.
        # Corresponds to the JSON property `conditionThreshold`
        # @return [Google::Apis::MonitoringV3::MetricThreshold]
        attr_accessor :condition_threshold
      
        # A short name or phrase used to identify the condition in dashboards,
        # notifications, and incidents. To avoid confusion, don't use the same display
        # name for multiple conditions in the same policy.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Required if the condition exists. The unique resource name for this condition.
        # Its syntax is:
        # projects/[PROJECT_ID]/alertPolicies/[POLICY_ID]/conditions/[CONDITION_ID]
        # [CONDITION_ID] is assigned by Stackdriver Monitoring when the condition is
        # created as part of a new or updated alerting policy.When calling the
        # alertPolicies.create method, do not include the name field in the conditions
        # of the requested alerting policy. Stackdriver Monitoring creates the condition
        # identifiers and includes them in the new policy.When calling the alertPolicies.
        # update method to update a policy, including a condition name causes the
        # existing condition to be updated. Conditions without names are added to the
        # updated policy. Existing conditions are deleted if they are not updated.Best
        # practice is to preserve [CONDITION_ID] if you make only small changes, such as
        # those to condition thresholds, durations, or trigger values. Otherwise, treat
        # the change as a new condition and let the existing condition be deleted.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition_absent = args[:condition_absent] if args.key?(:condition_absent)
          @condition_threshold = args[:condition_threshold] if args.key?(:condition_threshold)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Used to perform string matching. It allows substring and regular expressions,
      # together with their negations.
      class ContentMatcher
        include Google::Apis::Core::Hashable
      
        # String or regex content to match (max 1024 bytes)
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The type of content matcher that will be applied to the server output,
        # compared to the content string when the check is run.
        # Corresponds to the JSON property `matcher`
        # @return [String]
        attr_accessor :matcher
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @matcher = args[:matcher] if args.key?(:matcher)
        end
      end
      
      # The CreateCollectdTimeSeries request.
      class CreateCollectdTimeSeriesRequest
        include Google::Apis::Core::Hashable
      
        # The collectd payloads representing the time series data. You must not include
        # more than a single point for each time series, so no two payloads can have the
        # same values for all of the fields plugin, plugin_instance, type, and
        # type_instance.
        # Corresponds to the JSON property `collectdPayloads`
        # @return [Array<Google::Apis::MonitoringV3::CollectdPayload>]
        attr_accessor :collectd_payloads
      
        # The version of collectd that collected the data. Example: "5.3.0-192.el6".
        # Corresponds to the JSON property `collectdVersion`
        # @return [String]
        attr_accessor :collectd_version
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The type field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the labels field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
        # zone":
        # ` "type": "gce_instance",
        # "labels": ` "instance_id": "12345678901234",
        # "zone": "us-central1-a" ``
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::MonitoringV3::MonitoredResource]
        attr_accessor :resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collectd_payloads = args[:collectd_payloads] if args.key?(:collectd_payloads)
          @collectd_version = args[:collectd_version] if args.key?(:collectd_version)
          @resource = args[:resource] if args.key?(:resource)
        end
      end
      
      # The CreateCollectdTimeSeries response.
      class CreateCollectdTimeSeriesResponse
        include Google::Apis::Core::Hashable
      
        # Records the error status for points that were not written due to an error.
        # Failed requests for which nothing is written will return an error response
        # instead.
        # Corresponds to the JSON property `payloadErrors`
        # @return [Array<Google::Apis::MonitoringV3::CollectdPayloadError>]
        attr_accessor :payload_errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload_errors = args[:payload_errors] if args.key?(:payload_errors)
        end
      end
      
      # The CreateTimeSeries request.
      class CreateTimeSeriesRequest
        include Google::Apis::Core::Hashable
      
        # The new data to be added to a list of time series. Adds at most one data point
        # to each of several time series. The new data point must be more recent than
        # any other point in its time series. Each TimeSeries value must fully specify a
        # unique time series by supplying all label values for the metric and the
        # monitored resource.The maximum number of TimeSeries objects per Create request
        # is 200.
        # Corresponds to the JSON property `timeSeries`
        # @return [Array<Google::Apis::MonitoringV3::TimeSeries>]
        attr_accessor :time_series
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @time_series = args[:time_series] if args.key?(:time_series)
        end
      end
      
      # Distribution contains summary statistics for a population of values. It
      # optionally contains a histogram representing the distribution of those values
      # across a set of buckets.The summary statistics are the count, mean, sum of the
      # squared deviation from the mean, the minimum, and the maximum of the set of
      # population of values. The histogram is based on a sequence of buckets and
      # gives a count of values that fall into each bucket. The boundaries of the
      # buckets are given either explicitly or by formulas for buckets of fixed or
      # exponentially increasing widths.Although it is not forbidden, it is generally
      # a bad idea to include non-finite values (infinities or NaNs) in the population
      # of values, as this will render the mean and sum_of_squared_deviation fields
      # meaningless.
      class Distribution
        include Google::Apis::Core::Hashable
      
        # Required in the Stackdriver Monitoring API v3. The values for each bucket
        # specified in bucket_options. The sum of the values in bucketCounts must equal
        # the value in the count field of the Distribution object. The order of the
        # bucket counts follows the numbering schemes described for the three bucket
        # types. The underflow bucket has number 0; the finite buckets, if any, have
        # numbers 1 through N-2; and the overflow bucket has number N-1. The size of
        # bucket_counts must not be greater than N. If the size is less than N, then the
        # remaining buckets are assigned values of zero.
        # Corresponds to the JSON property `bucketCounts`
        # @return [Array<Fixnum>]
        attr_accessor :bucket_counts
      
        # BucketOptions describes the bucket boundaries used to create a histogram for
        # the distribution. The buckets can be in a linear sequence, an exponential
        # sequence, or each bucket can be specified explicitly. BucketOptions does not
        # include the number of values in each bucket.A bucket has an inclusive lower
        # bound and exclusive upper bound for the values that are counted for that
        # bucket. The upper bound of a bucket must be strictly greater than the lower
        # bound. The sequence of N buckets for a distribution consists of an underflow
        # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
        # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
        # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
        # span the whole range of finite values: lower bound of the underflow bucket is -
        # infinity and the upper bound of the overflow bucket is +infinity. The finite
        # buckets are so-called because both bounds are finite.
        # Corresponds to the JSON property `bucketOptions`
        # @return [Google::Apis::MonitoringV3::BucketOptions]
        attr_accessor :bucket_options
      
        # The number of values in the population. Must be non-negative. This value must
        # equal the sum of the values in bucket_counts if a histogram is provided.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Must be in increasing order of value field.
        # Corresponds to the JSON property `exemplars`
        # @return [Array<Google::Apis::MonitoringV3::Exemplar>]
        attr_accessor :exemplars
      
        # The arithmetic mean of the values in the population. If count is zero then
        # this field must be zero.
        # Corresponds to the JSON property `mean`
        # @return [Float]
        attr_accessor :mean
      
        # The range of the population values.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::MonitoringV3::Range]
        attr_accessor :range
      
        # The sum of squared deviations from the mean of the values in the population.
        # For values x_i this is:
        # Sum[i=1..n]((x_i - mean)^2)
        # Knuth, "The Art of Computer Programming", Vol. 2, page 323, 3rd edition
        # describes Welford's method for accumulating this sum in one pass.If count is
        # zero then this field must be zero.
        # Corresponds to the JSON property `sumOfSquaredDeviation`
        # @return [Float]
        attr_accessor :sum_of_squared_deviation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_counts = args[:bucket_counts] if args.key?(:bucket_counts)
          @bucket_options = args[:bucket_options] if args.key?(:bucket_options)
          @count = args[:count] if args.key?(:count)
          @exemplars = args[:exemplars] if args.key?(:exemplars)
          @mean = args[:mean] if args.key?(:mean)
          @range = args[:range] if args.key?(:range)
          @sum_of_squared_deviation = args[:sum_of_squared_deviation] if args.key?(:sum_of_squared_deviation)
        end
      end
      
      # A content string and a MIME type that describes the content string's format.
      class Documentation
        include Google::Apis::Core::Hashable
      
        # The text of the documentation, interpreted according to mime_type. The content
        # may not exceed 8,192 Unicode characters and may not exceed more than 10,240
        # bytes when encoded in UTF-8 format, whichever is smaller.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The format of the content field. Presently, only the value "text/markdown" is
        # supported. See Markdown (https://en.wikipedia.org/wiki/Markdown) for more
        # information.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # A set of (label, value) pairs which were dropped during aggregation, attached
      # to google.api.Distribution.Exemplars in google.api.Distribution values during
      # aggregation.These values are used in combination with the label values that
      # remain on the aggregated Distribution timeseries to construct the full label
      # set for the exemplar values. The resulting full label set may be used to
      # identify the specific task/job/instance (for example) which may be
      # contributing to a long-tail, while allowing the storage savings of only
      # storing aggregated distribution values for a large group.Note that there are
      # no guarantees on ordering of the labels from exemplar-to-exemplar and from
      # distribution-to-distribution in the same stream, and there may be duplicates.
      # It is up to clients to resolve any ambiguities.
      class DroppedLabels
        include Google::Apis::Core::Hashable
      
        # Map from label to its value, for all labels dropped in any aggregation.
        # Corresponds to the JSON property `label`
        # @return [Hash<String,String>]
        attr_accessor :label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for Empty is empty JSON object ``.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Exemplars are example points that may be used to annotate aggregated
      # distribution values. They are metadata that gives information about a
      # particular value added to a Distribution bucket, such as a trace ID that was
      # active when a value was added. They may contain further information, such as a
      # example values and timestamps, origin, etc.
      class Exemplar
        include Google::Apis::Core::Hashable
      
        # Contextual information about the example value. Examples are:Trace: type.
        # googleapis.com/google.monitoring.v3.SpanContextLiteral string: type.googleapis.
        # com/google.protobuf.StringValueLabels dropped during aggregation:  type.
        # googleapis.com/google.monitoring.v3.DroppedLabelsThere may be only a single
        # attachment of any given message type in a single exemplar, and this is
        # enforced by the system.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :attachments
      
        # The observation (sampling) time of the above value.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Value of the exemplar point. This value determines to which bucket the
        # exemplar belongs.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments = args[:attachments] if args.key?(:attachments)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Specifies a set of buckets with arbitrary widths.There are size(bounds) + 1 (=
      # N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-1):
      # boundsi  Lower bound (1 <= i < N); boundsi - 1The bounds field must contain at
      # least one element. If bounds has only one element, then there are no finite
      # buckets, and that single element is the common boundary of the overflow and
      # underflow buckets.
      class Explicit
        include Google::Apis::Core::Hashable
      
        # The values must be monotonically increasing.
        # Corresponds to the JSON property `bounds`
        # @return [Array<Float>]
        attr_accessor :bounds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounds = args[:bounds] if args.key?(:bounds)
        end
      end
      
      # Specifies an exponential sequence of buckets that have a width that is
      # proportional to the value of the lower bound. Each bucket represents a
      # constant relative uncertainty on a specific value in the bucket.There are
      # num_finite_buckets + 2 (= N) buckets. Bucket i has the following boundaries:
      # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i).  Lower bound (1 <= i <
      # N): scale * (growth_factor ^ (i - 1)).
      class Exponential
        include Google::Apis::Core::Hashable
      
        # Must be greater than 1.
        # Corresponds to the JSON property `growthFactor`
        # @return [Float]
        attr_accessor :growth_factor
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Must be greater than 0.
        # Corresponds to the JSON property `scale`
        # @return [Float]
        attr_accessor :scale
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @growth_factor = args[:growth_factor] if args.key?(:growth_factor)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @scale = args[:scale] if args.key?(:scale)
        end
      end
      
      # A single field of a message type.
      class Field
        include Google::Apis::Core::Hashable
      
        # The field cardinality.
        # Corresponds to the JSON property `cardinality`
        # @return [String]
        attr_accessor :cardinality
      
        # The string value of the default value of this field. Proto2 syntax only.
        # Corresponds to the JSON property `defaultValue`
        # @return [String]
        attr_accessor :default_value
      
        # The field JSON name.
        # Corresponds to the JSON property `jsonName`
        # @return [String]
        attr_accessor :json_name
      
        # The field type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The field name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The field number.
        # Corresponds to the JSON property `number`
        # @return [Fixnum]
        attr_accessor :number
      
        # The index of the field type in Type.oneofs, for message or enumeration types.
        # The first type has index 1; zero means the type is not in the list.
        # Corresponds to the JSON property `oneofIndex`
        # @return [Fixnum]
        attr_accessor :oneof_index
      
        # The protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::MonitoringV3::Option>]
        attr_accessor :options
      
        # Whether to use alternative packed wire representation.
        # Corresponds to the JSON property `packed`
        # @return [Boolean]
        attr_accessor :packed
        alias_method :packed?, :packed
      
        # The field type URL, without the scheme, for message or enumeration types.
        # Example: "type.googleapis.com/google.protobuf.Timestamp".
        # Corresponds to the JSON property `typeUrl`
        # @return [String]
        attr_accessor :type_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cardinality = args[:cardinality] if args.key?(:cardinality)
          @default_value = args[:default_value] if args.key?(:default_value)
          @json_name = args[:json_name] if args.key?(:json_name)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @number = args[:number] if args.key?(:number)
          @oneof_index = args[:oneof_index] if args.key?(:oneof_index)
          @options = args[:options] if args.key?(:options)
          @packed = args[:packed] if args.key?(:packed)
          @type_url = args[:type_url] if args.key?(:type_url)
        end
      end
      
      # The GetNotificationChannelVerificationCode request.
      class GetNotificationChannelVerificationCodeRequest
        include Google::Apis::Core::Hashable
      
        # The desired expiration time. If specified, the API will guarantee that the
        # returned code will not be valid after the specified timestamp; however, the
        # API cannot guarantee that the returned code will be valid for at least as long
        # as the requested time (the API puts an upper bound on the amount of time for
        # which a code may be valid). If omitted, a default expiration will be used,
        # which may be less than the max permissible expiration (so specifying an
        # expiration may extend the code's lifetime over omitting an expiration, even
        # though the API does impose an upper limit on the maximum expiration that is
        # permitted).
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
        end
      end
      
      # The GetNotificationChannelVerificationCode request.
      class GetNotificationChannelVerificationCodeResponse
        include Google::Apis::Core::Hashable
      
        # The verification code, which may be used to verify other channels that have an
        # equivalent identity (i.e. other channels of the same type with the same
        # fingerprint such as other email channels with the same email address or other
        # sms channels with the same number).
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # The expiration time associated with the code that was returned. If an
        # expiration was provided in the request, this is the minimum of the requested
        # expiration in the request and the max permitted expiration.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
        end
      end
      
      # The description of a dynamic collection of monitored resources. Each group has
      # a filter that is matched against monitored resources and their associated
      # metadata. If a group's filter matches an available monitored resource, then
      # that resource is a member of that group. Groups can contain any number of
      # monitored resources, and each monitored resource can be a member of any number
      # of groups.Groups can be nested in parent-child hierarchies. The parentName
      # field identifies an optional parent for each group. If a group has a parent,
      # then the only monitored resources available to be matched by the group's
      # filter are the resources contained in the parent group. In other words, a
      # group contains the monitored resources that match its filter and the filters
      # of all the group's ancestors. A group without a parent can contain any
      # monitored resource.For example, consider an infrastructure running a set of
      # instances with two user-defined tags: "environment" and "role". A parent group
      # has a filter, environment="production". A child of that parent group has a
      # filter, role="transcoder". The parent group contains all instances in the
      # production environment, regardless of their roles. The child group contains
      # instances that have the transcoder role and are in the production environment.
      # The monitored resources contained in a group can change at any moment,
      # depending on what resources exist and what filters are associated with the
      # group and its ancestors.
      class Group
        include Google::Apis::Core::Hashable
      
        # A user-assigned name for this group, used only for display purposes.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The filter used to determine which monitored resources belong to this group.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # If true, the members of this group are considered to be a cluster. The system
        # can perform additional analysis on groups that are clusters.
        # Corresponds to the JSON property `isCluster`
        # @return [Boolean]
        attr_accessor :is_cluster
        alias_method :is_cluster?, :is_cluster
      
        # Output only. The name of this group. The format is "projects/`
        # project_id_or_number`/groups/`group_id`". When creating a group, this field is
        # ignored and a new name is created consisting of the project specified in the
        # call to CreateGroup and a unique `group_id` that is generated automatically.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The name of the group's parent, if it has one. The format is "projects/`
        # project_id_or_number`/groups/`group_id`". For groups with no parent,
        # parentName is the empty string, "".
        # Corresponds to the JSON property `parentName`
        # @return [String]
        attr_accessor :parent_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @filter = args[:filter] if args.key?(:filter)
          @is_cluster = args[:is_cluster] if args.key?(:is_cluster)
          @name = args[:name] if args.key?(:name)
          @parent_name = args[:parent_name] if args.key?(:parent_name)
        end
      end
      
      # Information involved in an HTTP/HTTPS Uptime check request.
      class HttpCheck
        include Google::Apis::Core::Hashable
      
        # The authentication parameters to provide to the specified resource or URL that
        # requires a username and password. Currently, only Basic HTTP authentication (
        # https://tools.ietf.org/html/rfc7617) is supported in Uptime checks.
        # Corresponds to the JSON property `authInfo`
        # @return [Google::Apis::MonitoringV3::BasicAuthentication]
        attr_accessor :auth_info
      
        # The list of headers to send as part of the Uptime check request. If two
        # headers have the same key and different values, they should be entered as a
        # single header, with the value being a comma-separated list of all the desired
        # values as described at https://www.w3.org/Protocols/rfc2616/rfc2616.txt (page
        # 31). Entering two separate headers with the same key in a Create call will
        # cause the first to be overwritten by the second. The maximum number of headers
        # allowed is 100.
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # Boolean specifiying whether to encrypt the header information. Encryption
        # should be specified for any headers related to authentication that you do not
        # wish to be seen when retrieving the configuration. The server will be
        # responsible for encrypting the headers. On Get/List calls, if mask_headers is
        # set to true then the headers will be obscured with ******.
        # Corresponds to the JSON property `maskHeaders`
        # @return [Boolean]
        attr_accessor :mask_headers
        alias_method :mask_headers?, :mask_headers
      
        # Optional (defaults to "/"). The path to the page against which to run the
        # check. Will be combined with the host (specified within the monitored_resource)
        # and port to construct the full URL. If the provided path does not begin with "
        # /", a "/" will be prepended automatically.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Optional (defaults to 80 when use_ssl is false, and 443 when use_ssl is true).
        # The TCP port on the HTTP server against which to run the check. Will be
        # combined with host (specified within the monitored_resource) and path to
        # construct the full URL.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # If true, use HTTPS instead of HTTP to run the check.
        # Corresponds to the JSON property `useSsl`
        # @return [Boolean]
        attr_accessor :use_ssl
        alias_method :use_ssl?, :use_ssl
      
        # Boolean specifying whether to include SSL certificate validation as a part of
        # the Uptime check. Only applies to checks where monitored_resource is set to
        # uptime_url. If use_ssl is false, setting validate_ssl to true has no effect.
        # Corresponds to the JSON property `validateSsl`
        # @return [Boolean]
        attr_accessor :validate_ssl
        alias_method :validate_ssl?, :validate_ssl
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth_info = args[:auth_info] if args.key?(:auth_info)
          @headers = args[:headers] if args.key?(:headers)
          @mask_headers = args[:mask_headers] if args.key?(:mask_headers)
          @path = args[:path] if args.key?(:path)
          @port = args[:port] if args.key?(:port)
          @use_ssl = args[:use_ssl] if args.key?(:use_ssl)
          @validate_ssl = args[:validate_ssl] if args.key?(:validate_ssl)
        end
      end
      
      # An internal checker allows Uptime checks to run on private/internal GCP
      # resources.
      class InternalChecker
        include Google::Apis::Core::Hashable
      
        # The checker's human-readable name. The display name should be unique within a
        # Stackdriver Workspace in order to make it easier to identify; however,
        # uniqueness is not enforced.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The GCP zone the Uptime check should egress from. Only respected for internal
        # Uptime checks, where internal_network is specified.
        # Corresponds to the JSON property `gcpZone`
        # @return [String]
        attr_accessor :gcp_zone
      
        # A unique resource name for this InternalChecker. The format is:projects/[
        # PROJECT_ID]/internalCheckers/[INTERNAL_CHECKER_ID].[PROJECT_ID] is the
        # Stackdriver Workspace project for the Uptime check config associated with the
        # internal checker.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The GCP VPC network (https://cloud.google.com/vpc/docs/vpc) where the internal
        # resource lives (ex: "default").
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # The GCP project ID where the internal checker lives. Not necessary the same as
        # the Workspace project.
        # Corresponds to the JSON property `peerProjectId`
        # @return [String]
        attr_accessor :peer_project_id
      
        # The current operational state of the internal checker.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @gcp_zone = args[:gcp_zone] if args.key?(:gcp_zone)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @peer_project_id = args[:peer_project_id] if args.key?(:peer_project_id)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # A description of a label.
      class LabelDescriptor
        include Google::Apis::Core::Hashable
      
        # A human-readable description for the label.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The key for this label. The key must meet the following criteria:
        # Does not exceed 100 characters.
        # Matches the following regular expression: [a-zA-Z][a-zA-Z0-9_]*
        # The first character must be an upper- or lower-case letter.
        # The remaining characters must be letters, digits, or underscores.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The type of data that can be assigned to the label.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @key = args[:key] if args.key?(:key)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # Specifies a linear sequence of buckets that all have the same width (except
      # overflow and underflow). Each bucket represents a constant absolute
      # uncertainty on the specific value in the bucket.There are num_finite_buckets +
      # 2 (= N) buckets. Bucket i has the following boundaries:Upper bound (0 <= i < N-
      # 1): offset + (width * i).  Lower bound (1 <= i < N): offset + (width * (i - 1))
      # .
      class Linear
        include Google::Apis::Core::Hashable
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Lower bound of the first bucket.
        # Corresponds to the JSON property `offset`
        # @return [Float]
        attr_accessor :offset
      
        # Must be greater than 0.
        # Corresponds to the JSON property `width`
        # @return [Float]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @offset = args[:offset] if args.key?(:offset)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # The protocol for the ListAlertPolicies response.
      class ListAlertPoliciesResponse
        include Google::Apis::Core::Hashable
      
        # The returned alert policies.
        # Corresponds to the JSON property `alertPolicies`
        # @return [Array<Google::Apis::MonitoringV3::AlertPolicy>]
        attr_accessor :alert_policies
      
        # If there might be more results than were returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_policies = args[:alert_policies] if args.key?(:alert_policies)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The ListGroupMembers response.
      class ListGroupMembersResponse
        include Google::Apis::Core::Hashable
      
        # A set of monitored resources in the group.
        # Corresponds to the JSON property `members`
        # @return [Array<Google::Apis::MonitoringV3::MonitoredResource>]
        attr_accessor :members
      
        # If there are more results than have been returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of elements matching this request.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @members = args[:members] if args.key?(:members)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # The ListGroups response.
      class ListGroupsResponse
        include Google::Apis::Core::Hashable
      
        # The groups that match the specified filters.
        # Corresponds to the JSON property `group`
        # @return [Array<Google::Apis::MonitoringV3::Group>]
        attr_accessor :group
      
        # If there are more results than have been returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group = args[:group] if args.key?(:group)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The ListMetricDescriptors response.
      class ListMetricDescriptorsResponse
        include Google::Apis::Core::Hashable
      
        # The metric descriptors that are available to the project and that match the
        # value of filter, if present.
        # Corresponds to the JSON property `metricDescriptors`
        # @return [Array<Google::Apis::MonitoringV3::MetricDescriptor>]
        attr_accessor :metric_descriptors
      
        # If there are more results than have been returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_descriptors = args[:metric_descriptors] if args.key?(:metric_descriptors)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The ListMonitoredResourceDescriptors response.
      class ListMonitoredResourceDescriptorsResponse
        include Google::Apis::Core::Hashable
      
        # If there are more results than have been returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The monitored resource descriptors that are available to this project and that
        # match filter, if present.
        # Corresponds to the JSON property `resourceDescriptors`
        # @return [Array<Google::Apis::MonitoringV3::MonitoredResourceDescriptor>]
        attr_accessor :resource_descriptors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @resource_descriptors = args[:resource_descriptors] if args.key?(:resource_descriptors)
        end
      end
      
      # The ListNotificationChannelDescriptors response.
      class ListNotificationChannelDescriptorsResponse
        include Google::Apis::Core::Hashable
      
        # The monitored resource descriptors supported for the specified project,
        # optionally filtered.
        # Corresponds to the JSON property `channelDescriptors`
        # @return [Array<Google::Apis::MonitoringV3::NotificationChannelDescriptor>]
        attr_accessor :channel_descriptors
      
        # If not empty, indicates that there may be more results that match the request.
        # Use the value in the page_token field in a subsequent request to fetch the
        # next set of results. If empty, all results have been returned.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel_descriptors = args[:channel_descriptors] if args.key?(:channel_descriptors)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The ListNotificationChannels response.
      class ListNotificationChannelsResponse
        include Google::Apis::Core::Hashable
      
        # If not empty, indicates that there may be more results that match the request.
        # Use the value in the page_token field in a subsequent request to fetch the
        # next set of results. If empty, all results have been returned.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The notification channels defined for the specified project.
        # Corresponds to the JSON property `notificationChannels`
        # @return [Array<Google::Apis::MonitoringV3::NotificationChannel>]
        attr_accessor :notification_channels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @notification_channels = args[:notification_channels] if args.key?(:notification_channels)
        end
      end
      
      # The ListTimeSeries response.
      class ListTimeSeriesResponse
        include Google::Apis::Core::Hashable
      
        # Query execution errors that may have caused the time series data returned to
        # be incomplete.
        # Corresponds to the JSON property `executionErrors`
        # @return [Array<Google::Apis::MonitoringV3::Status>]
        attr_accessor :execution_errors
      
        # If there are more results than have been returned, then this field is set to a
        # non-empty value. To see the additional results, use that value as pageToken in
        # the next call to this method.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # One or more time series that match the filter included in the request.
        # Corresponds to the JSON property `timeSeries`
        # @return [Array<Google::Apis::MonitoringV3::TimeSeries>]
        attr_accessor :time_series
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_errors = args[:execution_errors] if args.key?(:execution_errors)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @time_series = args[:time_series] if args.key?(:time_series)
        end
      end
      
      # The protocol for the ListUptimeCheckConfigs response.
      class ListUptimeCheckConfigsResponse
        include Google::Apis::Core::Hashable
      
        # This field represents the pagination token to retrieve the next page of
        # results. If the value is empty, it means no further results for the request.
        # To retrieve the next page of results, the value of the next_page_token is
        # passed to the subsequent List method call (in the request message's page_token
        # field).
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of Uptime check configurations for the project, irrespective
        # of any pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        # The returned Uptime check configurations.
        # Corresponds to the JSON property `uptimeCheckConfigs`
        # @return [Array<Google::Apis::MonitoringV3::UptimeCheckConfig>]
        attr_accessor :uptime_check_configs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
          @uptime_check_configs = args[:uptime_check_configs] if args.key?(:uptime_check_configs)
        end
      end
      
      # The protocol for the ListUptimeCheckIps response.
      class ListUptimeCheckIpsResponse
        include Google::Apis::Core::Hashable
      
        # This field represents the pagination token to retrieve the next page of
        # results. If the value is empty, it means no further results for the request.
        # To retrieve the next page of results, the value of the next_page_token is
        # passed to the subsequent List method call (in the request message's page_token
        # field). NOTE: this field is not yet implemented
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The returned list of IP addresses (including region and location) that the
        # checkers run from.
        # Corresponds to the JSON property `uptimeCheckIps`
        # @return [Array<Google::Apis::MonitoringV3::UptimeCheckIp>]
        attr_accessor :uptime_check_ips
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @uptime_check_ips = args[:uptime_check_ips] if args.key?(:uptime_check_ips)
        end
      end
      
      # A specific metric, identified by specifying values for all of the labels of a
      # MetricDescriptor.
      class Metric
        include Google::Apis::Core::Hashable
      
        # The set of label values that uniquely identify this metric. All labels listed
        # in the MetricDescriptor must be assigned values.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # An existing metric type, see google.api.MetricDescriptor. For example, custom.
        # googleapis.com/invoice/paid/amount.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A condition type that checks that monitored resources are reporting data. The
      # configuration defines a metric and a set of monitored resources. The predicate
      # is considered in violation when a time series for the specified metric of a
      # monitored resource does not include any data in the specified duration.
      class MetricAbsence
        include Google::Apis::Core::Hashable
      
        # Specifies the alignment of data points in individual time series as well as
        # how to combine the retrieved time series together (such as when aggregating
        # multiple streams on each resource to a single stream for each resource or when
        # aggregating streams across all members of a group of resrouces). Multiple
        # aggregations are applied in the order specified.This field is similar to the
        # one in the ListTimeSeries request. It is advisable to use the ListTimeSeries
        # method when debugging this field.
        # Corresponds to the JSON property `aggregations`
        # @return [Array<Google::Apis::MonitoringV3::Aggregation>]
        attr_accessor :aggregations
      
        # The amount of time that a time series must fail to report new data to be
        # considered failing. Currently, only values that are a multiple of a minute--e.
        # g. 60, 120, or 300 seconds--are supported. If an invalid value is given, an
        # error will be returned. The Duration.nanos field is ignored.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # A filter that identifies which time series should be compared with the
        # threshold.The filter is similar to the one that is specified in the
        # ListTimeSeries request (that call is useful to verify the time series that
        # will be retrieved / processed) and must specify the metric type and optionally
        # may contain restrictions on resource type, resource labels, and metric labels.
        # This field may not exceed 2048 Unicode characters in length.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Specifies how many time series must fail a predicate to trigger a condition.
        # If not specified, then a `count: 1` trigger is used.
        # Corresponds to the JSON property `trigger`
        # @return [Google::Apis::MonitoringV3::Trigger]
        attr_accessor :trigger
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregations = args[:aggregations] if args.key?(:aggregations)
          @duration = args[:duration] if args.key?(:duration)
          @filter = args[:filter] if args.key?(:filter)
          @trigger = args[:trigger] if args.key?(:trigger)
        end
      end
      
      # Defines a metric type and its schema. Once a metric descriptor is created,
      # deleting or altering it stops data collection and makes the metric type's
      # existing data unusable.
      class MetricDescriptor
        include Google::Apis::Core::Hashable
      
        # A detailed description of the metric, which can be used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A concise name for the metric, which can be displayed in user interfaces. Use
        # sentence case without an ending period, for example "Request count". This
        # field is optional but it is recommended to be set for any metrics associated
        # with user-visible concepts, such as Quota.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The set of labels that can be used to describe a specific instance of this
        # metric type. For example, the appengine.googleapis.com/http/server/
        # response_latencies metric type has a label for the HTTP response code,
        # response_code, so you can look at latencies for successful responses or just
        # for responses that failed.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::MonitoringV3::LabelDescriptor>]
        attr_accessor :labels
      
        # Optional. The launch stage of the metric definition.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # Additional annotations that can be used to guide the usage of a metric.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::MonitoringV3::MetricDescriptorMetadata]
        attr_accessor :metadata
      
        # Whether the metric records instantaneous values, changes to a value, etc. Some
        # combinations of metric_kind and value_type might not be supported.
        # Corresponds to the JSON property `metricKind`
        # @return [String]
        attr_accessor :metric_kind
      
        # Read-only. If present, then a time series, which is identified partially by a
        # metric type and a MonitoredResourceDescriptor, that is associated with this
        # metric type can only be associated with one of the monitored resource types
        # listed here.
        # Corresponds to the JSON property `monitoredResourceTypes`
        # @return [Array<String>]
        attr_accessor :monitored_resource_types
      
        # The resource name of the metric descriptor.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The metric type, including its DNS name prefix. The type is not URL-encoded.
        # All user-defined metric types have the DNS name custom.googleapis.com or
        # external.googleapis.com. Metric types should use a natural hierarchical
        # grouping. For example:
        # "custom.googleapis.com/invoice/paid/amount"
        # "external.googleapis.com/prometheus/up"
        # "appengine.googleapis.com/http/server/response_latencies"
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The unit in which the metric value is reported. It is only applicable if the
        # value_type is INT64, DOUBLE, or DISTRIBUTION. The supported units are a subset
        # of The Unified Code for Units of Measure (http://unitsofmeasure.org/ucum.html)
        # standard:Basic units (UNIT)
        # bit bit
        # By byte
        # s second
        # min minute
        # h hour
        # d dayPrefixes (PREFIX)
        # k kilo (10**3)
        # M mega (10**6)
        # G giga (10**9)
        # T tera (10**12)
        # P peta (10**15)
        # E exa (10**18)
        # Z zetta (10**21)
        # Y yotta (10**24)
        # m milli (10**-3)
        # u micro (10**-6)
        # n nano (10**-9)
        # p pico (10**-12)
        # f femto (10**-15)
        # a atto (10**-18)
        # z zepto (10**-21)
        # y yocto (10**-24)
        # Ki kibi (2**10)
        # Mi mebi (2**20)
        # Gi gibi (2**30)
        # Ti tebi (2**40)GrammarThe grammar also includes these connectors:
        # / division (as an infix operator, e.g. 1/s).
        # . multiplication (as an infix operator, e.g. GBy.d)The grammar for a unit is
        # as follows:
        # Expression = Component ` "." Component ` ` "/" Component ` ;
        # Component = ( [ PREFIX ] UNIT | "%" ) [ Annotation ]
        # | Annotation
        # | "1"
        # ;
        # Annotation = "`" NAME "`" ;
        # Notes:
        # Annotation is just a comment if it follows a UNIT and is  equivalent to 1 if
        # it is used alone. For examples,  `requests`/s == 1/s, By`transmitted`/s == By/
        # s.
        # NAME is a sequence of non-blank printable ASCII characters not  containing '`'
        # or '`'.
        # 1 represents dimensionless value 1, such as in 1/s.
        # % represents dimensionless value 1/100, and annotates values giving  a
        # percentage.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # Whether the measurement is an integer, a floating-point number, etc. Some
        # combinations of metric_kind and value_type might not be supported.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @metadata = args[:metadata] if args.key?(:metadata)
          @metric_kind = args[:metric_kind] if args.key?(:metric_kind)
          @monitored_resource_types = args[:monitored_resource_types] if args.key?(:monitored_resource_types)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
          @unit = args[:unit] if args.key?(:unit)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # Additional annotations that can be used to guide the usage of a metric.
      class MetricDescriptorMetadata
        include Google::Apis::Core::Hashable
      
        # The delay of data points caused by ingestion. Data points older than this age
        # are guaranteed to be ingested and available to be read, excluding data loss
        # due to errors.
        # Corresponds to the JSON property `ingestDelay`
        # @return [String]
        attr_accessor :ingest_delay
      
        # Deprecated. Must use the MetricDescriptor.launch_stage instead.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # The sampling period of metric data points. For metrics which are written
        # periodically, consecutive data points are stored at this time interval,
        # excluding data loss due to errors. Metrics with a higher granularity have a
        # smaller sampling period.
        # Corresponds to the JSON property `samplePeriod`
        # @return [String]
        attr_accessor :sample_period
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ingest_delay = args[:ingest_delay] if args.key?(:ingest_delay)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @sample_period = args[:sample_period] if args.key?(:sample_period)
        end
      end
      
      # A condition type that compares a collection of time series against a threshold.
      class MetricThreshold
        include Google::Apis::Core::Hashable
      
        # Specifies the alignment of data points in individual time series as well as
        # how to combine the retrieved time series together (such as when aggregating
        # multiple streams on each resource to a single stream for each resource or when
        # aggregating streams across all members of a group of resrouces). Multiple
        # aggregations are applied in the order specified.This field is similar to the
        # one in the ListTimeSeries request. It is advisable to use the ListTimeSeries
        # method when debugging this field.
        # Corresponds to the JSON property `aggregations`
        # @return [Array<Google::Apis::MonitoringV3::Aggregation>]
        attr_accessor :aggregations
      
        # The comparison to apply between the time series (indicated by filter and
        # aggregation) and the threshold (indicated by threshold_value). The comparison
        # is applied on each time series, with the time series on the left-hand side and
        # the threshold on the right-hand side.Only COMPARISON_LT and COMPARISON_GT are
        # supported currently.
        # Corresponds to the JSON property `comparison`
        # @return [String]
        attr_accessor :comparison
      
        # Specifies the alignment of data points in individual time series selected by
        # denominatorFilter as well as how to combine the retrieved time series together
        # (such as when aggregating multiple streams on each resource to a single stream
        # for each resource or when aggregating streams across all members of a group of
        # resources).When computing ratios, the aggregations and
        # denominator_aggregations fields must use the same alignment period and produce
        # time series that have the same periodicity and labels.
        # Corresponds to the JSON property `denominatorAggregations`
        # @return [Array<Google::Apis::MonitoringV3::Aggregation>]
        attr_accessor :denominator_aggregations
      
        # A filter that identifies a time series that should be used as the denominator
        # of a ratio that will be compared with the threshold. If a denominator_filter
        # is specified, the time series specified by the filter field will be used as
        # the numerator.The filter must specify the metric type and optionally may
        # contain restrictions on resource type, resource labels, and metric labels.
        # This field may not exceed 2048 Unicode characters in length.
        # Corresponds to the JSON property `denominatorFilter`
        # @return [String]
        attr_accessor :denominator_filter
      
        # The amount of time that a time series must violate the threshold to be
        # considered failing. Currently, only values that are a multiple of a minute--e.
        # g., 0, 60, 120, or 300 seconds--are supported. If an invalid value is given,
        # an error will be returned. When choosing a duration, it is useful to keep in
        # mind the frequency of the underlying time series data (which may also be
        # affected by any alignments specified in the aggregations field); a good
        # duration is long enough so that a single outlier does not generate spurious
        # alerts, but short enough that unhealthy states are detected and alerted on
        # quickly.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # A filter that identifies which time series should be compared with the
        # threshold.The filter is similar to the one that is specified in the
        # ListTimeSeries request (that call is useful to verify the time series that
        # will be retrieved / processed) and must specify the metric type and optionally
        # may contain restrictions on resource type, resource labels, and metric labels.
        # This field may not exceed 2048 Unicode characters in length.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # A value against which to compare the time series.
        # Corresponds to the JSON property `thresholdValue`
        # @return [Float]
        attr_accessor :threshold_value
      
        # Specifies how many time series must fail a predicate to trigger a condition.
        # If not specified, then a `count: 1` trigger is used.
        # Corresponds to the JSON property `trigger`
        # @return [Google::Apis::MonitoringV3::Trigger]
        attr_accessor :trigger
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregations = args[:aggregations] if args.key?(:aggregations)
          @comparison = args[:comparison] if args.key?(:comparison)
          @denominator_aggregations = args[:denominator_aggregations] if args.key?(:denominator_aggregations)
          @denominator_filter = args[:denominator_filter] if args.key?(:denominator_filter)
          @duration = args[:duration] if args.key?(:duration)
          @filter = args[:filter] if args.key?(:filter)
          @threshold_value = args[:threshold_value] if args.key?(:threshold_value)
          @trigger = args[:trigger] if args.key?(:trigger)
        end
      end
      
      # An object representing a resource that can be used for monitoring, logging,
      # billing, or other purposes. Examples include virtual machine instances,
      # databases, and storage devices such as disks. The type field identifies a
      # MonitoredResourceDescriptor object that describes the resource's schema.
      # Information in the labels field identifies the actual resource and its
      # attributes according to the schema. For example, a particular Compute Engine
      # VM instance could be represented by the following object, because the
      # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
      # zone":
      # ` "type": "gce_instance",
      # "labels": ` "instance_id": "12345678901234",
      # "zone": "us-central1-a" ``
      class MonitoredResource
        include Google::Apis::Core::Hashable
      
        # Required. Values for all of the labels listed in the associated monitored
        # resource descriptor. For example, Compute Engine VM instances use the labels "
        # project_id", "instance_id", and "zone".
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The monitored resource type. This field must match the type field of
        # a MonitoredResourceDescriptor object. For example, the type of a Compute
        # Engine VM instance is gce_instance. For a list of types, see Monitoring
        # resource types and Logging resource types.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An object that describes the schema of a MonitoredResource object using a type
      # name and a set of labels. For example, the monitored resource descriptor for
      # Google Compute Engine VM instances has a type of "gce_instance" and specifies
      # the use of the labels "instance_id" and "zone" to identify particular VM
      # instances.Different APIs can support different monitored resource types. APIs
      # generally provide a list method that returns the monitored resource
      # descriptors used by the API.
      class MonitoredResourceDescriptor
        include Google::Apis::Core::Hashable
      
        # Optional. A detailed description of the monitored resource type that might be
        # used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. A concise name for the monitored resource type that might be
        # displayed in user interfaces. It should be a Title Cased Noun Phrase, without
        # any article or other determiners. For example, "Google Cloud SQL Database".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Required. A set of labels used to describe instances of this monitored
        # resource type. For example, an individual Google Cloud SQL database is
        # identified by values for the labels "database_id" and "zone".
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::MonitoringV3::LabelDescriptor>]
        attr_accessor :labels
      
        # Optional. The launch stage of the monitored resource definition.
        # Corresponds to the JSON property `launchStage`
        # @return [String]
        attr_accessor :launch_stage
      
        # Optional. The resource name of the monitored resource descriptor: "projects/`
        # project_id`/monitoredResourceDescriptors/`type`" where `type` is the value of
        # the type field in this object and `project_id` is a project ID that provides
        # API-specific context for accessing the type. APIs that do not use project
        # information can use the resource name format "monitoredResourceDescriptors/`
        # type`".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The monitored resource type. For example, the type "
        # cloudsql_database" represents databases in Google Cloud SQL. The maximum
        # length of this value is 256 characters.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @launch_stage = args[:launch_stage] if args.key?(:launch_stage)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
      # contain the minimum set of information to uniquely identify a monitored
      # resource instance. There is some other useful auxiliary metadata. Monitoring
      # and Logging use an ingestion pipeline to extract metadata for cloud resources
      # of all types, and store the metadata in this message.
      class MonitoredResourceMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. Values for predefined system metadata labels. System labels are a
        # kind of metadata extracted by Google, including "machine_image", "vpc", "
        # subnet_id", "security_group", "name", etc. System label values can be only
        # strings, Boolean values, or a list of strings. For example:
        # ` "name": "my-test-instance",
        # "security_group": ["a", "b", "c"],
        # "spot_instance": false `
        # Corresponds to the JSON property `systemLabels`
        # @return [Hash<String,Object>]
        attr_accessor :system_labels
      
        # Output only. A map of user-defined metadata labels.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @system_labels = args[:system_labels] if args.key?(:system_labels)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Describes a change made to a configuration.
      class MutationRecord
        include Google::Apis::Core::Hashable
      
        # When the change occurred.
        # Corresponds to the JSON property `mutateTime`
        # @return [String]
        attr_accessor :mutate_time
      
        # The email address of the user making the change.
        # Corresponds to the JSON property `mutatedBy`
        # @return [String]
        attr_accessor :mutated_by
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mutate_time = args[:mutate_time] if args.key?(:mutate_time)
          @mutated_by = args[:mutated_by] if args.key?(:mutated_by)
        end
      end
      
      # A NotificationChannel is a medium through which an alert is delivered when a
      # policy violation is detected. Examples of channels include email, SMS, and
      # third-party messaging applications. Fields containing sensitive information
      # like authentication tokens or contact info are only partially populated on
      # retrieval.
      class NotificationChannel
        include Google::Apis::Core::Hashable
      
        # An optional human-readable description of this notification channel. This
        # description may provide additional details, beyond the display name, for the
        # channel. This may not exceed 1024 Unicode characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # An optional human-readable name for this notification channel. It is
        # recommended that you specify a non-empty and unique name in order to make it
        # easier to identify the channels in your project, though this is not enforced.
        # The display name is limited to 512 Unicode characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Whether notifications are forwarded to the described channel. This makes it
        # possible to disable delivery of notifications to a particular channel without
        # removing the channel from all alerting policies that reference the channel.
        # This is a more convenient approach when the change is temporary and you want
        # to receive notifications from the same set of alerting policies on the channel
        # at some point in the future.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Configuration fields that define the channel and its behavior. The permissible
        # and required labels are specified in the NotificationChannelDescriptor.labels
        # of the NotificationChannelDescriptor corresponding to the type field.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The full REST resource name for this channel. The syntax is:
        # projects/[PROJECT_ID]/notificationChannels/[CHANNEL_ID]
        # The [CHANNEL_ID] is automatically assigned by the server on creation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The type of the notification channel. This field matches the value of the
        # NotificationChannelDescriptor.type field.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # User-supplied key/value data that does not need to conform to the
        # corresponding NotificationChannelDescriptor's schema, unlike the labels field.
        # This field is intended to be used for organizing and identifying the
        # NotificationChannel objects.The field can contain up to 64 entries. Each key
        # and value is limited to 63 Unicode characters or 128 bytes, whichever is
        # smaller. Labels and values can contain only lowercase letters, numerals,
        # underscores, and dashes. Keys must begin with a letter.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # Indicates whether this channel has been verified or not. On a
        # ListNotificationChannels or GetNotificationChannel operation, this field is
        # expected to be populated.If the value is UNVERIFIED, then it indicates that
        # the channel is non-functioning (it both requires verification and lacks
        # verification); otherwise, it is assumed that the channel works.If the channel
        # is neither VERIFIED nor UNVERIFIED, it implies that the channel is of a type
        # that does not require verification or that this specific channel has been
        # exempted from verification because it was created prior to verification being
        # required for channels of this type.This field cannot be modified using a
        # standard UpdateNotificationChannel operation. To change the value of this
        # field, you must call VerifyNotificationChannel.
        # Corresponds to the JSON property `verificationStatus`
        # @return [String]
        attr_accessor :verification_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enabled = args[:enabled] if args.key?(:enabled)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @verification_status = args[:verification_status] if args.key?(:verification_status)
        end
      end
      
      # A description of a notification channel. The descriptor includes the
      # properties of the channel and the set of labels or fields that must be
      # specified to configure channels of a given type.
      class NotificationChannelDescriptor
        include Google::Apis::Core::Hashable
      
        # A human-readable description of the notification channel type. The description
        # may include a description of the properties of the channel and pointers to
        # external documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A human-readable name for the notification channel type. This form of the name
        # is suitable for a user interface.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The set of labels that must be defined to identify a particular channel of the
        # corresponding type. Each label includes a description for how that field
        # should be populated.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::MonitoringV3::LabelDescriptor>]
        attr_accessor :labels
      
        # The full REST resource name for this descriptor. The syntax is:
        # projects/[PROJECT_ID]/notificationChannelDescriptors/[TYPE]
        # In the above, [TYPE] is the value of the type field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The tiers that support this notification channel; the project service tier
        # must be one of the supported_tiers.
        # Corresponds to the JSON property `supportedTiers`
        # @return [Array<String>]
        attr_accessor :supported_tiers
      
        # The type of notification channel, such as "email", "sms", etc. Notification
        # channel types are globally unique.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @supported_tiers = args[:supported_tiers] if args.key?(:supported_tiers)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A protocol buffer option, which can be attached to a message, field,
      # enumeration, etc.
      class Option
        include Google::Apis::Core::Hashable
      
        # The option's name. For protobuf built-in options (options defined in
        # descriptor.proto), this is the short name. For example, "map_entry". For
        # custom options, it should be the fully-qualified name. For example, "google.
        # api.http".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The option's value packed in an Any message. If the value is a primitive, the
        # corresponding wrapper type defined in google/protobuf/wrappers.proto should be
        # used. If the value is an enum, it should be stored as an int32 value using the
        # google.protobuf.Int32Value type.
        # Corresponds to the JSON property `value`
        # @return [Hash<String,Object>]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A single data point in a time series.
      class Point
        include Google::Apis::Core::Hashable
      
        # A closed time interval. It extends from the start time to the end time, and
        # includes both: [startTime, endTime]. Valid time intervals depend on the
        # MetricKind of the metric value. In no case can the end time be earlier than
        # the start time.
        # For a GAUGE metric, the startTime value is technically optional; if  no value
        # is specified, the start time defaults to the value of the  end time, and the
        # interval represents a single point in time. If both  start and end times are
        # specified, they must be identical. Such an  interval is valid only for GAUGE
        # metrics, which are point-in-time  measurements.
        # For DELTA and CUMULATIVE metrics, the start time must be earlier  than the end
        # time.
        # In all cases, the start time of the next interval must be  at least a
        # microsecond after the end time of the previous interval.  Because the interval
        # is closed, if the start time of a new interval  is the same as the end time of
        # the previous interval, data written  at the new start time could overwrite
        # data written at the previous  end time.
        # Corresponds to the JSON property `interval`
        # @return [Google::Apis::MonitoringV3::TimeInterval]
        attr_accessor :interval
      
        # A single strongly-typed value.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::MonitoringV3::TypedValue]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @interval = args[:interval] if args.key?(:interval)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The range of the population values.
      class Range
        include Google::Apis::Core::Hashable
      
        # The maximum of the population values.
        # Corresponds to the JSON property `max`
        # @return [Float]
        attr_accessor :max
      
        # The minimum of the population values.
        # Corresponds to the JSON property `min`
        # @return [Float]
        attr_accessor :min
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
        end
      end
      
      # The resource submessage for group checks. It can be used instead of a
      # monitored resource, when multiple resources are being monitored.
      class ResourceGroup
        include Google::Apis::Core::Hashable
      
        # The group of resources being monitored. Should be only the [GROUP_ID], and not
        # the full-path projects/[PROJECT_ID]/groups/[GROUP_ID].
        # Corresponds to the JSON property `groupId`
        # @return [String]
        attr_accessor :group_id
      
        # The resource type of the group members.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group_id = args[:group_id] if args.key?(:group_id)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
        end
      end
      
      # The SendNotificationChannelVerificationCode request.
      class SendNotificationChannelVerificationCodeRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # SourceContext represents information about the source of a protobuf element,
      # like the file in which it is defined.
      class SourceContext
        include Google::Apis::Core::Hashable
      
        # The path-qualified name of the .proto file that contained the associated
        # protobuf element. For example: "google/protobuf/source_context.proto".
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_name = args[:file_name] if args.key?(:file_name)
        end
      end
      
      # The context of a span, attached to google.api.Distribution.Exemplars in google.
      # api.Distribution values during aggregation.It contains the name of a span with
      # format:  projects/PROJECT_ID/traces/TRACE_ID/spans/SPAN_ID
      class SpanContext
        include Google::Apis::Core::Hashable
      
        # The resource name of the span in the following format:
        # projects/[PROJECT_ID]/traces/[TRACE_ID]/spans/[SPAN_ID]
        # TRACE_ID is a unique identifier for a trace within a project; it is a 32-
        # character hexadecimal encoding of a 16-byte array.SPAN_ID is a unique
        # identifier for a span within a trace; it is a 16-character hexadecimal
        # encoding of an 8-byte array.
        # Corresponds to the JSON property `spanName`
        # @return [String]
        attr_accessor :span_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @span_name = args[:span_name] if args.key?(:span_name)
        end
      end
      
      # The Status type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by gRPC
      # (https://github.com/grpc). Each Status message contains three pieces of data:
      # error code, error message, and error details.You can find out more about this
      # error model and how to work with it in the API Design Guide (https://cloud.
      # google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
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
      
      # Information required for a TCP Uptime check request.
      class TcpCheck
        include Google::Apis::Core::Hashable
      
        # The TCP port on the server against which to run the check. Will be combined
        # with host (specified within the monitored_resource) to construct the full URL.
        # Required.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @port = args[:port] if args.key?(:port)
        end
      end
      
      # A closed time interval. It extends from the start time to the end time, and
      # includes both: [startTime, endTime]. Valid time intervals depend on the
      # MetricKind of the metric value. In no case can the end time be earlier than
      # the start time.
      # For a GAUGE metric, the startTime value is technically optional; if  no value
      # is specified, the start time defaults to the value of the  end time, and the
      # interval represents a single point in time. If both  start and end times are
      # specified, they must be identical. Such an  interval is valid only for GAUGE
      # metrics, which are point-in-time  measurements.
      # For DELTA and CUMULATIVE metrics, the start time must be earlier  than the end
      # time.
      # In all cases, the start time of the next interval must be  at least a
      # microsecond after the end time of the previous interval.  Because the interval
      # is closed, if the start time of a new interval  is the same as the end time of
      # the previous interval, data written  at the new start time could overwrite
      # data written at the previous  end time.
      class TimeInterval
        include Google::Apis::Core::Hashable
      
        # Required. The end of the time interval.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. The beginning of the time interval. The default value for the start
        # time is the end time. The start time must not be later than the end time.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A collection of data points that describes the time-varying values of a metric.
      # A time series is identified by a combination of a fully-specified monitored
      # resource and a fully-specified metric. This type is used for both listing and
      # creating time series.
      class TimeSeries
        include Google::Apis::Core::Hashable
      
        # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
        # contain the minimum set of information to uniquely identify a monitored
        # resource instance. There is some other useful auxiliary metadata. Monitoring
        # and Logging use an ingestion pipeline to extract metadata for cloud resources
        # of all types, and store the metadata in this message.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::MonitoringV3::MonitoredResourceMetadata]
        attr_accessor :metadata
      
        # A specific metric, identified by specifying values for all of the labels of a
        # MetricDescriptor.
        # Corresponds to the JSON property `metric`
        # @return [Google::Apis::MonitoringV3::Metric]
        attr_accessor :metric
      
        # The metric kind of the time series. When listing time series, this metric kind
        # might be different from the metric kind of the associated metric if this time
        # series is an alignment or reduction of other time series.When creating a time
        # series, this field is optional. If present, it must be the same as the metric
        # kind of the associated metric. If the associated metric's descriptor must be
        # auto-created, then this field specifies the metric kind of the new descriptor
        # and must be either GAUGE (the default) or CUMULATIVE.
        # Corresponds to the JSON property `metricKind`
        # @return [String]
        attr_accessor :metric_kind
      
        # The data points of this time series. When listing time series, points are
        # returned in reverse time order.When creating a time series, this field must
        # contain exactly one point and the point's type must be the same as the value
        # type of the associated metric. If the associated metric's descriptor must be
        # auto-created, then the value type of the descriptor is determined by the point'
        # s type, which must be BOOL, INT64, DOUBLE, or DISTRIBUTION.
        # Corresponds to the JSON property `points`
        # @return [Array<Google::Apis::MonitoringV3::Point>]
        attr_accessor :points
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The type field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the labels field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
        # zone":
        # ` "type": "gce_instance",
        # "labels": ` "instance_id": "12345678901234",
        # "zone": "us-central1-a" ``
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::MonitoringV3::MonitoredResource]
        attr_accessor :resource
      
        # The value type of the time series. When listing time series, this value type
        # might be different from the value type of the associated metric if this time
        # series is an alignment or reduction of other time series.When creating a time
        # series, this field is optional. If present, it must be the same as the type of
        # the data in the points field.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @metric = args[:metric] if args.key?(:metric)
          @metric_kind = args[:metric_kind] if args.key?(:metric_kind)
          @points = args[:points] if args.key?(:points)
          @resource = args[:resource] if args.key?(:resource)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # Specifies how many time series must fail a predicate to trigger a condition.
      # If not specified, then a `count: 1` trigger is used.
      class Trigger
        include Google::Apis::Core::Hashable
      
        # The absolute number of time series that must fail the predicate for the
        # condition to be triggered.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The percentage of time series that must fail the predicate for the condition
        # to be triggered.
        # Corresponds to the JSON property `percent`
        # @return [Float]
        attr_accessor :percent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @percent = args[:percent] if args.key?(:percent)
        end
      end
      
      # A protocol buffer message type.
      class Type
        include Google::Apis::Core::Hashable
      
        # The list of fields.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::MonitoringV3::Field>]
        attr_accessor :fields
      
        # The fully qualified message name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The list of types appearing in oneof definitions in this type.
        # Corresponds to the JSON property `oneofs`
        # @return [Array<String>]
        attr_accessor :oneofs
      
        # The protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::MonitoringV3::Option>]
        attr_accessor :options
      
        # SourceContext represents information about the source of a protobuf element,
        # like the file in which it is defined.
        # Corresponds to the JSON property `sourceContext`
        # @return [Google::Apis::MonitoringV3::SourceContext]
        attr_accessor :source_context
      
        # The source syntax.
        # Corresponds to the JSON property `syntax`
        # @return [String]
        attr_accessor :syntax
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @oneofs = args[:oneofs] if args.key?(:oneofs)
          @options = args[:options] if args.key?(:options)
          @source_context = args[:source_context] if args.key?(:source_context)
          @syntax = args[:syntax] if args.key?(:syntax)
        end
      end
      
      # A single strongly-typed value.
      class TypedValue
        include Google::Apis::Core::Hashable
      
        # A Boolean value: true or false.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # Distribution contains summary statistics for a population of values. It
        # optionally contains a histogram representing the distribution of those values
        # across a set of buckets.The summary statistics are the count, mean, sum of the
        # squared deviation from the mean, the minimum, and the maximum of the set of
        # population of values. The histogram is based on a sequence of buckets and
        # gives a count of values that fall into each bucket. The boundaries of the
        # buckets are given either explicitly or by formulas for buckets of fixed or
        # exponentially increasing widths.Although it is not forbidden, it is generally
        # a bad idea to include non-finite values (infinities or NaNs) in the population
        # of values, as this will render the mean and sum_of_squared_deviation fields
        # meaningless.
        # Corresponds to the JSON property `distributionValue`
        # @return [Google::Apis::MonitoringV3::Distribution]
        attr_accessor :distribution_value
      
        # A 64-bit double-precision floating-point number. Its magnitude is
        # approximately &plusmn;10<sup>&plusmn;300</sup> and it has 16 significant
        # digits of precision.
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # A 64-bit integer. Its range is approximately &plusmn;9.2x10<sup>18</sup>.
        # Corresponds to the JSON property `int64Value`
        # @return [Fixnum]
        attr_accessor :int64_value
      
        # A variable-length string value.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @distribution_value = args[:distribution_value] if args.key?(:distribution_value)
          @double_value = args[:double_value] if args.key?(:double_value)
          @int64_value = args[:int64_value] if args.key?(:int64_value)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # This message configures which resources and services to monitor for
      # availability.
      class UptimeCheckConfig
        include Google::Apis::Core::Hashable
      
        # The content that is expected to appear in the data returned by the target
        # server against which the check is run. Currently, only the first entry in the
        # content_matchers list is supported, and additional entries will be ignored.
        # This field is optional and should only be specified if a content match is
        # required as part of the/ Uptime check.
        # Corresponds to the JSON property `contentMatchers`
        # @return [Array<Google::Apis::MonitoringV3::ContentMatcher>]
        attr_accessor :content_matchers
      
        # A human-friendly name for the Uptime check configuration. The display name
        # should be unique within a Stackdriver Workspace in order to make it easier to
        # identify; however, uniqueness is not enforced. Required.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Information involved in an HTTP/HTTPS Uptime check request.
        # Corresponds to the JSON property `httpCheck`
        # @return [Google::Apis::MonitoringV3::HttpCheck]
        attr_accessor :http_check
      
        # The internal checkers that this check will egress from. If is_internal is true
        # and this list is empty, the check will egress from all the InternalCheckers
        # configured for the project that owns this UptimeCheckConfig.
        # Corresponds to the JSON property `internalCheckers`
        # @return [Array<Google::Apis::MonitoringV3::InternalChecker>]
        attr_accessor :internal_checkers
      
        # If this is true, then checks are made only from the 'internal_checkers'. If it
        # is false, then checks are made only from the 'selected_regions'. It is an
        # error to provide 'selected_regions' when is_internal is true, or to provide '
        # internal_checkers' when is_internal is false.
        # Corresponds to the JSON property `isInternal`
        # @return [Boolean]
        attr_accessor :is_internal
        alias_method :is_internal?, :is_internal
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The type field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the labels field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for "gce_instance" has labels "instance_id" and "
        # zone":
        # ` "type": "gce_instance",
        # "labels": ` "instance_id": "12345678901234",
        # "zone": "us-central1-a" ``
        # Corresponds to the JSON property `monitoredResource`
        # @return [Google::Apis::MonitoringV3::MonitoredResource]
        attr_accessor :monitored_resource
      
        # A unique resource name for this Uptime check configuration. The format is:
        # projects/[PROJECT_ID]/uptimeCheckConfigs/[UPTIME_CHECK_ID].This field should
        # be omitted when creating the Uptime check configuration; on create, the
        # resource name is assigned by the server and included in the response.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # How often, in seconds, the Uptime check is performed. Currently, the only
        # supported values are 60s (1 minute), 300s (5 minutes), 600s (10 minutes), and
        # 900s (15 minutes). Optional, defaults to 60s.
        # Corresponds to the JSON property `period`
        # @return [String]
        attr_accessor :period
      
        # The resource submessage for group checks. It can be used instead of a
        # monitored resource, when multiple resources are being monitored.
        # Corresponds to the JSON property `resourceGroup`
        # @return [Google::Apis::MonitoringV3::ResourceGroup]
        attr_accessor :resource_group
      
        # The list of regions from which the check will be run. Some regions contain one
        # location, and others contain more than one. If this field is specified, enough
        # regions must be provided to include a minimum of 3 locations. Not specifying
        # this field will result in Uptime checks running from all available regions.
        # Corresponds to the JSON property `selectedRegions`
        # @return [Array<String>]
        attr_accessor :selected_regions
      
        # Information required for a TCP Uptime check request.
        # Corresponds to the JSON property `tcpCheck`
        # @return [Google::Apis::MonitoringV3::TcpCheck]
        attr_accessor :tcp_check
      
        # The maximum amount of time to wait for the request to complete (must be
        # between 1 and 60 seconds). Required.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_matchers = args[:content_matchers] if args.key?(:content_matchers)
          @display_name = args[:display_name] if args.key?(:display_name)
          @http_check = args[:http_check] if args.key?(:http_check)
          @internal_checkers = args[:internal_checkers] if args.key?(:internal_checkers)
          @is_internal = args[:is_internal] if args.key?(:is_internal)
          @monitored_resource = args[:monitored_resource] if args.key?(:monitored_resource)
          @name = args[:name] if args.key?(:name)
          @period = args[:period] if args.key?(:period)
          @resource_group = args[:resource_group] if args.key?(:resource_group)
          @selected_regions = args[:selected_regions] if args.key?(:selected_regions)
          @tcp_check = args[:tcp_check] if args.key?(:tcp_check)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
      # Contains the region, location, and list of IP addresses where checkers in the
      # location run from.
      class UptimeCheckIp
        include Google::Apis::Core::Hashable
      
        # The IP address from which the Uptime check originates. This is a fully
        # specified IP address (not an IP address range). Most IP addresses, as of this
        # publication, are in IPv4 format; however, one should not rely on the IP
        # addresses being in IPv4 format indefinitely, and should support interpreting
        # this field in either IPv4 or IPv6 format.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # A more specific location within the region that typically encodes a particular
        # city/town/metro (and its containing state/province or country) within the
        # broader umbrella region category.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # A broad region category in which the IP address is located.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @location = args[:location] if args.key?(:location)
          @region = args[:region] if args.key?(:region)
        end
      end
      
      # The VerifyNotificationChannel request.
      class VerifyNotificationChannelRequest
        include Google::Apis::Core::Hashable
      
        # The verification code that was delivered to the channel as a result of
        # invoking the SendNotificationChannelVerificationCode API method or that was
        # retrieved from a verified channel via GetNotificationChannelVerificationCode.
        # For example, one might have "G-123456" or "TKNZGhhd2EyN3I1MnRnMjRv" (in
        # general, one is only guaranteed that the code is valid UTF-8; one should not
        # make any assumptions regarding the structure or format of the code).
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
        end
      end
    end
  end
end
