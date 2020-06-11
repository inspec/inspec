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
    module ResellerV1
      
      # JSON template for address of a customer.
      class Address
        include Google::Apis::Core::Hashable
      
        # A customer's physical address. An address can be composed of one to three
        # lines. The addressline2 and addressLine3 are optional.
        # Corresponds to the JSON property `addressLine1`
        # @return [String]
        attr_accessor :address_line1
      
        # Line 2 of the address.
        # Corresponds to the JSON property `addressLine2`
        # @return [String]
        attr_accessor :address_line2
      
        # Line 3 of the address.
        # Corresponds to the JSON property `addressLine3`
        # @return [String]
        attr_accessor :address_line3
      
        # The customer contact's name. This is required.
        # Corresponds to the JSON property `contactName`
        # @return [String]
        attr_accessor :contact_name
      
        # For countryCode information, see the ISO 3166 country code elements. Verify
        # that country is approved for resale of Google products. This property is
        # required when creating a new customer.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # Identifies the resource as a customer address. Value: customers#address
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An example of a locality value is the city of San Francisco.
        # Corresponds to the JSON property `locality`
        # @return [String]
        attr_accessor :locality
      
        # The company or company division name. This is required.
        # Corresponds to the JSON property `organizationName`
        # @return [String]
        attr_accessor :organization_name
      
        # A postalCode example is a postal zip code such as 94043. This property is
        # required when creating a new customer.
        # Corresponds to the JSON property `postalCode`
        # @return [String]
        attr_accessor :postal_code
      
        # An example of a region value is CA for the state of California.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address_line1 = args[:address_line1] if args.key?(:address_line1)
          @address_line2 = args[:address_line2] if args.key?(:address_line2)
          @address_line3 = args[:address_line3] if args.key?(:address_line3)
          @contact_name = args[:contact_name] if args.key?(:contact_name)
          @country_code = args[:country_code] if args.key?(:country_code)
          @kind = args[:kind] if args.key?(:kind)
          @locality = args[:locality] if args.key?(:locality)
          @organization_name = args[:organization_name] if args.key?(:organization_name)
          @postal_code = args[:postal_code] if args.key?(:postal_code)
          @region = args[:region] if args.key?(:region)
        end
      end
      
      # JSON template for the ChangePlan rpc request.
      class ChangePlanRequest
        include Google::Apis::Core::Hashable
      
        # Google-issued code (100 char max) for discounted pricing on subscription plans.
        # Deal code must be included in changePlan request in order to receive
        # discounted rate. This property is optional. If a deal code has already been
        # added to a subscription, this property may be left empty and the existing
        # discounted rate will still apply (if not empty, only provide the deal code
        # that is already present on the subscription). If a deal code has never been
        # added to a subscription and this property is left blank, regular pricing will
        # apply.
        # Corresponds to the JSON property `dealCode`
        # @return [String]
        attr_accessor :deal_code
      
        # Identifies the resource as a subscription change plan request. Value:
        # subscriptions#changePlanRequest
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The planName property is required. This is the name of the subscription's
        # payment plan. For more information about the Google payment plans, see API
        # concepts.
        # Possible values are:
        # - ANNUAL_MONTHLY_PAY - The annual commitment plan with monthly payments
        # Caution: ANNUAL_MONTHLY_PAY is returned as ANNUAL in all API responses.
        # - ANNUAL_YEARLY_PAY - The annual commitment plan with yearly payments
        # - FLEXIBLE - The flexible plan
        # - TRIAL - The 30-day free trial plan
        # Corresponds to the JSON property `planName`
        # @return [String]
        attr_accessor :plan_name
      
        # This is an optional property. This purchase order (PO) information is for
        # resellers to use for their company tracking usage. If a purchaseOrderId value
        # is given it appears in the API responses and shows up in the invoice. The
        # property accepts up to 80 plain text characters.
        # Corresponds to the JSON property `purchaseOrderId`
        # @return [String]
        attr_accessor :purchase_order_id
      
        # JSON template for subscription seats.
        # Corresponds to the JSON property `seats`
        # @return [Google::Apis::ResellerV1::Seats]
        attr_accessor :seats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deal_code = args[:deal_code] if args.key?(:deal_code)
          @kind = args[:kind] if args.key?(:kind)
          @plan_name = args[:plan_name] if args.key?(:plan_name)
          @purchase_order_id = args[:purchase_order_id] if args.key?(:purchase_order_id)
          @seats = args[:seats] if args.key?(:seats)
        end
      end
      
      # JSON template for a customer.
      class Customer
        include Google::Apis::Core::Hashable
      
        # Like the "Customer email" in the reseller tools, this email is the secondary
        # contact used if something happens to the customer's service such as service
        # outage or a security issue. This property is required when creating a new
        # customer and should not use the same domain as customerDomain.
        # Corresponds to the JSON property `alternateEmail`
        # @return [String]
        attr_accessor :alternate_email
      
        # The customer's primary domain name string. customerDomain is required when
        # creating a new customer. Do not include the www prefix in the domain when
        # adding a customer.
        # Corresponds to the JSON property `customerDomain`
        # @return [String]
        attr_accessor :customer_domain
      
        # Whether the customer's primary domain has been verified.
        # Corresponds to the JSON property `customerDomainVerified`
        # @return [Boolean]
        attr_accessor :customer_domain_verified
        alias_method :customer_domain_verified?, :customer_domain_verified
      
        # This property will always be returned in a response as the unique identifier
        # generated by Google. In a request, this property can be either the primary
        # domain or the unique identifier generated by Google.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Identifies the resource as a customer. Value: reseller#customer
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Customer contact phone number. Must start with "+" followed by the country
        # code. The rest of the number can be contiguous numbers or respect the phone
        # local format conventions, but it must be a real phone number and not, for
        # example, "123". This field is silently ignored if invalid.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # JSON template for address of a customer.
        # Corresponds to the JSON property `postalAddress`
        # @return [Google::Apis::ResellerV1::Address]
        attr_accessor :postal_address
      
        # URL to customer's Admin console dashboard. The read-only URL is generated by
        # the API service. This is used if your client application requires the customer
        # to complete a task in the Admin console.
        # Corresponds to the JSON property `resourceUiUrl`
        # @return [String]
        attr_accessor :resource_ui_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternate_email = args[:alternate_email] if args.key?(:alternate_email)
          @customer_domain = args[:customer_domain] if args.key?(:customer_domain)
          @customer_domain_verified = args[:customer_domain_verified] if args.key?(:customer_domain_verified)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @kind = args[:kind] if args.key?(:kind)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @postal_address = args[:postal_address] if args.key?(:postal_address)
          @resource_ui_url = args[:resource_ui_url] if args.key?(:resource_ui_url)
        end
      end
      
      # JSON template for a subscription renewal settings.
      class RenewalSettings
        include Google::Apis::Core::Hashable
      
        # Identifies the resource as a subscription renewal setting. Value:
        # subscriptions#renewalSettings
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Renewal settings for the annual commitment plan. For more detailed information,
        # see renewal options in the administrator help center. When renewing a
        # subscription, the renewalType is a required property.
        # Corresponds to the JSON property `renewalType`
        # @return [String]
        attr_accessor :renewal_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @renewal_type = args[:renewal_type] if args.key?(:renewal_type)
        end
      end
      
      # JSON template for resellernotify getwatchdetails response.
      class ResellernotifyGetwatchdetailsResponse
        include Google::Apis::Core::Hashable
      
        # List of registered service accounts.
        # Corresponds to the JSON property `serviceAccountEmailAddresses`
        # @return [Array<String>]
        attr_accessor :service_account_email_addresses
      
        # Topic name of the PubSub
        # Corresponds to the JSON property `topicName`
        # @return [String]
        attr_accessor :topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service_account_email_addresses = args[:service_account_email_addresses] if args.key?(:service_account_email_addresses)
          @topic_name = args[:topic_name] if args.key?(:topic_name)
        end
      end
      
      # JSON template for resellernotify response.
      class ResellernotifyResource
        include Google::Apis::Core::Hashable
      
        # Topic name of the PubSub
        # Corresponds to the JSON property `topicName`
        # @return [String]
        attr_accessor :topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @topic_name = args[:topic_name] if args.key?(:topic_name)
        end
      end
      
      # JSON template for subscription seats.
      class Seats
        include Google::Apis::Core::Hashable
      
        # Identifies the resource as a subscription seat setting. Value: subscriptions#
        # seats
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Read-only field containing the current number of users that are assigned a
        # license for the product defined in skuId. This field's value is equivalent to
        # the numerical count of users returned by the Enterprise License Manager API
        # method: listForProductAndSku
        # Corresponds to the JSON property `licensedNumberOfSeats`
        # @return [Fixnum]
        attr_accessor :licensed_number_of_seats
      
        # This is a required property and is exclusive to subscriptions with FLEXIBLE or
        # TRIAL plans. This property sets the maximum number of licensed users allowed
        # on a subscription. This quantity can be increased up to the maximum limit
        # defined in the reseller's contract. The minimum quantity is the current number
        # of users in the customer account. Note: G Suite subscriptions automatically
        # assign a license to every user.
        # Corresponds to the JSON property `maximumNumberOfSeats`
        # @return [Fixnum]
        attr_accessor :maximum_number_of_seats
      
        # This is a required property and is exclusive to subscriptions with
        # ANNUAL_MONTHLY_PAY and ANNUAL_YEARLY_PAY plans. This property sets the maximum
        # number of licenses assignable to users on a subscription. The reseller can add
        # more licenses, but once set, the numberOfSeats cannot be reduced until renewal.
        # The reseller is invoiced based on the numberOfSeats value regardless of how
        # many of these user licenses are assigned. Note: G Suite subscriptions
        # automatically assign a license to every user.
        # Corresponds to the JSON property `numberOfSeats`
        # @return [Fixnum]
        attr_accessor :number_of_seats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @licensed_number_of_seats = args[:licensed_number_of_seats] if args.key?(:licensed_number_of_seats)
          @maximum_number_of_seats = args[:maximum_number_of_seats] if args.key?(:maximum_number_of_seats)
          @number_of_seats = args[:number_of_seats] if args.key?(:number_of_seats)
        end
      end
      
      # JSON template for a subscription.
      class Subscription
        include Google::Apis::Core::Hashable
      
        # Read-only field that returns the current billing method for a subscription.
        # Corresponds to the JSON property `billingMethod`
        # @return [String]
        attr_accessor :billing_method
      
        # The creationTime property is the date when subscription was created. It is in
        # milliseconds using the Epoch format. See an example Epoch converter.
        # Corresponds to the JSON property `creationTime`
        # @return [Fixnum]
        attr_accessor :creation_time
      
        # Primary domain name of the customer
        # Corresponds to the JSON property `customerDomain`
        # @return [String]
        attr_accessor :customer_domain
      
        # This property will always be returned in a response as the unique identifier
        # generated by Google. In a request, this property can be either the primary
        # domain or the unique identifier generated by Google.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Google-issued code (100 char max) for discounted pricing on subscription plans.
        # Deal code must be included in insert requests in order to receive discounted
        # rate. This property is optional, regular pricing applies if left empty.
        # Corresponds to the JSON property `dealCode`
        # @return [String]
        attr_accessor :deal_code
      
        # Identifies the resource as a Subscription. Value: reseller#subscription
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The plan property is required. In this version of the API, the G Suite plans
        # are the flexible plan, annual commitment plan, and the 30-day free trial plan.
        # For more information about the API"s payment plans, see the API concepts.
        # Corresponds to the JSON property `plan`
        # @return [Google::Apis::ResellerV1::Subscription::Plan]
        attr_accessor :plan
      
        # This is an optional property. This purchase order (PO) information is for
        # resellers to use for their company tracking usage. If a purchaseOrderId value
        # is given it appears in the API responses and shows up in the invoice. The
        # property accepts up to 80 plain text characters.
        # Corresponds to the JSON property `purchaseOrderId`
        # @return [String]
        attr_accessor :purchase_order_id
      
        # JSON template for a subscription renewal settings.
        # Corresponds to the JSON property `renewalSettings`
        # @return [Google::Apis::ResellerV1::RenewalSettings]
        attr_accessor :renewal_settings
      
        # URL to customer's Subscriptions page in the Admin console. The read-only URL
        # is generated by the API service. This is used if your client application
        # requires the customer to complete a task using the Subscriptions page in the
        # Admin console.
        # Corresponds to the JSON property `resourceUiUrl`
        # @return [String]
        attr_accessor :resource_ui_url
      
        # JSON template for subscription seats.
        # Corresponds to the JSON property `seats`
        # @return [Google::Apis::ResellerV1::Seats]
        attr_accessor :seats
      
        # A required property. The skuId is a unique system identifier for a product's
        # SKU assigned to a customer in the subscription. For products and SKUs
        # available in this version of the API, see  Product and SKU IDs.
        # Corresponds to the JSON property `skuId`
        # @return [String]
        attr_accessor :sku_id
      
        # Read-only external display name for a product's SKU assigned to a customer in
        # the subscription. SKU names are subject to change at Google's discretion. For
        # products and SKUs available in this version of the API, see  Product and SKU
        # IDs.
        # Corresponds to the JSON property `skuName`
        # @return [String]
        attr_accessor :sku_name
      
        # This is an optional property.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The subscriptionId is the subscription identifier and is unique for each
        # customer. This is a required property. Since a subscriptionId changes when a
        # subscription is updated, we recommend not using this ID as a key for
        # persistent data. Use the subscriptionId as described in retrieve all reseller
        # subscriptions.
        # Corresponds to the JSON property `subscriptionId`
        # @return [String]
        attr_accessor :subscription_id
      
        # Read-only field containing an enumerable of all the current suspension reasons
        # for a subscription. It is possible for a subscription to have many concurrent,
        # overlapping suspension reasons. A subscription's STATUS is SUSPENDED until all
        # pending suspensions are removed.
        # Possible options include:
        # - PENDING_TOS_ACCEPTANCE - The customer has not logged in and accepted the G
        # Suite Resold Terms of Services.
        # - RENEWAL_WITH_TYPE_CANCEL - The customer's commitment ended and their service
        # was cancelled at the end of their term.
        # - RESELLER_INITIATED - A manual suspension invoked by a Reseller.
        # - TRIAL_ENDED - The customer's trial expired without a plan selected.
        # - OTHER - The customer is suspended for an internal Google reason (e.g. abuse
        # or otherwise).
        # Corresponds to the JSON property `suspensionReasons`
        # @return [Array<String>]
        attr_accessor :suspension_reasons
      
        # Read-only transfer related information for the subscription. For more
        # information, see retrieve transferable subscriptions for a customer.
        # Corresponds to the JSON property `transferInfo`
        # @return [Google::Apis::ResellerV1::Subscription::TransferInfo]
        attr_accessor :transfer_info
      
        # The G Suite annual commitment and flexible payment plans can be in a 30-day
        # free trial. For more information, see the API concepts.
        # Corresponds to the JSON property `trialSettings`
        # @return [Google::Apis::ResellerV1::Subscription::TrialSettings]
        attr_accessor :trial_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @billing_method = args[:billing_method] if args.key?(:billing_method)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @customer_domain = args[:customer_domain] if args.key?(:customer_domain)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @deal_code = args[:deal_code] if args.key?(:deal_code)
          @kind = args[:kind] if args.key?(:kind)
          @plan = args[:plan] if args.key?(:plan)
          @purchase_order_id = args[:purchase_order_id] if args.key?(:purchase_order_id)
          @renewal_settings = args[:renewal_settings] if args.key?(:renewal_settings)
          @resource_ui_url = args[:resource_ui_url] if args.key?(:resource_ui_url)
          @seats = args[:seats] if args.key?(:seats)
          @sku_id = args[:sku_id] if args.key?(:sku_id)
          @sku_name = args[:sku_name] if args.key?(:sku_name)
          @status = args[:status] if args.key?(:status)
          @subscription_id = args[:subscription_id] if args.key?(:subscription_id)
          @suspension_reasons = args[:suspension_reasons] if args.key?(:suspension_reasons)
          @transfer_info = args[:transfer_info] if args.key?(:transfer_info)
          @trial_settings = args[:trial_settings] if args.key?(:trial_settings)
        end
        
        # The plan property is required. In this version of the API, the G Suite plans
        # are the flexible plan, annual commitment plan, and the 30-day free trial plan.
        # For more information about the API"s payment plans, see the API concepts.
        class Plan
          include Google::Apis::Core::Hashable
        
          # In this version of the API, annual commitment plan's interval is one year.
          # Note: When billingMethod value is OFFLINE, the subscription property object
          # plan.commitmentInterval is omitted in all API responses.
          # Corresponds to the JSON property `commitmentInterval`
          # @return [Google::Apis::ResellerV1::Subscription::Plan::CommitmentInterval]
          attr_accessor :commitment_interval
        
          # The isCommitmentPlan property's boolean value identifies the plan as an annual
          # commitment plan:
          # - true — The subscription's plan is an annual commitment plan.
          # - false — The plan is not an annual commitment plan.
          # Corresponds to the JSON property `isCommitmentPlan`
          # @return [Boolean]
          attr_accessor :is_commitment_plan
          alias_method :is_commitment_plan?, :is_commitment_plan
        
          # The planName property is required. This is the name of the subscription's plan.
          # For more information about the Google payment plans, see the API concepts.
          # Possible values are:
          # - ANNUAL_MONTHLY_PAY — The annual commitment plan with monthly payments.
          # Caution: ANNUAL_MONTHLY_PAY is returned as ANNUAL in all API responses.
          # - ANNUAL_YEARLY_PAY — The annual commitment plan with yearly payments
          # - FLEXIBLE — The flexible plan
          # - TRIAL — The 30-day free trial plan. A subscription in trial will be
          # suspended after the 30th free day if no payment plan is assigned. Calling
          # changePlan will assign a payment plan to a trial but will not activate the
          # plan. A trial will automatically begin its assigned payment plan after its
          # 30th free day or immediately after calling startPaidService.
          # - FREE — The free plan is exclusive to the Cloud Identity SKU and does not
          # incur any billing.
          # Corresponds to the JSON property `planName`
          # @return [String]
          attr_accessor :plan_name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @commitment_interval = args[:commitment_interval] if args.key?(:commitment_interval)
            @is_commitment_plan = args[:is_commitment_plan] if args.key?(:is_commitment_plan)
            @plan_name = args[:plan_name] if args.key?(:plan_name)
          end
          
          # In this version of the API, annual commitment plan's interval is one year.
          # Note: When billingMethod value is OFFLINE, the subscription property object
          # plan.commitmentInterval is omitted in all API responses.
          class CommitmentInterval
            include Google::Apis::Core::Hashable
          
            # An annual commitment plan's interval's endTime in milliseconds using the UNIX
            # Epoch format. See an example Epoch converter.
            # Corresponds to the JSON property `endTime`
            # @return [Fixnum]
            attr_accessor :end_time
          
            # An annual commitment plan's interval's startTime in milliseconds using UNIX
            # Epoch format. See an example Epoch converter.
            # Corresponds to the JSON property `startTime`
            # @return [Fixnum]
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
        end
        
        # Read-only transfer related information for the subscription. For more
        # information, see retrieve transferable subscriptions for a customer.
        class TransferInfo
          include Google::Apis::Core::Hashable
        
          # When inserting a subscription, this is the minimum number of seats listed in
          # the transfer order for this product. For example, if the customer has 20 users,
          # the reseller cannot place a transfer order of 15 seats. The minimum is 20
          # seats.
          # Corresponds to the JSON property `minimumTransferableSeats`
          # @return [Fixnum]
          attr_accessor :minimum_transferable_seats
        
          # The time when transfer token or intent to transfer will expire. The time is in
          # milliseconds using UNIX Epoch format.
          # Corresponds to the JSON property `transferabilityExpirationTime`
          # @return [Fixnum]
          attr_accessor :transferability_expiration_time
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @minimum_transferable_seats = args[:minimum_transferable_seats] if args.key?(:minimum_transferable_seats)
            @transferability_expiration_time = args[:transferability_expiration_time] if args.key?(:transferability_expiration_time)
          end
        end
        
        # The G Suite annual commitment and flexible payment plans can be in a 30-day
        # free trial. For more information, see the API concepts.
        class TrialSettings
          include Google::Apis::Core::Hashable
        
          # Determines if a subscription's plan is in a 30-day free trial or not:
          # - true — The plan is in trial.
          # - false — The plan is not in trial.
          # Corresponds to the JSON property `isInTrial`
          # @return [Boolean]
          attr_accessor :is_in_trial
          alias_method :is_in_trial?, :is_in_trial
        
          # Date when the trial ends. The value is in milliseconds using the UNIX Epoch
          # format. See an example Epoch converter.
          # Corresponds to the JSON property `trialEndTime`
          # @return [Fixnum]
          attr_accessor :trial_end_time
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @is_in_trial = args[:is_in_trial] if args.key?(:is_in_trial)
            @trial_end_time = args[:trial_end_time] if args.key?(:trial_end_time)
          end
        end
      end
      
      # JSON template for a subscription list.
      class Subscriptions
        include Google::Apis::Core::Hashable
      
        # Identifies the resource as a collection of subscriptions. Value: reseller#
        # subscriptions
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The subscriptions in this page of results.
        # Corresponds to the JSON property `subscriptions`
        # @return [Array<Google::Apis::ResellerV1::Subscription>]
        attr_accessor :subscriptions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @subscriptions = args[:subscriptions] if args.key?(:subscriptions)
        end
      end
    end
  end
end
