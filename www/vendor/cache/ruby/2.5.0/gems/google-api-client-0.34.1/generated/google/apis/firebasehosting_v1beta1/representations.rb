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
    module FirebasehostingV1beta1
      
      class ActingUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CertDnsChallenge
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CertHttpChallenge
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudRunRewrite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Domain
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainProvisioning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainRedirect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Header
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDomainsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReleasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVersionFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PopulateVersionFilesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PopulateVersionFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PreviewConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Redirect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Release
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rewrite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VersionFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActingUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :image_url, as: 'imageUrl'
        end
      end
      
      class CertDnsChallenge
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_name, as: 'domainName'
          property :token, as: 'token'
        end
      end
      
      class CertHttpChallenge
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :path, as: 'path'
          property :token, as: 'token'
        end
      end
      
      class CloudRunRewrite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :region, as: 'region'
          property :service_id, as: 'serviceId'
        end
      end
      
      class Domain
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_name, as: 'domainName'
          property :domain_redirect, as: 'domainRedirect', class: Google::Apis::FirebasehostingV1beta1::DomainRedirect, decorator: Google::Apis::FirebasehostingV1beta1::DomainRedirect::Representation
      
          property :provisioning, as: 'provisioning', class: Google::Apis::FirebasehostingV1beta1::DomainProvisioning, decorator: Google::Apis::FirebasehostingV1beta1::DomainProvisioning::Representation
      
          property :site, as: 'site'
          property :status, as: 'status'
          property :update_time, as: 'updateTime'
        end
      end
      
      class DomainProvisioning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cert_challenge_discovered_txt, as: 'certChallengeDiscoveredTxt'
          property :cert_challenge_dns, as: 'certChallengeDns', class: Google::Apis::FirebasehostingV1beta1::CertDnsChallenge, decorator: Google::Apis::FirebasehostingV1beta1::CertDnsChallenge::Representation
      
          property :cert_challenge_http, as: 'certChallengeHttp', class: Google::Apis::FirebasehostingV1beta1::CertHttpChallenge, decorator: Google::Apis::FirebasehostingV1beta1::CertHttpChallenge::Representation
      
          property :cert_status, as: 'certStatus'
          collection :discovered_ips, as: 'discoveredIps'
          property :dns_fetch_time, as: 'dnsFetchTime'
          property :dns_status, as: 'dnsStatus'
          collection :expected_ips, as: 'expectedIps'
        end
      end
      
      class DomainRedirect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_name, as: 'domainName'
          property :type, as: 'type'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Header
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :glob, as: 'glob'
          hash :headers, as: 'headers'
          property :regex, as: 'regex'
        end
      end
      
      class ListDomainsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::FirebasehostingV1beta1::Domain, decorator: Google::Apis::FirebasehostingV1beta1::Domain::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListReleasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :releases, as: 'releases', class: Google::Apis::FirebasehostingV1beta1::Release, decorator: Google::Apis::FirebasehostingV1beta1::Release::Representation
      
        end
      end
      
      class ListVersionFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::FirebasehostingV1beta1::VersionFile, decorator: Google::Apis::FirebasehostingV1beta1::VersionFile::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class PopulateVersionFilesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :files, as: 'files'
        end
      end
      
      class PopulateVersionFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :upload_required_hashes, as: 'uploadRequiredHashes'
          property :upload_url, as: 'uploadUrl'
        end
      end
      
      class PreviewConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, as: 'active'
          property :expire_time, as: 'expireTime'
        end
      end
      
      class Redirect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :glob, as: 'glob'
          property :location, as: 'location'
          property :regex, as: 'regex'
          property :status_code, as: 'statusCode'
        end
      end
      
      class Release
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message'
          property :name, as: 'name'
          property :release_time, as: 'releaseTime'
          property :release_user, as: 'releaseUser', class: Google::Apis::FirebasehostingV1beta1::ActingUser, decorator: Google::Apis::FirebasehostingV1beta1::ActingUser::Representation
      
          property :type, as: 'type'
          property :version, as: 'version', class: Google::Apis::FirebasehostingV1beta1::Version, decorator: Google::Apis::FirebasehostingV1beta1::Version::Representation
      
        end
      end
      
      class Rewrite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dynamic_links, as: 'dynamicLinks'
          property :function, as: 'function'
          property :glob, as: 'glob'
          property :path, as: 'path'
          property :regex, as: 'regex'
          property :run, as: 'run', class: Google::Apis::FirebasehostingV1beta1::CloudRunRewrite, decorator: Google::Apis::FirebasehostingV1beta1::CloudRunRewrite::Representation
      
        end
      end
      
      class ServingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_association, as: 'appAssociation'
          property :clean_urls, as: 'cleanUrls'
          collection :headers, as: 'headers', class: Google::Apis::FirebasehostingV1beta1::Header, decorator: Google::Apis::FirebasehostingV1beta1::Header::Representation
      
          collection :redirects, as: 'redirects', class: Google::Apis::FirebasehostingV1beta1::Redirect, decorator: Google::Apis::FirebasehostingV1beta1::Redirect::Representation
      
          collection :rewrites, as: 'rewrites', class: Google::Apis::FirebasehostingV1beta1::Rewrite, decorator: Google::Apis::FirebasehostingV1beta1::Rewrite::Representation
      
          property :trailing_slash_behavior, as: 'trailingSlashBehavior'
        end
      end
      
      class SiteConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_versions, :numeric_string => true, as: 'maxVersions'
        end
      end
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::FirebasehostingV1beta1::ServingConfig, decorator: Google::Apis::FirebasehostingV1beta1::ServingConfig::Representation
      
          property :create_time, as: 'createTime'
          property :create_user, as: 'createUser', class: Google::Apis::FirebasehostingV1beta1::ActingUser, decorator: Google::Apis::FirebasehostingV1beta1::ActingUser::Representation
      
          property :delete_time, as: 'deleteTime'
          property :delete_user, as: 'deleteUser', class: Google::Apis::FirebasehostingV1beta1::ActingUser, decorator: Google::Apis::FirebasehostingV1beta1::ActingUser::Representation
      
          property :file_count, :numeric_string => true, as: 'fileCount'
          property :finalize_time, as: 'finalizeTime'
          property :finalize_user, as: 'finalizeUser', class: Google::Apis::FirebasehostingV1beta1::ActingUser, decorator: Google::Apis::FirebasehostingV1beta1::ActingUser::Representation
      
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :preview, as: 'preview', class: Google::Apis::FirebasehostingV1beta1::PreviewConfig, decorator: Google::Apis::FirebasehostingV1beta1::PreviewConfig::Representation
      
          property :status, as: 'status'
          property :version_bytes, :numeric_string => true, as: 'versionBytes'
        end
      end
      
      class VersionFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hash_prop, as: 'hash'
          property :path, as: 'path'
          property :status, as: 'status'
        end
      end
    end
  end
end
