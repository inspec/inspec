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
    module FactchecktoolsV1alpha1
      
      class GoogleFactcheckingFactchecktoolsV1alpha1Claim
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1Publisher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleProtobufEmpty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1Claim
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :claim_date, as: 'claimDate'
          collection :claim_review, as: 'claimReview', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview::Representation
      
          property :claimant, as: 'claimant'
          property :text, as: 'text'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_url, as: 'imageUrl'
          property :job_title, as: 'jobTitle'
          property :name, as: 'name'
          property :same_as, as: 'sameAs'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :best_rating, as: 'bestRating'
          property :image_url, as: 'imageUrl'
          property :rating_explanation, as: 'ratingExplanation'
          property :rating_value, as: 'ratingValue'
          property :textual_rating, as: 'textualRating'
          property :worst_rating, as: 'worstRating'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language_code, as: 'languageCode'
          property :publisher, as: 'publisher', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Publisher, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Publisher::Representation
      
          property :review_date, as: 'reviewDate'
          property :textual_rating, as: 'textualRating'
          property :title, as: 'title'
          property :url, as: 'url'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_url, as: 'imageUrl'
          property :name, as: 'name'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :claim_appearances, as: 'claimAppearances'
          property :claim_author, as: 'claimAuthor', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor::Representation
      
          property :claim_date, as: 'claimDate'
          property :claim_first_appearance, as: 'claimFirstAppearance'
          property :claim_location, as: 'claimLocation'
          property :claim_reviewed, as: 'claimReviewed'
          property :rating, as: 'rating', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating::Representation
      
          property :url, as: 'url'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :claim_review_author, as: 'claimReviewAuthor', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor::Representation
      
          collection :claim_review_markups, as: 'claimReviewMarkups', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup::Representation
      
          property :name, as: 'name'
          property :page_url, as: 'pageUrl'
          property :publish_date, as: 'publishDate'
          property :version_id, as: 'versionId'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :claims, as: 'claims', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Claim, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Claim::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :claim_review_markup_pages, as: 'claimReviewMarkupPages', class: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage, decorator: Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleFactcheckingFactchecktoolsV1alpha1Publisher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :site, as: 'site'
        end
      end
      
      class GoogleProtobufEmpty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
    end
  end
end
