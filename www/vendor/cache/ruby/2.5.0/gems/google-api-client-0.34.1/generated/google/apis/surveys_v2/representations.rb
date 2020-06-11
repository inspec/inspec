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
    module SurveysV2
      
      class FieldMask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultsGetRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultsMask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Survey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyAudience
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyCost
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyQuestion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyQuestionImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyRejection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveyResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveysDeleteResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveysListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveysStartRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveysStartResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SurveysStopResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TokenPagination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FieldMask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::SurveysV2::FieldMask, decorator: Google::Apis::SurveysV2::FieldMask::Representation
      
          property :id, as: 'id'
        end
      end
      
      class PageInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result_per_page, as: 'resultPerPage'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
        end
      end
      
      class ResultsGetRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result_mask, as: 'resultMask', class: Google::Apis::SurveysV2::ResultsMask, decorator: Google::Apis::SurveysV2::ResultsMask::Representation
      
        end
      end
      
      class ResultsMask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::SurveysV2::FieldMask, decorator: Google::Apis::SurveysV2::FieldMask::Representation
      
          property :projection, as: 'projection'
        end
      end
      
      class Survey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audience, as: 'audience', class: Google::Apis::SurveysV2::SurveyAudience, decorator: Google::Apis::SurveysV2::SurveyAudience::Representation
      
          property :cost, as: 'cost', class: Google::Apis::SurveysV2::SurveyCost, decorator: Google::Apis::SurveysV2::SurveyCost::Representation
      
          property :customer_data, :base64 => true, as: 'customerData'
          property :description, as: 'description'
          collection :owners, as: 'owners'
          collection :questions, as: 'questions', class: Google::Apis::SurveysV2::SurveyQuestion, decorator: Google::Apis::SurveysV2::SurveyQuestion::Representation
      
          property :rejection_reason, as: 'rejectionReason', class: Google::Apis::SurveysV2::SurveyRejection, decorator: Google::Apis::SurveysV2::SurveyRejection::Representation
      
          property :state, as: 'state'
          property :survey_url_id, as: 'surveyUrlId'
          property :title, as: 'title'
          property :wanted_response_count, as: 'wantedResponseCount'
        end
      end
      
      class SurveyAudience
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ages, as: 'ages'
          property :country, as: 'country'
          property :country_subdivision, as: 'countrySubdivision'
          property :gender, as: 'gender'
          collection :languages, as: 'languages'
          property :population_source, as: 'populationSource'
        end
      end
      
      class SurveyCost
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cost_per_response_nanos, :numeric_string => true, as: 'costPerResponseNanos'
          property :currency_code, as: 'currencyCode'
          property :max_cost_per_response_nanos, :numeric_string => true, as: 'maxCostPerResponseNanos'
          property :nanos, :numeric_string => true, as: 'nanos'
        end
      end
      
      class SurveyQuestion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :answer_order, as: 'answerOrder'
          collection :answers, as: 'answers'
          property :has_other, as: 'hasOther'
          property :high_value_label, as: 'highValueLabel'
          collection :images, as: 'images', class: Google::Apis::SurveysV2::SurveyQuestionImage, decorator: Google::Apis::SurveysV2::SurveyQuestionImage::Representation
      
          property :last_answer_position_pinned, as: 'lastAnswerPositionPinned'
          property :low_value_label, as: 'lowValueLabel'
          property :must_pick_suggestion, as: 'mustPickSuggestion'
          property :num_stars, as: 'numStars'
          property :open_text_placeholder, as: 'openTextPlaceholder'
          collection :open_text_suggestions, as: 'openTextSuggestions'
          property :question, as: 'question'
          property :sentiment_text, as: 'sentimentText'
          property :single_line_response, as: 'singleLineResponse'
          collection :threshold_answers, as: 'thresholdAnswers'
          property :type, as: 'type'
          property :unit_of_measurement_label, as: 'unitOfMeasurementLabel'
          property :video_id, as: 'videoId'
        end
      end
      
      class SurveyQuestionImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alt_text, as: 'altText'
          property :data, :base64 => true, as: 'data'
          property :url, as: 'url'
        end
      end
      
      class SurveyRejection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :explanation, as: 'explanation'
          property :type, as: 'type'
        end
      end
      
      class SurveyResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :status, as: 'status'
          property :survey_url_id, as: 'surveyUrlId'
        end
      end
      
      class SurveysDeleteResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_id, as: 'requestId'
        end
      end
      
      class SurveysListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_info, as: 'pageInfo', class: Google::Apis::SurveysV2::PageInfo, decorator: Google::Apis::SurveysV2::PageInfo::Representation
      
          property :request_id, as: 'requestId'
          collection :resources, as: 'resources', class: Google::Apis::SurveysV2::Survey, decorator: Google::Apis::SurveysV2::Survey::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::SurveysV2::TokenPagination, decorator: Google::Apis::SurveysV2::TokenPagination::Representation
      
        end
      end
      
      class SurveysStartRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_cost_per_response_nanos, :numeric_string => true, as: 'maxCostPerResponseNanos'
        end
      end
      
      class SurveysStartResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_id, as: 'requestId'
        end
      end
      
      class SurveysStopResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_id, as: 'requestId'
        end
      end
      
      class TokenPagination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          property :previous_page_token, as: 'previousPageToken'
        end
      end
    end
  end
end
