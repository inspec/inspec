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
    module WebsecurityscannerV1alpha
      
      class Authentication
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CrawledUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Finding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindingTypeStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Header
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCrawledUrlsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFindingTypeStatsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFindingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListScanConfigsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListScanRunsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutdatedLibrary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScanConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScanRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Schedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StartScanRunRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StopScanRunRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ViolatingResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerableHeaders
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerableParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Xss
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Authentication
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_account, as: 'customAccount', class: Google::Apis::WebsecurityscannerV1alpha::CustomAccount, decorator: Google::Apis::WebsecurityscannerV1alpha::CustomAccount::Representation
      
          property :google_account, as: 'googleAccount', class: Google::Apis::WebsecurityscannerV1alpha::GoogleAccount, decorator: Google::Apis::WebsecurityscannerV1alpha::GoogleAccount::Representation
      
        end
      end
      
      class CrawledUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          property :http_method, as: 'httpMethod'
          property :url, as: 'url'
        end
      end
      
      class CustomAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :login_url, as: 'loginUrl'
          property :password, as: 'password'
          property :username, as: 'username'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Finding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          property :description, as: 'description'
          property :final_url, as: 'finalUrl'
          property :finding_type, as: 'findingType'
          property :frame_url, as: 'frameUrl'
          property :fuzzed_url, as: 'fuzzedUrl'
          property :http_method, as: 'httpMethod'
          property :name, as: 'name'
          property :outdated_library, as: 'outdatedLibrary', class: Google::Apis::WebsecurityscannerV1alpha::OutdatedLibrary, decorator: Google::Apis::WebsecurityscannerV1alpha::OutdatedLibrary::Representation
      
          property :reproduction_url, as: 'reproductionUrl'
          property :tracking_id, as: 'trackingId'
          property :violating_resource, as: 'violatingResource', class: Google::Apis::WebsecurityscannerV1alpha::ViolatingResource, decorator: Google::Apis::WebsecurityscannerV1alpha::ViolatingResource::Representation
      
          property :vulnerable_headers, as: 'vulnerableHeaders', class: Google::Apis::WebsecurityscannerV1alpha::VulnerableHeaders, decorator: Google::Apis::WebsecurityscannerV1alpha::VulnerableHeaders::Representation
      
          property :vulnerable_parameters, as: 'vulnerableParameters', class: Google::Apis::WebsecurityscannerV1alpha::VulnerableParameters, decorator: Google::Apis::WebsecurityscannerV1alpha::VulnerableParameters::Representation
      
          property :xss, as: 'xss', class: Google::Apis::WebsecurityscannerV1alpha::Xss, decorator: Google::Apis::WebsecurityscannerV1alpha::Xss::Representation
      
        end
      end
      
      class FindingTypeStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :finding_count, as: 'findingCount'
          property :finding_type, as: 'findingType'
        end
      end
      
      class GoogleAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :password, as: 'password'
          property :username, as: 'username'
        end
      end
      
      class Header
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class ListCrawledUrlsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :crawled_urls, as: 'crawledUrls', class: Google::Apis::WebsecurityscannerV1alpha::CrawledUrl, decorator: Google::Apis::WebsecurityscannerV1alpha::CrawledUrl::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListFindingTypeStatsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :finding_type_stats, as: 'findingTypeStats', class: Google::Apis::WebsecurityscannerV1alpha::FindingTypeStats, decorator: Google::Apis::WebsecurityscannerV1alpha::FindingTypeStats::Representation
      
        end
      end
      
      class ListFindingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :findings, as: 'findings', class: Google::Apis::WebsecurityscannerV1alpha::Finding, decorator: Google::Apis::WebsecurityscannerV1alpha::Finding::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListScanConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :scan_configs, as: 'scanConfigs', class: Google::Apis::WebsecurityscannerV1alpha::ScanConfig, decorator: Google::Apis::WebsecurityscannerV1alpha::ScanConfig::Representation
      
        end
      end
      
      class ListScanRunsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :scan_runs, as: 'scanRuns', class: Google::Apis::WebsecurityscannerV1alpha::ScanRun, decorator: Google::Apis::WebsecurityscannerV1alpha::ScanRun::Representation
      
        end
      end
      
      class OutdatedLibrary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :learn_more_urls, as: 'learnMoreUrls'
          property :library_name, as: 'libraryName'
          property :version, as: 'version'
        end
      end
      
      class ScanConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authentication, as: 'authentication', class: Google::Apis::WebsecurityscannerV1alpha::Authentication, decorator: Google::Apis::WebsecurityscannerV1alpha::Authentication::Representation
      
          collection :blacklist_patterns, as: 'blacklistPatterns'
          property :display_name, as: 'displayName'
          property :latest_run, as: 'latestRun', class: Google::Apis::WebsecurityscannerV1alpha::ScanRun, decorator: Google::Apis::WebsecurityscannerV1alpha::ScanRun::Representation
      
          property :max_qps, as: 'maxQps'
          property :name, as: 'name'
          property :schedule, as: 'schedule', class: Google::Apis::WebsecurityscannerV1alpha::Schedule, decorator: Google::Apis::WebsecurityscannerV1alpha::Schedule::Representation
      
          collection :starting_urls, as: 'startingUrls'
          collection :target_platforms, as: 'targetPlatforms'
          property :user_agent, as: 'userAgent'
        end
      end
      
      class ScanRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :execution_state, as: 'executionState'
          property :has_vulnerabilities, as: 'hasVulnerabilities'
          property :name, as: 'name'
          property :progress_percent, as: 'progressPercent'
          property :result_state, as: 'resultState'
          property :start_time, as: 'startTime'
          property :urls_crawled_count, :numeric_string => true, as: 'urlsCrawledCount'
          property :urls_tested_count, :numeric_string => true, as: 'urlsTestedCount'
        end
      end
      
      class Schedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :interval_duration_days, as: 'intervalDurationDays'
          property :schedule_time, as: 'scheduleTime'
        end
      end
      
      class StartScanRunRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class StopScanRunRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ViolatingResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :resource_url, as: 'resourceUrl'
        end
      end
      
      class VulnerableHeaders
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :headers, as: 'headers', class: Google::Apis::WebsecurityscannerV1alpha::Header, decorator: Google::Apis::WebsecurityscannerV1alpha::Header::Representation
      
          collection :missing_headers, as: 'missingHeaders', class: Google::Apis::WebsecurityscannerV1alpha::Header, decorator: Google::Apis::WebsecurityscannerV1alpha::Header::Representation
      
        end
      end
      
      class VulnerableParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :parameter_names, as: 'parameterNames'
        end
      end
      
      class Xss
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message, as: 'errorMessage'
          collection :stack_traces, as: 'stackTraces'
        end
      end
    end
  end
end
