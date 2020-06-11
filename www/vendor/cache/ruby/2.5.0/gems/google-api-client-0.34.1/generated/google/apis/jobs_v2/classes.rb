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
    module JobsV2
      
      # Input only.
      # Batch delete jobs request.
      class BatchDeleteJobsRequest
        include Google::Apis::Core::Hashable
      
        # Required. The filter string specifies the jobs to be deleted.
        # Supported operator: =, AND
        # The fields eligible for filtering are:
        # * `companyName` (Required)
        # * `requisitionId` (Required)
        # Sample Query: companyName = "companies/123" AND requisitionId = "req-1"
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Represents starting and ending value of a range in double.
      class BucketRange
        include Google::Apis::Core::Hashable
      
        # Starting value of the bucket range.
        # Corresponds to the JSON property `from`
        # @return [Float]
        attr_accessor :from
      
        # Ending value of the bucket range.
        # Corresponds to the JSON property `to`
        # @return [Float]
        attr_accessor :to
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @from = args[:from] if args.key?(:from)
          @to = args[:to] if args.key?(:to)
        end
      end
      
      # Represents count of jobs within one bucket.
      class BucketizedCount
        include Google::Apis::Core::Hashable
      
        # Number of jobs whose numeric field value fall into `range`.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Represents starting and ending value of a range in double.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::JobsV2::BucketRange]
        attr_accessor :range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @range = args[:range] if args.key?(:range)
        end
      end
      
      # Output only.
      # Commute details related to this job.
      class CommuteInfo
        include Google::Apis::Core::Hashable
      
        # Output only.
        # A resource that represents a location with full geographic
        # information.
        # Corresponds to the JSON property `jobLocation`
        # @return [Google::Apis::JobsV2::JobLocation]
        attr_accessor :job_location
      
        # The number of seconds required to travel to the job location from the query
        # location. A duration of 0 seconds indicates that the job is not
        # reachable within the requested duration, but was returned as part of an
        # expanded query.
        # Corresponds to the JSON property `travelDuration`
        # @return [String]
        attr_accessor :travel_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job_location = args[:job_location] if args.key?(:job_location)
          @travel_duration = args[:travel_duration] if args.key?(:travel_duration)
        end
      end
      
      # Input only.
      # Parameters needed for commute search.
      class CommutePreference
        include Google::Apis::Core::Hashable
      
        # Optional. If `true`, jobs without street level addresses may also be returned.
        # For city level addresses, the city center is used. For state and coarser
        # level addresses, text matching is used.
        # If this field is set to `false` or is not specified, only jobs that include
        # street level addresses will be returned by commute search.
        # Corresponds to the JSON property `allowNonStreetLevelAddress`
        # @return [Boolean]
        attr_accessor :allow_non_street_level_address
        alias_method :allow_non_street_level_address?, :allow_non_street_level_address
      
        # Optional. The departure hour to use to calculate traffic impact. Accepts an
        # integer between 0 and 23, representing the hour in the time zone of the
        # start_location. Must not be present if road_traffic is specified.
        # Corresponds to the JSON property `departureHourLocal`
        # @return [Fixnum]
        attr_accessor :departure_hour_local
      
        # Required. The method of transportation for which to calculate the commute time.
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Optional. Specifies the traffic density to use when calculating commute time.
        # Must not be present if departure_hour_local is specified.
        # Corresponds to the JSON property `roadTraffic`
        # @return [String]
        attr_accessor :road_traffic
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `startLocation`
        # @return [Google::Apis::JobsV2::LatLng]
        attr_accessor :start_location
      
        # Required. The maximum travel time in seconds. The maximum allowed value is `
        # 3600s`
        # (one hour). Format is `123s`.
        # Corresponds to the JSON property `travelTime`
        # @return [String]
        attr_accessor :travel_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_non_street_level_address = args[:allow_non_street_level_address] if args.key?(:allow_non_street_level_address)
          @departure_hour_local = args[:departure_hour_local] if args.key?(:departure_hour_local)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @road_traffic = args[:road_traffic] if args.key?(:road_traffic)
          @start_location = args[:start_location] if args.key?(:start_location)
          @travel_time = args[:travel_time] if args.key?(:travel_time)
        end
      end
      
      # A Company resource represents a company in the service. A company is the
      # entity that owns job listings, that is, the hiring entity responsible for
      # employing applicants for the job position.
      class Company
        include Google::Apis::Core::Hashable
      
        # Optional. The URL to employer's career site or careers page on the employer's
        # web
        # site.
        # Corresponds to the JSON property `careerPageLink`
        # @return [String]
        attr_accessor :career_page_link
      
        # Optional. Identifiers external to the application that help to further
        # identify
        # the employer.
        # Corresponds to the JSON property `companyInfoSources`
        # @return [Array<Google::Apis::JobsV2::CompanyInfoSource>]
        attr_accessor :company_info_sources
      
        # Optional. The employer's company size.
        # Corresponds to the JSON property `companySize`
        # @return [String]
        attr_accessor :company_size
      
        # Deprecated. Do not use this field.
        # Optional.
        # This field is no longer used. Any value set to it is ignored.
        # Corresponds to the JSON property `disableLocationOptimization`
        # @return [Boolean]
        attr_accessor :disable_location_optimization
        alias_method :disable_location_optimization?, :disable_location_optimization
      
        # Required. The name of the employer to be displayed with the job,
        # for example, "Google, LLC.".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. The unique company identifier provided by the client to identify an
        # employer for billing purposes. Recommended practice is to use
        # the distributor_company_id.
        # Defaults to same value as distributor_company_id when a value
        # is not provided.
        # Corresponds to the JSON property `distributorBillingCompanyId`
        # @return [String]
        attr_accessor :distributor_billing_company_id
      
        # Required. A client's company identifier, used to uniquely identify the
        # company. If an employer has a subsidiary or sub-brand, such as "Alphabet"
        # and "Google", which the client wishes to use as the company displayed on
        # the job. Best practice is to create a distinct company identifier for each
        # distinct brand displayed.
        # The maximum number of allowed characters is 255.
        # Corresponds to the JSON property `distributorCompanyId`
        # @return [String]
        attr_accessor :distributor_company_id
      
        # Optional. Equal Employment Opportunity legal disclaimer text to be
        # associated with all jobs, and typically to be displayed in all
        # roles.
        # The maximum number of allowed characters is 500.
        # Corresponds to the JSON property `eeoText`
        # @return [String]
        attr_accessor :eeo_text
      
        # Optional. Set to true if it is the hiring agency that post jobs for other
        # employers.
        # Defaults to false if not provided.
        # Corresponds to the JSON property `hiringAgency`
        # @return [Boolean]
        attr_accessor :hiring_agency
        alias_method :hiring_agency?, :hiring_agency
      
        # Optional. The street address of the company's main headquarters, which may be
        # different from the job location. The service attempts
        # to geolocate the provided address, and populates a more specific
        # location wherever possible in structured_company_hq_location.
        # Corresponds to the JSON property `hqLocation`
        # @return [String]
        attr_accessor :hq_location
      
        # Optional. A URL that hosts the employer's company logo. If provided,
        # the logo image should be squared at 80x80 pixels.
        # The url must be a Google Photos or Google Album url.
        # Only images in these Google sub-domains are accepted.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # Optional. A list of keys of filterable Job.custom_attributes, whose
        # corresponding `string_values` are used in keyword search. Jobs with
        # `string_values` under these specified field keys are returned if any
        # of the values matches the search keyword. Custom field values with
        # parenthesis, brackets and special symbols might not be properly searchable,
        # and those keyword queries need to be surrounded by quotes.
        # Corresponds to the JSON property `keywordSearchableCustomAttributes`
        # @return [Array<String>]
        attr_accessor :keyword_searchable_custom_attributes
      
        # Deprecated. Use keyword_searchable_custom_attributes instead.
        # Optional.
        # A list of filterable custom fields that should be used in keyword
        # search. The jobs of this company are returned if any of these custom
        # fields matches the search keyword. Custom field values with parenthesis,
        # brackets and special symbols might not be properly searchable, and those
        # keyword queries need to be surrounded by quotes.
        # Corresponds to the JSON property `keywordSearchableCustomFields`
        # @return [Array<Fixnum>]
        attr_accessor :keyword_searchable_custom_fields
      
        # Required during company update.
        # The resource name for a company. This is generated by the service when a
        # company is created, for example,
        # "companies/0000aaaa-1111-bbbb-2222-cccc3333dddd".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only.
        # A resource that represents a location with full geographic
        # information.
        # Corresponds to the JSON property `structuredCompanyHqLocation`
        # @return [Google::Apis::JobsV2::JobLocation]
        attr_accessor :structured_company_hq_location
      
        # Output only. Indicates whether a company is flagged to be suspended from
        # public
        # availability by the service when job content appears suspicious,
        # abusive, or spammy.
        # Corresponds to the JSON property `suspended`
        # @return [Boolean]
        attr_accessor :suspended
        alias_method :suspended?, :suspended
      
        # Deprecated. Use display_name instead.
        # Required.
        # The name of the employer to be displayed with the job,
        # for example, "Google, LLC.".
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Optional. The URL representing the company's primary web site or home page,
        # such as, "www.google.com".
        # Corresponds to the JSON property `website`
        # @return [String]
        attr_accessor :website
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @career_page_link = args[:career_page_link] if args.key?(:career_page_link)
          @company_info_sources = args[:company_info_sources] if args.key?(:company_info_sources)
          @company_size = args[:company_size] if args.key?(:company_size)
          @disable_location_optimization = args[:disable_location_optimization] if args.key?(:disable_location_optimization)
          @display_name = args[:display_name] if args.key?(:display_name)
          @distributor_billing_company_id = args[:distributor_billing_company_id] if args.key?(:distributor_billing_company_id)
          @distributor_company_id = args[:distributor_company_id] if args.key?(:distributor_company_id)
          @eeo_text = args[:eeo_text] if args.key?(:eeo_text)
          @hiring_agency = args[:hiring_agency] if args.key?(:hiring_agency)
          @hq_location = args[:hq_location] if args.key?(:hq_location)
          @image_url = args[:image_url] if args.key?(:image_url)
          @keyword_searchable_custom_attributes = args[:keyword_searchable_custom_attributes] if args.key?(:keyword_searchable_custom_attributes)
          @keyword_searchable_custom_fields = args[:keyword_searchable_custom_fields] if args.key?(:keyword_searchable_custom_fields)
          @name = args[:name] if args.key?(:name)
          @structured_company_hq_location = args[:structured_company_hq_location] if args.key?(:structured_company_hq_location)
          @suspended = args[:suspended] if args.key?(:suspended)
          @title = args[:title] if args.key?(:title)
          @website = args[:website] if args.key?(:website)
        end
      end
      
      # A resource that represents an external  Google identifier for a company,
      # for example, a Google+ business page or a Google Maps business page.
      # For unsupported types, use `unknown_type_id`.
      class CompanyInfoSource
        include Google::Apis::Core::Hashable
      
        # Optional. The Google's Knowledge Graph value for the employer's company.
        # Corresponds to the JSON property `freebaseMid`
        # @return [String]
        attr_accessor :freebase_mid
      
        # Optional. The numeric identifier for the employer's Google+ business page.
        # Corresponds to the JSON property `gplusId`
        # @return [String]
        attr_accessor :gplus_id
      
        # Optional. The numeric identifier for the employer's headquarters on Google
        # Maps,
        # namely, the Google Maps CID (cell id).
        # Corresponds to the JSON property `mapsCid`
        # @return [String]
        attr_accessor :maps_cid
      
        # Optional. A Google identifier that does not match any of the other types.
        # Corresponds to the JSON property `unknownTypeId`
        # @return [String]
        attr_accessor :unknown_type_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @freebase_mid = args[:freebase_mid] if args.key?(:freebase_mid)
          @gplus_id = args[:gplus_id] if args.key?(:gplus_id)
          @maps_cid = args[:maps_cid] if args.key?(:maps_cid)
          @unknown_type_id = args[:unknown_type_id] if args.key?(:unknown_type_id)
        end
      end
      
      # A compensation entry that represents one component of compensation, such
      # as base pay, bonus, or other compensation type.
      # Annualization: One compensation entry can be annualized if
      # - it contains valid amount or range.
      # - and its expected_units_per_year is set or can be derived.
      # Its annualized range is determined as (amount or range) times
      # expected_units_per_year.
      class CompensationEntry
        include Google::Apis::Core::Hashable
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `amount`
        # @return [Google::Apis::JobsV2::Money]
        attr_accessor :amount
      
        # Optional. Compensation description.  For example, could
        # indicate equity terms or provide additional context to an estimated
        # bonus.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. Expected number of units paid each year. If not specified, when
        # Job.employment_types is FULLTIME, a default value is inferred
        # based on unit. Default values:
        # - HOURLY: 2080
        # - DAILY: 260
        # - WEEKLY: 52
        # - MONTHLY: 12
        # - ANNUAL: 1
        # Corresponds to the JSON property `expectedUnitsPerYear`
        # @return [Float]
        attr_accessor :expected_units_per_year
      
        # Compensation range.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::JobsV2::CompensationRange]
        attr_accessor :range
      
        # Required. Compensation type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Optional. Frequency of the specified amount.
        # Default is CompensationUnit.COMPENSATION_UNIT_UNSPECIFIED.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount = args[:amount] if args.key?(:amount)
          @description = args[:description] if args.key?(:description)
          @expected_units_per_year = args[:expected_units_per_year] if args.key?(:expected_units_per_year)
          @range = args[:range] if args.key?(:range)
          @type = args[:type] if args.key?(:type)
          @unit = args[:unit] if args.key?(:unit)
        end
      end
      
      # Input only.
      # Filter on job compensation type and amount.
      class CompensationFilter
        include Google::Apis::Core::Hashable
      
        # Optional. Whether to include jobs whose compensation range is unspecified.
        # Corresponds to the JSON property `includeJobsWithUnspecifiedCompensationRange`
        # @return [Boolean]
        attr_accessor :include_jobs_with_unspecified_compensation_range
        alias_method :include_jobs_with_unspecified_compensation_range?, :include_jobs_with_unspecified_compensation_range
      
        # Compensation range.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::JobsV2::CompensationRange]
        attr_accessor :range
      
        # Required. Type of filter.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Required. Specify desired `base compensation entry's`
        # CompensationInfo.CompensationUnit.
        # Corresponds to the JSON property `units`
        # @return [Array<String>]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @include_jobs_with_unspecified_compensation_range = args[:include_jobs_with_unspecified_compensation_range] if args.key?(:include_jobs_with_unspecified_compensation_range)
          @range = args[:range] if args.key?(:range)
          @type = args[:type] if args.key?(:type)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Input only.
      # Compensation based histogram request.
      class CompensationHistogramRequest
        include Google::Apis::Core::Hashable
      
        # Input only.
        # Use this field to specify bucketing option for the histogram search response.
        # Corresponds to the JSON property `bucketingOption`
        # @return [Google::Apis::JobsV2::NumericBucketingOption]
        attr_accessor :bucketing_option
      
        # Required. Type of the request, representing which field the histogramming
        # should be
        # performed over. A single request can only specify one histogram of each
        # `CompensationHistogramRequestType`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucketing_option = args[:bucketing_option] if args.key?(:bucketing_option)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Output only.
      # Compensation based histogram result.
      class CompensationHistogramResult
        include Google::Apis::Core::Hashable
      
        # Output only.
        # Custom numeric bucketing result.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::JobsV2::NumericBucketingResult]
        attr_accessor :result
      
        # Type of the request, corresponding to
        # CompensationHistogramRequest.type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result = args[:result] if args.key?(:result)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Job compensation details.
      class CompensationInfo
        include Google::Apis::Core::Hashable
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `amount`
        # @return [Google::Apis::JobsV2::Money]
        attr_accessor :amount
      
        # Compensation range.
        # Corresponds to the JSON property `annualizedBaseCompensationRange`
        # @return [Google::Apis::JobsV2::CompensationRange]
        attr_accessor :annualized_base_compensation_range
      
        # Compensation range.
        # Corresponds to the JSON property `annualizedTotalCompensationRange`
        # @return [Google::Apis::JobsV2::CompensationRange]
        attr_accessor :annualized_total_compensation_range
      
        # Optional. Job compensation information.
        # At most one entry can be of type
        # CompensationInfo.CompensationType.BASE, which is
        # referred as ** base compensation entry ** for the job.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::JobsV2::CompensationEntry>]
        attr_accessor :entries
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `max`
        # @return [Google::Apis::JobsV2::Money]
        attr_accessor :max
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `min`
        # @return [Google::Apis::JobsV2::Money]
        attr_accessor :min
      
        # Deprecated. Use entries instead.
        # Optional.
        # Type of job compensation.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount = args[:amount] if args.key?(:amount)
          @annualized_base_compensation_range = args[:annualized_base_compensation_range] if args.key?(:annualized_base_compensation_range)
          @annualized_total_compensation_range = args[:annualized_total_compensation_range] if args.key?(:annualized_total_compensation_range)
          @entries = args[:entries] if args.key?(:entries)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Compensation range.
      class CompensationRange
        include Google::Apis::Core::Hashable
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `max`
        # @return [Google::Apis::JobsV2::Money]
        attr_accessor :max
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `min`
        # @return [Google::Apis::JobsV2::Money]
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
      
      # Output only.
      # Response of auto-complete query.
      class CompleteQueryResponse
        include Google::Apis::Core::Hashable
      
        # Results of the matching job/company candidates.
        # Corresponds to the JSON property `completionResults`
        # @return [Array<Google::Apis::JobsV2::CompletionResult>]
        attr_accessor :completion_results
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completion_results = args[:completion_results] if args.key?(:completion_results)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # Output only.
      # Resource that represents completion results.
      class CompletionResult
        include Google::Apis::Core::Hashable
      
        # The URL for the company logo if `type=COMPANY_NAME`.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # The suggestion for the query.
        # Corresponds to the JSON property `suggestion`
        # @return [String]
        attr_accessor :suggestion
      
        # The completion topic.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_url = args[:image_url] if args.key?(:image_url)
          @suggestion = args[:suggestion] if args.key?(:suggestion)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Input only.
      # Create job request.
      class CreateJobRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. Please use processing_options. This flag is ignored if
        # processing_options is set.
        # Optional.
        # If set to `true`, the service does not attempt to resolve a
        # more precise address for the job.
        # Corresponds to the JSON property `disableStreetAddressResolution`
        # @return [Boolean]
        attr_accessor :disable_street_address_resolution
        alias_method :disable_street_address_resolution?, :disable_street_address_resolution
      
        # A Job resource represents a job posting (also referred to as a "job listing"
        # or "job requisition"). A job belongs to a Company, which is the hiring
        # entity responsible for the job.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::JobsV2::Job]
        attr_accessor :job
      
        # Input only.
        # Options for job processing.
        # Corresponds to the JSON property `processingOptions`
        # @return [Google::Apis::JobsV2::JobProcessingOptions]
        attr_accessor :processing_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_street_address_resolution = args[:disable_street_address_resolution] if args.key?(:disable_street_address_resolution)
          @job = args[:job] if args.key?(:job)
          @processing_options = args[:processing_options] if args.key?(:processing_options)
        end
      end
      
      # Custom attribute values that are either filterable or non-filterable.
      class CustomAttribute
        include Google::Apis::Core::Hashable
      
        # Optional. If the `filterable` flag is true, custom field values are searchable.
        # If false, values are not searchable.
        # Default is false.
        # Corresponds to the JSON property `filterable`
        # @return [Boolean]
        attr_accessor :filterable
        alias_method :filterable?, :filterable
      
        # Optional but at least one of string_values or long_value must
        # be specified.
        # This field is used to perform number range search.
        # (`EQ`, `GT`, `GE`, `LE`, `LT`) over filterable `long_value`. For
        # `long_value`, a value between Long.MIN and Long.MAX is allowed.
        # Corresponds to the JSON property `longValue`
        # @return [Fixnum]
        attr_accessor :long_value
      
        # Represents array of string values.
        # Corresponds to the JSON property `stringValues`
        # @return [Google::Apis::JobsV2::StringValues]
        attr_accessor :string_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filterable = args[:filterable] if args.key?(:filterable)
          @long_value = args[:long_value] if args.key?(:long_value)
          @string_values = args[:string_values] if args.key?(:string_values)
        end
      end
      
      # Custom attributes histogram request. An error will be thrown if neither
      # string_value_histogram or long_value_histogram_bucketing_option has
      # been defined.
      class CustomAttributeHistogramRequest
        include Google::Apis::Core::Hashable
      
        # Required. Specifies the custom field key to perform a histogram on. If
        # specified
        # without `long_value_histogram_bucketing_option`, histogram on string values
        # of the given `key` is triggered, otherwise histogram is performed on long
        # values.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Input only.
        # Use this field to specify bucketing option for the histogram search response.
        # Corresponds to the JSON property `longValueHistogramBucketingOption`
        # @return [Google::Apis::JobsV2::NumericBucketingOption]
        attr_accessor :long_value_histogram_bucketing_option
      
        # Optional. If set to true, the response will include the histogram value for
        # each key as a string.
        # Corresponds to the JSON property `stringValueHistogram`
        # @return [Boolean]
        attr_accessor :string_value_histogram
        alias_method :string_value_histogram?, :string_value_histogram
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @long_value_histogram_bucketing_option = args[:long_value_histogram_bucketing_option] if args.key?(:long_value_histogram_bucketing_option)
          @string_value_histogram = args[:string_value_histogram] if args.key?(:string_value_histogram)
        end
      end
      
      # Output only.
      # Custom attribute histogram result.
      class CustomAttributeHistogramResult
        include Google::Apis::Core::Hashable
      
        # Stores the key of custom attribute the histogram is performed on.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Output only.
        # Custom numeric bucketing result.
        # Corresponds to the JSON property `longValueHistogramResult`
        # @return [Google::Apis::JobsV2::NumericBucketingResult]
        attr_accessor :long_value_histogram_result
      
        # Stores a map from the values of string custom field associated
        # with `key` to the number of jobs with that value in this histogram result.
        # Corresponds to the JSON property `stringValueHistogramResult`
        # @return [Hash<String,Fixnum>]
        attr_accessor :string_value_histogram_result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @long_value_histogram_result = args[:long_value_histogram_result] if args.key?(:long_value_histogram_result)
          @string_value_histogram_result = args[:string_value_histogram_result] if args.key?(:string_value_histogram_result)
        end
      end
      
      # Resource that represents the custom data not captured by the standard fields.
      class CustomField
        include Google::Apis::Core::Hashable
      
        # Optional. The values of the custom data.
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
      
      # Input only.
      # Custom field filter of the search.
      class CustomFieldFilter
        include Google::Apis::Core::Hashable
      
        # Required. The query strings for the filter.
        # Corresponds to the JSON property `queries`
        # @return [Array<String>]
        attr_accessor :queries
      
        # Optional. The type of filter.
        # Defaults to FilterType.OR.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @queries = args[:queries] if args.key?(:queries)
          @type = args[:type] if args.key?(:type)
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
      
      # Deprecated. Use BatchDeleteJobsRequest instead.
      # Input only.
      # Delete job by filter request.
      # The job typically becomes unsearchable within 10 seconds, but it may take
      # up to 5 minutes.
      class DeleteJobsByFilterRequest
        include Google::Apis::Core::Hashable
      
        # Optional. If set to true, this call waits for all processing steps to complete
        # before the job is cleaned up. Otherwise, the call returns while some
        # steps are still taking place asynchronously, hence faster.
        # Corresponds to the JSON property `disableFastProcess`
        # @return [Boolean]
        attr_accessor :disable_fast_process
        alias_method :disable_fast_process?, :disable_fast_process
      
        # Deprecated. Use BatchDeleteJobsRequest instead.
        # Input only.
        # Filter for jobs to be deleted.
        # Corresponds to the JSON property `filter`
        # @return [Google::Apis::JobsV2::Filter]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_fast_process = args[:disable_fast_process] if args.key?(:disable_fast_process)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Input only.
      # Device information collected from the job seeker, candidate, or
      # other entity conducting the job search. Providing this information improves
      # the quality of the search results across devices.
      class DeviceInfo
        include Google::Apis::Core::Hashable
      
        # Optional. Type of the device.
        # Corresponds to the JSON property `deviceType`
        # @return [String]
        attr_accessor :device_type
      
        # Optional. A device-specific ID. The ID must be a unique identifier that
        # distinguishes
        # the device from other devices.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_type = args[:device_type] if args.key?(:device_type)
          @id = args[:id] if args.key?(:id)
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
      
      # Deprecated. Always use CompensationFilter.
      # Input only.
      # Filter on job compensation type and amount.
      class ExtendedCompensationFilter
        include Google::Apis::Core::Hashable
      
        # Deprecated. See CompensationInfo.
        # Compensation range.
        # Corresponds to the JSON property `compensationRange`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange]
        attr_accessor :compensation_range
      
        # Required. Specify desired `base compensation entry's`
        # ExtendedCompensationInfo.CompensationUnit.
        # Corresponds to the JSON property `compensationUnits`
        # @return [Array<String>]
        attr_accessor :compensation_units
      
        # Optional. Specify currency in 3-letter
        # [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) format. If
        # unspecified, jobs are returned regardless of currency.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # Optional. Whether to include jobs whose compensation range is unspecified.
        # Corresponds to the JSON property `includeJobWithUnspecifiedCompensationRange`
        # @return [Boolean]
        attr_accessor :include_job_with_unspecified_compensation_range
        alias_method :include_job_with_unspecified_compensation_range?, :include_job_with_unspecified_compensation_range
      
        # Required. Type of filter.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compensation_range = args[:compensation_range] if args.key?(:compensation_range)
          @compensation_units = args[:compensation_units] if args.key?(:compensation_units)
          @currency = args[:currency] if args.key?(:currency)
          @include_job_with_unspecified_compensation_range = args[:include_job_with_unspecified_compensation_range] if args.key?(:include_job_with_unspecified_compensation_range)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Deprecated. Use CompensationInfo.
      # Describes job compensation.
      class ExtendedCompensationInfo
        include Google::Apis::Core::Hashable
      
        # Deprecated. See CompensationInfo.
        # Compensation range.
        # Corresponds to the JSON property `annualizedBaseCompensationRange`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange]
        attr_accessor :annualized_base_compensation_range
      
        # Output only. Indicates annualized base compensation range cannot be derived,
        # due to
        # the job's base compensation entry cannot be annualized.
        # See CompensationEntry for explanation on annualization and base
        # compensation entry.
        # Corresponds to the JSON property `annualizedBaseCompensationUnspecified`
        # @return [Boolean]
        attr_accessor :annualized_base_compensation_unspecified
        alias_method :annualized_base_compensation_unspecified?, :annualized_base_compensation_unspecified
      
        # Deprecated. See CompensationInfo.
        # Compensation range.
        # Corresponds to the JSON property `annualizedTotalCompensationRange`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange]
        attr_accessor :annualized_total_compensation_range
      
        # Output only. Indicates annualized total compensation range cannot be derived,
        # due to
        # the job's all CompensationEntry cannot be annualized.
        # See CompensationEntry for explanation on annualization and base
        # compensation entry.
        # Corresponds to the JSON property `annualizedTotalCompensationUnspecified`
        # @return [Boolean]
        attr_accessor :annualized_total_compensation_unspecified
        alias_method :annualized_total_compensation_unspecified?, :annualized_total_compensation_unspecified
      
        # Optional. A 3-letter [ISO 4217](https://www.iso.org/iso-4217-currency-codes.
        # html)
        # currency code.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # Optional. Job compensation information.
        # At most one entry can be of type
        # ExtendedCompensationInfo.CompensationType.BASE, which is
        # referred as ** base compensation entry ** for the job.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::JobsV2::ExtendedCompensationInfoCompensationEntry>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annualized_base_compensation_range = args[:annualized_base_compensation_range] if args.key?(:annualized_base_compensation_range)
          @annualized_base_compensation_unspecified = args[:annualized_base_compensation_unspecified] if args.key?(:annualized_base_compensation_unspecified)
          @annualized_total_compensation_range = args[:annualized_total_compensation_range] if args.key?(:annualized_total_compensation_range)
          @annualized_total_compensation_unspecified = args[:annualized_total_compensation_unspecified] if args.key?(:annualized_total_compensation_unspecified)
          @currency = args[:currency] if args.key?(:currency)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # Deprecated. See CompensationInfo.
      # A compensation entry that represents one component of compensation, such
      # as base pay, bonus, or other compensation type.
      # Annualization: One compensation entry can be annualized if
      # - it contains valid amount or range.
      # - and its expected_units_per_year is set or can be derived.
      # Its annualized range is determined as (amount or range) times
      # expected_units_per_year.
      class ExtendedCompensationInfoCompensationEntry
        include Google::Apis::Core::Hashable
      
        # Deprecated. See CompensationInfo.
        # Decimal number.
        # Corresponds to the JSON property `amount`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoDecimal]
        attr_accessor :amount
      
        # Optional. Compensation description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Deprecated. See CompensationInfo.
        # Decimal number.
        # Corresponds to the JSON property `expectedUnitsPerYear`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoDecimal]
        attr_accessor :expected_units_per_year
      
        # Deprecated. See CompensationInfo.
        # Compensation range.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoCompensationRange]
        attr_accessor :range
      
        # Required. Compensation type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Optional. Frequency of the specified amount.
        # Default is CompensationUnit.COMPENSATION_UNIT_UNSPECIFIED.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # Optional. Indicates compensation amount and range are unset.
        # Corresponds to the JSON property `unspecified`
        # @return [Boolean]
        attr_accessor :unspecified
        alias_method :unspecified?, :unspecified
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount = args[:amount] if args.key?(:amount)
          @description = args[:description] if args.key?(:description)
          @expected_units_per_year = args[:expected_units_per_year] if args.key?(:expected_units_per_year)
          @range = args[:range] if args.key?(:range)
          @type = args[:type] if args.key?(:type)
          @unit = args[:unit] if args.key?(:unit)
          @unspecified = args[:unspecified] if args.key?(:unspecified)
        end
      end
      
      # Deprecated. See CompensationInfo.
      # Compensation range.
      class ExtendedCompensationInfoCompensationRange
        include Google::Apis::Core::Hashable
      
        # Deprecated. See CompensationInfo.
        # Decimal number.
        # Corresponds to the JSON property `max`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoDecimal]
        attr_accessor :max
      
        # Deprecated. See CompensationInfo.
        # Decimal number.
        # Corresponds to the JSON property `min`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfoDecimal]
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
      
      # Deprecated. See CompensationInfo.
      # Decimal number.
      class ExtendedCompensationInfoDecimal
        include Google::Apis::Core::Hashable
      
        # Micro (10^-6) units.
        # The value must be between -999,999 and +999,999 inclusive.
        # If `units` is positive, `micros` must be positive or zero.
        # If `units` is zero, `micros` can be positive, zero, or negative.
        # If `units` is negative, `micros` must be negative or zero.
        # For example -1.75 is represented as `units`=-1 and `micros`=-750,000.
        # Corresponds to the JSON property `micros`
        # @return [Fixnum]
        attr_accessor :micros
      
        # Whole units.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @micros = args[:micros] if args.key?(:micros)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Deprecated. Use BatchDeleteJobsRequest instead.
      # Input only.
      # Filter for jobs to be deleted.
      class Filter
        include Google::Apis::Core::Hashable
      
        # Required. The requisition ID (or posting ID) assigned by the client to
        # identify a
        # job. This is intended for client identification and tracking of
        # listings.
        # name takes precedence over this field
        # The maximum number of allowed characters is 225.
        # Corresponds to the JSON property `requisitionId`
        # @return [String]
        attr_accessor :requisition_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requisition_id = args[:requisition_id] if args.key?(:requisition_id)
        end
      end
      
      # Deprecated. Use SearchJobsRequest.histogram_facets instead to make
      # a single call with both search and histogram.
      # Input only.
      # A request for the `GetHistogram` method.
      class GetHistogramRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Controls whether to broaden the search to avoid too few results for
        # a
        # given query in instances where a search has sparse results. Results from a
        # broadened query is a superset of the results from the original query.
        # Defaults to false.
        # Corresponds to the JSON property `allowBroadening`
        # @return [Boolean]
        attr_accessor :allow_broadening
        alias_method :allow_broadening?, :allow_broadening
      
        # Input only.
        # Deprecated. Use JobQuery instead.
        # The filters required to perform a search query or histogram.
        # Corresponds to the JSON property `filters`
        # @return [Google::Apis::JobsV2::JobFilters]
        attr_accessor :filters
      
        # Input only.
        # The query required to perform a search query or histogram.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::JobsV2::JobQuery]
        attr_accessor :query
      
        # Input only.
        # Meta information related to the job searcher or entity
        # conducting the job search. This information is used to improve the
        # performance of the service.
        # Corresponds to the JSON property `requestMetadata`
        # @return [Google::Apis::JobsV2::RequestMetadata]
        attr_accessor :request_metadata
      
        # Required. A list of facets that specify the histogram data to be calculated
        # against and returned.
        # Histogram response times can be slow, and counts
        # can be approximations. This call may be temporarily or permanently removed
        # prior to the production release of Cloud Talent Solution.
        # Corresponds to the JSON property `searchTypes`
        # @return [Array<String>]
        attr_accessor :search_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_broadening = args[:allow_broadening] if args.key?(:allow_broadening)
          @filters = args[:filters] if args.key?(:filters)
          @query = args[:query] if args.key?(:query)
          @request_metadata = args[:request_metadata] if args.key?(:request_metadata)
          @search_types = args[:search_types] if args.key?(:search_types)
        end
      end
      
      # Deprecated. Use SearchJobsRequest.histogram_facets instead to make
      # a single call with both search and histogram.
      # Output only.
      # The response of the GetHistogram method.
      class GetHistogramResponse
        include Google::Apis::Core::Hashable
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        # The Histogram results.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::JobsV2::HistogramResult>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Input only.
      # Histogram facets to be specified in SearchJobsRequest.
      class HistogramFacets
        include Google::Apis::Core::Hashable
      
        # Optional. Specifies compensation field-based histogram requests.
        # Duplicate values of CompensationHistogramRequest.type are not allowed.
        # Corresponds to the JSON property `compensationHistogramFacets`
        # @return [Array<Google::Apis::JobsV2::CompensationHistogramRequest>]
        attr_accessor :compensation_histogram_facets
      
        # Optional. Specifies the custom attributes histogram requests.
        # Duplicate values of CustomAttributeHistogramRequest.key are not
        # allowed.
        # Corresponds to the JSON property `customAttributeHistogramFacets`
        # @return [Array<Google::Apis::JobsV2::CustomAttributeHistogramRequest>]
        attr_accessor :custom_attribute_histogram_facets
      
        # Optional. Specifies the simple type of histogram facets, for example,
        # `COMPANY_SIZE`, `EMPLOYMENT_TYPE` etc. This field is equivalent to
        # GetHistogramRequest.
        # Corresponds to the JSON property `simpleHistogramFacets`
        # @return [Array<String>]
        attr_accessor :simple_histogram_facets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compensation_histogram_facets = args[:compensation_histogram_facets] if args.key?(:compensation_histogram_facets)
          @custom_attribute_histogram_facets = args[:custom_attribute_histogram_facets] if args.key?(:custom_attribute_histogram_facets)
          @simple_histogram_facets = args[:simple_histogram_facets] if args.key?(:simple_histogram_facets)
        end
      end
      
      # Output only.
      # Result of a histogram call. The response contains the histogram map for the
      # search type specified by HistogramResult.field.
      # The response is a map of each filter value to the corresponding count of
      # jobs for that filter.
      class HistogramResult
        include Google::Apis::Core::Hashable
      
        # The Histogram search filters.
        # Corresponds to the JSON property `searchType`
        # @return [String]
        attr_accessor :search_type
      
        # A map from the values of field to the number of jobs with that value
        # in this search result.
        # Key: search type (filter names, such as the companyName).
        # Values: the count of jobs that match the filter for this search.
        # Corresponds to the JSON property `values`
        # @return [Hash<String,Fixnum>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_type = args[:search_type] if args.key?(:search_type)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Output only.
      # Histogram results that matches HistogramFacets specified in
      # SearchJobsRequest.
      class HistogramResults
        include Google::Apis::Core::Hashable
      
        # Specifies compensation field-based histogram results that matches
        # HistogramFacets.compensation_histogram_requests.
        # Corresponds to the JSON property `compensationHistogramResults`
        # @return [Array<Google::Apis::JobsV2::CompensationHistogramResult>]
        attr_accessor :compensation_histogram_results
      
        # Specifies histogram results for custom attributes that
        # matches HistogramFacets.custom_attribute_histogram_facets.
        # Corresponds to the JSON property `customAttributeHistogramResults`
        # @return [Array<Google::Apis::JobsV2::CustomAttributeHistogramResult>]
        attr_accessor :custom_attribute_histogram_results
      
        # Specifies histogram results that matches
        # HistogramFacets.simple_histogram_facets.
        # Corresponds to the JSON property `simpleHistogramResults`
        # @return [Array<Google::Apis::JobsV2::HistogramResult>]
        attr_accessor :simple_histogram_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compensation_histogram_results = args[:compensation_histogram_results] if args.key?(:compensation_histogram_results)
          @custom_attribute_histogram_results = args[:custom_attribute_histogram_results] if args.key?(:custom_attribute_histogram_results)
          @simple_histogram_results = args[:simple_histogram_results] if args.key?(:simple_histogram_results)
        end
      end
      
      # A Job resource represents a job posting (also referred to as a "job listing"
      # or "job requisition"). A job belongs to a Company, which is the hiring
      # entity responsible for the job.
      class Job
        include Google::Apis::Core::Hashable
      
        # Optional but at least one of application_urls,
        # application_email_list or application_instruction must be
        # specified.
        # Use this field to specify email address(es) to which resumes or
        # applications can be sent.
        # The maximum number of allowed characters is 255.
        # Corresponds to the JSON property `applicationEmailList`
        # @return [Array<String>]
        attr_accessor :application_email_list
      
        # Optional but at least one of application_urls,
        # application_email_list or application_instruction must be
        # specified.
        # Use this field to provide instructions, such as "Mail your application
        # to ...", that a candidate can follow to apply for the job.
        # This field accepts and sanitizes HTML input, and also accepts
        # bold, italic, ordered list, and unordered list markup tags.
        # The maximum number of allowed characters is 3,000.
        # Corresponds to the JSON property `applicationInstruction`
        # @return [String]
        attr_accessor :application_instruction
      
        # Optional but at least one of application_urls,
        # application_email_list or application_instruction must be
        # specified.
        # Use this URL field to direct an applicant to a website, for example to
        # link to an online application form.
        # The maximum number of allowed characters is 2,000.
        # Corresponds to the JSON property `applicationUrls`
        # @return [Array<String>]
        attr_accessor :application_urls
      
        # Optional. The benefits included with the job.
        # Corresponds to the JSON property `benefits`
        # @return [Array<String>]
        attr_accessor :benefits
      
        # Output only. The name of the company listing the job.
        # Corresponds to the JSON property `companyDisplayName`
        # @return [String]
        attr_accessor :company_display_name
      
        # Optional but one of company_name or distributor_company_id must be
        # provided.
        # The resource name of the company listing the job, such as
        # /companies/foo. This field takes precedence over the
        # distributor-assigned company identifier, distributor_company_id.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        # Deprecated. Use company_display_name instead.
        # Output only.
        # The name of the company listing the job.
        # Corresponds to the JSON property `companyTitle`
        # @return [String]
        attr_accessor :company_title
      
        # Job compensation details.
        # Corresponds to the JSON property `compensationInfo`
        # @return [Google::Apis::JobsV2::CompensationInfo]
        attr_accessor :compensation_info
      
        # Output only. The timestamp when this job was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. A map of fields to hold both filterable and non-filterable custom
        # job
        # attributes that are not covered by the provided structured fields.
        # This field is a more general combination of the deprecated id-based
        # filterable_custom_fields and string-based
        # non_filterable_custom_fields.
        # The keys of the map are strings up to 64 bytes and must match the
        # pattern: a-zA-Z*.
        # At most 100 filterable and at most 100 unfilterable keys are supported.
        # For filterable `string_values`, across all keys at most 200 values are
        # allowed, with each string no more than 255 characters. For unfilterable
        # `string_values`, the maximum total size of `string_values` across all keys
        # is 50KB.
        # Corresponds to the JSON property `customAttributes`
        # @return [Hash<String,Google::Apis::JobsV2::CustomAttribute>]
        attr_accessor :custom_attributes
      
        # Optional. The department or functional area within the company with the open
        # position.
        # The maximum number of allowed characters is 255.
        # Corresponds to the JSON property `department`
        # @return [String]
        attr_accessor :department
      
        # Required. The description of the job, which typically includes a multi-
        # paragraph
        # description of the company and related information. Separate fields are
        # provided on the job object for responsibilities,
        # qualifications, and other job characteristics. Use of
        # these separate job fields is recommended.
        # This field accepts and sanitizes HTML input, and also accepts
        # bold, italic, ordered list, and unordered list markup tags.
        # The maximum number of allowed characters is 100,000.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional but one of company_name or distributor_company_id must be
        # provided.
        # A unique company identifier used by job distributors to identify an
        # employer's company entity. company_name takes precedence over
        # this field, and is the recommended field to use to identify companies.
        # The maximum number of allowed characters is 255.
        # Corresponds to the JSON property `distributorCompanyId`
        # @return [String]
        attr_accessor :distributor_company_id
      
        # Optional. The desired education level for the job, such as
        # "Bachelors", "Masters", "Doctorate".
        # Corresponds to the JSON property `educationLevels`
        # @return [Array<String>]
        attr_accessor :education_levels
      
        # Optional. The employment type(s) of a job, for example,
        # full time or
        # part time.
        # Corresponds to the JSON property `employmentTypes`
        # @return [Array<String>]
        attr_accessor :employment_types
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `endDate`
        # @return [Google::Apis::JobsV2::Date]
        attr_accessor :end_date
      
        # Optional but strongly recommended for the best service
        # experience.
        # The expiration timestamp of the job. After this timestamp, the
        # job is marked as expired, and it no longer appears in search results. The
        # expired job can't be deleted or listed by the DeleteJob and
        # ListJobs APIs, but it can be retrieved with the GetJob API or
        # updated with the UpdateJob API. An expired job can be updated and
        # opened again by using a future expiration timestamp. Updating an expired
        # job fails if there is another existing open job with same
        # requisition_id, company_name and language_code.
        # The expired jobs are retained in our system for 90 days. However, the
        # overall expired job count cannot exceed 3 times the maximum of open jobs
        # count over the past week, otherwise jobs with earlier expire time are
        # cleaned first. Expired jobs are no longer accessible after they are cleaned
        # out.
        # The format of this field is RFC 3339 date strings. Example:
        # 2000-01-01T00:00:00.999999999Z
        # See
        # [https://www.ietf.org/rfc/rfc3339.txt](https://www.ietf.org/rfc/rfc3339.txt).
        # A valid date range is between 1970-01-01T00:00:00.0Z and
        # 2100-12-31T23:59:59.999Z. Invalid dates are ignored and treated as expire
        # time not provided.
        # If this value is not provided at the time of job creation or is invalid,
        # the job posting expires after 30 days from the job's creation time. For
        # example, if the job was created on 2017/01/01 13:00AM UTC with an
        # unspecified expiration date, the job expires after 2017/01/31 13:00AM UTC.
        # If this value is not provided but expiry_date is, expiry_date is
        # used.
        # If this value is not provided on job update, it depends on the field masks
        # set by UpdateJobRequest.update_job_fields. If the field masks include
        # expiry_time, or the masks are empty meaning that every field is
        # updated, the job posting expires after 30 days from the job's last
        # update time. Otherwise the expiration date isn't updated.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `expiryDate`
        # @return [Google::Apis::JobsV2::Date]
        attr_accessor :expiry_date
      
        # Deprecated. Use CompensationInfo.
        # Describes job compensation.
        # Corresponds to the JSON property `extendedCompensationInfo`
        # @return [Google::Apis::JobsV2::ExtendedCompensationInfo]
        attr_accessor :extended_compensation_info
      
        # Deprecated. Use custom_attributes instead.
        # Optional.
        # A map of fields to hold filterable custom job attributes not captured by
        # the standard fields such as job_title, company_name, or
        # level. These custom fields store arbitrary
        # string values, and can be used for purposes not covered by
        # the structured fields. For the best search experience, use of the
        # structured rather than custom fields is recommended.
        # Data stored in these custom fields fields are indexed and
        # searched against by keyword searches (see
        # SearchJobsRequest.custom_field_filters][]).
        # The map key must be a number between 1-20. If an invalid key is
        # provided on job create or update, an error is returned.
        # Corresponds to the JSON property `filterableCustomFields`
        # @return [Hash<String,Google::Apis::JobsV2::CustomField>]
        attr_accessor :filterable_custom_fields
      
        # Optional. A description of bonus, commission, and other compensation
        # incentives associated with the job not including salary or pay.
        # The maximum number of allowed characters is 10,000.
        # Corresponds to the JSON property `incentives`
        # @return [String]
        attr_accessor :incentives
      
        # Output only. Structured locations of the job, resolved from locations.
        # Corresponds to the JSON property `jobLocations`
        # @return [Array<Google::Apis::JobsV2::JobLocation>]
        attr_accessor :job_locations
      
        # Required. The title of the job, such as "Software Engineer"
        # The maximum number of allowed characters is 500.
        # Corresponds to the JSON property `jobTitle`
        # @return [String]
        attr_accessor :job_title
      
        # Optional. The language of the posting. This field is distinct from
        # any requirements for fluency that are associated with the job.
        # Language codes must be in BCP-47 format, such as "en-US" or "sr-Latn".
        # For more information, see
        # [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47)`:
        # class="external" target="_blank" `.
        # If this field is unspecified and Job.description is present, detected
        # language code based on Job.description is assigned, otherwise
        # defaults to 'en_US'.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. The experience level associated with the job, such as "Entry Level".
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # Optional but strongly recommended for the best service experience.
        # Location(s) where the emploeyer is looking to hire for this job posting.
        # Specifying the full street address(es) of the hiring location enables
        # better API results, especially job searches by commute time.
        # At most 50 locations are allowed for best search performance. If a job has
        # more locations, it is suggested to split it into multiple jobs with unique
        # requisition_ids (e.g. 'ReqA' becomes 'ReqA-1', 'ReqA-2', etc.) as
        # multiple jobs with the same requisition_id, company_name and
        # language_code are not allowed. If the original requisition_id must
        # be preserved, a custom field should be used for storage. It is also
        # suggested to group the locations that close to each other in the same job
        # for better search experience.
        # The maximum number of allowed characters is 500.
        # Corresponds to the JSON property `locations`
        # @return [Array<String>]
        attr_accessor :locations
      
        # Required during job update.
        # Resource name assigned to a job by the API, for example, "/jobs/foo". Use
        # of this field in job queries and API calls is preferred over the use of
        # requisition_id since this value is unique.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. A promotion value of the job, as determined by the client.
        # The value determines the sort order of the jobs returned when searching for
        # jobs using the featured jobs search call, with higher promotional values
        # being returned first and ties being resolved by relevance sort. Only the
        # jobs with a promotionValue >0 are returned in a FEATURED_JOB_SEARCH.
        # Default value is 0, and negative values are treated as 0.
        # Corresponds to the JSON property `promotionValue`
        # @return [Fixnum]
        attr_accessor :promotion_value
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `publishDate`
        # @return [Google::Apis::JobsV2::Date]
        attr_accessor :publish_date
      
        # Optional. A description of the qualifications required to perform the
        # job. The use of this field is recommended
        # as an alternative to using the more general description field.
        # This field accepts and sanitizes HTML input, and also accepts
        # bold, italic, ordered list, and unordered list markup tags.
        # The maximum number of allowed characters is 10,000.
        # Corresponds to the JSON property `qualifications`
        # @return [String]
        attr_accessor :qualifications
      
        # Output only. The URL of a web page that displays job details.
        # Corresponds to the JSON property `referenceUrl`
        # @return [String]
        attr_accessor :reference_url
      
        # Optional. The job Region (for example, state, country) throughout which the
        # job
        # is available. If this field is set, a
        # LocationFilter in a search query within the job region
        # finds this job if an exact location match is not specified.
        # If this field is set, setting job locations
        # to the same location level as this field is strongly recommended.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Required. The requisition ID, also referred to as the posting ID, assigned by
        # the
        # client to identify a job. This field is intended to be used by clients
        # for client identification and tracking of listings. A job is not allowed
        # to be created if there is another job with the same requisition_id,
        # company_name and language_code.
        # The maximum number of allowed characters is 255.
        # Corresponds to the JSON property `requisitionId`
        # @return [String]
        attr_accessor :requisition_id
      
        # Optional. A description of job responsibilities. The use of this field is
        # recommended as an alternative to using the more general description
        # field.
        # This field accepts and sanitizes HTML input, and also accepts
        # bold, italic, ordered list, and unordered list markup tags.
        # The maximum number of allowed characters is 10,000.
        # Corresponds to the JSON property `responsibilities`
        # @return [String]
        attr_accessor :responsibilities
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startDate`
        # @return [Google::Apis::JobsV2::Date]
        attr_accessor :start_date
      
        # Deprecated. Use custom_attributes instead.
        # Optional.
        # A map of fields to hold non-filterable custom job attributes, similar to
        # filterable_custom_fields. These fields are distinct in that the data
        # in these fields are not indexed. Therefore, the client cannot search
        # against them, nor can the client use them to list jobs.
        # The key of the map can be any valid string.
        # Corresponds to the JSON property `unindexedCustomFields`
        # @return [Hash<String,Google::Apis::JobsV2::CustomField>]
        attr_accessor :unindexed_custom_fields
      
        # Output only. The timestamp when this job was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Optional. The visibility of the job.
        # Defaults to JobVisibility.PRIVATE if not specified.
        # Currently only JobVisibility.PRIVATE is supported.
        # Corresponds to the JSON property `visibility`
        # @return [String]
        attr_accessor :visibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_email_list = args[:application_email_list] if args.key?(:application_email_list)
          @application_instruction = args[:application_instruction] if args.key?(:application_instruction)
          @application_urls = args[:application_urls] if args.key?(:application_urls)
          @benefits = args[:benefits] if args.key?(:benefits)
          @company_display_name = args[:company_display_name] if args.key?(:company_display_name)
          @company_name = args[:company_name] if args.key?(:company_name)
          @company_title = args[:company_title] if args.key?(:company_title)
          @compensation_info = args[:compensation_info] if args.key?(:compensation_info)
          @create_time = args[:create_time] if args.key?(:create_time)
          @custom_attributes = args[:custom_attributes] if args.key?(:custom_attributes)
          @department = args[:department] if args.key?(:department)
          @description = args[:description] if args.key?(:description)
          @distributor_company_id = args[:distributor_company_id] if args.key?(:distributor_company_id)
          @education_levels = args[:education_levels] if args.key?(:education_levels)
          @employment_types = args[:employment_types] if args.key?(:employment_types)
          @end_date = args[:end_date] if args.key?(:end_date)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @expiry_date = args[:expiry_date] if args.key?(:expiry_date)
          @extended_compensation_info = args[:extended_compensation_info] if args.key?(:extended_compensation_info)
          @filterable_custom_fields = args[:filterable_custom_fields] if args.key?(:filterable_custom_fields)
          @incentives = args[:incentives] if args.key?(:incentives)
          @job_locations = args[:job_locations] if args.key?(:job_locations)
          @job_title = args[:job_title] if args.key?(:job_title)
          @language_code = args[:language_code] if args.key?(:language_code)
          @level = args[:level] if args.key?(:level)
          @locations = args[:locations] if args.key?(:locations)
          @name = args[:name] if args.key?(:name)
          @promotion_value = args[:promotion_value] if args.key?(:promotion_value)
          @publish_date = args[:publish_date] if args.key?(:publish_date)
          @qualifications = args[:qualifications] if args.key?(:qualifications)
          @reference_url = args[:reference_url] if args.key?(:reference_url)
          @region = args[:region] if args.key?(:region)
          @requisition_id = args[:requisition_id] if args.key?(:requisition_id)
          @responsibilities = args[:responsibilities] if args.key?(:responsibilities)
          @start_date = args[:start_date] if args.key?(:start_date)
          @unindexed_custom_fields = args[:unindexed_custom_fields] if args.key?(:unindexed_custom_fields)
          @update_time = args[:update_time] if args.key?(:update_time)
          @visibility = args[:visibility] if args.key?(:visibility)
        end
      end
      
      # Input only.
      # Deprecated. Use JobQuery instead.
      # The filters required to perform a search query or histogram.
      class JobFilters
        include Google::Apis::Core::Hashable
      
        # Optional. The category filter specifies the categories of jobs to search
        # against.
        # See Category for more information.
        # If a value is not specified, jobs from any category are searched against.
        # If multiple values are specified, jobs from any of the specified
        # categories are searched against.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # Input only.
        # Parameters needed for commute search.
        # Corresponds to the JSON property `commuteFilter`
        # @return [Google::Apis::JobsV2::CommutePreference]
        attr_accessor :commute_filter
      
        # Optional. The company names filter specifies the company entities to search
        # against.
        # If a value is not specified, jobs are searched for against all companies.
        # If multiple values are specified, jobs are searched against the
        # specified companies.
        # At most 20 company filters are allowed.
        # Corresponds to the JSON property `companyNames`
        # @return [Array<String>]
        attr_accessor :company_names
      
        # Optional. This filter specifies the exact company titles
        # of jobs to search against.
        # If a value is not specified, jobs within the search results can be
        # associated with any company.
        # If multiple values are specified, jobs within the search results may be
        # associated with any of the specified companies.
        # At most 20 company title filters are allowed.
        # Corresponds to the JSON property `companyTitles`
        # @return [Array<String>]
        attr_accessor :company_titles
      
        # Input only.
        # Filter on job compensation type and amount.
        # Corresponds to the JSON property `compensationFilter`
        # @return [Google::Apis::JobsV2::CompensationFilter]
        attr_accessor :compensation_filter
      
        # Optional. This filter specifies a structured syntax to match against the
        # Job.custom_attributes that are marked as `filterable`.
        # The syntax for this expression is a subset of Google SQL syntax.
        # Supported operators are: =, !=, <, <=, >, >= where the left of the operator
        # is a custom field key and the right of the operator is a number or string
        # (surrounded by quotes) value.
        # Supported functions are LOWER(<field_name>) to
        # perform case insensitive match and EMPTY(<field_name>) to filter on the
        # existence of a key.
        # Boolean expressions (AND/OR/NOT) are supported up to 3 levels of
        # nesting (For example, "((A AND B AND C) OR NOT D) AND E"), and there can
        # be a maximum of 100 comparisons/functions in the expression. The expression
        # must be < 3000 bytes in length.
        # Sample Query:
        # (key1 = "TEST" OR LOWER(key1)="test" OR NOT EMPTY(key1)) AND key2 > 100
        # Corresponds to the JSON property `customAttributeFilter`
        # @return [String]
        attr_accessor :custom_attribute_filter
      
        # Deprecated. Use custom_attribute_filter instead.
        # Optional.
        # This filter specifies searching against
        # custom field values. See Job.filterable_custom_fields for information.
        # The key value specifies a number between 1-20 (the service
        # supports 20 custom fields) corresponding to the desired custom field map
        # value. If an invalid key is provided or specified together with
        # custom_attribute_filter, an error is thrown.
        # Corresponds to the JSON property `customFieldFilters`
        # @return [Hash<String,Google::Apis::JobsV2::CustomFieldFilter>]
        attr_accessor :custom_field_filters
      
        # Optional. This flag controls the spell-check feature. If false, the
        # service attempts to correct a misspelled query,
        # for example, "enginee" is corrected to "engineer".
        # Defaults to false: a spell check is performed.
        # Corresponds to the JSON property `disableSpellCheck`
        # @return [Boolean]
        attr_accessor :disable_spell_check
        alias_method :disable_spell_check?, :disable_spell_check
      
        # Optional. The employment type filter specifies the employment type of jobs to
        # search against, such as EmploymentType.FULL_TIME.
        # If a value is not specified, jobs in the search results include any
        # employment type.
        # If multiple values are specified, jobs in the search results include any
        # of the specified employment types.
        # Corresponds to the JSON property `employmentTypes`
        # @return [Array<String>]
        attr_accessor :employment_types
      
        # Deprecated. Always use CompensationFilter.
        # Input only.
        # Filter on job compensation type and amount.
        # Corresponds to the JSON property `extendedCompensationFilter`
        # @return [Google::Apis::JobsV2::ExtendedCompensationFilter]
        attr_accessor :extended_compensation_filter
      
        # Optional. This filter specifies the locale of jobs to search against,
        # for example, "en-US".
        # If a value is not specified, the search results may contain jobs in any
        # locale.
        # Language codes should be in BCP-47 format, for example, "en-US" or
        # "sr-Latn". For more information, see [Tags for Identifying
        # Languages](https://tools.ietf.org/html/bcp47).
        # At most 10 language code filters are allowed.
        # Corresponds to the JSON property `languageCodes`
        # @return [Array<String>]
        attr_accessor :language_codes
      
        # Optional. The location filter specifies geo-regions containing the jobs to
        # search against. See LocationFilter for more information.
        # If a location value is not specified, jobs are retrieved
        # from all locations.
        # If multiple values are specified, jobs are retrieved from any of the
        # specified locations. If different values are specified for the
        # LocationFilter.distance_in_miles parameter, the maximum provided
        # distance is used for all locations.
        # At most 5 location filters are allowed.
        # Corresponds to the JSON property `locationFilters`
        # @return [Array<Google::Apis::JobsV2::LocationFilter>]
        attr_accessor :location_filters
      
        # Optional. Jobs published within a range specified by this filter are searched
        # against, for example, DateRange.PAST_MONTH. If a value is not
        # specified, all open jobs are searched against regardless of the
        # date they were published.
        # Corresponds to the JSON property `publishDateRange`
        # @return [String]
        attr_accessor :publish_date_range
      
        # Optional. The query filter contains the keywords that match against the job
        # title, description, and location fields.
        # The maximum query size is 255 bytes/characters.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Deprecated. Do not use this field.
        # This flag controls whether the job search should be restricted to jobs
        # owned by the current user.
        # Defaults to false where all jobs accessible to the
        # user are searched against.
        # Corresponds to the JSON property `tenantJobOnly`
        # @return [Boolean]
        attr_accessor :tenant_job_only
        alias_method :tenant_job_only?, :tenant_job_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @commute_filter = args[:commute_filter] if args.key?(:commute_filter)
          @company_names = args[:company_names] if args.key?(:company_names)
          @company_titles = args[:company_titles] if args.key?(:company_titles)
          @compensation_filter = args[:compensation_filter] if args.key?(:compensation_filter)
          @custom_attribute_filter = args[:custom_attribute_filter] if args.key?(:custom_attribute_filter)
          @custom_field_filters = args[:custom_field_filters] if args.key?(:custom_field_filters)
          @disable_spell_check = args[:disable_spell_check] if args.key?(:disable_spell_check)
          @employment_types = args[:employment_types] if args.key?(:employment_types)
          @extended_compensation_filter = args[:extended_compensation_filter] if args.key?(:extended_compensation_filter)
          @language_codes = args[:language_codes] if args.key?(:language_codes)
          @location_filters = args[:location_filters] if args.key?(:location_filters)
          @publish_date_range = args[:publish_date_range] if args.key?(:publish_date_range)
          @query = args[:query] if args.key?(:query)
          @tenant_job_only = args[:tenant_job_only] if args.key?(:tenant_job_only)
        end
      end
      
      # Output only.
      # A resource that represents a location with full geographic
      # information.
      class JobLocation
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::JobsV2::LatLng]
        attr_accessor :lat_lng
      
        # The type of a location, which corresponds to the address lines field of
        # PostalAddress. For example, "Downtown, Atlanta, GA, USA" has a type of
        # LocationType#NEIGHBORHOOD, and "Kansas City, KS, USA" has a type of
        # LocationType#LOCALITY.
        # Corresponds to the JSON property `locationType`
        # @return [String]
        attr_accessor :location_type
      
        # Represents a postal address, e.g. for postal delivery or payments addresses.
        # Given a postal address, a postal service can deliver items to a premise, P.O.
        # Box or similar.
        # It is not intended to model geographical locations (roads, towns,
        # mountains).
        # In typical usage an address would be created via user input or from importing
        # existing data, depending on the type of process.
        # Advice on address input / editing:
        # - Use an i18n-ready address widget such as
        # https://github.com/google/libaddressinput)
        # - Users should not be presented with UI elements for input or editing of
        # fields outside countries where that field is used.
        # For more guidance on how to use this schema, please see:
        # https://support.google.com/business/answer/6397478
        # Corresponds to the JSON property `postalAddress`
        # @return [Google::Apis::JobsV2::PostalAddress]
        attr_accessor :postal_address
      
        # Radius in meters of the job location. This value is derived from the
        # location bounding box in which a circle with the specified radius
        # centered from LatLng coves the area associated with the job location.
        # For example, currently, "Mountain View, CA, USA" has a radius of
        # 7885.79 meters.
        # Corresponds to the JSON property `radiusMeters`
        # @return [Float]
        attr_accessor :radius_meters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
          @location_type = args[:location_type] if args.key?(:location_type)
          @postal_address = args[:postal_address] if args.key?(:postal_address)
          @radius_meters = args[:radius_meters] if args.key?(:radius_meters)
        end
      end
      
      # Input only.
      # Options for job processing.
      class JobProcessingOptions
        include Google::Apis::Core::Hashable
      
        # Optional. If set to `true`, the service does not attempt to resolve a
        # more precise address for the job.
        # Corresponds to the JSON property `disableStreetAddressResolution`
        # @return [Boolean]
        attr_accessor :disable_street_address_resolution
        alias_method :disable_street_address_resolution?, :disable_street_address_resolution
      
        # Optional. Option for job HTML content sanitization. Applied fields are:
        # * description
        # * applicationInstruction
        # * incentives
        # * qualifications
        # * responsibilities
        # HTML tags in these fields may be stripped if sanitiazation is not disabled.
        # Defaults to HtmlSanitization.SIMPLE_FORMATTING_ONLY.
        # Corresponds to the JSON property `htmlSanitization`
        # @return [String]
        attr_accessor :html_sanitization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_street_address_resolution = args[:disable_street_address_resolution] if args.key?(:disable_street_address_resolution)
          @html_sanitization = args[:html_sanitization] if args.key?(:html_sanitization)
        end
      end
      
      # Input only.
      # The query required to perform a search query or histogram.
      class JobQuery
        include Google::Apis::Core::Hashable
      
        # Optional. The category filter specifies the categories of jobs to search
        # against.
        # See Category for more information.
        # If a value is not specified, jobs from any category are searched against.
        # If multiple values are specified, jobs from any of the specified
        # categories are searched against.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # Input only.
        # Parameters needed for commute search.
        # Corresponds to the JSON property `commuteFilter`
        # @return [Google::Apis::JobsV2::CommutePreference]
        attr_accessor :commute_filter
      
        # Optional. This filter specifies the exact company display
        # name of the jobs to search against.
        # If a value isn't specified, jobs within the search results are
        # associated with any company.
        # If multiple values are specified, jobs within the search results may be
        # associated with any of the specified companies.
        # At most 20 company display name filters are allowed.
        # Corresponds to the JSON property `companyDisplayNames`
        # @return [Array<String>]
        attr_accessor :company_display_names
      
        # Optional. This filter specifies the company entities to search against.
        # If a value isn't specified, jobs are searched for against all
        # companies.
        # If multiple values are specified, jobs are searched against the
        # companies specified.
        # At most 20 company filters are allowed.
        # Corresponds to the JSON property `companyNames`
        # @return [Array<String>]
        attr_accessor :company_names
      
        # Input only.
        # Filter on job compensation type and amount.
        # Corresponds to the JSON property `compensationFilter`
        # @return [Google::Apis::JobsV2::CompensationFilter]
        attr_accessor :compensation_filter
      
        # Optional. This filter specifies a structured syntax to match against the
        # Job.custom_attributes marked as `filterable`.
        # The syntax for this expression is a subset of Google SQL syntax.
        # Supported operators are: =, !=, <, <=, >, >= where the left of the operator
        # is a custom field key and the right of the operator is a number or string
        # (surrounded by quotes) value.
        # Supported functions are LOWER(<field_name>) to
        # perform case insensitive match and EMPTY(<field_name>) to filter on the
        # existence of a key.
        # Boolean expressions (AND/OR/NOT) are supported up to 3 levels of
        # nesting (for example, "((A AND B AND C) OR NOT D) AND E"), a maximum of 50
        # comparisons/functions are allowed in the expression. The expression
        # must be < 2000 characters in length.
        # Sample Query:
        # (key1 = "TEST" OR LOWER(key1)="test" OR NOT EMPTY(key1)) AND key2 > 100
        # Corresponds to the JSON property `customAttributeFilter`
        # @return [String]
        attr_accessor :custom_attribute_filter
      
        # Optional. This flag controls the spell-check feature. If false, the
        # service attempts to correct a misspelled query,
        # for example, "enginee" is corrected to "engineer".
        # Defaults to false: a spell check is performed.
        # Corresponds to the JSON property `disableSpellCheck`
        # @return [Boolean]
        attr_accessor :disable_spell_check
        alias_method :disable_spell_check?, :disable_spell_check
      
        # Optional. The employment type filter specifies the employment type of jobs to
        # search against, such as EmploymentType.FULL_TIME.
        # If a value is not specified, jobs in the search results include any
        # employment type.
        # If multiple values are specified, jobs in the search results include
        # any of the specified employment types.
        # Corresponds to the JSON property `employmentTypes`
        # @return [Array<String>]
        attr_accessor :employment_types
      
        # Optional. This filter specifies the locale of jobs to search against,
        # for example, "en-US".
        # If a value isn't specified, the search results can contain jobs in any
        # locale.
        # Language codes should be in BCP-47 format, such as "en-US" or "sr-Latn".
        # For more information, see
        # [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47).
        # At most 10 language code filters are allowed.
        # Corresponds to the JSON property `languageCodes`
        # @return [Array<String>]
        attr_accessor :language_codes
      
        # Optional. The location filter specifies geo-regions containing the jobs to
        # search against. See LocationFilter for more information.
        # If a location value isn't specified, jobs fitting the other search
        # criteria are retrieved regardless of where they're located.
        # If multiple values are specified, jobs are retrieved from any of the
        # specified locations. If different values are specified for the
        # LocationFilter.distance_in_miles parameter, the maximum provided
        # distance is used for all locations.
        # At most 5 location filters are allowed.
        # Corresponds to the JSON property `locationFilters`
        # @return [Array<Google::Apis::JobsV2::LocationFilter>]
        attr_accessor :location_filters
      
        # Optional. Jobs published within a range specified by this filter are searched
        # against, for example, DateRange.PAST_MONTH. If a value isn't
        # specified, all open jobs are searched against regardless of their
        # published date.
        # Corresponds to the JSON property `publishDateRange`
        # @return [String]
        attr_accessor :publish_date_range
      
        # Optional. The query string that matches against the job title, description,
        # and
        # location fields.
        # The maximum query size is 255 bytes.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @commute_filter = args[:commute_filter] if args.key?(:commute_filter)
          @company_display_names = args[:company_display_names] if args.key?(:company_display_names)
          @company_names = args[:company_names] if args.key?(:company_names)
          @compensation_filter = args[:compensation_filter] if args.key?(:compensation_filter)
          @custom_attribute_filter = args[:custom_attribute_filter] if args.key?(:custom_attribute_filter)
          @disable_spell_check = args[:disable_spell_check] if args.key?(:disable_spell_check)
          @employment_types = args[:employment_types] if args.key?(:employment_types)
          @language_codes = args[:language_codes] if args.key?(:language_codes)
          @location_filters = args[:location_filters] if args.key?(:location_filters)
          @publish_date_range = args[:publish_date_range] if args.key?(:publish_date_range)
          @query = args[:query] if args.key?(:query)
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
      
      # Output only.
      # The List companies response object.
      class ListCompaniesResponse
        include Google::Apis::Core::Hashable
      
        # Companies for the current client.
        # Corresponds to the JSON property `companies`
        # @return [Array<Google::Apis::JobsV2::Company>]
        attr_accessor :companies
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        # A token to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @companies = args[:companies] if args.key?(:companies)
          @metadata = args[:metadata] if args.key?(:metadata)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Deprecated. Use ListJobsResponse instead.
      # Output only.
      # The List jobs response object.
      class ListCompanyJobsResponse
        include Google::Apis::Core::Hashable
      
        # The Jobs for a given company.
        # The maximum number of items returned is based on the limit field
        # provided in the request.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::JobsV2::Job>]
        attr_accessor :jobs
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        # A token to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of open jobs. The result will be
        # empty if ListCompanyJobsRequest.include_jobs_count is not enabled
        # or if no open jobs are available.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @metadata = args[:metadata] if args.key?(:metadata)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Output only.
      # List jobs response.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # The Jobs for a given company.
        # The maximum number of items returned is based on the limit field
        # provided in the request.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::JobsV2::Job>]
        attr_accessor :jobs
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        # A token to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @metadata = args[:metadata] if args.key?(:metadata)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Input only.
      # Geographic region of the search.
      class LocationFilter
        include Google::Apis::Core::Hashable
      
        # Optional. The distance_in_miles is applied when the location being searched
        # for is
        # identified as a city or smaller. When the location being searched for is a
        # state or larger, this field is ignored.
        # Corresponds to the JSON property `distanceInMiles`
        # @return [Float]
        attr_accessor :distance_in_miles
      
        # Optional. Allows the client to return jobs without a
        # set location, specifically, telecommuting jobs (telecomuting is considered
        # by the service as a special location.
        # Job.allow_telecommute indicates if a job permits telecommuting.
        # If this field is true, telecommuting jobs are searched, and
        # name and lat_lng are
        # ignored.
        # This filter can be used by itself to search exclusively for telecommuting
        # jobs, or it can be combined with another location
        # filter to search for a combination of job locations,
        # such as "Mountain View" or "telecommuting" jobs. However, when used in
        # combination with other location filters, telecommuting jobs can be
        # treated as less relevant than other jobs in the search response.
        # Corresponds to the JSON property `isTelecommute`
        # @return [Boolean]
        attr_accessor :is_telecommute
        alias_method :is_telecommute?, :is_telecommute
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::JobsV2::LatLng]
        attr_accessor :lat_lng
      
        # Optional. The address name, such as "Mountain View" or "Bay Area".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. CLDR region code of the country/region of the address. This will be
        # used
        # to address ambiguity of the user-input location, e.g. "Liverpool"
        # against "Liverpool, NY, US" or "Liverpool, UK".
        # Set this field if all the jobs to search against are from a same region,
        # or jobs are world-wide but the job seeker is from a specific region.
        # See http://cldr.unicode.org/ and
        # http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html
        # for details. Example: "CH" for Switzerland.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @distance_in_miles = args[:distance_in_miles] if args.key?(:distance_in_miles)
          @is_telecommute = args[:is_telecommute] if args.key?(:is_telecommute)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
          @name = args[:name] if args.key?(:name)
          @region_code = args[:region_code] if args.key?(:region_code)
        end
      end
      
      # Output only.
      # Job entry with metadata inside SearchJobsResponse.
      class MatchingJob
        include Google::Apis::Core::Hashable
      
        # Output only.
        # Commute details related to this job.
        # Corresponds to the JSON property `commuteInfo`
        # @return [Google::Apis::JobsV2::CommuteInfo]
        attr_accessor :commute_info
      
        # A Job resource represents a job posting (also referred to as a "job listing"
        # or "job requisition"). A job belongs to a Company, which is the hiring
        # entity responsible for the job.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::JobsV2::Job]
        attr_accessor :job
      
        # A summary of the job with core information that's displayed on the search
        # results listing page.
        # Corresponds to the JSON property `jobSummary`
        # @return [String]
        attr_accessor :job_summary
      
        # Contains snippets of text from the Job.job_title field most
        # closely matching a search query's keywords, if available. The matching
        # query keywords are enclosed in HTML bold tags.
        # Corresponds to the JSON property `jobTitleSnippet`
        # @return [String]
        attr_accessor :job_title_snippet
      
        # Contains snippets of text from the Job.description and similar
        # fields that most closely match a search query's keywords, if available.
        # All HTML tags in the original fields are stripped when returned in this
        # field, and matching query keywords are enclosed in HTML bold tags.
        # Corresponds to the JSON property `searchTextSnippet`
        # @return [String]
        attr_accessor :search_text_snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commute_info = args[:commute_info] if args.key?(:commute_info)
          @job = args[:job] if args.key?(:job)
          @job_summary = args[:job_summary] if args.key?(:job_summary)
          @job_title_snippet = args[:job_title_snippet] if args.key?(:job_title_snippet)
          @search_text_snippet = args[:search_text_snippet] if args.key?(:search_text_snippet)
        end
      end
      
      # Message representing input to a Mendel server for debug forcing.
      # See go/mendel-debug-forcing for more details.
      # Next ID: 2
      class MendelDebugInput
        include Google::Apis::Core::Hashable
      
        # When a request spans multiple servers, a MendelDebugInput may travel with
        # the request and take effect in all the servers. This field is a map of
        # namespaces to NamespacedMendelDebugInput protos. In a single server, up to
        # two NamespacedMendelDebugInput protos are applied:
        # 1. NamespacedMendelDebugInput with the global namespace (key == "").
        # 2. NamespacedMendelDebugInput with the server's namespace.
        # When both NamespacedMendelDebugInput protos are present, they are merged.
        # See go/mendel-debug-forcing for more details.
        # Corresponds to the JSON property `namespacedDebugInput`
        # @return [Hash<String,Google::Apis::JobsV2::NamespacedDebugInput>]
        attr_accessor :namespaced_debug_input
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespaced_debug_input = args[:namespaced_debug_input] if args.key?(:namespaced_debug_input)
        end
      end
      
      # Represents an amount of money with its currency type.
      class Money
        include Google::Apis::Core::Hashable
      
        # The 3-letter currency code defined in ISO 4217.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # Number of nano (10^-9) units of the amount.
        # The value must be between -999,999,999 and +999,999,999 inclusive.
        # If `units` is positive, `nanos` must be positive or zero.
        # If `units` is zero, `nanos` can be positive, zero, or negative.
        # If `units` is negative, `nanos` must be negative or zero.
        # For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # The whole units of the amount.
        # For example if `currencyCode` is `"USD"`, then 1 unit is one US dollar.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @nanos = args[:nanos] if args.key?(:nanos)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Next ID: 15
      class NamespacedDebugInput
        include Google::Apis::Core::Hashable
      
        # Set of experiment names to be absolutely forced.
        # These experiments will be forced without evaluating the conditions.
        # Corresponds to the JSON property `absolutelyForcedExpNames`
        # @return [Array<String>]
        attr_accessor :absolutely_forced_exp_names
      
        # Set of experiment tags to be absolutely forced.
        # The experiments with these tags will be forced without evaluating the
        # conditions.
        # Corresponds to the JSON property `absolutelyForcedExpTags`
        # @return [Array<String>]
        attr_accessor :absolutely_forced_exp_tags
      
        # Set of experiment ids to be absolutely forced.
        # These ids will be forced without evaluating the conditions.
        # Corresponds to the JSON property `absolutelyForcedExps`
        # @return [Array<Fixnum>]
        attr_accessor :absolutely_forced_exps
      
        # Set of experiment names to be conditionally forced.
        # These experiments will be forced only if their conditions and their
        # parent domain's conditions are true.
        # Corresponds to the JSON property `conditionallyForcedExpNames`
        # @return [Array<String>]
        attr_accessor :conditionally_forced_exp_names
      
        # Set of experiment tags to be conditionally forced.
        # The experiments with these tags will be forced only if their conditions
        # and their parent domain's conditions are true.
        # Corresponds to the JSON property `conditionallyForcedExpTags`
        # @return [Array<String>]
        attr_accessor :conditionally_forced_exp_tags
      
        # Set of experiment ids to be conditionally forced.
        # These ids will be forced only if their conditions and their parent
        # domain's conditions are true.
        # Corresponds to the JSON property `conditionallyForcedExps`
        # @return [Array<Fixnum>]
        attr_accessor :conditionally_forced_exps
      
        # If true, disable automatic enrollment selection (at all diversion
        # points). Automatic enrollment selection means experiment selection
        # process based on the experiment's automatic enrollment condition. This
        # does not disable selection of forced experiments.
        # Corresponds to the JSON property `disableAutomaticEnrollmentSelection`
        # @return [Boolean]
        attr_accessor :disable_automatic_enrollment_selection
        alias_method :disable_automatic_enrollment_selection?, :disable_automatic_enrollment_selection
      
        # Set of experiment names to be disabled.
        # If an experiment is disabled, it is never selected nor forced.
        # If an aggregate experiment is disabled, its partitions are disabled
        # together. If an experiment with an enrollment is disabled, the enrollment
        # is disabled together. If a name corresponds to a domain, the domain
        # itself and all descendant experiments and domains are disabled together.
        # Corresponds to the JSON property `disableExpNames`
        # @return [Array<String>]
        attr_accessor :disable_exp_names
      
        # Set of experiment tags to be disabled. All experiments that are tagged
        # with one or more of these tags are disabled.
        # If an experiment is disabled, it is never selected nor forced.
        # If an aggregate experiment is disabled, its partitions are disabled
        # together. If an experiment with an enrollment is disabled, the enrollment
        # is disabled together.
        # Corresponds to the JSON property `disableExpTags`
        # @return [Array<String>]
        attr_accessor :disable_exp_tags
      
        # Set of experiment ids to be disabled.
        # If an experiment is disabled, it is never selected nor forced.
        # If an aggregate experiment is disabled, its partitions are disabled
        # together. If an experiment with an enrollment is disabled, the enrollment
        # is disabled together. If an ID corresponds to a domain, the domain itself
        # and all descendant experiments and domains are disabled together.
        # Corresponds to the JSON property `disableExps`
        # @return [Array<Fixnum>]
        attr_accessor :disable_exps
      
        # If true, disable manual enrollment selection (at all diversion points).
        # Manual enrollment selection means experiment selection process based on
        # the request's manual enrollment states (a.k.a. opt-in experiments).
        # This does not disable selection of forced experiments.
        # Corresponds to the JSON property `disableManualEnrollmentSelection`
        # @return [Boolean]
        attr_accessor :disable_manual_enrollment_selection
        alias_method :disable_manual_enrollment_selection?, :disable_manual_enrollment_selection
      
        # If true, disable organic experiment selection (at all diversion points).
        # Organic selection means experiment selection process based on traffic
        # allocation and diversion condition evaluation.
        # This does not disable selection of forced experiments.
        # This is useful in cases when it is not known whether experiment selection
        # behavior is responsible for a error or breakage. Disabling organic
        # selection may help to isolate the cause of a given problem.
        # Corresponds to the JSON property `disableOrganicSelection`
        # @return [Boolean]
        attr_accessor :disable_organic_selection
        alias_method :disable_organic_selection?, :disable_organic_selection
      
        # Flags to force in a particular experiment state.
        # Map from flag name to flag value.
        # Corresponds to the JSON property `forcedFlags`
        # @return [Hash<String,String>]
        attr_accessor :forced_flags
      
        # Rollouts to force in a particular experiment state.
        # Map from rollout name to rollout value.
        # Corresponds to the JSON property `forcedRollouts`
        # @return [Hash<String,Boolean>]
        attr_accessor :forced_rollouts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @absolutely_forced_exp_names = args[:absolutely_forced_exp_names] if args.key?(:absolutely_forced_exp_names)
          @absolutely_forced_exp_tags = args[:absolutely_forced_exp_tags] if args.key?(:absolutely_forced_exp_tags)
          @absolutely_forced_exps = args[:absolutely_forced_exps] if args.key?(:absolutely_forced_exps)
          @conditionally_forced_exp_names = args[:conditionally_forced_exp_names] if args.key?(:conditionally_forced_exp_names)
          @conditionally_forced_exp_tags = args[:conditionally_forced_exp_tags] if args.key?(:conditionally_forced_exp_tags)
          @conditionally_forced_exps = args[:conditionally_forced_exps] if args.key?(:conditionally_forced_exps)
          @disable_automatic_enrollment_selection = args[:disable_automatic_enrollment_selection] if args.key?(:disable_automatic_enrollment_selection)
          @disable_exp_names = args[:disable_exp_names] if args.key?(:disable_exp_names)
          @disable_exp_tags = args[:disable_exp_tags] if args.key?(:disable_exp_tags)
          @disable_exps = args[:disable_exps] if args.key?(:disable_exps)
          @disable_manual_enrollment_selection = args[:disable_manual_enrollment_selection] if args.key?(:disable_manual_enrollment_selection)
          @disable_organic_selection = args[:disable_organic_selection] if args.key?(:disable_organic_selection)
          @forced_flags = args[:forced_flags] if args.key?(:forced_flags)
          @forced_rollouts = args[:forced_rollouts] if args.key?(:forced_rollouts)
        end
      end
      
      # Input only.
      # Use this field to specify bucketing option for the histogram search response.
      class NumericBucketingOption
        include Google::Apis::Core::Hashable
      
        # Required. Two adjacent values form a histogram bucket. Values should be in
        # ascending order. For example, if [5, 10, 15] are provided, four buckets are
        # created: (-inf, 5), 5, 10), [10, 15), [15, inf). At most 20
        # [buckets_bound is supported.
        # Corresponds to the JSON property `bucketBounds`
        # @return [Array<Float>]
        attr_accessor :bucket_bounds
      
        # Optional. If set to true, the histogram result includes minimum/maximum
        # value of the numeric field.
        # Corresponds to the JSON property `requiresMinMax`
        # @return [Boolean]
        attr_accessor :requires_min_max
        alias_method :requires_min_max?, :requires_min_max
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_bounds = args[:bucket_bounds] if args.key?(:bucket_bounds)
          @requires_min_max = args[:requires_min_max] if args.key?(:requires_min_max)
        end
      end
      
      # Output only.
      # Custom numeric bucketing result.
      class NumericBucketingResult
        include Google::Apis::Core::Hashable
      
        # Count within each bucket. Its size is the length of
        # NumericBucketingOption.bucket_bounds plus 1.
        # Corresponds to the JSON property `counts`
        # @return [Array<Google::Apis::JobsV2::BucketizedCount>]
        attr_accessor :counts
      
        # Stores the maximum value of the numeric field. Will be populated only if
        # [NumericBucketingOption.requires_min_max] is set to true.
        # Corresponds to the JSON property `maxValue`
        # @return [Float]
        attr_accessor :max_value
      
        # Stores the minimum value of the numeric field. Will be populated only if
        # [NumericBucketingOption.requires_min_max] is set to true.
        # Corresponds to the JSON property `minValue`
        # @return [Float]
        attr_accessor :min_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @counts = args[:counts] if args.key?(:counts)
          @max_value = args[:max_value] if args.key?(:max_value)
          @min_value = args[:min_value] if args.key?(:min_value)
        end
      end
      
      # Represents a postal address, e.g. for postal delivery or payments addresses.
      # Given a postal address, a postal service can deliver items to a premise, P.O.
      # Box or similar.
      # It is not intended to model geographical locations (roads, towns,
      # mountains).
      # In typical usage an address would be created via user input or from importing
      # existing data, depending on the type of process.
      # Advice on address input / editing:
      # - Use an i18n-ready address widget such as
      # https://github.com/google/libaddressinput)
      # - Users should not be presented with UI elements for input or editing of
      # fields outside countries where that field is used.
      # For more guidance on how to use this schema, please see:
      # https://support.google.com/business/answer/6397478
      class PostalAddress
        include Google::Apis::Core::Hashable
      
        # Unstructured address lines describing the lower levels of an address.
        # Because values in address_lines do not have type information and may
        # sometimes contain multiple values in a single field (e.g.
        # "Austin, TX"), it is important that the line order is clear. The order of
        # address lines should be "envelope order" for the country/region of the
        # address. In places where this can vary (e.g. Japan), address_language is
        # used to make it explicit (e.g. "ja" for large-to-small ordering and
        # "ja-Latn" or "en" for small-to-large). This way, the most specific line of
        # an address can be selected based on the language.
        # The minimum permitted structural representation of an address consists
        # of a region_code with all remaining information placed in the
        # address_lines. It would be possible to format such an address very
        # approximately without geocoding, but no semantic reasoning could be
        # made about any of the address components until it was at least
        # partially resolved.
        # Creating an address only containing a region_code and address_lines, and
        # then geocoding is the recommended way to handle completely unstructured
        # addresses (as opposed to guessing which parts of the address should be
        # localities or administrative areas).
        # Corresponds to the JSON property `addressLines`
        # @return [Array<String>]
        attr_accessor :address_lines
      
        # Optional. Highest administrative subdivision which is used for postal
        # addresses of a country or region.
        # For example, this can be a state, a province, an oblast, or a prefecture.
        # Specifically, for Spain this is the province and not the autonomous
        # community (e.g. "Barcelona" and not "Catalonia").
        # Many countries don't use an administrative area in postal addresses. E.g.
        # in Switzerland this should be left unpopulated.
        # Corresponds to the JSON property `administrativeArea`
        # @return [String]
        attr_accessor :administrative_area
      
        # Optional. BCP-47 language code of the contents of this address (if
        # known). This is often the UI language of the input form or is expected
        # to match one of the languages used in the address' country/region, or their
        # transliterated equivalents.
        # This can affect formatting in certain countries, but is not critical
        # to the correctness of the data and will never affect any validation or
        # other non-formatting related operations.
        # If this value is not known, it should be omitted (rather than specifying a
        # possibly incorrect default).
        # Examples: "zh-Hant", "ja", "ja-Latn", "en".
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Optional. Generally refers to the city/town portion of the address.
        # Examples: US city, IT comune, UK post town.
        # In regions of the world where localities are not well defined or do not fit
        # into this structure well, leave locality empty and use address_lines.
        # Corresponds to the JSON property `locality`
        # @return [String]
        attr_accessor :locality
      
        # Optional. The name of the organization at the address.
        # Corresponds to the JSON property `organization`
        # @return [String]
        attr_accessor :organization
      
        # Optional. Postal code of the address. Not all countries use or require
        # postal codes to be present, but where they are used, they may trigger
        # additional validation with other parts of the address (e.g. state/zip
        # validation in the U.S.A.).
        # Corresponds to the JSON property `postalCode`
        # @return [String]
        attr_accessor :postal_code
      
        # Optional. The recipient at the address.
        # This field may, under certain circumstances, contain multiline information.
        # For example, it might contain "care of" information.
        # Corresponds to the JSON property `recipients`
        # @return [Array<String>]
        attr_accessor :recipients
      
        # Required. CLDR region code of the country/region of the address. This
        # is never inferred and it is up to the user to ensure the value is
        # correct. See http://cldr.unicode.org/ and
        # http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html
        # for details. Example: "CH" for Switzerland.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # The schema revision of the `PostalAddress`. This must be set to 0, which is
        # the latest revision.
        # All new revisions **must** be backward compatible with old revisions.
        # Corresponds to the JSON property `revision`
        # @return [Fixnum]
        attr_accessor :revision
      
        # Optional. Additional, country-specific, sorting code. This is not used
        # in most regions. Where it is used, the value is either a string like
        # "CEDEX", optionally followed by a number (e.g. "CEDEX 7"), or just a number
        # alone, representing the "sector code" (Jamaica), "delivery area indicator"
        # (Malawi) or "post office indicator" (e.g. Côte d'Ivoire).
        # Corresponds to the JSON property `sortingCode`
        # @return [String]
        attr_accessor :sorting_code
      
        # Optional. Sublocality of the address.
        # For example, this can be neighborhoods, boroughs, districts.
        # Corresponds to the JSON property `sublocality`
        # @return [String]
        attr_accessor :sublocality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address_lines = args[:address_lines] if args.key?(:address_lines)
          @administrative_area = args[:administrative_area] if args.key?(:administrative_area)
          @language_code = args[:language_code] if args.key?(:language_code)
          @locality = args[:locality] if args.key?(:locality)
          @organization = args[:organization] if args.key?(:organization)
          @postal_code = args[:postal_code] if args.key?(:postal_code)
          @recipients = args[:recipients] if args.key?(:recipients)
          @region_code = args[:region_code] if args.key?(:region_code)
          @revision = args[:revision] if args.key?(:revision)
          @sorting_code = args[:sorting_code] if args.key?(:sorting_code)
          @sublocality = args[:sublocality] if args.key?(:sublocality)
        end
      end
      
      # Input only.
      # Meta information related to the job searcher or entity
      # conducting the job search. This information is used to improve the
      # performance of the service.
      class RequestMetadata
        include Google::Apis::Core::Hashable
      
        # Input only.
        # Device information collected from the job seeker, candidate, or
        # other entity conducting the job search. Providing this information improves
        # the quality of the search results across devices.
        # Corresponds to the JSON property `deviceInfo`
        # @return [Google::Apis::JobsV2::DeviceInfo]
        attr_accessor :device_info
      
        # Required. The client-defined scope or source of the service call, which
        # typically
        # is the domain on
        # which the service has been implemented and is currently being run.
        # For example, if the service is being run by client <em>Foo, Inc.</em>, on
        # job board www.foo.com and career site www.bar.com, then this field is
        # set to "foo.com" for use on the job board, and "bar.com" for use on the
        # career site.
        # If this field is not available for some reason, send "UNKNOWN". Note that
        # any improvements to the service model for a particular tenant site rely on
        # this field being set correctly to some domain.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # Required. A unique session identification string. A session is defined as the
        # duration of an end user's interaction with the service over a period.
        # Obfuscate this field for privacy concerns before
        # providing it to the API.
        # If this field is not available for some reason, please send "UNKNOWN". Note
        # that any improvements to the service model for a particular tenant site,
        # rely on this field being set correctly to some unique session_id.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # Required. A unique user identification string, as determined by the client.
        # The
        # client is responsible for ensuring client-level uniqueness of this value
        # in order to have the strongest positive impact on search quality.
        # Obfuscate this field for privacy concerns before
        # providing it to the service.
        # If this field is not available for some reason, please send "UNKNOWN". Note
        # that any improvements to the service model for a particular tenant site,
        # rely on this field being set correctly to some unique user_id.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_info = args[:device_info] if args.key?(:device_info)
          @domain = args[:domain] if args.key?(:domain)
          @session_id = args[:session_id] if args.key?(:session_id)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Output only.
      # Additional information returned to client, such as debugging
      # information.
      class ResponseMetadata
        include Google::Apis::Core::Hashable
      
        # Identifiers for the versions of the search algorithm used during
        # this API invocation if multiple algorithms are used.
        # The default value is empty.
        # For search response only.
        # Corresponds to the JSON property `experimentIdList`
        # @return [Array<Fixnum>]
        attr_accessor :experiment_id_list
      
        # For search response only. Indicates the mode of a performed search.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # A unique id associated with this call.
        # This id is logged for tracking purposes.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @experiment_id_list = args[:experiment_id_list] if args.key?(:experiment_id_list)
          @mode = args[:mode] if args.key?(:mode)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # Input only.
      # The Request body of the `SearchJobs` call.
      class SearchJobsRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Controls whether to disable relevance thresholding. Relevance
        # thresholding removes jobs that have low relevance in search results,
        # for example, removing "Assistant to the CEO" positions from the search
        # results of a search for "CEO".
        # Disabling relevance thresholding improves the accuracy of subsequent
        # search requests.
        # Defaults to false.
        # Corresponds to the JSON property `disableRelevanceThresholding`
        # @return [Boolean]
        attr_accessor :disable_relevance_thresholding
        alias_method :disable_relevance_thresholding?, :disable_relevance_thresholding
      
        # Optional. Controls whether to broaden the search when it produces sparse
        # results.
        # Broadened queries append results to the end of the matching results
        # list.
        # Defaults to false.
        # Corresponds to the JSON property `enableBroadening`
        # @return [Boolean]
        attr_accessor :enable_broadening
        alias_method :enable_broadening?, :enable_broadening
      
        # Optional. Controls if the search job request requires the return of a precise
        # count of the first 300 results. Setting this to `true` ensures
        # consistency in the number of results per page. Best practice is to set this
        # value to true if a client allows users to jump directly to a
        # non-sequential search results page.
        # Enabling this flag may adversely impact performance.
        # Defaults to false.
        # Corresponds to the JSON property `enablePreciseResultSize`
        # @return [Boolean]
        attr_accessor :enable_precise_result_size
        alias_method :enable_precise_result_size?, :enable_precise_result_size
      
        # Input only.
        # Deprecated. Use JobQuery instead.
        # The filters required to perform a search query or histogram.
        # Corresponds to the JSON property `filters`
        # @return [Google::Apis::JobsV2::JobFilters]
        attr_accessor :filters
      
        # Input only.
        # Histogram facets to be specified in SearchJobsRequest.
        # Corresponds to the JSON property `histogramFacets`
        # @return [Google::Apis::JobsV2::HistogramFacets]
        attr_accessor :histogram_facets
      
        # Optional. The number of job attributes returned for jobs in the
        # search response. Defaults to JobView.SMALL if no value is specified.
        # Corresponds to the JSON property `jobView`
        # @return [String]
        attr_accessor :job_view
      
        # Required. Mode of a search.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # Optional. An integer that specifies the current offset (that is, starting
        # result
        # location, amongst the jobs deemed by the API as relevant) in search
        # results. This field is only considered if page_token is unset.
        # For example, 0 means to  return results starting from the first matching
        # job, and 10 means to return from the 11th job. This can be used for
        # pagination, (for example, pageSize = 10 and offset = 10 means to return
        # from the second page).
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # Deprecated. Use sort_by instead.
        # Optional.
        # The criteria determining how search results are sorted.
        # Defaults to SortBy.RELEVANCE_DESC if no value is specified.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Optional. A limit on the number of jobs returned in the search results.
        # Increasing this value above the default value of 10 can increase search
        # response time. The value can be between 1 and 100.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Optional. The token specifying the current offset within
        # search results. See SearchJobsResponse.next_page_token for
        # an explanation of how to obtain the next set of query results.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Input only.
        # The query required to perform a search query or histogram.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::JobsV2::JobQuery]
        attr_accessor :query
      
        # Input only.
        # Meta information related to the job searcher or entity
        # conducting the job search. This information is used to improve the
        # performance of the service.
        # Corresponds to the JSON property `requestMetadata`
        # @return [Google::Apis::JobsV2::RequestMetadata]
        attr_accessor :request_metadata
      
        # Optional. The criteria determining how search results are sorted.
        # Defaults to SortBy.RELEVANCE_DESC if no value is specified.
        # Corresponds to the JSON property `sortBy`
        # @return [String]
        attr_accessor :sort_by
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_relevance_thresholding = args[:disable_relevance_thresholding] if args.key?(:disable_relevance_thresholding)
          @enable_broadening = args[:enable_broadening] if args.key?(:enable_broadening)
          @enable_precise_result_size = args[:enable_precise_result_size] if args.key?(:enable_precise_result_size)
          @filters = args[:filters] if args.key?(:filters)
          @histogram_facets = args[:histogram_facets] if args.key?(:histogram_facets)
          @job_view = args[:job_view] if args.key?(:job_view)
          @mode = args[:mode] if args.key?(:mode)
          @offset = args[:offset] if args.key?(:offset)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @query = args[:query] if args.key?(:query)
          @request_metadata = args[:request_metadata] if args.key?(:request_metadata)
          @sort_by = args[:sort_by] if args.key?(:sort_by)
        end
      end
      
      # Output only.
      # Response for SearchJob method.
      class SearchJobsResponse
        include Google::Apis::Core::Hashable
      
        # Input only.
        # Parameters needed for commute search.
        # Corresponds to the JSON property `appliedCommuteFilter`
        # @return [Google::Apis::JobsV2::CommutePreference]
        attr_accessor :applied_commute_filter
      
        # The location filters that the service applied to the specified query. If
        # any filters are lat-lng based, the JobLocation.location_type is
        # JobLocation.LocationType#LOCATION_TYPE_UNSPECIFIED.
        # Corresponds to the JSON property `appliedJobLocationFilters`
        # @return [Array<Google::Apis::JobsV2::JobLocation>]
        attr_accessor :applied_job_location_filters
      
        # An estimation of the number of jobs that match the specified query.
        # This number is not guaranteed to be accurate. For accurate results,
        # seenenable_precise_result_size.
        # Corresponds to the JSON property `estimatedTotalSize`
        # @return [Fixnum]
        attr_accessor :estimated_total_size
      
        # Output only.
        # Histogram results that matches HistogramFacets specified in
        # SearchJobsRequest.
        # Corresponds to the JSON property `histogramResults`
        # @return [Google::Apis::JobsV2::HistogramResults]
        attr_accessor :histogram_results
      
        # Corresponds to SearchJobsRequest.job_view.
        # Corresponds to the JSON property `jobView`
        # @return [String]
        attr_accessor :job_view
      
        # The Job entities that match the specified SearchJobsRequest.
        # Corresponds to the JSON property `matchingJobs`
        # @return [Array<Google::Apis::JobsV2::MatchingJob>]
        attr_accessor :matching_jobs
      
        # Output only.
        # Additional information returned to client, such as debugging
        # information.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::JobsV2::ResponseMetadata]
        attr_accessor :metadata
      
        # The token that specifies the starting position of the next page of results.
        # This field is empty if there are no more results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # If query broadening is enabled, we may append additional results from the
        # broadened query. This number indicates how many of the jobs returned in the
        # jobs field are from the broadened query. These results are always at the
        # end of the jobs list. In particular, a value of 0 means all the jobs in the
        # jobs list are from the original (without broadening) query. If this
        # field is non-zero, subsequent requests with offset after this result set
        # should contain all broadened results.
        # Corresponds to the JSON property `numJobsFromBroadenedQuery`
        # @return [Fixnum]
        attr_accessor :num_jobs_from_broadened_query
      
        # Output only.
        # Spell check result.
        # Corresponds to the JSON property `spellResult`
        # @return [Google::Apis::JobsV2::SpellingCorrection]
        attr_accessor :spell_result
      
        # The precise result count, which is available only if the client set
        # enable_precise_result_size to `true` or if the response
        # is the last page of results. Otherwise, the value will be `-1`.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @applied_commute_filter = args[:applied_commute_filter] if args.key?(:applied_commute_filter)
          @applied_job_location_filters = args[:applied_job_location_filters] if args.key?(:applied_job_location_filters)
          @estimated_total_size = args[:estimated_total_size] if args.key?(:estimated_total_size)
          @histogram_results = args[:histogram_results] if args.key?(:histogram_results)
          @job_view = args[:job_view] if args.key?(:job_view)
          @matching_jobs = args[:matching_jobs] if args.key?(:matching_jobs)
          @metadata = args[:metadata] if args.key?(:metadata)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @num_jobs_from_broadened_query = args[:num_jobs_from_broadened_query] if args.key?(:num_jobs_from_broadened_query)
          @spell_result = args[:spell_result] if args.key?(:spell_result)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Output only.
      # Spell check result.
      class SpellingCorrection
        include Google::Apis::Core::Hashable
      
        # Indicates if the query was corrected by the spell checker.
        # Corresponds to the JSON property `corrected`
        # @return [Boolean]
        attr_accessor :corrected
        alias_method :corrected?, :corrected
      
        # Correction output consisting of the corrected keyword string.
        # Corresponds to the JSON property `correctedText`
        # @return [String]
        attr_accessor :corrected_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @corrected = args[:corrected] if args.key?(:corrected)
          @corrected_text = args[:corrected_text] if args.key?(:corrected_text)
        end
      end
      
      # Represents array of string values.
      class StringValues
        include Google::Apis::Core::Hashable
      
        # Required. String values.
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
      
      # Input only.
      # Update job request.
      class UpdateJobRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. Please use processing_options. This flag is ignored if
        # processing_options is set.
        # Optional.
        # If set to `true`, the service does not attempt resolve a more precise
        # address for the job.
        # Corresponds to the JSON property `disableStreetAddressResolution`
        # @return [Boolean]
        attr_accessor :disable_street_address_resolution
        alias_method :disable_street_address_resolution?, :disable_street_address_resolution
      
        # A Job resource represents a job posting (also referred to as a "job listing"
        # or "job requisition"). A job belongs to a Company, which is the hiring
        # entity responsible for the job.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::JobsV2::Job]
        attr_accessor :job
      
        # Input only.
        # Options for job processing.
        # Corresponds to the JSON property `processingOptions`
        # @return [Google::Apis::JobsV2::JobProcessingOptions]
        attr_accessor :processing_options
      
        # Optional but strongly recommended to be provided for the best service
        # experience.
        # If update_job_fields is provided, only the specified fields in
        # job are updated. Otherwise all the fields are updated.
        # A field mask to restrict the fields that are updated. Valid values are:
        # * jobTitle
        # * employmentTypes
        # * description
        # * applicationUrls
        # * applicationEmailList
        # * applicationInstruction
        # * responsibilities
        # * qualifications
        # * educationLevels
        # * level
        # * department
        # * startDate
        # * endDate
        # * compensationInfo
        # * incentives
        # * languageCode
        # * benefits
        # * expireTime
        # * customAttributes
        # * visibility
        # * publishDate
        # * promotionValue
        # * locations
        # * region
        # * expiryDate (deprecated)
        # * filterableCustomFields (deprecated)
        # * unindexedCustomFields (deprecated)
        # Corresponds to the JSON property `updateJobFields`
        # @return [String]
        attr_accessor :update_job_fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_street_address_resolution = args[:disable_street_address_resolution] if args.key?(:disable_street_address_resolution)
          @job = args[:job] if args.key?(:job)
          @processing_options = args[:processing_options] if args.key?(:processing_options)
          @update_job_fields = args[:update_job_fields] if args.key?(:update_job_fields)
        end
      end
    end
  end
end
