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
      
      class LighthouseAuditResultV5
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LighthouseCategoryV5
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AuditRef
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LighthouseResultV5
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Categories
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class CategoryGroup
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ConfigSettings
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Environment
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class I18n
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class RendererFormattedStrings
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class RuntimeError
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class StackPack
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Timing
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PagespeedApiLoadingExperienceV5
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Metric
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Distribution
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PagespeedApiPagespeedResponseV5
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Version
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LighthouseAuditResultV5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          hash :details, as: 'details'
          property :display_value, as: 'displayValue'
          property :error_message, as: 'errorMessage'
          property :explanation, as: 'explanation'
          property :id, as: 'id'
          property :score, as: 'score'
          property :score_display_mode, as: 'scoreDisplayMode'
          property :title, as: 'title'
          property :warnings, as: 'warnings'
        end
      end
      
      class LighthouseCategoryV5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_refs, as: 'auditRefs', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::AuditRef, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::AuditRef::Representation
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :manual_description, as: 'manualDescription'
          property :score, as: 'score'
          property :title, as: 'title'
        end
        
        class AuditRef
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :group, as: 'group'
            property :id, as: 'id'
            property :weight, as: 'weight'
          end
        end
      end
      
      class LighthouseResultV5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :audits, as: 'audits', class: Google::Apis::PagespeedonlineV5::LighthouseAuditResultV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseAuditResultV5::Representation
      
          property :categories, as: 'categories', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Categories, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Categories::Representation
      
          hash :category_groups, as: 'categoryGroups', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::CategoryGroup, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::CategoryGroup::Representation
      
          property :config_settings, as: 'configSettings', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::ConfigSettings, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::ConfigSettings::Representation
      
          property :environment, as: 'environment', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Environment, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Environment::Representation
      
          property :fetch_time, as: 'fetchTime'
          property :final_url, as: 'finalUrl'
          property :i18n, as: 'i18n', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n::Representation
      
          property :lighthouse_version, as: 'lighthouseVersion'
          property :requested_url, as: 'requestedUrl'
          collection :run_warnings, as: 'runWarnings'
          property :runtime_error, as: 'runtimeError', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::RuntimeError, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::RuntimeError::Representation
      
          collection :stack_packs, as: 'stackPacks', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::StackPack, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::StackPack::Representation
      
          property :timing, as: 'timing', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Timing, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Timing::Representation
      
          property :user_agent, as: 'userAgent'
        end
        
        class Categories
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :accessibility, as: 'accessibility', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::Representation
        
            property :best_practices, as: 'best-practices', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::Representation
        
            property :performance, as: 'performance', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::Representation
        
            property :pwa, as: 'pwa', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::Representation
        
            property :seo, as: 'seo', class: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseCategoryV5::Representation
        
          end
        end
        
        class CategoryGroup
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :description, as: 'description'
            property :title, as: 'title'
          end
        end
        
        class ConfigSettings
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :emulated_form_factor, as: 'emulatedFormFactor'
            property :locale, as: 'locale'
            property :only_categories, as: 'onlyCategories'
          end
        end
        
        class Environment
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :benchmark_index, as: 'benchmarkIndex'
            property :host_user_agent, as: 'hostUserAgent'
            property :network_user_agent, as: 'networkUserAgent'
          end
        end
        
        class I18n
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :renderer_formatted_strings, as: 'rendererFormattedStrings', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n::RendererFormattedStrings, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::I18n::RendererFormattedStrings::Representation
        
          end
          
          class RendererFormattedStrings
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :audit_group_expand_tooltip, as: 'auditGroupExpandTooltip'
              property :crc_initial_navigation, as: 'crcInitialNavigation'
              property :crc_longest_duration_label, as: 'crcLongestDurationLabel'
              property :error_label, as: 'errorLabel'
              property :error_missing_audit_info, as: 'errorMissingAuditInfo'
              property :lab_data_title, as: 'labDataTitle'
              property :ls_performance_category_description, as: 'lsPerformanceCategoryDescription'
              property :manual_audits_group_title, as: 'manualAuditsGroupTitle'
              property :not_applicable_audits_group_title, as: 'notApplicableAuditsGroupTitle'
              property :opportunity_resource_column_label, as: 'opportunityResourceColumnLabel'
              property :opportunity_savings_column_label, as: 'opportunitySavingsColumnLabel'
              property :passed_audits_group_title, as: 'passedAuditsGroupTitle'
              property :scorescale_label, as: 'scorescaleLabel'
              property :toplevel_warnings_message, as: 'toplevelWarningsMessage'
              property :variance_disclaimer, as: 'varianceDisclaimer'
              property :warning_header, as: 'warningHeader'
            end
          end
        end
        
        class RuntimeError
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            property :message, as: 'message'
          end
        end
        
        class StackPack
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            hash :descriptions, as: 'descriptions'
            property :icon_data_url, as: 'iconDataURL'
            property :id, as: 'id'
            property :title, as: 'title'
          end
        end
        
        class Timing
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :total, as: 'total'
          end
        end
      end
      
      class PagespeedApiLoadingExperienceV5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :initial_url, as: 'initial_url'
          hash :metrics, as: 'metrics', class: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric, decorator: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric::Representation
      
          property :overall_category, as: 'overall_category'
        end
        
        class Metric
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :category, as: 'category'
            collection :distributions, as: 'distributions', class: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric::Distribution, decorator: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Metric::Distribution::Representation
        
            property :percentile, as: 'percentile'
          end
          
          class Distribution
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :max, as: 'max'
              property :min, as: 'min'
              property :proportion, as: 'proportion'
            end
          end
        end
      end
      
      class PagespeedApiPagespeedResponseV5
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analysis_utc_timestamp, as: 'analysisUTCTimestamp'
          property :captcha_result, as: 'captchaResult'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :lighthouse_result, as: 'lighthouseResult', class: Google::Apis::PagespeedonlineV5::LighthouseResultV5, decorator: Google::Apis::PagespeedonlineV5::LighthouseResultV5::Representation
      
          property :loading_experience, as: 'loadingExperience', class: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5, decorator: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Representation
      
          property :origin_loading_experience, as: 'originLoadingExperience', class: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5, decorator: Google::Apis::PagespeedonlineV5::PagespeedApiLoadingExperienceV5::Representation
      
          property :version, as: 'version', class: Google::Apis::PagespeedonlineV5::PagespeedApiPagespeedResponseV5::Version, decorator: Google::Apis::PagespeedonlineV5::PagespeedApiPagespeedResponseV5::Version::Representation
      
        end
        
        class Version
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :major, as: 'major'
            property :minor, as: 'minor'
          end
        end
      end
    end
  end
end
