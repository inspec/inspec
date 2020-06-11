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
      
      # 
      class FieldMask
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::SurveysV2::FieldMask>]
        attr_accessor :fields
      
        # 
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # 
      class PageInfo
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `resultPerPage`
        # @return [Fixnum]
        attr_accessor :result_per_page
      
        # 
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # 
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result_per_page = args[:result_per_page] if args.key?(:result_per_page)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # 
      class ResultsGetRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `resultMask`
        # @return [Google::Apis::SurveysV2::ResultsMask]
        attr_accessor :result_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result_mask = args[:result_mask] if args.key?(:result_mask)
        end
      end
      
      # 
      class ResultsMask
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::SurveysV2::FieldMask>]
        attr_accessor :fields
      
        # 
        # Corresponds to the JSON property `projection`
        # @return [String]
        attr_accessor :projection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @projection = args[:projection] if args.key?(:projection)
        end
      end
      
      # Representation of an individual survey object.
      class Survey
        include Google::Apis::Core::Hashable
      
        # Specifications for the target audience of a survey run through the API.
        # Corresponds to the JSON property `audience`
        # @return [Google::Apis::SurveysV2::SurveyAudience]
        attr_accessor :audience
      
        # Message defining the cost to run a given survey through API.
        # Corresponds to the JSON property `cost`
        # @return [Google::Apis::SurveysV2::SurveyCost]
        attr_accessor :cost
      
        # Additional information to store on behalf of the API consumer and associate
        # with this question. This binary blob is treated as opaque. This field is
        # limited to 64K bytes.
        # Corresponds to the JSON property `customerData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :customer_data
      
        # Text description of the survey.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # List of email addresses for survey owners. Must contain at least the address
        # of the user making the API call.
        # Corresponds to the JSON property `owners`
        # @return [Array<String>]
        attr_accessor :owners
      
        # List of questions defining the survey.
        # Corresponds to the JSON property `questions`
        # @return [Array<Google::Apis::SurveysV2::SurveyQuestion>]
        attr_accessor :questions
      
        # Message representing why the survey was rejected from review, if it was.
        # Corresponds to the JSON property `rejectionReason`
        # @return [Google::Apis::SurveysV2::SurveyRejection]
        attr_accessor :rejection_reason
      
        # State that the survey is in.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Unique survey ID, that is viewable in the URL of the Survey Creator UI
        # Corresponds to the JSON property `surveyUrlId`
        # @return [String]
        attr_accessor :survey_url_id
      
        # Optional name that will be given to the survey.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Number of responses desired for the survey.
        # Corresponds to the JSON property `wantedResponseCount`
        # @return [Fixnum]
        attr_accessor :wanted_response_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audience = args[:audience] if args.key?(:audience)
          @cost = args[:cost] if args.key?(:cost)
          @customer_data = args[:customer_data] if args.key?(:customer_data)
          @description = args[:description] if args.key?(:description)
          @owners = args[:owners] if args.key?(:owners)
          @questions = args[:questions] if args.key?(:questions)
          @rejection_reason = args[:rejection_reason] if args.key?(:rejection_reason)
          @state = args[:state] if args.key?(:state)
          @survey_url_id = args[:survey_url_id] if args.key?(:survey_url_id)
          @title = args[:title] if args.key?(:title)
          @wanted_response_count = args[:wanted_response_count] if args.key?(:wanted_response_count)
        end
      end
      
      # Specifications for the target audience of a survey run through the API.
      class SurveyAudience
        include Google::Apis::Core::Hashable
      
        # Optional list of age buckets to target. Supported age buckets are: ['18-24', '
        # 25-34', '35-44', '45-54', '55-64', '65+']
        # Corresponds to the JSON property `ages`
        # @return [Array<String>]
        attr_accessor :ages
      
        # Required country code that surveys should be targeted to. Accepts standard ISO
        # 3166-1 2 character language codes. For instance, 'US' for the United States,
        # and 'GB' for the United Kingdom.
        # Corresponds to the JSON property `country`
        # @return [String]
        attr_accessor :country
      
        # Country subdivision (states/provinces/etc) that surveys should be targeted to.
        # For all countries except GB, ISO-3166-2 subdivision code is required (eg. 'US-
        # OH' for Ohio, United States). For GB, NUTS 1 statistical region codes for the
        # United Kingdom is required (eg. 'UK-UKC' for North East England).
        # Corresponds to the JSON property `countrySubdivision`
        # @return [String]
        attr_accessor :country_subdivision
      
        # Optional gender to target.
        # Corresponds to the JSON property `gender`
        # @return [String]
        attr_accessor :gender
      
        # Language code that surveys should be targeted to. For instance, 'en-US'.
        # Surveys may target bilingual users by specifying a list of language codes (for
        # example, 'de' and 'en-US'). In that case, all languages will be used for
        # targeting users but the survey content (which is displayed) must match the
        # first language listed. Accepts standard BCP47 language codes. See
        # specification.
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        # Online population source where the respondents are sampled from.
        # Corresponds to the JSON property `populationSource`
        # @return [String]
        attr_accessor :population_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ages = args[:ages] if args.key?(:ages)
          @country = args[:country] if args.key?(:country)
          @country_subdivision = args[:country_subdivision] if args.key?(:country_subdivision)
          @gender = args[:gender] if args.key?(:gender)
          @languages = args[:languages] if args.key?(:languages)
          @population_source = args[:population_source] if args.key?(:population_source)
        end
      end
      
      # Message defining the cost to run a given survey through API.
      class SurveyCost
        include Google::Apis::Core::Hashable
      
        # Cost per survey response in nano units of the given currency. To get the total
        # cost for a survey, multiply this value by wanted_response_count.
        # Corresponds to the JSON property `costPerResponseNanos`
        # @return [Fixnum]
        attr_accessor :cost_per_response_nanos
      
        # Currency code that the cost is given in.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # *Deprecated* Threshold to start a survey automatically if the quoted price is
        # at most this value. When a survey has a Screener (threshold) question, it must
        # go through an incidence pricing test to determine the final cost per response.
        # Typically you will have to make a followup call to start the survey giving the
        # final computed cost per response. If the survey has no threshold_answers,
        # setting this property will return an error. By specifying this property, you
        # indicate the max price per response you are willing to pay in advance of the
        # incidence test. If the price turns out to be lower than the specified value,
        # the survey will begin immediately and you will be charged at the rate
        # determined by the incidence pricing test. If the price turns out to be greater
        # than the specified value the survey will not be started and you will instead
        # be notified what price was determined by the incidence test. At that point,
        # you must raise the value of this property to be greater than or equal to that
        # cost before attempting to start the survey again. This will immediately start
        # the survey as long the incidence test was run within the last 21 days. This
        # will no longer be available after June 2018.
        # Corresponds to the JSON property `maxCostPerResponseNanos`
        # @return [Fixnum]
        attr_accessor :max_cost_per_response_nanos
      
        # Cost of survey in nano units of the given currency. DEPRECATED in favor of
        # cost_per_response_nanos
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cost_per_response_nanos = args[:cost_per_response_nanos] if args.key?(:cost_per_response_nanos)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @max_cost_per_response_nanos = args[:max_cost_per_response_nanos] if args.key?(:max_cost_per_response_nanos)
          @nanos = args[:nanos] if args.key?(:nanos)
        end
      end
      
      # Message defining the question specifications.
      class SurveyQuestion
        include Google::Apis::Core::Hashable
      
        # The randomization option for multiple choice and multi-select questions. If
        # not specified, this option defaults to randomize.
        # Corresponds to the JSON property `answerOrder`
        # @return [String]
        attr_accessor :answer_order
      
        # Required list of answer options for a question.
        # Corresponds to the JSON property `answers`
        # @return [Array<String>]
        attr_accessor :answers
      
        # Option to allow open-ended text box for Single Answer and Multiple Answer
        # question types. This can be used with SINGLE_ANSWER, SINGLE_ANSWER_WITH_IMAGE,
        # MULTIPLE_ANSWERS, and MULTIPLE_ANSWERS_WITH_IMAGE question types.
        # Corresponds to the JSON property `hasOther`
        # @return [Boolean]
        attr_accessor :has_other
        alias_method :has_other?, :has_other
      
        # For rating questions, the text for the higher end of the scale, such as 'Best'.
        # For numeric questions, a string representing a floating-point that is the
        # maximum allowed number for a response.
        # Corresponds to the JSON property `highValueLabel`
        # @return [String]
        attr_accessor :high_value_label
      
        # 
        # Corresponds to the JSON property `images`
        # @return [Array<Google::Apis::SurveysV2::SurveyQuestionImage>]
        attr_accessor :images
      
        # Currently only support pinning an answer option to the last position.
        # Corresponds to the JSON property `lastAnswerPositionPinned`
        # @return [Boolean]
        attr_accessor :last_answer_position_pinned
        alias_method :last_answer_position_pinned?, :last_answer_position_pinned
      
        # For rating questions, the text for the lower end of the scale, such as 'Worst'.
        # For numeric questions, a string representing a floating-point that is the
        # minimum allowed number for a response.
        # Corresponds to the JSON property `lowValueLabel`
        # @return [String]
        attr_accessor :low_value_label
      
        # Option to force the user to pick one of the open text suggestions. This
        # requires that suggestions are provided for this question.
        # Corresponds to the JSON property `mustPickSuggestion`
        # @return [Boolean]
        attr_accessor :must_pick_suggestion
        alias_method :must_pick_suggestion?, :must_pick_suggestion
      
        # Number of stars to use for ratings questions.
        # Corresponds to the JSON property `numStars`
        # @return [String]
        attr_accessor :num_stars
      
        # Placeholder text for an open text question.
        # Corresponds to the JSON property `openTextPlaceholder`
        # @return [String]
        attr_accessor :open_text_placeholder
      
        # A list of suggested answers for open text question auto-complete. This is only
        # valid if single_line_response is true.
        # Corresponds to the JSON property `openTextSuggestions`
        # @return [Array<String>]
        attr_accessor :open_text_suggestions
      
        # Required question text shown to the respondent.
        # Corresponds to the JSON property `question`
        # @return [String]
        attr_accessor :question
      
        # Used by the Rating Scale with Text question type. This text goes along with
        # the question field that is presented to the respondent, and is the actual text
        # that the respondent is asked to rate.
        # Corresponds to the JSON property `sentimentText`
        # @return [String]
        attr_accessor :sentiment_text
      
        # Option to allow multiple line open text responses instead of a single line
        # response. Note that we don't show auto-complete suggestions with multiple line
        # responses.
        # Corresponds to the JSON property `singleLineResponse`
        # @return [Boolean]
        attr_accessor :single_line_response
        alias_method :single_line_response?, :single_line_response
      
        # The threshold/screener answer options, which will screen a user into the rest
        # of the survey. These will be a subset of the answer option strings.
        # Corresponds to the JSON property `thresholdAnswers`
        # @return [Array<String>]
        attr_accessor :threshold_answers
      
        # Required field defining the question type. For details about configuring
        # different type of questions, consult the question configuration guide.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Optional unit of measurement for display (for example: hours, people, miles).
        # Corresponds to the JSON property `unitOfMeasurementLabel`
        # @return [String]
        attr_accessor :unit_of_measurement_label
      
        # The YouTube video ID to be show in video questions.
        # Corresponds to the JSON property `videoId`
        # @return [String]
        attr_accessor :video_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_order = args[:answer_order] if args.key?(:answer_order)
          @answers = args[:answers] if args.key?(:answers)
          @has_other = args[:has_other] if args.key?(:has_other)
          @high_value_label = args[:high_value_label] if args.key?(:high_value_label)
          @images = args[:images] if args.key?(:images)
          @last_answer_position_pinned = args[:last_answer_position_pinned] if args.key?(:last_answer_position_pinned)
          @low_value_label = args[:low_value_label] if args.key?(:low_value_label)
          @must_pick_suggestion = args[:must_pick_suggestion] if args.key?(:must_pick_suggestion)
          @num_stars = args[:num_stars] if args.key?(:num_stars)
          @open_text_placeholder = args[:open_text_placeholder] if args.key?(:open_text_placeholder)
          @open_text_suggestions = args[:open_text_suggestions] if args.key?(:open_text_suggestions)
          @question = args[:question] if args.key?(:question)
          @sentiment_text = args[:sentiment_text] if args.key?(:sentiment_text)
          @single_line_response = args[:single_line_response] if args.key?(:single_line_response)
          @threshold_answers = args[:threshold_answers] if args.key?(:threshold_answers)
          @type = args[:type] if args.key?(:type)
          @unit_of_measurement_label = args[:unit_of_measurement_label] if args.key?(:unit_of_measurement_label)
          @video_id = args[:video_id] if args.key?(:video_id)
        end
      end
      
      # Container object for image data and alt_text.
      class SurveyQuestionImage
        include Google::Apis::Core::Hashable
      
        # The alt text property used in image tags is required for all images.
        # Corresponds to the JSON property `altText`
        # @return [String]
        attr_accessor :alt_text
      
        # Inline jpeg, gif, tiff, bmp, or png image raw bytes for an image question
        # types.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # The read-only URL for the hosted images.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alt_text = args[:alt_text] if args.key?(:alt_text)
          @data = args[:data] if args.key?(:data)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Message representing why the survey was rejected from review, if it was.
      class SurveyRejection
        include Google::Apis::Core::Hashable
      
        # A human-readable explanation of what was wrong with the survey.
        # Corresponds to the JSON property `explanation`
        # @return [String]
        attr_accessor :explanation
      
        # Which category of rejection this was. See the  Google Surveys Help Center for
        # additional details on each category.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explanation = args[:explanation] if args.key?(:explanation)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Reference to the current results for a given survey.
      class SurveyResults
        include Google::Apis::Core::Hashable
      
        # Human readable string describing the status of the request.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # External survey ID as viewable by survey owners in the editor view.
        # Corresponds to the JSON property `surveyUrlId`
        # @return [String]
        attr_accessor :survey_url_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @status = args[:status] if args.key?(:status)
          @survey_url_id = args[:survey_url_id] if args.key?(:survey_url_id)
        end
      end
      
      # 
      class SurveysDeleteResponse
        include Google::Apis::Core::Hashable
      
        # Unique request ID used for logging and debugging. Please include in any error
        # reporting or troubleshooting requests.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # 
      class SurveysListResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::SurveysV2::PageInfo]
        attr_accessor :page_info
      
        # Unique request ID used for logging and debugging. Please include in any error
        # reporting or troubleshooting requests.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        # An individual survey resource.
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::SurveysV2::Survey>]
        attr_accessor :resources
      
        # 
        # Corresponds to the JSON property `tokenPagination`
        # @return [Google::Apis::SurveysV2::TokenPagination]
        attr_accessor :token_pagination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_info = args[:page_info] if args.key?(:page_info)
          @request_id = args[:request_id] if args.key?(:request_id)
          @resources = args[:resources] if args.key?(:resources)
          @token_pagination = args[:token_pagination] if args.key?(:token_pagination)
        end
      end
      
      # 
      class SurveysStartRequest
        include Google::Apis::Core::Hashable
      
        # *Deprecated* Threshold to start a survey automatically if the quoted prices is
        # less than or equal to this value. See Survey.Cost for more details. This will
        # no longer be available after June 2018.
        # Corresponds to the JSON property `maxCostPerResponseNanos`
        # @return [Fixnum]
        attr_accessor :max_cost_per_response_nanos
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_cost_per_response_nanos = args[:max_cost_per_response_nanos] if args.key?(:max_cost_per_response_nanos)
        end
      end
      
      # 
      class SurveysStartResponse
        include Google::Apis::Core::Hashable
      
        # Unique request ID used for logging and debugging. Please include in any error
        # reporting or troubleshooting requests.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # 
      class SurveysStopResponse
        include Google::Apis::Core::Hashable
      
        # Unique request ID used for logging and debugging. Please include in any error
        # reporting or troubleshooting requests.
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # 
      class TokenPagination
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `previousPageToken`
        # @return [String]
        attr_accessor :previous_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @previous_page_token = args[:previous_page_token] if args.key?(:previous_page_token)
        end
      end
    end
  end
end
