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
      
      # Information about the claim.
      class GoogleFactcheckingFactchecktoolsV1alpha1Claim
        include Google::Apis::Core::Hashable
      
        # The date that the claim was made.
        # Corresponds to the JSON property `claimDate`
        # @return [String]
        attr_accessor :claim_date
      
        # One or more reviews of this claim (namely, a fact-checking article).
        # Corresponds to the JSON property `claimReview`
        # @return [Array<Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview>]
        attr_accessor :claim_review
      
        # A person or organization stating the claim. For instance, "John Doe".
        # Corresponds to the JSON property `claimant`
        # @return [String]
        attr_accessor :claimant
      
        # The claim text. For instance, "Crime has doubled in the last 2 years."
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim_date = args[:claim_date] if args.key?(:claim_date)
          @claim_review = args[:claim_review] if args.key?(:claim_review)
          @claimant = args[:claimant] if args.key?(:claimant)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Information about the claim author.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor
        include Google::Apis::Core::Hashable
      
        # Corresponds to `ClaimReview.itemReviewed.author.image`.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # Corresponds to `ClaimReview.itemReviewed.author.jobTitle`.
        # Corresponds to the JSON property `jobTitle`
        # @return [String]
        attr_accessor :job_title
      
        # A person or organization stating the claim. For instance, "John Doe".<br>
        # Corresponds to `ClaimReview.itemReviewed.author.name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Corresponds to `ClaimReview.itemReviewed.author.sameAs`.
        # Corresponds to the JSON property `sameAs`
        # @return [String]
        attr_accessor :same_as
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_url = args[:image_url] if args.key?(:image_url)
          @job_title = args[:job_title] if args.key?(:job_title)
          @name = args[:name] if args.key?(:name)
          @same_as = args[:same_as] if args.key?(:same_as)
        end
      end
      
      # Information about the claim rating.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating
        include Google::Apis::Core::Hashable
      
        # For numeric ratings, the best value possible in the scale from worst to
        # best.<br>
        # Corresponds to `ClaimReview.reviewRating.bestRating`.
        # Corresponds to the JSON property `bestRating`
        # @return [Fixnum]
        attr_accessor :best_rating
      
        # Corresponds to `ClaimReview.reviewRating.image`.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # Corresponds to `ClaimReview.reviewRating.ratingExplanation`.
        # Corresponds to the JSON property `ratingExplanation`
        # @return [String]
        attr_accessor :rating_explanation
      
        # A numeric rating of this claim, in the range worstRating — bestRating
        # inclusive.<br>
        # Corresponds to `ClaimReview.reviewRating.ratingValue`.
        # Corresponds to the JSON property `ratingValue`
        # @return [Fixnum]
        attr_accessor :rating_value
      
        # The truthfulness rating as a human-readible short word or phrase.<br>
        # Corresponds to `ClaimReview.reviewRating.alternateName`.
        # Corresponds to the JSON property `textualRating`
        # @return [String]
        attr_accessor :textual_rating
      
        # For numeric ratings, the worst value possible in the scale from worst to
        # best.<br>
        # Corresponds to `ClaimReview.reviewRating.worstRating`.
        # Corresponds to the JSON property `worstRating`
        # @return [Fixnum]
        attr_accessor :worst_rating
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_rating = args[:best_rating] if args.key?(:best_rating)
          @image_url = args[:image_url] if args.key?(:image_url)
          @rating_explanation = args[:rating_explanation] if args.key?(:rating_explanation)
          @rating_value = args[:rating_value] if args.key?(:rating_value)
          @textual_rating = args[:textual_rating] if args.key?(:textual_rating)
          @worst_rating = args[:worst_rating] if args.key?(:worst_rating)
        end
      end
      
      # Information about a claim review.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReview
        include Google::Apis::Core::Hashable
      
        # The language this review was written in. For instance, "en" or "de".
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Information about the publisher.
        # Corresponds to the JSON property `publisher`
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Publisher]
        attr_accessor :publisher
      
        # The date the claim was reviewed.
        # Corresponds to the JSON property `reviewDate`
        # @return [String]
        attr_accessor :review_date
      
        # Textual rating. For instance, "Mostly false".
        # Corresponds to the JSON property `textualRating`
        # @return [String]
        attr_accessor :textual_rating
      
        # The title of this claim review, if it can be determined.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The URL of this claim review.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language_code = args[:language_code] if args.key?(:language_code)
          @publisher = args[:publisher] if args.key?(:publisher)
          @review_date = args[:review_date] if args.key?(:review_date)
          @textual_rating = args[:textual_rating] if args.key?(:textual_rating)
          @title = args[:title] if args.key?(:title)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Information about the claim review author.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor
        include Google::Apis::Core::Hashable
      
        # Corresponds to `ClaimReview.author.image`.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # Name of the organization that is publishing the fact check.<br>
        # Corresponds to `ClaimReview.author.name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_url = args[:image_url] if args.key?(:image_url)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Fields for an individual `ClaimReview` element.
      # Except for sub-messages that group fields together, each of these fields
      # correspond those in https://schema.org/ClaimReview. We list the precise
      # mapping for each field.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup
        include Google::Apis::Core::Hashable
      
        # A list of links to works in which this claim appears, aside from the one
        # specified in `claim_first_appearance`.<br>
        # Corresponds to `ClaimReview.itemReviewed[@type=Claim].appearance.url`.
        # Corresponds to the JSON property `claimAppearances`
        # @return [Array<String>]
        attr_accessor :claim_appearances
      
        # Information about the claim author.
        # Corresponds to the JSON property `claimAuthor`
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimAuthor]
        attr_accessor :claim_author
      
        # The date when the claim was made or entered public discourse.<br>
        # Corresponds to `ClaimReview.itemReviewed.datePublished`.
        # Corresponds to the JSON property `claimDate`
        # @return [String]
        attr_accessor :claim_date
      
        # A link to a work in which this claim first appears.<br>
        # Corresponds to `ClaimReview.itemReviewed[@type=Claim].firstAppearance.url`.
        # Corresponds to the JSON property `claimFirstAppearance`
        # @return [String]
        attr_accessor :claim_first_appearance
      
        # The location where this claim was made.<br>
        # Corresponds to `ClaimReview.itemReviewed.name`.
        # Corresponds to the JSON property `claimLocation`
        # @return [String]
        attr_accessor :claim_location
      
        # A short summary of the claim being evaluated.<br>
        # Corresponds to `ClaimReview.claimReviewed`.
        # Corresponds to the JSON property `claimReviewed`
        # @return [String]
        attr_accessor :claim_reviewed
      
        # Information about the claim rating.
        # Corresponds to the JSON property `rating`
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimRating]
        attr_accessor :rating
      
        # This field is optional, and will default to the page URL. We provide this
        # field to allow you the override the default value, but the only permitted
        # override is the page URL plus an optional anchor link ("page jump").<br>
        # Corresponds to `ClaimReview.url`
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim_appearances = args[:claim_appearances] if args.key?(:claim_appearances)
          @claim_author = args[:claim_author] if args.key?(:claim_author)
          @claim_date = args[:claim_date] if args.key?(:claim_date)
          @claim_first_appearance = args[:claim_first_appearance] if args.key?(:claim_first_appearance)
          @claim_location = args[:claim_location] if args.key?(:claim_location)
          @claim_reviewed = args[:claim_reviewed] if args.key?(:claim_reviewed)
          @rating = args[:rating] if args.key?(:rating)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Holds one or more instances of `ClaimReview` markup for a webpage.
      class GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage
        include Google::Apis::Core::Hashable
      
        # Information about the claim review author.
        # Corresponds to the JSON property `claimReviewAuthor`
        # @return [Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewAuthor]
        attr_accessor :claim_review_author
      
        # A list of individual claim reviews for this page.
        # Each item in the list corresponds to one `ClaimReview` element.
        # Corresponds to the JSON property `claimReviewMarkups`
        # @return [Array<Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkup>]
        attr_accessor :claim_review_markups
      
        # The name of this `ClaimReview` markup page resource, in the form of
        # `pages/`page_id``. Except for update requests, this field is output-only
        # and should not be set by the user.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The URL of the page associated with this `ClaimReview` markup.
        # While every individual `ClaimReview` has its own URL field, semantically
        # this is a page-level field, and each `ClaimReview` on this page will use
        # this value unless individually overridden.<br>
        # Corresponds to `ClaimReview.url`
        # Corresponds to the JSON property `pageUrl`
        # @return [String]
        attr_accessor :page_url
      
        # The date when the fact check was published.
        # Similar to the URL, semantically this is a page-level field, and each
        # `ClaimReview` on this page will contain the same value.<br>
        # Corresponds to `ClaimReview.datePublished`
        # Corresponds to the JSON property `publishDate`
        # @return [String]
        attr_accessor :publish_date
      
        # The version ID for this markup. Except for update requests, this field is
        # output-only and should not be set by the user.
        # Corresponds to the JSON property `versionId`
        # @return [String]
        attr_accessor :version_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim_review_author = args[:claim_review_author] if args.key?(:claim_review_author)
          @claim_review_markups = args[:claim_review_markups] if args.key?(:claim_review_markups)
          @name = args[:name] if args.key?(:name)
          @page_url = args[:page_url] if args.key?(:page_url)
          @publish_date = args[:publish_date] if args.key?(:publish_date)
          @version_id = args[:version_id] if args.key?(:version_id)
        end
      end
      
      # Response from searching fact-checked claims.
      class GoogleFactcheckingFactchecktoolsV1alpha1FactCheckedClaimSearchResponse
        include Google::Apis::Core::Hashable
      
        # The list of claims and all of their associated information.
        # Corresponds to the JSON property `claims`
        # @return [Array<Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1Claim>]
        attr_accessor :claims
      
        # The next pagination token in the Search response. It should be used as the
        # `page_token` for the following request. An empty value means no more
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claims = args[:claims] if args.key?(:claims)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response from listing `ClaimReview` markup.
      class GoogleFactcheckingFactchecktoolsV1alpha1ListClaimReviewMarkupPagesResponse
        include Google::Apis::Core::Hashable
      
        # The result list of pages of `ClaimReview` markup.
        # Corresponds to the JSON property `claimReviewMarkupPages`
        # @return [Array<Google::Apis::FactchecktoolsV1alpha1::GoogleFactcheckingFactchecktoolsV1alpha1ClaimReviewMarkupPage>]
        attr_accessor :claim_review_markup_pages
      
        # The next pagination token in the Search response. It should be used as the
        # `page_token` for the following request. An empty value means no more
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim_review_markup_pages = args[:claim_review_markup_pages] if args.key?(:claim_review_markup_pages)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Information about the publisher.
      class GoogleFactcheckingFactchecktoolsV1alpha1Publisher
        include Google::Apis::Core::Hashable
      
        # The name of this publisher. For instance, "Awesome Fact Checks".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Host-level site name, without the protocol or "www" prefix. For instance,
        # "awesomefactchecks.com". This value of this field is based purely on the
        # claim review URL.
        # Corresponds to the JSON property `site`
        # @return [String]
        attr_accessor :site
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @site = args[:site] if args.key?(:site)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
    end
  end
end
