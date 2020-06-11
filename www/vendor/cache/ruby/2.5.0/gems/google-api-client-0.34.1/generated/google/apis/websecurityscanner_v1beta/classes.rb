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
    module WebsecurityscannerV1beta
      
      # Scan authentication configuration.
      class Authentication
        include Google::Apis::Core::Hashable
      
        # Describes authentication configuration that uses a custom account.
        # Corresponds to the JSON property `customAccount`
        # @return [Google::Apis::WebsecurityscannerV1beta::CustomAccount]
        attr_accessor :custom_account
      
        # Describes authentication configuration that uses a Google account.
        # Corresponds to the JSON property `googleAccount`
        # @return [Google::Apis::WebsecurityscannerV1beta::GoogleAccount]
        attr_accessor :google_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_account = args[:custom_account] if args.key?(:custom_account)
          @google_account = args[:google_account] if args.key?(:google_account)
        end
      end
      
      # A CrawledUrl resource represents a URL that was crawled during a ScanRun. Web
      # Security Scanner Service crawls the web applications, following all links
      # within the scope of sites, to find the URLs to test against.
      class CrawledUrl
        include Google::Apis::Core::Hashable
      
        # The body of the request that was used to visit the URL.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # The http method of the request that was used to visit the URL, in
        # uppercase.
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # The URL that was crawled.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @http_method = args[:http_method] if args.key?(:http_method)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Describes authentication configuration that uses a custom account.
      class CustomAccount
        include Google::Apis::Core::Hashable
      
        # Required. The login form URL of the website.
        # Corresponds to the JSON property `loginUrl`
        # @return [String]
        attr_accessor :login_url
      
        # Required. Input only. The password of the custom account. The credential is
        # stored encrypted
        # and not returned in any response nor included in audit logs.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # Required. The user name of the custom account.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @login_url = args[:login_url] if args.key?(:login_url)
          @password = args[:password] if args.key?(:password)
          @username = args[:username] if args.key?(:username)
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
      
      # A Finding resource represents a vulnerability instance identified during a
      # ScanRun.
      class Finding
        include Google::Apis::Core::Hashable
      
        # The body of the request that triggered the vulnerability.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # The description of the vulnerability.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The URL where the browser lands when the vulnerability is detected.
        # Corresponds to the JSON property `finalUrl`
        # @return [String]
        attr_accessor :final_url
      
        # The type of the Finding.
        # Detailed and up-to-date information on findings can be found here:
        # https://cloud.google.com/security-scanner/docs/scan-result-details
        # Corresponds to the JSON property `findingType`
        # @return [String]
        attr_accessor :finding_type
      
        # ! Information about a vulnerability with an HTML.
        # Corresponds to the JSON property `form`
        # @return [Google::Apis::WebsecurityscannerV1beta::Form]
        attr_accessor :form
      
        # If the vulnerability was originated from nested IFrame, the immediate
        # parent IFrame is reported.
        # Corresponds to the JSON property `frameUrl`
        # @return [String]
        attr_accessor :frame_url
      
        # The URL produced by the server-side fuzzer and used in the request that
        # triggered the vulnerability.
        # Corresponds to the JSON property `fuzzedUrl`
        # @return [String]
        attr_accessor :fuzzed_url
      
        # The http method of the request that triggered the vulnerability, in
        # uppercase.
        # Corresponds to the JSON property `httpMethod`
        # @return [String]
        attr_accessor :http_method
      
        # The resource name of the Finding. The name follows the format of
        # 'projects/`projectId`/scanConfigs/`scanConfigId`/scanruns/`scanRunId`/findings/
        # `findingId`'.
        # The finding IDs are generated by the system.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Information reported for an outdated library.
        # Corresponds to the JSON property `outdatedLibrary`
        # @return [Google::Apis::WebsecurityscannerV1beta::OutdatedLibrary]
        attr_accessor :outdated_library
      
        # The URL containing human-readable payload that user can leverage to
        # reproduce the vulnerability.
        # Corresponds to the JSON property `reproductionUrl`
        # @return [String]
        attr_accessor :reproduction_url
      
        # The tracking ID uniquely identifies a vulnerability instance across
        # multiple ScanRuns.
        # Corresponds to the JSON property `trackingId`
        # @return [String]
        attr_accessor :tracking_id
      
        # Information regarding any resource causing the vulnerability such
        # as JavaScript sources, image, audio files, etc.
        # Corresponds to the JSON property `violatingResource`
        # @return [Google::Apis::WebsecurityscannerV1beta::ViolatingResource]
        attr_accessor :violating_resource
      
        # Information about vulnerable or missing HTTP Headers.
        # Corresponds to the JSON property `vulnerableHeaders`
        # @return [Google::Apis::WebsecurityscannerV1beta::VulnerableHeaders]
        attr_accessor :vulnerable_headers
      
        # Information about vulnerable request parameters.
        # Corresponds to the JSON property `vulnerableParameters`
        # @return [Google::Apis::WebsecurityscannerV1beta::VulnerableParameters]
        attr_accessor :vulnerable_parameters
      
        # Information reported for an XSS.
        # Corresponds to the JSON property `xss`
        # @return [Google::Apis::WebsecurityscannerV1beta::Xss]
        attr_accessor :xss
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @description = args[:description] if args.key?(:description)
          @final_url = args[:final_url] if args.key?(:final_url)
          @finding_type = args[:finding_type] if args.key?(:finding_type)
          @form = args[:form] if args.key?(:form)
          @frame_url = args[:frame_url] if args.key?(:frame_url)
          @fuzzed_url = args[:fuzzed_url] if args.key?(:fuzzed_url)
          @http_method = args[:http_method] if args.key?(:http_method)
          @name = args[:name] if args.key?(:name)
          @outdated_library = args[:outdated_library] if args.key?(:outdated_library)
          @reproduction_url = args[:reproduction_url] if args.key?(:reproduction_url)
          @tracking_id = args[:tracking_id] if args.key?(:tracking_id)
          @violating_resource = args[:violating_resource] if args.key?(:violating_resource)
          @vulnerable_headers = args[:vulnerable_headers] if args.key?(:vulnerable_headers)
          @vulnerable_parameters = args[:vulnerable_parameters] if args.key?(:vulnerable_parameters)
          @xss = args[:xss] if args.key?(:xss)
        end
      end
      
      # A FindingTypeStats resource represents stats regarding a specific FindingType
      # of Findings under a given ScanRun.
      class FindingTypeStats
        include Google::Apis::Core::Hashable
      
        # The count of findings belonging to this finding type.
        # Corresponds to the JSON property `findingCount`
        # @return [Fixnum]
        attr_accessor :finding_count
      
        # The finding type associated with the stats.
        # Corresponds to the JSON property `findingType`
        # @return [String]
        attr_accessor :finding_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finding_count = args[:finding_count] if args.key?(:finding_count)
          @finding_type = args[:finding_type] if args.key?(:finding_type)
        end
      end
      
      # ! Information about a vulnerability with an HTML.
      class Form
        include Google::Apis::Core::Hashable
      
        # ! The URI where to send the form when it's submitted.
        # Corresponds to the JSON property `actionUri`
        # @return [String]
        attr_accessor :action_uri
      
        # ! The names of form fields related to the vulnerability.
        # Corresponds to the JSON property `fields`
        # @return [Array<String>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_uri = args[:action_uri] if args.key?(:action_uri)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # Describes authentication configuration that uses a Google account.
      class GoogleAccount
        include Google::Apis::Core::Hashable
      
        # Required. Input only. The password of the Google account. The credential is
        # stored encrypted
        # and not returned in any response nor included in audit logs.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # Required. The user name of the Google account.
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
      
      # Describes a HTTP Header.
      class Header
        include Google::Apis::Core::Hashable
      
        # Header name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Header value.
        # Corresponds to the JSON property `value`
        # @return [String]
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
      
      # Response for the `ListCrawledUrls` method.
      class ListCrawledUrlsResponse
        include Google::Apis::Core::Hashable
      
        # The list of CrawledUrls returned.
        # Corresponds to the JSON property `crawledUrls`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::CrawledUrl>]
        attr_accessor :crawled_urls
      
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
          @crawled_urls = args[:crawled_urls] if args.key?(:crawled_urls)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response for the `ListFindingTypeStats` method.
      class ListFindingTypeStatsResponse
        include Google::Apis::Core::Hashable
      
        # The list of FindingTypeStats returned.
        # Corresponds to the JSON property `findingTypeStats`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::FindingTypeStats>]
        attr_accessor :finding_type_stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @finding_type_stats = args[:finding_type_stats] if args.key?(:finding_type_stats)
        end
      end
      
      # Response for the `ListFindings` method.
      class ListFindingsResponse
        include Google::Apis::Core::Hashable
      
        # The list of Findings returned.
        # Corresponds to the JSON property `findings`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::Finding>]
        attr_accessor :findings
      
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
          @findings = args[:findings] if args.key?(:findings)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response for the `ListScanConfigs` method.
      class ListScanConfigsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of ScanConfigs returned.
        # Corresponds to the JSON property `scanConfigs`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::ScanConfig>]
        attr_accessor :scan_configs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @scan_configs = args[:scan_configs] if args.key?(:scan_configs)
        end
      end
      
      # Response for the `ListScanRuns` method.
      class ListScanRunsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of ScanRuns returned.
        # Corresponds to the JSON property `scanRuns`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::ScanRun>]
        attr_accessor :scan_runs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @scan_runs = args[:scan_runs] if args.key?(:scan_runs)
        end
      end
      
      # Information reported for an outdated library.
      class OutdatedLibrary
        include Google::Apis::Core::Hashable
      
        # URLs to learn more information about the vulnerabilities in the library.
        # Corresponds to the JSON property `learnMoreUrls`
        # @return [Array<String>]
        attr_accessor :learn_more_urls
      
        # The name of the outdated library.
        # Corresponds to the JSON property `libraryName`
        # @return [String]
        attr_accessor :library_name
      
        # The version number.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @learn_more_urls = args[:learn_more_urls] if args.key?(:learn_more_urls)
          @library_name = args[:library_name] if args.key?(:library_name)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A ScanConfig resource contains the configurations to launch a scan.
      class ScanConfig
        include Google::Apis::Core::Hashable
      
        # Scan authentication configuration.
        # Corresponds to the JSON property `authentication`
        # @return [Google::Apis::WebsecurityscannerV1beta::Authentication]
        attr_accessor :authentication
      
        # The blacklist URL patterns as described in
        # https://cloud.google.com/security-scanner/docs/excluded-urls
        # Corresponds to the JSON property `blacklistPatterns`
        # @return [Array<String>]
        attr_accessor :blacklist_patterns
      
        # Required. The user provided display name of the ScanConfig.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Controls export of scan configurations and results to Cloud Security
        # Command Center.
        # Corresponds to the JSON property `exportToSecurityCommandCenter`
        # @return [String]
        attr_accessor :export_to_security_command_center
      
        # A ScanRun is a output-only resource representing an actual run of the scan.
        # Next id: 12
        # Corresponds to the JSON property `latestRun`
        # @return [Google::Apis::WebsecurityscannerV1beta::ScanRun]
        attr_accessor :latest_run
      
        # The maximum QPS during scanning. A valid value ranges from 5 to 20
        # inclusively. If the field is unspecified or its value is set 0, server will
        # default to 15. Other values outside of [5, 20] range will be rejected with
        # INVALID_ARGUMENT error.
        # Corresponds to the JSON property `maxQps`
        # @return [Fixnum]
        attr_accessor :max_qps
      
        # The resource name of the ScanConfig. The name follows the format of
        # 'projects/`projectId`/scanConfigs/`scanConfigId`'. The ScanConfig IDs are
        # generated by the system.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The risk level selected for the scan
        # Corresponds to the JSON property `riskLevel`
        # @return [String]
        attr_accessor :risk_level
      
        # Scan schedule configuration.
        # Corresponds to the JSON property `schedule`
        # @return [Google::Apis::WebsecurityscannerV1beta::Schedule]
        attr_accessor :schedule
      
        # Required. The starting URLs from which the scanner finds site pages.
        # Corresponds to the JSON property `startingUrls`
        # @return [Array<String>]
        attr_accessor :starting_urls
      
        # Set of Cloud Platforms targeted by the scan. If empty, APP_ENGINE will be
        # used as a default.
        # Corresponds to the JSON property `targetPlatforms`
        # @return [Array<String>]
        attr_accessor :target_platforms
      
        # The user agent used during scanning.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authentication = args[:authentication] if args.key?(:authentication)
          @blacklist_patterns = args[:blacklist_patterns] if args.key?(:blacklist_patterns)
          @display_name = args[:display_name] if args.key?(:display_name)
          @export_to_security_command_center = args[:export_to_security_command_center] if args.key?(:export_to_security_command_center)
          @latest_run = args[:latest_run] if args.key?(:latest_run)
          @max_qps = args[:max_qps] if args.key?(:max_qps)
          @name = args[:name] if args.key?(:name)
          @risk_level = args[:risk_level] if args.key?(:risk_level)
          @schedule = args[:schedule] if args.key?(:schedule)
          @starting_urls = args[:starting_urls] if args.key?(:starting_urls)
          @target_platforms = args[:target_platforms] if args.key?(:target_platforms)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
        end
      end
      
      # Defines a custom error message used by CreateScanConfig and UpdateScanConfig
      # APIs when scan configuration validation fails. It is also reported as part of
      # a ScanRunErrorTrace message if scan validation fails due to a scan
      # configuration error.
      class ScanConfigError
        include Google::Apis::Core::Hashable
      
        # Indicates the reason code for a configuration failure.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Indicates the full name of the ScanConfig field that triggers this error,
        # for example "scan_config.max_qps". This field is provided for
        # troubleshooting purposes only and its actual value can change in the
        # future.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @field_name = args[:field_name] if args.key?(:field_name)
        end
      end
      
      # A ScanRun is a output-only resource representing an actual run of the scan.
      # Next id: 12
      class ScanRun
        include Google::Apis::Core::Hashable
      
        # The time at which the ScanRun reached termination state - that the ScanRun
        # is either finished or stopped by user.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only.
        # Defines an error trace message for a ScanRun.
        # Corresponds to the JSON property `errorTrace`
        # @return [Google::Apis::WebsecurityscannerV1beta::ScanRunErrorTrace]
        attr_accessor :error_trace
      
        # The execution state of the ScanRun.
        # Corresponds to the JSON property `executionState`
        # @return [String]
        attr_accessor :execution_state
      
        # Whether the scan run has found any vulnerabilities.
        # Corresponds to the JSON property `hasVulnerabilities`
        # @return [Boolean]
        attr_accessor :has_vulnerabilities
        alias_method :has_vulnerabilities?, :has_vulnerabilities
      
        # The resource name of the ScanRun. The name follows the format of
        # 'projects/`projectId`/scanConfigs/`scanConfigId`/scanRuns/`scanRunId`'.
        # The ScanRun IDs are generated by the system.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The percentage of total completion ranging from 0 to 100.
        # If the scan is in queue, the value is 0.
        # If the scan is running, the value ranges from 0 to 100.
        # If the scan is finished, the value is 100.
        # Corresponds to the JSON property `progressPercent`
        # @return [Fixnum]
        attr_accessor :progress_percent
      
        # The result state of the ScanRun. This field is only available after the
        # execution state reaches "FINISHED".
        # Corresponds to the JSON property `resultState`
        # @return [String]
        attr_accessor :result_state
      
        # The time at which the ScanRun started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The number of URLs crawled during this ScanRun. If the scan is in progress,
        # the value represents the number of URLs crawled up to now.
        # Corresponds to the JSON property `urlsCrawledCount`
        # @return [Fixnum]
        attr_accessor :urls_crawled_count
      
        # The number of URLs tested during this ScanRun. If the scan is in progress,
        # the value represents the number of URLs tested up to now. The number of
        # URLs tested is usually larger than the number URLS crawled because
        # typically a crawled URL is tested with multiple test payloads.
        # Corresponds to the JSON property `urlsTestedCount`
        # @return [Fixnum]
        attr_accessor :urls_tested_count
      
        # A list of warnings, if such are encountered during this scan run.
        # Corresponds to the JSON property `warningTraces`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::ScanRunWarningTrace>]
        attr_accessor :warning_traces
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error_trace = args[:error_trace] if args.key?(:error_trace)
          @execution_state = args[:execution_state] if args.key?(:execution_state)
          @has_vulnerabilities = args[:has_vulnerabilities] if args.key?(:has_vulnerabilities)
          @name = args[:name] if args.key?(:name)
          @progress_percent = args[:progress_percent] if args.key?(:progress_percent)
          @result_state = args[:result_state] if args.key?(:result_state)
          @start_time = args[:start_time] if args.key?(:start_time)
          @urls_crawled_count = args[:urls_crawled_count] if args.key?(:urls_crawled_count)
          @urls_tested_count = args[:urls_tested_count] if args.key?(:urls_tested_count)
          @warning_traces = args[:warning_traces] if args.key?(:warning_traces)
        end
      end
      
      # Output only.
      # Defines an error trace message for a ScanRun.
      class ScanRunErrorTrace
        include Google::Apis::Core::Hashable
      
        # Indicates the error reason code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # If the scan encounters TOO_MANY_HTTP_ERRORS, this field indicates the most
        # common HTTP error code, if such is available. For example, if this code is
        # 404, the scan has encountered too many NOT_FOUND responses.
        # Corresponds to the JSON property `mostCommonHttpErrorCode`
        # @return [Fixnum]
        attr_accessor :most_common_http_error_code
      
        # Defines a custom error message used by CreateScanConfig and UpdateScanConfig
        # APIs when scan configuration validation fails. It is also reported as part of
        # a ScanRunErrorTrace message if scan validation fails due to a scan
        # configuration error.
        # Corresponds to the JSON property `scanConfigError`
        # @return [Google::Apis::WebsecurityscannerV1beta::ScanConfigError]
        attr_accessor :scan_config_error
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @most_common_http_error_code = args[:most_common_http_error_code] if args.key?(:most_common_http_error_code)
          @scan_config_error = args[:scan_config_error] if args.key?(:scan_config_error)
        end
      end
      
      # Output only.
      # Defines a warning trace message for ScanRun. Warning traces provide customers
      # with useful information that helps make the scanning process more effective.
      class ScanRunWarningTrace
        include Google::Apis::Core::Hashable
      
        # Indicates the warning code.
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
      
      # Scan schedule configuration.
      class Schedule
        include Google::Apis::Core::Hashable
      
        # Required. The duration of time between executions in days.
        # Corresponds to the JSON property `intervalDurationDays`
        # @return [Fixnum]
        attr_accessor :interval_duration_days
      
        # A timestamp indicates when the next run will be scheduled. The value is
        # refreshed by the server after each run. If unspecified, it will default
        # to current server time, which means the scan will be scheduled to start
        # immediately.
        # Corresponds to the JSON property `scheduleTime`
        # @return [String]
        attr_accessor :schedule_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @interval_duration_days = args[:interval_duration_days] if args.key?(:interval_duration_days)
          @schedule_time = args[:schedule_time] if args.key?(:schedule_time)
        end
      end
      
      # Request for the `StartScanRun` method.
      class StartScanRunRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request for the `StopScanRun` method.
      class StopScanRunRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Information regarding any resource causing the vulnerability such
      # as JavaScript sources, image, audio files, etc.
      class ViolatingResource
        include Google::Apis::Core::Hashable
      
        # The MIME type of this resource.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # URL of this violating resource.
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
        end
      end
      
      # Information about vulnerable or missing HTTP Headers.
      class VulnerableHeaders
        include Google::Apis::Core::Hashable
      
        # List of vulnerable headers.
        # Corresponds to the JSON property `headers`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::Header>]
        attr_accessor :headers
      
        # List of missing headers.
        # Corresponds to the JSON property `missingHeaders`
        # @return [Array<Google::Apis::WebsecurityscannerV1beta::Header>]
        attr_accessor :missing_headers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @headers = args[:headers] if args.key?(:headers)
          @missing_headers = args[:missing_headers] if args.key?(:missing_headers)
        end
      end
      
      # Information about vulnerable request parameters.
      class VulnerableParameters
        include Google::Apis::Core::Hashable
      
        # The vulnerable parameter names.
        # Corresponds to the JSON property `parameterNames`
        # @return [Array<String>]
        attr_accessor :parameter_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parameter_names = args[:parameter_names] if args.key?(:parameter_names)
        end
      end
      
      # Information reported for an XSS.
      class Xss
        include Google::Apis::Core::Hashable
      
        # An error message generated by a javascript breakage.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # Stack traces leading to the point where the XSS occurred.
        # Corresponds to the JSON property `stackTraces`
        # @return [Array<String>]
        attr_accessor :stack_traces
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @stack_traces = args[:stack_traces] if args.key?(:stack_traces)
        end
      end
    end
  end
end
