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
    module PagespeedonlineV5
      
      # 
      class LighthouseAuditResultV5
        include Google::Apis::Core::Hashable
      
        # The description of the audit.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Freeform details section of the audit.
        # Corresponds to the JSON property `details`
        # @return [Hash<String,Object>]
        attr_accessor :details
      
        # The value that should be displayed on the UI for this audit.
        # Corresponds to the JSON property `displayValue`
        # @return [String]
        attr_accessor :display_value
      
        # An error message from a thrown error inside the audit.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # An explanation of the errors in the audit.
        # Corresponds to the JSON property `explanation`
        # @return [String]
        attr_accessor :explanation
      
        # The audit's id.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `score`
        # @return [Object]
        attr_accessor :score
      
        # The enumerated score display mode.
        # Corresponds to the JSON property `scoreDisplayMode`
        # @return [String]
        attr_accessor :score_display_mode
      
        # The human readable title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # 
        # Corresponds to the JSON property `warnings`
        # @return [Object]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @details = args[:details] if args.key?(:details)
          @display_value = args[:display_value] if args.key?(:display_value)
          @error_message = args[:error_message] if args.key?(:error_message)
          @explanation = args[:explanation] if args.key?(:explanation)
          @id = args[:id] if args.key?(:id)
          @score = args[:score] if args.key?(:score)
          @score_display_mode = args[:score_display_mode] if args.key?(:score_display_mode)
          @title = args[:title] if args.key?(:title)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
      end
      
      # 
      class LighthouseCategoryV5
        include Google::Apis::Core::Hashable
      
        # An array of references to all the audit members of this category.
        # Corresponds to the JSON property `auditRefs`
        # @return [Array<Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::AuditRef>]
        attr_accessor :audit_refs
      
        # A more detailed description of the category and its importance.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The string identifier of the category.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A description for the manual audits in the category.
        # Corresponds to the JSON property `manualDescription`
        # @return [String]
        attr_accessor :manual_description
      
        # 
        # Corresponds to the JSON property `score`
        # @return [Object]
        attr_accessor :score
      
        # The human-friendly name of the category.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_refs = args[:audit_refs] if args.key?(:audit_refs)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @manual_description = args[:manual_description] if args.key?(:manual_description)
          @score = args[:score] if args.key?(:score)
          @title = args[:title] if args.key?(:title)
        end
        
        # 
        class AuditRef
          include Google::Apis::Core::Hashable
        
          # The category group that the audit belongs to (optional).
          # Corresponds to the JSON property `group`
          # @return [String]
          attr_accessor :group
        
          # The audit ref id.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The weight this audit's score has on the overall category score.
          # Corresponds to the JSON property `weight`
          # @return [Float]
          attr_accessor :weight
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @group = args[:group] if args.key?(:group)
            @id = args[:id] if args.key?(:id)
            @weight = args[:weight] if args.key?(:weight)
          end
        end
      end
      
      # 
      class LighthouseResultV5
        include Google::Apis::Core::Hashable
      
        # Map of audits in the LHR.
        # Corresponds to the JSON property `audits`
        # @return [Hash<String,Google::Apis::PagespeedonlineV5::LighthouseAuditResultV5>]
        attr_accessor :audits
      
        # Map of categories in the LHR.
        # Corresponds to the JSON property `categories`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::Categories]
        attr_accessor :categories
      
        # Map of category groups in the LHR.
        # Corresponds to the JSON property `categoryGroups`
        # @return [Hash<String,Google::Apis::PagespeedonlineV5::LighthouseResultV5::CategoryGroup>]
        attr_accessor :category_groups
      
        # The configuration settings for this LHR.
        # Corresponds to the JSON property `configSettings`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::ConfigSettings]
        attr_accessor :config_settings
      
        # Environment settings that were used when making this LHR.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::Environment]
        attr_accessor :environment
      
        # The time that this run was fetched.
        # Corresponds to the JSON property `fetchTime`
        # @return [String]
        attr_accessor :fetch_time
      
        # The final resolved url that was audited.
        # Corresponds to the JSON property `finalUrl`
        # @return [String]
        attr_accessor :final_url
      
        # The internationalization strings that are required to render the LHR.
        # Corresponds to the JSON property `i18n`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n]
        attr_accessor :i18n
      
        # The lighthouse version that was used to generate this LHR.
        # Corresponds to the JSON property `lighthouseVersion`
        # @return [String]
        attr_accessor :lighthouse_version
      
        # The original requested url.
        # Corresponds to the JSON property `requestedUrl`
        # @return [String]
        attr_accessor :requested_url
      
        # List of all run warnings in the LHR. Will always output to at least `[]`.
        # Corresponds to the JSON property `runWarnings`
        # @return [Array<Object>]
        attr_accessor :run_warnings
      
        # A top-level error message that, if present, indicates a serious enough problem
        # that this Lighthouse result may need to be discarded.
        # Corresponds to the JSON property `runtimeError`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::RuntimeError]
        attr_accessor :runtime_error
      
        # The Stack Pack advice strings.
        # Corresponds to the JSON property `stackPacks`
        # @return [Array<Google::Apis::PagespeedonlineV5::LighthouseResultV5::StackPack>]
        attr_accessor :stack_packs
      
        # Timing information for this LHR.
        # Corresponds to the JSON property `timing`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::Timing]
        attr_accessor :timing
      
        # The user agent that was used to run this LHR.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audits = args[:audits] if args.key?(:audits)
          @categories = args[:categories] if args.key?(:categories)
          @category_groups = args[:category_groups] if args.key?(:category_groups)
          @config_settings = args[:config_settings] if args.key?(:config_settings)
          @environment = args[:environment] if args.key?(:environment)
          @fetch_time = args[:fetch_time] if args.key?(:fetch_time)
          @final_url = args[:final_url] if args.key?(:final_url)
          @i18n = args[:i18n] if args.key?(:i18n)
          @lighthouse_version = args[:lighthouse_version] if args.key?(:lighthouse_version)
          @requested_url = args[:requested_url] if args.key?(:requested_url)
          @run_warnings = args[:run_warnings] if args.key?(:run_warnings)
          @runtime_error = args[:runtime_error] if args.key?(:runtime_error)
          @stack_packs = args[:stack_packs] if args.key?(:stack_packs)
          @timing = args[:timing] if args.key?(:timing)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
        end
        
        # Map of categories in the LHR.
        class Categories
          include Google::Apis::Core::Hashable
        
          # The accessibility category, containing all accessibility related audits.
          # Corresponds to the JSON property `accessibility`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseCategoryV5]
          attr_accessor :accessibility
        
          # The best practices category, containing all web best practice related audits.
          # Corresponds to the JSON property `best-practices`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseCategoryV5]
          attr_accessor :best_practices
        
          # The performance category, containing all performance related audits.
          # Corresponds to the JSON property `performance`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseCategoryV5]
          attr_accessor :performance
        
          # The Progressive-Web-App (PWA) category, containing all pwa related audits.
          # Corresponds to the JSON property `pwa`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseCategoryV5]
          attr_accessor :pwa
        
          # The Search-Engine-Optimization (SEO) category, containing all seo related
          # audits.
          # Corresponds to the JSON property `seo`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseCategoryV5]
          attr_accessor :seo
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @accessibility = args[:accessibility] if args.key?(:accessibility)
            @best_practices = args[:best_practices] if args.key?(:best_practices)
            @performance = args[:performance] if args.key?(:performance)
            @pwa = args[:pwa] if args.key?(:pwa)
            @seo = args[:seo] if args.key?(:seo)
          end
        end
        
        # A grouping contained in a category that groups similar audits together.
        class CategoryGroup
          include Google::Apis::Core::Hashable
        
          # An optional human readable description of the category group.
          # Corresponds to the JSON property `description`
          # @return [String]
          attr_accessor :description
        
          # The title of the category group.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @description = args[:description] if args.key?(:description)
            @title = args[:title] if args.key?(:title)
          end
        end
        
        # The configuration settings for this LHR.
        class ConfigSettings
          include Google::Apis::Core::Hashable
        
          # The form factor the emulation should use.
          # Corresponds to the JSON property `emulatedFormFactor`
          # @return [String]
          attr_accessor :emulated_form_factor
        
          # The locale setting.
          # Corresponds to the JSON property `locale`
          # @return [String]
          attr_accessor :locale
        
          # 
          # Corresponds to the JSON property `onlyCategories`
          # @return [Object]
          attr_accessor :only_categories
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @emulated_form_factor = args[:emulated_form_factor] if args.key?(:emulated_form_factor)
            @locale = args[:locale] if args.key?(:locale)
            @only_categories = args[:only_categories] if args.key?(:only_categories)
          end
        end
        
        # Environment settings that were used when making this LHR.
        class Environment
          include Google::Apis::Core::Hashable
        
          # The benchmark index number that indicates rough device class.
          # Corresponds to the JSON property `benchmarkIndex`
          # @return [Float]
          attr_accessor :benchmark_index
        
          # The user agent string of the version of Chrome used.
          # Corresponds to the JSON property `hostUserAgent`
          # @return [String]
          attr_accessor :host_user_agent
        
          # The user agent string that was sent over the network.
          # Corresponds to the JSON property `networkUserAgent`
          # @return [String]
          attr_accessor :network_user_agent
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @benchmark_index = args[:benchmark_index] if args.key?(:benchmark_index)
            @host_user_agent = args[:host_user_agent] if args.key?(:host_user_agent)
            @network_user_agent = args[:network_user_agent] if args.key?(:network_user_agent)
          end
        end
        
        # The internationalization strings that are required to render the LHR.
        class I18n
          include Google::Apis::Core::Hashable
        
          # Internationalized strings that are formatted to the locale in configSettings.
          # Corresponds to the JSON property `rendererFormattedStrings`
          # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n::RendererFormattedStrings]
          attr_accessor :renderer_formatted_strings
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @renderer_formatted_strings = args[:renderer_formatted_strings] if args.key?(:renderer_formatted_strings)
          end
          
          # Internationalized strings that are formatted to the locale in configSettings.
          class RendererFormattedStrings
            include Google::Apis::Core::Hashable
          
            # The tooltip text on an expandable chevron icon.
            # Corresponds to the JSON property `auditGroupExpandTooltip`
            # @return [String]
            attr_accessor :audit_group_expand_tooltip
          
            # The label for the initial request in a critical request chain.
            # Corresponds to the JSON property `crcInitialNavigation`
            # @return [String]
            attr_accessor :crc_initial_navigation
          
            # The label for values shown in the summary of critical request chains.
            # Corresponds to the JSON property `crcLongestDurationLabel`
            # @return [String]
            attr_accessor :crc_longest_duration_label
          
            # The label shown next to an audit or metric that has had an error.
            # Corresponds to the JSON property `errorLabel`
            # @return [String]
            attr_accessor :error_label
          
            # The error string shown next to an erroring audit.
            # Corresponds to the JSON property `errorMissingAuditInfo`
            # @return [String]
            attr_accessor :error_missing_audit_info
          
            # The title of the lab data performance category.
            # Corresponds to the JSON property `labDataTitle`
            # @return [String]
            attr_accessor :lab_data_title
          
            # The disclaimer shown under performance explaning that the network can vary.
            # Corresponds to the JSON property `lsPerformanceCategoryDescription`
            # @return [String]
            attr_accessor :ls_performance_category_description
          
            # The heading shown above a list of audits that were not computerd in the run.
            # Corresponds to the JSON property `manualAuditsGroupTitle`
            # @return [String]
            attr_accessor :manual_audits_group_title
          
            # The heading shown above a list of audits that do not apply to a page.
            # Corresponds to the JSON property `notApplicableAuditsGroupTitle`
            # @return [String]
            attr_accessor :not_applicable_audits_group_title
          
            # The heading for the estimated page load savings opportunity of an audit.
            # Corresponds to the JSON property `opportunityResourceColumnLabel`
            # @return [String]
            attr_accessor :opportunity_resource_column_label
          
            # The heading for the estimated page load savings of opportunity audits.
            # Corresponds to the JSON property `opportunitySavingsColumnLabel`
            # @return [String]
            attr_accessor :opportunity_savings_column_label
          
            # The heading that is shown above a list of audits that are passing.
            # Corresponds to the JSON property `passedAuditsGroupTitle`
            # @return [String]
            attr_accessor :passed_audits_group_title
          
            # The label that explains the score gauges scale (0-49, 50-89, 90-100).
            # Corresponds to the JSON property `scorescaleLabel`
            # @return [String]
            attr_accessor :scorescale_label
          
            # The label shown preceding important warnings that may have invalidated an
            # entire report.
            # Corresponds to the JSON property `toplevelWarningsMessage`
            # @return [String]
            attr_accessor :toplevel_warnings_message
          
            # The disclaimer shown below a performance metric value.
            # Corresponds to the JSON property `varianceDisclaimer`
            # @return [String]
            attr_accessor :variance_disclaimer
          
            # The label shown above a bulleted list of warnings.
            # Corresponds to the JSON property `warningHeader`
            # @return [String]
            attr_accessor :warning_header
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @audit_group_expand_tooltip = args[:audit_group_expand_tooltip] if args.key?(:audit_group_expand_tooltip)
              @crc_initial_navigation = args[:crc_initial_navigation] if args.key?(:crc_initial_navigation)
              @crc_longest_duration_label = args[:crc_longest_duration_label] if args.key?(:crc_longest_duration_label)
              @error_label = args[:error_label] if args.key?(:error_label)
              @error_missing_audit_info = args[:error_missing_audit_info] if args.key?(:error_missing_audit_info)
              @lab_data_title = args[:lab_data_title] if args.key?(:lab_data_title)
              @ls_performance_category_description = args[:ls_performance_category_description] if args.key?(:ls_performance_category_description)
              @manual_audits_group_title = args[:manual_audits_group_title] if args.key?(:manual_audits_group_title)
              @not_applicable_audits_group_title = args[:not_applicable_audits_group_title] if args.key?(:not_applicable_audits_group_title)
              @opportunity_resource_column_label = args[:opportunity_resource_column_label] if args.key?(:opportunity_resource_column_label)
              @opportunity_savings_column_label = args[:opportunity_savings_column_label] if args.key?(:opportunity_savings_column_label)
              @passed_audits_group_title = args[:passed_audits_group_title] if args.key?(:passed_audits_group_title)
              @scorescale_label = args[:scorescale_label] if args.key?(:scorescale_label)
              @toplevel_warnings_message = args[:toplevel_warnings_message] if args.key?(:toplevel_warnings_message)
              @variance_disclaimer = args[:variance_disclaimer] if args.key?(:variance_disclaimer)
              @warning_header = args[:warning_header] if args.key?(:warning_header)
            end
          end
        end
        
        # A top-level error message that, if present, indicates a serious enough problem
        # that this Lighthouse result may need to be discarded.
        class RuntimeError
          include Google::Apis::Core::Hashable
        
          # The enumerated Lighthouse Error code.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # A human readable message explaining the error code.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @message = args[:message] if args.key?(:message)
          end
        end
        
        # 
        class StackPack
          include Google::Apis::Core::Hashable
        
          # The stack pack advice strings.
          # Corresponds to the JSON property `descriptions`
          # @return [Hash<String,String>]
          attr_accessor :descriptions
        
          # The stack pack icon data uri.
          # Corresponds to the JSON property `iconDataURL`
          # @return [String]
          attr_accessor :icon_data_url
        
          # The stack pack id.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The stack pack title.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @descriptions = args[:descriptions] if args.key?(:descriptions)
            @icon_data_url = args[:icon_data_url] if args.key?(:icon_data_url)
            @id = args[:id] if args.key?(:id)
            @title = args[:title] if args.key?(:title)
          end
        end
        
        # Timing information for this LHR.
        class Timing
          include Google::Apis::Core::Hashable
        
          # The total duration of Lighthouse's run.
          # Corresponds to the JSON property `total`
          # @return [Float]
          attr_accessor :total
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @total = args[:total] if args.key?(:total)
          end
        end
      end
      
      # 
      class PagespeedApiLoadingExperienceV5
        include Google::Apis::Core::Hashable
      
        # The url, pattern or origin which the metrics are on.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `initial_url`
        # @return [String]
        attr_accessor :initial_url
      
        # 
        # Corresponds to the JSON property `metrics`
        # @return [Hash<String,Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric>]
        attr_accessor :metrics
      
        # 
        # Corresponds to the JSON property `overall_category`
        # @return [String]
        attr_accessor :overall_category
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @initial_url = args[:initial_url] if args.key?(:initial_url)
          @metrics = args[:metrics] if args.key?(:metrics)
          @overall_category = args[:overall_category] if args.key?(:overall_category)
        end
        
        # The type of the metric.
        class Metric
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `category`
          # @return [String]
          attr_accessor :category
        
          # 
          # Corresponds to the JSON property `distributions`
          # @return [Array<Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric::Distribution>]
          attr_accessor :distributions
        
          # 
          # Corresponds to the JSON property `percentile`
          # @return [Fixnum]
          attr_accessor :percentile
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @category = args[:category] if args.key?(:category)
            @distributions = args[:distributions] if args.key?(:distributions)
            @percentile = args[:percentile] if args.key?(:percentile)
          end
          
          # 
          class Distribution
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `max`
            # @return [Fixnum]
            attr_accessor :max
          
            # 
            # Corresponds to the JSON property `min`
            # @return [Fixnum]
            attr_accessor :min
          
            # 
            # Corresponds to the JSON property `proportion`
            # @return [Float]
            attr_accessor :proportion
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @max = args[:max] if args.key?(:max)
              @min = args[:min] if args.key?(:min)
              @proportion = args[:proportion] if args.key?(:proportion)
            end
          end
        end
      end
      
      # 
      class PagespeedApiPagespeedResponseV5
        include Google::Apis::Core::Hashable
      
        # The UTC timestamp of this analysis.
        # Corresponds to the JSON property `analysisUTCTimestamp`
        # @return [String]
        attr_accessor :analysis_utc_timestamp
      
        # The captcha verify result
        # Corresponds to the JSON property `captchaResult`
        # @return [String]
        attr_accessor :captcha_result
      
        # Canonicalized and final URL for the document, after following page redirects (
        # if any).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Kind of result.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Lighthouse response for the audit url as an object.
        # Corresponds to the JSON property `lighthouseResult`
        # @return [Google::Apis::PagespeedonlineV5::LighthouseResultV5]
        attr_accessor :lighthouse_result
      
        # Metrics of end users' page loading experience.
        # Corresponds to the JSON property `loadingExperience`
        # @return [Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5]
        attr_accessor :loading_experience
      
        # Metrics of the aggregated page loading experience of the origin
        # Corresponds to the JSON property `originLoadingExperience`
        # @return [Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5]
        attr_accessor :origin_loading_experience
      
        # The version of PageSpeed used to generate these results.
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::PagespeedonlineV5::PagespeedApiPagespeedResponseV5::Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analysis_utc_timestamp = args[:analysis_utc_timestamp] if args.key?(:analysis_utc_timestamp)
          @captcha_result = args[:captcha_result] if args.key?(:captcha_result)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @lighthouse_result = args[:lighthouse_result] if args.key?(:lighthouse_result)
          @loading_experience = args[:loading_experience] if args.key?(:loading_experience)
          @origin_loading_experience = args[:origin_loading_experience] if args.key?(:origin_loading_experience)
          @version = args[:version] if args.key?(:version)
        end
        
        # The version of PageSpeed used to generate these results.
        class Version
          include Google::Apis::Core::Hashable
        
          # The major version number of PageSpeed used to generate these results.
          # Corresponds to the JSON property `major`
          # @return [Fixnum]
          attr_accessor :major
        
          # The minor version number of PageSpeed used to generate these results.
          # Corresponds to the JSON property `minor`
          # @return [Fixnum]
          attr_accessor :minor
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @major = args[:major] if args.key?(:major)
            @minor = args[:minor] if args.key?(:minor)
          end
        end
      end
    end
  end
end
