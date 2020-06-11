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
    module Adexchangebuyer2V2beta1
      
      # An absolute date range, specified by its start date and end date.
      # The supported range of dates begins 30 days before today and ends today.
      # Validity checked upon filter set creation. If a filter set with an absolute
      # date range is run at a later date more than 30 days after start_date, it will
      # fail.
      class AbsoluteDateRange
        include Google::Apis::Core::Hashable
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `endDate`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Date]
        attr_accessor :end_date
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startDate`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Date]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # Request to accept a proposal.
      class AcceptProposalRequest
        include Google::Apis::Core::Hashable
      
        # The last known client revision number of the proposal.
        # Corresponds to the JSON property `proposalRevision`
        # @return [Fixnum]
        attr_accessor :proposal_revision
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @proposal_revision = args[:proposal_revision] if args.key?(:proposal_revision)
        end
      end
      
      # Represents size of a single ad slot, or a creative.
      class AdSize
        include Google::Apis::Core::Hashable
      
        # The height of the ad slot in pixels.
        # This field will be present only when size type is `PIXEL`.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The size type of the ad slot.
        # Corresponds to the JSON property `sizeType`
        # @return [String]
        attr_accessor :size_type
      
        # The width of the ad slot in pixels.
        # This field will be present only when size type is `PIXEL`.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @size_type = args[:size_type] if args.key?(:size_type)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Detected ad technology provider information.
      class AdTechnologyProviders
        include Google::Apis::Core::Hashable
      
        # The detected ad technology provider IDs for this creative.
        # See https://storage.googleapis.com/adx-rtb-dictionaries/providers.csv for
        # mapping of provider ID to provided name, a privacy policy URL, and a list
        # of domains which can be attributed to the provider.
        # If the creative contains provider IDs that are outside of those listed in
        # the `BidRequest.adslot.consented_providers_settings.consented_providers`
        # field on the (Google bid
        # protocol)[https://developers.google.com/authorized-buyers/rtb/downloads/
        # realtime-bidding-proto]
        # and the
        # `BidRequest.user.ext.consented_providers_settings.consented_providers`
        # field on the (OpenRTB
        # protocol)[https://developers.google.com/authorized-buyers/rtb/downloads/
        # openrtb-adx-proto],
        # and a bid is submitted with that creative for an impression that will
        # serve to an EEA user, the bid will be filtered before the auction.
        # Corresponds to the JSON property `detectedProviderIds`
        # @return [Array<Fixnum>]
        attr_accessor :detected_provider_ids
      
        # Whether the creative contains an unidentified ad technology provider.
        # If true for a given creative, any bid submitted with that creative for an
        # impression that will serve to an EEA user will be filtered before the
        # auction.
        # Corresponds to the JSON property `hasUnidentifiedProvider`
        # @return [Boolean]
        attr_accessor :has_unidentified_provider
        alias_method :has_unidentified_provider?, :has_unidentified_provider
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_provider_ids = args[:detected_provider_ids] if args.key?(:detected_provider_ids)
          @has_unidentified_provider = args[:has_unidentified_provider] if args.key?(:has_unidentified_provider)
        end
      end
      
      # A request for associating a deal and a creative.
      class AddDealAssociationRequest
        include Google::Apis::Core::Hashable
      
        # The association between a creative and a deal.
        # Corresponds to the JSON property `association`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CreativeDealAssociation]
        attr_accessor :association
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @association = args[:association] if args.key?(:association)
        end
      end
      
      # Request message for adding a note to a given proposal.
      class AddNoteRequest
        include Google::Apis::Core::Hashable
      
        # A proposal may be associated to several notes.
        # Corresponds to the JSON property `note`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Note]
        attr_accessor :note
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @note = args[:note] if args.key?(:note)
        end
      end
      
      # Output only. The app type the restriction applies to for mobile device.
      class AppContext
        include Google::Apis::Core::Hashable
      
        # The app types this restriction applies to.
        # Corresponds to the JSON property `appTypes`
        # @return [Array<String>]
        attr_accessor :app_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_types = args[:app_types] if args.key?(:app_types)
        end
      end
      
      # Output only. The auction type the restriction applies to.
      class AuctionContext
        include Google::Apis::Core::Hashable
      
        # The auction types this restriction applies to.
        # Corresponds to the JSON property `auctionTypes`
        # @return [Array<String>]
        attr_accessor :auction_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auction_types = args[:auction_types] if args.key?(:auction_types)
        end
      end
      
      # The set of metrics that are measured in numbers of bids, representing how
      # many bids with the specified dimension values were considered eligible at
      # each stage of the bidding funnel;
      class BidMetricsRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bids`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bids
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidsInAuction`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bids_in_auction
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `billedImpressions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :billed_impressions
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `impressionsWon`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :impressions_won
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `measurableImpressions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :measurable_impressions
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `viewableImpressions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :viewable_impressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bids = args[:bids] if args.key?(:bids)
          @bids_in_auction = args[:bids_in_auction] if args.key?(:bids_in_auction)
          @billed_impressions = args[:billed_impressions] if args.key?(:billed_impressions)
          @impressions_won = args[:impressions_won] if args.key?(:impressions_won)
          @measurable_impressions = args[:measurable_impressions] if args.key?(:measurable_impressions)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
          @viewable_impressions = args[:viewable_impressions] if args.key?(:viewable_impressions)
        end
      end
      
      # The number of impressions with the specified dimension values that were
      # considered to have no applicable bids, as described by the specified status.
      class BidResponseWithoutBidsStatusRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `impressionCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :impression_count
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        # The status specifying why the bid responses were considered to have no
        # applicable bids.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @impression_count = args[:impression_count] if args.key?(:impression_count)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Represents a buyer of inventory. Each buyer is identified by a unique
      # Authorized Buyers account ID.
      class Buyer
        include Google::Apis::Core::Hashable
      
        # Authorized Buyers account ID of the buyer.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
        end
      end
      
      # The number of impressions with the specified dimension values where the
      # corresponding bid request or bid response was not successful, as described by
      # the specified callout status.
      class CalloutStatusRow
        include Google::Apis::Core::Hashable
      
        # The ID of the callout status.
        # See
        # [callout-status-codes](https://developers.google.com/authorized-buyers/rtb/
        # downloads/callout-status-codes).
        # Corresponds to the JSON property `calloutStatusId`
        # @return [Fixnum]
        attr_accessor :callout_status_id
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `impressionCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :impression_count
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @callout_status_id = args[:callout_status_id] if args.key?(:callout_status_id)
          @impression_count = args[:impression_count] if args.key?(:impression_count)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
        end
      end
      
      # Request to cancel an ongoing negotiation.
      class CancelNegotiationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A client resource represents a client buyer&mdash;an agency, a brand, or an
      # advertiser customer of the sponsor buyer. Users associated with the client
      # buyer have restricted access to the Marketplace and certain other sections of
      # the Authorized Buyers UI based on the role granted to the client buyer. All
      # fields are required unless otherwise specified.
      class Client
        include Google::Apis::Core::Hashable
      
        # The globally-unique numerical ID of the client.
        # The value of this field is ignored in create and update operations.
        # Corresponds to the JSON property `clientAccountId`
        # @return [Fixnum]
        attr_accessor :client_account_id
      
        # Name used to represent this client to publishers.
        # You may have multiple clients that map to the same entity,
        # but for each client the combination of `clientName` and entity
        # must be unique.
        # You can specify this field as empty.
        # Corresponds to the JSON property `clientName`
        # @return [String]
        attr_accessor :client_name
      
        # Numerical identifier of the client entity.
        # The entity can be an advertiser, a brand, or an agency.
        # This identifier is unique among all the entities with the same type.
        # A list of all known advertisers with their identifiers is available in the
        # [advertisers.txt](https://storage.googleapis.com/adx-rtb-dictionaries/
        # advertisers.txt)
        # file.
        # A list of all known brands with their identifiers is available in the
        # [brands.txt](https://storage.googleapis.com/adx-rtb-dictionaries/brands.txt)
        # file.
        # A list of all known agencies with their identifiers is available in the
        # [agencies.txt](https://storage.googleapis.com/adx-rtb-dictionaries/agencies.
        # txt)
        # file.
        # Corresponds to the JSON property `entityId`
        # @return [Fixnum]
        attr_accessor :entity_id
      
        # The name of the entity. This field is automatically fetched based on
        # the type and ID.
        # The value of this field is ignored in create and update operations.
        # Corresponds to the JSON property `entityName`
        # @return [String]
        attr_accessor :entity_name
      
        # The type of the client entity: `ADVERTISER`, `BRAND`, or `AGENCY`.
        # Corresponds to the JSON property `entityType`
        # @return [String]
        attr_accessor :entity_type
      
        # Optional arbitrary unique identifier of this client buyer from the
        # standpoint of its Ad Exchange sponsor buyer.
        # This field can be used to associate a client buyer with the identifier
        # in the namespace of its sponsor buyer, lookup client buyers by that
        # identifier and verify whether an Ad Exchange counterpart of a given client
        # buyer already exists.
        # If present, must be unique among all the client buyers for its
        # Ad Exchange sponsor buyer.
        # Corresponds to the JSON property `partnerClientId`
        # @return [String]
        attr_accessor :partner_client_id
      
        # The role which is assigned to the client buyer. Each role implies a set of
        # permissions granted to the client. Must be one of `CLIENT_DEAL_VIEWER`,
        # `CLIENT_DEAL_NEGOTIATOR` or `CLIENT_DEAL_APPROVER`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # The status of the client buyer.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Whether the client buyer will be visible to sellers.
        # Corresponds to the JSON property `visibleToSeller`
        # @return [Boolean]
        attr_accessor :visible_to_seller
        alias_method :visible_to_seller?, :visible_to_seller
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_account_id = args[:client_account_id] if args.key?(:client_account_id)
          @client_name = args[:client_name] if args.key?(:client_name)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @entity_name = args[:entity_name] if args.key?(:entity_name)
          @entity_type = args[:entity_type] if args.key?(:entity_type)
          @partner_client_id = args[:partner_client_id] if args.key?(:partner_client_id)
          @role = args[:role] if args.key?(:role)
          @status = args[:status] if args.key?(:status)
          @visible_to_seller = args[:visible_to_seller] if args.key?(:visible_to_seller)
        end
      end
      
      # A client user is created under a client buyer and has restricted access to
      # the Marketplace and certain other sections of the Authorized Buyers UI based
      # on the role granted to the associated client buyer.
      # The only way a new client user can be created is via accepting an
      # email invitation
      # (see the
      # accounts.clients.invitations.create
      # method).
      # All fields are required unless otherwise specified.
      class ClientUser
        include Google::Apis::Core::Hashable
      
        # Numerical account ID of the client buyer
        # with which the user is associated; the
        # buyer must be a client of the current sponsor buyer.
        # The value of this field is ignored in an update operation.
        # Corresponds to the JSON property `clientAccountId`
        # @return [Fixnum]
        attr_accessor :client_account_id
      
        # User's email address. The value of this field
        # is ignored in an update operation.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The status of the client user.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The unique numerical ID of the client user
        # that has accepted an invitation.
        # The value of this field is ignored in an update operation.
        # Corresponds to the JSON property `userId`
        # @return [Fixnum]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_account_id = args[:client_account_id] if args.key?(:client_account_id)
          @email = args[:email] if args.key?(:email)
          @status = args[:status] if args.key?(:status)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # An invitation for a new client user to get access to the Authorized Buyers
      # UI. All fields are required unless otherwise specified.
      class ClientUserInvitation
        include Google::Apis::Core::Hashable
      
        # Numerical account ID of the client buyer
        # that the invited user is associated with.
        # The value of this field is ignored in create operations.
        # Corresponds to the JSON property `clientAccountId`
        # @return [Fixnum]
        attr_accessor :client_account_id
      
        # The email address to which the invitation is sent. Email
        # addresses should be unique among all client users under each sponsor
        # buyer.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The unique numerical ID of the invitation that is sent to the user.
        # The value of this field is ignored in create operations.
        # Corresponds to the JSON property `invitationId`
        # @return [Fixnum]
        attr_accessor :invitation_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_account_id = args[:client_account_id] if args.key?(:client_account_id)
          @email = args[:email] if args.key?(:email)
          @invitation_id = args[:invitation_id] if args.key?(:invitation_id)
        end
      end
      
      # Request message for indicating that the proposal's setup step is complete.
      class CompleteSetupRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Contains information on how a buyer or seller can be reached.
      class ContactInformation
        include Google::Apis::Core::Hashable
      
        # Email address for the contact.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The name of the contact.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Output only. Shows any corrections that were applied to this creative.
      class Correction
        include Google::Apis::Core::Hashable
      
        # The contexts for the correction.
        # Corresponds to the JSON property `contexts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ServingContext>]
        attr_accessor :contexts
      
        # Additional details about what was corrected.
        # Corresponds to the JSON property `details`
        # @return [Array<String>]
        attr_accessor :details
      
        # The type of correction that was applied to the creative.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contexts = args[:contexts] if args.key?(:contexts)
          @details = args[:details] if args.key?(:details)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A creative and its classification data.
      class Creative
        include Google::Apis::Core::Hashable
      
        # The account that this creative belongs to.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The link to AdChoices destination page.
        # Corresponds to the JSON property `adChoicesDestinationUrl`
        # @return [String]
        attr_accessor :ad_choices_destination_url
      
        # Detected ad technology provider information.
        # Corresponds to the JSON property `adTechnologyProviders`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::AdTechnologyProviders]
        attr_accessor :ad_technology_providers
      
        # The name of the company being advertised in the creative.
        # Corresponds to the JSON property `advertiserName`
        # @return [String]
        attr_accessor :advertiser_name
      
        # The agency ID for this creative.
        # Corresponds to the JSON property `agencyId`
        # @return [Fixnum]
        attr_accessor :agency_id
      
        # Output only. The last update timestamp of the creative via API.
        # Corresponds to the JSON property `apiUpdateTime`
        # @return [String]
        attr_accessor :api_update_time
      
        # All attributes for the ads that may be shown from this creative.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Corresponds to the JSON property `attributes`
        # @return [Array<String>]
        attr_accessor :attributes
      
        # The set of destination URLs for the creative.
        # Corresponds to the JSON property `clickThroughUrls`
        # @return [Array<String>]
        attr_accessor :click_through_urls
      
        # Output only. Shows any corrections that were applied to this creative.
        # Corresponds to the JSON property `corrections`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Correction>]
        attr_accessor :corrections
      
        # The buyer-defined creative ID of this creative.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Corresponds to the JSON property `creativeId`
        # @return [String]
        attr_accessor :creative_id
      
        # Output only. The top-level deals status of this creative.
        # If disapproved, an entry for 'auctionType=DIRECT_DEALS' (or 'ALL') in
        # serving_restrictions will also exist. Note
        # that this may be nuanced with other contextual restrictions, in which case,
        # it may be preferable to read from serving_restrictions directly.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Corresponds to the JSON property `dealsStatus`
        # @return [String]
        attr_accessor :deals_status
      
        # The set of declared destination URLs for the creative.
        # Corresponds to the JSON property `declaredClickThroughUrls`
        # @return [Array<String>]
        attr_accessor :declared_click_through_urls
      
        # Output only. Detected advertiser IDs, if any.
        # Corresponds to the JSON property `detectedAdvertiserIds`
        # @return [Array<Fixnum>]
        attr_accessor :detected_advertiser_ids
      
        # Output only. The detected domains for this creative.
        # Corresponds to the JSON property `detectedDomains`
        # @return [Array<String>]
        attr_accessor :detected_domains
      
        # Output only. The detected languages for this creative. The order is
        # arbitrary. The codes are 2 or 5 characters and are documented at
        # https://developers.google.com/adwords/api/docs/appendix/languagecodes.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<String>]
        attr_accessor :detected_languages
      
        # Output only. Detected product categories, if any.
        # See the ad-product-categories.txt file in the technical documentation
        # for a list of IDs.
        # Corresponds to the JSON property `detectedProductCategories`
        # @return [Array<Fixnum>]
        attr_accessor :detected_product_categories
      
        # Output only. Detected sensitive categories, if any.
        # See the ad-sensitive-categories.txt file in the technical documentation for
        # a list of IDs. You should use these IDs along with the
        # excluded-sensitive-category field in the bid request to filter your bids.
        # Corresponds to the JSON property `detectedSensitiveCategories`
        # @return [Array<Fixnum>]
        attr_accessor :detected_sensitive_categories
      
        # HTML content for a creative.
        # Corresponds to the JSON property `html`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::HtmlContent]
        attr_accessor :html
      
        # The set of URLs to be called to record an impression.
        # Corresponds to the JSON property `impressionTrackingUrls`
        # @return [Array<String>]
        attr_accessor :impression_tracking_urls
      
        # Native content for a creative.
        # Corresponds to the JSON property `native`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::NativeContent]
        attr_accessor :native
      
        # Output only. The top-level open auction status of this creative.
        # If disapproved, an entry for 'auctionType = OPEN_AUCTION' (or 'ALL') in
        # serving_restrictions will also exist. Note
        # that this may be nuanced with other contextual restrictions, in which case,
        # it may be preferable to read from serving_restrictions directly.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Corresponds to the JSON property `openAuctionStatus`
        # @return [String]
        attr_accessor :open_auction_status
      
        # All restricted categories for the ads that may be shown from this creative.
        # Corresponds to the JSON property `restrictedCategories`
        # @return [Array<String>]
        attr_accessor :restricted_categories
      
        # Output only. The granular status of this ad in specific contexts.
        # A context here relates to where something ultimately serves (for example,
        # a physical location, a platform, an HTTPS vs HTTP request, or the type
        # of auction).
        # Corresponds to the JSON property `servingRestrictions`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ServingRestriction>]
        attr_accessor :serving_restrictions
      
        # All vendor IDs for the ads that may be shown from this creative.
        # See https://storage.googleapis.com/adx-rtb-dictionaries/vendors.txt
        # for possible values.
        # Corresponds to the JSON property `vendorIds`
        # @return [Array<Fixnum>]
        attr_accessor :vendor_ids
      
        # Output only. The version of this creative.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # Video content for a creative.
        # Corresponds to the JSON property `video`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::VideoContent]
        attr_accessor :video
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @ad_choices_destination_url = args[:ad_choices_destination_url] if args.key?(:ad_choices_destination_url)
          @ad_technology_providers = args[:ad_technology_providers] if args.key?(:ad_technology_providers)
          @advertiser_name = args[:advertiser_name] if args.key?(:advertiser_name)
          @agency_id = args[:agency_id] if args.key?(:agency_id)
          @api_update_time = args[:api_update_time] if args.key?(:api_update_time)
          @attributes = args[:attributes] if args.key?(:attributes)
          @click_through_urls = args[:click_through_urls] if args.key?(:click_through_urls)
          @corrections = args[:corrections] if args.key?(:corrections)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @deals_status = args[:deals_status] if args.key?(:deals_status)
          @declared_click_through_urls = args[:declared_click_through_urls] if args.key?(:declared_click_through_urls)
          @detected_advertiser_ids = args[:detected_advertiser_ids] if args.key?(:detected_advertiser_ids)
          @detected_domains = args[:detected_domains] if args.key?(:detected_domains)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
          @detected_product_categories = args[:detected_product_categories] if args.key?(:detected_product_categories)
          @detected_sensitive_categories = args[:detected_sensitive_categories] if args.key?(:detected_sensitive_categories)
          @html = args[:html] if args.key?(:html)
          @impression_tracking_urls = args[:impression_tracking_urls] if args.key?(:impression_tracking_urls)
          @native = args[:native] if args.key?(:native)
          @open_auction_status = args[:open_auction_status] if args.key?(:open_auction_status)
          @restricted_categories = args[:restricted_categories] if args.key?(:restricted_categories)
          @serving_restrictions = args[:serving_restrictions] if args.key?(:serving_restrictions)
          @vendor_ids = args[:vendor_ids] if args.key?(:vendor_ids)
          @version = args[:version] if args.key?(:version)
          @video = args[:video] if args.key?(:video)
        end
      end
      
      # The association between a creative and a deal.
      class CreativeDealAssociation
        include Google::Apis::Core::Hashable
      
        # The account the creative belongs to.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The ID of the creative associated with the deal.
        # Corresponds to the JSON property `creativeId`
        # @return [String]
        attr_accessor :creative_id
      
        # The externalDealId for the deal associated with the creative.
        # Corresponds to the JSON property `dealsId`
        # @return [String]
        attr_accessor :deals_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @deals_id = args[:deals_id] if args.key?(:deals_id)
        end
      end
      
      # Represents creative restrictions associated to Programmatic Guaranteed/
      # Preferred Deal in Ad Manager.
      # This doesn't apply to Private Auction and AdX Preferred Deals.
      class CreativeRestrictions
        include Google::Apis::Core::Hashable
      
        # The format of the environment that the creatives will be displayed in.
        # Corresponds to the JSON property `creativeFormat`
        # @return [String]
        attr_accessor :creative_format
      
        # 
        # Corresponds to the JSON property `creativeSpecifications`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CreativeSpecification>]
        attr_accessor :creative_specifications
      
        # Skippable video ads allow viewers to skip ads after 5 seconds.
        # Corresponds to the JSON property `skippableAdType`
        # @return [String]
        attr_accessor :skippable_ad_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_format = args[:creative_format] if args.key?(:creative_format)
          @creative_specifications = args[:creative_specifications] if args.key?(:creative_specifications)
          @skippable_ad_type = args[:skippable_ad_type] if args.key?(:skippable_ad_type)
        end
      end
      
      # Specifies the size of the creative.
      class CreativeSize
        include Google::Apis::Core::Hashable
      
        # What formats are allowed by the publisher.
        # If this repeated field is empty then all formats are allowed.
        # For example, if this field contains AllowedFormatType.AUDIO then the
        # publisher only allows an audio ad (without any video).
        # Corresponds to the JSON property `allowedFormats`
        # @return [Array<String>]
        attr_accessor :allowed_formats
      
        # For video creatives specifies the sizes of companion ads (if present).
        # Companion sizes may be filled in only when creative_size_type = VIDEO
        # Corresponds to the JSON property `companionSizes`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Size>]
        attr_accessor :companion_sizes
      
        # The creative size type.
        # Corresponds to the JSON property `creativeSizeType`
        # @return [String]
        attr_accessor :creative_size_type
      
        # Output only. The native template for this creative. It will have a value
        # only if creative_size_type = CreativeSizeType.NATIVE.
        # Corresponds to the JSON property `nativeTemplate`
        # @return [String]
        attr_accessor :native_template
      
        # Message depicting the size of the creative. The units of width and
        # height depend on the type of the targeting.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Size]
        attr_accessor :size
      
        # The type of skippable ad for this creative. It will have a value only if
        # creative_size_type = CreativeSizeType.VIDEO.
        # Corresponds to the JSON property `skippableAdType`
        # @return [String]
        attr_accessor :skippable_ad_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed_formats = args[:allowed_formats] if args.key?(:allowed_formats)
          @companion_sizes = args[:companion_sizes] if args.key?(:companion_sizes)
          @creative_size_type = args[:creative_size_type] if args.key?(:creative_size_type)
          @native_template = args[:native_template] if args.key?(:native_template)
          @size = args[:size] if args.key?(:size)
          @skippable_ad_type = args[:skippable_ad_type] if args.key?(:skippable_ad_type)
        end
      end
      
      # Represents information for a creative that is associated with a Programmatic
      # Guaranteed/Preferred Deal in Ad Manager.
      class CreativeSpecification
        include Google::Apis::Core::Hashable
      
        # Companion sizes may be filled in only when this is a video creative.
        # Corresponds to the JSON property `creativeCompanionSizes`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::AdSize>]
        attr_accessor :creative_companion_sizes
      
        # Represents size of a single ad slot, or a creative.
        # Corresponds to the JSON property `creativeSize`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::AdSize]
        attr_accessor :creative_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_companion_sizes = args[:creative_companion_sizes] if args.key?(:creative_companion_sizes)
          @creative_size = args[:creative_size] if args.key?(:creative_size)
        end
      end
      
      # The number of bids with the specified dimension values that did not win the
      # auction (either were filtered pre-auction or lost the auction), as described
      # by the specified creative status.
      class CreativeStatusRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bid_count
      
        # The ID of the creative status.
        # See
        # [creative-status-codes](https://developers.google.com/authorized-buyers/rtb/
        # downloads/creative-status-codes).
        # Corresponds to the JSON property `creativeStatusId`
        # @return [Fixnum]
        attr_accessor :creative_status_id
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_count = args[:bid_count] if args.key?(:bid_count)
          @creative_status_id = args[:creative_status_id] if args.key?(:creative_status_id)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
        end
      end
      
      # Generic targeting used for targeting dimensions that contains a list of
      # included and excluded numeric IDs.
      class CriteriaTargeting
        include Google::Apis::Core::Hashable
      
        # A list of numeric IDs to be excluded.
        # Corresponds to the JSON property `excludedCriteriaIds`
        # @return [Array<Fixnum>]
        attr_accessor :excluded_criteria_ids
      
        # A list of numeric IDs to be included.
        # Corresponds to the JSON property `targetedCriteriaIds`
        # @return [Array<Fixnum>]
        attr_accessor :targeted_criteria_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_criteria_ids = args[:excluded_criteria_ids] if args.key?(:excluded_criteria_ids)
          @targeted_criteria_ids = args[:targeted_criteria_ids] if args.key?(:targeted_criteria_ids)
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
      
      # Daypart targeting message that specifies if the ad can be shown
      # only during certain parts of a day/week.
      class DayPart
        include Google::Apis::Core::Hashable
      
        # The day of the week to target. If unspecified, applicable to all days.
        # Corresponds to the JSON property `dayOfWeek`
        # @return [String]
        attr_accessor :day_of_week
      
        # Represents a time of day. The date and time zone are either not significant
        # or are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `endTime`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::TimeOfDay]
        attr_accessor :end_time
      
        # Represents a time of day. The date and time zone are either not significant
        # or are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startTime`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::TimeOfDay]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day_of_week = args[:day_of_week] if args.key?(:day_of_week)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Specifies the day part targeting criteria.
      class DayPartTargeting
        include Google::Apis::Core::Hashable
      
        # A list of day part targeting criterion.
        # Corresponds to the JSON property `dayParts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::DayPart>]
        attr_accessor :day_parts
      
        # The timezone to use for interpreting the day part targeting.
        # Corresponds to the JSON property `timeZoneType`
        # @return [String]
        attr_accessor :time_zone_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day_parts = args[:day_parts] if args.key?(:day_parts)
          @time_zone_type = args[:time_zone_type] if args.key?(:time_zone_type)
        end
      end
      
      # A deal represents a segment of inventory for displaying ads on.
      # A proposal can contain multiple deals. A deal contains the terms and
      # targeting information that is used for serving.
      class Deal
        include Google::Apis::Core::Hashable
      
        # Proposed flight end time of the deal.
        # This will generally be stored in a granularity of a second.
        # A value is not required for Private Auction deals or Preferred Deals.
        # Corresponds to the JSON property `availableEndTime`
        # @return [String]
        attr_accessor :available_end_time
      
        # Optional proposed flight start time of the deal.
        # This will generally be stored in the granularity of one second since deal
        # serving starts at seconds boundary. Any time specified with more
        # granularity (e.g., in milliseconds) will be truncated towards the start of
        # time in seconds.
        # Corresponds to the JSON property `availableStartTime`
        # @return [String]
        attr_accessor :available_start_time
      
        # Buyers are allowed to store certain types of private data in a proposal/deal.
        # Corresponds to the JSON property `buyerPrivateData`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::PrivateData]
        attr_accessor :buyer_private_data
      
        # The product ID from which this deal was created.
        # Note: This field may be set only when creating the resource. Modifying
        # this field while updating the resource will result in an error.
        # Corresponds to the JSON property `createProductId`
        # @return [String]
        attr_accessor :create_product_id
      
        # Optional revision number of the product that the deal was created from.
        # If present on create, and the server `product_revision` has advanced sinced
        # the passed-in `create_product_revision`, an `ABORTED` error will be
        # returned.
        # Note: This field may be set only when creating the resource. Modifying
        # this field while updating the resource will result in an error.
        # Corresponds to the JSON property `createProductRevision`
        # @return [Fixnum]
        attr_accessor :create_product_revision
      
        # Output only. The time of the deal creation.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Specifies the creative pre-approval policy.
        # Corresponds to the JSON property `creativePreApprovalPolicy`
        # @return [String]
        attr_accessor :creative_pre_approval_policy
      
        # Represents creative restrictions associated to Programmatic Guaranteed/
        # Preferred Deal in Ad Manager.
        # This doesn't apply to Private Auction and AdX Preferred Deals.
        # Corresponds to the JSON property `creativeRestrictions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CreativeRestrictions]
        attr_accessor :creative_restrictions
      
        # Output only. Specifies whether the creative is safeFrame compatible.
        # Corresponds to the JSON property `creativeSafeFrameCompatibility`
        # @return [String]
        attr_accessor :creative_safe_frame_compatibility
      
        # Output only. A unique deal ID for the deal (server-assigned).
        # Corresponds to the JSON property `dealId`
        # @return [String]
        attr_accessor :deal_id
      
        # Message captures metadata about the serving status of a deal.
        # Corresponds to the JSON property `dealServingMetadata`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DealServingMetadata]
        attr_accessor :deal_serving_metadata
      
        # The deal terms specify the details of a Product/deal. They specify things
        # like price per buyer, the type of pricing model (e.g., fixed price, auction)
        # and expected impressions from the publisher.
        # Corresponds to the JSON property `dealTerms`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DealTerms]
        attr_accessor :deal_terms
      
        # Message contains details about how the deals will be paced.
        # Corresponds to the JSON property `deliveryControl`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DeliveryControl]
        attr_accessor :delivery_control
      
        # Description for the deal terms.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The name of the deal.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. The external deal ID assigned to this deal once the deal is
        # finalized. This is the deal ID that shows up in serving/reporting etc.
        # Corresponds to the JSON property `externalDealId`
        # @return [String]
        attr_accessor :external_deal_id
      
        # Output only. True, if the buyside inventory setup is complete for this
        # deal.
        # Corresponds to the JSON property `isSetupComplete`
        # @return [Boolean]
        attr_accessor :is_setup_complete
        alias_method :is_setup_complete?, :is_setup_complete
      
        # Output only. Specifies the creative source for programmatic deals.
        # PUBLISHER means creative is provided by seller and ADVERTISER means
        # creative is provided by buyer.
        # Corresponds to the JSON property `programmaticCreativeSource`
        # @return [String]
        attr_accessor :programmatic_creative_source
      
        # Output only. ID of the proposal that this deal is part of.
        # Corresponds to the JSON property `proposalId`
        # @return [String]
        attr_accessor :proposal_id
      
        # Output only. Seller contact information for the deal.
        # Corresponds to the JSON property `sellerContacts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ContactInformation>]
        attr_accessor :seller_contacts
      
        # The syndication product associated with the deal.
        # Note: This field may be set only when creating the resource. Modifying
        # this field while updating the resource will result in an error.
        # Corresponds to the JSON property `syndicationProduct`
        # @return [String]
        attr_accessor :syndication_product
      
        # Targeting represents different criteria that can be used by advertisers to
        # target ad inventory. For example, they can choose to target ad requests only
        # if the user is in the US.
        # Multiple types of targeting are always applied as a logical AND, unless noted
        # otherwise.
        # Corresponds to the JSON property `targeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MarketplaceTargeting]
        attr_accessor :targeting
      
        # The shared targeting visible to buyers and sellers. Each shared
        # targeting entity is AND'd together.
        # Corresponds to the JSON property `targetingCriterion`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::TargetingCriteria>]
        attr_accessor :targeting_criterion
      
        # Output only. The time when the deal was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # The web property code for the seller copied over from the product.
        # Corresponds to the JSON property `webPropertyCode`
        # @return [String]
        attr_accessor :web_property_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_end_time = args[:available_end_time] if args.key?(:available_end_time)
          @available_start_time = args[:available_start_time] if args.key?(:available_start_time)
          @buyer_private_data = args[:buyer_private_data] if args.key?(:buyer_private_data)
          @create_product_id = args[:create_product_id] if args.key?(:create_product_id)
          @create_product_revision = args[:create_product_revision] if args.key?(:create_product_revision)
          @create_time = args[:create_time] if args.key?(:create_time)
          @creative_pre_approval_policy = args[:creative_pre_approval_policy] if args.key?(:creative_pre_approval_policy)
          @creative_restrictions = args[:creative_restrictions] if args.key?(:creative_restrictions)
          @creative_safe_frame_compatibility = args[:creative_safe_frame_compatibility] if args.key?(:creative_safe_frame_compatibility)
          @deal_id = args[:deal_id] if args.key?(:deal_id)
          @deal_serving_metadata = args[:deal_serving_metadata] if args.key?(:deal_serving_metadata)
          @deal_terms = args[:deal_terms] if args.key?(:deal_terms)
          @delivery_control = args[:delivery_control] if args.key?(:delivery_control)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @external_deal_id = args[:external_deal_id] if args.key?(:external_deal_id)
          @is_setup_complete = args[:is_setup_complete] if args.key?(:is_setup_complete)
          @programmatic_creative_source = args[:programmatic_creative_source] if args.key?(:programmatic_creative_source)
          @proposal_id = args[:proposal_id] if args.key?(:proposal_id)
          @seller_contacts = args[:seller_contacts] if args.key?(:seller_contacts)
          @syndication_product = args[:syndication_product] if args.key?(:syndication_product)
          @targeting = args[:targeting] if args.key?(:targeting)
          @targeting_criterion = args[:targeting_criterion] if args.key?(:targeting_criterion)
          @update_time = args[:update_time] if args.key?(:update_time)
          @web_property_code = args[:web_property_code] if args.key?(:web_property_code)
        end
      end
      
      # Tracks which parties (if any) have paused a deal.
      # The deal is considered paused if either hasBuyerPaused or
      # hasSellPaused is true.
      class DealPauseStatus
        include Google::Apis::Core::Hashable
      
        # The buyer's reason for pausing, if the buyer paused the deal.
        # Corresponds to the JSON property `buyerPauseReason`
        # @return [String]
        attr_accessor :buyer_pause_reason
      
        # The role of the person who first paused this deal.
        # Corresponds to the JSON property `firstPausedBy`
        # @return [String]
        attr_accessor :first_paused_by
      
        # True, if the buyer has paused the deal unilaterally.
        # Corresponds to the JSON property `hasBuyerPaused`
        # @return [Boolean]
        attr_accessor :has_buyer_paused
        alias_method :has_buyer_paused?, :has_buyer_paused
      
        # True, if the seller has paused the deal unilaterally.
        # Corresponds to the JSON property `hasSellerPaused`
        # @return [Boolean]
        attr_accessor :has_seller_paused
        alias_method :has_seller_paused?, :has_seller_paused
      
        # The seller's reason for pausing, if the seller paused the deal.
        # Corresponds to the JSON property `sellerPauseReason`
        # @return [String]
        attr_accessor :seller_pause_reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buyer_pause_reason = args[:buyer_pause_reason] if args.key?(:buyer_pause_reason)
          @first_paused_by = args[:first_paused_by] if args.key?(:first_paused_by)
          @has_buyer_paused = args[:has_buyer_paused] if args.key?(:has_buyer_paused)
          @has_seller_paused = args[:has_seller_paused] if args.key?(:has_seller_paused)
          @seller_pause_reason = args[:seller_pause_reason] if args.key?(:seller_pause_reason)
        end
      end
      
      # Message captures metadata about the serving status of a deal.
      class DealServingMetadata
        include Google::Apis::Core::Hashable
      
        # Tracks which parties (if any) have paused a deal.
        # The deal is considered paused if either hasBuyerPaused or
        # hasSellPaused is true.
        # Corresponds to the JSON property `dealPauseStatus`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DealPauseStatus]
        attr_accessor :deal_pause_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deal_pause_status = args[:deal_pause_status] if args.key?(:deal_pause_status)
        end
      end
      
      # The deal terms specify the details of a Product/deal. They specify things
      # like price per buyer, the type of pricing model (e.g., fixed price, auction)
      # and expected impressions from the publisher.
      class DealTerms
        include Google::Apis::Core::Hashable
      
        # Visibility of the URL in bid requests. (default: BRANDED)
        # Corresponds to the JSON property `brandingType`
        # @return [String]
        attr_accessor :branding_type
      
        # Publisher provided description for the terms.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Represents a price and a pricing type for a product / deal.
        # Corresponds to the JSON property `estimatedGrossSpend`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Price]
        attr_accessor :estimated_gross_spend
      
        # Non-binding estimate of the impressions served per day.
        # Can be set by buyer or seller.
        # Corresponds to the JSON property `estimatedImpressionsPerDay`
        # @return [Fixnum]
        attr_accessor :estimated_impressions_per_day
      
        # Terms for Programmatic Guaranteed Deals.
        # Corresponds to the JSON property `guaranteedFixedPriceTerms`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::GuaranteedFixedPriceTerms]
        attr_accessor :guaranteed_fixed_price_terms
      
        # Terms for Private Auctions. Note that Private Auctions can be created only
        # by the seller, but they can be returned in a get or list request.
        # Corresponds to the JSON property `nonGuaranteedAuctionTerms`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::NonGuaranteedAuctionTerms]
        attr_accessor :non_guaranteed_auction_terms
      
        # Terms for Preferred Deals. Note that Preferred Deals cannot be created via
        # the API at this time, but can be returned in a get or list request.
        # Corresponds to the JSON property `nonGuaranteedFixedPriceTerms`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::NonGuaranteedFixedPriceTerms]
        attr_accessor :non_guaranteed_fixed_price_terms
      
        # The time zone name. For deals with Cost Per Day billing, defines the
        # time zone used to mark the boundaries of a day. It should be an
        # IANA TZ name, such as "America/Los_Angeles". For more information,
        # see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones.
        # Corresponds to the JSON property `sellerTimeZone`
        # @return [String]
        attr_accessor :seller_time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @branding_type = args[:branding_type] if args.key?(:branding_type)
          @description = args[:description] if args.key?(:description)
          @estimated_gross_spend = args[:estimated_gross_spend] if args.key?(:estimated_gross_spend)
          @estimated_impressions_per_day = args[:estimated_impressions_per_day] if args.key?(:estimated_impressions_per_day)
          @guaranteed_fixed_price_terms = args[:guaranteed_fixed_price_terms] if args.key?(:guaranteed_fixed_price_terms)
          @non_guaranteed_auction_terms = args[:non_guaranteed_auction_terms] if args.key?(:non_guaranteed_auction_terms)
          @non_guaranteed_fixed_price_terms = args[:non_guaranteed_fixed_price_terms] if args.key?(:non_guaranteed_fixed_price_terms)
          @seller_time_zone = args[:seller_time_zone] if args.key?(:seller_time_zone)
        end
      end
      
      # Message contains details about how the deals will be paced.
      class DeliveryControl
        include Google::Apis::Core::Hashable
      
        # Output only. Specified the creative blocking levels to be applied.
        # Corresponds to the JSON property `creativeBlockingLevel`
        # @return [String]
        attr_accessor :creative_blocking_level
      
        # Output only. Specifies how the impression delivery will be paced.
        # Corresponds to the JSON property `deliveryRateType`
        # @return [String]
        attr_accessor :delivery_rate_type
      
        # Output only. Specifies any frequency caps.
        # Corresponds to the JSON property `frequencyCaps`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::FrequencyCap>]
        attr_accessor :frequency_caps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_blocking_level = args[:creative_blocking_level] if args.key?(:creative_blocking_level)
          @delivery_rate_type = args[:delivery_rate_type] if args.key?(:delivery_rate_type)
          @frequency_caps = args[:frequency_caps] if args.key?(:frequency_caps)
        end
      end
      
      # Output only. The reason and details for a disapproval.
      class Disapproval
        include Google::Apis::Core::Hashable
      
        # Additional details about the reason for disapproval.
        # Corresponds to the JSON property `details`
        # @return [Array<String>]
        attr_accessor :details
      
        # The categorized reason for disapproval.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @reason = args[:reason] if args.key?(:reason)
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
      
      # A set of filters that is applied to a request for data.
      # Within a filter set, an AND operation is performed across the filters
      # represented by each field. An OR operation is performed across the filters
      # represented by the multiple values of a repeated field, e.g.,
      # "format=VIDEO AND deal_id=12 AND (seller_network_id=34 OR
      # seller_network_id=56)".
      class FilterSet
        include Google::Apis::Core::Hashable
      
        # An absolute date range, specified by its start date and end date.
        # The supported range of dates begins 30 days before today and ends today.
        # Validity checked upon filter set creation. If a filter set with an absolute
        # date range is run at a later date more than 30 days after start_date, it will
        # fail.
        # Corresponds to the JSON property `absoluteDateRange`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::AbsoluteDateRange]
        attr_accessor :absolute_date_range
      
        # The set of dimensions along which to break down the response; may be empty.
        # If multiple dimensions are requested, the breakdown is along the Cartesian
        # product of the requested dimensions.
        # Corresponds to the JSON property `breakdownDimensions`
        # @return [Array<String>]
        attr_accessor :breakdown_dimensions
      
        # The ID of the creative on which to filter; optional. This field may be set
        # only for a filter set that accesses account-level troubleshooting data,
        # i.e., one whose name matches the `bidders/*/accounts/*/filterSets/*`
        # pattern.
        # Corresponds to the JSON property `creativeId`
        # @return [String]
        attr_accessor :creative_id
      
        # The ID of the deal on which to filter; optional. This field may be set
        # only for a filter set that accesses account-level troubleshooting data,
        # i.e., one whose name matches the `bidders/*/accounts/*/filterSets/*`
        # pattern.
        # Corresponds to the JSON property `dealId`
        # @return [Fixnum]
        attr_accessor :deal_id
      
        # The environment on which to filter; optional.
        # Corresponds to the JSON property `environment`
        # @return [String]
        attr_accessor :environment
      
        # The list of formats on which to filter; may be empty. The filters
        # represented by multiple formats are ORed together (i.e., if non-empty,
        # results must match any one of the formats).
        # Corresponds to the JSON property `formats`
        # @return [Array<String>]
        attr_accessor :formats
      
        # A user-defined name of the filter set. Filter set names must be unique
        # globally and match one of the patterns:
        # - `bidders/*/filterSets/*` (for accessing bidder-level troubleshooting
        # data)
        # - `bidders/*/accounts/*/filterSets/*` (for accessing account-level
        # troubleshooting data)
        # This field is required in create operations.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The list of platforms on which to filter; may be empty. The filters
        # represented by multiple platforms are ORed together (i.e., if non-empty,
        # results must match any one of the platforms).
        # Corresponds to the JSON property `platforms`
        # @return [Array<String>]
        attr_accessor :platforms
      
        # For Open Bidding partners only.
        # The list of publisher identifiers on which to filter; may be empty.
        # The filters represented by multiple publisher identifiers are ORed
        # together.
        # Corresponds to the JSON property `publisherIdentifiers`
        # @return [Array<String>]
        attr_accessor :publisher_identifiers
      
        # An open-ended realtime time range specified by the start timestamp.
        # For filter sets that specify a realtime time range RTB metrics continue to
        # be aggregated throughout the lifetime of the filter set.
        # Corresponds to the JSON property `realtimeTimeRange`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RealtimeTimeRange]
        attr_accessor :realtime_time_range
      
        # A relative date range, specified by an offset and a duration.
        # The supported range of dates begins 30 days before today and ends today,
        # i.e., the limits for these values are:
        # offset_days >= 0
        # duration_days >= 1
        # offset_days + duration_days <= 30
        # Corresponds to the JSON property `relativeDateRange`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RelativeDateRange]
        attr_accessor :relative_date_range
      
        # For Authorized Buyers only.
        # The list of IDs of the seller (publisher) networks on which to filter;
        # may be empty. The filters represented by multiple seller network IDs are
        # ORed together (i.e., if non-empty, results must match any one of the
        # publisher networks). See
        # [seller-network-ids](https://developers.google.com/authorized-buyers/rtb/
        # downloads/seller-network-ids)
        # file for the set of existing seller network IDs.
        # Corresponds to the JSON property `sellerNetworkIds`
        # @return [Array<Fixnum>]
        attr_accessor :seller_network_ids
      
        # The granularity of time intervals if a time series breakdown is desired;
        # optional.
        # Corresponds to the JSON property `timeSeriesGranularity`
        # @return [String]
        attr_accessor :time_series_granularity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @absolute_date_range = args[:absolute_date_range] if args.key?(:absolute_date_range)
          @breakdown_dimensions = args[:breakdown_dimensions] if args.key?(:breakdown_dimensions)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @deal_id = args[:deal_id] if args.key?(:deal_id)
          @environment = args[:environment] if args.key?(:environment)
          @formats = args[:formats] if args.key?(:formats)
          @name = args[:name] if args.key?(:name)
          @platforms = args[:platforms] if args.key?(:platforms)
          @publisher_identifiers = args[:publisher_identifiers] if args.key?(:publisher_identifiers)
          @realtime_time_range = args[:realtime_time_range] if args.key?(:realtime_time_range)
          @relative_date_range = args[:relative_date_range] if args.key?(:relative_date_range)
          @seller_network_ids = args[:seller_network_ids] if args.key?(:seller_network_ids)
          @time_series_granularity = args[:time_series_granularity] if args.key?(:time_series_granularity)
        end
      end
      
      # The number of filtered bids with the specified dimension values that have the
      # specified creative.
      class FilteredBidCreativeRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bid_count
      
        # The ID of the creative.
        # Corresponds to the JSON property `creativeId`
        # @return [String]
        attr_accessor :creative_id
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_count = args[:bid_count] if args.key?(:bid_count)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
        end
      end
      
      # The number of filtered bids with the specified dimension values, among those
      # filtered due to the requested filtering reason (i.e. creative status), that
      # have the specified detail.
      class FilteredBidDetailRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bid_count
      
        # The ID of the detail. The associated value can be looked up in the
        # dictionary file corresponding to the DetailType in the response message.
        # Corresponds to the JSON property `detailId`
        # @return [Fixnum]
        attr_accessor :detail_id
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_count = args[:bid_count] if args.key?(:bid_count)
          @detail_id = args[:detail_id] if args.key?(:detail_id)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
        end
      end
      
      # Represents a list of targeted and excluded mobile application IDs that
      # publishers own.
      # Mobile application IDs are from App Store and Google Play Store.
      # Android App ID, for example, com.google.android.apps.maps, can be found in
      # Google Play Store URL.
      # iOS App ID (which is a number) can be found at the end of iTunes store URL.
      # First party mobile applications is either included or excluded.
      class FirstPartyMobileApplicationTargeting
        include Google::Apis::Core::Hashable
      
        # A list of application IDs to be excluded.
        # Corresponds to the JSON property `excludedAppIds`
        # @return [Array<String>]
        attr_accessor :excluded_app_ids
      
        # A list of application IDs to be included.
        # Corresponds to the JSON property `targetedAppIds`
        # @return [Array<String>]
        attr_accessor :targeted_app_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_app_ids = args[:excluded_app_ids] if args.key?(:excluded_app_ids)
          @targeted_app_ids = args[:targeted_app_ids] if args.key?(:targeted_app_ids)
        end
      end
      
      # Frequency cap.
      class FrequencyCap
        include Google::Apis::Core::Hashable
      
        # The maximum number of impressions that can be served to a user within the
        # specified time period.
        # Corresponds to the JSON property `maxImpressions`
        # @return [Fixnum]
        attr_accessor :max_impressions
      
        # The amount of time, in the units specified by time_unit_type. Defines the
        # amount of time over which impressions per user are counted and capped.
        # Corresponds to the JSON property `numTimeUnits`
        # @return [Fixnum]
        attr_accessor :num_time_units
      
        # The time unit. Along with num_time_units defines the amount of time over
        # which impressions per user are counted and capped.
        # Corresponds to the JSON property `timeUnitType`
        # @return [String]
        attr_accessor :time_unit_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_impressions = args[:max_impressions] if args.key?(:max_impressions)
          @num_time_units = args[:num_time_units] if args.key?(:num_time_units)
          @time_unit_type = args[:time_unit_type] if args.key?(:time_unit_type)
        end
      end
      
      # Terms for Programmatic Guaranteed Deals.
      class GuaranteedFixedPriceTerms
        include Google::Apis::Core::Hashable
      
        # Fixed price for the specified buyer.
        # Corresponds to the JSON property `fixedPrices`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::PricePerBuyer>]
        attr_accessor :fixed_prices
      
        # Guaranteed impressions as a percentage. This is the percentage
        # of guaranteed looks that the buyer is guaranteeing to buy.
        # Corresponds to the JSON property `guaranteedImpressions`
        # @return [Fixnum]
        attr_accessor :guaranteed_impressions
      
        # Count of guaranteed looks. Required for deal, optional for product.
        # Corresponds to the JSON property `guaranteedLooks`
        # @return [Fixnum]
        attr_accessor :guaranteed_looks
      
        # Daily minimum looks for CPD deal types.
        # Corresponds to the JSON property `minimumDailyLooks`
        # @return [Fixnum]
        attr_accessor :minimum_daily_looks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fixed_prices = args[:fixed_prices] if args.key?(:fixed_prices)
          @guaranteed_impressions = args[:guaranteed_impressions] if args.key?(:guaranteed_impressions)
          @guaranteed_looks = args[:guaranteed_looks] if args.key?(:guaranteed_looks)
          @minimum_daily_looks = args[:minimum_daily_looks] if args.key?(:minimum_daily_looks)
        end
      end
      
      # HTML content for a creative.
      class HtmlContent
        include Google::Apis::Core::Hashable
      
        # The height of the HTML snippet in pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The HTML snippet that displays the ad when inserted in the web page.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # The width of the HTML snippet in pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @snippet = args[:snippet] if args.key?(:snippet)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # An image resource. You may provide a larger image than was requested,
      # so long as the aspect ratio is preserved.
      class Image
        include Google::Apis::Core::Hashable
      
        # Image height in pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The URL of the image.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # Image width in pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @url = args[:url] if args.key?(:url)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # The set of metrics that are measured in numbers of impressions, representing
      # how many impressions with the specified dimension values were considered
      # eligible at each stage of the bidding funnel.
      class ImpressionMetricsRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `availableImpressions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :available_impressions
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidRequests`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bid_requests
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `inventoryMatches`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :inventory_matches
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `responsesWithBids`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :responses_with_bids
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `successfulResponses`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :successful_responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_impressions = args[:available_impressions] if args.key?(:available_impressions)
          @bid_requests = args[:bid_requests] if args.key?(:bid_requests)
          @inventory_matches = args[:inventory_matches] if args.key?(:inventory_matches)
          @responses_with_bids = args[:responses_with_bids] if args.key?(:responses_with_bids)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
          @successful_responses = args[:successful_responses] if args.key?(:successful_responses)
        end
      end
      
      # Represents the size of an ad unit that can be targeted on an ad
      # request. It only applies to Private Auction, AdX Preferred Deals and
      # Auction Packages. This targeting does not apply to Programmatic Guaranteed
      # and Preferred Deals in Ad Manager.
      class InventorySizeTargeting
        include Google::Apis::Core::Hashable
      
        # A list of inventory sizes to be excluded.
        # Corresponds to the JSON property `excludedInventorySizes`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::AdSize>]
        attr_accessor :excluded_inventory_sizes
      
        # A list of inventory sizes to be included.
        # Corresponds to the JSON property `targetedInventorySizes`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::AdSize>]
        attr_accessor :targeted_inventory_sizes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_inventory_sizes = args[:excluded_inventory_sizes] if args.key?(:excluded_inventory_sizes)
          @targeted_inventory_sizes = args[:targeted_inventory_sizes] if args.key?(:targeted_inventory_sizes)
        end
      end
      
      # Response message for listing the metrics that are measured in number of bids.
      class ListBidMetricsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, each containing a set of bid metrics.
        # Corresponds to the JSON property `bidMetricsRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::BidMetricsRow>]
        attr_accessor :bid_metrics_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListBidMetricsRequest.pageToken
        # field in the subsequent call to the bidMetrics.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_metrics_rows = args[:bid_metrics_rows] if args.key?(:bid_metrics_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons that bid responses resulted in an
      # error.
      class ListBidResponseErrorsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of bid responses aggregated by callout status.
        # Corresponds to the JSON property `calloutStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CalloutStatusRow>]
        attr_accessor :callout_status_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListBidResponseErrorsRequest.pageToken
        # field in the subsequent call to the bidResponseErrors.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @callout_status_rows = args[:callout_status_rows] if args.key?(:callout_status_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons that bid responses were considered
      # to have no applicable bids.
      class ListBidResponsesWithoutBidsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of bid responses without bids aggregated by
        # status.
        # Corresponds to the JSON property `bidResponseWithoutBidsStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::BidResponseWithoutBidsStatusRow>]
        attr_accessor :bid_response_without_bids_status_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListBidResponsesWithoutBidsRequest.pageToken
        # field in the subsequent call to the bidResponsesWithoutBids.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_response_without_bids_status_rows = args[:bid_response_without_bids_status_rows] if args.key?(:bid_response_without_bids_status_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListClientUserInvitationsResponse
        include Google::Apis::Core::Hashable
      
        # The returned list of client users.
        # Corresponds to the JSON property `invitations`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ClientUserInvitation>]
        attr_accessor :invitations
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListClientUserInvitationsRequest.pageToken
        # field in the subsequent call to the
        # clients.invitations.list
        # method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @invitations = args[:invitations] if args.key?(:invitations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListClientUsersResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListClientUsersRequest.pageToken
        # field in the subsequent call to the
        # clients.invitations.list
        # method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The returned list of client users.
        # Corresponds to the JSON property `users`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ClientUser>]
        attr_accessor :users
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @users = args[:users] if args.key?(:users)
        end
      end
      
      # 
      class ListClientsResponse
        include Google::Apis::Core::Hashable
      
        # The returned list of clients.
        # Corresponds to the JSON property `clients`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Client>]
        attr_accessor :clients
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListClientsRequest.pageToken
        # field in the subsequent call to the
        # accounts.clients.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clients = args[:clients] if args.key?(:clients)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all creatives associated with a given filtered
      # bid reason.
      class ListCreativeStatusBreakdownByCreativeResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of bids with a given creative status aggregated
        # by creative.
        # Corresponds to the JSON property `filteredBidCreativeRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::FilteredBidCreativeRow>]
        attr_accessor :filtered_bid_creative_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListCreativeStatusBreakdownByCreativeRequest.pageToken
        # field in the subsequent call to the filteredBids.creatives.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filtered_bid_creative_rows = args[:filtered_bid_creative_rows] if args.key?(:filtered_bid_creative_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all details associated with a given filtered bid
      # reason.
      class ListCreativeStatusBreakdownByDetailResponse
        include Google::Apis::Core::Hashable
      
        # The type of detail that the detail IDs represent.
        # Corresponds to the JSON property `detailType`
        # @return [String]
        attr_accessor :detail_type
      
        # List of rows, with counts of bids with a given creative status aggregated
        # by detail.
        # Corresponds to the JSON property `filteredBidDetailRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::FilteredBidDetailRow>]
        attr_accessor :filtered_bid_detail_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListCreativeStatusBreakdownByDetailRequest.pageToken
        # field in the subsequent call to the filteredBids.details.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detail_type = args[:detail_type] if args.key?(:detail_type)
          @filtered_bid_detail_rows = args[:filtered_bid_detail_rows] if args.key?(:filtered_bid_detail_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A response for listing creatives.
      class ListCreativesResponse
        include Google::Apis::Core::Hashable
      
        # The list of creatives.
        # Corresponds to the JSON property `creatives`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Creative>]
        attr_accessor :creatives
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListCreativesRequest.page_token
        # field in the subsequent call to `ListCreatives` method to retrieve the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creatives = args[:creatives] if args.key?(:creatives)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A response for listing creative and deal associations
      class ListDealAssociationsResponse
        include Google::Apis::Core::Hashable
      
        # The list of associations.
        # Corresponds to the JSON property `associations`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CreativeDealAssociation>]
        attr_accessor :associations
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListDealAssociationsRequest.page_token
        # field in the subsequent call to 'ListDealAssociation' method to retrieve
        # the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @associations = args[:associations] if args.key?(:associations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing filter sets.
      class ListFilterSetsResponse
        include Google::Apis::Core::Hashable
      
        # The filter sets belonging to the buyer.
        # Corresponds to the JSON property `filterSets`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::FilterSet>]
        attr_accessor :filter_sets
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListFilterSetsRequest.pageToken
        # field in the subsequent call to the
        # accounts.filterSets.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_sets = args[:filter_sets] if args.key?(:filter_sets)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons that bid requests were filtered and
      # not sent to the buyer.
      class ListFilteredBidRequestsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of filtered bid requests aggregated by callout
        # status.
        # Corresponds to the JSON property `calloutStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CalloutStatusRow>]
        attr_accessor :callout_status_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListFilteredBidRequestsRequest.pageToken
        # field in the subsequent call to the filteredBidRequests.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @callout_status_rows = args[:callout_status_rows] if args.key?(:callout_status_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons that bids were filtered from the
      # auction.
      class ListFilteredBidsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of filtered bids aggregated by filtering reason
        # (i.e. creative status).
        # Corresponds to the JSON property `creativeStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CreativeStatusRow>]
        attr_accessor :creative_status_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListFilteredBidsRequest.pageToken
        # field in the subsequent call to the filteredBids.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_status_rows = args[:creative_status_rows] if args.key?(:creative_status_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing the metrics that are measured in number of
      # impressions.
      class ListImpressionMetricsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, each containing a set of impression metrics.
        # Corresponds to the JSON property `impressionMetricsRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ImpressionMetricsRow>]
        attr_accessor :impression_metrics_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListImpressionMetricsRequest.pageToken
        # field in the subsequent call to the impressionMetrics.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @impression_metrics_rows = args[:impression_metrics_rows] if args.key?(:impression_metrics_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons that bids lost in the auction.
      class ListLosingBidsResponse
        include Google::Apis::Core::Hashable
      
        # List of rows, with counts of losing bids aggregated by loss reason (i.e.
        # creative status).
        # Corresponds to the JSON property `creativeStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::CreativeStatusRow>]
        attr_accessor :creative_status_rows
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListLosingBidsRequest.pageToken
        # field in the subsequent call to the losingBids.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_status_rows = args[:creative_status_rows] if args.key?(:creative_status_rows)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for listing all reasons for which a buyer was not billed for
      # a winning bid.
      class ListNonBillableWinningBidsResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve the next page of results.
        # Pass this value in the
        # ListNonBillableWinningBidsRequest.pageToken
        # field in the subsequent call to the nonBillableWinningBids.list
        # method to retrieve the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of rows, with counts of bids not billed aggregated by reason.
        # Corresponds to the JSON property `nonBillableWinningBidStatusRows`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::NonBillableWinningBidStatusRow>]
        attr_accessor :non_billable_winning_bid_status_rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @non_billable_winning_bid_status_rows = args[:non_billable_winning_bid_status_rows] if args.key?(:non_billable_winning_bid_status_rows)
        end
      end
      
      # Response message for listing products visible to the buyer.
      class ListProductsResponse
        include Google::Apis::Core::Hashable
      
        # List pagination support.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of matching products at their head revision number.
        # Corresponds to the JSON property `products`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Product>]
        attr_accessor :products
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @products = args[:products] if args.key?(:products)
        end
      end
      
      # Response message for listing proposals.
      class ListProposalsResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of proposals.
        # Corresponds to the JSON property `proposals`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Proposal>]
        attr_accessor :proposals
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @proposals = args[:proposals] if args.key?(:proposals)
        end
      end
      
      # Response message for profiles visible to the buyer.
      class ListPublisherProfilesResponse
        include Google::Apis::Core::Hashable
      
        # List pagination support
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of matching publisher profiles.
        # Corresponds to the JSON property `publisherProfiles`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::PublisherProfile>]
        attr_accessor :publisher_profiles
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @publisher_profiles = args[:publisher_profiles] if args.key?(:publisher_profiles)
        end
      end
      
      # Output only. The Geo criteria the restriction applies to.
      class LocationContext
        include Google::Apis::Core::Hashable
      
        # IDs representing the geo location for this context.
        # Please refer to the
        # [geo-table.csv](https://storage.googleapis.com/adx-rtb-dictionaries/geo-table.
        # csv)
        # file for different geo criteria IDs.
        # Corresponds to the JSON property `geoCriteriaIds`
        # @return [Array<Fixnum>]
        attr_accessor :geo_criteria_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @geo_criteria_ids = args[:geo_criteria_ids] if args.key?(:geo_criteria_ids)
        end
      end
      
      # Targeting represents different criteria that can be used by advertisers to
      # target ad inventory. For example, they can choose to target ad requests only
      # if the user is in the US.
      # Multiple types of targeting are always applied as a logical AND, unless noted
      # otherwise.
      class MarketplaceTargeting
        include Google::Apis::Core::Hashable
      
        # Generic targeting used for targeting dimensions that contains a list of
        # included and excluded numeric IDs.
        # Corresponds to the JSON property `geoTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CriteriaTargeting]
        attr_accessor :geo_targeting
      
        # Represents the size of an ad unit that can be targeted on an ad
        # request. It only applies to Private Auction, AdX Preferred Deals and
        # Auction Packages. This targeting does not apply to Programmatic Guaranteed
        # and Preferred Deals in Ad Manager.
        # Corresponds to the JSON property `inventorySizeTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::InventorySizeTargeting]
        attr_accessor :inventory_size_targeting
      
        # Represents targeting about where the ads can appear, e.g., certain sites or
        # mobile applications.
        # Different placement targeting types will be logically OR'ed.
        # Corresponds to the JSON property `placementTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::PlacementTargeting]
        attr_accessor :placement_targeting
      
        # Represents targeting about various types of technology.
        # Corresponds to the JSON property `technologyTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::TechnologyTargeting]
        attr_accessor :technology_targeting
      
        # Represents targeting information about video.
        # Corresponds to the JSON property `videoTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::VideoTargeting]
        attr_accessor :video_targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @geo_targeting = args[:geo_targeting] if args.key?(:geo_targeting)
          @inventory_size_targeting = args[:inventory_size_targeting] if args.key?(:inventory_size_targeting)
          @placement_targeting = args[:placement_targeting] if args.key?(:placement_targeting)
          @technology_targeting = args[:technology_targeting] if args.key?(:technology_targeting)
          @video_targeting = args[:video_targeting] if args.key?(:video_targeting)
        end
      end
      
      # A metric value, with an expected value and a variance; represents a count
      # that may be either exact or estimated (i.e. when sampled).
      class MetricValue
        include Google::Apis::Core::Hashable
      
        # The expected value of the metric.
        # Corresponds to the JSON property `value`
        # @return [Fixnum]
        attr_accessor :value
      
        # The variance (i.e. square of the standard deviation) of the metric value.
        # If value is exact, variance is 0.
        # Can be used to calculate margin of error as a percentage of value, using
        # the following formula, where Z is the standard constant that depends on the
        # desired size of the confidence interval (e.g. for 90% confidence interval,
        # use Z = 1.645):
        # marginOfError = 100 * Z * sqrt(variance) / value
        # Corresponds to the JSON property `variance`
        # @return [Fixnum]
        attr_accessor :variance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value = args[:value] if args.key?(:value)
          @variance = args[:variance] if args.key?(:variance)
        end
      end
      
      # Mobile application targeting settings.
      class MobileApplicationTargeting
        include Google::Apis::Core::Hashable
      
        # Represents a list of targeted and excluded mobile application IDs that
        # publishers own.
        # Mobile application IDs are from App Store and Google Play Store.
        # Android App ID, for example, com.google.android.apps.maps, can be found in
        # Google Play Store URL.
        # iOS App ID (which is a number) can be found at the end of iTunes store URL.
        # First party mobile applications is either included or excluded.
        # Corresponds to the JSON property `firstPartyTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::FirstPartyMobileApplicationTargeting]
        attr_accessor :first_party_targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @first_party_targeting = args[:first_party_targeting] if args.key?(:first_party_targeting)
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
      
      # Native content for a creative.
      class NativeContent
        include Google::Apis::Core::Hashable
      
        # The name of the advertiser or sponsor, to be displayed in the ad creative.
        # Corresponds to the JSON property `advertiserName`
        # @return [String]
        attr_accessor :advertiser_name
      
        # An image resource. You may provide a larger image than was requested,
        # so long as the aspect ratio is preserved.
        # Corresponds to the JSON property `appIcon`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Image]
        attr_accessor :app_icon
      
        # A long description of the ad.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # A label for the button that the user is supposed to click.
        # Corresponds to the JSON property `callToAction`
        # @return [String]
        attr_accessor :call_to_action
      
        # The URL that the browser/SDK will load when the user clicks the ad.
        # Corresponds to the JSON property `clickLinkUrl`
        # @return [String]
        attr_accessor :click_link_url
      
        # The URL to use for click tracking.
        # Corresponds to the JSON property `clickTrackingUrl`
        # @return [String]
        attr_accessor :click_tracking_url
      
        # A short title for the ad.
        # Corresponds to the JSON property `headline`
        # @return [String]
        attr_accessor :headline
      
        # An image resource. You may provide a larger image than was requested,
        # so long as the aspect ratio is preserved.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Image]
        attr_accessor :image
      
        # An image resource. You may provide a larger image than was requested,
        # so long as the aspect ratio is preserved.
        # Corresponds to the JSON property `logo`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Image]
        attr_accessor :logo
      
        # The price of the promoted app including currency info.
        # Corresponds to the JSON property `priceDisplayText`
        # @return [String]
        attr_accessor :price_display_text
      
        # The app rating in the app store. Must be in the range [0-5].
        # Corresponds to the JSON property `starRating`
        # @return [Float]
        attr_accessor :star_rating
      
        # The URL to the app store to purchase/download the promoted app.
        # Corresponds to the JSON property `storeUrl`
        # @return [String]
        attr_accessor :store_url
      
        # The URL to fetch a native video ad.
        # Corresponds to the JSON property `videoUrl`
        # @return [String]
        attr_accessor :video_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertiser_name = args[:advertiser_name] if args.key?(:advertiser_name)
          @app_icon = args[:app_icon] if args.key?(:app_icon)
          @body = args[:body] if args.key?(:body)
          @call_to_action = args[:call_to_action] if args.key?(:call_to_action)
          @click_link_url = args[:click_link_url] if args.key?(:click_link_url)
          @click_tracking_url = args[:click_tracking_url] if args.key?(:click_tracking_url)
          @headline = args[:headline] if args.key?(:headline)
          @image = args[:image] if args.key?(:image)
          @logo = args[:logo] if args.key?(:logo)
          @price_display_text = args[:price_display_text] if args.key?(:price_display_text)
          @star_rating = args[:star_rating] if args.key?(:star_rating)
          @store_url = args[:store_url] if args.key?(:store_url)
          @video_url = args[:video_url] if args.key?(:video_url)
        end
      end
      
      # The number of winning bids with the specified dimension values for which the
      # buyer was not billed, as described by the specified status.
      class NonBillableWinningBidStatusRow
        include Google::Apis::Core::Hashable
      
        # A metric value, with an expected value and a variance; represents a count
        # that may be either exact or estimated (i.e. when sampled).
        # Corresponds to the JSON property `bidCount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MetricValue]
        attr_accessor :bid_count
      
        # A response may include multiple rows, breaking down along various dimensions.
        # Encapsulates the values of all dimensions for a given row.
        # Corresponds to the JSON property `rowDimensions`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::RowDimensions]
        attr_accessor :row_dimensions
      
        # The status specifying why the winning bids were not billed.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_count = args[:bid_count] if args.key?(:bid_count)
          @row_dimensions = args[:row_dimensions] if args.key?(:row_dimensions)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Terms for Private Auctions. Note that Private Auctions can be created only
      # by the seller, but they can be returned in a get or list request.
      class NonGuaranteedAuctionTerms
        include Google::Apis::Core::Hashable
      
        # True if open auction buyers are allowed to compete with invited buyers
        # in this private auction.
        # Corresponds to the JSON property `autoOptimizePrivateAuction`
        # @return [Boolean]
        attr_accessor :auto_optimize_private_auction
        alias_method :auto_optimize_private_auction?, :auto_optimize_private_auction
      
        # Reserve price for the specified buyer.
        # Corresponds to the JSON property `reservePricesPerBuyer`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::PricePerBuyer>]
        attr_accessor :reserve_prices_per_buyer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_optimize_private_auction = args[:auto_optimize_private_auction] if args.key?(:auto_optimize_private_auction)
          @reserve_prices_per_buyer = args[:reserve_prices_per_buyer] if args.key?(:reserve_prices_per_buyer)
        end
      end
      
      # Terms for Preferred Deals. Note that Preferred Deals cannot be created via
      # the API at this time, but can be returned in a get or list request.
      class NonGuaranteedFixedPriceTerms
        include Google::Apis::Core::Hashable
      
        # Fixed price for the specified buyer.
        # Corresponds to the JSON property `fixedPrices`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::PricePerBuyer>]
        attr_accessor :fixed_prices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fixed_prices = args[:fixed_prices] if args.key?(:fixed_prices)
        end
      end
      
      # A proposal may be associated to several notes.
      class Note
        include Google::Apis::Core::Hashable
      
        # Output only. The timestamp for when this note was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The role of the person (buyer/seller) creating the note.
        # Corresponds to the JSON property `creatorRole`
        # @return [String]
        attr_accessor :creator_role
      
        # The actual note to attach.
        # (max-length: 1024 unicode code units)
        # Note: This field may be set only when creating the resource. Modifying
        # this field while updating the resource will result in an error.
        # Corresponds to the JSON property `note`
        # @return [String]
        attr_accessor :note
      
        # Output only. The unique ID for the note.
        # Corresponds to the JSON property `noteId`
        # @return [String]
        attr_accessor :note_id
      
        # Output only. The revision number of the proposal when the note is created.
        # Corresponds to the JSON property `proposalRevision`
        # @return [Fixnum]
        attr_accessor :proposal_revision
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @creator_role = args[:creator_role] if args.key?(:creator_role)
          @note = args[:note] if args.key?(:note)
          @note_id = args[:note_id] if args.key?(:note_id)
          @proposal_revision = args[:proposal_revision] if args.key?(:proposal_revision)
        end
      end
      
      # Represents targeting information for operating systems.
      class OperatingSystemTargeting
        include Google::Apis::Core::Hashable
      
        # Generic targeting used for targeting dimensions that contains a list of
        # included and excluded numeric IDs.
        # Corresponds to the JSON property `operatingSystemCriteria`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CriteriaTargeting]
        attr_accessor :operating_system_criteria
      
        # Generic targeting used for targeting dimensions that contains a list of
        # included and excluded numeric IDs.
        # Corresponds to the JSON property `operatingSystemVersionCriteria`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CriteriaTargeting]
        attr_accessor :operating_system_version_criteria
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operating_system_criteria = args[:operating_system_criteria] if args.key?(:operating_system_criteria)
          @operating_system_version_criteria = args[:operating_system_version_criteria] if args.key?(:operating_system_version_criteria)
        end
      end
      
      # Request message to pause serving for an already-finalized proposal.
      class PauseProposalRequest
        include Google::Apis::Core::Hashable
      
        # The reason why the proposal is being paused.
        # This human readable message will be displayed in the seller's UI.
        # (Max length: 1000 unicode code units.)
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # Represents targeting about where the ads can appear, e.g., certain sites or
      # mobile applications.
      # Different placement targeting types will be logically OR'ed.
      class PlacementTargeting
        include Google::Apis::Core::Hashable
      
        # Mobile application targeting settings.
        # Corresponds to the JSON property `mobileApplicationTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::MobileApplicationTargeting]
        attr_accessor :mobile_application_targeting
      
        # Represents a list of targeted and excluded URLs (e.g., google.com).
        # For Private Auction and AdX Preferred Deals, URLs are either included or
        # excluded.
        # For Programmatic Guaranteed and Preferred Deals, this doesn't
        # apply.
        # Corresponds to the JSON property `urlTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::UrlTargeting]
        attr_accessor :url_targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mobile_application_targeting = args[:mobile_application_targeting] if args.key?(:mobile_application_targeting)
          @url_targeting = args[:url_targeting] if args.key?(:url_targeting)
        end
      end
      
      # Output only. The type of platform the restriction applies to.
      class PlatformContext
        include Google::Apis::Core::Hashable
      
        # The platforms this restriction applies to.
        # Corresponds to the JSON property `platforms`
        # @return [Array<String>]
        attr_accessor :platforms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @platforms = args[:platforms] if args.key?(:platforms)
        end
      end
      
      # Represents a price and a pricing type for a product / deal.
      class Price
        include Google::Apis::Core::Hashable
      
        # Represents an amount of money with its currency type.
        # Corresponds to the JSON property `amount`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Money]
        attr_accessor :amount
      
        # The pricing type for the deal/product. (default: CPM)
        # Corresponds to the JSON property `pricingType`
        # @return [String]
        attr_accessor :pricing_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount = args[:amount] if args.key?(:amount)
          @pricing_type = args[:pricing_type] if args.key?(:pricing_type)
        end
      end
      
      # Used to specify pricing rules for buyers/advertisers. Each PricePerBuyer in
      # a product can become 0 or 1 deals. To check if there is a PricePerBuyer for
      # a particular buyer or buyer/advertiser pair, we look for the most specific
      # matching rule - we first look for a rule matching the buyer and advertiser,
      # next a rule with the buyer but an empty advertiser list, and otherwise look
      # for a matching rule where no buyer is set.
      class PricePerBuyer
        include Google::Apis::Core::Hashable
      
        # The list of advertisers for this price when associated with this buyer.
        # If empty, all advertisers with this buyer pay this price.
        # Corresponds to the JSON property `advertiserIds`
        # @return [Array<String>]
        attr_accessor :advertiser_ids
      
        # Represents a buyer of inventory. Each buyer is identified by a unique
        # Authorized Buyers account ID.
        # Corresponds to the JSON property `buyer`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Buyer]
        attr_accessor :buyer
      
        # Represents a price and a pricing type for a product / deal.
        # Corresponds to the JSON property `price`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Price]
        attr_accessor :price
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertiser_ids = args[:advertiser_ids] if args.key?(:advertiser_ids)
          @buyer = args[:buyer] if args.key?(:buyer)
          @price = args[:price] if args.key?(:price)
        end
      end
      
      # Buyers are allowed to store certain types of private data in a proposal/deal.
      class PrivateData
        include Google::Apis::Core::Hashable
      
        # A buyer or seller specified reference ID. This can be queried in the list
        # operations (max-length: 1024 unicode code units).
        # Corresponds to the JSON property `referenceId`
        # @return [String]
        attr_accessor :reference_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_id = args[:reference_id] if args.key?(:reference_id)
        end
      end
      
      # Note: this resource requires whitelisting for access. Please contact your
      # account manager for access to Marketplace resources.
      # A product is a segment of inventory that a seller wishes to sell. It is
      # associated with certain terms and targeting information which helps the buyer
      # know more about the inventory.
      class Product
        include Google::Apis::Core::Hashable
      
        # The proposed end time for the deal. The field will be truncated to the
        # order of seconds during serving.
        # Corresponds to the JSON property `availableEndTime`
        # @return [String]
        attr_accessor :available_end_time
      
        # Inventory availability dates. The start time will be truncated to seconds
        # during serving. Thus, a field specified as 3:23:34.456 (HH:mm:ss.SSS) will
        # be truncated to 3:23:34 when serving.
        # Corresponds to the JSON property `availableStartTime`
        # @return [String]
        attr_accessor :available_start_time
      
        # Creation time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional contact information for the creator of this product.
        # Corresponds to the JSON property `creatorContacts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ContactInformation>]
        attr_accessor :creator_contacts
      
        # The display name for this product as set by the seller.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # If the creator has already signed off on the product, then the buyer can
        # finalize the deal by accepting the product as is. When copying to a
        # proposal, if any of the terms are changed, then auto_finalize is
        # automatically set to false.
        # Corresponds to the JSON property `hasCreatorSignedOff`
        # @return [Boolean]
        attr_accessor :has_creator_signed_off
        alias_method :has_creator_signed_off?, :has_creator_signed_off
      
        # The unique ID for the product.
        # Corresponds to the JSON property `productId`
        # @return [String]
        attr_accessor :product_id
      
        # The revision number of the product (auto-assigned by Marketplace).
        # Corresponds to the JSON property `productRevision`
        # @return [Fixnum]
        attr_accessor :product_revision
      
        # An ID which can be used by the Publisher Profile API to get more
        # information about the seller that created this product.
        # Corresponds to the JSON property `publisherProfileId`
        # @return [String]
        attr_accessor :publisher_profile_id
      
        # Represents a seller of inventory. Each seller is identified by a unique
        # Ad Manager account ID.
        # Corresponds to the JSON property `seller`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Seller]
        attr_accessor :seller
      
        # The syndication product associated with the deal.
        # Corresponds to the JSON property `syndicationProduct`
        # @return [String]
        attr_accessor :syndication_product
      
        # Targeting that is shared between the buyer and the seller. Each targeting
        # criterion has a specified key and for each key there is a list of inclusion
        # value or exclusion values.
        # Corresponds to the JSON property `targetingCriterion`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::TargetingCriteria>]
        attr_accessor :targeting_criterion
      
        # The deal terms specify the details of a Product/deal. They specify things
        # like price per buyer, the type of pricing model (e.g., fixed price, auction)
        # and expected impressions from the publisher.
        # Corresponds to the JSON property `terms`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DealTerms]
        attr_accessor :terms
      
        # Time of last update.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # The web-property code for the seller. This needs to be copied as is when
        # adding a new deal to a proposal.
        # Corresponds to the JSON property `webPropertyCode`
        # @return [String]
        attr_accessor :web_property_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_end_time = args[:available_end_time] if args.key?(:available_end_time)
          @available_start_time = args[:available_start_time] if args.key?(:available_start_time)
          @create_time = args[:create_time] if args.key?(:create_time)
          @creator_contacts = args[:creator_contacts] if args.key?(:creator_contacts)
          @display_name = args[:display_name] if args.key?(:display_name)
          @has_creator_signed_off = args[:has_creator_signed_off] if args.key?(:has_creator_signed_off)
          @product_id = args[:product_id] if args.key?(:product_id)
          @product_revision = args[:product_revision] if args.key?(:product_revision)
          @publisher_profile_id = args[:publisher_profile_id] if args.key?(:publisher_profile_id)
          @seller = args[:seller] if args.key?(:seller)
          @syndication_product = args[:syndication_product] if args.key?(:syndication_product)
          @targeting_criterion = args[:targeting_criterion] if args.key?(:targeting_criterion)
          @terms = args[:terms] if args.key?(:terms)
          @update_time = args[:update_time] if args.key?(:update_time)
          @web_property_code = args[:web_property_code] if args.key?(:web_property_code)
        end
      end
      
      # Note: this resource requires whitelisting for access. Please contact your
      # account manager for access to Marketplace resources.
      # Represents a proposal in the Marketplace. A proposal is the unit of
      # negotiation between a seller and a buyer and contains deals which
      # are served.
      # Note: you can not update, create, or otherwise modify Private
      # Auction or Preferred Deals deals through the API.
      # Fields are updatable unless noted otherwise.
      class Proposal
        include Google::Apis::Core::Hashable
      
        # Represents a buyer of inventory. Each buyer is identified by a unique
        # Authorized Buyers account ID.
        # Corresponds to the JSON property `billedBuyer`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Buyer]
        attr_accessor :billed_buyer
      
        # Represents a buyer of inventory. Each buyer is identified by a unique
        # Authorized Buyers account ID.
        # Corresponds to the JSON property `buyer`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Buyer]
        attr_accessor :buyer
      
        # Contact information for the buyer.
        # Corresponds to the JSON property `buyerContacts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ContactInformation>]
        attr_accessor :buyer_contacts
      
        # Buyers are allowed to store certain types of private data in a proposal/deal.
        # Corresponds to the JSON property `buyerPrivateData`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::PrivateData]
        attr_accessor :buyer_private_data
      
        # The deals associated with this proposal. For Private Auction proposals
        # (whose deals have NonGuaranteedAuctionTerms), there will only be one deal.
        # Corresponds to the JSON property `deals`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Deal>]
        attr_accessor :deals
      
        # The name for the proposal.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. True if the proposal is being renegotiated.
        # Corresponds to the JSON property `isRenegotiating`
        # @return [Boolean]
        attr_accessor :is_renegotiating
        alias_method :is_renegotiating?, :is_renegotiating
      
        # Output only. True, if the buyside inventory setup is complete for this
        # proposal.
        # Corresponds to the JSON property `isSetupComplete`
        # @return [Boolean]
        attr_accessor :is_setup_complete
        alias_method :is_setup_complete?, :is_setup_complete
      
        # Output only. The role of the last user that either updated the proposal or
        # left a comment.
        # Corresponds to the JSON property `lastUpdaterOrCommentorRole`
        # @return [String]
        attr_accessor :last_updater_or_commentor_role
      
        # Output only. The notes associated with this proposal.
        # Corresponds to the JSON property `notes`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Note>]
        attr_accessor :notes
      
        # Output only. Indicates whether the buyer/seller created the proposal.
        # Corresponds to the JSON property `originatorRole`
        # @return [String]
        attr_accessor :originator_role
      
        # Output only. Private auction ID if this proposal is a private auction
        # proposal.
        # Corresponds to the JSON property `privateAuctionId`
        # @return [String]
        attr_accessor :private_auction_id
      
        # Output only. The unique ID of the proposal.
        # Corresponds to the JSON property `proposalId`
        # @return [String]
        attr_accessor :proposal_id
      
        # Output only. The revision number for the proposal.
        # Each update to the proposal or the deal causes the proposal revision number
        # to auto-increment. The buyer keeps track of the last revision number they
        # know of and pass it in when making an update. If the head revision number
        # on the server has since incremented, then an ABORTED error is returned
        # during the update operation to let the buyer know that a subsequent update
        # was made.
        # Corresponds to the JSON property `proposalRevision`
        # @return [Fixnum]
        attr_accessor :proposal_revision
      
        # Output only. The current state of the proposal.
        # Corresponds to the JSON property `proposalState`
        # @return [String]
        attr_accessor :proposal_state
      
        # Represents a seller of inventory. Each seller is identified by a unique
        # Ad Manager account ID.
        # Corresponds to the JSON property `seller`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Seller]
        attr_accessor :seller
      
        # Output only. Contact information for the seller.
        # Corresponds to the JSON property `sellerContacts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ContactInformation>]
        attr_accessor :seller_contacts
      
        # Output only. The time when the proposal was last revised.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @billed_buyer = args[:billed_buyer] if args.key?(:billed_buyer)
          @buyer = args[:buyer] if args.key?(:buyer)
          @buyer_contacts = args[:buyer_contacts] if args.key?(:buyer_contacts)
          @buyer_private_data = args[:buyer_private_data] if args.key?(:buyer_private_data)
          @deals = args[:deals] if args.key?(:deals)
          @display_name = args[:display_name] if args.key?(:display_name)
          @is_renegotiating = args[:is_renegotiating] if args.key?(:is_renegotiating)
          @is_setup_complete = args[:is_setup_complete] if args.key?(:is_setup_complete)
          @last_updater_or_commentor_role = args[:last_updater_or_commentor_role] if args.key?(:last_updater_or_commentor_role)
          @notes = args[:notes] if args.key?(:notes)
          @originator_role = args[:originator_role] if args.key?(:originator_role)
          @private_auction_id = args[:private_auction_id] if args.key?(:private_auction_id)
          @proposal_id = args[:proposal_id] if args.key?(:proposal_id)
          @proposal_revision = args[:proposal_revision] if args.key?(:proposal_revision)
          @proposal_state = args[:proposal_state] if args.key?(:proposal_state)
          @seller = args[:seller] if args.key?(:seller)
          @seller_contacts = args[:seller_contacts] if args.key?(:seller_contacts)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Note: this resource requires whitelisting for access. Please contact your
      # account manager for access to Marketplace resources.
      # Represents a publisher profile in Marketplace.
      # All fields are read only. All string fields are free-form text entered by the
      # publisher unless noted otherwise.
      class PublisherProfile
        include Google::Apis::Core::Hashable
      
        # Description on the publisher's audience.
        # Corresponds to the JSON property `audienceDescription`
        # @return [String]
        attr_accessor :audience_description
      
        # Statement explaining what's unique about publisher's business, and why
        # buyers should partner with the publisher.
        # Corresponds to the JSON property `buyerPitchStatement`
        # @return [String]
        attr_accessor :buyer_pitch_statement
      
        # Contact information for direct reservation deals. This is free text entered
        # by the publisher and may include information like names, phone numbers and
        # email addresses.
        # Corresponds to the JSON property `directDealsContact`
        # @return [String]
        attr_accessor :direct_deals_contact
      
        # Name of the publisher profile.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The list of domains represented in this publisher profile. Empty if this is
        # a parent profile. These are top private domains, meaning that these will
        # not contain a string like "photos.google.co.uk/123", but will instead
        # contain "google.co.uk".
        # Corresponds to the JSON property `domains`
        # @return [Array<String>]
        attr_accessor :domains
      
        # URL to publisher's Google+ page.
        # Corresponds to the JSON property `googlePlusUrl`
        # @return [String]
        attr_accessor :google_plus_url
      
        # A Google public URL to the logo for this publisher profile. The logo is
        # stored as a PNG, JPG, or GIF image.
        # Corresponds to the JSON property `logoUrl`
        # @return [String]
        attr_accessor :logo_url
      
        # URL to additional marketing and sales materials.
        # Corresponds to the JSON property `mediaKitUrl`
        # @return [String]
        attr_accessor :media_kit_url
      
        # Overview of the publisher.
        # Corresponds to the JSON property `overview`
        # @return [String]
        attr_accessor :overview
      
        # Contact information for programmatic deals. This is free text entered by
        # the publisher and may include information like names, phone numbers and
        # email addresses.
        # Corresponds to the JSON property `programmaticDealsContact`
        # @return [String]
        attr_accessor :programmatic_deals_contact
      
        # Unique ID for publisher profile.
        # Corresponds to the JSON property `publisherProfileId`
        # @return [String]
        attr_accessor :publisher_profile_id
      
        # URL to a publisher rate card.
        # Corresponds to the JSON property `rateCardInfoUrl`
        # @return [String]
        attr_accessor :rate_card_info_url
      
        # URL to a sample content page.
        # Corresponds to the JSON property `samplePageUrl`
        # @return [String]
        attr_accessor :sample_page_url
      
        # Represents a seller of inventory. Each seller is identified by a unique
        # Ad Manager account ID.
        # Corresponds to the JSON property `seller`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Seller]
        attr_accessor :seller
      
        # Up to three key metrics and rankings. Max 100 characters each.
        # For example "#1 Mobile News Site for 20 Straight Months".
        # Corresponds to the JSON property `topHeadlines`
        # @return [Array<String>]
        attr_accessor :top_headlines
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audience_description = args[:audience_description] if args.key?(:audience_description)
          @buyer_pitch_statement = args[:buyer_pitch_statement] if args.key?(:buyer_pitch_statement)
          @direct_deals_contact = args[:direct_deals_contact] if args.key?(:direct_deals_contact)
          @display_name = args[:display_name] if args.key?(:display_name)
          @domains = args[:domains] if args.key?(:domains)
          @google_plus_url = args[:google_plus_url] if args.key?(:google_plus_url)
          @logo_url = args[:logo_url] if args.key?(:logo_url)
          @media_kit_url = args[:media_kit_url] if args.key?(:media_kit_url)
          @overview = args[:overview] if args.key?(:overview)
          @programmatic_deals_contact = args[:programmatic_deals_contact] if args.key?(:programmatic_deals_contact)
          @publisher_profile_id = args[:publisher_profile_id] if args.key?(:publisher_profile_id)
          @rate_card_info_url = args[:rate_card_info_url] if args.key?(:rate_card_info_url)
          @sample_page_url = args[:sample_page_url] if args.key?(:sample_page_url)
          @seller = args[:seller] if args.key?(:seller)
          @top_headlines = args[:top_headlines] if args.key?(:top_headlines)
        end
      end
      
      # An open-ended realtime time range specified by the start timestamp.
      # For filter sets that specify a realtime time range RTB metrics continue to
      # be aggregated throughout the lifetime of the filter set.
      class RealtimeTimeRange
        include Google::Apis::Core::Hashable
      
        # The start timestamp of the real-time RTB metrics aggregation.
        # Corresponds to the JSON property `startTimestamp`
        # @return [String]
        attr_accessor :start_timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @start_timestamp = args[:start_timestamp] if args.key?(:start_timestamp)
        end
      end
      
      # A relative date range, specified by an offset and a duration.
      # The supported range of dates begins 30 days before today and ends today,
      # i.e., the limits for these values are:
      # offset_days >= 0
      # duration_days >= 1
      # offset_days + duration_days <= 30
      class RelativeDateRange
        include Google::Apis::Core::Hashable
      
        # The number of days in the requested date range, e.g., for a range spanning
        # today: 1. For a range spanning the last 7 days: 7.
        # Corresponds to the JSON property `durationDays`
        # @return [Fixnum]
        attr_accessor :duration_days
      
        # The end date of the filter set, specified as the number of days before
        # today, e.g., for a range where the last date is today: 0.
        # Corresponds to the JSON property `offsetDays`
        # @return [Fixnum]
        attr_accessor :offset_days
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration_days = args[:duration_days] if args.key?(:duration_days)
          @offset_days = args[:offset_days] if args.key?(:offset_days)
        end
      end
      
      # A request for removing the association between a deal and a creative.
      class RemoveDealAssociationRequest
        include Google::Apis::Core::Hashable
      
        # The association between a creative and a deal.
        # Corresponds to the JSON property `association`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CreativeDealAssociation]
        attr_accessor :association
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @association = args[:association] if args.key?(:association)
        end
      end
      
      # Request message to resume (unpause) serving for an already-finalized
      # proposal.
      class ResumeProposalRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A response may include multiple rows, breaking down along various dimensions.
      # Encapsulates the values of all dimensions for a given row.
      class RowDimensions
        include Google::Apis::Core::Hashable
      
        # The publisher identifier for this row, if a breakdown by
        # [BreakdownDimension.PUBLISHER_IDENTIFIER](https://developers.google.com/
        # authorized-buyers/apis/reference/rest/v2beta1/bidders.accounts.filterSets#
        # FilterSet.BreakdownDimension)
        # was requested.
        # Corresponds to the JSON property `publisherIdentifier`
        # @return [String]
        attr_accessor :publisher_identifier
      
        # An interval of time, with an absolute start and end.
        # Corresponds to the JSON property `timeInterval`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::TimeInterval]
        attr_accessor :time_interval
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @publisher_identifier = args[:publisher_identifier] if args.key?(:publisher_identifier)
          @time_interval = args[:time_interval] if args.key?(:time_interval)
        end
      end
      
      # Output only. A security context.
      class SecurityContext
        include Google::Apis::Core::Hashable
      
        # The security types in this context.
        # Corresponds to the JSON property `securities`
        # @return [Array<String>]
        attr_accessor :securities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @securities = args[:securities] if args.key?(:securities)
        end
      end
      
      # Represents a seller of inventory. Each seller is identified by a unique
      # Ad Manager account ID.
      class Seller
        include Google::Apis::Core::Hashable
      
        # The unique ID for the seller. The seller fills in this field.
        # The seller account ID is then available to buyer in the product.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Optional sub-account ID for the seller.
        # Corresponds to the JSON property `subAccountId`
        # @return [String]
        attr_accessor :sub_account_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @sub_account_id = args[:sub_account_id] if args.key?(:sub_account_id)
        end
      end
      
      # The serving context for this restriction.
      class ServingContext
        include Google::Apis::Core::Hashable
      
        # Matches all contexts.
        # Corresponds to the JSON property `all`
        # @return [String]
        attr_accessor :all
      
        # Output only. The app type the restriction applies to for mobile device.
        # Corresponds to the JSON property `appType`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::AppContext]
        attr_accessor :app_type
      
        # Output only. The auction type the restriction applies to.
        # Corresponds to the JSON property `auctionType`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::AuctionContext]
        attr_accessor :auction_type
      
        # Output only. The Geo criteria the restriction applies to.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::LocationContext]
        attr_accessor :location
      
        # Output only. The type of platform the restriction applies to.
        # Corresponds to the JSON property `platform`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::PlatformContext]
        attr_accessor :platform
      
        # Output only. A security context.
        # Corresponds to the JSON property `securityType`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::SecurityContext]
        attr_accessor :security_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all = args[:all] if args.key?(:all)
          @app_type = args[:app_type] if args.key?(:app_type)
          @auction_type = args[:auction_type] if args.key?(:auction_type)
          @location = args[:location] if args.key?(:location)
          @platform = args[:platform] if args.key?(:platform)
          @security_type = args[:security_type] if args.key?(:security_type)
        end
      end
      
      # Output only. A representation of the status of an ad in a
      # specific context. A context here relates to where something ultimately serves
      # (for example, a user or publisher geo, a platform, an HTTPS vs HTTP request,
      # or the type of auction).
      class ServingRestriction
        include Google::Apis::Core::Hashable
      
        # The contexts for the restriction.
        # Corresponds to the JSON property `contexts`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::ServingContext>]
        attr_accessor :contexts
      
        # Output only. The reason and details for a disapproval.
        # Corresponds to the JSON property `disapproval`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::Disapproval]
        attr_accessor :disapproval
      
        # Any disapprovals bound to this restriction.
        # Only present if status=DISAPPROVED.
        # Can be used to filter the response of the
        # creatives.list
        # method.
        # Deprecated; please use
        # disapproval
        # field instead.
        # Corresponds to the JSON property `disapprovalReasons`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::Disapproval>]
        attr_accessor :disapproval_reasons
      
        # The status of the creative in this context (for example, it has been
        # explicitly disapproved or is pending review).
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contexts = args[:contexts] if args.key?(:contexts)
          @disapproval = args[:disapproval] if args.key?(:disapproval)
          @disapproval_reasons = args[:disapproval_reasons] if args.key?(:disapproval_reasons)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Message depicting the size of the creative. The units of width and
      # height depend on the type of the targeting.
      class Size
        include Google::Apis::Core::Hashable
      
        # The height of the creative.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The width of the creative
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # A request for stopping notifications for changes to creative Status.
      class StopWatchingCreativeRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Advertisers can target different attributes of an ad slot. For example,
      # they can choose to show ads only if the user is in the U.S. Such
      # targeting criteria can be specified as part of Shared Targeting.
      class TargetingCriteria
        include Google::Apis::Core::Hashable
      
        # The list of values to exclude from targeting. Each value is AND'd
        # together.
        # Corresponds to the JSON property `exclusions`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::TargetingValue>]
        attr_accessor :exclusions
      
        # The list of value to include as part of the targeting. Each value is OR'd
        # together.
        # Corresponds to the JSON property `inclusions`
        # @return [Array<Google::Apis::Adexchangebuyer2V2beta1::TargetingValue>]
        attr_accessor :inclusions
      
        # The key representing the shared targeting criterion.
        # Targeting criteria defined by Google ad servers will begin with GOOG_.
        # Third parties may define their own keys.
        # A list of permissible keys along with the acceptable values will be
        # provided as part of the external documentation.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusions = args[:exclusions] if args.key?(:exclusions)
          @inclusions = args[:inclusions] if args.key?(:inclusions)
          @key = args[:key] if args.key?(:key)
        end
      end
      
      # A polymorphic targeting value used as part of Shared Targeting.
      class TargetingValue
        include Google::Apis::Core::Hashable
      
        # Specifies the size of the creative.
        # Corresponds to the JSON property `creativeSizeValue`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CreativeSize]
        attr_accessor :creative_size_value
      
        # Specifies the day part targeting criteria.
        # Corresponds to the JSON property `dayPartTargetingValue`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::DayPartTargeting]
        attr_accessor :day_part_targeting_value
      
        # The long value to include/exclude.
        # Corresponds to the JSON property `longValue`
        # @return [Fixnum]
        attr_accessor :long_value
      
        # The string value to include/exclude.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_size_value = args[:creative_size_value] if args.key?(:creative_size_value)
          @day_part_targeting_value = args[:day_part_targeting_value] if args.key?(:day_part_targeting_value)
          @long_value = args[:long_value] if args.key?(:long_value)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # Represents targeting about various types of technology.
      class TechnologyTargeting
        include Google::Apis::Core::Hashable
      
        # Generic targeting used for targeting dimensions that contains a list of
        # included and excluded numeric IDs.
        # Corresponds to the JSON property `deviceCapabilityTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CriteriaTargeting]
        attr_accessor :device_capability_targeting
      
        # Generic targeting used for targeting dimensions that contains a list of
        # included and excluded numeric IDs.
        # Corresponds to the JSON property `deviceCategoryTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::CriteriaTargeting]
        attr_accessor :device_category_targeting
      
        # Represents targeting information for operating systems.
        # Corresponds to the JSON property `operatingSystemTargeting`
        # @return [Google::Apis::Adexchangebuyer2V2beta1::OperatingSystemTargeting]
        attr_accessor :operating_system_targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_capability_targeting = args[:device_capability_targeting] if args.key?(:device_capability_targeting)
          @device_category_targeting = args[:device_category_targeting] if args.key?(:device_category_targeting)
          @operating_system_targeting = args[:operating_system_targeting] if args.key?(:operating_system_targeting)
        end
      end
      
      # An interval of time, with an absolute start and end.
      class TimeInterval
        include Google::Apis::Core::Hashable
      
        # The timestamp marking the end of the range (exclusive) for which data is
        # included.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The timestamp marking the start of the range (inclusive) for which data is
        # included.
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
      
      # Represents a time of day. The date and time zone are either not significant
      # or are specified elsewhere. An API may choose to allow leap seconds. Related
      # types are google.type.Date and `google.protobuf.Timestamp`.
      class TimeOfDay
        include Google::Apis::Core::Hashable
      
        # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose
        # to allow the value "24:00:00" for scenarios like business closing time.
        # Corresponds to the JSON property `hours`
        # @return [Fixnum]
        attr_accessor :hours
      
        # Minutes of hour of day. Must be from 0 to 59.
        # Corresponds to the JSON property `minutes`
        # @return [Fixnum]
        attr_accessor :minutes
      
        # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # Seconds of minutes of the time. Must normally be from 0 to 59. An API may
        # allow the value 60 if it allows leap-seconds.
        # Corresponds to the JSON property `seconds`
        # @return [Fixnum]
        attr_accessor :seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hours = args[:hours] if args.key?(:hours)
          @minutes = args[:minutes] if args.key?(:minutes)
          @nanos = args[:nanos] if args.key?(:nanos)
          @seconds = args[:seconds] if args.key?(:seconds)
        end
      end
      
      # Represents a list of targeted and excluded URLs (e.g., google.com).
      # For Private Auction and AdX Preferred Deals, URLs are either included or
      # excluded.
      # For Programmatic Guaranteed and Preferred Deals, this doesn't
      # apply.
      class UrlTargeting
        include Google::Apis::Core::Hashable
      
        # A list of URLs to be excluded.
        # Corresponds to the JSON property `excludedUrls`
        # @return [Array<String>]
        attr_accessor :excluded_urls
      
        # A list of URLs to be included.
        # Corresponds to the JSON property `targetedUrls`
        # @return [Array<String>]
        attr_accessor :targeted_urls
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_urls = args[:excluded_urls] if args.key?(:excluded_urls)
          @targeted_urls = args[:targeted_urls] if args.key?(:targeted_urls)
        end
      end
      
      # Video content for a creative.
      class VideoContent
        include Google::Apis::Core::Hashable
      
        # The URL to fetch a video ad.
        # Corresponds to the JSON property `videoUrl`
        # @return [String]
        attr_accessor :video_url
      
        # The contents of a VAST document for a video ad.
        # This document should conform to the VAST 2.0 or 3.0 standard.
        # Corresponds to the JSON property `videoVastXml`
        # @return [String]
        attr_accessor :video_vast_xml
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @video_url = args[:video_url] if args.key?(:video_url)
          @video_vast_xml = args[:video_vast_xml] if args.key?(:video_vast_xml)
        end
      end
      
      # Represents targeting information about video.
      class VideoTargeting
        include Google::Apis::Core::Hashable
      
        # A list of video positions to be excluded.
        # Position types can either be included or excluded (XOR).
        # Corresponds to the JSON property `excludedPositionTypes`
        # @return [Array<String>]
        attr_accessor :excluded_position_types
      
        # A list of video positions to be included.
        # When the included list is present, the excluded list must be empty.
        # When the excluded list is present, the included list must be empty.
        # Corresponds to the JSON property `targetedPositionTypes`
        # @return [Array<String>]
        attr_accessor :targeted_position_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_position_types = args[:excluded_position_types] if args.key?(:excluded_position_types)
          @targeted_position_types = args[:targeted_position_types] if args.key?(:targeted_position_types)
        end
      end
      
      # A request for watching changes to creative Status.
      class WatchCreativeRequest
        include Google::Apis::Core::Hashable
      
        # The Pub/Sub topic to publish notifications to.
        # This topic must already exist and must give permission to
        # ad-exchange-buyside-reports@google.com to write to the topic.
        # This should be the full resource name in
        # "projects/`project_id`/topics/`topic_id`" format.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
    end
  end
end
