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
    module CivicinfoV2
      
      class AdministrationRegion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdministrativeBody
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Candidate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Channel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Contest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContextParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DivisionRepresentativeInfoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DivisionSearchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchDivisionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DivisionSearchResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Election
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ElectionOfficial
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ElectionsQueryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryElectionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ElectoralDistrict
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FieldMetadataProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GeographicDivision
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InternalFieldMetadataProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InternalSourceSummaryProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LivegraphBacktraceRecordInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LivegraphBacktraceRecordInfoExpInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessageSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Office
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Official
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PointProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PollingLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Provenance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepresentativeInfoData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepresentativeInfoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepresentativeInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SimpleAddressType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreetSegment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreetSegmentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoterInfoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoterInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoterInfoSegmentResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdministrationRegion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :election_administration_body, as: 'electionAdministrationBody', class: Google::Apis::CivicinfoV2::AdministrativeBody, decorator: Google::Apis::CivicinfoV2::AdministrativeBody::Representation
      
          property :id, as: 'id'
          property :local_jurisdiction, as: 'local_jurisdiction', class: Google::Apis::CivicinfoV2::AdministrationRegion, decorator: Google::Apis::CivicinfoV2::AdministrationRegion::Representation
      
          property :name, as: 'name'
          collection :sources, as: 'sources', class: Google::Apis::CivicinfoV2::Source, decorator: Google::Apis::CivicinfoV2::Source::Representation
      
        end
      end
      
      class AdministrativeBody
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :absentee_voting_info_url, as: 'absenteeVotingInfoUrl'
          collection :address_lines, as: 'addressLines'
          property :ballot_info_url, as: 'ballotInfoUrl'
          property :correspondence_address, as: 'correspondenceAddress', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          property :election_info_url, as: 'electionInfoUrl'
          collection :election_officials, as: 'electionOfficials', class: Google::Apis::CivicinfoV2::ElectionOfficial, decorator: Google::Apis::CivicinfoV2::ElectionOfficial::Representation
      
          property :election_registration_confirmation_url, as: 'electionRegistrationConfirmationUrl'
          property :election_registration_url, as: 'electionRegistrationUrl'
          property :election_rules_url, as: 'electionRulesUrl'
          property :hours_of_operation, as: 'hoursOfOperation'
          property :name, as: 'name'
          property :physical_address, as: 'physicalAddress', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          collection :voter_services, as: 'voter_services'
          property :voting_location_finder_url, as: 'votingLocationFinderUrl'
        end
      end
      
      class Candidate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :candidate_url, as: 'candidateUrl'
          collection :channels, as: 'channels', class: Google::Apis::CivicinfoV2::Channel, decorator: Google::Apis::CivicinfoV2::Channel::Representation
      
          property :email, as: 'email'
          property :name, as: 'name'
          property :order_on_ballot, :numeric_string => true, as: 'orderOnBallot'
          property :party, as: 'party'
          property :phone, as: 'phone'
          property :photo_url, as: 'photoUrl'
        end
      end
      
      class Channel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :type, as: 'type'
        end
      end
      
      class Contest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ballot_placement, :numeric_string => true, as: 'ballotPlacement'
          property :ballot_title, as: 'ballotTitle'
          collection :candidates, as: 'candidates', class: Google::Apis::CivicinfoV2::Candidate, decorator: Google::Apis::CivicinfoV2::Candidate::Representation
      
          property :district, as: 'district', class: Google::Apis::CivicinfoV2::ElectoralDistrict, decorator: Google::Apis::CivicinfoV2::ElectoralDistrict::Representation
      
          property :electorate_specifications, as: 'electorateSpecifications'
          property :id, as: 'id'
          collection :level, as: 'level'
          property :number_elected, :numeric_string => true, as: 'numberElected'
          property :number_voting_for, :numeric_string => true, as: 'numberVotingFor'
          property :office, as: 'office'
          property :primary_party, as: 'primaryParty'
          collection :referendum_ballot_responses, as: 'referendumBallotResponses'
          property :referendum_brief, as: 'referendumBrief'
          property :referendum_con_statement, as: 'referendumConStatement'
          property :referendum_effect_of_abstain, as: 'referendumEffectOfAbstain'
          property :referendum_passage_threshold, as: 'referendumPassageThreshold'
          property :referendum_pro_statement, as: 'referendumProStatement'
          property :referendum_subtitle, as: 'referendumSubtitle'
          property :referendum_text, as: 'referendumText'
          property :referendum_title, as: 'referendumTitle'
          property :referendum_url, as: 'referendumUrl'
          collection :roles, as: 'roles'
          collection :sources, as: 'sources', class: Google::Apis::CivicinfoV2::Source, decorator: Google::Apis::CivicinfoV2::Source::Representation
      
          property :special, as: 'special'
          property :type, as: 'type'
        end
      end
      
      class ContextParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_profile, as: 'clientProfile'
        end
      end
      
      class DivisionRepresentativeInfoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context_params, as: 'contextParams', class: Google::Apis::CivicinfoV2::ContextParams, decorator: Google::Apis::CivicinfoV2::ContextParams::Representation
      
        end
      end
      
      class DivisionSearchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context_params, as: 'contextParams', class: Google::Apis::CivicinfoV2::ContextParams, decorator: Google::Apis::CivicinfoV2::ContextParams::Representation
      
        end
      end
      
      class SearchDivisionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :results, as: 'results', class: Google::Apis::CivicinfoV2::DivisionSearchResult, decorator: Google::Apis::CivicinfoV2::DivisionSearchResult::Representation
      
        end
      end
      
      class DivisionSearchResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aliases, as: 'aliases'
          property :name, as: 'name'
          property :ocd_id, as: 'ocdId'
        end
      end
      
      class Election
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :election_day, as: 'electionDay'
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
          property :ocd_division_id, as: 'ocdDivisionId'
        end
      end
      
      class ElectionOfficial
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email_address, as: 'emailAddress'
          property :fax_number, as: 'faxNumber'
          property :name, as: 'name'
          property :office_phone_number, as: 'officePhoneNumber'
          property :title, as: 'title'
        end
      end
      
      class ElectionsQueryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context_params, as: 'contextParams', class: Google::Apis::CivicinfoV2::ContextParams, decorator: Google::Apis::CivicinfoV2::ContextParams::Representation
      
        end
      end
      
      class QueryElectionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :elections, as: 'elections', class: Google::Apis::CivicinfoV2::Election, decorator: Google::Apis::CivicinfoV2::Election::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ElectoralDistrict
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kg_foreign_key, as: 'kgForeignKey'
          property :name, as: 'name'
          property :scope, as: 'scope'
        end
      end
      
      class FieldMetadataProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :internal, as: 'internal', class: Google::Apis::CivicinfoV2::InternalFieldMetadataProto, decorator: Google::Apis::CivicinfoV2::InternalFieldMetadataProto::Representation
      
        end
      end
      
      class GeographicDivision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :also_known_as, as: 'alsoKnownAs'
          property :name, as: 'name'
          collection :office_indices, as: 'officeIndices'
        end
      end
      
      class InternalFieldMetadataProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_auto, as: 'isAuto'
          property :source_summary, as: 'sourceSummary', class: Google::Apis::CivicinfoV2::InternalSourceSummaryProto, decorator: Google::Apis::CivicinfoV2::InternalSourceSummaryProto::Representation
      
        end
      end
      
      class InternalSourceSummaryProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dataset, as: 'dataset'
          property :provider, as: 'provider'
        end
      end
      
      class LivegraphBacktraceRecordInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_source_publish_msec, :numeric_string => true, as: 'dataSourcePublishMsec'
          property :exp_id, as: 'expId'
          property :exp_info, as: 'expInfo', class: Google::Apis::CivicinfoV2::LivegraphBacktraceRecordInfoExpInfo, decorator: Google::Apis::CivicinfoV2::LivegraphBacktraceRecordInfoExpInfo::Representation
      
          property :is_recon, as: 'isRecon'
          property :is_wlm_throttled, as: 'isWlmThrottled'
          property :number_of_triples, :numeric_string => true, as: 'numberOfTriples'
          property :priority, as: 'priority'
          property :process, as: 'process'
          property :proxy_receive_msec, :numeric_string => true, as: 'proxyReceiveMsec'
          property :proxy_sent_msec, :numeric_string => true, as: 'proxySentMsec'
          property :record_id, as: 'recordId'
          property :should_monitor_latency, as: 'shouldMonitorLatency'
          property :subscriber_receive_msec, :numeric_string => true, as: 'subscriberReceiveMsec'
          property :topic_build_finish_msec, :numeric_string => true, as: 'topicBuildFinishMsec'
          property :topic_build_start_msec, :numeric_string => true, as: 'topicBuildStartMsec'
          property :version, as: 'version'
        end
      end
      
      class LivegraphBacktraceRecordInfoExpInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deleted_ins, as: 'deletedIns'
        end
      end
      
      class MessageSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :record_message_set_ext, as: 'recordMessageSetExt', class: Google::Apis::CivicinfoV2::LivegraphBacktraceRecordInfo, decorator: Google::Apis::CivicinfoV2::LivegraphBacktraceRecordInfo::Representation
      
        end
      end
      
      class Office
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :division_id, as: 'divisionId'
          collection :levels, as: 'levels'
          property :name, as: 'name'
          collection :official_indices, as: 'officialIndices'
          collection :roles, as: 'roles'
          collection :sources, as: 'sources', class: Google::Apis::CivicinfoV2::Source, decorator: Google::Apis::CivicinfoV2::Source::Representation
      
        end
      end
      
      class Official
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :address, as: 'address', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          collection :channels, as: 'channels', class: Google::Apis::CivicinfoV2::Channel, decorator: Google::Apis::CivicinfoV2::Channel::Representation
      
          collection :emails, as: 'emails'
          property :name, as: 'name'
          property :party, as: 'party'
          collection :phones, as: 'phones'
          property :photo_url, as: 'photoUrl'
          collection :urls, as: 'urls'
        end
      end
      
      class PointProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_e7, as: 'latE7'
          property :lng_e7, as: 'lngE7'
          property :metadata, as: 'metadata', class: Google::Apis::CivicinfoV2::FieldMetadataProto, decorator: Google::Apis::CivicinfoV2::FieldMetadataProto::Representation
      
          property :temporary_data, as: 'temporaryData', class: Google::Apis::CivicinfoV2::MessageSet, decorator: Google::Apis::CivicinfoV2::MessageSet::Representation
      
        end
      end
      
      class PollingLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          property :end_date, as: 'endDate'
          property :id, as: 'id'
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :polling_hours, as: 'pollingHours'
          collection :sources, as: 'sources', class: Google::Apis::CivicinfoV2::Source, decorator: Google::Apis::CivicinfoV2::Source::Representation
      
          property :start_date, as: 'startDate'
          property :voter_services, as: 'voterServices'
        end
      end
      
      class PostalAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :address_lines, as: 'addressLines'
          property :administrative_area_name, as: 'administrativeAreaName'
          property :country_name, as: 'countryName'
          property :country_name_code, as: 'countryNameCode'
          property :dependent_locality_name, as: 'dependentLocalityName'
          property :dependent_thoroughfare_name, as: 'dependentThoroughfareName'
          property :firm_name, as: 'firmName'
          property :is_disputed, as: 'isDisputed'
          property :language_code, as: 'languageCode'
          property :locality_name, as: 'localityName'
          property :post_box_number, as: 'postBoxNumber'
          property :postal_code_number, as: 'postalCodeNumber'
          property :postal_code_number_extension, as: 'postalCodeNumberExtension'
          property :premise_name, as: 'premiseName'
          property :recipient_name, as: 'recipientName'
          property :sorting_code, as: 'sortingCode'
          property :sub_administrative_area_name, as: 'subAdministrativeAreaName'
          property :sub_premise_name, as: 'subPremiseName'
          property :thoroughfare_name, as: 'thoroughfareName'
          property :thoroughfare_number, as: 'thoroughfareNumber'
        end
      end
      
      class Provenance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :collided_segment_source, as: 'collidedSegmentSource', class: Google::Apis::CivicinfoV2::StreetSegmentList, decorator: Google::Apis::CivicinfoV2::StreetSegmentList::Representation
      
          property :ctcl_contest_uuid, as: 'ctclContestUuid'
          property :ctcl_office_uuid, as: 'ctclOfficeUuid'
          property :dataset_id, :numeric_string => true, as: 'datasetId'
          property :precinct_id, :numeric_string => true, as: 'precinctId'
          property :precinct_split_id, :numeric_string => true, as: 'precinctSplitId'
          property :ts_street_segment_id, as: 'tsStreetSegmentId'
          property :vip5_precinct_id, as: 'vip5PrecinctId'
          property :vip5_street_segment_id, as: 'vip5StreetSegmentId'
          property :vip_street_segment_id, :numeric_string => true, as: 'vipStreetSegmentId'
        end
      end
      
      class RepresentativeInfoData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :divisions, as: 'divisions', class: Google::Apis::CivicinfoV2::GeographicDivision, decorator: Google::Apis::CivicinfoV2::GeographicDivision::Representation
      
          collection :offices, as: 'offices', class: Google::Apis::CivicinfoV2::Office, decorator: Google::Apis::CivicinfoV2::Office::Representation
      
          collection :officials, as: 'officials', class: Google::Apis::CivicinfoV2::Official, decorator: Google::Apis::CivicinfoV2::Official::Representation
      
        end
      end
      
      class RepresentativeInfoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context_params, as: 'contextParams', class: Google::Apis::CivicinfoV2::ContextParams, decorator: Google::Apis::CivicinfoV2::ContextParams::Representation
      
        end
      end
      
      class RepresentativeInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :divisions, as: 'divisions', class: Google::Apis::CivicinfoV2::GeographicDivision, decorator: Google::Apis::CivicinfoV2::GeographicDivision::Representation
      
          property :kind, as: 'kind'
          property :normalized_input, as: 'normalizedInput', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          collection :offices, as: 'offices', class: Google::Apis::CivicinfoV2::Office, decorator: Google::Apis::CivicinfoV2::Office::Representation
      
          collection :officials, as: 'officials', class: Google::Apis::CivicinfoV2::Official, decorator: Google::Apis::CivicinfoV2::Official::Representation
      
        end
      end
      
      class SimpleAddressType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :city, as: 'city'
          property :line1, as: 'line1'
          property :line2, as: 'line2'
          property :line3, as: 'line3'
          property :location_name, as: 'locationName'
          property :state, as: 'state'
          property :zip, as: 'zip'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :official, as: 'official'
        end
      end
      
      class StreetSegment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :administration_region_ids, as: 'administrationRegionIds'
          property :before_geocode_id, as: 'beforeGeocodeId'
          property :catalist_unique_precinct_code, as: 'catalistUniquePrecinctCode'
          property :city, as: 'city'
          property :city_council_district, as: 'cityCouncilDistrict'
          property :congressional_district, as: 'congressionalDistrict'
          collection :contest_ids, as: 'contestIds'
          property :county_council_district, as: 'countyCouncilDistrict'
          property :county_fips, as: 'countyFips'
          property :dataset_id, :numeric_string => true, as: 'datasetId'
          collection :early_vote_site_by_ids, as: 'earlyVoteSiteByIds'
          property :end_house_number, :numeric_string => true, as: 'endHouseNumber'
          property :geocoded_point, as: 'geocodedPoint', class: Google::Apis::CivicinfoV2::PointProto, decorator: Google::Apis::CivicinfoV2::PointProto::Representation
      
          collection :geographic_division_ocd_ids, as: 'geographicDivisionOcdIds'
          property :id, as: 'id'
          property :judicial_district, as: 'judicialDistrict'
          property :mail_only, as: 'mailOnly'
          property :municipal_district, as: 'municipalDistrict'
          property :ncoa_address, as: 'ncoaAddress'
          collection :odd_or_evens, as: 'oddOrEvens'
          property :original_id, as: 'originalId'
          collection :pollinglocation_by_ids, as: 'pollinglocationByIds'
          property :precinct_name, as: 'precinctName'
          property :precinct_ocd_id, as: 'precinctOcdId'
          collection :provenances, as: 'provenances', class: Google::Apis::CivicinfoV2::Provenance, decorator: Google::Apis::CivicinfoV2::Provenance::Representation
      
          property :published, as: 'published'
          property :school_district, as: 'schoolDistrict'
          property :start_house_number, :numeric_string => true, as: 'startHouseNumber'
          property :start_lat_e7, as: 'startLatE7'
          property :start_lng_e7, as: 'startLngE7'
          property :state, as: 'state'
          property :state_house_district, as: 'stateHouseDistrict'
          property :state_senate_district, as: 'stateSenateDistrict'
          property :street_name, as: 'streetName'
          property :sub_administrative_area_name, as: 'subAdministrativeAreaName'
          property :surrogate_id, :numeric_string => true, as: 'surrogateId'
          property :targetsmart_unique_precinct_code, as: 'targetsmartUniquePrecinctCode'
          property :township_district, as: 'townshipDistrict'
          property :unit_number, as: 'unitNumber'
          property :unit_type, as: 'unitType'
          property :van_precinct_code, as: 'vanPrecinctCode'
          collection :voter_geographic_division_ocd_ids, as: 'voterGeographicDivisionOcdIds'
          property :ward_district, as: 'wardDistrict'
          property :wildcard, as: 'wildcard'
          property :zip, as: 'zip'
        end
      end
      
      class StreetSegmentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :segments, as: 'segments', class: Google::Apis::CivicinfoV2::StreetSegment, decorator: Google::Apis::CivicinfoV2::StreetSegment::Representation
      
        end
      end
      
      class VoterInfoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context_params, as: 'contextParams', class: Google::Apis::CivicinfoV2::ContextParams, decorator: Google::Apis::CivicinfoV2::ContextParams::Representation
      
          property :voter_info_segment_result, as: 'voterInfoSegmentResult', class: Google::Apis::CivicinfoV2::VoterInfoSegmentResult, decorator: Google::Apis::CivicinfoV2::VoterInfoSegmentResult::Representation
      
        end
      end
      
      class VoterInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :contests, as: 'contests', class: Google::Apis::CivicinfoV2::Contest, decorator: Google::Apis::CivicinfoV2::Contest::Representation
      
          collection :drop_off_locations, as: 'dropOffLocations', class: Google::Apis::CivicinfoV2::PollingLocation, decorator: Google::Apis::CivicinfoV2::PollingLocation::Representation
      
          collection :early_vote_sites, as: 'earlyVoteSites', class: Google::Apis::CivicinfoV2::PollingLocation, decorator: Google::Apis::CivicinfoV2::PollingLocation::Representation
      
          property :election, as: 'election', class: Google::Apis::CivicinfoV2::Election, decorator: Google::Apis::CivicinfoV2::Election::Representation
      
          property :kind, as: 'kind'
          property :mail_only, as: 'mailOnly'
          property :normalized_input, as: 'normalizedInput', class: Google::Apis::CivicinfoV2::SimpleAddressType, decorator: Google::Apis::CivicinfoV2::SimpleAddressType::Representation
      
          collection :other_elections, as: 'otherElections', class: Google::Apis::CivicinfoV2::Election, decorator: Google::Apis::CivicinfoV2::Election::Representation
      
          collection :polling_locations, as: 'pollingLocations', class: Google::Apis::CivicinfoV2::PollingLocation, decorator: Google::Apis::CivicinfoV2::PollingLocation::Representation
      
          property :precinct_id, as: 'precinctId'
          collection :segments, as: 'segments', class: Google::Apis::CivicinfoV2::StreetSegment, decorator: Google::Apis::CivicinfoV2::StreetSegment::Representation
      
          collection :state, as: 'state', class: Google::Apis::CivicinfoV2::AdministrationRegion, decorator: Google::Apis::CivicinfoV2::AdministrationRegion::Representation
      
        end
      end
      
      class VoterInfoSegmentResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :generated_millis, :numeric_string => true, as: 'generatedMillis'
          property :postal_address, as: 'postalAddress', class: Google::Apis::CivicinfoV2::PostalAddress, decorator: Google::Apis::CivicinfoV2::PostalAddress::Representation
      
          property :request, as: 'request', class: Google::Apis::CivicinfoV2::VoterInfoRequest, decorator: Google::Apis::CivicinfoV2::VoterInfoRequest::Representation
      
          property :response, as: 'response', class: Google::Apis::CivicinfoV2::VoterInfoResponse, decorator: Google::Apis::CivicinfoV2::VoterInfoResponse::Representation
      
        end
      end
    end
  end
end
