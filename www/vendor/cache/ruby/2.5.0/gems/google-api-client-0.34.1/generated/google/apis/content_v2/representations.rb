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
    module ContentV2
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountAdwordsLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountBusinessInformation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountCustomerService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountGoogleMyBusinessLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountIdentifier
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusAccountLevelIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusDataQualityIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusExampleItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusItemLevelIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusProducts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusStatistics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTax
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTaxTaxRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountYouTubeChannelLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsAuthInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsClaimWebsiteResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsCustomBatchRequestEntryLinkRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsLinkRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsLinkResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAccountsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountStatusesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusesBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountStatusesBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAccountStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountTaxRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTaxBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchAccountTaxResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTaxBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAccountTaxResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Amount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BusinessDayConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CarrierRate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CarriersCarrier
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttribute
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerReturnReason
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CutoffTime
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Datafeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedFetchSchedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedFormat
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedStatusError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedStatusExample
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedTarget
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDatafeedsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedsBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDatafeedsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedsBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedsFetchNowResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDatafeedsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDatafeedStatusesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedStatusesBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDatafeedStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatafeedStatusesBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDatafeedStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeliveryTime
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Error
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Errors
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GmbAccounts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GmbAccountsGmbAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Headers
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HolidayCutoff
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HolidaysHoliday
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Installment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Inventory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchInventoryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InventoryBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchInventoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InventoryBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InventoryPickup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetInventoryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetInventoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvoiceSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InvoiceSummaryAdditionalChargeSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaAboutPageSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaCountrySettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaInventorySettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaOnDisplayToOrderSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaPosDataProvider
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiaSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsCustomBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsCustomBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsCustomBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsCustomBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsGetAccessibleGmbAccountsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsListPosDataProvidersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsRequestGmbAccessResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsRequestInventoryVerificationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsSetInventoryVerificationContactResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LiasettingsSetPosDataProviderResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationIdSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoyaltyPoints
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MerchantOrderReturn
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MerchantOrderReturnItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Order
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderCancellation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderCustomer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderCustomerMarketingRightsInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderDeliveryDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLegacyPromotion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLegacyPromotionBenefit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemProduct
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemProductFee
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemProductVariantAttribute
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemReturnInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemShippingDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderLineItemShippingDetailsMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderMerchantProvidedAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderPaymentMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderPickupDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderPickupDetailsCollector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderRefund
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderReportDisbursement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderReportTransaction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderReturn
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderShipment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderShipmentLineItemShipment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCreateChargeInvoiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCreateChargeInvoiceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCreateRefundInvoiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCreateRefundInvoiceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderreportsListDisbursementsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderreportsListTransactionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderreturnsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersAcknowledgeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersAcknowledgeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersAdvanceTestOrderResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelLineItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelLineItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelTestOrderByCustomerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCancelTestOrderByCustomerResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCreateTestOrderRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCreateTestOrderResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCreateTestReturnRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCreateTestReturnResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryCancel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryCancelLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryCreateTestReturnReturnItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryInStoreRefundLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryRefund
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryRejectReturnLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryReturnLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryReturnRefundLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntrySetLineItemMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryShipLineItems
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchRequestEntryUpdateShipment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersCustomBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersGetByMerchantOrderIdResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersGetTestOrderTemplateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersInStoreRefundLineItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersInStoreRefundLineItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersRefundRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersRefundResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersRejectReturnLineItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersRejectReturnLineItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersReturnLineItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersReturnLineItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersReturnRefundLineItemRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersReturnRefundLineItemResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersSetLineItemMetadataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersSetLineItemMetadataResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersShipLineItemsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersShipLineItemsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateLineItemShippingDetailsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateLineItemShippingDetailsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateMerchantOrderIdRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateMerchantOrderIdResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateShipmentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersUpdateShipmentResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosCustomBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosCustomBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosCustomBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosCustomBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosDataProviders
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosDataProvidersPosDataProvider
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosInventory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosInventoryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosInventoryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosSale
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosSaleRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosSaleResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosStore
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalCodeGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalCodeRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Price
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductAmount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductAspect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductShipping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductShippingDimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductShippingWeight
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatusDataQualityIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatusDestinationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatusItemLevelIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductTax
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductUnitPricingBaseMeasure
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductUnitPricingMeasure
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchProductsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductsBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductsBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchProductStatusesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatusesBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchProductStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductStatusesBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductStatusesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Promotion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RateGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RefundReason
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReturnShipment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Row
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShipmentInvoice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShipmentInvoiceLineItemInvoice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShipmentTrackingInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsCustomBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsCustomBatchRequestEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsCustomBatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsCustomBatchResponseEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsGetSupportedCarriersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsGetSupportedHolidaysResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShippingsettingsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrderCustomer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrderCustomerMarketingRightsInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrderLineItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrderLineItemProduct
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestOrderPaymentMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransitTable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransitTableTransitTimeRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TransitTableTransitTimeRowTransitTimeValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnitInvoice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnitInvoiceAdditionalCharge
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnitInvoiceTaxLine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Value
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Weight
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adult_content, as: 'adultContent'
          collection :adwords_links, as: 'adwordsLinks', class: Google::Apis::ContentV2::AccountAdwordsLink, decorator: Google::Apis::ContentV2::AccountAdwordsLink::Representation
      
          property :business_information, as: 'businessInformation', class: Google::Apis::ContentV2::AccountBusinessInformation, decorator: Google::Apis::ContentV2::AccountBusinessInformation::Representation
      
          property :google_my_business_link, as: 'googleMyBusinessLink', class: Google::Apis::ContentV2::AccountGoogleMyBusinessLink, decorator: Google::Apis::ContentV2::AccountGoogleMyBusinessLink::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :reviews_url, as: 'reviewsUrl'
          property :seller_id, as: 'sellerId'
          collection :users, as: 'users', class: Google::Apis::ContentV2::AccountUser, decorator: Google::Apis::ContentV2::AccountUser::Representation
      
          property :website_url, as: 'websiteUrl'
          collection :youtube_channel_links, as: 'youtubeChannelLinks', class: Google::Apis::ContentV2::AccountYouTubeChannelLink, decorator: Google::Apis::ContentV2::AccountYouTubeChannelLink::Representation
      
        end
      end
      
      class AccountAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :locality, as: 'locality'
          property :postal_code, as: 'postalCode'
          property :region, as: 'region'
          property :street_address, as: 'streetAddress'
        end
      end
      
      class AccountAdwordsLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adwords_id, :numeric_string => true, as: 'adwordsId'
          property :status, as: 'status'
        end
      end
      
      class AccountBusinessInformation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::ContentV2::AccountAddress, decorator: Google::Apis::ContentV2::AccountAddress::Representation
      
          property :customer_service, as: 'customerService', class: Google::Apis::ContentV2::AccountCustomerService, decorator: Google::Apis::ContentV2::AccountCustomerService::Representation
      
          property :phone_number, as: 'phoneNumber'
        end
      end
      
      class AccountCustomerService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :phone_number, as: 'phoneNumber'
          property :url, as: 'url'
        end
      end
      
      class AccountGoogleMyBusinessLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gmb_email, as: 'gmbEmail'
          property :status, as: 'status'
        end
      end
      
      class AccountIdentifier
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregator_id, :numeric_string => true, as: 'aggregatorId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
        end
      end
      
      class AccountStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          collection :account_level_issues, as: 'accountLevelIssues', class: Google::Apis::ContentV2::AccountStatusAccountLevelIssue, decorator: Google::Apis::ContentV2::AccountStatusAccountLevelIssue::Representation
      
          collection :data_quality_issues, as: 'dataQualityIssues', class: Google::Apis::ContentV2::AccountStatusDataQualityIssue, decorator: Google::Apis::ContentV2::AccountStatusDataQualityIssue::Representation
      
          property :kind, as: 'kind'
          collection :products, as: 'products', class: Google::Apis::ContentV2::AccountStatusProducts, decorator: Google::Apis::ContentV2::AccountStatusProducts::Representation
      
          property :website_claimed, as: 'websiteClaimed'
        end
      end
      
      class AccountStatusAccountLevelIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :destination, as: 'destination'
          property :detail, as: 'detail'
          property :documentation, as: 'documentation'
          property :id, as: 'id'
          property :severity, as: 'severity'
          property :title, as: 'title'
        end
      end
      
      class AccountStatusDataQualityIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :destination, as: 'destination'
          property :detail, as: 'detail'
          property :displayed_value, as: 'displayedValue'
          collection :example_items, as: 'exampleItems', class: Google::Apis::ContentV2::AccountStatusExampleItem, decorator: Google::Apis::ContentV2::AccountStatusExampleItem::Representation
      
          property :id, as: 'id'
          property :last_checked, as: 'lastChecked'
          property :location, as: 'location'
          property :num_items, as: 'numItems'
          property :severity, as: 'severity'
          property :submitted_value, as: 'submittedValue'
        end
      end
      
      class AccountStatusExampleItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_id, as: 'itemId'
          property :link, as: 'link'
          property :submitted_value, as: 'submittedValue'
          property :title, as: 'title'
          property :value_on_landing_page, as: 'valueOnLandingPage'
        end
      end
      
      class AccountStatusItemLevelIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribute_name, as: 'attributeName'
          property :code, as: 'code'
          property :description, as: 'description'
          property :detail, as: 'detail'
          property :documentation, as: 'documentation'
          property :num_items, :numeric_string => true, as: 'numItems'
          property :resolution, as: 'resolution'
          property :servability, as: 'servability'
        end
      end
      
      class AccountStatusProducts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel, as: 'channel'
          property :country, as: 'country'
          property :destination, as: 'destination'
          collection :item_level_issues, as: 'itemLevelIssues', class: Google::Apis::ContentV2::AccountStatusItemLevelIssue, decorator: Google::Apis::ContentV2::AccountStatusItemLevelIssue::Representation
      
          property :statistics, as: 'statistics', class: Google::Apis::ContentV2::AccountStatusStatistics, decorator: Google::Apis::ContentV2::AccountStatusStatistics::Representation
      
        end
      end
      
      class AccountStatusStatistics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, :numeric_string => true, as: 'active'
          property :disapproved, :numeric_string => true, as: 'disapproved'
          property :expiring, :numeric_string => true, as: 'expiring'
          property :pending, :numeric_string => true, as: 'pending'
        end
      end
      
      class AccountTax
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :kind, as: 'kind'
          collection :rules, as: 'rules', class: Google::Apis::ContentV2::AccountTaxTaxRule, decorator: Google::Apis::ContentV2::AccountTaxTaxRule::Representation
      
        end
      end
      
      class AccountTaxTaxRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :location_id, :numeric_string => true, as: 'locationId'
          property :rate_percent, as: 'ratePercent'
          property :shipping_taxed, as: 'shippingTaxed'
          property :use_global_rate, as: 'useGlobalRate'
        end
      end
      
      class AccountUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admin, as: 'admin'
          property :email_address, as: 'emailAddress'
          property :order_manager, as: 'orderManager'
          property :payments_analyst, as: 'paymentsAnalyst'
          property :payments_manager, as: 'paymentsManager'
        end
      end
      
      class AccountYouTubeChannelLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :channel_id, as: 'channelId'
          property :status, as: 'status'
        end
      end
      
      class AccountsAuthInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_identifiers, as: 'accountIdentifiers', class: Google::Apis::ContentV2::AccountIdentifier, decorator: Google::Apis::ContentV2::AccountIdentifier::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountsClaimWebsiteResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class BatchAccountsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountsBatchRequestEntry, decorator: Google::Apis::ContentV2::AccountsBatchRequestEntry::Representation
      
        end
      end
      
      class AccountsBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account, as: 'account', class: Google::Apis::ContentV2::Account, decorator: Google::Apis::ContentV2::Account::Representation
      
          property :account_id, :numeric_string => true, as: 'accountId'
          property :batch_id, as: 'batchId'
          property :force, as: 'force'
          property :link_request, as: 'linkRequest', class: Google::Apis::ContentV2::AccountsCustomBatchRequestEntryLinkRequest, decorator: Google::Apis::ContentV2::AccountsCustomBatchRequestEntryLinkRequest::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
          property :overwrite, as: 'overwrite'
        end
      end
      
      class AccountsCustomBatchRequestEntryLinkRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :link_type, as: 'linkType'
          property :linked_account_id, as: 'linkedAccountId'
        end
      end
      
      class BatchAccountsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountsBatchResponseEntry, decorator: Google::Apis::ContentV2::AccountsBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountsBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account, as: 'account', class: Google::Apis::ContentV2::Account, decorator: Google::Apis::ContentV2::Account::Representation
      
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
          property :link_status, as: 'linkStatus'
        end
      end
      
      class AccountsLinkRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :link_type, as: 'linkType'
          property :linked_account_id, as: 'linkedAccountId'
        end
      end
      
      class AccountsLinkResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class ListAccountsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::Account, decorator: Google::Apis::ContentV2::Account::Representation
      
        end
      end
      
      class BatchAccountStatusesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountStatusesBatchRequestEntry, decorator: Google::Apis::ContentV2::AccountStatusesBatchRequestEntry::Representation
      
        end
      end
      
      class AccountStatusesBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :batch_id, as: 'batchId'
          collection :destinations, as: 'destinations'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
        end
      end
      
      class BatchAccountStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountStatusesBatchResponseEntry, decorator: Google::Apis::ContentV2::AccountStatusesBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountStatusesBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_status, as: 'accountStatus', class: Google::Apis::ContentV2::AccountStatus, decorator: Google::Apis::ContentV2::AccountStatus::Representation
      
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
        end
      end
      
      class ListAccountStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::AccountStatus, decorator: Google::Apis::ContentV2::AccountStatus::Representation
      
        end
      end
      
      class BatchAccountTaxRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountTaxBatchRequestEntry, decorator: Google::Apis::ContentV2::AccountTaxBatchRequestEntry::Representation
      
        end
      end
      
      class AccountTaxBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :account_tax, as: 'accountTax', class: Google::Apis::ContentV2::AccountTax, decorator: Google::Apis::ContentV2::AccountTax::Representation
      
          property :batch_id, as: 'batchId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
        end
      end
      
      class BatchAccountTaxResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::AccountTaxBatchResponseEntry, decorator: Google::Apis::ContentV2::AccountTaxBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountTaxBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_tax, as: 'accountTax', class: Google::Apis::ContentV2::AccountTax, decorator: Google::Apis::ContentV2::AccountTax::Representation
      
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ListAccountTaxResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::AccountTax, decorator: Google::Apis::ContentV2::AccountTax::Representation
      
        end
      end
      
      class Amount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pretax, as: 'pretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :tax, as: 'tax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
        end
      end
      
      class BusinessDayConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :business_days, as: 'businessDays'
        end
      end
      
      class CarrierRate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier_name, as: 'carrierName'
          property :carrier_service, as: 'carrierService'
          property :flat_adjustment, as: 'flatAdjustment', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :name, as: 'name'
          property :origin_postal_code, as: 'originPostalCode'
          property :percentage_adjustment, as: 'percentageAdjustment'
        end
      end
      
      class CarriersCarrier
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :name, as: 'name'
          collection :services, as: 'services'
        end
      end
      
      class CustomAttribute
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :type, as: 'type'
          property :unit, as: 'unit'
          property :value, as: 'value'
        end
      end
      
      class CustomGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :attributes, as: 'attributes', class: Google::Apis::ContentV2::CustomAttribute, decorator: Google::Apis::ContentV2::CustomAttribute::Representation
      
          property :name, as: 'name'
        end
      end
      
      class CustomerReturnReason
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :reason_code, as: 'reasonCode'
        end
      end
      
      class CutoffTime
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hour, as: 'hour'
          property :minute, as: 'minute'
          property :timezone, as: 'timezone'
        end
      end
      
      class Datafeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribute_language, as: 'attributeLanguage'
          property :content_language, as: 'contentLanguage'
          property :content_type, as: 'contentType'
          property :fetch_schedule, as: 'fetchSchedule', class: Google::Apis::ContentV2::DatafeedFetchSchedule, decorator: Google::Apis::ContentV2::DatafeedFetchSchedule::Representation
      
          property :file_name, as: 'fileName'
          property :format, as: 'format', class: Google::Apis::ContentV2::DatafeedFormat, decorator: Google::Apis::ContentV2::DatafeedFormat::Representation
      
          property :id, :numeric_string => true, as: 'id'
          collection :intended_destinations, as: 'intendedDestinations'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :target_country, as: 'targetCountry'
          collection :targets, as: 'targets', class: Google::Apis::ContentV2::DatafeedTarget, decorator: Google::Apis::ContentV2::DatafeedTarget::Representation
      
        end
      end
      
      class DatafeedFetchSchedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day_of_month, as: 'dayOfMonth'
          property :fetch_url, as: 'fetchUrl'
          property :hour, as: 'hour'
          property :minute_of_hour, as: 'minuteOfHour'
          property :password, as: 'password'
          property :paused, as: 'paused'
          property :time_zone, as: 'timeZone'
          property :username, as: 'username'
          property :weekday, as: 'weekday'
        end
      end
      
      class DatafeedFormat
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_delimiter, as: 'columnDelimiter'
          property :file_encoding, as: 'fileEncoding'
          property :quoting_mode, as: 'quotingMode'
        end
      end
      
      class DatafeedStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :datafeed_id, :numeric_string => true, as: 'datafeedId'
          collection :errors, as: 'errors', class: Google::Apis::ContentV2::DatafeedStatusError, decorator: Google::Apis::ContentV2::DatafeedStatusError::Representation
      
          property :items_total, :numeric_string => true, as: 'itemsTotal'
          property :items_valid, :numeric_string => true, as: 'itemsValid'
          property :kind, as: 'kind'
          property :language, as: 'language'
          property :last_upload_date, as: 'lastUploadDate'
          property :processing_status, as: 'processingStatus'
          collection :warnings, as: 'warnings', class: Google::Apis::ContentV2::DatafeedStatusError, decorator: Google::Apis::ContentV2::DatafeedStatusError::Representation
      
        end
      end
      
      class DatafeedStatusError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :count, :numeric_string => true, as: 'count'
          collection :examples, as: 'examples', class: Google::Apis::ContentV2::DatafeedStatusExample, decorator: Google::Apis::ContentV2::DatafeedStatusExample::Representation
      
          property :message, as: 'message'
        end
      end
      
      class DatafeedStatusExample
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_id, as: 'itemId'
          property :line_number, :numeric_string => true, as: 'lineNumber'
          property :value, as: 'value'
        end
      end
      
      class DatafeedTarget
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          collection :excluded_destinations, as: 'excludedDestinations'
          collection :included_destinations, as: 'includedDestinations'
          property :language, as: 'language'
        end
      end
      
      class BatchDatafeedsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::DatafeedsBatchRequestEntry, decorator: Google::Apis::ContentV2::DatafeedsBatchRequestEntry::Representation
      
        end
      end
      
      class DatafeedsBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :datafeed, as: 'datafeed', class: Google::Apis::ContentV2::Datafeed, decorator: Google::Apis::ContentV2::Datafeed::Representation
      
          property :datafeed_id, :numeric_string => true, as: 'datafeedId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
        end
      end
      
      class BatchDatafeedsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::DatafeedsBatchResponseEntry, decorator: Google::Apis::ContentV2::DatafeedsBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class DatafeedsBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :datafeed, as: 'datafeed', class: Google::Apis::ContentV2::Datafeed, decorator: Google::Apis::ContentV2::Datafeed::Representation
      
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
        end
      end
      
      class DatafeedsFetchNowResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class ListDatafeedsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::Datafeed, decorator: Google::Apis::ContentV2::Datafeed::Representation
      
        end
      end
      
      class BatchDatafeedStatusesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::DatafeedStatusesBatchRequestEntry, decorator: Google::Apis::ContentV2::DatafeedStatusesBatchRequestEntry::Representation
      
        end
      end
      
      class DatafeedStatusesBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :country, as: 'country'
          property :datafeed_id, :numeric_string => true, as: 'datafeedId'
          property :language, as: 'language'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
        end
      end
      
      class BatchDatafeedStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::DatafeedStatusesBatchResponseEntry, decorator: Google::Apis::ContentV2::DatafeedStatusesBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class DatafeedStatusesBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :datafeed_status, as: 'datafeedStatus', class: Google::Apis::ContentV2::DatafeedStatus, decorator: Google::Apis::ContentV2::DatafeedStatus::Representation
      
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
        end
      end
      
      class ListDatafeedStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::DatafeedStatus, decorator: Google::Apis::ContentV2::DatafeedStatus::Representation
      
        end
      end
      
      class DeliveryTime
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cutoff_time, as: 'cutoffTime', class: Google::Apis::ContentV2::CutoffTime, decorator: Google::Apis::ContentV2::CutoffTime::Representation
      
          property :handling_business_day_config, as: 'handlingBusinessDayConfig', class: Google::Apis::ContentV2::BusinessDayConfig, decorator: Google::Apis::ContentV2::BusinessDayConfig::Representation
      
          collection :holiday_cutoffs, as: 'holidayCutoffs', class: Google::Apis::ContentV2::HolidayCutoff, decorator: Google::Apis::ContentV2::HolidayCutoff::Representation
      
          property :max_handling_time_in_days, as: 'maxHandlingTimeInDays'
          property :max_transit_time_in_days, as: 'maxTransitTimeInDays'
          property :min_handling_time_in_days, as: 'minHandlingTimeInDays'
          property :min_transit_time_in_days, as: 'minTransitTimeInDays'
          property :transit_business_day_config, as: 'transitBusinessDayConfig', class: Google::Apis::ContentV2::BusinessDayConfig, decorator: Google::Apis::ContentV2::BusinessDayConfig::Representation
      
          property :transit_time_table, as: 'transitTimeTable', class: Google::Apis::ContentV2::TransitTable, decorator: Google::Apis::ContentV2::TransitTable::Representation
      
        end
      end
      
      class Error
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain, as: 'domain'
          property :message, as: 'message'
          property :reason, as: 'reason'
        end
      end
      
      class Errors
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :errors, as: 'errors', class: Google::Apis::ContentV2::Error, decorator: Google::Apis::ContentV2::Error::Representation
      
          property :message, as: 'message'
        end
      end
      
      class GmbAccounts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :gmb_accounts, as: 'gmbAccounts', class: Google::Apis::ContentV2::GmbAccountsGmbAccount, decorator: Google::Apis::ContentV2::GmbAccountsGmbAccount::Representation
      
        end
      end
      
      class GmbAccountsGmbAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :listing_count, :numeric_string => true, as: 'listingCount'
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class Headers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::ContentV2::LocationIdSet, decorator: Google::Apis::ContentV2::LocationIdSet::Representation
      
          collection :number_of_items, as: 'numberOfItems'
          collection :postal_code_group_names, as: 'postalCodeGroupNames'
          collection :prices, as: 'prices', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          collection :weights, as: 'weights', class: Google::Apis::ContentV2::Weight, decorator: Google::Apis::ContentV2::Weight::Representation
      
        end
      end
      
      class HolidayCutoff
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deadline_date, as: 'deadlineDate'
          property :deadline_hour, as: 'deadlineHour'
          property :deadline_timezone, as: 'deadlineTimezone'
          property :holiday_id, as: 'holidayId'
          property :visible_from_date, as: 'visibleFromDate'
        end
      end
      
      class HolidaysHoliday
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :date, as: 'date'
          property :delivery_guarantee_date, as: 'deliveryGuaranteeDate'
          property :delivery_guarantee_hour, :numeric_string => true, as: 'deliveryGuaranteeHour'
          property :id, as: 'id'
          property :type, as: 'type'
        end
      end
      
      class Installment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :months, :numeric_string => true, as: 'months'
        end
      end
      
      class Inventory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :availability, as: 'availability'
          property :custom_label0, as: 'customLabel0'
          property :custom_label1, as: 'customLabel1'
          property :custom_label2, as: 'customLabel2'
          property :custom_label3, as: 'customLabel3'
          property :custom_label4, as: 'customLabel4'
          property :installment, as: 'installment', class: Google::Apis::ContentV2::Installment, decorator: Google::Apis::ContentV2::Installment::Representation
      
          property :instore_product_location, as: 'instoreProductLocation'
          property :kind, as: 'kind'
          property :loyalty_points, as: 'loyaltyPoints', class: Google::Apis::ContentV2::LoyaltyPoints, decorator: Google::Apis::ContentV2::LoyaltyPoints::Representation
      
          property :pickup, as: 'pickup', class: Google::Apis::ContentV2::InventoryPickup, decorator: Google::Apis::ContentV2::InventoryPickup::Representation
      
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, as: 'quantity'
          property :sale_price, as: 'salePrice', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :sale_price_effective_date, as: 'salePriceEffectiveDate'
          property :sell_on_google_quantity, as: 'sellOnGoogleQuantity'
        end
      end
      
      class BatchInventoryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::InventoryBatchRequestEntry, decorator: Google::Apis::ContentV2::InventoryBatchRequestEntry::Representation
      
        end
      end
      
      class InventoryBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :inventory, as: 'inventory', class: Google::Apis::ContentV2::Inventory, decorator: Google::Apis::ContentV2::Inventory::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :product_id, as: 'productId'
          property :store_code, as: 'storeCode'
        end
      end
      
      class BatchInventoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::InventoryBatchResponseEntry, decorator: Google::Apis::ContentV2::InventoryBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class InventoryBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class InventoryPickup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pickup_method, as: 'pickupMethod'
          property :pickup_sla, as: 'pickupSla'
        end
      end
      
      class SetInventoryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :availability, as: 'availability'
          property :custom_label0, as: 'customLabel0'
          property :custom_label1, as: 'customLabel1'
          property :custom_label2, as: 'customLabel2'
          property :custom_label3, as: 'customLabel3'
          property :custom_label4, as: 'customLabel4'
          property :installment, as: 'installment', class: Google::Apis::ContentV2::Installment, decorator: Google::Apis::ContentV2::Installment::Representation
      
          property :instore_product_location, as: 'instoreProductLocation'
          property :loyalty_points, as: 'loyaltyPoints', class: Google::Apis::ContentV2::LoyaltyPoints, decorator: Google::Apis::ContentV2::LoyaltyPoints::Representation
      
          property :pickup, as: 'pickup', class: Google::Apis::ContentV2::InventoryPickup, decorator: Google::Apis::ContentV2::InventoryPickup::Representation
      
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, as: 'quantity'
          property :sale_price, as: 'salePrice', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :sale_price_effective_date, as: 'salePriceEffectiveDate'
          property :sell_on_google_quantity, as: 'sellOnGoogleQuantity'
        end
      end
      
      class SetInventoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class InvoiceSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_charge_summaries, as: 'additionalChargeSummaries', class: Google::Apis::ContentV2::InvoiceSummaryAdditionalChargeSummary, decorator: Google::Apis::ContentV2::InvoiceSummaryAdditionalChargeSummary::Representation
      
          property :customer_balance, as: 'customerBalance', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :google_balance, as: 'googleBalance', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :merchant_balance, as: 'merchantBalance', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :product_total, as: 'productTotal', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          collection :promotion_summaries, as: 'promotionSummaries', class: Google::Apis::ContentV2::Promotion, decorator: Google::Apis::ContentV2::Promotion::Representation
      
        end
      end
      
      class InvoiceSummaryAdditionalChargeSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :total_amount, as: 'totalAmount', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :type, as: 'type'
        end
      end
      
      class LiaAboutPageSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :status, as: 'status'
          property :url, as: 'url'
        end
      end
      
      class LiaCountrySettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :about, as: 'about', class: Google::Apis::ContentV2::LiaAboutPageSettings, decorator: Google::Apis::ContentV2::LiaAboutPageSettings::Representation
      
          property :country, as: 'country'
          property :hosted_local_storefront_active, as: 'hostedLocalStorefrontActive'
          property :inventory, as: 'inventory', class: Google::Apis::ContentV2::LiaInventorySettings, decorator: Google::Apis::ContentV2::LiaInventorySettings::Representation
      
          property :on_display_to_order, as: 'onDisplayToOrder', class: Google::Apis::ContentV2::LiaOnDisplayToOrderSettings, decorator: Google::Apis::ContentV2::LiaOnDisplayToOrderSettings::Representation
      
          property :pos_data_provider, as: 'posDataProvider', class: Google::Apis::ContentV2::LiaPosDataProvider, decorator: Google::Apis::ContentV2::LiaPosDataProvider::Representation
      
          property :store_pickup_active, as: 'storePickupActive'
        end
      end
      
      class LiaInventorySettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :inventory_verification_contact_email, as: 'inventoryVerificationContactEmail'
          property :inventory_verification_contact_name, as: 'inventoryVerificationContactName'
          property :inventory_verification_contact_status, as: 'inventoryVerificationContactStatus'
          property :status, as: 'status'
        end
      end
      
      class LiaOnDisplayToOrderSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :shipping_cost_policy_url, as: 'shippingCostPolicyUrl'
          property :status, as: 'status'
        end
      end
      
      class LiaPosDataProvider
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pos_data_provider_id, :numeric_string => true, as: 'posDataProviderId'
          property :pos_external_account_id, as: 'posExternalAccountId'
        end
      end
      
      class LiaSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :country_settings, as: 'countrySettings', class: Google::Apis::ContentV2::LiaCountrySettings, decorator: Google::Apis::ContentV2::LiaCountrySettings::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsCustomBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::LiasettingsCustomBatchRequestEntry, decorator: Google::Apis::ContentV2::LiasettingsCustomBatchRequestEntry::Representation
      
        end
      end
      
      class LiasettingsCustomBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :batch_id, as: 'batchId'
          property :contact_email, as: 'contactEmail'
          property :contact_name, as: 'contactName'
          property :country, as: 'country'
          property :gmb_email, as: 'gmbEmail'
          property :lia_settings, as: 'liaSettings', class: Google::Apis::ContentV2::LiaSettings, decorator: Google::Apis::ContentV2::LiaSettings::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :method_prop, as: 'method'
          property :pos_data_provider_id, :numeric_string => true, as: 'posDataProviderId'
          property :pos_external_account_id, as: 'posExternalAccountId'
        end
      end
      
      class LiasettingsCustomBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::LiasettingsCustomBatchResponseEntry, decorator: Google::Apis::ContentV2::LiasettingsCustomBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsCustomBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :gmb_accounts, as: 'gmbAccounts', class: Google::Apis::ContentV2::GmbAccounts, decorator: Google::Apis::ContentV2::GmbAccounts::Representation
      
          property :kind, as: 'kind'
          property :lia_settings, as: 'liaSettings', class: Google::Apis::ContentV2::LiaSettings, decorator: Google::Apis::ContentV2::LiaSettings::Representation
      
          collection :pos_data_providers, as: 'posDataProviders', class: Google::Apis::ContentV2::PosDataProviders, decorator: Google::Apis::ContentV2::PosDataProviders::Representation
      
        end
      end
      
      class LiasettingsGetAccessibleGmbAccountsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :gmb_accounts, as: 'gmbAccounts', class: Google::Apis::ContentV2::GmbAccountsGmbAccount, decorator: Google::Apis::ContentV2::GmbAccountsGmbAccount::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsListPosDataProvidersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :pos_data_providers, as: 'posDataProviders', class: Google::Apis::ContentV2::PosDataProviders, decorator: Google::Apis::ContentV2::PosDataProviders::Representation
      
        end
      end
      
      class LiasettingsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::LiaSettings, decorator: Google::Apis::ContentV2::LiaSettings::Representation
      
        end
      end
      
      class LiasettingsRequestGmbAccessResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsRequestInventoryVerificationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsSetInventoryVerificationContactResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class LiasettingsSetPosDataProviderResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class LocationIdSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :location_ids, as: 'locationIds'
        end
      end
      
      class LoyaltyPoints
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :points_value, :numeric_string => true, as: 'pointsValue'
          property :ratio, as: 'ratio'
        end
      end
      
      class MerchantOrderReturn
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_date, as: 'creationDate'
          property :merchant_order_id, as: 'merchantOrderId'
          property :order_id, as: 'orderId'
          property :order_return_id, as: 'orderReturnId'
          collection :return_items, as: 'returnItems', class: Google::Apis::ContentV2::MerchantOrderReturnItem, decorator: Google::Apis::ContentV2::MerchantOrderReturnItem::Representation
      
          collection :return_shipments, as: 'returnShipments', class: Google::Apis::ContentV2::ReturnShipment, decorator: Google::Apis::ContentV2::ReturnShipment::Representation
      
        end
      end
      
      class MerchantOrderReturnItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_return_reason, as: 'customerReturnReason', class: Google::Apis::ContentV2::CustomerReturnReason, decorator: Google::Apis::ContentV2::CustomerReturnReason::Representation
      
          property :item_id, as: 'itemId'
          property :merchant_return_reason, as: 'merchantReturnReason', class: Google::Apis::ContentV2::RefundReason, decorator: Google::Apis::ContentV2::RefundReason::Representation
      
          property :product, as: 'product', class: Google::Apis::ContentV2::OrderLineItemProduct, decorator: Google::Apis::ContentV2::OrderLineItemProduct::Representation
      
          collection :return_shipment_ids, as: 'returnShipmentIds'
          property :state, as: 'state'
        end
      end
      
      class Order
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :acknowledged, as: 'acknowledged'
          property :channel_type, as: 'channelType'
          property :customer, as: 'customer', class: Google::Apis::ContentV2::OrderCustomer, decorator: Google::Apis::ContentV2::OrderCustomer::Representation
      
          property :delivery_details, as: 'deliveryDetails', class: Google::Apis::ContentV2::OrderDeliveryDetails, decorator: Google::Apis::ContentV2::OrderDeliveryDetails::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          collection :line_items, as: 'lineItems', class: Google::Apis::ContentV2::OrderLineItem, decorator: Google::Apis::ContentV2::OrderLineItem::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :merchant_order_id, as: 'merchantOrderId'
          property :net_amount, as: 'netAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :payment_method, as: 'paymentMethod', class: Google::Apis::ContentV2::OrderPaymentMethod, decorator: Google::Apis::ContentV2::OrderPaymentMethod::Representation
      
          property :payment_status, as: 'paymentStatus'
          property :pickup_details, as: 'pickupDetails', class: Google::Apis::ContentV2::OrderPickupDetails, decorator: Google::Apis::ContentV2::OrderPickupDetails::Representation
      
          property :placed_date, as: 'placedDate'
          collection :promotions, as: 'promotions', class: Google::Apis::ContentV2::OrderLegacyPromotion, decorator: Google::Apis::ContentV2::OrderLegacyPromotion::Representation
      
          collection :refunds, as: 'refunds', class: Google::Apis::ContentV2::OrderRefund, decorator: Google::Apis::ContentV2::OrderRefund::Representation
      
          collection :shipments, as: 'shipments', class: Google::Apis::ContentV2::OrderShipment, decorator: Google::Apis::ContentV2::OrderShipment::Representation
      
          property :shipping_cost, as: 'shippingCost', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :shipping_cost_tax, as: 'shippingCostTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :shipping_option, as: 'shippingOption'
          property :status, as: 'status'
          property :tax_collector, as: 'taxCollector'
        end
      end
      
      class OrderAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          collection :full_address, as: 'fullAddress'
          property :is_post_office_box, as: 'isPostOfficeBox'
          property :locality, as: 'locality'
          property :postal_code, as: 'postalCode'
          property :recipient_name, as: 'recipientName'
          property :region, as: 'region'
          collection :street_address, as: 'streetAddress'
        end
      end
      
      class OrderCancellation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actor, as: 'actor'
          property :creation_date, as: 'creationDate'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrderCustomer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :explicit_marketing_preference, as: 'explicitMarketingPreference'
          property :full_name, as: 'fullName'
          property :invoice_receiving_email, as: 'invoiceReceivingEmail'
          property :marketing_rights_info, as: 'marketingRightsInfo', class: Google::Apis::ContentV2::OrderCustomerMarketingRightsInfo, decorator: Google::Apis::ContentV2::OrderCustomerMarketingRightsInfo::Representation
      
        end
      end
      
      class OrderCustomerMarketingRightsInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :explicit_marketing_preference, as: 'explicitMarketingPreference'
          property :last_updated_timestamp, as: 'lastUpdatedTimestamp'
          property :marketing_email_address, as: 'marketingEmailAddress'
        end
      end
      
      class OrderDeliveryDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::ContentV2::OrderAddress, decorator: Google::Apis::ContentV2::OrderAddress::Representation
      
          property :phone_number, as: 'phoneNumber'
        end
      end
      
      class OrderLegacyPromotion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :benefits, as: 'benefits', class: Google::Apis::ContentV2::OrderLegacyPromotionBenefit, decorator: Google::Apis::ContentV2::OrderLegacyPromotionBenefit::Representation
      
          property :effective_dates, as: 'effectiveDates'
          property :generic_redemption_code, as: 'genericRedemptionCode'
          property :id, as: 'id'
          property :long_title, as: 'longTitle'
          property :product_applicability, as: 'productApplicability'
          property :redemption_channel, as: 'redemptionChannel'
        end
      end
      
      class OrderLegacyPromotionBenefit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :discount, as: 'discount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          collection :offer_ids, as: 'offerIds'
          property :sub_type, as: 'subType'
          property :tax_impact, as: 'taxImpact', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :type, as: 'type'
        end
      end
      
      class OrderLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :annotations, as: 'annotations', class: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation, decorator: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation::Representation
      
          collection :cancellations, as: 'cancellations', class: Google::Apis::ContentV2::OrderCancellation, decorator: Google::Apis::ContentV2::OrderCancellation::Representation
      
          property :id, as: 'id'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :product, as: 'product', class: Google::Apis::ContentV2::OrderLineItemProduct, decorator: Google::Apis::ContentV2::OrderLineItemProduct::Representation
      
          property :quantity_canceled, as: 'quantityCanceled'
          property :quantity_delivered, as: 'quantityDelivered'
          property :quantity_ordered, as: 'quantityOrdered'
          property :quantity_pending, as: 'quantityPending'
          property :quantity_ready_for_pickup, as: 'quantityReadyForPickup'
          property :quantity_returned, as: 'quantityReturned'
          property :quantity_shipped, as: 'quantityShipped'
          property :return_info, as: 'returnInfo', class: Google::Apis::ContentV2::OrderLineItemReturnInfo, decorator: Google::Apis::ContentV2::OrderLineItemReturnInfo::Representation
      
          collection :returns, as: 'returns', class: Google::Apis::ContentV2::OrderReturn, decorator: Google::Apis::ContentV2::OrderReturn::Representation
      
          property :shipping_details, as: 'shippingDetails', class: Google::Apis::ContentV2::OrderLineItemShippingDetails, decorator: Google::Apis::ContentV2::OrderLineItemShippingDetails::Representation
      
          property :tax, as: 'tax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
        end
      end
      
      class OrderLineItemProduct
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :brand, as: 'brand'
          property :channel, as: 'channel'
          property :condition, as: 'condition'
          property :content_language, as: 'contentLanguage'
          collection :fees, as: 'fees', class: Google::Apis::ContentV2::OrderLineItemProductFee, decorator: Google::Apis::ContentV2::OrderLineItemProductFee::Representation
      
          property :gtin, as: 'gtin'
          property :id, as: 'id'
          property :image_link, as: 'imageLink'
          property :item_group_id, as: 'itemGroupId'
          property :mpn, as: 'mpn'
          property :offer_id, as: 'offerId'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :shown_image, as: 'shownImage'
          property :target_country, as: 'targetCountry'
          property :title, as: 'title'
          collection :variant_attributes, as: 'variantAttributes', class: Google::Apis::ContentV2::OrderLineItemProductVariantAttribute, decorator: Google::Apis::ContentV2::OrderLineItemProductVariantAttribute::Representation
      
        end
      end
      
      class OrderLineItemProductFee
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :name, as: 'name'
        end
      end
      
      class OrderLineItemProductVariantAttribute
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension, as: 'dimension'
          property :value, as: 'value'
        end
      end
      
      class OrderLineItemReturnInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :days_to_return, as: 'daysToReturn'
          property :is_returnable, as: 'isReturnable'
          property :policy_url, as: 'policyUrl'
        end
      end
      
      class OrderLineItemShippingDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deliver_by_date, as: 'deliverByDate'
          property :method_prop, as: 'method', class: Google::Apis::ContentV2::OrderLineItemShippingDetailsMethod, decorator: Google::Apis::ContentV2::OrderLineItemShippingDetailsMethod::Representation
      
          property :ship_by_date, as: 'shipByDate'
          property :type, as: 'type'
        end
      end
      
      class OrderLineItemShippingDetailsMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :max_days_in_transit, as: 'maxDaysInTransit'
          property :method_name, as: 'methodName'
          property :min_days_in_transit, as: 'minDaysInTransit'
        end
      end
      
      class OrderMerchantProvidedAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :value, as: 'value'
        end
      end
      
      class OrderPaymentMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billing_address, as: 'billingAddress', class: Google::Apis::ContentV2::OrderAddress, decorator: Google::Apis::ContentV2::OrderAddress::Representation
      
          property :expiration_month, as: 'expirationMonth'
          property :expiration_year, as: 'expirationYear'
          property :last_four_digits, as: 'lastFourDigits'
          property :phone_number, as: 'phoneNumber'
          property :type, as: 'type'
        end
      end
      
      class OrderPickupDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::ContentV2::OrderAddress, decorator: Google::Apis::ContentV2::OrderAddress::Representation
      
          collection :collectors, as: 'collectors', class: Google::Apis::ContentV2::OrderPickupDetailsCollector, decorator: Google::Apis::ContentV2::OrderPickupDetailsCollector::Representation
      
          property :location_id, as: 'locationId'
        end
      end
      
      class OrderPickupDetailsCollector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :phone_number, as: 'phoneNumber'
        end
      end
      
      class OrderRefund
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actor, as: 'actor'
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :creation_date, as: 'creationDate'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrderReportDisbursement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disbursement_amount, as: 'disbursementAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :disbursement_creation_date, as: 'disbursementCreationDate'
          property :disbursement_date, as: 'disbursementDate'
          property :disbursement_id, as: 'disbursementId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
        end
      end
      
      class OrderReportTransaction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disbursement_amount, as: 'disbursementAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :disbursement_creation_date, as: 'disbursementCreationDate'
          property :disbursement_date, as: 'disbursementDate'
          property :disbursement_id, as: 'disbursementId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :merchant_order_id, as: 'merchantOrderId'
          property :order_id, as: 'orderId'
          property :product_amount, as: 'productAmount', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :product_amount_with_remitted_tax, as: 'productAmountWithRemittedTax', class: Google::Apis::ContentV2::ProductAmount, decorator: Google::Apis::ContentV2::ProductAmount::Representation
      
          property :transaction_date, as: 'transactionDate'
        end
      end
      
      class OrderReturn
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actor, as: 'actor'
          property :creation_date, as: 'creationDate'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrderShipment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :creation_date, as: 'creationDate'
          property :delivery_date, as: 'deliveryDate'
          property :id, as: 'id'
          collection :line_items, as: 'lineItems', class: Google::Apis::ContentV2::OrderShipmentLineItemShipment, decorator: Google::Apis::ContentV2::OrderShipmentLineItemShipment::Representation
      
          property :status, as: 'status'
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrderShipmentLineItemShipment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
        end
      end
      
      class OrderinvoicesCreateChargeInvoiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :invoice_id, as: 'invoiceId'
          property :invoice_summary, as: 'invoiceSummary', class: Google::Apis::ContentV2::InvoiceSummary, decorator: Google::Apis::ContentV2::InvoiceSummary::Representation
      
          collection :line_item_invoices, as: 'lineItemInvoices', class: Google::Apis::ContentV2::ShipmentInvoiceLineItemInvoice, decorator: Google::Apis::ContentV2::ShipmentInvoiceLineItemInvoice::Representation
      
          property :operation_id, as: 'operationId'
          property :shipment_group_id, as: 'shipmentGroupId'
        end
      end
      
      class OrderinvoicesCreateChargeInvoiceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrderinvoicesCreateRefundInvoiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :invoice_id, as: 'invoiceId'
          property :operation_id, as: 'operationId'
          property :refund_only_option, as: 'refundOnlyOption', class: Google::Apis::ContentV2::OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption, decorator: Google::Apis::ContentV2::OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption::Representation
      
          property :return_option, as: 'returnOption', class: Google::Apis::ContentV2::OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption, decorator: Google::Apis::ContentV2::OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption::Representation
      
          collection :shipment_invoices, as: 'shipmentInvoices', class: Google::Apis::ContentV2::ShipmentInvoice, decorator: Google::Apis::ContentV2::ShipmentInvoice::Representation
      
        end
      end
      
      class OrderinvoicesCreateRefundInvoiceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :reason, as: 'reason'
        end
      end
      
      class OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :reason, as: 'reason'
        end
      end
      
      class OrderreportsListDisbursementsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disbursements, as: 'disbursements', class: Google::Apis::ContentV2::OrderReportDisbursement, decorator: Google::Apis::ContentV2::OrderReportDisbursement::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class OrderreportsListTransactionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :transactions, as: 'transactions', class: Google::Apis::ContentV2::OrderReportTransaction, decorator: Google::Apis::ContentV2::OrderReportTransaction::Representation
      
        end
      end
      
      class OrderreturnsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::MerchantOrderReturn, decorator: Google::Apis::ContentV2::MerchantOrderReturn::Representation
      
        end
      end
      
      class OrdersAcknowledgeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
        end
      end
      
      class OrdersAcknowledgeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersAdvanceTestOrderResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class OrdersCancelLineItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCancelLineItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersCancelRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCancelResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersCancelTestOrderByCustomerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reason, as: 'reason'
        end
      end
      
      class OrdersCancelTestOrderByCustomerResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class OrdersCreateTestOrderRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :template_name, as: 'templateName'
          property :test_order, as: 'testOrder', class: Google::Apis::ContentV2::TestOrder, decorator: Google::Apis::ContentV2::TestOrder::Representation
      
        end
      end
      
      class OrdersCreateTestOrderResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :order_id, as: 'orderId'
        end
      end
      
      class OrdersCreateTestReturnRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCreateTestReturnReturnItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCreateTestReturnReturnItem::Representation
      
        end
      end
      
      class OrdersCreateTestReturnResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :return_id, as: 'returnId'
        end
      end
      
      class OrdersCustomBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntry, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntry::Representation
      
        end
      end
      
      class OrdersCustomBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :cancel, as: 'cancel', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCancel, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCancel::Representation
      
          property :cancel_line_item, as: 'cancelLineItem', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCancelLineItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryCancelLineItem::Representation
      
          property :in_store_refund_line_item, as: 'inStoreRefundLineItem', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryInStoreRefundLineItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryInStoreRefundLineItem::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :merchant_order_id, as: 'merchantOrderId'
          property :method_prop, as: 'method'
          property :operation_id, as: 'operationId'
          property :order_id, as: 'orderId'
          property :refund, as: 'refund', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryRefund, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryRefund::Representation
      
          property :reject_return_line_item, as: 'rejectReturnLineItem', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryRejectReturnLineItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryRejectReturnLineItem::Representation
      
          property :return_line_item, as: 'returnLineItem', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryReturnLineItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryReturnLineItem::Representation
      
          property :return_refund_line_item, as: 'returnRefundLineItem', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryReturnRefundLineItem, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryReturnRefundLineItem::Representation
      
          property :set_line_item_metadata, as: 'setLineItemMetadata', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntrySetLineItemMetadata, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntrySetLineItemMetadata::Representation
      
          property :ship_line_items, as: 'shipLineItems', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItems, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItems::Representation
      
          property :update_line_item_shipping_details, as: 'updateLineItemShippingDetails', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails::Representation
      
          property :update_shipment, as: 'updateShipment', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryUpdateShipment, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryUpdateShipment::Representation
      
        end
      end
      
      class OrdersCustomBatchRequestEntryCancel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryCancelLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryCreateTestReturnReturnItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :quantity, as: 'quantity'
        end
      end
      
      class OrdersCustomBatchRequestEntryInStoreRefundLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryRefund
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryRejectReturnLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryReturnLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntryReturnRefundLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersCustomBatchRequestEntrySetLineItemMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :annotations, as: 'annotations', class: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation, decorator: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
        end
      end
      
      class OrdersCustomBatchRequestEntryShipLineItems
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          collection :line_items, as: 'lineItems', class: Google::Apis::ContentV2::OrderShipmentLineItemShipment, decorator: Google::Apis::ContentV2::OrderShipmentLineItemShipment::Representation
      
          property :shipment_group_id, as: 'shipmentGroupId'
          property :shipment_id, as: 'shipmentId'
          collection :shipment_infos, as: 'shipmentInfos', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo::Representation
      
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :shipment_id, as: 'shipmentId'
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deliver_by_date, as: 'deliverByDate'
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          property :ship_by_date, as: 'shipByDate'
        end
      end
      
      class OrdersCustomBatchRequestEntryUpdateShipment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :delivery_date, as: 'deliveryDate'
          property :shipment_id, as: 'shipmentId'
          property :status, as: 'status'
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrdersCustomBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::OrdersCustomBatchResponseEntry, decorator: Google::Apis::ContentV2::OrdersCustomBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class OrdersCustomBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
          property :order, as: 'order', class: Google::Apis::ContentV2::Order, decorator: Google::Apis::ContentV2::Order::Representation
      
        end
      end
      
      class OrdersGetByMerchantOrderIdResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :order, as: 'order', class: Google::Apis::ContentV2::Order, decorator: Google::Apis::ContentV2::Order::Representation
      
        end
      end
      
      class OrdersGetTestOrderTemplateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :template, as: 'template', class: Google::Apis::ContentV2::TestOrder, decorator: Google::Apis::ContentV2::TestOrder::Representation
      
        end
      end
      
      class OrdersInStoreRefundLineItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersInStoreRefundLineItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::Order, decorator: Google::Apis::ContentV2::Order::Representation
      
        end
      end
      
      class OrdersRefundRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :operation_id, as: 'operationId'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersRefundResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersRejectReturnLineItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersRejectReturnLineItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersReturnLineItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersReturnLineItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersReturnRefundLineItemRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_pretax, as: 'amountPretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :amount_tax, as: 'amountTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :quantity, as: 'quantity'
          property :reason, as: 'reason'
          property :reason_text, as: 'reasonText'
        end
      end
      
      class OrdersReturnRefundLineItemResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersSetLineItemMetadataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :annotations, as: 'annotations', class: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation, decorator: Google::Apis::ContentV2::OrderMerchantProvidedAnnotation::Representation
      
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
        end
      end
      
      class OrdersSetLineItemMetadataResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersShipLineItemsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          collection :line_items, as: 'lineItems', class: Google::Apis::ContentV2::OrderShipmentLineItemShipment, decorator: Google::Apis::ContentV2::OrderShipmentLineItemShipment::Representation
      
          property :operation_id, as: 'operationId'
          property :shipment_group_id, as: 'shipmentGroupId'
          property :shipment_id, as: 'shipmentId'
          collection :shipment_infos, as: 'shipmentInfos', class: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo, decorator: Google::Apis::ContentV2::OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo::Representation
      
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrdersShipLineItemsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersUpdateLineItemShippingDetailsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deliver_by_date, as: 'deliverByDate'
          property :line_item_id, as: 'lineItemId'
          property :operation_id, as: 'operationId'
          property :product_id, as: 'productId'
          property :ship_by_date, as: 'shipByDate'
        end
      end
      
      class OrdersUpdateLineItemShippingDetailsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersUpdateMerchantOrderIdRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :merchant_order_id, as: 'merchantOrderId'
          property :operation_id, as: 'operationId'
        end
      end
      
      class OrdersUpdateMerchantOrderIdResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class OrdersUpdateShipmentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :delivery_date, as: 'deliveryDate'
          property :operation_id, as: 'operationId'
          property :shipment_id, as: 'shipmentId'
          property :status, as: 'status'
          property :tracking_id, as: 'trackingId'
        end
      end
      
      class OrdersUpdateShipmentResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_status, as: 'executionStatus'
          property :kind, as: 'kind'
        end
      end
      
      class PosCustomBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::PosCustomBatchRequestEntry, decorator: Google::Apis::ContentV2::PosCustomBatchRequestEntry::Representation
      
        end
      end
      
      class PosCustomBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :inventory, as: 'inventory', class: Google::Apis::ContentV2::PosInventory, decorator: Google::Apis::ContentV2::PosInventory::Representation
      
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :method_prop, as: 'method'
          property :sale, as: 'sale', class: Google::Apis::ContentV2::PosSale, decorator: Google::Apis::ContentV2::PosSale::Representation
      
          property :store, as: 'store', class: Google::Apis::ContentV2::PosStore, decorator: Google::Apis::ContentV2::PosStore::Representation
      
          property :store_code, as: 'storeCode'
          property :target_merchant_id, :numeric_string => true, as: 'targetMerchantId'
        end
      end
      
      class PosCustomBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::PosCustomBatchResponseEntry, decorator: Google::Apis::ContentV2::PosCustomBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class PosCustomBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :inventory, as: 'inventory', class: Google::Apis::ContentV2::PosInventory, decorator: Google::Apis::ContentV2::PosInventory::Representation
      
          property :kind, as: 'kind'
          property :sale, as: 'sale', class: Google::Apis::ContentV2::PosSale, decorator: Google::Apis::ContentV2::PosSale::Representation
      
          property :store, as: 'store', class: Google::Apis::ContentV2::PosStore, decorator: Google::Apis::ContentV2::PosStore::Representation
      
        end
      end
      
      class PosDataProviders
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          collection :pos_data_providers, as: 'posDataProviders', class: Google::Apis::ContentV2::PosDataProvidersPosDataProvider, decorator: Google::Apis::ContentV2::PosDataProvidersPosDataProvider::Representation
      
        end
      end
      
      class PosDataProvidersPosDataProvider
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :full_name, as: 'fullName'
          property :provider_id, :numeric_string => true, as: 'providerId'
        end
      end
      
      class PosInventory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :kind, as: 'kind'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosInventoryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosInventoryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :kind, as: 'kind'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::PosStore, decorator: Google::Apis::ContentV2::PosStore::Representation
      
        end
      end
      
      class PosSale
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :kind, as: 'kind'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :sale_id, as: 'saleId'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosSaleRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :sale_id, as: 'saleId'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosSaleResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_language, as: 'contentLanguage'
          property :gtin, as: 'gtin'
          property :item_id, as: 'itemId'
          property :kind, as: 'kind'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :quantity, :numeric_string => true, as: 'quantity'
          property :sale_id, as: 'saleId'
          property :store_code, as: 'storeCode'
          property :target_country, as: 'targetCountry'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class PosStore
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :store_address, as: 'storeAddress'
          property :store_code, as: 'storeCode'
        end
      end
      
      class PostalCodeGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :name, as: 'name'
          collection :postal_code_ranges, as: 'postalCodeRanges', class: Google::Apis::ContentV2::PostalCodeRange, decorator: Google::Apis::ContentV2::PostalCodeRange::Representation
      
        end
      end
      
      class PostalCodeRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :postal_code_range_begin, as: 'postalCodeRangeBegin'
          property :postal_code_range_end, as: 'postalCodeRangeEnd'
        end
      end
      
      class Price
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency, as: 'currency'
          property :value, as: 'value'
        end
      end
      
      class Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_image_links, as: 'additionalImageLinks'
          collection :additional_product_types, as: 'additionalProductTypes'
          property :adult, as: 'adult'
          property :adwords_grouping, as: 'adwordsGrouping'
          collection :adwords_labels, as: 'adwordsLabels'
          property :adwords_redirect, as: 'adwordsRedirect'
          property :age_group, as: 'ageGroup'
          collection :aspects, as: 'aspects', class: Google::Apis::ContentV2::ProductAspect, decorator: Google::Apis::ContentV2::ProductAspect::Representation
      
          property :availability, as: 'availability'
          property :availability_date, as: 'availabilityDate'
          property :brand, as: 'brand'
          property :channel, as: 'channel'
          property :color, as: 'color'
          property :condition, as: 'condition'
          property :content_language, as: 'contentLanguage'
          property :cost_of_goods_sold, as: 'costOfGoodsSold', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          collection :custom_attributes, as: 'customAttributes', class: Google::Apis::ContentV2::CustomAttribute, decorator: Google::Apis::ContentV2::CustomAttribute::Representation
      
          collection :custom_groups, as: 'customGroups', class: Google::Apis::ContentV2::CustomGroup, decorator: Google::Apis::ContentV2::CustomGroup::Representation
      
          property :custom_label0, as: 'customLabel0'
          property :custom_label1, as: 'customLabel1'
          property :custom_label2, as: 'customLabel2'
          property :custom_label3, as: 'customLabel3'
          property :custom_label4, as: 'customLabel4'
          property :description, as: 'description'
          collection :destinations, as: 'destinations', class: Google::Apis::ContentV2::ProductDestination, decorator: Google::Apis::ContentV2::ProductDestination::Representation
      
          property :display_ads_id, as: 'displayAdsId'
          property :display_ads_link, as: 'displayAdsLink'
          collection :display_ads_similar_ids, as: 'displayAdsSimilarIds'
          property :display_ads_title, as: 'displayAdsTitle'
          property :display_ads_value, as: 'displayAdsValue'
          property :energy_efficiency_class, as: 'energyEfficiencyClass'
          property :expiration_date, as: 'expirationDate'
          property :gender, as: 'gender'
          property :google_product_category, as: 'googleProductCategory'
          property :gtin, as: 'gtin'
          property :id, as: 'id'
          property :identifier_exists, as: 'identifierExists'
          property :image_link, as: 'imageLink'
          property :installment, as: 'installment', class: Google::Apis::ContentV2::Installment, decorator: Google::Apis::ContentV2::Installment::Representation
      
          property :is_bundle, as: 'isBundle'
          property :item_group_id, as: 'itemGroupId'
          property :kind, as: 'kind'
          property :link, as: 'link'
          property :loyalty_points, as: 'loyaltyPoints', class: Google::Apis::ContentV2::LoyaltyPoints, decorator: Google::Apis::ContentV2::LoyaltyPoints::Representation
      
          property :material, as: 'material'
          property :max_energy_efficiency_class, as: 'maxEnergyEfficiencyClass'
          property :max_handling_time, :numeric_string => true, as: 'maxHandlingTime'
          property :min_energy_efficiency_class, as: 'minEnergyEfficiencyClass'
          property :min_handling_time, :numeric_string => true, as: 'minHandlingTime'
          property :mobile_link, as: 'mobileLink'
          property :mpn, as: 'mpn'
          property :multipack, :numeric_string => true, as: 'multipack'
          property :offer_id, as: 'offerId'
          property :online_only, as: 'onlineOnly'
          property :pattern, as: 'pattern'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :product_type, as: 'productType'
          collection :promotion_ids, as: 'promotionIds'
          property :sale_price, as: 'salePrice', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :sale_price_effective_date, as: 'salePriceEffectiveDate'
          property :sell_on_google_quantity, :numeric_string => true, as: 'sellOnGoogleQuantity'
          collection :shipping, as: 'shipping', class: Google::Apis::ContentV2::ProductShipping, decorator: Google::Apis::ContentV2::ProductShipping::Representation
      
          property :shipping_height, as: 'shippingHeight', class: Google::Apis::ContentV2::ProductShippingDimension, decorator: Google::Apis::ContentV2::ProductShippingDimension::Representation
      
          property :shipping_label, as: 'shippingLabel'
          property :shipping_length, as: 'shippingLength', class: Google::Apis::ContentV2::ProductShippingDimension, decorator: Google::Apis::ContentV2::ProductShippingDimension::Representation
      
          property :shipping_weight, as: 'shippingWeight', class: Google::Apis::ContentV2::ProductShippingWeight, decorator: Google::Apis::ContentV2::ProductShippingWeight::Representation
      
          property :shipping_width, as: 'shippingWidth', class: Google::Apis::ContentV2::ProductShippingDimension, decorator: Google::Apis::ContentV2::ProductShippingDimension::Representation
      
          property :size_system, as: 'sizeSystem'
          property :size_type, as: 'sizeType'
          collection :sizes, as: 'sizes'
          property :source, as: 'source'
          property :target_country, as: 'targetCountry'
          collection :taxes, as: 'taxes', class: Google::Apis::ContentV2::ProductTax, decorator: Google::Apis::ContentV2::ProductTax::Representation
      
          property :title, as: 'title'
          property :unit_pricing_base_measure, as: 'unitPricingBaseMeasure', class: Google::Apis::ContentV2::ProductUnitPricingBaseMeasure, decorator: Google::Apis::ContentV2::ProductUnitPricingBaseMeasure::Representation
      
          property :unit_pricing_measure, as: 'unitPricingMeasure', class: Google::Apis::ContentV2::ProductUnitPricingMeasure, decorator: Google::Apis::ContentV2::ProductUnitPricingMeasure::Representation
      
          collection :validated_destinations, as: 'validatedDestinations'
          collection :warnings, as: 'warnings', class: Google::Apis::ContentV2::Error, decorator: Google::Apis::ContentV2::Error::Representation
      
        end
      end
      
      class ProductAmount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :price_amount, as: 'priceAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :remitted_tax_amount, as: 'remittedTaxAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :tax_amount, as: 'taxAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
        end
      end
      
      class ProductAspect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aspect_name, as: 'aspectName'
          property :destination_name, as: 'destinationName'
          property :intention, as: 'intention'
        end
      end
      
      class ProductDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_name, as: 'destinationName'
          property :intention, as: 'intention'
        end
      end
      
      class ProductShipping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :location_group_name, as: 'locationGroupName'
          property :location_id, :numeric_string => true, as: 'locationId'
          property :postal_code, as: 'postalCode'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :region, as: 'region'
          property :service, as: 'service'
        end
      end
      
      class ProductShippingDimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, as: 'value'
        end
      end
      
      class ProductShippingWeight
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, as: 'value'
        end
      end
      
      class ProductStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_date, as: 'creationDate'
          collection :data_quality_issues, as: 'dataQualityIssues', class: Google::Apis::ContentV2::ProductStatusDataQualityIssue, decorator: Google::Apis::ContentV2::ProductStatusDataQualityIssue::Representation
      
          collection :destination_statuses, as: 'destinationStatuses', class: Google::Apis::ContentV2::ProductStatusDestinationStatus, decorator: Google::Apis::ContentV2::ProductStatusDestinationStatus::Representation
      
          property :google_expiration_date, as: 'googleExpirationDate'
          collection :item_level_issues, as: 'itemLevelIssues', class: Google::Apis::ContentV2::ProductStatusItemLevelIssue, decorator: Google::Apis::ContentV2::ProductStatusItemLevelIssue::Representation
      
          property :kind, as: 'kind'
          property :last_update_date, as: 'lastUpdateDate'
          property :link, as: 'link'
          property :product, as: 'product', class: Google::Apis::ContentV2::Product, decorator: Google::Apis::ContentV2::Product::Representation
      
          property :product_id, as: 'productId'
          property :title, as: 'title'
        end
      end
      
      class ProductStatusDataQualityIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination, as: 'destination'
          property :detail, as: 'detail'
          property :fetch_status, as: 'fetchStatus'
          property :id, as: 'id'
          property :location, as: 'location'
          property :severity, as: 'severity'
          property :timestamp, as: 'timestamp'
          property :value_on_landing_page, as: 'valueOnLandingPage'
          property :value_provided, as: 'valueProvided'
        end
      end
      
      class ProductStatusDestinationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :approval_pending, as: 'approvalPending'
          property :approval_status, as: 'approvalStatus'
          property :destination, as: 'destination'
          property :intention, as: 'intention'
        end
      end
      
      class ProductStatusItemLevelIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribute_name, as: 'attributeName'
          property :code, as: 'code'
          property :description, as: 'description'
          property :destination, as: 'destination'
          property :detail, as: 'detail'
          property :documentation, as: 'documentation'
          property :resolution, as: 'resolution'
          property :servability, as: 'servability'
        end
      end
      
      class ProductTax
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :location_id, :numeric_string => true, as: 'locationId'
          property :postal_code, as: 'postalCode'
          property :rate, as: 'rate'
          property :region, as: 'region'
          property :tax_ship, as: 'taxShip'
        end
      end
      
      class ProductUnitPricingBaseMeasure
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, :numeric_string => true, as: 'value'
        end
      end
      
      class ProductUnitPricingMeasure
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, as: 'value'
        end
      end
      
      class BatchProductsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ProductsBatchRequestEntry, decorator: Google::Apis::ContentV2::ProductsBatchRequestEntry::Representation
      
        end
      end
      
      class ProductsBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
          property :product, as: 'product', class: Google::Apis::ContentV2::Product, decorator: Google::Apis::ContentV2::Product::Representation
      
          property :product_id, as: 'productId'
        end
      end
      
      class BatchProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ProductsBatchResponseEntry, decorator: Google::Apis::ContentV2::ProductsBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ProductsBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
          property :product, as: 'product', class: Google::Apis::ContentV2::Product, decorator: Google::Apis::ContentV2::Product::Representation
      
        end
      end
      
      class ListProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::Product, decorator: Google::Apis::ContentV2::Product::Representation
      
        end
      end
      
      class BatchProductStatusesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ProductStatusesBatchRequestEntry, decorator: Google::Apis::ContentV2::ProductStatusesBatchRequestEntry::Representation
      
        end
      end
      
      class ProductStatusesBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          collection :destinations, as: 'destinations'
          property :include_attributes, as: 'includeAttributes'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :request_method, as: 'method'
          property :product_id, as: 'productId'
        end
      end
      
      class BatchProductStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ProductStatusesBatchResponseEntry, decorator: Google::Apis::ContentV2::ProductStatusesBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ProductStatusesBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
          property :product_status, as: 'productStatus', class: Google::Apis::ContentV2::ProductStatus, decorator: Google::Apis::ContentV2::ProductStatus::Representation
      
        end
      end
      
      class ListProductStatusesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::ProductStatus, decorator: Google::Apis::ContentV2::ProductStatus::Representation
      
        end
      end
      
      class Promotion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :promotion_amount, as: 'promotionAmount', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          property :promotion_id, as: 'promotionId'
        end
      end
      
      class RateGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :applicable_shipping_labels, as: 'applicableShippingLabels'
          collection :carrier_rates, as: 'carrierRates', class: Google::Apis::ContentV2::CarrierRate, decorator: Google::Apis::ContentV2::CarrierRate::Representation
      
          property :main_table, as: 'mainTable', class: Google::Apis::ContentV2::Table, decorator: Google::Apis::ContentV2::Table::Representation
      
          property :name, as: 'name'
          property :single_value, as: 'singleValue', class: Google::Apis::ContentV2::Value, decorator: Google::Apis::ContentV2::Value::Representation
      
          collection :subtables, as: 'subtables', class: Google::Apis::ContentV2::Table, decorator: Google::Apis::ContentV2::Table::Representation
      
        end
      end
      
      class RefundReason
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :reason_code, as: 'reasonCode'
        end
      end
      
      class ReturnShipment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_date, as: 'creationDate'
          property :delivery_date, as: 'deliveryDate'
          property :return_method_type, as: 'returnMethodType'
          property :shipment_id, as: 'shipmentId'
          collection :shipment_tracking_infos, as: 'shipmentTrackingInfos', class: Google::Apis::ContentV2::ShipmentTrackingInfo, decorator: Google::Apis::ContentV2::ShipmentTrackingInfo::Representation
      
          property :shipping_date, as: 'shippingDate'
          property :state, as: 'state'
        end
      end
      
      class Row
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cells, as: 'cells', class: Google::Apis::ContentV2::Value, decorator: Google::Apis::ContentV2::Value::Representation
      
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, as: 'active'
          property :currency, as: 'currency'
          property :delivery_country, as: 'deliveryCountry'
          property :delivery_time, as: 'deliveryTime', class: Google::Apis::ContentV2::DeliveryTime, decorator: Google::Apis::ContentV2::DeliveryTime::Representation
      
          property :eligibility, as: 'eligibility'
          property :minimum_order_value, as: 'minimumOrderValue', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :name, as: 'name'
          collection :rate_groups, as: 'rateGroups', class: Google::Apis::ContentV2::RateGroup, decorator: Google::Apis::ContentV2::RateGroup::Representation
      
        end
      end
      
      class ShipmentInvoice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :invoice_summary, as: 'invoiceSummary', class: Google::Apis::ContentV2::InvoiceSummary, decorator: Google::Apis::ContentV2::InvoiceSummary::Representation
      
          collection :line_item_invoices, as: 'lineItemInvoices', class: Google::Apis::ContentV2::ShipmentInvoiceLineItemInvoice, decorator: Google::Apis::ContentV2::ShipmentInvoiceLineItemInvoice::Representation
      
          property :shipment_group_id, as: 'shipmentGroupId'
        end
      end
      
      class ShipmentInvoiceLineItemInvoice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :line_item_id, as: 'lineItemId'
          property :product_id, as: 'productId'
          collection :shipment_unit_ids, as: 'shipmentUnitIds'
          property :unit_invoice, as: 'unitInvoice', class: Google::Apis::ContentV2::UnitInvoice, decorator: Google::Apis::ContentV2::UnitInvoice::Representation
      
        end
      end
      
      class ShipmentTrackingInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier, as: 'carrier'
          property :tracking_number, as: 'trackingNumber'
        end
      end
      
      class ShippingSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :postal_code_groups, as: 'postalCodeGroups', class: Google::Apis::ContentV2::PostalCodeGroup, decorator: Google::Apis::ContentV2::PostalCodeGroup::Representation
      
          collection :services, as: 'services', class: Google::Apis::ContentV2::Service, decorator: Google::Apis::ContentV2::Service::Representation
      
        end
      end
      
      class ShippingsettingsCustomBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ShippingsettingsCustomBatchRequestEntry, decorator: Google::Apis::ContentV2::ShippingsettingsCustomBatchRequestEntry::Representation
      
        end
      end
      
      class ShippingsettingsCustomBatchRequestEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :batch_id, as: 'batchId'
          property :merchant_id, :numeric_string => true, as: 'merchantId'
          property :method_prop, as: 'method'
          property :shipping_settings, as: 'shippingSettings', class: Google::Apis::ContentV2::ShippingSettings, decorator: Google::Apis::ContentV2::ShippingSettings::Representation
      
        end
      end
      
      class ShippingsettingsCustomBatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::ContentV2::ShippingsettingsCustomBatchResponseEntry, decorator: Google::Apis::ContentV2::ShippingsettingsCustomBatchResponseEntry::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ShippingsettingsCustomBatchResponseEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :batch_id, as: 'batchId'
          property :errors, as: 'errors', class: Google::Apis::ContentV2::Errors, decorator: Google::Apis::ContentV2::Errors::Representation
      
          property :kind, as: 'kind'
          property :shipping_settings, as: 'shippingSettings', class: Google::Apis::ContentV2::ShippingSettings, decorator: Google::Apis::ContentV2::ShippingSettings::Representation
      
        end
      end
      
      class ShippingsettingsGetSupportedCarriersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :carriers, as: 'carriers', class: Google::Apis::ContentV2::CarriersCarrier, decorator: Google::Apis::ContentV2::CarriersCarrier::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ShippingsettingsGetSupportedHolidaysResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :holidays, as: 'holidays', class: Google::Apis::ContentV2::HolidaysHoliday, decorator: Google::Apis::ContentV2::HolidaysHoliday::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ShippingsettingsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ContentV2::ShippingSettings, decorator: Google::Apis::ContentV2::ShippingSettings::Representation
      
        end
      end
      
      class Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_headers, as: 'columnHeaders', class: Google::Apis::ContentV2::Headers, decorator: Google::Apis::ContentV2::Headers::Representation
      
          property :name, as: 'name'
          property :row_headers, as: 'rowHeaders', class: Google::Apis::ContentV2::Headers, decorator: Google::Apis::ContentV2::Headers::Representation
      
          collection :rows, as: 'rows', class: Google::Apis::ContentV2::Row, decorator: Google::Apis::ContentV2::Row::Representation
      
        end
      end
      
      class TestOrder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer, as: 'customer', class: Google::Apis::ContentV2::TestOrderCustomer, decorator: Google::Apis::ContentV2::TestOrderCustomer::Representation
      
          property :enable_orderinvoices, as: 'enableOrderinvoices'
          property :kind, as: 'kind'
          collection :line_items, as: 'lineItems', class: Google::Apis::ContentV2::TestOrderLineItem, decorator: Google::Apis::ContentV2::TestOrderLineItem::Representation
      
          property :notification_mode, as: 'notificationMode'
          property :payment_method, as: 'paymentMethod', class: Google::Apis::ContentV2::TestOrderPaymentMethod, decorator: Google::Apis::ContentV2::TestOrderPaymentMethod::Representation
      
          property :predefined_delivery_address, as: 'predefinedDeliveryAddress'
          property :predefined_pickup_details, as: 'predefinedPickupDetails'
          collection :promotions, as: 'promotions', class: Google::Apis::ContentV2::OrderLegacyPromotion, decorator: Google::Apis::ContentV2::OrderLegacyPromotion::Representation
      
          property :shipping_cost, as: 'shippingCost', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :shipping_cost_tax, as: 'shippingCostTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :shipping_option, as: 'shippingOption'
        end
      end
      
      class TestOrderCustomer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :explicit_marketing_preference, as: 'explicitMarketingPreference'
          property :full_name, as: 'fullName'
          property :marketing_rights_info, as: 'marketingRightsInfo', class: Google::Apis::ContentV2::TestOrderCustomerMarketingRightsInfo, decorator: Google::Apis::ContentV2::TestOrderCustomerMarketingRightsInfo::Representation
      
        end
      end
      
      class TestOrderCustomerMarketingRightsInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :explicit_marketing_preference, as: 'explicitMarketingPreference'
          property :last_updated_timestamp, as: 'lastUpdatedTimestamp'
        end
      end
      
      class TestOrderLineItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :product, as: 'product', class: Google::Apis::ContentV2::TestOrderLineItemProduct, decorator: Google::Apis::ContentV2::TestOrderLineItemProduct::Representation
      
          property :quantity_ordered, as: 'quantityOrdered'
          property :return_info, as: 'returnInfo', class: Google::Apis::ContentV2::OrderLineItemReturnInfo, decorator: Google::Apis::ContentV2::OrderLineItemReturnInfo::Representation
      
          property :shipping_details, as: 'shippingDetails', class: Google::Apis::ContentV2::OrderLineItemShippingDetails, decorator: Google::Apis::ContentV2::OrderLineItemShippingDetails::Representation
      
          property :unit_tax, as: 'unitTax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
        end
      end
      
      class TestOrderLineItemProduct
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :brand, as: 'brand'
          property :channel, as: 'channel'
          property :condition, as: 'condition'
          property :content_language, as: 'contentLanguage'
          collection :fees, as: 'fees', class: Google::Apis::ContentV2::OrderLineItemProductFee, decorator: Google::Apis::ContentV2::OrderLineItemProductFee::Representation
      
          property :gtin, as: 'gtin'
          property :image_link, as: 'imageLink'
          property :item_group_id, as: 'itemGroupId'
          property :mpn, as: 'mpn'
          property :offer_id, as: 'offerId'
          property :price, as: 'price', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :target_country, as: 'targetCountry'
          property :title, as: 'title'
          collection :variant_attributes, as: 'variantAttributes', class: Google::Apis::ContentV2::OrderLineItemProductVariantAttribute, decorator: Google::Apis::ContentV2::OrderLineItemProductVariantAttribute::Representation
      
        end
      end
      
      class TestOrderPaymentMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_month, as: 'expirationMonth'
          property :expiration_year, as: 'expirationYear'
          property :last_four_digits, as: 'lastFourDigits'
          property :predefined_billing_address, as: 'predefinedBillingAddress'
          property :type, as: 'type'
        end
      end
      
      class TransitTable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :postal_code_group_names, as: 'postalCodeGroupNames'
          collection :rows, as: 'rows', class: Google::Apis::ContentV2::TransitTableTransitTimeRow, decorator: Google::Apis::ContentV2::TransitTableTransitTimeRow::Representation
      
          collection :transit_time_labels, as: 'transitTimeLabels'
        end
      end
      
      class TransitTableTransitTimeRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values', class: Google::Apis::ContentV2::TransitTableTransitTimeRowTransitTimeValue, decorator: Google::Apis::ContentV2::TransitTableTransitTimeRowTransitTimeValue::Representation
      
        end
      end
      
      class TransitTableTransitTimeRowTransitTimeValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_transit_time_in_days, as: 'maxTransitTimeInDays'
          property :min_transit_time_in_days, as: 'minTransitTimeInDays'
        end
      end
      
      class UnitInvoice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_charges, as: 'additionalCharges', class: Google::Apis::ContentV2::UnitInvoiceAdditionalCharge, decorator: Google::Apis::ContentV2::UnitInvoiceAdditionalCharge::Representation
      
          collection :promotions, as: 'promotions', class: Google::Apis::ContentV2::Promotion, decorator: Google::Apis::ContentV2::Promotion::Representation
      
          property :unit_price_pretax, as: 'unitPricePretax', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          collection :unit_price_taxes, as: 'unitPriceTaxes', class: Google::Apis::ContentV2::UnitInvoiceTaxLine, decorator: Google::Apis::ContentV2::UnitInvoiceTaxLine::Representation
      
        end
      end
      
      class UnitInvoiceAdditionalCharge
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :additional_charge_amount, as: 'additionalChargeAmount', class: Google::Apis::ContentV2::Amount, decorator: Google::Apis::ContentV2::Amount::Representation
      
          collection :additional_charge_promotions, as: 'additionalChargePromotions', class: Google::Apis::ContentV2::Promotion, decorator: Google::Apis::ContentV2::Promotion::Representation
      
          property :type, as: 'type'
        end
      end
      
      class UnitInvoiceTaxLine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :tax_amount, as: 'taxAmount', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :tax_name, as: 'taxName'
          property :tax_type, as: 'taxType'
        end
      end
      
      class Value
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :carrier_rate_name, as: 'carrierRateName'
          property :flat_rate, as: 'flatRate', class: Google::Apis::ContentV2::Price, decorator: Google::Apis::ContentV2::Price::Representation
      
          property :no_shipping, as: 'noShipping'
          property :price_percentage, as: 'pricePercentage'
          property :subtable_name, as: 'subtableName'
        end
      end
      
      class Weight
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, as: 'value'
        end
      end
    end
  end
end
